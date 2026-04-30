#!/usr/bin/env bash
# TODO: Add Sourcing and Sanity Checks.

##### Define Config File / Function Library Location #
ConfigDir="./config"
FunctionsDir="./functions"

ConfigFile="TCS_InstallTool.conf"
FunctionsFile="TCS_InstallTool.bfunc"

# Sanity Check: Config File Exists?
if [ -f "$ConfigDir"/"$ConfigFile" ]; then
  echo "Sourcing Config File..."
  source "$ConfigDir"/"$ConfigFile"
else
  echo "ERROR! Config File Not Found.  Quitting..."
  return
fi

# Sanity Check: Library File Exists?
if [ -f "$FunctionsDir"/"$FunctionsFile" ]; then
  echo "Sourcing Functions File..."
  source "$FunctionsDir"/"$FunctionsFile"
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
