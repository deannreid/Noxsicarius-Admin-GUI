/*
 * Variable Check 
 */ 
if (isNil '_OpenMenuKey') then {_OpenMenuKey = 0x3C;_varErr =true;};
if (isNil '_LAdmins') then {_LAdmins = [];_varErr =true;};
if (isNil '_adminGUI') then {_adminGUI = true;_varErr =true;};
if (isNil '_NAdmins') then {_NAdmins = [];_varErr =true;};
if (isNil '_SAdmins') then {_SAdmins = [];_varErr =true;};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;_varErr =true;};
if (isNil '_majorLog') then {_majorLog = true;_varErr =true;};
if (isNil '_minorLog') then {_minorLog = true;_varErr =true;};
if (isNil '_unauthorisedUse') then {_unauthorisedUse = true;_varErr =true;};
if (isNil '_antiTeleport') then {_antiTeleport = true;_varErr =true;};
if (isNil '_broadcastToolUse') then {_broadcastToolUse = true;_varErr =true;};
if (_varErr) then {diag_log "Your Config File is missing Variables"}

//Check Admins
	_puid = getPlayerUID player; 
	noxLowList = _LAdmins;	
	noxNormalList = _NAdmins; 
	noxSuperList = _SAdmins;
	noxAllAdmins = _LAdmins + _NAdmins + _SAdmins;

/*
 * KeyBinds
 */
	adminKeybind {
		private ['_key'];
			_key = _this select 1;
				if (_key == ("+str _OpenMenuKey+")) then {call adminInit;};
	};

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

};

//Fill Central Box with Tools
boxAdminFill {

};

//Init Admin Code > Create GUI
adminInit {
		if (isNil "adminGUI") then {adminGUI = {}};
		if (isNil "commitC") then {commitC = 0;};
		if (isNil "restartCount") then {restartCount = 180}
		_time = (restartCount-(round(serverTime / 60)));
		closeDialog 0;
		if !(dialog) then {createDialog "RscConfigEditor_Main";};
		disableSerialization;
		
if (adminGUI) then 
		{
		//Header Box
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0.4,0.2,1,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 1.6;
			_ctrl ctrlSetTextColor [0,1,0.52,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.04];
			_ctrl ctrlSetText format["N Admin Menu | Restart in: %1",_time];
			_ctrl ctrlSetForegroundColor [0.1,0.6,0.9,0];
			_ctrl ctrlCommit 0;
		
        //Admin Box		
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.465, safezoneY + 0.05, 1.445, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0.4,0,0,1];
			_ctrl ctrlCommit commitC;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call adminDBClick2;"];
			call admin_filllist;
		
		//Admin Box Players	
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.005, safezoneY + 0.05, (0.485)*0.7, (safeZoneH - 0.10)*0.758];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlSetForegroundColor [0.4,0,0,1];
			_ctrl ctrlCommit commitC;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call adminDBClick1;"]; //Enable Spectate
			call admin_fillplr;
			
		//Frame	
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlSetForegroundColor [0.1,0.6,0.9,0];
			_ctrl ctrlCommit commitC;
		};	
};

//Player Menu EH
adminDBClick1 {

};

//Admin Menu EH
adminDBClick2 {

};

};