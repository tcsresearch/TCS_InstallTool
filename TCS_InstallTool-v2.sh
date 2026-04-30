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
# Define Variables - Dynamic Downloader / Extractor #
ProjectName="$1"
ZipFile="$2"
InstallFolder="$3"

################################################################################################################
# Define Variables - Full URLs #

# SelfUpdate #
SelfUpdate_URL="https://raw.githubusercontent.com/tcsresearch/TCS_InstallTool/refs/heads/main/TCS_InstallTool-v2.sh"

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

# SelfUpdate #
	TCS_InstallTool_install_Dir="$(pwd)"

# Tmux #
	tmux_install_Dir="/etc"

	tmux_plugins_install_Dir="/etc/tmux/tpm"

# Core Utils #
	BLING_install_Dir="etc/BLING"

	BRCD_install_Dir="/etc/bashrc.d"

	PS1ConfigTool_install_Dir="/etc/PS1ConfigTool"

	ColorEcho_install_Dir="/etc/ColorEcho"

# Repo Utils #
	RepoSync_install_Dir="/etc/RepoSync-ng"

	MirrorMan_install_Dir="/etc/MirrorMan"

# Other Utils #
	TarMonster_install_Dir="/etc/TarMonster"

	AOSPMirrorTool_install_Dir="/etc/AOSPMirrorTool"



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
	echo "Downloading $ProjectName..."
	"$downloader_app" "$downloader_args" "$BaseURL/$ProjectName/$ExtURL/$FileName"
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

	 #		 	*** Repo Utils *** 			# DONE / NEEDS TESTING !
	 #			RepoSync-ng / MirrrorMan 

	 #		 	*** Other Utils *** 		# DONE / NEEDS TESTING !
	 #			TarMonster-beta / AOSPMirrorTool 

	 ########################################################################################################################

	 ## Tmux ##
	 echo "Downloading tmux-configs..."
 	 "$downloader_app $downloader_args" -O tmux-configs.zip "$BaseURL/tmux-configs/$ExtURL/$FileName"
 
	 echo "Downloading tmux-custom-plugins..."
 	 "$downloader_app $downloader_args" -O tmux-custom-plugins.zip "$BaseURL/tmux-custom-plugins/$ExtURL/$FileName"


	## Core Utils ##
	 echo "Downloading BLING..."
	 "$downloader_app $downloader_args" -O BLING.zip "$BaseURL/BLING/$ExtURL/$FileName"
 
	 echo "Downloading BRCD..." # FIX URL!
	 "$downloader_app $downloader_args" -O BRCD.zip "$BaseURL/BRCD/$ExtURL/$FileName"

	 echo "Downloading PS1ConfigTool..." # FIX URL!
	 "$downloader_app $downloader_args" -O PS1ConfigTool.zip "$BaseURL/PS1ConfigTool/$ExtURL/$FileName"

	 echo "Downloading ColorEcho..."
	 "$downloader_app $downloader_args" -O ColorEcho.zip "$BaseURL/ColorEcho/$ExtURL/$FileName"

	## Repo Utils ##
	echo "Downloading RepoSync-ng..."
	"$downloader_app $downloader_args" -O RepoSync-ng.zip "$BaseURL/RepoSync-ng/$ExtURL/$FileName"

    ## Other Utils ##
	echo "Downloading TarMonster-beta..."
	"$downloader_app $downloader_args" -O TarMonster-beta.zip "$BaseURL/TarMonster-beta/$ExtURL/$FileName"

	echo "Downloading AOSPMirrorTool..."
	"$downloader_app $downloader_args" -O AOSPMirrorTool.zip "$BaseURL/AOSPMirrorTool/$ExtURL/$FileName"


}




##### Extract Files #####

function DynamicExtrator() {
	echo "Extracting & Installing $ProjectName..."
	"$extractor_app $extractor_args" $ProjectName.zip -d "$InstallFolder" 
}


function ExtractFiles() {
	# TODO: Switch to array with for loop

	## Tmux ##
	echo "Extracting & Installing tmux-configs..."
	"$extractor_app $extractor_args" tmux-configs.zip -d "$tmux_install_Dir"
	echo "Extracting & Installing tmux-custom-plugins..."
	"$extractor_app $extractor_args" tmux-custom-plugins.zip -d "$tmux_install_Dir/tpm"
	
	## Core Utils ##
	echo "Extracting & Installing BLING..."
	"$extractor_app $extractor_args" BLING.zip -d "$BLING_install_Dir"
	echo "Extracting & Installing BRCD..."
	"$extractor_app $extractor_args" BRCD.zip -d "$BRCD_install_Dir"
	echo "Extracting & Installing PS1ConfigTool..."
	"$extractor_app $extractor_args" PS1ConfigTool.zip -d "$PS1ConfigTool_install_Dir"
 	echo "Extracting & Installing ColorEcho..."
	"$extractor_app $extractor_args" ColorEcho.zip -d "$ColorEcho_install_Dir"

  ## Repo Utils ##
	echo "Extracting & Installing RepoSync-ng..."
	"$extractor_app $extractor_args" RepoSync-ng.zip -d "$RepoSync_install_Dir"

	echo "Extracting & Installing MirrorMan..."
	"$extractor_app $extractor_args" MirrorMan.zip -d "$MirrorMan_install_Dir"

 ## Other Utils ##
	echo "Extracting & Installing TarMonster-beta..."
	"$extractor_app $extractor_args" TarMonster-beta.zip -d "$TarMonster_install_Dir"

	echo "Extracting & Installing AOSPMirrorTool..."
	"$extractor_app $extractor_args" AOSPMirrorTool.zip -d "$AOSPMirrorTool_install_Dir"


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

### Git Stuff ##
# gh-cli_Auth
# gh-cli_CloneAll

# GitCloneAll_PublicOnly # Only works on public repos!
# GitCloneAll_PublicPrivate

