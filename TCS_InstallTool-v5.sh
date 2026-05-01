#!/usr/bin/env bash
# TODO: Add Sourcing and Sanity Checks.

#########################################################################################################################
# Define Files / Folders #                                                                                              #
#########################################################################################################################

##### Define AdvPreLoader File #####
AdvPreLoader_Dir="$(pwd)"
AdvPreLoader_File="AdvPreLoader.sh"

##### Define Config File Location #####
ConfigDir="./config"
ConfigFile="TCS_InstallTool.conf"


##### Define Function Library Location #####
FunctionsDir="./functions"
FunctionsFile="TCS_InstallTool.bfunc"

############################################################################################################################
# Sanity Checks #                                                                                                          #
############################################################################################################################

# Sanity Check: AdvPreLoader File Exists?
if [ -f "$AdvPreLoader_Dir"/"$AdvPreLoader_File" ]; then
  echo "Sourcing Functions File..."
  source "$AdvPreLoader_Dir"/"$AdvPreLoader_File"
else
  echo "ERROR! AdvPreLoader File Not Found.  Quitting..."
  return
fi


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

#################################################################################################
# Main Program #                                                                                #
#################################################################################################

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
