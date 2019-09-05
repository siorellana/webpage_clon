pipeline {
    options {
        disableConcurrentBuilds()
    }
	agent {
	    node{
	        label 'master'
	    }
	}

	stages {
        
        stage ('Clonar a GitHub') {
            steps {
                        withCredentials([usernamePassword(
						credentialsId: 'GitHub', 
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
                            sh "git remote add origin https://${USER}:${PASS}@github.com/siorellana/test_clone.git"
                            echo "======= Obtener el origen desde GitLab  ========="
                            sh "git add ."
                            sh "git commit -am 'Commit from Jenkins'"
                            sh "git push -u origin master --force"
                            echo "==========================###############################==================="
                            echo "==========================###### Finishing process ######==================="
                            echo "==========================###############################==================="
                        }

            }
        }
    }
}
