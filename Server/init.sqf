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
if (isNil '_escMod') then {_escMod = true;};
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
	_LA = call compile preProcessFileLineNumbers "lowadmin.sqf";
	_LAdmins = _LAdmins + _LA;
};
if ((preProcessFileLineNumbers ("normaladmin.sqf")) != "") then {
	_NA = call compile preProcessFileLineNumbers "normaladmin.sqf";
	_NAdmins = _NAdmins + _NA;
};
if ((preProcessFileLineNumbers ("superadmin.sqf")) != "") then {
	_SA = call compile preProcessFileLineNumbers "superadmin.sqf";
	_SAdmins = _SAdmins + _SA;
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


/*
 * Esc Menu Stuff -- Still to test
 */
	_colorTXT = "+str _escColour+";
	_btnTitle0TXT = "+str _escTop+";
	_btnTitle1TXT = "+str _escLowTop+";
	_btnTitle2TXT = "+str _escLowBottom+";
disableSerialization;
	_startTime = time;
		if (_escMod == true) then
		{
			waitUntil {!isNull findDisplay 49};
			_display = findDisplay 49;	
			
			_btnTitle0 = _display displayCtrl 523;
			_btnTitle0 ctrlSetText _btnTitle0TXT;
			_btnTitle0 ctrlSetTextColor _colorTXT;
			_btnTitle0 ctrlSetScale 0.9;
			_btnTitle0 ctrlCommit 0;
			
			_btnTitle1 = _display displayCtrl 121;
			_btnTitle1 ctrlSetText _btnTitle1TXT;
			_btnTitle1 ctrlSetTextColor _colorTXT;
			_btnTitle1 ctrlSetScale 0.75;
			_btnTitle1 ctrlCommit 0;
			
			_btnTitle2 = _display displayCtrl 120;
			_btnTitle2 ctrlSetText _btnTitle2TXT;
			_btnTitle2 ctrlSetTextColor _colorTXT;
			_btnTitle2 ctrlSetScale 0.75;
			_btnTitle2 ctrlCommit 0;
		};
 


diag_log format['NoxSicarius AdminTools - Creating'];



/*
 * Create Menu
 */
 
 //Doing Menu Population first as that takes longer to do
 
 
/*
 * Add Items to menu
 */ 

//Super Admin


// noxadmin = noxadmin + ["NAME",_SCRIPT,[COL1,COL2,COL3]];
	noxadmin = noxadmin + ["-----------------------Welcome to the------------------------",[]];
	noxadmin = noxadmin + ["------------------Nox Sicarius Admin Tools-------------------",[]];
	noxadmin = noxadmin + ["-----------------------------GUI-----------------------------",[]];	
	
	noxadmin = noxadmin + ["",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Map Markers----------------",[]];		
	noxadmin = noxadmin + ["Player Markers",_plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",_corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",_wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",_tntMarker,[]];
		if (_isEpoch == true) then
			{
				noxadmin = noxadmin + ["Safe Markers",_sfeMarker,[]];		
				noxadmin = noxadmin + ["Plot Markers",_pltMarker,[]];
			};
	noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",_vulMarker,[]];	
	noxadmin = noxadmin + ["Vehicle Markers (Locked)",_vlMarker,[]];	
	
	noxadmin = noxadmin + ["",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Teleport----------------",[]];		
	noxadmin = noxadmin + ["Teleport to Player",_plrTP2,[]];	
	noxadmin = noxadmin + ["Teleport Player to You",_plrTP2S,[]];	
	noxadmin = noxadmin + ["Map Teleport",_plrTPWM,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["-----------------Admin Tools----------------",[]];		
	noxadmin = noxadmin + ["Kick Player",_admPKick,[]];	
	noxadmin = noxadmin + ["Ban Player",_admPBan,[]];		
	noxadmin = noxadmin + ["Kill Player",_admPKill,[]];	
	noxadmin = noxadmin + ["Remove Player Gear",_admRPG,[]];	
	noxadmin = noxadmin + ["Spectate Player",_admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["-----------------Player Tools----------------",[]];	
	noxadmin = noxadmin + ["Heal Player",_plrHeal,[]];	
	noxadmin = noxadmin + ["Zombie Shield",_plrZS,[]];		
	noxadmin = noxadmin + ["Zombie Remove Aggro",_plrNZA,[]];		
	noxadmin = noxadmin + ["Infinite Ammo",_plrUA,[]];		
	noxadmin = noxadmin + ["No Recoil",_plrRR,[]];		
	noxadmin = noxadmin + ["God",_plrGod,[]];		
	noxadmin = noxadmin + ["Car God",_plrCGod,[]];		
	noxadmin = noxadmin + ["Invisibility",_plrHarryPotter,[]];		
		if (_isEpoch == true) then
			{	
				noxadmin = noxadmin + ["Remove Build Limit",_plrRBL,[]];		
				noxadmin = noxadmin + ["1 Step Building",_plr1SB,[]];		
				noxadmin = noxadmin + ["No Plot Pole",_plrRPP,[]];		
				noxadmin = noxadmin + ["No Overburden",_plrROB,[]];	
			};
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Vehicle Tools----------------",[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Crates----------------",[]];	

	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Weather/Time----------------",[]];	

//Normal Admin

//Low Admin
 
 
 
 
 
 
/*
 * More Stuff Here
 */
