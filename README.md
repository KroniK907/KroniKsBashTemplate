KroniK's Bash Template
=============
In my year or so of heavy bash scripting I have ended up developing a template which includes many of the features I always seem to need. I'll try to keep this up to date as I add or develop parts of this template.  

The features include:
- A log command which allows you to echo things to a log, as well as the console but only when -v is set.
- A pair of error handling functions which allow you to easily log errors and which commands caused them.
- Allows options and arguments to be passed to the bash script (read up on getopts to make more use of this)
- a -v which displays all the log outputs, see the first point above. 
- a -h flag and a function to display a help output.  
- a -x flag for bash -x output. Pretty usefull if you are debugging syntax issues. 
 
Documentation
============
I hate when things arent documented well, so I have set this script up with a very clear documentation on each of the functions so that anyone should be able to understand/modify without much effort. 

Contribution
============
Feel free to submit pull requests for features you would like to see added. 

Licence
============
Copyright (c) 2014 Daniel Kranich  
Licenced under MIT:https://github.com/KroniK907/BashTemplate/blob/master/LICENSE
