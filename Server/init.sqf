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
if (isNil '_escColour') then {_escColour = [0.6,0,0,1];};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;};
if (isNil '_majorLog') then {_majorLog = true;};
if (isNil '_minorLog') then {_minorLog = true;};
if (isNil '_unauthorisedUse') then {_unauthorisedUse = true;};
if (isNil '_antiTeleport') then {_antiTeleport = true;};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;};
if (isNil 'enableAdmin') then {enableAdmin = true;}; /*Don't Disable*/
if (isnil '_debug') then {_debug = true;};

/*
 * Load Admin IDS from Files
 * else load from configs
 */
 if (_debug) then {diag_log format['Searching for admin files'];};
if ((preProcessFileLineNumbers ("lowadmin.sqf")) != "") then {_LA = call compile preProcessFileLineNumbers "lowadmin.sqf";_LAdmins = _LAdmins + _LA;};
if ((preProcessFileLineNumbers ("normaladmin.sqf")) != "") then {_NA = call compile preProcessFileLineNumbers "normaladmin.sqf";_NAdmins = _NAdmins + _NA;};
if ((preProcessFileLineNumbers ("superadmin.sqf")) != "") then {_SA = call compile preProcessFileLineNumbers "superadmin.sqf";_SAdmins = _SAdmins + _SA;};
_allAdmins = _LAdmins + _NAdmins + _SAdmins;

/*
 * Checking server Version
 */ 
 if (_debug) then {diag_log format['Checking Server Version'];};
