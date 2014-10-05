private ["_titleString","_OpenMenuKey","_LAdmins","_NAdmins","_SAdmins","_escLowTop","_esclowBottom","_escTop","_dstring","_escColour","_broadcastToolUse","_majorLog","_minorLog","_unauthorisedUse","_antiTeleport","_LA","_NA","_SA","_allAdmins","_version","_escMod","_debug","_display","_btnTitle0","_btnTitle1","_btnTitle2","_admRPG","_noxDLLPath","_isEpoch","_puid","_key"];
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
if (isNil '_escMod') then {_escMod = true;};
if (isNil '_escTop') then {_escTop = _dstring;};
if (isNil '_escLowTop') then {_escLowTop = _dstring;};
if (isNil '_esclowBottom') then {_esclowBottom = _dstring;};
if (isNil '_escColour') then {_escColour = [1,0,0,1];};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;};
if (isNil '_majorLog') then {_majorLog = true;};
if (isNil '_minorLog') then {_minorLog = true;};
if (isNil '_unauthorisedUse') then {_unauthorisedUse = true;};
if (isNil '_antiTeleport') then {_antiTeleport = true;};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;};
if (isNil 'enableAdmin') then {enableAdmin = true;}; /*Don't Disable*/
if (isnil '_debug') then {_debug = true;};

/*
 * Find Admins
 */
	_puid = getPlayerUID player; 
	noxLowList = _LAdmins;	
	noxNormalList = _NAdmins; 
	noxSuperList = _SAdmins;
	noxadmin = [];

/*
 * Checking server Version
 */ 
 if (_debug) then {diag_log format['Checking Server Version'];};
_version = productVersion select 3;
if (_version < 103718) then {
							if (_debug) then {
								diag_log format['Server Arma2OA beta is outdated! (%1)',_version];
								titleText ['This server is using an outdated version of ArmA OA, Version Required: 103718 or Higher | Version Installed: (%1)', "PLAIN",_version];};
							}else {
							if (_debug) then {	
									diag_log format['Server Version Up-to-Date!'];
									titleText ["This Server is Up-To-Date", "PLAIN"];};
								  };

/*
 * Keybinds and Menu Ctrl
 */
	keyBinds = {
	private = [_key];
	_key = _this select 1;
    if (_key == ("+str _OpenMenuKey+")) then {call adminInit;};};
	
	
	
 if (_debug) then {diag_log format['Creating Admin Menu'];};
  
 
 /*
  * Init Admin Code
  * Create GUI Display
  */
adminInit = {
if !(dialog) then {createDialog "RscConfigEditor_Main";};
disableSerialization;

if (enableAdmin) then {
//Header Box
 if (_debug) then {diag_log format['Creating GUI'];};
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0.42,0.17,0.52,0];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.3;
			_ctrl ctrlSetTextColor [0.56,0.04,0.04,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.05]; //2

			if (getPlayerUID player in noxLowList) then {
				_ctrl ctrlSetText format["Low Admin Menu  - NoxSicarius Admin Menu"];
			};
			if (getPlayerUID player in noxNormalList) then {
				_ctrl ctrlSetText format["High Admin Menu  -  NoxSicarius Admin Menu"];
			};
			if (getPlayerUID player in noxSuperList) then {
				_ctrl ctrlSetText format["Super Admin Menu  -  NoxSicarius Admin Menu"];
			};
			_ctrl ctrlSetForegroundColor [0,0,0,0];
			_ctrl ctrlCommit 0;
//Player Box & Admin Box
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.420, safezoneY + 0.04, 1.445, (safeZoneH - 0.10)*0.758]; //0465,005,1445,010,,0758
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0,0,0,1];
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			call adminBoxFill;
			call playerBoxFill;
//Admin Box 2			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.005, safezoneY + 0.05, (0.485)*0.7, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0.4,0,0,1];
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
//Frame			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlSetForegroundColor [0,0,0,0];
			_ctrl ctrlCommit commit_time;


	};
};  
 
 /*
  *Player Menu 
  * Fill with Names
  */
 	playerBoxFill =	{
	 if (_debug) then {diag_log format['Filling GUI ||| Player Box'];};
		disableSerialization;
		_ctrl = 1 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		
		_unsorted = playableUnits;
		_ctrl lbAdd format["Player: %1",count _unsorted];
		_sorted = [];
		{
			_closest = _unsorted select 0;
			{if ((getPos _x distance player) < (getPos _closest distance player)) then {_closest = _x}} forEach _unsorted;
			_sorted = _sorted + [_closest];
			_unsorted = _unsorted - [_closest];
		} forEach _unsorted;
		_sorted;

		_ctrl lbAdd "=== Players";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			_puid = getPlayerUID _x;
			if ((vehicle _x == _x) && (_puid in noxLowList+noxNormalList+noxSuperList)) then
			{
				_ctrl lbAdd format["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
				_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
				_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
				_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (currentWeapon _x) >> "picture"))];
			};
		} forEach _sorted;
		
		_ctrl lbAdd "";
	};
 
 	adminBoxFill =	{
	 if (_debug) then {diag_log format['Filling GUI ||| Admin Box'];};
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		noxadmin = [];
		//if (getPlayerUID player in noxSuperList) then {call superAdminMenu;};
	//	if (getPlayerUID player in noxNormalList) then {call normalAdminMenu;};
		//if (getPlayerUID player in noxLowList) then {call lowAdminMenu;};
	};