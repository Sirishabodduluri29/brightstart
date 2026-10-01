# BrightStart: Maven + Tomcat 9 + Jenkins

A simple Java web project for learning deployment. It has three responsive JSP pages: **Home**, **About**, and **Contact**, plus a Java health-check servlet. The contact page uses a placeholder email link; it does not send or store messages.

```text
Source code -> Maven build -> brightstart.war -> Tomcat 9
                   Jenkins can automate these steps
```

## 1. Requirements

- JDK 17 for building and running this application. Jenkins itself may require a newer Java version depending on its release; configure JDK 17 on its build agent for this project.
- Apache Maven 3.6.3 or newer.
- Apache Tomcat 9 running with Java 17.
- Jenkins with Pipeline and Git plugins for the automation step.

Check your build tools:

```sh
java -version
mvn -version
```

Make sure Maven reports Java 17. The first build needs internet access to download dependencies.

## 2. Build with Maven

Open a terminal in the folder containing `pom.xml`:

```sh
mvn clean package
```

Result: **`target/brightstart.war`**. Tomcat supplies the Servlet API at runtime, so that dependency is not bundled in the WAR.

## 3. Deploy manually to Tomcat 9

Copy `target/brightstart.war` into your Tomcat instance's `webapps` folder.

Example in Windows PowerShell (replace the path with yours):

```powershell
$tomcatPath = 'C:\tools\apache-tomcat-9'
Copy-Item -LiteralPath '.\target\brightstart.war' -Destination (Join-Path $tomcatPath 'webapps\brightstart.war')
& (Join-Path $tomcatPath 'bin\startup.bat')
```

If Tomcat is already running, do not start a second instance. With automatic deployment enabled, it will pick up the WAR. Check its `logs` folder if the application does not appear.

On Linux:

```sh
cp target/brightstart.war /opt/tomcat9/webapps/
/opt/tomcat9/bin/startup.sh
```

Replace `/opt/tomcat9` with your instance path. If Tomcat runs as a service, start it through that service instead.

For Tomcat on port 8080, open:

| Page | URL |
| --- | --- |
| Home | http://localhost:8080/brightstart/ |
| About | http://localhost:8080/brightstart/about.jsp |
| Contact | http://localhost:8080/brightstart/contact.jsp |
| Java health endpoint | http://localhost:8080/brightstart/health |

The health endpoint should display `OK`. Use your server's hostname instead of `localhost` to access a remote server.

### Jenkins and Tomcat on the same machine

If Jenkins is using 8080, change Tomcat's HTTP Connector port in `conf/server.xml` to **8081**, then restart Tomcat:

```xml
<Connector port="8081" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" />
```

Edit the existing HTTP Connector, preserving its other attributes; do not add a second one. The website URL becomes **http://localhost:8081/brightstart/**.

## 4. Build using Jenkins

1. Put this project in a Git repository that Jenkins can access.
2. In **Manage Jenkins -> Tools**, configure Maven with the name **`Maven`** and a JDK 17 installation with the name **`JDK17`**. These names match `Jenkinsfile`.
3. Create a **Pipeline** job.
4. Choose **Pipeline script from SCM**, select **Git**, and enter your repository URL, credentials if needed, and branch.
5. Set **Script Path** to `Jenkinsfile` and save.
6. Click **Build Now**. Jenkins checks out the code, runs `mvn -B clean verify`, and saves `target/brightstart.war` as an artifact. There are currently no automated Java tests; this stage compiles and packages the project.
7. Download the WAR from the build's artifacts and deploy it to Tomcat using the steps above.

## 5. Enable Jenkins deployment to local Tomcat

The pipeline can copy the WAR to Tomcat when **Tomcat and the selected Jenkins build agent are on the same machine**.

After the first build, select **Build with Parameters**:

- Check **`DEPLOY_TO_TOMCAT`**.
- Set **`TOMCAT_BASE`** to the absolute instance folder containing `conf/server.xml` and `webapps`, e.g. `C:/tools/apache-tomcat-9` or `/opt/tomcat9`.
- The Jenkins agent account needs write permission to `webapps`. If you have multiple agents, assign this job to the agent with that Tomcat installation.
- Start Tomcat with automatic deployment enabled, or restart it after copying the WAR.

This step replaces this project's `brightstart.war`. A successful copy does not prove the application started: open the three pages and `/brightstart/health`, and check Tomcat's logs. For Tomcat on another machine, download the Jenkins artifact and copy it to that server manually; this pipeline's deployment stage only copies locally.

## Files

```text
pom.xml                                           Maven WAR build
Jenkinsfile                                       Build, archive, optional local deploy
src/main/java/com/brightstart/HealthServlet.java    Java health endpoint
src/main/webapp/index.jsp                          Home
src/main/webapp/about.jsp                          About
src/main/webapp/contact.jsp                        Contact
src/main/webapp/style.css                          Shared styling
src/main/webapp/WEB-INF/web.xml                     Tomcat 9 servlet configuration
```

Edit the pages or CSS and rebuild using `mvn clean package`. Replace `hello@example.com` in the contact page with your email address.

Official references: [Maven WAR packaging](https://maven.apache.org/plugins/maven-war-plugin/usage.html), [Tomcat deployment](https://tomcat.apache.org/tomcat-9.0-doc/deployer-howto.html), [Tomcat 9 Servlet API](https://tomcat.apache.org/tomcat-9.0-doc/servletapi/index.html), [Jenkins Pipeline syntax](https://www.jenkins.io/doc/book/pipeline/syntax/).
