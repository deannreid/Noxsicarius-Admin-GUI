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
_OpenMenuKey = 0x3C;    /* google DIK_KeyCodes (0x3C is F2) */
_isEpoch = true;

/*
 * Admin Configs
 */

_SAdmins = ["0","0","0"];
_NAdmins = ["0","0","0"];
_LAdmins = ["0","0","0"];

/*
 * Esc Menu Information
 */
_escMod = true;
_escTop = "Admin Tools V2 Dialog";
_escLowTop = "by";
_esclowBottom = "DeanReid";
_escColour = [0,0.5,1,0.1]; // for colours go here http://en.wikipedia.org/wiki/Web_colors Convert % to numbers e.g  [75% = 0.75]


/*
 * Logging
 */
_broadcastToolUse = true;
_majorLog = true;
_minorLog = true;
_unauthorisedUse = true;


/*
 * Basic Anti-Cheat
 */
 
 
/*
 * Bad Key Checks
 */
_keyKick = true;   //Kick users for pressing admin keys more than once.
_sideKick = false; //Kick users for using mic in side chat 
//#Don't Enable#/

/*
 * Hacker Checks
 */
_antiTeleport = true; //This will stop players from teleport hacking
_hackBoxCheck = true; //This will check for hackers who spawn boxes in
/*Don't Enable*/_cmdMenuClose = true; //This will check and close unauthorised CMD Menus 
/*Don't Enable*/_dialogClose = true;  //This will check and close unauthorised open dialogues
/*Don't Enable*/_actionCheck = false;  //This will check and close unauthorised mousewheel actions

/*Don't Enable*/_allowedDialogs = [-1,106,2200,6900,6901,6902,6903,420420,41144];
/*Don't Enable*/_allowedCmdMenus = [];
/*Don't Enable*/_allowedActions = [];

//////////////////////////////////////
//////Don't Edit Below This Line//////
//Unless you know what you are doing//
//////////////////////////////////////

//Insert Scripts Location Here


//Admin Tools
_admPBan  = ""; //Player Ban
_admPKick = ""; //Player Kick
_admPKill = ""; //Player Kill
_admSpec  = ""; //Plr Spectate

//Map Marker Stuff
_plrMarker = ""; //Player Marker
_corMarker = ""; //Corpse Marker
_wreMarker = ""; //Wreck Marker
_tntMarker = ""; //Tent Marker
_sfeMarker = ""; //Safe Marker
_pltMarker = ""; //Plot Marker
_vlMarker = ""; //Locked Vehicle Marker
_vulMarker = ""; // Unlocked Vehicle Marker

//Player Tools
_plrHeal  = ""; //Plr Heal
_plrHumP  = ""; //Plr Humanity Positive
_plrHumN  = ""; //Plr Humanity Negative
_plrTP2S  = ""; //Player Teleport to Self
_plrTP2   = ""; //Player Teleport to
_plrTPWM  = ""; //Player Teleport with Map
_plrSZ    = ""; //Player Safezone
_plrZS    = ""; //Zombie Shield
_plrUA    = ""; //Unlimited Ammo
_plrRR    = ""; //Player Remove Recoil
_plrGod   = ""; //God Mode
_plrCGod  = ""; //Car God
_plrRBL   = ""; //Remove Build Limit
_plr1SB   = ""; //1 Step Build
_plrRPP   = ""; //Remove Plot Pole Req
_plrROB   = ""; // Remove Overburden
_plrZsp   = ""; //Zombie Spawner
_plrNZA   = ""; //No Zed Aggro
_plrHarryPotter - ""; // Player Invisibility

//Vehicle Menu
_p2rp     = ""; // Point to repair (Perm)
_p2rt     = ""; // Point to repair (Temp)
_p2dp     = ""; // Point to delete (Perm)
_p2dt     = ""; // Point to delete (Temp)
_p2f      = ""; // Point to flip
_p2r      = ""; //Point to refuel

_vLock    = ""; //Lock Vehicle
_vUnlock  = ""; // Unlock Vehicle

_vSpawnT  = ""; //Spawn Temp Vehicle
_vSpawnP  = ""; //Spawn Perm Vehicle

//Weather/Time


//Crates
_prvWcrate   = ""; //Private Weapons/Ammo Crate
_prvIcrate   = ""; //Private Items Crate
_prvAIOcrate = ""; //Private AIO Crate
_prvBcrate   = ""; //Private Buildable Crate
_prvBPcrate  = ""; //Private Backpack Crate

_pubWcrate   = ""; //Public Weapons/Ammo Crate
_pubIcrate   = ""; //Public Items Crate
_pubAIOcrate = ""; //Public AIO Crate
_pubBcrate   = ""; //Public Buildable Crate
_pubBPcrate  = ""; //Public Backpack Crate


//Weapons/Items


//Skins
