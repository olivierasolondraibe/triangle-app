pipeline{
    agent any
    stages{
        stage('git checkout'){
            steps{
                git credentialsId: 'git_credentials', url: 'https://github.com/olivierasolondraibe/triangle-app.git'
            }
        }
        stage('Build application'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('Unit Test Execution'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Build the docker image'){
            steps{
                sh 'docker build -t olivierasolondraibe/triangle-app .'
            }
        }
        stage('Deploy the docker image'){
            steps{
                withCredentials([string(credentialsId: 'dockerhubpass', variable: 'dockerHubPass')]) 
                {
                    sh "docker login -u olivierasolondraibe -p $dockerHubPass"
                }
                sh 'docker push olivierasolondraibe/triangle-app'
            }
        }
    }
}
