#!/usr/bin/env bash

# @https://misc.flogisoft.com/bash/tip_colors_and_formatting

# SAMPLE
# FG_RED="\033[31m" FG_RED="\e[31m"
# ESC \e \033 \x1B
# for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#\e[0m" ; done ; echo
# echo -e "\e[1;31;42m Bold + Red forground + Green background \e[0m"

# Classical colors:
# \e[TYPE;BG;FGm

# TO USE 256 COLORS:
# <Esc>[38;5;FgColorNumberm
# <Esc>[48;5;BgColorNumberm

# echo -e "\e[1mbold\e[0m"
# echo -e "\e[3mitalic\e[0m"
# echo -e "\e[3m\e[1mbold italic\e[0m"
# echo -e "\x1B[31mHello World\e[0m"

# echo -e "${FG_RED} Foreground color: red\n ${FG_NOCOLOR} "
# printf "\e[38;2;255;0;0m Foreground color: red\n  ${NO_COLOR}"
# echo -e "\e[38;5;82m  Hello \e[38;5;198m   World  ${NO_COLOR}"
# echo -e "\e[${STYLE_COLOR};${BG_COLOR};${FG_COLOR}m Hello  World ${NO_COLOR}"

# echo -e "\x1B[31mHello World\e[0m"
# printf "\e[38;2;255;0;0m Foreground color: red\n"
# printf "\e[48;2;0;0;0m Background color: black\n"


#########
# STYLE #
#########

STYLE_DEFAULT=0
STYLE_BOLD=1 #e.g. "\e[1;32m"
STYLE_FAINT=2 #e.g. "\e[3;32m"
STYLE_ITALIC=3
STYLE_UNDERLINE=4
STYLE_BLINK=5
STYLE_INVERTED=7
STYLE_HIDDEN=8
STYLE_STRIKETHROUGHT=9

##############
# FOREGROUND #
##############

FG_DEFAULT=39
FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_MAGENTA=35
FG_CYAN=36
FG_LIGHT_GREY=37
# 90..96 LIGHT
FG_WHITE=97

##############
# BACKGROUND #
##############

BG_DEFAULT=49
BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_MAGENTA=45
BG_CYAN=46
BG_LIGHT_GREY=47
# 100..106 LIGHT
BG_WHITE=107

###########
# DISPLAY #
###########

NO_COLOR="\e[0m"
# DISPLAY_COLOR="\e[STYLE;BG_COLOR;FG_COLORm"


############################################################

#########
# STYLE #
#########

export STYLE_DEFAULT="\e[0m"
export STYLE_BOLD="\e[1m" #e.g. "\e[1;32m"
export STYLE_FAINT="\e[2m" #e.g. "\e[3;32m"
export STYLE_ITALIC="\e[3m"
export STYLE_UNDERLINE="\e[4m"
export STYLE_BLINK="\e[5m"
export STYLE_INVERTED="\e[7m"
export STYLE_HIDDEN="\e[8m"
export STYLE_STRIKETHROUGHT="\e[9m"

##############
# FOREGROUND #
##############

export FG_DEFAULT="\e[39m"
export FG_BLACK="\e[30m"
export FG_RED="\e[31m"
export FG_GREEN="\e[32m"
export FG_YELLOW="\e[33m"
export FG_BLUE="\e[34m"
export FG_MAGENTA="\e[35m"
export FG_CYAN="\e[36m"
export FG_LIGHT_GREY="\e[37m"
# 90..96 LIGHT
export FG_WHITE="\e[97m"

##############
# BACKGROUND #
##############

export BG_DEFAULT="\e[49m"
export BG_BLACK="\e[40m"
export BG_RED="\e[41m"
export BG_GREEN="\e[42m"
export BG_YELLOW="\e[43m"
export BG_BLUE="\e[44m"
export BG_MAGENTA="\e[45m"
export BG_CYAN="\e[46m"
export BG_LIGHT_GREY="\e[47m"
# 100..106 LIGHT
export BG_WHITE="\e[107m"

###########
# DISPLAY #
###########

export NO_COLOR="\e[0m"
# DISPLAY_COLOR="\e[STYLE;BG_COLOR;FG_COLORm"
