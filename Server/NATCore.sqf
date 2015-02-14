private ["_OpenMenuKey","_LAdmins","_NAdmins","_SAdmins","_adminGUI","_broadcastToolUse","_majorLog","_minorLog","_unauthorisedUse","_antiTeleport","_osLinux","_gmEpoch","_gmEvolve","_ZSC","_P4L","_puid","_fnc_VarGenerator","_noxAllAdmins","_varErr1","_varErr2","_varErr25","_varErr26","_varErr3","_varErr4","_varErr5","_varErr6","_varErr7","_varErr8","_varErr9","_varErr10","_varErr11","_varErr12","_varErr13"];
#include "NATConfig.sqf"

diag_log ("NATI: Waiting for BIS_fnc_init");
waitUntil {uiSleep 0.5;!isNil "BIS_fnc_init"};

/*
 * Variable Check 
 */ 
if (isNil '_OpenMenuKey') then {_OpenMenuKey = 0x3C;_varErr1 =true;};
if (_varErr1) then {diag_log "Your Config File is missing Variable  |OpenMenuKey|";};
if (isNil '_LAdmins') then {_LAdmins = [];_varErr2 =true;};
if (_varErr2) then {diag_log "Your Config File is missing Variable  |LAdmins|";};
if (isNil '_NAdmins') then {_NAdmins = [];_varErr25 =true;};
if (_varErr25) then {diag_log "Your Config File is missing Variable  |NAdmins|";};
if (isNil '_SAdmins') then {_SAdmins = [];_varErr26 =true;};
if (_varErr26) then {diag_log "Your Config File is missing Variable  |SAdmins|";};
if (isNil '_adminGUI') then {_adminGUI = true;_varErr3 =true;};
if (_varErr3) then {diag_log "Your Config File is missing Variable  |adminGUI|";};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;_varErr4 =true;};
if (_varErr4) then {diag_log "Your Config File is missing Variable  |broadcastToolUse|";};
if (isNil '_majorLog') then {_majorLog = true;_varErr5 =true;};
if (_varErr5) then {diag_log "Your Config File is missing Variable  |majorLog|";};
if (isNil '_minorLog') then {_minorLog = true;_varErr6 =true;};
if (_varErr6) then {diag_log "Your Config File is missing Variable  |minorLog|";};
if (isNil '_unauthorisedUse') then {_unauthorisedUse = true;_varErr7 =true;};
if (_varErr7) then {diag_log "Your Config File is missing Variable  |unauthorisedUse|";};
if (isNil '_antiTeleport') then {_antiTeleport = true;_varErr8 =true;};
if (_varErr8) then {diag_log "Your Config File is missing Variable  |antiTeleport|";};
if (isNil '_osLinux') then {_osLinux = false;_varErr9 =true;};
if (_varErr9) then {diag_log "Your Config File is missing Variable  |osLinux|";};

//Epoch
if (isNil '_gmEpoch') then {_gmEpoch = false;_varErr10 =true;};
if (_varErr10) then {diag_log "Your Config File is missing Variable  |gmEpoch|";};
//Evolved
if (isNil '_gmEvolve') then {_gmEvolve = false;_varErr11 =true;};
if (_varErr11) then {diag_log "Your Config File is missing Variable  |gmEvolve|";};

//Most of these only effect the players menu to give extra options.
//Zupa Single Currency
if (isNil '_ZSC') then {_ZSC = false;_varErr12 =true;};
if (_varErr12) then {diag_log "Your Config File is missing Variable  |ZSC|";};
//Plot 4 Life
if (isNil '_P4L') then {_P4L = false;_varErr13 =true;};
if (_varErr13) then {diag_log "Your Config File is missing Variable  |ZSC|";};

