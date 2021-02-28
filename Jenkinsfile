pipeline {

    agnet any
    stages {
        stage ('Docker Build'){
            steps {
                sh "docker build -t ahmedatefosman/nginx-app ."
            }
        }
        stage("Docker Push"){
            steps{
                withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
                    sh "docker login -u ahmedatefosman -p ${docker_pass} "
                }
                sh "docker push ahmedatefosman/nginx-app"
            }
        }
        stage("Deploy to K8s"){
            steps{
                sh "kubectl apply -f resources/ns.yaml,resources/svc.yaml,resources/deployment.yaml"
            }
        }    
    }
}