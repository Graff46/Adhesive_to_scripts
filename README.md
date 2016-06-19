# Adhesive_to_scripts
Program compiler for most languages words;
Cross-platform application;
Represents the program which associates the file of a script with the interpreter. Program runtimes (win32) the file is result of *.exe.

This application create in IDE Lazarus, uses FreePascal compiler as the compiler of output files. Can collect (compile) executable files for a majority of interpretive languages (Lua, Ruby, Pyton, Perl ...).

This program isn't the pure compiler it creates the executed files which don't carry out a script code! The compiled application associates a script with the interpreter that brings the nuances in use of this program.

This program starts interpreters without command windows (especially actually for Lua).

Use of the program:

You shall you awake in a dialog with file system to specify to the program the file of the interpreter, to enter a command for the interpreter or to select file, in the latter case the absolute path to the file will be a command, select file of an icon for future application. It is also possible to select working folder where the ready program will be copied, and you can set name to future program.

Nuances:

The working folder of the application (an example win cmd -> cd C:\workfolder\) is the folder where in which there is an executed file. The ready executable file shall is en route file system to see necessary libraries and other external resources, most likely in one with them to the folder.

If you haven't specified folder of the program or in her there is no file, then look for the file in a [root folder]\FPC\ .

Meanwhile at me is the collected application for win32 which you can download. You can compile this application from source codes in any platform the supported FreePascal and Lazarus.

I can't but tell that this application it is possible to splice any programs for start with paremeters.

Graff46
