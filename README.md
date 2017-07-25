# Backup Jobs
This is a simple bash script I put together to help archive files and folders I was
finished working on. Where I work, we each get a few dozen jobs to process, each in
their own folder. After a few days, it can become a bit cluttered, so anything that
can help archive them in an organised fashion has to be welcome!

## The Script
This script simply takes jobs that are loose in the current directory and places
them into an \_Archive directory, under dated folders in the form '/Month Year'.
For example, if run on the 4th April, all files and folders (other than this script
and the archive folder itself) will be moved to '\_Archive/April 2017/'

This script must be placed in the same directory as the files and directories that
need to be backed up. It will create a directory called '\_Archive', if it doesn't
exist already, and move everything into the dated folder inside there. If you'd
prefer to use a different name, change the ROOTFOLDER variable.

## Exceptions
Some files and folders don't need to be archived just yet. For example, it can be
useful to hold onto jobs that take a few days to process. To handle this, create a
folder called '\_Hold' and place anything you want ignored in there (except for
this script and the '\_Archive' folder).
