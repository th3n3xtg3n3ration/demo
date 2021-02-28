pipeline {

    agent any
    stages {
        stage ('Docker Build'){
            steps {
                sh "docker build -t th3n3xtg3n3ration/nginx-app ."
            }
        }
        stage("Docker Push"){
            steps{
                withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
                    sh "docker login -u th3n3xtg3n3ration -p ${docker_pass} "
                }
                sh "docker push th3n3xtg3n3ration/nginx-app"
            }
        }
        stage("Deploy to K8s"){
            steps{
                sh "kubectl apply -f resources/ns.yaml,resources/svc.yaml,resources/deployment.yaml"
            }
        }    
    }
}