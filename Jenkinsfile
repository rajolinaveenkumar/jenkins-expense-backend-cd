pipeline {
    agent {
        label 'agent-1-label'
    }

    environment {
        poroject = 'expense'
        component = 'backend'
        acc_id = '343430925817'
        region = 'us-east-1'
        env_name = ''
        app_version = ''
    }

    parameters {
        string(name: "image_version", defaultValue: "", description: "please eneter the image version")
        choice(name: 'env_name', choices: ['qa', 'dev', 'prod'], description: 'please select environment')
    }

    options {
        timeout(time: 40, unit: 'MINUTES')
        ansiColor('xtrem')
        disableConcurrentBuilds()        
    }

    stages {
        /* stage('appversion and environment') {
            steps {
                script {
                    app_version = params.image_version
                    env_name = params.env_name
                }
            }
        } */

        stage('Deploy') {
            steps {
                withAWS(region: 'us-east-1', credentials: 'aws-auth') {
                    sh """
                        aws eks update-kubeconfig --region $region --name expense-${environment}-eks
                        kubectl get nodes
                        echo "${params.image_version}"
                    """
                }
            }
        }
    }

    

    post {
        always{
            echo 'this will run always'
            deleteDir()
        }
        success{
            echo 'this will run on success'
        }
        failure{
            echo 'this will run at failure'
        }
    }

}