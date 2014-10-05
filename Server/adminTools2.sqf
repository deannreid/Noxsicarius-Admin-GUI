//Var Check
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

								  

//Check Admins
	_puid = getPlayerUID player; 
	noxLowList = _LAdmins;	
	noxNormalList = _NAdmins; 
	noxSuperList = _SAdmins;
	noxadmin = [];


//Setting Menu Keybind and future keybinds
	keyBinds = {
	private = [_key];
	_key = _this select 1;
    if (_key == ("+str _OpenMenuKey+")) then {call adminInit;};};
	

diag_log "Creating Menu";
adminMain {

//Init Admin Code > Create GUI
adminInit {};

//Create GUI
if (enableAdmin) then {

}; 

//Player Menu EH
adminDBClick1 {};

//Admin Menu EH
adminDBClick2 {};

//Fill Shortcut Box
boxShortFill {};

//Fill Player Box with Names > IDs
boxPlayerFill {};

//Fill Central Box with Tools
boxAdminFill {};

};