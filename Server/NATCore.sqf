private ["_OpenMenuKey","_LAdmins","_NAdmins","_SAdmins","_broadcastToolUse","_majorLog","_minorLog","_unauthorisedUse","_antiTeleport","_gmEpoch","_gmILife","_gmEvolve","_ZSC","_P4L","_puid","_guiFrameColour","_guiTitleTextColour","_guiTitleBGColour","_guiMainTextNonToggleColour","_guiMainTextToggleColour","_guiPlayerTextColour","_NoxAHEnable","_varErr","_fnc_VarGenerator","_random1","_random2","_random3","_random4","_random5","_random6","_random8","_random11","_random12","_random13","_random19","_random20","_random21","_random27"];
#include "NATConfig.sqf"

diag_log ("NoxAdminTools: Waiting for BIS_fnc_init");
	waitUntil {sleep 0.5;!isNil "BIS_fnc_init";};
_varErr = [];
	if (isNil '_NoxAHEnable') then {_NoxAHEnable = true;_varErr = true;};
	if (isNil '_OpenMenuKey') then {_OpenMenuKey = 0x3C;_varErr = true;};
	if (isNil '_LAdmins') then {_LAdmins = [];_varErr = true;};
	if (isNil '_NAdmins') then {_NAdmins = [];_varErr = true;};
	if (isNil '_SAdmins') then {_SAdmins = [];_varErr = true;};
	if (isNil '_majorLog') then {_majorLog = true;_varErr = true;};
	if (isNil '_minorLog') then {_minorLog = true;_varErr = true;};
	if (isNil '_unauthorisedUse') then {_unauthorisedUse = true;_varErr = true;};
	if (isNil '_antiTeleport') then {_antiTeleport = true;_varErr = true;};
	if (isNil '_gmEpoch') then {_gmEpoch = false;_varErr = true;};
	if (isNil '_gmEvolve') then {_gmEvolve = false;_varErr = true;};
	if (isNil '_gmILife') then {_gmILife = false;_varErr = true;};
	if (isNil '_ZSC') then {_ZSC = false;_varErr = true;};
	if (isNil '_P4L') then {_P4L = false;_varErr = true;};
	if (isNil '_guiFrameColour') then {_guiFrameColour = [0,0.36,0.85,1];_varErr = true;};
	if (isNil '_guiTitleTextColour') then {_guiTitleTextColour = [1,1,1,1];_varErr = true;};
	if (isNil '_guiTitleBGColour') then {_guiTitleBGColour = [0,0.1,0,1];_varErr = true;};
	if (isNil '_guiMainTextNonToggleColour') then {_guiMainTextNonToggleColour = [0.3,0.3,0.3,1];_varErr = true;};
	if (isNil '_guiMainTextToggleColour') then {_guiMainTextToggleColour = [0.5,0.5,0.5,1];_varErr = true;};
	if (isNil '_guiPlayerTextColour') then {_guiPlayerTextColour = [0.5,0.5,0.5,1];_varErr = true;};
	if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;_varErr = true;};
	if (_varErr) then {diag_log "NoxAdminTools: Missing Variable Error";};

	diag_log "NoxAdminTools: Getting Admin IDs";
		_puid = getPlayerUID player;
	diag_log format ["NoxAdminTools: Player: %1 Joined the Game ",_puid];
		noxLowList = _LAdmins + _adminLevel 1;
		noxNormalList = _NAdmins + _adminLevel 2;
		noxSuperList = _SAdmins + _adminLevel 3;
		noxAllAdmins = _LAdmins + _NAdmins + _SAdmins;
		_name = name _x;
		_adminName = _name;

	/***************************************/
	//Debugging Only - Remove In Release  //
	/**************************************/			
	diag_log format ["NoxAdminTools: Low Admins: %1 ",_LAdmins];
	diag_log format ["NoxAdminTools: Normal Admins: %1",_NAdmins];
	diag_log format ["NoxAdminTools: Super Admins: %1",_SAdmins];	

		_adminLevel = [];
		{
			if ((_x select 0) == (getPlayerUID player)) exitWith {
				_adminLevel = (_x select 1);
			};
		} forEach "+str noxAllAdmins+";
		
		if ((_adminLevel < 1) || (_adminLevel > 3)) then {
		    (findDisplay 46) closeDisplay 0;
		};
		systemChat format ["NoxAdminTools: Logging in as level %1 admin.",adminLevel];
		diag_log format ["NoxAdminTools: %1 Logged in at Level %2 admin.",_adminName, adminLevel];
	
	/***************************************/
	//Debugging Only - Remove In Release  //
	/**************************************/	
	
	//Variable Generator
	_fnc_VarGenerator = {
        _array = ["a","A","c","D","d","e","F","3","1","6","G","h","f","5","7","I","j","9","8","L","l","m","M","o","P","Q","R","s","T","u","V","w","W","x","y","Y","z"];
        _generator = "S";
        for "_i" from 1 to 9 do {_generator = _generator + (_array select (random  ((count _array)-1)));};
			_number = str(round(random 482689));
			_generator = _generator + ':' + _number;
        if(isNil'numofgenerated') then {numofgenerated=1;} else {numofgenerated = numofgenerated + 1;};
			diag_log format['NoxAdminTools: _random%1: %2',numofgenerated,_generator];
        _generator
	};
	_random1 = call _fnc_VarGenerator;
	_random2 = call _fnc_VarGenerator;
	_random3 = call _fnc_VarGenerator;
	_random4 = call _fnc_VarGenerator;
	_random5 = call _fnc_VarGenerator;
	_random6 = call _fnc_VarGenerator;
	_random8 = call _fnc_VarGenerator;
	_random11 = call _fnc_VarGenerator;
	_random12 = call _fnc_VarGenerator;
	_random13 = call _fnc_VarGenerator;	
	_random19 = call _fnc_VarGenerator;
	_random20 = call _fnc_VarGenerator;
	_random21 = call _fnc_VarGenerator;
	_random27 = call _fnc_VarGenerator;
	_AHL = call _fnc_VarGenerator;
	_MBan = call _fnc_VarGenerator;		

	/*call compile ("
		NoxAH = false;
		[] spawn {
			waitUntil {uiSleep 0.5; !isNil 'sm_done'};
			uiSleep 30;

			"+ _MBan +" = {
				[] spawn {
					while {true} do {
						disableUserInput true;
					};
				};
					titleText ['You have been banned by an admin','BLACK',0.001];
					uiSleep 20;
					(findDisplay 46) closeDisplay 0;
					//endMission;
				[_puid,_name,_x] spawn fnc_Kick;	
			};
			
			if(_unauthorisedUse) then {
				'"+_random2+"' addPublicVariableEventHandler {player setVariable['"+_random2+"'];};
			};
			
			if (_majorLog) then {
				'"+_random3+"' addPublicVariableEventHandler {player setVariable['"+_random3+"'];};
			};
			
			if (_minorLog) then {
				'"+_random4+"' addPublicVariableEventHandler {player setVariable['"+_random4+"'];};
			};

			if (_broadcastToolUse) then {
				'"+_random4+"' addPublicVariableEventHandler {player setVariable['"+_random4+"'];};
			};
			if(_antiTeleport) then {
				'"+_random5+"' addPublicVariableEventHandler {player setVariable['"+_random1+"'];};
			};
			
		};
		
				publicVariable """+_random1+""";
				publicVariable """+_random2+""";
				publicVariable """+_random3+""";
				publicVariable """+_random4+""";
				publicVariable """+_AHL+""";
		NoxAH = true;
	");*/

	if(_puid in "+str noxAllAdmins+") then {	
		admindefaultKeybinds =
		{
			private ["_key"];
			_key = _this select 1;
			if(_key == "+str _OpenMenuKey+") then {call adminInit;};
		};		
	};	
	
	diag_log "NoxAdminTools: Anti-Hack still to be fully implemented";
	diag_log "NoxAdminTools: Loading Admin Menu";	
	
