#!/bin/bash
#KroniK's Bash Template
#Version 1.0.2
#https://github.com/KroniK907/KroniKsBashTemplate
#Copyright (c) 2014 Daniel Kranich
#Licenced under MIT
#======================================================================#
#========================         Notes        ========================#
#======================================================================#


#======================================================================#
#========================   Default Functions  ========================#
#======================================================================#

#   ----------------------------------------------------------------
#                         Set Inital Variables
#   ----------------------------------------------------------------

#Set this to the location of the log.
LOG="/var/log/log.log"

#Set this to the location of the error log
ERRLOG="/var/log/err.log"

#Dont touch these
VBSE=false

#   ----------------------------------------------------------------
#    Function to display a verbose output when the -v option is set
#   
#   This function is basically pushed to echo, so all rules of echo
#   apply. 
#
#   This function accepts 2 arguments:
#   1) This is what you want to log/display to console. Make sure it
#      is in quotes. 
#   2) This is an alternate log location if you wish to push the 
#      above argument to a second log.
#
#   Example:
#         log "ls -la /home/" "/var/log/otherlog.log"
#   ----------------------------------------------------------------
log() {
  #local variables
  Date Text Log2
  
  Date=$(date "+%F %T")
  Text="$1"
  Log2="$2"
  if [[ ! -n "$D" ]]
    then
      echo "$Date: $Text" >> "$LOG"
    else
      echo "$Date: $Text" >> "$LOG"
		  echo "$Date: $Text" >> "$Log2"
	fi
	
  [ "$VBSE" == true ] && echo "$C"
}

#   ----------------------------------------------------------------
#          Function to log any errors and exit if fatal error
#
#   This function should only be called by the error_check function
#   found below. 
#
#   Accepts 2 arguments:
#   1) string containing descriptive error message
#   2) if second argument exists, then the error is fatal and the
#      script will exit.
#   ----------------------------------------------------------------
error_log() {
  #local variables
  Date Progname Fatal
  
  Date=$(date "+%F %T")
  #Name of last program run
  Progname=${0##*/}
  Fatal="$2"

  echo "$Date ${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
  echo "$Date ${PROGNAME}: ${1:-"Unknown Error"}" >> $ERRLOG

  if [[ -z "$Fatal" ]]
  then
    exit 1
  fi
}

#   ----------------------------------------------------------------
#       Function to check if the previous comand was completed
#       		      succesfully
#	 
#   This function can be followed by 2 arguments:
#   1) A discription of the error. If none exists it will list as an
#      "Unknown Error"
#   2) If a second argument is given, then the script will exit upon
#      loging the error. This argument can be literally any string
#      you wish (it only matters if a string exists) however for 
#      clarity I usually use "FATAL"
#
#   Example:
#         error_check "The previous command failed" "FATAL"
#   ----------------------------------------------------------------
error_check() {
	if [[ "$?" != "0" ]]
	then
    error_log "$1" "$2"
	fi
}

#   ----------------------------------------------------------------
#                  Function to print the help display
# 
#   This is called by the -h flag in getopts below
#   ----------------------------------------------------------------
help_text() {
  echo "Help Text Here"
  exit 1
}


#   ----------------------------------------------------------------
#                       Get any flags from the user
#
#   Accepts 3 arguments:
#   -v      toggles verbose output
#   -h      shows the user how to use this script
#   -x      toggles bash -x output for debugging
#
#   check man getopts for info on how to add more options/arguments.
#   There is also a good getopts guide here:
#   http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/
#   ----------------------------------------------------------------
while getopts :vhx opt
do
    case $opt in
    v) VBSE=true;;
    h) help_text;;
    x) set -x;;
    :)  echo "Missing Option Argument for -$OPTARG" >&2; exit 1;;
    *)  echo "Unknown Option: -$OPTARG" >&2; exit 1;;
    esac
done
error_check "getopts-failed" "FATAL"

#======================================================================#
#========================        Script        ========================#
#======================================================================#
main() {
  
}

main "$@"
exit
