private ["_titleString","_OpenMenuKey","_LAdmins","_NAdmins","_SAdmins","_escLowTop","_esclowBottom","_escTop","_dstring","_escColour","_broadcastToolUse","_majorLog","_minorLog","_unauthorisedUse","_keyKick","_sideKick","_antiTeleport","_hackBoxCheck","_cmdMenuClose","_dialogClose","_actionCheck","_allowedDialogs","_allowedCmdMenus","_allowedActions","_tmpLA","_tmpNA","_tmpSA","_allAdmins","_version"];

#include "config.sqf"

/*
 * Check if Var exists
 * if not, call them
 */
_titleString = 'by NoxSicarius';
if (isNil '_OpenMenuKey') then {_OpenMenuKey = 0x3C;};
if (isNil '_LAdmins') then {_LAdmins = [];};
if (isNil '_NAdmins') then {_NAdmins = [];};
if (isNil '_SAdmins') then {_SAdmins = [];};
if (isNil '_escTop') then {_escTop = _dstring;};
if (isNil '_escLowTop') then {_escLowTop = _dstring;};
if (isNil '_esclowBottom') then {_esclowBottom = _dstring;};
if (isNil '_escColour') then {_escColour = [0.6,0,0,1];};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;};
if (isNil '_majorLog') then {_majorLog = true;};
if (isNil '_minorLog') then {_minorLog = true;};
if (isNil '_unauthorisedUse') then {_unauthorisedUse = true;};
if (isNil '_keyKick') then {_keyKick = true;};
if (isNil '_sideKick') then {_sideKick = true;};
if (isNil '_antiTeleport') then {_antiTeleport = true;};
if (isNil '_hackBoxCheck') then {_hackBoxCheck = true;};
if (isNil '_cmdMenuClose') then {_cmdMenuClose = true;};
if (isNil '_dialogClose') then {_dialogClose = true;};
if (isNil '_actionCheck') then {_actionCheck = true;};
if (isNil '_allowedDialogs') then {_allowedDialogs = [-1,106,2200,6900,6901,6902,6903,420420,41144];};
if (isNil '_allowedCmdMenus') then {_allowedCmdMenus = [];};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;};
if (isNil '_allowedActions') then {_allowedActions = [];};

/*
 * Load Admin IDS from Files
 * else load from configs
 */
if ((preProcessFileLineNumbers ("lowadmin.sqf")) != "") then {
	_tmpLA = call compile preProcessFileLineNumbers "lowadmin.sqf";
	_LAdmins = _LAdmins + _tmpLA;
};
if ((preProcessFileLineNumbers ("normaladmin.sqf")) != "") then {
	_tmpNA = call compile preProcessFileLineNumbers "normaladmin.sqf";
	_NAdmins = _NAdmins + _tmpNA;
};
if ((preProcessFileLineNumbers ("superadmin.sqf")) != "") then {
	_tmpSA = call compile preProcessFileLineNumbers "superadmin.sqf";
	_SAdmins = _SAdmins + _tmpSA;
};
_allAdmins = _LAdmins + _NAdmins + _SAdmins;

/*
 * Checking server Availability 
 */
_version = productVersion select 3;
if (_version < 103718) then
{
	diag_log format['Server Arma2OA beta is outdated! (%1)',_version];
};


diag_log format['NoxSicarius AdminTools - Creating'];

