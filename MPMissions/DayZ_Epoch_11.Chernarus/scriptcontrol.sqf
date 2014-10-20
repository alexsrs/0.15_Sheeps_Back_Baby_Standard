//Script Control - Allows you to customize the repack by turning certain scripts on or off - true = on /false = off

// DayZ Epoch config
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
spawnShoremode = 0;
spawnArea= 1500; // Default = 1500

MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 500; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 30; // Default = 30 

dayz_fullMoonNights = true;

dayz_spawnselection = 0;
dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = true; // Default: False

DZE_requireplot = 1;
DZE_teleport = [14000,14000,14000,14000,14000];
DZE_StaticConstructionCount = 1;
DZE_FriendlySaving = true;
DZE_TRADER_SPAWNMODE = false;
DZE_DeathMsgGlobal = true;
DZE_DeathMsgTitleText = true;
DZE_DeathMsgSide = true;
DZE_BackpackGuard = false; //Default = true, true to enable, false to disable - wipes backpack on combat/ALT+F4 logging
DZE_ForceNameTagsOff = false;
DZE_R3F_WEIGHT = false; //use weight system
DZE_PlotPole = [100,115];	
DZE_BuildingLimit = 400;//how many items can a player build
DZE_PlayerZed = false; // should players have chance of becoming a ZOMBIE when they respawn after death
DZE_LootSpawnTimer = 10;// in minutes
DZE_MissionLootTable = true; //Custom Loot Tables
DZE_ConfigTrader = true;//Config based traders
DZE_selfTransfuse = true; //Self blood bag
DZE_selfTransfuse_Values = [
6000, //Blood amount
 10,  // Chance of Infection
300 //Cooldown Timer
];

DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["VaultStorageLocked"]
DZE_curPitch = 45; //Starting rotation angle. Only 1, 5, 45, or 90.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Admin Build (Add all SuperAdmins/Admins)
WG_adminBuild = [
"11111111111",
"76561198087015545"
];//Manage Doors Admins
DoorAdminList = [
"11111111111",
"76561198087015545"
];

//Super Admins
SuperAdminList = [
"111111111", // <Your In-Game Name here>
"76561198087015545" // <S-Admin In-Game Name>
];
//Admins
AdminList = [
"999999999", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
//Mods
ModList = [
"999999999", // <Moderator In-Game Name>
"999999999" // <Moderator In-Game Name>
];

//set adminlist to be all admins
AdminList = AdminList + SuperAdminList; // DONT CHANGE!!!

//////////////////////SCRIPTS////////////////////

//Door Mangement

AllowManualCode = true;// 2 reason| 1: Allows breaking codes (if 2nd config = false and code = 3 digits) | 2: Friends can access access not owned doors until owner gets on.
HarderPenalty = true;// Cen's Penalty: Flashes screen white. And kicks player to lobby if failed more then (random number between 4 and 14) times.
DZE_DoorsLocked = ["Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallDoorLocked_DZ","CinderWallDoorSmallLocked_DZ"];

//EVR Blowout
ns_blowout = true; // true / false
ns_blowout_dayz = true;// true / false
ns_blow_delaymod = 0.74; //blowout delay
ns_blow_itemapsi = "NVGoggles"; //ItemAPSI replacement
ns_blow_playerdamage = 4000; // damage players without ns_blow_itemapsi can get per blowout
ns_blow_emp = false; //Namalsk Only



//Server watermark
WaterMarkScript = true; //Watermark on/off
server_name = "0.15 - Sheeps Back Baby!"; //Watermark Text

//Welcome Credits
ServerWelcomeCreditsScript = true;
//Admin Tools
AdmintoolsScript = true;
//Debug Monitor
DebugMonitorScript = true;
//deploy Bike
DeployBikeScript = true;
//Burn Tents
BurnTentsScript = true;
//Crafting
craftingScript = true;
//Suicide
SuicideScript = true;
//Binocular Fog
BinocularScript = true;
//Carepackage on self
carepackageSELFScript = true;
//Carepackage on map
carepackageMAPScript = true;
//Sirens
SirenScript = true;
//Animate MV22 wings
AnimateMV22script = true;
//Animate SUV Hatch
AnimateSUVscript = true;
//Nitro
NOSScript = true;
//Regen Blood
RegenBloodScript = true;
//Fast Rope
FastropeScript = true;
//Safezones
SafezoneScripts = true;
//Harvest Hemp
HarvestHempScript = true;
//DZGM (Group Management)
DZGMScript = true;
//Drink Water
DrinkWaterScript = true;
//Tent Sleep Healing
TentHealScript = true;
//Arrest
ArrestScript = true;
//Trade from Vehicles
TradeFromVehicleScript = true;
//Elevator
ElevatorScript = true;
ELE_MaxRange = 100; // maximum range the elevator can travel / stop points can be built (in meter)
ELE_Speed = 5; // speed of the elevator (meters per second)
ELE_StopWaitTime = 0; // disable the wait time if you call the elevator
ELE_RequiredBuildTools = ["ItemToolbox", "ItemCrowbar"]; // required tools for building an elevator and elevator stop
ELE_RequiredBuildItems = [["PartGeneric",4], "PartEngine", "ItemGenerator", "ItemJerrycan"]; // required items to build an elevator
ELE_RequiredBuildStopItems = [["PartGeneric",4]]; // required items to build an elevator stop
ELE_StopClass = "MetalFloor_Preview_DZ";
