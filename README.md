# BrightStart: seven-page Java website

A fictional creative studio website built with JSP, Java servlets, and responsive CSS. All seven pages share navigation and a footer.

| Page | File | Content |
| --- | --- | --- |
| Home | index.jsp | Studio introduction, services, and highlights |
| About | about.jsp | Story, values, and process |
| Services | services.jsp | Six services and a project workflow |
| Work | work.jsp | Six fictional projects with category filters |
| Pricing | pricing.jsp | Three illustrative packages in INR |
| FAQ | faq.jsp | Eight expandable answers with keyword search |
| Contact | contact.jsp | Demo form with server-side validation |

Projects and prices are examples. The contact form validates input, then discards it; nothing is emailed or stored. hello@example.com is a placeholder address.

## Build and run

Use JDK 17, Maven, and Tomcat 9. From this folder:

```sh
mvn clean package
```

Copy target/brightstart.war to your Tomcat instance's webapps directory. Start Tomcat, then visit http://localhost:8080/brightstart/ (adjust the host and port for your installation).

Windows PowerShell example; replace the Tomcat path with your own:

```powershell
$tomcatPath = 'C:\tools\apache-tomcat-9'
Copy-Item -LiteralPath '.\target\brightstart.war' -Destination (Join-Path $tomcatPath 'webapps\brightstart.war')
& (Join-Path $tomcatPath 'bin\startup.bat')
```

If Tomcat is already running, avoid starting a second instance. Check Tomcat logs after deployment. The /brightstart/health endpoint should return OK.

## Project layout

```text
pom.xml                                      Maven WAR build
src/main/java/com/brightstart/                Health and contact Java code
src/main/webapp/*.jsp                         Seven public pages
src/main/webapp/style.css                     Shared website styles
src/main/webapp/pages.css                     Additional page components
src/main/webapp/app.js                        Navigation and contact interactions
src/main/webapp/site.js                       Portfolio filters and FAQ search
src/main/webapp/WEB-INF/fragments/            Shared header and footer
src/main/webapp/WEB-INF/web.xml               Servlet mappings
```

After editing, rebuild and redeploy the WAR. Open every page, try the mobile menu, filter projects, search FAQs, and submit valid and invalid demo contact details. JavaScript enhances navigation, filtering, and search; page content remains available without it. No Jenkinsfile is included.

## Java validation tests

`mvn clean package` also runs the JUnit tests in `src/test/java`. They cover missing fields, invalid emails, field length limits, trimming, service selection, and escaping user input. Run only the tests with `mvn test`. These unit tests do not compile JSP pages or prove Tomcat deployment; check the running site separately.

## Jenkins without a Jenkinsfile

A Jenkinsfile is used for a Pipeline job. You can use a **Freestyle project** and configure the build in Jenkins instead:

1. Create a Freestyle project and select Git under Source Code Management. Enter your project repository URL and branch (`*/main`). Configure credentials if your repository requires them.
2. Ensure the Jenkins build agent has JDK 17 and Maven on its PATH. Jenkins itself can run using the Java version required by your Jenkins release.
3. Add **Execute Windows batch command** on Windows, or **Execute shell** on Linux. Use `mvn -B clean verify`.
4. Add **Archive the artifacts** with `target/brightstart.war`.
5. Build the job, download its WAR artifact, and copy it into your Tomcat `webapps` folder. Check the Tomcat logs and open all pages.

If Jenkins already uses port 8080, change Tomcat's existing HTTP Connector port in `conf/server.xml` to 8081 and restart Tomcat. Then open http://localhost:8081/brightstart/.