adminCode = {
	adminMainSetup = {

	};
 
	getPlayerDetails = {		
        _player = "";
		_playerList = lbtext [1, (lbCurSel 1)];

		if (_playerList != "") then {
			{
				_userID = getPlayerUID _pid;
				if (_userID != "") then
				{
					if (_playerList == format["%1",name _x]) then
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
		_name;
	};
	
	boxAdminFill {
		noxadmin = [];
		superAdminMenu {
			noxadmin = noxadmin + ["                 Map Markers                 ",[]];		
			noxadmin = noxadmin + ["Player Markers",call compile preprocessFileLineNumbers _plrMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Corpse Markers",call compile preprocessFileLineNumbers _corMarker,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Wreck Markers",call compile preprocessFileLineNumbers _wreMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Tent Markers",call compile preprocessFileLineNumbers _tntMarker,_guiMainTextToggleColour];
				if (_isEpoch) then
				{
					noxadmin = noxadmin + ["Safe Markers",call compile preprocessFileLineNumbers _sfeMarker,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["Plot Markers",call compile preprocessFileLineNumbers _pltMarker,_guiMainTextToggleColour];
				};
			noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",call compile preprocessFileLineNumbers _vulMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Vehicle Markers (Locked)",call compile preprocessFileLineNumbers _vlMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["",[]];						
			noxadmin = noxadmin + ["                 Teleport                 ",[]];		
			noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["                 Admin Tools                 ",[]];		
			noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Ban Player",call compile preprocessFileLineNumbers _admPBan,_guiMainTextNonToggleColour];		
			noxadmin = noxadmin + ["Kill Player",call compile preprocessFileLineNumbers _admPKill,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Remove Player Gear",call compile preprocessFileLineNumbers _admRPG,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];		
			noxadmin = noxadmin + ["                 Player Tools                 ",[]];	
			noxadmin = noxadmin + ["Heal Player",call compile preprocessFileLineNumbers _plrHeal,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Zombie Shield",call compile preprocessFileLineNumbers _plrZS,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Zombie Remove Aggro",call compile preprocessFileLineNumbers _plrNZA,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Infinite Ammo",call compile preprocessFileLineNumbers _plrUA,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["No Recoil",call compile preprocessFileLineNumbers _plrRR,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["God",call compile preprocessFileLineNumbers _plrGod,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Car God",call compile preprocessFileLineNumbers _plrCGod,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Invisibility",call compile preprocessFileLineNumbers _plrHarryPotter,_guiMainTextToggleColour];		
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Remove Build Limit",call compile preprocessFileLineNumbers _plrRBL,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["1 Step Building",call compile preprocessFileLineNumbers _plr1SB,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["No Plot Pole",call compile preprocessFileLineNumbers _plrRPP,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["No Overburden",call compile preprocessFileLineNumbers _plrROB,_guiMainTextToggleColour];	
				};
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 Vehicle Tools                 ",[]];	
			noxadmin = noxadmin + ["Point to Repair (Perm)",call compile preprocessFileLineNumbers _p2rp,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Point to Repair (Temp)",call compile preprocessFileLineNumbers _p2rt,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Point to Delete (Perm)",call compile preprocessFileLineNumbers _p2dp,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Point to Delete (Temp)",call compile preprocessFileLineNumbers _p2dt,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Flip Vehicle",call compile preprocessFileLineNumbers _p2f,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Refuel Vehicle",call compile preprocessFileLineNumbers _p2r,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["Lock Vehicle (1)",call compile preprocessFileLineNumbers _vLock,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Unlock Vehicle (2)",call compile preprocessFileLineNumbers _vUnlock,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["Spawn Vehicle",call compile preprocessFileLineNumbers _vSpawnT,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Spawn Vehicle HIVE",call compile preprocessFileLineNumbers _vSpawnP,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 Crates                 ",[]];	
			noxadmin = noxadmin + ["---Private",[]];	
			noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _prvWcrate,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _prvIcrate,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["All in One",call compile preprocessFileLineNumbers _prvAIOcrate,_guiMainTextNonToggleColour];
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _prvBcrate,_guiMainTextNonToggleColour];
				};
			noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _prvBPcrate,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["---Public",[]];	
			noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _pubWcrate,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _pubIcrate,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["All in One",call compile preprocessFileLineNumbers _pubAIOcrate,_guiMainTextNonToggleColour];
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _pubBcrate,_guiMainTextNonToggleColour];
				};
			noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _pubBPcrate,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["                 Weather/Time                 ",[]];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 HouseKeeping                 ",[]];
			noxadmin = noxadmin + ["Delete Zombies",call compile preprocessFileLineNumbers _hkDelZeds ,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Delete Dead Bodys",call compile preprocessFileLineNumbers _hkDelDB,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Delete Loot",call compile preprocessFileLineNumbers _hkDelLoot,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Delete Weapon Crates",call compile preprocessFileLineNumbers _hkDelWC,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Delete Destroyed Vehicles",call compile preprocessFileLineNumbers _hkDelDV,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Reset Vehicles (Deletes all vehicles with ID:0 won't Respawn until restart)",call compile preprocessFileLineNumbers _hkResetVehicles ,_guiMainTextNonToggleColour];
		};
		normalAdminMenu {
			noxadmin = noxadmin + ["                 Map Markers                 ",[]];		
			noxadmin = noxadmin + ["Player Markers",call compile preprocessFileLineNumbers _plrMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Corpse Markers",call compile preprocessFileLineNumbers _corMarker,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Wreck Markers",call compile preprocessFileLineNumbers _wreMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Tent Markers",call compile preprocessFileLineNumbers _tntMarker,_guiMainTextToggleColour];
				if (_isEpoch) then
				{
					noxadmin = noxadmin + ["Safe Markers",call compile preprocessFileLineNumbers _sfeMarker,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["Plot Markers",call compile preprocessFileLineNumbers _pltMarker,_guiMainTextToggleColour];
				};
			noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",call compile preprocessFileLineNumbers _vulMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Vehicle Markers (Locked)",call compile preprocessFileLineNumbers _vlMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["",[]];	
			noxadmin = noxadmin + ["                 Teleport                 ",[]];		
			noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["                 Admin Tools                 ",[]];		
			noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Kill Player",call compile preprocessFileLineNumbers _admPKill,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Remove Player Gear",call compile preprocessFileLineNumbers _admRPG,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];		
			noxadmin = noxadmin + ["                 Player Tools                 ",[]];	
			noxadmin = noxadmin + ["Heal Player",call compile preprocessFileLineNumbers _plrHeal,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Zombie Shield",call compile preprocessFileLineNumbers _plrZS,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Zombie Remove Aggro",call compile preprocessFileLineNumbers _plrNZA,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Infinite Ammo",call compile preprocessFileLineNumbers _plrUA,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["No Recoil",call compile preprocessFileLineNumbers _plrRR,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["God",call compile preprocessFileLineNumbers _plrGod,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Car God",call compile preprocessFileLineNumbers _plrCGod,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Invisibility",call compile preprocessFileLineNumbers _plrHarryPotter,_guiMainTextToggleColour];		
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Remove Build Limit",call compile preprocessFileLineNumbers _plrRBL,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["1 Step Building",call compile preprocessFileLineNumbers _plr1SB,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["No Plot Pole",call compile preprocessFileLineNumbers _plrRPP,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["No Overburden",call compile preprocessFileLineNumbers _plrROB,_guiMainTextToggleColour];	
				};
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 Vehicle Tools                 ",[]];	
			noxadmin = noxadmin + ["Point to Repair (Perm)",call compile preprocessFileLineNumbers _p2rp,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Point to Repair (Temp)",call compile preprocessFileLineNumbers _p2rt,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Point to Delete (Temp)",call compile preprocessFileLineNumbers _p2dt,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Flip Vehicle",call compile preprocessFileLineNumbers _p2f,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Refuel Vehicle",call compile preprocessFileLineNumbers _p2r,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["Lock Vehicle (1)",call compile preprocessFileLineNumbers _vLock,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Unlock Vehicle (2)",call compile preprocessFileLineNumbers _vUnlock,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["Spawn Vehicle",call compile preprocessFileLineNumbers _vSpawnT,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Spawn Vehicle HIVE",call compile preprocessFileLineNumbers _vSpawnP,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 Crates                 ",[]];	
			noxadmin = noxadmin + ["---Private",[]];	
			noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _prvWcrate,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _prvIcrate,_guiMainTextNonToggleColour];
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _prvBcrate,_guiMainTextNonToggleColour];
				};
			noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _prvBPcrate,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["---Public",[]];	
			noxadmin = noxadmin + ["Weapons & Ammo",call compile preprocessFileLineNumbers _pubWcrate,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _pubIcrate,_guiMainTextNonToggleColour];
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _pubBcrate,_guiMainTextNonToggleColour];
				};
			noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _pubBPcrate,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["                 Weather/Time                 ",[]];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 HouseKeeping                 ",[]];
			noxadmin = noxadmin + ["Delete Loot",call compile preprocessFileLineNumbers _hkDelLoot ,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Delete Weapon Crates",call compile preprocessFileLineNumbers _hkDelWC,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Delete Destroyed Vehicles",call compile preprocessFileLineNumbers _hkDelDV ,_guiMainTextNonToggleColour];
		};
		lowAdminMenu {
			noxadmin = noxadmin + ["                 Map Markers                 ",[]];		
			noxadmin = noxadmin + ["Player Markers",call compile preprocessFileLineNumbers _plrMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Corpse Markers",call compile preprocessFileLineNumbers _corMarker,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["Wreck Markers",call compile preprocessFileLineNumbers _wreMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Tent Markers",call compile preprocessFileLineNumbers _tntMarker,_guiMainTextToggleColour];
			noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",call compile preprocessFileLineNumbers _vulMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["Vehicle Markers (Locked)",call compile preprocessFileLineNumbers _vlMarker,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["",[]];	
			noxadmin = noxadmin + ["                 Teleport                 ",[]];		
			noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,_guiMainTextToggleColour];	
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["                 Admin Tools                 ",[]];		
			noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];		
			noxadmin = noxadmin + ["                 Player Tools                 ",[]];	
			noxadmin = noxadmin + ["Heal Player",call compile preprocessFileLineNumbers _plrHeal,_guiMainTextNonToggleColour];		
			noxadmin = noxadmin + ["No Recoil",call compile preprocessFileLineNumbers _plrRR,_guiMainTextToggleColour];		
			noxadmin = noxadmin + ["God",call compile preprocessFileLineNumbers _plrGod,_guiMainTextToggleColour];			
				if (_isEpoch) then
				{		
					noxadmin = noxadmin + ["1 Step Building",call compile preprocessFileLineNumbers _plr1SB,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["No Plot Pole",call compile preprocessFileLineNumbers _plrRPP,_guiMainTextToggleColour];		
					noxadmin = noxadmin + ["No Overburden",call compile preprocessFileLineNumbers _plrROB,_guiMainTextToggleColour];	
				};
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 Vehicle Tools                 ",[]];	
			noxadmin = noxadmin + ["Point to Repair (Perm)",call compile preprocessFileLineNumbers _p2rp,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Point to Repair (Temp)",call compile preprocessFileLineNumbers _p2rt,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Flip Vehicle",call compile preprocessFileLineNumbers _p2f,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Refuel Vehicle",call compile preprocessFileLineNumbers _p2r,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["Lock Vehicle (1)",call compile preprocessFileLineNumbers _vLock,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["Unlock Vehicle (2)",call compile preprocessFileLineNumbers _vUnlock,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["Spawn Vehicle",call compile preprocessFileLineNumbers _vSpawnT,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 Crates                 ",[]];	
			noxadmin = noxadmin + ["---Private",[]];	
			noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _prvIcrate,_guiMainTextNonToggleColour];
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _prvBcrate,_guiMainTextNonToggleColour];
				};
			noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _prvBPcrate,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["---Public",[]];	
			noxadmin = noxadmin + ["Items",call compile preprocessFileLineNumbers _pubIcrate,_guiMainTextNonToggleColour];
				if (_isEpoch) then
				{	
					noxadmin = noxadmin + ["Epoch Crate",call compile preprocessFileLineNumbers _pubBcrate,_guiMainTextNonToggleColour];
				};
			noxadmin = noxadmin + ["Backpack Crate",call compile preprocessFileLineNumbers _pubBPcrate,_guiMainTextNonToggleColour];	
			noxadmin = noxadmin + ["","",[]];
			noxadmin = noxadmin + ["","",[]];	
			noxadmin = noxadmin + ["                 HouseKeeping                 ",[]];
			noxadmin = noxadmin + ["Delete Weapon Crates",call compile preprocessFileLineNumbers _hkDelWC,_guiMainTextNonToggleColour];
			noxadmin = noxadmin + ["Delete Destroyed Vehicles",call compile preprocessFileLineNumbers _hkDelDV,_guiMainTextNonToggleColour];
		};
	};
	
	boxPlayerFill = {
		disableSerialization;
		_ctrl = 1 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
		_setup = [];
		_userID = getPlayerUID _x;
		
		if(getPlayerUID player in noxSuperList) then {
			_SAdmins = {getPlayerUID _x in noxSuperList} count _setup;
				_ctrl lbAdd "=== Super Admins ===";
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
				{
					if(_userID in noxSuperList) then {
						_setup = _setup - [_x];
						_ctrl lbAdd format["%1",name _x];
						_ctrl lbSetData [(lbsize _ctrl)-1, "1"]; 
						_ctrl lbSetColor [(lbsize _ctrl)-1, _guiPlayerTextColour];
					};
				} forEach _setup
		};
		
		if(getPlayerUID player in noxNormalList) then {
			_NAdmins = {getPlayerUID _x in noxNormalList} count _setup;
				_ctrl lbAdd "=== Standard Admins ===";
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
				{
					if(_userID in noxNormalList) then {
						_setup = _setup - [_x];
						_ctrl lbAdd format["%1",name _x];
						_ctrl lbSetData [(lbsize _ctrl)-1, "1"]; 
						_ctrl lbSetColor [(lbsize _ctrl)-1, _guiPlayerTextColour];
					};
				} forEach _setup
		};	
		
		if(getPlayerUID player in noxLowList) then {		
			_LAdmins = {getPlayerUID _x in noxLowList} count _setup;
				_ctrl lbAdd "=== Low Admins ===";
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
				{
					if(_userID in noxLowList) then {
						_setup = _setup - [_x];
						_ctrl lbAdd format["%1",name _x];
						_ctrl lbSetData [(lbsize _ctrl)-1, "1"]; 
						_ctrl lbSetColor [(lbsize _ctrl)-1, _guiPlayerTextColour];
					};
				} forEach _setup
		};
	};

	boxPopulate ={
		noxadmin = [];
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "EtelkaNarrowMediumPro";

		if(getPlayerUID player in noxLowList) then {call lowAdminMenu;};
		if(getPlayerUID player in noxNormalList) then {call normalAdminMenu;};
		if(getPlayerUID player in noxSuperList) then {call superAdminMenu;};
		call adminMainSetup;	
	};

	adminInit = {
	diag_log "NoxAdminTools: Admin Inited";
	diag_log "NoxAdminTools: Creating GUI";
		if (isNil "restartCount") then {restartCount = 180;};
		_time = (restartCount-(round(serverTime / 60)));
		closeDialog 0;
		if !(dialog) then {createDialog "RscConfigEditor_Main";hint "Dialog Created"}else{hint "Problem Loading Dialog, You should never see this. EVER!!, If you do, Make sure no other dialog is open. e.g infiSTAR";};
		disableSerialization;
			_ctrl = 3 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.04];
			_ctrl ctrlSetBackgroundColor _guiTitleBGColour;
			_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
			_ctrl ctrlSetTextColor _guiTitleTextColour;
			_ctrl ctrlSetScale 1.6;
			_ctrl ctrlSetForegroundColor [0,0.1,0,1];
			_ctrl ctrlSetText format["Noxsicarius Admin Menu ' Restart in: %1",_time];
			_ctrl ctrlCommit 0;
	
			_ctrl = 2 call getControl;
			_ctrl ctrlSetPosition [safezoneXAbs + 0.465, safezoneY + 0.05, 1.445, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0,0.36,0.85,1];
			_ctrl ctrlSetEventHandler ["LBDblClick", "call adminDblClick;"];
				call boxAdminFill;

			_ctrl = 1 call getControl;
			_ctrl ctrlSetPosition [safezoneXAbs + 0.005, safezoneY + 0.05, (0.485)*0.7, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0,0.36,0.85,1];
				call boxPopulate;
				call boxPlayerFill;

			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlSetForegroundColor _guiFrameColour;
	};
};

