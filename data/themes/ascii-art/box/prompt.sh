#!/bin/bash
_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors blue)
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

local RCS_PS1=$(_bashish_prompt_rcs 2>/dev/null)
test "x${RCS_PS1}" != x && RCS_PS1="${ESC}[0;${NORMAL};${FG}${BASHISH_COLOR0}m|${ESC}[${BRIGHTFG}${BASHISH_COLOR0};${BOLD}m${RCS_PS1}${ESC}[0;${NORMAL};${FG}${BASHISH_COLOR0}m"

test x${LINES} = x && LINES=132
local i=0
local FILLY=""
test "x${PROMPTSTR}" = x && local PROMPTSTR="${USER}${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m@${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${HOSTNAME%%.*}"
local BASHISH_B3="`_bashish_prompt_cp437 B3`"
while test "$i" -lt ${LINES}
do
	FILLY="${FILLY}${ESC}[0G${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${BASHISH_B3}${ESC}[${COLUMNS}G${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m$BASHISH_B3${ESC}[B"
	let i++
done

local BASHISH_C0=`_bashish_prompt_cp437 C0` # └
local BASHISH_C4=`_bashish_prompt_cp437 C4` # ─
local BASHISH_DA=`_bashish_prompt_cp437 DA` # ┌
local BASHISH_D9=`_bashish_prompt_cp437 D9` # ┘
local BASHISH_BF=`_bashish_prompt_cp437 BF` # ┐
local BASHISH_B3=`_bashish_prompt_cp437 B3` # │
RPS1="${EMBED}${ESC}[${COLUMNS}G${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m${UNEMBED}${BASHISH_B3}${EMBED}${ESC}[0m${ESC}[6G${UNEMBED}"
local BASHISH_CWD=`_bashish_prompt_cwd $SHELLNAME "${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m" "${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m" 43 embedall`
case "${UID}" in
0)
PS1="${EMBED}\
${ESC}[?7l\
${ESC}[A\
${ESC}[B\
${ESC}7\
$FILLY\
${ESC}[0;$(($LINES - 1))r\
${ESC}[$LINES;0H\
${ESC}[K\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m${BASHISH_C0}`_bashish_prompt_fillx ${BASHISH_C4} 2`${BASHISH_D9}\
${ESC}["$LINES";4H\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m[\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${PROMPTSTR}\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m]\
${ESC}[2C[\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${UNEMBED}$BASHISH_CWD${EMBED}${RCS_PS1}\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m]\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m\
${ESC}[$LINES;$(($COLUMNS - 12))H\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m[\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${TIME}\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m]\
${ESC}8${UNEMBED}\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m# ${BASHISH_DA}`_bashish_prompt_fillx ${BASHISH_C4} 4`${BASHISH_BF}
${EMBED}\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m\
${UNEMBED}\
${BASHISH_DA}${BASHISH_C4}${BASHISH_D9} \
${EMBED}\
${ESC}["$COLUMNS"G\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m${BASHISH_B3}\
${ESC}[5G\
${ESC}[0m\
${UNEMBED}"

;;
*)
PS1="${EMBED}\
${ESC}[0G\
${ESC}[?7l\
${ESC}[A\
${ESC}[B\
${ESC}7\
$FILLY\
${ESC}[0;$(($LINES - 1))r\
${ESC}[$LINES;0H\
${ESC}[K\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m${BASHISH_C0}`_bashish_prompt_fillx ${BASHISH_C4} 2 1`${BASHISH_D9}\
${ESC}["$LINES";4H\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m[\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${PROMPTSTR}\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m]\
${ESC}[2C[\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${UNEMBED}$BASHISH_CWD${EMBED}${RCS_PS1}\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m]\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m\
${ESC}[$LINES;$(($COLUMNS - 12))H\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m[\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${TIME}\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m]\
${ESC}8${UNEMBED}\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m${BASHISH_DA}`_bashish_prompt_fillx ${BASHISH_C4} 2 1`${BASHISH_BF}
${EMBED}\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m\
${UNEMBED}\
${BASHISH_B3} \
${EMBED}\
${ESC}["$COLUMNS"G\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m${BASHISH_B3}\
${ESC}[3G\
${ESC}[0m\
${UNEMBED}"
esac
#─
PS2=">"
}
