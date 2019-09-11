pipeline {
    options {
        disableConcurrentBuilds()
    }
	agent {
	    node{
	        label 'master'
	    }
	}
    triggers { 
        pollSCM('H/5 * * * *') 
    }
	stages {
        stage ('Clonar a GitHub') {
            steps {
                    withCredentials([usernamePassword(
                    credentialsId: 'siorellana-gh', 
                    usernameVariable: 'USER', 
                    passwordVariable: 'PASS')]){

                            echo "==========================###############################==================="
                            echo "==========================###### Starting process #######==================="
                            echo "==========================###############################==================="
                            echo "======= Get source from GitLab  ========="
                            sh "git remote -v"
                            echo "======= Delete Gitlab as source  ========="
                            echo "======= Add the new repository  ========="
                            sh "git push --mirror https://${USER}:${PASS}@github.com/siorellana/test_clone.git"
                            echo "======= Obtener el origen desde GitLab  ========="
                            echo "==========================###############################==================="
                            echo "==========================###### Finishing process ######==================="
                            echo "==========================###############################==================="

                        }
                    }
                }
            }
        }