//Check Admins
	_puid = getPlayerUID player; 
	noxLowList = _LAdmins;	
	noxNormalList = _NAdmins; 
	noxSuperList = _SAdmins;
	noxAllAdmins = _LAdmins + _NAdmins + _SAdmins;

	_fnc_VarGenerator = 
	{
	_array = ["a","A","c","D","d","e","F","3","1","6","G","h","f","5","7","I","j","9","8","L","l","m","M","o","P","Q","R","s","T","u","V","w","W","x","y","Y","z"];
	_generator = "S";

		for "_i" from 1 to 9 do {_generator = _generator + (_array select (random  ((count _array)-1)));};
		_number = str(round(random 482689));
		_generator = _generator + ':' + _number;
		_generator;
	};
	diag_log format ['NATS: _fnc_VarGenerator - %1',_fnc_VarGenerator];
	
	_random1 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random1: %1',__random1];
	_random2 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random2: %1',__random2];
	_random3 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random3: %1',__random3];
	_random4 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random4: %1',_random4];
	_random5 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random5: %1',_random5];
	_random6 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random6: %1',_random6];
	_random8 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random8: %1',_random8];
	_random11 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random11: %1',_random11];
	_random12 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random12: %1',_random12];
	_random13 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random13: %1',_random13];	
	_random19 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random19: %1',_random19];
	_random20 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random20: %1',_random20];
	_random21 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random21: %1',_random21];
	_random27 = call _fnc_VarGenerator;
		diag_log format['NATS:  _random27: %1',_random27];
	
call compile ("
	[] spawn {
		waitUntil {uiSleep 0.5; !isNil 'sm_done'};
		uiSleep 30;

		if(_antiTeleport) then {
			'"+_random1+"' addPublicVariableEventHandler {player setVariable['"+_random1+"',PVNT_adminCheck,true];};
		};
	
		if(_unauthorisedUse) then {
			'"+_random2+"' addPublicVariableEventHandler {player setVariable['"+_random2+"',PVNT_adminCheck,true];};
		
		
		};
		
		if (_majorLog) then {
			'"+_random3+"' addPublicVariableEventHandler {player setVariable['"+_random3+"',PVNT_adminCheck,true];};
		
		};
		
		if (_minorLog) then {
			'"+_random4+"' addPublicVariableEventHandler {player setVariable['"+_random4+"',PVNT_adminCheck,true];};
		};

		if (_broadcastToolUse) then{
			'"+_random4+"' addPublicVariableEventHandler {player setVariable['"+_random4+"',PVNT_adminCheck,true];};
		};
	};
	
		if(_puid in "+str _noxAllAdmins+") then
		{	
			'"+_random5+"' addPublicVariableEventHandler {player setVariable['"+_random5+"',PVNT_adminCheck,true];};
			admindefaultKeybinds =
			{
				private ['_key','_shift','_ctrl','_alt'];
				_key = _this select 1;
				_shift = _this select 2;
				_ctrl = _this select 3;
				if(_key == "+str _OpenMenuKey+") then {call adminInit;};
			};	
			
		};
			publicVariable """+_random1+""";
			publicVariable """+_random2+""";
			publicVariable """+_random3+""";
			publicVariable """+_random4+""";
			publicVariable """+_random5+""";
");
	
diag_log "NOXAT - AntiCheat Loaded";
diag_log "NOXAT - Initing AdminStart";
/*
	//TODO: Redo code layout to make it more friendly to my brain.
	//    : Setup Console Debug Messages to double check everythings doing what it is meant too.
*/
adminCode = {
	subMenu = false;

//TODO: Should be done, unsure of name being global or local need to test both.
//Fill Player Box with Names > IDs
getPlayerDetails = {
		_player = "";
		_playerList = lbtext [1, (lbCurSel 1)];
	
		if (_playerList != "") then 
		{
			{
				_userID = getPlayerUID _pid;
				if (_userID != "") then
				{
					if (_playerList == format["%1 (PUID: %2)",_name _x,_x _userID]) then
					{
					_name = name _x;
					_adminName = _name;
					_adminUID = _userID;
					_adminVehicle = vehicle _x;
					_adminPosition = getPosAtl _x;
					};
				};			
			} forEach playableUnits;
		};
		_name
};
	
//TODO: Setup Variable for Allowing Colour change in NATConfig - When everything works.
boxPlayerFill = {
	disableSerialization;
		_ctrl = 1 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
		_setup = [];
		_userID = getPlayerUID _x;
		
		if(getPlayerUID player in noxSuperList) then {
			_superadmin = {getPlayerUID _x in noxSuperList} count _setup;
			if(_superadmin => 0) then	{
				_ctrl lbAdd "=== Super Admins ===";
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
				{
					if(_userID in noxSuperList) then {
						_setup = _setup - [_x];
						_ctrl lbAdd format["%1 (PUID: %2)",_name _x,_x _userID];
						_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
						_ctrl lbSetColor [(lbsize _ctrl)-1, [0.12,0.65,0.94,1]];
					};
				} count _setup;
			};
		};
		
		if(getPlayerUID player in noxNormalList) then {
			_normalAdmin = {getPlayerUID _x in noxNormalList} count _setup;
			if(_normalAdmin => 0) then	{
				_ctrl lbAdd "=== Standard Admins ===";
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
				{
					if(_userID in noxNormalList) then {
						_setup = _setup - [_x];
						_ctrl lbAdd format["%1 (PUID: %2)",_name _x,_x _userID];
						_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
						_ctrl lbSetColor [(lbsize _ctrl)-1, [0.12,0.65,0.94,1]];
					};
				} count _setup;
			};
		};
		
		if(getPlayerUID player in noxLowList) then {		
			_lowAdmin = {getPlayerUID _x in noxLowList} count _setup;
			if(_lowAdmin => 0) then {
				_ctrl lbAdd "=== Low Admisn ===";
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
				{
					if(_userID in noxLowList) then {
						_setup = _setup - [_x];
						_ctrl lbAdd format["%1 (PUID: %2)",_name _x,_x _userID];
						_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
						_ctrl lbSetColor [(lbsize _ctrl)-1, [0.12,0.65,0.94,1]];
					};
				} count _setup;
			};
		};

		_NormalPlayer = {(!(getPlayerUID _x in noxLowList && noxNormalList && noxSuperList))} count _setup;
		if(_NormalPlayer => 0) then {
			_ctrl lbAdd "=== Member ===";
			_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
			_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
			{
				if(_NormalPlayer) then	{
					_setup = _setup - [_x];
					_ctrl lbAdd format["%1 (PID: %2)",_name _x,_x _userID];
					_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0.12,0.65,0.94,1]];		
				};
			} count _setup;
		};
};

