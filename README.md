# gameboy-j-card

Copy the file _fill-template.scm_ to your GIMP scripts folder. E.g. for GIMP 2.10 under Ubuntu 22.04 this is _~/.config/GIMP/2.10/scripts_.

Copy the files _template.xcf_ and _fill-all.sh_ to the folder containing the folders with the files for your covers.  
Each of those folders must contain these files:
* cover.png  
  Portrait-oriented cover art for the game. This will automatically be resized to fit the cover of the J-Card.
* logo.png  
  The game's logo. This will automatically be resized and rotated to fit the side and the back of the J-Card.
* settings.txt  
  A text file containing these 4 lines:
  * _\<system>_  
  The game's system; either _GB_, _GBC_ or _GBA_.
  * _\<R>_  
  The red value of the J-Cards background color.
  * _\<G>_  
  The green value of the J-Cards background color.
  * _\<B>_  
  The blue value of the J-Cards background color.

Execute _fill-all.sh_ - this generates the file _j-card.xcf_ in every subfolder where this file does not already exist. You can now open the generated files in GIMP to fine-tune the J-Cards.

Many covers are available at https://www.thecoverproject.net/.
