# gameboy-j-card

A generator script to create custom GameBoy, GameBoy Color and GameBoy Advance J-Cards to fit into cassette cases.

Copy the file _fill-template.scm_ to your GIMP scripts folder. E.g. for GIMP 2.10 under Ubuntu 22.04 this is _~/.config/GIMP/2.10/scripts_.

Copy the files _template.xcf_ and _fill-all.sh_ to the folder containing the folders with the files for your covers.  
Each of those folders needs these files:
* cover.png  
  Portrait-oriented cover art for the game. This will automatically be resized to fit the cover of the J-Card.
* logo.png  
  The game's logo. This will automatically be resized and rotated to fit the side and the back of the J-Card.
* settings.txt  
  A text file containing these 4 lines:
  * \<system>  
  The game's system; either _GB_, _GBC_ or _GBA_.
  * \<R>  
  The red value of the J-Cards background color.
  * \<G>  
  The green value of the J-Cards background color.
  * \<B>  
  The blue value of the J-Cards background color.

Execute _fill-all.sh_ - this generates the file _j-card.xcf_ in every subfolder where this file does not already exist. You can now open that file in GIMP and fine-tune the J-Card.

Many covers are available at https://www.thecoverproject.net/.
