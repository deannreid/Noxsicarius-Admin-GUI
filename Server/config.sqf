/*
 * Admin Tools V2 by NoxSicarius
 * GUI Design by DeanReid
 * 
 * Edit Configs below to your own use
 */ 
 
/*
 * General Configs
 */
_noxDLLPath = ""; //Empty = arma2oa dir
_OpenMenuKey = 0x3C;    /* google DIK_KeyCodes Default is F2*/
_isEpoch = true;
_debug = true; //Debug Mode
_restartTime = 180; //This will be used to add restart time to menu
/*
 * Admin Configs
 */

_SAdmins = ["76561198001768308","0","0"];
_NAdmins = ["0","0","0"];
_LAdmins = ["0","0","0"];

/*
 * Esc Menu Information
 * Don't use, Not Implemented Yet..
 */
 
 /*
_escMod = false;
_escTop = "Admin Tools V2 Dialog";
_escLowTop = "by";
_esclowBottom = "DeanReid";
_escColour = [0,0.5,1,0.1]; /*for colours go here http://en.wikipedia.org/wiki/Web_colors Convert % to numbers e.g  [75% = 0.75]*/
*/


/*
 * Logging
 */
_broadcastToolUse = true;
_majorLog = true;
_minorLog = true;
_unauthorisedUse = true;


//////////////////////////////////////
//////Don't Edit Below This Line//////
//Unless you know what you are doing//
//////////////////////////////////////

//Insert Scripts Location Here


//Admin Tools
_admPBan   = "\z\addons\dayz_server\admin\scripts\admintools"; //Player Ban
_admPKick  = "\z\addons\dayz_server\admin\scripts\admintools"; //Player Kick
_admPKill  = "\z\addons\dayz_server\admin\scripts\admintools"; //Player Kill
_admSpec   = "\z\addons\dayz_server\admin\scripts\admintools"; //Plr Spectate

//Map Marker Stuff
_plrMarker = "\z\addons\dayz_server\admin\scripts\mapmarkers"; //Player Marker
_corMarker = "\z\addons\dayz_server\admin\scripts\mapmarkers"; //Corpse Marker
_wreMarker = "\z\addons\dayz_server\admin\scripts\mapmarkers"; //Wreck Marker
_tntMarker = "\z\addons\dayz_server\admin\scripts\mapmarkers"; //Tent Marker
_sfeMarker = "\z\addons\dayz_server\admin\scripts\mapmarkers"; //Safe Marker
_pltMarker = "\z\addons\dayz_server\admin\scripts\mapmarkers"; //Plot Marker
_vlMarker  = "\z\addons\dayz_server\admin\scripts\mapmarkers"; //Locked Vehicle Marker
_vulMarker = "\z\addons\dayz_server\admin\scripts\mapmarkers"; // Unlocked Vehicle Marker

//Player Tools
_plrHeal   = "\z\addons\dayz_server\admin\scripts\playertools"; //Plr Heal
_plrHumP   = "\z\addons\dayz_server\admin\scripts\playertools"; //Plr Humanity Positive
_plrHumN   = "\z\addons\dayz_server\admin\scripts\playertools"; //Plr Humanity Negative
_plrTP2S   = "\z\addons\dayz_server\admin\scripts\playertools"; //Player Teleport to Self
_plrTP2    = "\z\addons\dayz_server\admin\scripts\playertools"; //Player Teleport to
_plrTPWM   = "\z\addons\dayz_server\admin\scripts\playertools"; //Player Teleport with Map
_plrSZ     = "\z\addons\dayz_server\admin\scripts\playertools"; //Player Safezone
_plrZS     = "\z\addons\dayz_server\admin\scripts\playertools"; //Zombie Shield
_plrUA     = "\z\addons\dayz_server\admin\scripts\playertools"; //Unlimited Ammo
_plrRR     = "\z\addons\dayz_server\admin\scripts\playertools"; //Player Remove Recoil
_plrGod    = "\z\addons\dayz_server\admin\scripts\playertools"; //God Mode
_plrCGod   = "\z\addons\dayz_server\admin\scripts\playertools"; //Car God
_plrRBL    = "\z\addons\dayz_server\admin\scripts\playertools"; //Remove Build Limit
_plr1SB    = "\z\addons\dayz_server\admin\scripts\playertools"; //1 Step Build
_plrRPP    = "\z\addons\dayz_server\admin\scripts\playertools"; //Remove Plot Pole Req
_plrROB    = "\z\addons\dayz_server\admin\scripts\playertools"; // Remove Overburden
_plrZsp    = "\z\addons\dayz_server\admin\scripts\playertools"; //Zombie Spawner
_plrNZA    = "\z\addons\dayz_server\admin\scripts\playertools"; //No Zed Aggro
_plrHarryPotter = "\z\addons\dayz_server\admin\scripts\playertools"; // Player Invisibility

//Vehicle Menu
_p2rp      = "\z\addons\dayz_server\admin\scripts\vehicletools"; // Point to repair (Perm)
_p2rt      = "\z\addons\dayz_server\admin\scripts\vehicletools"; // Point to repair (Temp)
_p2dp      = "\z\addons\dayz_server\admin\scripts\vehicletools"; // Point to delete (Perm)
_p2dt      = "\z\addons\dayz_server\admin\scripts\vehicletools"; // Point to delete (Temp)
_p2f       = "\z\addons\dayz_server\admin\scripts\vehicletools"; // Point to flip
_p2r       = "\z\addons\dayz_server\admin\scripts\vehicletools"; //Point to refuel

_vLock     = "\z\addons\dayz_server\admin\scripts\vehicletools"; //Lock Vehicle
_vUnlock   = "\z\addons\dayz_server\admin\scripts\vehicletools"; // Unlock Vehicle

_vSpawnT   = "\z\addons\dayz_server\admin"; //Spawn Temp Vehicle
_vSpawnP   = "\z\addons\dayz_server\admin"; //Spawn Perm Vehicle

//Crates
_prvWcrate   = "\z\addons\dayz_server\admin"; //Private Weapons/Ammo Crate
_prvIcrate   = "\z\addons\dayz_server\admin"; //Private Items Crate
_prvAIOcrate = "\z\addons\dayz_server\admin"; //Private AIO Crate
_prvBcrate   = "\z\addons\dayz_server\admin"; //Private Buildable Crate
_prvBPcrate  = "\z\addons\dayz_server\admin"; //Private Backpack Crate

_pubWcrate   = "\z\addons\dayz_server\admin"; //Public Weapons/Ammo Crate
_pubIcrate   = "\z\addons\dayz_server\admin"; //Public Items Crate
_pubAIOcrate = "\z\addons\dayz_server\admin"; //Public AIO Crate
_pubBcrate   = "\z\addons\dayz_server\admin"; //Public Buildable Crate
_pubBPcrate  = "\z\addons\dayz_server\admin"; //Public Backpack Crate