adminMainSetup = {

//Insert Setup Here

};

//TODO: Add colour setup for different types ||Toggleable||NonToggleable||ExtraMenu||
boxAdminFill {
	noxadmin = [];
//Super Admin
superAdminMenu {
	noxadmin = noxadmin + ["                 Map Markers                 ",[]];		
	noxadmin = noxadmin + ["Player Markers",call compile preprocessFileLineNumbers _plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",call compile preprocessFileLineNumbers _corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",call compile preprocessFileLineNumbers _wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",call compile preprocessFileLineNumbers _tntMarker,[]];
		if (_isEpoch) then
		{
			noxadmin = noxadmin + ["Safe Markers",call compile preprocessFileLineNumbers _sfeMarker,[]];		
			noxadmin = noxadmin + ["Plot Markers",call compile preprocessFileLineNumbers _pltMarker,[]];
		};
	noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",call compile preprocessFileLineNumbers _vulMarker,[]];	
	noxadmin = noxadmin + ["Vehicle Markers (Locked)",call compile preprocessFileLineNumbers _vlMarker,[]];	
	
	noxadmin = noxadmin + ["",[]];//Spacer to Keep it looking nice	
											    
	noxadmin = noxadmin + ["                 Teleport                 ",[]];		
	noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,[]];	
	noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,[]];	
	noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["                 Admin Tools                 ",[]];		
	noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,[]];	
	noxadmin = noxadmin + ["Ban Player",call compile preprocessFileLineNumbers _admPBan,[]];		
	noxadmin = noxadmin + ["Kill Player",call compile preprocessFileLineNumbers _admPKill,[]];	
	noxadmin = noxadmin + ["Remove Player Gear",call compile preprocessFileLineNumbers _admRPG,[]];	
	noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["                 Player Tools                 ",[]];	
	noxadmin = noxadmin + ["Heal Player",call compile preprocessFileLineNumbers _plrHeal,[]];	
	noxadmin = noxadmin + ["Zombie Shield",call compile preprocessFileLineNumbers _plrZS,[]];		
	noxadmin = noxadmin + ["Zombie Remove Aggro",call compile preprocessFileLineNumbers _plrNZA,[]];		
	noxadmin = noxadmin + ["Infinite Ammo",call compile preprocessFileLineNumbers _plrUA,[]];		
	noxadmin = noxadmin + ["No Recoil",call compile preprocessFileLineNumbers _plrRR,[]];		
	noxadmin = noxadmin + ["God",call compile preprocessFileLineNumbers _plrGod,[]];		
	noxadmin = noxadmin + ["Car God",call compile preprocessFileLineNumbers _plrCGod,[]];		
	noxadmin = noxadmin + ["Invisibility",call compile preprocessFileLineNumbers _plrHarryPotter,[]];		
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Remove Build Limit",call compile preprocessFileLineNumbers _plrRBL,[]];		
			noxadmin = noxadmin + ["1 Step Building",call compile preprocessFileLineNumbers _plr1SB,[]];		
			noxadmin = noxadmin + ["No Plot Pole",call compile preprocessFileLineNumbers _plrRPP,[]];		
			noxadmin = noxadmin + ["No Overburden",call compile preprocessFileLineNumbers _plrROB,[]];	
		};
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Vehicle Tools                 ",[]];	
	noxadmin = noxadmin + ["Point to Repair (Perm)",call compile preprocessFileLineNumbers _p2rp,[]];	
	noxadmin = noxadmin + ["Point to Repair (Temp)",call compile preprocessFileLineNumbers _p2rt,[]];
	noxadmin = noxadmin + ["Point to Delete (Perm)",call compile preprocessFileLineNumbers _p2dp,[]];	
	noxadmin = noxadmin + ["Point to Delete (Temp)",call compile preprocessFileLineNumbers _p2dt,[]];
	noxadmin = noxadmin + ["Flip Vehicle",call compile preprocessFileLineNumbers _p2f,[]];
	noxadmin = noxadmin + ["Refuel Vehicle",call compile preprocessFileLineNumbers _p2r,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["Lock Vehicle (1)",call compile preprocessFileLineNumbers _vLock,[]];	
	noxadmin = noxadmin + ["Unlock Vehicle (2)",call compile preprocessFileLineNumbers _vUnlock,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["Spawn Vehicle",call compile preprocessFileLineNumbers _vSpawnT,[]];
	noxadmin = noxadmin + ["Spawn Vehicle HIVE",call compile preprocessFileLineNumbers _vSpawnP,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Crates                 ",[]];	
	noxadmin = noxadmin + ["---Private",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _prvWcrate,[]];
	noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _prvIcrate,[]];
	noxadmin = noxadmin + ["All in One",call compile preprocessFileLineNumbers _prvAIOcrate,[]];
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _prvBcrate,[]];
		};
	noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _prvBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["---Public",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _pubWcrate,[]];
	noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _pubIcrate,[]];
	noxadmin = noxadmin + ["All in One",call compile preprocessFileLineNumbers _pubAIOcrate,[]];
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _pubBcrate,[]];
		};
	noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _pubBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice
	noxadmin = noxadmin + ["                 Weather/Time                 ",[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 HouseKeeping                 ",[]];
	noxadmin = noxadmin + ["Delete Zombies",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Delete Dead Bodys",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Delete Loot",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Delete Weapon Crates",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Delete Destroyed Vehicles",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Reset Vehicles (Deletes all vehicles with ID:0 won't Respawn until restart)",call compile preprocessFileLineNumbers ,[]];
};

//Normal Admin
normalAdminMenu {
	noxadmin = noxadmin + ["                 Map Markers                 ",[]];		
	noxadmin = noxadmin + ["Player Markers",call compile preprocessFileLineNumbers _plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",call compile preprocessFileLineNumbers _corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",call compile preprocessFileLineNumbers _wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",call compile preprocessFileLineNumbers _tntMarker,[]];
		if (_isEpoch) then
		{
			noxadmin = noxadmin + ["Safe Markers",call compile preprocessFileLineNumbers _sfeMarker,[]];		
			noxadmin = noxadmin + ["Plot Markers",call compile preprocessFileLineNumbers _pltMarker,[]];
		};
	noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",call compile preprocessFileLineNumbers _vulMarker,[]];	
	noxadmin = noxadmin + ["Vehicle Markers (Locked)",call compile preprocessFileLineNumbers _vlMarker,[]];	
	
	noxadmin = noxadmin + ["",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Teleport                 ",[]];		
	noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,[]];	
	noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,[]];	
	noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["                 Admin Tools                 ",[]];		
	noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,[]];	
	noxadmin = noxadmin + ["Kill Player",call compile preprocessFileLineNumbers _admPKill,[]];	
	noxadmin = noxadmin + ["Remove Player Gear",call compile preprocessFileLineNumbers _admRPG,[]];	
	noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["                 Player Tools                 ",[]];	
	noxadmin = noxadmin + ["Heal Player",call compile preprocessFileLineNumbers _plrHeal,[]];	
	noxadmin = noxadmin + ["Zombie Shield",call compile preprocessFileLineNumbers _plrZS,[]];		
	noxadmin = noxadmin + ["Zombie Remove Aggro",call compile preprocessFileLineNumbers _plrNZA,[]];		
	noxadmin = noxadmin + ["Infinite Ammo",call compile preprocessFileLineNumbers _plrUA,[]];		
	noxadmin = noxadmin + ["No Recoil",call compile preprocessFileLineNumbers _plrRR,[]];		
	noxadmin = noxadmin + ["God",call compile preprocessFileLineNumbers _plrGod,[]];		
	noxadmin = noxadmin + ["Car God",call compile preprocessFileLineNumbers _plrCGod,[]];		
	noxadmin = noxadmin + ["Invisibility",call compile preprocessFileLineNumbers _plrHarryPotter,[]];		
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Remove Build Limit",call compile preprocessFileLineNumbers _plrRBL,[]];		
			noxadmin = noxadmin + ["1 Step Building",call compile preprocessFileLineNumbers _plr1SB,[]];		
			noxadmin = noxadmin + ["No Plot Pole",call compile preprocessFileLineNumbers _plrRPP,[]];		
			noxadmin = noxadmin + ["No Overburden",call compile preprocessFileLineNumbers _plrROB,[]];	
		};
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Vehicle Tools                 ",[]];	
	noxadmin = noxadmin + ["Point to Repair (Perm)",call compile preprocessFileLineNumbers _p2rp,[]];	
	noxadmin = noxadmin + ["Point to Repair (Temp)",call compile preprocessFileLineNumbers _p2rt,[]];
	noxadmin = noxadmin + ["Point to Delete (Temp)",call compile preprocessFileLineNumbers _p2dt,[]];
	noxadmin = noxadmin + ["Flip Vehicle",call compile preprocessFileLineNumbers _p2f,[]];
	noxadmin = noxadmin + ["Refuel Vehicle",call compile preprocessFileLineNumbers _p2r,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["Lock Vehicle (1)",call compile preprocessFileLineNumbers _vLock,[]];	
	noxadmin = noxadmin + ["Unlock Vehicle (2)",call compile preprocessFileLineNumbers _vUnlock,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["Spawn Vehicle",call compile preprocessFileLineNumbers _vSpawnT,[]];
	noxadmin = noxadmin + ["Spawn Vehicle HIVE",call compile preprocessFileLineNumbers _vSpawnP,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Crates                 ",[]];	
	noxadmin = noxadmin + ["---Private",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _prvWcrate,[]];
	noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _prvIcrate,[]];
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _prvBcrate,[]];
		};
	noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _prvBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["---Public",[]];	
	noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _pubWcrate,[]];
	noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _pubIcrate,[]];
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _pubBcrate,[]];
		};
	noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _pubBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice
	noxadmin = noxadmin + ["                 Weather/Time                 ",[]];	

	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 HouseKeeping                 ",[]];
	noxadmin = noxadmin + ["Delete Loot",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Delete Weapon Crates",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Delete Destroyed Vehicles",call compile preprocessFileLineNumbers ,[]];
	};
