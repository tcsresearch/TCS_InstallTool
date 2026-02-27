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

tmux_install_Dir="/etc"

tmux_plugins_install_Dir="/etc/tmux/tpm"

BLING_install_Dir="etc/BLING"

BRCD_install_Dir="/etc/bashrc.d"

PS1ConfigTool_install_Dir="/etc/PS1ConfigTool"

ColorEcho_install_Dir="/etc/ColorEcho"

#####################################################################################################################




# Main Program #

function DisplayBanner() {
	echo "TCS Research Install Tool"
	echo " "
}


function DisplayLine() {
	echo " "
	echo "--------------------------------------------------------"
	echo " "
}

##### Download Files #####

function DynamicDownloader() {
	# TODO: Finish implementation 
	$downloader_app $downloader_args $BaseURL/$1/$ExtURL/$FileName
}

function ManualDownloader() {
	# TODO: Set destination filenames! 
         echo "Downloading tmux-configs..."
 	 $downloader_app $downloader_args -O tmux-configs.zip $BaseURL/tmux-configs/$ExtURL/$FileName
 
	 echo "Downloading tmux-custom-plugins..."
 	 $downloader_app $downloader_args -O tmux-custom-plugins.zip $BaseURL/tmux-custom-plugins/$ExtURL/$FileName

	 echo "Downloading BLING..."
	 $downloader_app $downloader_args -O BLING.zip $BaseURL/BLING/$ExtURL/$FileName
 
	 echo "Downloading BRCD..." # FIX URL!
	 $downloader_app $downloader_args -O BRCD.zip $BaseURL/BRCD/$ExtURL/$FileName

	 echo "Downloading PS1ConfigTool..." # FIX URL!
	 $downloader_app $downloader_args -O PS1ConfigTool.zip $BaseURL/PS1ConfigTool/$ExtURL/$FileName

	 echo "Downloading ColorEcho..."
	 $downloader_app $downloader_args -O ColorEcho.zip $BaseURL/ColorEcho/$ExtURL/$FileName
}


##### Extract Files #####

function ExtractFiles() {
	# TODO: Switch to array with for loop
	echo "Extracting & Installing tmux-configs..."
	$extractor_app $extractor_args tmux-configs.zip -d $tmux_install_Dir
	echo "Extracting & Installing tmux-custom-plugins..."
	$extractor_app $extractor_args tmux-custom-plugins.zip -d $tmux_install_Dir/tpm
	echo "Extracting & Installing BLING..."
	$extractor_app $extractor_args BLING.zip -d $BLING_install_Dir
	echo "Extracting & Installing BRCD..."
	$extractor_app $extractor_args BRCD.zip -d $BRCD_install_Dir
	echo "Extracting & Installing PS1ConfigTool..."
	$extractor_app $extractor_args PS1ConfigTool.zip -d $PS1ConfigTool_install_Dir
 	echo "Extracting & Installing ColorEcho..."
	$extractor_app $extractor_args ColorEcho.zip -d $ColorEcho_install_Dir
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




