#!/bin/bash

#########################################################
############### VARIABLES ###############################

REPO_PATH='/var/jenkins_home/clone-repo/Chile/'
UPDATE_LOG='/var/jenkins_home/clone-repo/updates.log'
TODAY=`date +"%d%b%Y"`

#########################################################

echo 'Starting repository check status'
cd $REPO_PATH
status=$(git remote -v | wc -l)

if [ $status -eq 4 ] ############### CHECK REPO STATUS #######################
then
	echo 'Clone repository is OK';

	git fetch old-origin 2> $UPDATE_LOG

	updates=$(cat $UPDATE_LOG | wc -l);
	if [ $updates -ne 0 ] ############### CHECK FOR CHANGES #######################
	then
		git merge old-origin/master;
		git push;
	else
	        echo 'There are no changes in repository';
	fi
else
	echo 'Problems with the clone repo configuration, Please call to Delivery Support'
fi