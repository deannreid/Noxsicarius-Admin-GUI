/*
 * Variable Check 
 */ 
if (isNil '_OpenMenuKey') then {_OpenMenuKey = 0x3C;_varErr1 =true;};
if (_varErr1) then {diag_log "Your Config File is missing Variable  'OpenMenuKey'"};
if (isNil '_LAdmins') then {_LAdmins = [];_varErr2 =true;};
if (_varErr2) then {diag_log "Your Config File is missing Variable  'LAdmins'"};
if (isNil '_NAdmins') then {_NAdmins = [];_varErr2.5 =true;};
if (_varErr2.5) then {diag_log "Your Config File is missing Variable  'NAdmins'"};
if (isNil '_SAdmins') then {_SAdmins = [];_varErr2.6 =true;};
if (_varErr2.6) then {diag_log "Your Config File is missing Variable  'SAdmins'"};
if (isNil '_adminGUI') then {_adminGUI = true;_varErr3 =true;};
if (_varErr3) then {diag_log "Your Config File is missing Variable  'adminGUI'"};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;_varErr4 =true;};
if (_varErr4) then {diag_log "Your Config File is missing Variable  'broadcastToolUse'"};
if (isNil '_majorLog') then {_majorLog = true;_varErr5 =true;};
if (_varErr5) then {diag_log "Your Config File is missing Variable  'majorLog'"};
if (isNil '_minorLog') then {_minorLog = true;_varErr6 =true;};
if (_varErr6) then {diag_log "Your Config File is missing Variable  'minorLog'"};
if (isNil '_unauthorisedUse') then {_unauthorisedUse = true;_varErr7 =true;};
if (_varErr7) then {diag_log "Your Config File is missing Variable  'unauthorisedUse'"};
if (isNil '_antiTeleport') then {_antiTeleport = true;_varErr8 =true;};
if (_varErr8) then {diag_log "Your Config File is missing Variable  'antiTeleport'"};
if (isNil '_osLinux') then {_osLinux = false;_varErr9 =true;};
if (_varErr9) then {diag_log "Your Config File is missing Variable  'osLinux'"};

//Epoch
if (isNil '_gmEpoch') then {_gmEpoch = false;_varErr10 =true;};
if (_varErr10) then {diag_log "Your Config File is missing Variable  'gmEpoch'"};
//Evolved
if (isNil '_gmEvolve') then {_gmEvolve = false;_varErr11 =true;};
if (_varErr11) then {diag_log "Your Config File is missing Variable  'gmEvolve'"};

//Most of these only effect the players menu to give extra options.
//Zupa Single Currency
if (isNil '_ZSC') then {_ZSC = false;_varErr12 =true;};
if (_varErr12) then {diag_log "Your Config File is missing Variable  'ZSC'"};
//Plot 4 Life
if (isNil '_P4L') then {_P4L = false;_varErr13 =true;};
if (_varErr13) then {diag_log "Your Config File is missing Variable  'ZSC'"};



//Check Admins
	_puid = getPlayerUID player; 
	noxLowList = _LAdmins;	
	noxNormalList = _NAdmins; 
	noxSuperList = _SAdmins;
	noxAllAdmins = _LAdmins + _NAdmins + _SAdmins;

diag_log "Creating Menu";


//Scroll Code if selected
adminScrollCode = {

};

//###############//
adminGUICode = {

//Fill Shortcut Box
boxShortFill {

};

//Fill Player Box with Names > IDs
boxPlayerFill {
diag_log format ['boxPlayerFill'];
};

//Fill Central Box with Tools
boxAdminFill {
diag_log format ['boxAdminFill'];
};

//Init Admin Code > Create GUI
adminInit {
		if (isNil "adminGUI") then {adminGUI = {}};
		if (isNil "comT") then {comT = 0;};
		if (isNil "restartCount") then {restartCount = 180}
		_time = (restartCount-(round(serverTime / 60)));
		closeDialog 0;
		if !(dialog) then {createDialog "RscConfigEditor_Main";};
		disableSerialization;
		
if (adminGUI) then 
		{
		diag_log format ['GUI Loaded'];
		//Header Box
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0.4,0.2,1,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 1.6;
			_ctrl ctrlSetTextColor [0,1,0.52,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.04];
			if !(getPlayerUID player in noxAllAdmins) then {
			_ctrl ctrlSetText format["Noxsicarius Player Menu | Restart in: %1",_time];
			} else {
					_ctrl ctrlSetText format["Noxsicarius Admin Menu | Restart in: %1",_time];
				   };
			_ctrl ctrlSetForegroundColor [0.1,0.6,0.9,0];
			_ctrl ctrlCommit 0;
		
        //Admin Box		
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.465, safezoneY + 0.05, 1.445, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0.4,0,0,1];
			_ctrl ctrlCommit comT;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call adminDBClick2;"];
			call boxAdminFill;
		
		//Admin Box Players	
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.005, safezoneY + 0.05, (0.485)*0.7, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0.4,0,0,1];
			_ctrl ctrlCommit comT;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call adminDBClick1;"]; //Enable Spectate
			call boxPlayerFill;
			
		//Frame	
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlSetForegroundColor [0.1,0.6,0.9,0];
			_ctrl ctrlCommit comT;
		};	
};

//Player Menu EH
adminDBClick1 { //Player Spectate EH

};

//Admin Menu EH
adminDBClick2 { //Admin Toggle

};

};