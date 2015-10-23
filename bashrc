
###############################
# hongbo's alias and function #
###############################

# alias

alias tsinghualn1='ssh -l youxq 166.111.143.19'
alias tsinghualn0='ssh -l youxq 166.111.143.18'
alias tsinghuaMD1='ssh -l youxq1 166.111.143.19'
alias ll='ls --color -l'
alias grep='grep --color=auto'
alias hbremovereturn="sed -i 's/\r//g' "
alias hbshut='sudo shutdown -P now'
alias hbhdspace="du -h --max-depth=1 ~/WORK/hongbo/"
alias qstatall='qstat -u "*"'
. ~/bin/jump.sh
. ~/bin/g.sh
# PS1

#PS1='\w \n${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[01;34m\] :> \[\033[01;32m\]'
PS1='\[\033[1;30m\]\w \n${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[01;34m\] :> \[\033[0m\]'
#PS1="\[\033[01;34m\]┌─[\[\033[01;35m\]\u@\h:\[\033[01;30m\]\w\[\033[01;34m\]]\n\[\033[01;34m\]└─>\[\033[0m\]"

# functions

 hbremovecore(){ 
  echo " Be Caution !!!"
  echo " input 'YES' to continue, or type anything else to leave "
  read answer
  if [ $answer = "YES" ]
  then
  find ~/WORK/hongbo/ -name core.* > ~/WORK/hongbo/corepath.txt
  echo "All the core.* files has been found"
  sed 's/.[0-9]*$//g' ~/WORK/hongbo/corepath.txt  > ~/WORK/hongbo/corepath2.txt
  touch `cat ~/WORK/hongbo/corepath2.txt`
  echo "Empty files have been created in the path of core.* files"
  rm `cat ~/WORK/hongbo/corepath.txt`
  echo "All the core.* files has been removed"
  rm ~/WORK/hongbo/corepath.txt
  rm ~/WORK/hongbo/corepath2.txt
  echo "Finished."
  else
  echo "Leaving"
  fi
  }


 hbsubjob(){
	 workdir=$(pwd)
	 echo "current working directory is $workdir"
	 find $workdir -name job* > $workdir/thejob.txt
	 echo "All the job files in $workdir has been found"
	 cat $workdir/thejob.txt
	 echo "Are the jobs right? Input 'YES' to submit or anything else to leave."
	 read CONorEXIT                                
	 if [ $CONorEXIT = "YES" ]
	 then
		wc -l $workdir/thejob.txt > $workdir/thejobline.txt
		countjob=`sed -n '1p' $workdir/thejobline.txt | awk '{print $1}' `
		echo "There are $countjob jobs to be submitted."
		for numjob in $(cat $workdir/thejob.txt)
		do   
			echo $numjob
			pathjob=$(dirname  "$numjob")
			cd $pathjob
				echo "Entering $pathjob."
			bsub < $(basename "$numjob")
			cd $workdir
		done
		echo "All the jobs have been submitted"
		echo "Finished."
	else
		echo "LEAVING"
	fi   
	}


    hbgithelp(){
    echo go to @local/sparrow
    echo and there is repository SPARROW at remote
    echo "> ssh -T git@github.com"
    echo "> git init"
    echo "> git remote add origin git@github.com:hongbozhang85/SPARROW.git"
    echo "> // git remote add origin https://github.com/hongbozhang85/SPARROW.git"
    echo "> git add filename"
    echo "> // git add ."
    echo "> // git add sub-direcotry/files"
    echo "> git commit -m 'description of all the added files'"
    echo "> // git config branch.master.remote origin"
    echo "> // git config branch.master.merge refs/heads/master"
    echo "> // git pull"
    echo "> git push"
    echo "> git rm --cache files"
    echo "> git push origin master"
    }


    welcome(){
    if [ $# -eq 0 ]
    then
    echo -e "${YELLOW}" "======================================";
    echo -e "${LIGHTRED}"    "     Hi! $USER, What a SB you are     ";
    echo -e "${YELLOW}" "======================================";
    echo ; ddate
    echo -e "${WHITE}";   cal
    echo ; fortune
    echo -e "${NC}"
    fi
    if [ $1 = '1' ]
    then
    echo -e "${CYAN}" "======================================";
    echo -e "${BLUE}"    "    Hi! $USER, Believe in Yourself    ";
    echo -e "${CYAN}" "======================================";
    echo -e "${CYAN}" ; date
    #echo -e "${YELLOW}";   ccal -u;
    #echo -e "${YELLOW}"; fortune
    echo -e "${NC}"  '       '
    fi
    }
    welcome 1



