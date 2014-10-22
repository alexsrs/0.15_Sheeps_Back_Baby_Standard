/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
//Load Configs
call compile preprocessFileLineNumbers "scriptcontrol.sqf";

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];


//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "fixes\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "fixes\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "fixes\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
call compile preprocessFileLineNumbers "admintools\AdminList.sqf"; // Epoch admin Tools variables/UIDs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	if ( !((getPlayerUID player) in AdminList) && !((getPlayerUID player) in ModList)) then {
		  [] execVM "admintools\antihack\antihack.sqf"; // Epoch Antihack with bypass
	};
	//Lights
	if (LightScript) then{
		[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	};
	
	_nil =  execVM "scripts\VASP\VASP_init.sqf";
	
	//Right Click Actions
	call compile preprocessFileLineNumbers "scripts\click_actions\init.sqf";
	//Safezone
	if (SafezoneScripts) then {
		//Community Safezones
		execVM "scripts\CAGN\initiate.sqf";	
	};
		//DZGM
	if (DZGMScript) then {
		execVM "scripts\dzgm\init.sqf";
	};
	if (TradeFromVehicleScript) then {
	ExecVM "scripts\TradeFromVehicle Version 2.0\setup\init.sqf";
	};
	if (ElevatorScript) then{
		["elevator"] execVM "scripts\elevator\elevator_init.sqf";
	};
	//DZAI Client
	if (DZAIClientScript) then{
	_nul = [] execVM "DZAI_Client\dzai_initclient.sqf";
	};
};

#include "\z\addons\dayz_code\system\REsec.sqf"

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
//EVR Blow out
if(EVRScript)then{
if (isServer) then { _bul = [ns_blow_emp] execVM "scripts\blowout\module\blowout_server.sqf"; };
if (!isDedicated) then { _bul = [] execVM "scripts\blowout\module\blowout_client.sqf"; };
};

//Debug Monitor
if(DebugMonitorScript)then{
debugMonitor = true;//default on
	if (!isDedicated) then {
		execVM "scripts\DebugMonitor\debug_monitor.sqf";
	};
};
if(HarvestHempScript)then{
	if (isServer) then {
	//Hemp
	execVM "scripts\HarvestHemp\randomweedfarm.sqf";
	};
};
	//DayZ Watermark
if(WaterMarkScript)then{
	if (!isNil "server_name") then {
	  [] spawn {
		  waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		  waituntil {!(isNull (findDisplay 46))};
		  5 cutRsc ["wm_disp","PLAIN"];
		  ((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText server_name;
	  };
	};
};
if(FastropeScript)then{
	_fast_roping = [] execVM "scripts\Fastrope\BTC_fast_roping_init.sqf";
};
if(RegenBloodScript)then{
	//Regen Blood
	 execVM "scripts\RegenBlood\regenblood.sqf";
};
if(ServerWelcomeCreditsScript)then{
	//Welcome Credits
	 execVM "scripts\ServerWelcomeCredits.sqf";
};
//ESS
espawn = compile preprocessFileLineNumbers "scripts\spawn\spawn.sqf";
waitUntil {!isNil "PVDZE_plr_LoginRecord"};
if (!isDedicated && (dayzPlayerLogin2 select 2)) then {[] spawn espawn;};

//Admin Tools
if(AdmintoolsScript)then{
	[] execVM "admintools\Activate.sqf";
};