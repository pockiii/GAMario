README.txt

I verify that I am the sole author of the programs contained in this
folder, except where explicitly stated to the contrary
Stefan Richard Chao
9.4.2019

CONTENTS OF THIS FILE
---------------------
   
 * Introduction
 * Installation
 * Configuration
 * Required Modules
 * Bugs

Introduction
---------------------
The following file represents my final year project. Please note this project is only compatible with Windows.
I have provided 2 files in my submission file which are described below.

6CCS3PRJ contains all the code I have written. In it will be 5 files: draw.lua, genetic_alg.lua, param.lua run.lua and smw-snes9x.lua. 
All of these files, with the exception of smw-snes9x.lua, are written by me from the ground up. smw-snes9x.lua is a file taken from
the the smw-tas script and adapted to fit the needs of my algorithm. Most of the code I have modified or changed has been marked with 
!important (as a comment). I have also added some functions to be used externally which are returned with the yeet variable in the 
file.

Snes9x-1.51 is the emulator that is needed to run the project, since this is an older version that I could not find online, I have 
provided it as well, free of charge.


Installation
---------------------
1. Unzip the provided files and place on desktop (or in desired location).
2. Download the smw-tas script version 0.10.0 from https://github.com/rodamaral/smw-tas/releases
	**The obtained file should be called smw-tas-0.10.0
3. Open both 6CCS3PRJ and smw-tas-0.10.0
	a. Copy draw.lua, genetic_alg.lua, param.lua and run.lua from 6CCS3PRJ into the root folder of Snes9x-1.51
	b. Navigate to smw-tas-0.10.0/src and delete the smw-snes9x.lua file inside
	c. Copy smw-snes9x.lua from 6CCS3PRJ  into smw-tas-0.10.0/src
4. Make sure a file of Super Mario World is located in Snes9x/Roms (the file should be called Super Mario World (U) [!].smc)
	**If there is no file or the file is lost, another copy can be obtained from:
	  https://github.com/raaka1/MARI-O-NEAT/blob/master/Mario_rom/Super%20Mario%20World%20(U)%20%5B!%5D.smc


Running
---------------------
1. Open snes9x-1.51 and run snes9x.exe 
2. To run Super Mario World, go to File > Open ROM.. and navigate to the game file in Snes9x/Roms and select it
3. Once the game is running, navigate Mario to the first level
4. Open smw-tas-0.10.0 and navigate Mario to the first level
	**The B button is bound to 'z', if it is not, refer to the configuration section below
	a. Once the game is loaded press z once to bring up the save slots
	b. Press z again to load the first save slot (MARIO A)
	c. Press z again to select single player mode (1 PLAYER GAME)
	**Depending on whether this is the first time loading the game, a cutscene will play. If so, wait for it to conclude
	d. Once Mario is standing on the map, he will be able to move left and right.
	c. Move Mario to the rightmost circle and press z (the map should say YOSHI'S ISLAND 2 when Mario is standing on the right)
5. Once Mario is in the level, open smw-tas-10-0 and drag run.lua onto the window
	**Mario will be loaded into the level after the game says "GAME START!"
	**At this point, Mario should automatically start moving autonomously
6. Use left and right buttons on the controller to either flag a run as positive or negative
	**The left and right buttons are bound to 'e' and 'r' respectively, if it is not, refer to the configuration section below


Configuration
---------------------
Controls can be configured in the emulator by going to Config > Controls > Configure Controls ...
Keybinds have been assumed in the section above, but feel free to change them.
The B button on the controller is used to select and navigate through the menus in the game. 
The left and right buttons on the controller are used with the interactive portion of the algorithm.

To configure the parameters for the algorithm, open param.lua in a text editor.


Bugs
---------------------
Known bugs are as follows:
When the emulator is closed while running the algorithm, an error message will appear. This is only closable by force quitting it from
task manager

Required Modules
---------------------
The smw-tas utility script can be found below. This project will only run with version 0.10.0.
https://github.com/rodamaral/smw-tas/releases

If the game file is lost or corrupted, please find a new version below.
https://github.com/raaka1/MARI-O-NEAT/blob/master/Mario_rom/Super%20Mario%20World%20(U)%20%5B!%5D.smc
Alternatively, many versions exist online, if downloaded online, make sure the file is called Super Mario World (U) [!].smc.

Because I could not find the version of snes9x that I am using, I have included it in the zip. If something is wrong
with the file provided, you can attempt to find it online. The version I am using with this project is 1.51.
http://www.snes9x.com/downloads.php