//Low Admin
lowAdminMenu {
	noxadmin = noxadmin + ["                 Map Markers                 ",[]];		
	noxadmin = noxadmin + ["Player Markers",call compile preprocessFileLineNumbers _plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",call compile preprocessFileLineNumbers _corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",call compile preprocessFileLineNumbers _wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",call compile preprocessFileLineNumbers _tntMarker,[]];
	noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",call compile preprocessFileLineNumbers _vulMarker,[]];	
	noxadmin = noxadmin + ["Vehicle Markers (Locked)",call compile preprocessFileLineNumbers _vlMarker,[]];	
	
	noxadmin = noxadmin + ["",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Teleport                 ",[]];		
	noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,[]];	
	noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,[]];	
	noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["                 Admin Tools                 ",[]];		
	noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,[]];	
	noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["                 Player Tools                 ",[]];	
	noxadmin = noxadmin + ["Heal Player",call compile preprocessFileLineNumbers _plrHeal,[]];		
	noxadmin = noxadmin + ["No Recoil",call compile preprocessFileLineNumbers _plrRR,[]];		
	noxadmin = noxadmin + ["God",call compile preprocessFileLineNumbers _plrGod,[]];			
		if (_isEpoch) then
		{		
			noxadmin = noxadmin + ["1 Step Building",call compile preprocessFileLineNumbers _plr1SB,[]];		
			noxadmin = noxadmin + ["No Plot Pole",call compile preprocessFileLineNumbers _plrRPP,[]];		
			noxadmin = noxadmin + ["No Overburden",call compile preprocessFileLineNumbers _plrROB,[]];	
		};
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Vehicle Tools                 ",[]];	
	noxadmin = noxadmin + ["Point to Repair (Perm)",call compile preprocessFileLineNumbers _p2rp,[]];	
	noxadmin = noxadmin + ["Point to Repair (Temp)",call compile preprocessFileLineNumbers _p2rt,[]];
	noxadmin = noxadmin + ["Flip Vehicle",call compile preprocessFileLineNumbers _p2f,[]];
	noxadmin = noxadmin + ["Refuel Vehicle",call compile preprocessFileLineNumbers _p2r,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["Lock Vehicle (1)",call compile preprocessFileLineNumbers _vLock,[]];	
	noxadmin = noxadmin + ["Unlock Vehicle (2)",call compile preprocessFileLineNumbers _vUnlock,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["Spawn Vehicle",call compile preprocessFileLineNumbers _vSpawnT,[]];
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 Crates                 ",[]];	
	noxadmin = noxadmin + ["---Private",[]];	
	noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _prvIcrate,[]];
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _prvBcrate,[]];
		};
	noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _prvBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["---Public",[]];	
	noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _pubIcrate,[]];
		if (_isEpoch) then
		{	
			noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _pubBcrate,[]];
		};
	noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _pubBPcrate,[]];	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice

	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["                 HouseKeeping                 ",[]];
	noxadmin = noxadmin + ["Delete Weapon Crates",call compile preprocessFileLineNumbers ,[]];
	noxadmin = noxadmin + ["Delete Destroyed Vehicles",call compile preprocessFileLineNumbers ,[]];
	};
};

