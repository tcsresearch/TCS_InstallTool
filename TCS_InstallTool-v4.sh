#!/usr/bin/env bash
# TODO: Add Sourcing and Sanity Checks.

##### Define Config File / Function Library Location #
ConfigFile="TCS_InstallTool.conf"
FunctionsFile="TCS_InstallTool.bfunc"

# Sanity Check: Config File Exists?
if [ -f $ConfigFile ]; then
  echo "Sourcing Config File..."
  source "$ConfigFile"
else
  echo "ERROR! Config File Not Found.  Quitting..."
  return
fi

# Sanity Check: Library File Exists?
if [ -f $FunctionsFile ]; then
  echo "Sourcing Functions File..."
  source "$FunctionsFile"
else
  echo "ERROR! Functions File Not Found.  Quitting..."
  return
fi

  
## Run Main ##
 DisplayBanner
 ManualDownloader
 DisplayLine # Separator for troubleshooting and easier status reads
 ExtractFiles
 DisplayLine # Separator for troubleshooting and easier status reads
 ConfigureInstall
 InstallCompletedMsg

### Git Stuff ##
# gh-cli_Auth
# gh-cli_CloneAll

# GitCloneAll_PublicOnly # Only works on public repos!
# GitCloneAll_PublicPrivate
