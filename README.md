# system-sounds-script
Simple Bash Script to provide user defined system login/logout sounds for MATE and LightDM

## Dependencies
Bash :)
system-sounds-script needs to canberra-gtk-play in your $PATH.
Preferably freedesktop.org sound theme should be installed.

## Installation
You may run (as root)
'''Bash
make install
'''

By default makefile will install files to corresponding paths as shown below:

system-sounds-script to /usr/bin
50-system-sounds.conf to /etc/lightdm/lightdm.conf/
system-sounds.conf to /etc/skel

Alternatively you may want to specify other paths then the defaults:

make PREFIX=/usr/local SYSCONFDIR=/some-other-directory LIGHTDMDIR=/lightdm_directory install

Then Makefile installs:

system-sounds-script to /usr/local/bin
50-system-sounds.conf to /lightdm_directory
system-sounds.conf to /some-other-directory/skel

## Usage
system-sounds-script does not take argument to its options.

Usage: system-sounds [options]

     -l        - Desktop login sound from configuration file
     -o        - Desktop logout sound from configuration file
     -r        - System ready sound from configuration file
     -h        - Displays brief usage
     
Please define your preferred sounds in your ~/.config/system-sounds.conf file.
An example configuration file should provided along with this script and should be in your /etc/skel
directory. system-sounds-script uses freedesktop.org sound theme by default (if not configured)

## Authors
Atilla ÖNTAŞ <tarakbumba@gmail.com> 2017


