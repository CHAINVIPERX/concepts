def call(Map configMap){
    pipeline {
        agent {
            node{
                label 'AGENT-1'
            }
        }
        environment {
        packageVersion = ''
        
        // nexusURL= '44.223.74.228:8081'
        }
        options {
            timeout(time: 1, unit: 'HOURS')
            disableConcurrentBuilds() }
        
        parameters{
            booleanParam(name: 'Deploy',defaultValue: false , description: 'Do you want to Desploy this?')
        }
        

        stages {
            stage('Version') {
                steps {
                script {
                    def packageJson = readJSON file : "${configMap.component}/package.json"
                    packageVersion = packageJson.version
                    echo "application version : $packageVersion"
                }
                }
            }
            stage('Install Dependencies'){
                steps{
                    sh """
                    cd ${configMap.component}/
                    npm install
                    """
                }
            }

            stage('Unit Tests'){
                steps{
                    sh """
                echo "Unit Tests will run here"
                    """
                }
            }

            stage('SonarQube Scanning'){
                steps{
                    sh """
                    cd ${configMap.component}/
                    #sonar-scanner
                    echo "sonar scan will run here"
                    """
                }
            }

            stage('Zipping'){
                steps{
                    sh """
                    cd ${configMap.component}/
                    zip -q -r "${configMap.component}".zip ./* -x ".git" -x "*.zip"
                    ls -ltr
                    pwd
                    """
                }
            }
            stage('Publish Artifacts') {
                steps{ 
                    script {
                        //  def filePath = "${PWD}/workspace/APPS/${configMap.component}/${configMap.component}/${configMap.component}.zip"

                        def filePath = "catalogue/${configMap.component}.zip"
                        echo "${filePath}"

                        nexusArtifactUploader(
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            nexusUrl: pipelineGlobals.nexusURL(),
                            groupId:'com.roboshop',
                            version: "${packageVersion}",
                            repository: "${configMap.component}",
                            credentialsId:'nexus-auth',
                            artifacts: [
                                [
                                    artifactId: "${configMap.component}" ,
                                    classifier: '',
                                    file: "${filePath}",
                                    type:'zip'
                                ]
                            ]
                    )
                }
            }
        }
        stage('Deploy'){
            when{
                expression{
                    params.Deploy == 'true'
                }
            }
                steps{
                    script{
                            def params = [ 
                                string(name:'Version',value:"${packageVersion}"),
                                string(name:'Environment',value:"dev") 
                                ] 
                                build job:  "../${configMap.component}-deploy" , wait:  true , parameters:params
                    }
                }
            }
        }
        post {
            always {
                echo "Pipeline execution completed"
                deleteDir()
            }
            failure {
                echo "Pipeline Failed"
            }
            success{
                echo "Pipeline Success"
            }
        }
    }
}