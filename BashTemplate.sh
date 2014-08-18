#!/bin/bash

#======================================================================#
#========================         Notes        ========================#
#======================================================================#


#======================================================================#
#========================         Code         ========================#
#======================================================================#

#       ----------------------------------------------------------------
#                             Set Initial Variables
#       ----------------------------------------------------------------
#verbose mode
vrbse=false

#       ----------------------------------------------------------------
#        Function to display a verbose output when the -v option is set
#       ----------------------------------------------------------------
function debug {

        [ $vrbse == true ] && echo $1
}

#       ----------------------------------------------------------------
#                 Function for exit due to fatal program error
#
#       Accepts 1 argument:
#       string containing descriptive error message
#       ----------------------------------------------------------------
function error_exit {
        #Name of last program run
        PROGNAME=$(basename $0)

        echo "`date -I` ${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
        echo "`date -I` ${PROGNAME}: ${1:-"Unknown Error"}" >> /tmp/backup.error.log
        echo "`date "+%y-%m-%d %H:%M:%S"` FAILED 1" >> /tmp/backup.check
}

#       ----------------------------------------------------------------
#           Function to check if the previous command was completed
#           successfully.
#       ----------------------------------------------------------------
function error_check {
if [ "$?" != "0" ]
then
        error_exit ${1}
fi
}

#       ----------------------------------------------------------------
#                      Function to print the help display
#       ----------------------------------------------------------------
function help_text {
echo "Help Text Here"
exit 1
}

#       ----------------------------------------------------------------
#                           Get any flags from the user
#
#       Accepts these arguments:
#       -v      toggles verbose output
#       -h      shows the user how to use this script
#       ----------------------------------------------------------------
while getopts :hv opt
do
        case $opt in
        v) vrbse=true;;
        h) help_text;;
        \?) echo "Unknown Option: -$OPTARG" >&2; exit 1;;
        :)  echo "Missing Option Argument for -$OPTARG" >&2; exit 1;;
        *)  echo "Unimplemented Option: -$OPTARG" >&2; exit 1;;
        esac
done
error_check "getopts-failed"

#       ----------------------------------------------------------------
#                                    Script
#       ----------------------------------------------------------------

exit