_version = productVersion select 3;
if (_version < 103718) then {
								diag_log format['Server Arma2OA beta is outdated! (%1)',_version];
								titleText ['This server is using an outdated version of ArmA OA, Version Required: 103718 or Higher | Version Installed: (%1)',_version];
							}else {
									diag_log format['Server Version Up-to-Date!'];
									titleText ['This server is Up-to-Date'];
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
		if (_escMod) then
		{
		 if (_debug) then {diag_log format['Adding Esc Menu Items'];};
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

 if (_debug) then {diag_log format['Creating Admin Menu'];};

/*
 * Find Admins
 */
	_puid = getPlayerUID player; noxLowList = "+str _LAdmins+";	noxNormalList = "+str _NAdmins+"; noxSuperList = "+str _SAdmins+";
	
if (_key == ("+str _OpenMenuKey+")) then {call adminInit;};
/*
 * Add Items to menu
 */ 
//Super Admin
superAdminMenu {
	noxadmin = noxadmin + ["-----------------Map Markers----------------",[]];		
	noxadmin = noxadmin + ["Player Markers",_plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",_corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",_wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",_tntMarker,[]];
		if (_isEpoch) then
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
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Remove Build Limit",_plrRBL,[]];		
				noxadmin = noxadmin + ["1 Step Building",_plr1SB,[]];		
				noxadmin = noxadmin + ["No Plot Pole",_plrRPP,[]];		
				noxadmin = noxadmin + ["No Overburden",_plrROB,[]];	
			};
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Vehicle Tools----------------",[]];	
	noxadmin = noxadmin + ["Point to Repair (Perm)",_p2rp,[]];	
	noxadmin = noxadmin + ["Point to Repair (Temp)",_p2rt,[]];
	noxadmin = noxadmin + ["Point to Delete (Perm)",_p2dp,[]];	
	noxadmin = noxadmin + ["Point to Delete (Temp)",_p2dt,[]];
	noxadmin = noxadmin + ["Flip Vehicle",_p2f,[]];
	noxadmin = noxadmin + ["Refuel Vehicle",_p2r,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["Lock Vehicle (1)",_vLock,[]];	
	noxadmin = noxadmin + ["Unlock Vehicle (2)",_vUnlock,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["Spawn Vehicle",_vSpawnT,[]];
	noxadmin = noxadmin + ["Spawn Vehicle HIVE",_vSpawnP,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Crates----------------",[]];	
	noxadmin = noxadmin + ["---Private",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",_prvWcrate,[]];
	noxadmin = noxadmin + ["Items",_prvIcrate,[]];
	noxadmin = noxadmin + ["All in One",_prvAIOcrate,[]];
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Epoch Crate",_prvBcrate,[]];
			};
	noxadmin = noxadmin + ["Backpack Crate",_prvBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["---Public",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",_pubWcrate,[]];
	noxadmin = noxadmin + ["Items",_pubIcrate,[]];
	noxadmin = noxadmin + ["All in One",_pubAIOcrate,[]];
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Epoch Crate",_pubBcrate,[]];
			};
	noxadmin = noxadmin + ["Backpack Crate",_pubBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice
	noxadmin = noxadmin + ["-----------------Weather/Time----------------",[]];	
};
//Normal Admin
normalAdminMenu {
	noxadmin = noxadmin + ["-----------------Map Markers----------------",[]];		
	noxadmin = noxadmin + ["Player Markers",_plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",_corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",_wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",_tntMarker,[]];
		if (_isEpoch) then
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
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Remove Build Limit",_plrRBL,[]];		
				noxadmin = noxadmin + ["1 Step Building",_plr1SB,[]];		
				noxadmin = noxadmin + ["No Plot Pole",_plrRPP,[]];		
				noxadmin = noxadmin + ["No Overburden",_plrROB,[]];	
			};
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Vehicle Tools----------------",[]];	
	noxadmin = noxadmin + ["Point to Repair (Perm)",_p2rp,[]];	
	noxadmin = noxadmin + ["Point to Repair (Temp)",_p2rt,[]];
	noxadmin = noxadmin + ["Point to Delete (Temp)",_p2dt,[]];
	noxadmin = noxadmin + ["Flip Vehicle",_p2f,[]];
	noxadmin = noxadmin + ["Refuel Vehicle",_p2r,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["Lock Vehicle (1)",_vLock,[]];	
	noxadmin = noxadmin + ["Unlock Vehicle (2)",_vUnlock,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["Spawn Vehicle",_vSpawnT,[]];
	noxadmin = noxadmin + ["Spawn Vehicle HIVE",_vSpawnP,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Crates----------------",[]];	
	noxadmin = noxadmin + ["---Private",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",_prvWcrate,[]];
	noxadmin = noxadmin + ["Items",_prvIcrate,[]];
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Epoch Crate",_prvBcrate,[]];
			};
	noxadmin = noxadmin + ["Backpack Crate",_prvBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["---Public",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",_pubWcrate,[]];
	noxadmin = noxadmin + ["Items",_pubIcrate,[]];
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Epoch Crate",_pubBcrate,[]];
			};
	noxadmin = noxadmin + ["Backpack Crate",_pubBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice
	noxadmin = noxadmin + ["-----------------Weather/Time----------------",[]];	
	};
//Low Admin
lowAdminMenu {
	noxadmin = noxadmin + ["-----------------Map Markers----------------",[]];		
	noxadmin = noxadmin + ["Player Markers",_plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",_corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",_wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",_tntMarker,[]];
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
	noxadmin = noxadmin + ["Spectate Player",_admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["-----------------Player Tools----------------",[]];	
	noxadmin = noxadmin + ["Heal Player",_plrHeal,[]];		
	noxadmin = noxadmin + ["No Recoil",_plrRR,[]];		
	noxadmin = noxadmin + ["God",_plrGod,[]];			
		if (_isEpoch) then
			{		
				noxadmin = noxadmin + ["1 Step Building",_plr1SB,[]];		
				noxadmin = noxadmin + ["No Plot Pole",_plrRPP,[]];		
				noxadmin = noxadmin + ["No Overburden",_plrROB,[]];	
			};
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Vehicle Tools----------------",[]];	
	noxadmin = noxadmin + ["Point to Repair (Perm)",_p2rp,[]];	
	noxadmin = noxadmin + ["Point to Repair (Temp)",_p2rt,[]];
	noxadmin = noxadmin + ["Flip Vehicle",_p2f,[]];
	noxadmin = noxadmin + ["Refuel Vehicle",_p2r,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["Lock Vehicle (1)",_vLock,[]];	
	noxadmin = noxadmin + ["Unlock Vehicle (2)",_vUnlock,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["Spawn Vehicle",_vSpawnT,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Crates----------------",[]];	
	noxadmin = noxadmin + ["---Private",[]];	
	noxadmin = noxadmin + ["Items",_prvIcrate,[]];
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Epoch Crate",_prvBcrate,[]];
			};
	noxadmin = noxadmin + ["Backpack Crate",_prvBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["---Public",[]];	
	noxadmin = noxadmin + ["Items",_pubIcrate,[]];
		if (_isEpoch) then
			{	
				noxadmin = noxadmin + ["Epoch Crate",_pubBcrate,[]];
			};
	noxadmin = noxadmin + ["Backpack Crate",_pubBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice
	noxadmin = noxadmin + ["-----------------Weather/Time----------------",[]];	


	};
 
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
				_ctrl ctrlSetText format["Low Admin Menu  --- NoxSicarius Admin Menu"];
			};
			if (getPlayerUID player in noxNormalList) then {
				_ctrl ctrlSetText format["High Admin Menu  ---  NoxSicarius Admin Menu"];
			};
			if (getPlayerUID player in noxSuperList) then {
				_ctrl ctrlSetText format["Super Admin Menu  ---  NoxSicarius Admin Menu"];
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


	}
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
			_unsorted = _unsorted - [_closest]
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
		if (getPlayerUID player in noxSuperList) then {call superAdminMenu;};
		if (getPlayerUID player in noxNormalList) then {call normalAdminMenu;};
		if (getPlayerUID player in noxLowList) then {call lowAdminMenu;};
	};