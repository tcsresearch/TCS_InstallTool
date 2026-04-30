#!/usr/bin/env bash

################################################################################################################
# Define Varaibles - Version #
InstallerVersion="0.2.0"
LastModifiedDate="04/30/2026"

################################################################################################################
# Define Variables - Downloaders #

# Can be aira2 / wget / wget2 / curl

downloader_app="wget"
downloader_args=" -c"

################################################################################################################
# Define Variables - Unzipper #
extractor_app="unzip"
extractor_args=" "

################################################################################################################
# Define Variables - Full URLs #

# tmux #
tmux_install_URL="https://github.com/tcsresearch/tmux-configs/archive/refs/heads/main.zip"

# tmux-custom-plugins #
tmux_plugins_install_URL="https://github.com/tcsresearch/tmux-custom-plugins/archive/refs/heads/main.zip"

# BLING #
BLING_install_URL="https://github.com/tcsresearch/BLING/archive/refs/heads/main.zip"

# BRCD #
BRCD_install_URL="https://github.com/tcsresearch/BRCD/archive/refs/heads/main.zip"

# PS1ConfigTool #
PS1ConfigTool_install_URL="https://github.com/tcsresearch/PS1ConfigTool/archive/refs/heads/main.zip"

# ColorEcho #
ColorEcho_install_URL="https://github.com/tcsresearch/ColorEcho/archive/refs/heads/main.zip"

##################################################################################################################
# Define Variables - Advanced #

BaseURL="https://github.com/tcsresearch"

ExtURL="archive/refs/heads"

FileName="main.zip"

##################################################################################################################
# Define Variables - Install Folders #

TCS_InstallTool_install_Dir="$(pwd)"

tmux_install_Dir="/etc"

tmux_plugins_install_Dir="/etc/tmux/tpm"

BLING_install_Dir="etc/BLING"

BRCD_install_Dir="/etc/bashrc.d"

PS1ConfigTool_install_Dir="/etc/PS1ConfigTool"

ColorEcho_install_Dir="/etc/ColorEcho"

#####################################################################################################################
#####################################################################################################################
#####################################################################################################################
#####################################################################################################################

# Main Program #

function DisplayBanner() {
	echo "TCS Research Install Tool - Version $InstallerVersion ($LastModifiedDate)"
	echo " "
}


function DisplayLine() {
	echo " "
	echo "--------------------------------------------------------"
	echo " "
}

##### Download Files #####
# TODO: Implement Git functionality for easy updates.

function GitCloneAll_PublicOnly() {
	curl -s https://github.com | grep -o 'git@[^"]*' | xargs -L1 git clone
}

function GitCloneAll_PublicPrivate() {
	curl -H "Authorization: token YOUR_GITHUB_TOKEN" -s https://github.com | grep -o 'git@[^"]*' | xargs -L1 git clone
}


function gh-cli_Auth() {
# TODO: Add sanity check for gh package
	gh auth login
}

function gh-cli_CloneAll() {
# TODO: Add sanity check for gh package
	gh repo list YOUR_USERNAME --limit 1000 --json url --jq '.[].url' | xargs -L1 git clone
}

function SelfUpdate() {
echo "Updating TCS_InstallTool..."
	# TODO: Backup before upgrading.
	"$downloader_app $downloader_args" -O TCS_InstallTool-v2.sh "https://raw.githubusercontent.com/tcsresearch/TCS_InstallTool/refs/heads/main/TCS_InstallTool-v2.sh"
}
	

function DynamicDownloader() {
	# TODO: Finish implementation 
	"$downloader_app" "$downloader_args" "$BaseURL/$1/$ExtURL/$FileName"
}

function ManualDownloader() {
	# TODO: Set destination filenames! 
    
	# TODO: Add Additional Apps / Sort By Category 
	
	 #		 	*** WebApp Utils *** 		#
	 #			 SEOPanel-UpgradeTool / CronicleInstallTool
	 
	 #		 	*** Kernel Utils *** 		#
	 #			KMirrorTool / Kernel-RepoStatus

	 #		 	*** Misc Utils *** 		#
     #			BootConfigTool / PHPInfoMenu

	 #		 	*** Repo Utils *** 		#
	 #			RepoSync-ng / MirrrorMan 

	 #		 	*** Other Utils *** 		#
	 #			TarMonster-beta / AOSPMirrorTool 

	 ########################################################################################################################
	 
	 echo "Downloading tmux-configs..."
 	 "$downloader_app $downloader_args" -O tmux-configs.zip "$BaseURL/tmux-configs/$ExtURL/$FileName"
 
	 echo "Downloading tmux-custom-plugins..."
 	 "$downloader_app $downloader_args" -O tmux-custom-plugins.zip "$BaseURL/tmux-custom-plugins/$ExtURL/$FileName"

	 echo "Downloading BLING..."
	 "$downloader_app $downloader_args" -O BLING.zip "$BaseURL/BLING/$ExtURL/$FileName"
 
	 echo "Downloading BRCD..." # FIX URL!
	 "$downloader_app $downloader_args" -O BRCD.zip "$BaseURL/BRCD/$ExtURL/$FileName"

	 echo "Downloading PS1ConfigTool..." # FIX URL!
	 "$downloader_app $downloader_args" -O PS1ConfigTool.zip "$BaseURL/PS1ConfigTool/$ExtURL/$FileName"

	 echo "Downloading ColorEcho..."
	 "$downloader_app $downloader_args" -O ColorEcho.zip "$BaseURL/ColorEcho/$ExtURL/$FileName"
}


##### Extract Files #####

function ExtractFiles() {
	# TODO: Switch to array with for loop
	echo "Extracting & Installing tmux-configs..."
	"$extractor_app $extractor_args" tmux-configs.zip -d "$tmux_install_Dir"
	echo "Extracting & Installing tmux-custom-plugins..."
	"$extractor_app $extractor_args" tmux-custom-plugins.zip -d "$tmux_install_Dir/tpm"
	echo "Extracting & Installing BLING..."
	"$extractor_app $extractor_args" BLING.zip -d "$BLING_install_Dir"
	echo "Extracting & Installing BRCD..."
	"$extractor_app $extractor_args" BRCD.zip -d "$BRCD_install_Dir"
	echo "Extracting & Installing PS1ConfigTool..."
	"$extractor_app $extractor_args" PS1ConfigTool.zip -d "$PS1ConfigTool_install_Dir"
 	echo "Extracting & Installing ColorEcho..."
	"$extractor_app $extractor_args" ColorEcho.zip -d "$ColorEcho_install_Dir"
}

function ConfigureInstall() {
	echo "Not Implemented Yet."
	echo "When done, this function will do the following: "
	echo " 	- Add BLING to PATH"
	echo "  - Enable Cecho incl. alias"
	echo "  - Add tmux, ColorEcho, BRCD, and PS1ConfigTool to .bash_profile"
}

function InstallCompletedMsg() {
	echo "Install Completed."
}

########################################################################################

## Run Main ##
 DisplayBanner
 ManualDownloader
 DisplayLine # Separator for troubleshooting and easier status reads
 ExtractFiles
 DisplayLine # Separator for troubleshooting and easier status reads
 ConfigureInstall
 InstallCompletedMsg
# GitCloneAll_PublicOnly # Only works on public repos!
# GitCloneAll_PublicPrivate

