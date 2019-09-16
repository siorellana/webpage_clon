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
                            sh "git remote remove origin"
                            sh "rm -rf .git"
                            echo "======= Add the new repository  ========="
                            sh "git init"
                            sh "git remote add origin https://${USER}:${PASS}@github.com/siorellana/webpage_clon.git"
                            echo "======= Obtener el origen desde GitLab  ========="
                            sh "git add ."
                            sh "git commit -am '${GIT_AUTHOR_NAME} -- ${GIT_COMMIT} :) '"
                            sh "git push -u origin master --force"
                            echo "==========================###############################==================="
                            echo "==========================###### Finishing process ######==================="
                            echo "==========================###############################==================="

                        }
                    }
                }
            }
        }
