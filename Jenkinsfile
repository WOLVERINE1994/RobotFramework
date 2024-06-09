pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/your-repo.git'
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run Robot Framework tests with pabot
                    bat '''
                    cd C:\\Users\\prate\\Downloads\\robot-browserstack-sdkLatest\\robot-browserstack-sdk\\tests\\UI
                    pabot -v ENVIRONMENT:web -i WEB .
                    '''
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'C:\\Users\\prate\\Downloads\\robot-browserstack-sdkLatest\\robot-browserstack-sdk\\tests\\UI\\output/**/*'
        }
    }
}
