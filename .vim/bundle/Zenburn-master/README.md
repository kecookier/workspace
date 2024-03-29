# ZENBURN

Zenburn is a low-contrast color scheme for Vim. It’s easy for your eyes and
designed to keep you in the zone for long programming sessions.

Zenburn has been ported to many different editors and environments. For more
information and list of derivatives, visit http://kippura.org/zenburnpage

### No:

  - dayglo vomit
  - black, red, blue and green on screaming white background
  - headache
  - watery, squinting eyes
  - the "I wanna run away" feeling

### Yes:

  + alien fruit salad
  + harmonious colors help with concentration
  + improved focus
  + stay longer in the zone
  + more productivity
  + looks good
  + 256-color terminal mode
  + GVim mode
  + customizeable
  + etc.

### INSTALLATION

To use Zenburn in GVim, simply copy the file to colors/ subdirectory under your
Vim configuration folder (e.g. `~/.vim/colors` or `C:\vim\colors`).

To use Zenburn in Vim, you must enable the 256-color mode for Vim. This can be
done with e.g. `export TERM=xterm-256color`. You might also need to add 
`set t_Co=256` into your `.vimrc` file, before loading the colorscheme. Note, that
due to limitations of the 256-color mode the color scheme is not exactly like
it appears in GVim, but very close nevertheless.

To load Zenburn in Vim/GVim:

  `:colors zenburn`

To automatically load the colors upon startup of Vim, add this to `.vimrc`:

  `colors zenburn`

### SCREENSHOT

<p align="center">
  <img src="https://github.com/jnurmine/Zenburn/blob/media/zenburn.png" alt="Zenburn in normal contrast mode" />
</p>

### LICENSE

GNU GPL, http://www.gnu.org/licenses/gpl.html

### DEVELOPERS

Captain Obvious says: make a symlink from `~/.vim/colors/zenburn.vim` which
points to the real `zenburn.vim`. This way you don't need to copy files around
and making the Vimball is easy!

### MAKING A VIMBALL

To make a Vimball, open `zb-vimball.txt` and then `:MkVimball zenburn.vba`

### THANKS

  * Creators of "BlackDust", "Camo" and "Desert" themes. I used those to figure out
how the Vim color schemes work in practice.
  * All contributors - see `zenburn.vim` for a list.
  * All people who made derivatives and ports.
  * All zenburners worldwide!

### PARTING WORDS

Thank you for enjoying “Just some alien fruit salad to keep you in the zone”!

Cheers,
slinky at iki dot fi
