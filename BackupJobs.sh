#!/bin/bash
# Simple script to backup jobs that are loose in the current directory and place
# them into the _Archive directory, under dated folders in the form '/Month Year'.
# For example, if run on the 4th April, all files and folders (other than this script
# and the archive folder itself) will be moved to '_Archive/April 2017/'

# This script must be placed in the same directory as the files and directories that
# need to be backed up. It will create a directory called '_Archive', if it doesn't
# exist already, and move everything into the dated folder inside there. If you'd
# prefer to use a different name, change the ROOTFOLDER variable below.

# Directories to use
ROOTFOLDER=_Archive
DATEFOLDER=$ROOTFOLDER/$(date +"%B %Y")/ # string format "Month Year/"

# Colours
NC="\033[0m" # No Color
RED="\033[0;31m"
GREEN="\033[0;32m"

# Enable extglob to allow exclusions when moving directories later on.
shopt -s extglob

# Set working directory to where this script is located
cd "${0%/*}"

# Clear a little space and display message
printf "\n\n\nChecking backup location...\n"

# Check if backup directory needs to be created
if [ ! -d "$DATEFOLDER" ]; then
  printf "${RED}Directory doesn't exist. ${NC}Creating ${DATEFOLDER}\n"
  if [ ! -d "$ROOTFOLDER/" ]; then
  	mkdir "$ROOTFOLDER/"
  fi
  mkdir "$DATEFOLDER"
  printf "Directory created\n\n"
else
  printf "${GREEN}Backup directory already exists...${NC}${DATEFOLDER}\n\n"
fi

printf "\nBacking up...\n"
mv -n !("$ROOTFOLDER"|_Hold|BackupJobs.sh) "$DATEFOLDER"

printf "Finished!\n\n"

exit 0
