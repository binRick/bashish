#!/bin/sh
## @(#) created by ratdog
#######################
##
## anyone remember interspace/BX? ehh ohh well
## this is a port of my theme (yeeeeaaaahhh!)
##                                              -- ratdog

## repacked to bt, added the drift font removed some stuff, generally messed
## it up -- arne
## Maybe we should ADD MORE COLORS!#@#(*&#!

_bashish_prompt()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test x"$BASHISH_COLOR0" = x && eval $(_bashish_prompt_parsecolors cyan)


PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

$_typeset BASHISH_BF=$(_bashish_prompt_cp437 BF) # ┐
$_typeset BASHISH_C0=$(_bashish_prompt_cp437 C0) # └
$_typeset BASHISH_C4=$(_bashish_prompt_cp437 C4) # ─

$_typeset LCYAN="${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}" 
$_typeset CYAN="${EMBED}${ESC}[0;3${BASHISH_COLOR0}m${UNEMBED}" 
$_typeset GREY="${EMBED}${ESC}[1;30m${UNEMBED}" 
$_typeset LGREY="${EMBED}${ESC}[0;37;40m${UNEMBED}" 
$_typeset NCOLOR="${EMBED}${ESC}[0m${UNEMBED}"

$_typeset RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${LCYAN}${RCS_PS1}${GREY}|"
$_typeset ROOT="${BASHISH_BF}" test "x${UID}" = x0 && ROOT="#"

test "x${PROMPTSTR}" = x && $_typeset PROMPTSTR="${USER}$GREY@$CYAN${HOSTNAME%%.*}"

## And now, for the prompt!
PS1="\
$GREY${ROOT} ($LCYAN$PROMPTSTR$GREY) [$LCYAN${TIME}${GREY}\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
$GREY|$CYAN${DATE}$GREY] [${RCS_PS1}$CYAN`_bashish_prompt_cwd "${EMBED}\
${ESC}[1;30m${UNEMBED}" "${EMBED}\
${ESC}[0;3${BASHISH_COLOR0}m${UNEMBED}" 58`$GREY]${NCOLOR}
$GREY${BASHISH_C0}$CYAN${BASHISH_C4}${BASHISH_C4}$LCYAN${BASHISH_C4}$LCYAN>$NCOLOR "
}
