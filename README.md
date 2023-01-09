# Cody's Deathmatch Server!
C-DM v1.0 — an open.mp server and gamemode for use with GTA SA and the SA-MP client, ready to be deployed out of the box. Written in Pawno, using the qawno text editor as provided by the open.mp team.


Installation Instructions:


Use Windows, I haven't figured out how to do this on Linux yet...

Download 'Unicode.dll' from this link, and drag it into the '../components' folder. I tried to get it to upload to GitHub, but it was too big.

Make a folder anywhere on your computer and drag all of this into it. Run omp-server.exe.


You can now open SA-MP and add "localhost:7777" to your favorites and connect to your own locally hosted deathmatch server.


Check out all the commands available with /help, or if you want, you can open up the '../gamemodes/test.pwn' to check out the script for yourself!


If you want to make changes to the script, or make your own game-mode:


Go to the '../qawno' folder and drop a file there with .pwn at the end.


The one included for the C-DM gamemode is called 'test.pwn' in that same '../qawno' folder.


Open up the '.pwn' file with 'qawno.exe' and start editing lines, making changes to your heart's content.


You can check the open.mp documentation, an archival of years worth of SA-MP pawn wiki functions among other things, for reference during your scripting.


Once you're done, Ctrl-S to save your '.pwn' file from 'qawno.exe' and then open up a Powershell, CMD.exe, or Windows Terminal with-in the '../qawno' directory.


Type '.\pawncc.exe "test.pwn"' or '.\pawncc.exe "yourPWNfileNameHere.pwn"' to compile your pawno script, which will output an '.amx' file with the same name as your '.pwn' file.


Drag your '.pwn' and compiled '.amx' file of the same name to the '../gamemodes' folder, and then go back to the main directory of the folder and edit your 'config.json' file.


Change the line that says "mode" under "game". Make it the name of your ".pwn" file. In this instance, C-DM uses the file name "test.amx" and "test.pwn" so the mode to start it would be "test".


Now, you should be able to save that 'config.json' file and launch 'omp-server.exe' to get your server up and running with the new or edited ".pwn" gamemode.