boxPopulate ={
		inSub = false;
		noxadmin = [];
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
		
		if(getPlayerUID player in noxLowList) then {call lowAdminMenu;};
		if(getPlayerUID player in noxNormalList) then {call normalAdminMenu;};
		if(getPlayerUID player in noxSuperList) then {call superAdminMenu;};
		call adminMainSetup	
};

/////////////
//Completed//
/////////////
//Init Admin Code > Create GUI
	adminInit = {
		if (isNil "restartCount") then {restartCount = 180;};
		_time = (restartCount-(round(serverTime / 60)));
		closeDialog 0;
		if !(dialog) then {createDialog "RscConfigEditor_Main";};
		disableSerialization;
			//Header Box
			_ctrl = 3 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.04];
			_ctrl ctrlSetBackgroundColor [0,0.1,0,1];
			_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
			_ctrl ctrlSetTextColor [1,1,1,1];
			_ctrl ctrlSetScale 1.6;
			_ctrl ctrlSetForegroundColor [0,0.1,0,1];
			_ctrl ctrlSetText format["Noxsicarius Admin Menu ' Restart in: %1",_time];
			_ctrl ctrlCommit 0;
		
			//Admin Box		
			_ctrl = 2 call getControl;
			_ctrl ctrlSetPosition [safezoneXAbs + 0.465, safezoneY + 0.05, 1.445, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0,0.36,0.85,1];
			_ctrl ctrlCommit commitT;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call adminDBClick2;"];
				call boxAdminFill;
		
			//Players	
			_ctrl = 1 call getControl;
			_ctrl ctrlSetPosition [safezoneXAbs + 0.005, safezoneY + 0.05, (0.485)*0.7, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0,0.36,0.85,1];
			_ctrl ctrlCommit commitT;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call adminDBClick1;"]; //Enable User Select
				call boxPopulate;
				call boxPlayerFill;
			
			//Frame	
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlSetForegroundColor [0,0.36,0.85,1];
			_ctrl ctrlCommit commitT;	
	};
};