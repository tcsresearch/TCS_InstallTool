#!/bin/env bash


# ShellCheck
# shellcheck disable=SC2034,SC2155  # Unused variables left for readability / Declare and assign separately to avoid masking return values.
COLOR_BLACK=0
COLOR_RED=1
COLOR_GREEN=2
COLOR_YELLOW=3
COLOR_BLUE=4
COLOR_MAGENTA=5
COLOR_CYAN=6
COLOR_WHITE=7
COLOR_OFF=9
FG_BLACK=$(echo -e "\033[3${COLOR_BLACK}m")
FG_RED=$(echo -e "\033[3${COLOR_RED}m")
FG_GREEN=$(echo -e "\033[3${COLOR_GREEN}m")
FG_YELLOW=$(echo -e "\033[3${COLOR_YELLOW}m")
FG_BLUE=$(echo -e "\033[3${COLOR_BLUE}m")
FG_MAGENTA=$(echo -e "\033[3${COLOR_MAGENTA}m")
FG_CYAN=$(echo -e "\033[3${COLOR_CYAN}m")
FG_WHITE=$(echo -e "\033[3${COLOR_WHITE}m")
FG_OFF=$(echo -e "\033[3${COLOR_OFF}m")
BG_BLACK=$(echo -e "\033[4${COLOR_BLACK}m")
BG_RED=$(echo -e "\033[4${COLOR_RED}m")
BG_GREEN=$(echo -e "\033[4${COLOR_GREEN}m")
BG_YELLOW=$(echo -e "\033[4${COLOR_YELLOW}m")
BG_BLUE=$(echo -e "\033[4${COLOR_BLUE}m")
BG_MAGENTA=$(echo -e "\033[4${COLOR_MAGENTA}m")
BG_CYAN=$(echo -e "\033[4${COLOR_CYAN}m")
BG_WHITE=$(echo -e "\033[4${COLOR_WHITE}m")
BG_OFF=$(echo -e "\033[4${COLOR_OFF}m")
FG_INFO=$(echo -e "${FG_CYAN}")
FG_DANGER=$(echo -e "${FG_RED}")
FG_WARNING=$(echo -e "${FG_YELLOW}")
FG_SUCCESS=$(echo -e "${FG_GREEN}")
BG_INFO=$(echo -e "${BG_CYAN}")
BG_DANGER=$(echo -e "${BG_RED}")
BG_WARNING=$(echo -e "${BG_YELLOW}")
BG_SUCCESS=$(echo -e "${BG_GREEN}")

# Disable word wrapping
echo -e "\033[?7l"

# Hide cursor
echo -e "\033[?25l"

# Define menu colors
MENU_FG_COLOR=${FG_WHITE}
MENU_BG_COLOR=${BG_CYAN}
MENU_HIGHLIGHT_FG_COLOR=${FG_CYAN}
MENU_HIGHLIGHT_BG_COLOR=${BG_BLACK}

# Define menu title colors
MENU_TITLE_FG_COLOR=${FG_BLACK}
MENU_TITLE_BG_COLOR=${BG_GREEN}

# Define menu width
MENU_WIDTH=50

# Define menu title padding
MENU_TITLE_PADDING=4

# Menu title
MENU_TITLE="Use arrow keys to navigate, press Enter to select."
MENU_TITLE_LENGTH=${#MENU_TITLE}
if [[ $MENU_TITLE_LENGTH -gt $MENU_WIDTH ]]; then
    MENU_WIDTH=$MENU_TITLE_LENGTH
fi
MENU_TITLE_LENGTH=$((MENU_TITLE_LENGTH + MENU_TITLE_PADDING * 2))
if [[ $MENU_TITLE_LENGTH -gt $MENU_WIDTH ]]; then
    MENU_WIDTH=$MENU_TITLE_LENGTH
fi

# Menu options
options=("Option 1" "Option 2" "Option 3" "Exit")
selected=0  # Index of the selected menu item

# Function to display the menu
display_menu() {
    clear
    local term_width=$(tput cols)
    local start_col=$(( (term_width - MENU_WIDTH) / 2 ))
    local padding=$((MENU_WIDTH - MENU_TITLE_LENGTH))
    local filler=$(printf '%*s' "$padding" '')
    local title_filler=$(printf '%*s' "$MENU_TITLE_PADDING" '')
    printf "\n\n"  # Add two empty rows above the menu title
    printf "%${start_col}s" ""
    echo -e "${MENU_TITLE_BG_COLOR}${MENU_TITLE_FG_COLOR}${title_filler}${MENU_TITLE}${title_filler}${FG_OFF}${BG_OFF}"
    for i in "${!options[@]}"; do
        local padding=$((MENU_WIDTH - ${#options[$i]} - 4))
        local filler=$(printf '%*s' "$padding" '')
        if [[ $i -eq $selected ]]; then
            printf "%${start_col}s" ""  # Align to center
            echo -e "${MENU_HIGHLIGHT_BG_COLOR}${MENU_HIGHLIGHT_FG_COLOR} > ${options[$i]} $filler ${FG_OFF}${BG_OFF}"
        else
            printf "%${start_col}s" ""  # Align to center
            echo -e "${MENU_BG_COLOR}${MENU_FG_COLOR}   ${options[$i]} $filler ${FG_OFF}${BG_OFF}"
        fi
    done
}

# Capture keypresses
while true; do
    display_menu
    read -rsn1 key  # Read a single key
    if [[ $key == $'\x1b' ]]; then
        read -rsn2 key  # Read the next two characters
        if [[ $key == "[A" ]]; then  # Up arrow
            ((selected--))
            if [[ $selected -lt 0 ]]; then
                selected=$((${#options[@]} - 1))
            fi
        elif [[ $key == "[B" ]]; then  # Down arrow
            ((selected++))
            if [[ $selected -ge ${#options[@]} ]]; then
                selected=0
            fi
        fi
    elif [[ $key == "" ]]; then  # Enter key
        case ${options[$selected]} in
            "Option 1")
                echo "You selected Option 1!"
                ;;
            "Option 2")
                echo "You selected Option 2!"
                ;;
            "Option 3")
                echo "You selected Option 3!"
                ;;
            "Exit")
                echo "Exiting..."
                echo -e "\033[?7h"  # Re-enable word wrapping
                echo -e "\033[?25h"  # Show cursor
                exit 0
                ;;
        esac
        read -rp "Press any key to continue..." -n1
    fi

done