//WIP -- Allow admins to change menu cosmetics
/*	adminGUICosmetics =	{
			private ['_temp0','_temp1'];
			closeDialog 0;
			uiSleep 0.01;
			createDialog 'RscConfigEditor_Main';
			_temp0 = ctrlPosition ((findDisplay 3030) displayCtrl 1);
			_temp1 = ctrlPosition ((findDisplay 3030) displayCtrl 2);
			closeDialog 0;
			if ((preprocessFileLineNumbers 'noxAdminLayout.sqf') != '') then {
					customLayout = call compile preprocessFileLineNumbers 'noxAdminLayout.sqf';
				if (isNil 'customLayout') then {
					customLayout = [[_temp0,true,1],[_temp1,true,1]];
					diag_log format ['%1',customLayout];
					systemChat 'NoxAdminTools: Default layout paramaters loaded.';
					diag_log 'NoxAdminTools: No data found in ""noxAdminLayout.sqf""! Loading default layout data.';
				} else {
					if ((typeName customLayout) == 'STRING') then {
						customLayout = call compile customLayout;
					};
					systemChat 'NoxAdminTools: Custom layout parameters loaded.';
				};
			} else {
				customLayout = [[_temp0,true,1],[_temp1,true,1]];
				systemChat 'NoxAdminTools: Default layout paramaters loaded.';
				diag_log 'NoxAdminTools: ""noxAdminLayout.sqf"" not found in your ArmA 2 OA directory! Loading default layout data.';
			};
		};*/

		
		
		
//Antihack Stuff
/*
	fnc_Kick = {
	_playerUID = _this select 0;
	_playerName = _this select 1;

	
	diag_log format ["NoxAdminTools: %1 Was Kicked | SUID: %2 ",_PlayerName,_playerUID]
	};*/ //== Will sort when I can be bothered.


diag_log "NoxAdminTools: Loaded";
