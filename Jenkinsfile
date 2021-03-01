pipeline {

    agent any
    stages {
        stage ('Docker Build'){
            steps {
                sh "docker build -t thenextgeneration/nginx-app ."
            }
        }
        stage("Docker Push"){
            steps{
                withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
                    sh "docker login -u thenextgeneration -p ${docker_pass} "
                }
                sh "docker push thenextgeneration/nginx-app"
            }
        }
        stage("Deploy to K8s"){
            steps{
                sh "/usr/local/bin/kubectl apply -f resources/ns.yaml,resources/svc.yaml,resources/deployment.yaml"
            }
        }    
    }
}
