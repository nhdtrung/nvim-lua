#!/bin/bash
echo "Available nvim + kitty colorschemes: "
echo "1. Toast - Light"
echo "2. Solarized-flat - Dark"
echo "3. Onedark - Dark"

read -p "Select your colorscheme: " theme

BASE_FOLDER=~/.config/nvim
FOLDER_CONFIG_PATH=~/.nvim_kitty
NVIM_CONFIG_FILE="$FOLDER_CONFIG_PATH/nvim.lua"
KITTY_NEW_CONFIG_FILE="$FOLDER_CONFIG_PATH/kitty.conf"
KITTY_DEFAULT_CONFIG_PATH=~/.config/kitty
KITTY_SOURCE_CONFIG_FILE="$BASE_FOLDER/kitty/kitty.conf"


# create needed files / folder
[ ! -d "$FOLDER_CONFIG_PATH" ] && mkdir -p "$FOLDER_CONFIG_PATH"
[ ! -f "$NVIM_CONFIG_FILE" ] && touch "$NVIM_CONFIG_FILE" 
[ ! -f "$KITTY_NEW_CONFIG_FILE" ] && touch "$KITTY_NEW_CONFIG_FILE" 


echo "$NVIM_COLORSCHEME_OPTS"
if [[ "$theme" == "1" ]]
then
  KITTY_SOURCE_THEME_FILE="$BASE_FOLDER/kitty/toast_theme.conf"
  NVIM_COLORSCHEME_OPT="toast"
  NVIM_BACKGROUND_OPT="light"
elif [[ "$theme" == "2" ]] 
then
  KITTY_SOURCE_THEME_FILE="$BASE_FOLDER/kitty/solarized8_flat_theme.conf"
  NVIM_COLORSCHEME_OPT="solarized-flat"
  NVIM_BACKGROUND_OPT="dark"
else
  # set default theme as onedark
  KITTY_SOURCE_THEME_FILE="$BASE_FOLDER/kitty/onedark_theme.conf"
  NVIM_COLORSCHEME_OPT="onedark"
  NVIM_BACKGROUND_OPT="dark"
fi

# empty current config files
> "$KITTY_NEW_CONFIG_FILE"
> "$NVIM_CONFIG_FILE"

# copy content kitty.conf and ***_theme.conf into $kitty_config_file
cat "$KITTY_SOURCE_CONFIG_FILE" "$KITTY_SOURCE_THEME_FILE" > "$KITTY_NEW_CONFIG_FILE" 
# update symlink
ln -sf "$KITTY_NEW_CONFIG_FILE" "$KITTY_DEFAULT_CONFIG_PATH"

echo return {[\""colorscheme\""]=\""${NVIM_COLORSCHEME_OPT}\"", [\""background\""]=\""${NVIM_BACKGROUND_OPT}\""} > "$NVIM_CONFIG_FILE"


