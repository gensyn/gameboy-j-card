# gameboy-j-card

Copy the file _fill-template.scm_ to your GIMP scripts folder. For GIMP 2.10 under Ubuntu 22.04 this is _~/.config/GIMP/2.10/scripts_.

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

For covers see https://www.thecoverproject.net/.
