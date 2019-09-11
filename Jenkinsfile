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
                            sh "rm -rf siorellana*"
                            sh "git clone --mirror https://${USER}:${PASS}@gitlab.com/siorellana/siorellana.git"
                            echo "======= Mirror to the new repository  ========="
                            sh "ls -l"
                            sh "cd ./siorellana.git/"
                            echo "=========================###############################================="
                            echo "=========================###### Finishing process ######=================="
                            echo "=========================###############################=================="

                        }
                    }
            
                }

            stage ('Clonar a Github') {
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
                            sh "git checkout jenkins"
                            sh "git push --mirror"
                            echo "=========================###############################================="
                            echo "=========================###### Finishing process ######=================="
                            echo "=========================###############################=================="

                        }
                    }
                }
            }
        }