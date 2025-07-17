pipeline {
    agent {
        label 'agent-2-label'
    }

    environment {
        poroject = 'expense'
        environmet = 'dev'
        component = 'backend'
        app_version = ''
        acc_id = 343430925817
    }

    parameters {
        booleanParam(name: 'deploy', defaultValue: false, description: 'Select to deploy or not')
    }

    options {
        timeout(time: 40, unit: 'MINUTES')
        ansiColor('xtrem')
        disableConcurrentBuilds()        
    }

    stages {

        stage('Read app version') {
            steps {
                script {
                    def packageJson = readJOSON file: 'scripts/package.json'
                    app_version = packageJson.version
                    echo "app Version: ${app_version}"
                }

            }
        }
    }
}