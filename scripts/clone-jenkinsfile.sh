#!/bin/bash -xe

#########################################################
############### VARIABLES ###############################

REPO_PATH='/root/clone-repo/Chile/'
UPDATE_LOG='updates.log'
TODAY=`date +"%d%b%Y"`
USER='jenkins'
PASS='Passw0rd'
USER2='nstrmnd'
PASS2='nest17'

#########################################################

#########################################################

echo 'Starting repository check status'
#cd $REPO_PATH
status=$(git remote -v | wc -l)

if [ "${status}" -gt '4' ]; then
    echo 'Clone repository is OK';

    git remote remove $TODAY;

    git remote add $TODAY https://$USER2:$PASS2@gitcorp.prod.cloud.ihf/Itau-latam-devops/Chile.git;

    git fetch $TODAY > $UPDATE_LOG 2>&1 &

    updates=$(cat $UPDATE_LOG | wc -l);

    if [ "${updates}" -ne '0' ]
    then
        git merge $TODAY/master;
        git push;
        git remote remove $TODAY
    else
        echo 'There are no changes in repository';
    fi ;
else 
    echo 'Repo are not configured yet... Configuring.';

    git remote remove old-origin;

    git remote rename origin old-origin;

    git remote add origin http://$USER:$PASS@10.181.168.128/root/itau-latam-devops-clon.git;

    git push -u origin --all;

    git push -u origin --tags;
fi 