// Initial version used on homehearth SaaS
// Jenkinsfile for CI, far from complete and needs tweaking, but outline should be close to OK
node {
    // Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Tests') {
            'unit': {
                sh "echo 'shell scripts to run unit tests. junit ...'"
                //checkout scm
                //javac ProcessBigTable.java
                //java ProcessBigTable
                //javac -cp /usr/share/java/junit4.jar tests/TestProcessBigTable.java
                // use junit ???
                //java tests/TestProcessBigTable
            },
        }
        stage ('Deploy') {
            when {
                expression {
                    currentBuild.result == null || currentBuild.result == 'SUCCESS' 
                }
            }
            sh "echo 'shell scripts to deploy to server...make publish'"
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}
