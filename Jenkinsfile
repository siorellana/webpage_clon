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
        stage ('Clonar desde Gitlab') {
            steps {
                    withCredentials([usernamePassword(
                    credentialsId: 'siorellana-gl', 
                    usernameVariable: 'USER', 
                    passwordVariable: 'PASS')]){

                            echo "=========================###############################=================="
                            echo "=========================###### Starting process #######=================="
                            echo "=========================###############################=================="
                            echo "======= Get source from GitLab  ========="
                            sh "git clone --mirror https://gitlab.com/siorellana/siorellana.git"
                            echo "======= Mirror to the new repository  ========="
                            sh "cd siorellana/"
                            echo "=========================###############################================="
                            echo "=========================###### Finishing process ######=================="
                            echo "=========================###############################=================="

                        }
                    }
            steps {
                    withCredentials([usernamePassword(
                    credentialsId: 'siorellana-gh', 
                    usernameVariable: 'USER', 
                    passwordVariable: 'PASS')]){

                            echo "=========================###############################=================="
                            echo "=========================###### Starting process #######=================="
                            echo "=========================###############################=================="
                            echo "======= Get source from GitLab  ========="
                            sh "git remote -v"
                            echo "======= Mirror to the new repository  ========="
                            sh "git remote set-url --push origin https://${USER}:${PASS}@github.com/siorellana/test_clone.git"
                            sh "git checkout -b jenkins"
                            sh "git push --mirror"
                            echo "=========================###############################================="
                            echo "=========================###### Finishing process ######=================="
                            echo "=========================###############################=================="

                        }
                    }
                }
            }
        }




