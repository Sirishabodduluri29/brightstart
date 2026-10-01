pipeline {
    agent any
    tools {
        maven 'Maven'
        jdk 'JDK17'
    }
    options {
        disableConcurrentBuilds()
        skipDefaultCheckout(true)
    }
    parameters {
        booleanParam(name: 'DEPLOY_TO_TOMCAT', defaultValue: false,
                     description: 'Copy the WAR to Tomcat on this Jenkins agent.')
        string(name: 'TOMCAT_BASE', defaultValue: '',
               description: 'Absolute Tomcat instance folder containing webapps, e.g. C:/tools/apache-tomcat-9 or /opt/tomcat9')
    }
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Maven Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'mvn -B clean verify'
                    } else {
                        bat 'mvn -B clean verify'
                    }
                }
            }
        }
        stage('Save WAR') {
            steps {
                archiveArtifacts artifacts: 'target/brightstart.war', fingerprint: true
            }
        }
        stage('Deploy to Tomcat') {
            when { expression { params.DEPLOY_TO_TOMCAT } }
            steps {
                script {
                    if (!params.TOMCAT_BASE.trim()) {
                        error('Set TOMCAT_BASE to the Tomcat instance folder before deploying.')
                    }
                    withEnv(["DEPLOY_TOMCAT_BASE=${params.TOMCAT_BASE.trim()}"]) {
                        if (isUnix()) {
                            sh '''
                                set -eu
                                case "$DEPLOY_TOMCAT_BASE" in
                                    /*) ;;
                                    *) echo "TOMCAT_BASE must be an absolute path"; exit 1 ;;
                                esac
                                test -f "$DEPLOY_TOMCAT_BASE/conf/server.xml"
                                test -d "$DEPLOY_TOMCAT_BASE/webapps"
                                cp target/brightstart.war "$DEPLOY_TOMCAT_BASE/webapps/brightstart.war"
                            '''
                        } else {
                            powershell '''
                                $ErrorActionPreference = 'Stop'
                                if (![System.IO.Path]::IsPathRooted($env:DEPLOY_TOMCAT_BASE)) {
                                    throw 'TOMCAT_BASE must be an absolute path'
                                }
                                $config = Join-Path $env:DEPLOY_TOMCAT_BASE 'conf/server.xml'
                                $webapps = Join-Path $env:DEPLOY_TOMCAT_BASE 'webapps'
                                if (!(Test-Path -LiteralPath $config -PathType Leaf) -or !(Test-Path -LiteralPath $webapps -PathType Container)) {
                                    throw 'TOMCAT_BASE must contain conf/server.xml and webapps'
                                }
                                Copy-Item -LiteralPath 'target/brightstart.war' -Destination (Join-Path $webapps 'brightstart.war') -Force
                            '''
                        }
                    }
                    echo 'WAR copied. Check Tomcat logs and /brightstart/health to confirm deployment.'
                }
            }
        }
    }
}
