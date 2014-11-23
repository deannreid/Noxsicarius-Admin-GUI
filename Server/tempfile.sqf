boxAdminFill {
noxadmin = [];
//Super Admin
superAdminMenu {
	noxadmin = noxadmin + ["-----------------Map Markers----------------",[]];		
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
	noxadmin = noxadmin + ["-----------------Teleport----------------",[]];		
	noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,[]];	
	noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,[]];	
	noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["-----------------Admin Tools----------------",[]];		
	noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,[]];	
	noxadmin = noxadmin + ["Ban Player",call compile preprocessFileLineNumbers _admPBan,[]];		
	noxadmin = noxadmin + ["Kill Player",call compile preprocessFileLineNumbers _admPKill,[]];	
	noxadmin = noxadmin + ["Remove Player Gear",call compile preprocessFileLineNumbers _admRPG,[]];	
	noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["-----------------Player Tools----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Vehicle Tools----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Crates----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Weather/Time----------------",[]];	
};
//Normal Admin
normalAdminMenu {
	noxadmin = noxadmin + ["-----------------Map Markers----------------",[]];		
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
	noxadmin = noxadmin + ["-----------------Teleport----------------",[]];		
	noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,[]];	
	noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,[]];	
	noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["-----------------Admin Tools----------------",[]];		
	noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,[]];	
	noxadmin = noxadmin + ["Kill Player",call compile preprocessFileLineNumbers _admPKill,[]];	
	noxadmin = noxadmin + ["Remove Player Gear",call compile preprocessFileLineNumbers _admRPG,[]];	
	noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["-----------------Player Tools----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Vehicle Tools----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Crates----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Weather/Time----------------",[]];	
	};
//Low Admin
lowAdminMenu {
	noxadmin = noxadmin + ["-----------------Map Markers----------------",[]];		
	noxadmin = noxadmin + ["Player Markers",call compile preprocessFileLineNumbers _plrMarker,[]];	
	noxadmin = noxadmin + ["Corpse Markers",call compile preprocessFileLineNumbers _corMarker,[]];		
	noxadmin = noxadmin + ["Wreck Markers",call compile preprocessFileLineNumbers _wreMarker,[]];	
	noxadmin = noxadmin + ["Tent Markers",call compile preprocessFileLineNumbers _tntMarker,[]];
	noxadmin = noxadmin + ["Vehicle Markers (Unlocked)",call compile preprocessFileLineNumbers _vulMarker,[]];	
	noxadmin = noxadmin + ["Vehicle Markers (Locked)",call compile preprocessFileLineNumbers _vlMarker,[]];	
	
	noxadmin = noxadmin + ["",[]];//Spacer to Keep it looking nice		
	noxadmin = noxadmin + ["-----------------Teleport----------------",[]];		
	noxadmin = noxadmin + ["Teleport to Player",call compile preprocessFileLineNumbers _plrTP2,[]];	
	noxadmin = noxadmin + ["Teleport Player to You",call compile preprocessFileLineNumbers _plrTP2S,[]];	
	noxadmin = noxadmin + ["Map Teleport",call compile preprocessFileLineNumbers _plrTPWM,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice	
	noxadmin = noxadmin + ["-----------------Admin Tools----------------",[]];		
	noxadmin = noxadmin + ["Kick Player",call compile preprocessFileLineNumbers _admPKick,[]];	
	noxadmin = noxadmin + ["Spectate Player",call compile preprocessFileLineNumbers _admSpec,[]];	
	
	noxadmin = noxadmin + ["","",[]];//Spacer to Keep it looking nice			
	noxadmin = noxadmin + ["-----------------Player Tools----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Vehicle Tools----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Crates----------------",[]];	
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
	noxadmin = noxadmin + ["-----------------Weather/Time----------------",[]];	
	};
};