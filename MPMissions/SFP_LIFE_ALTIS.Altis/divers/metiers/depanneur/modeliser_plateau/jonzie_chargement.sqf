private ["_truck", "_towpoint", "_towing", "_distance", "_height", "_angle", "_roleon", "_pullup", "_traytilt", "_unload", "_type", "_stablecar", "_stablize"];

_truck = _this select 0;

_towpoint = "Land_HelipadEmpty_F" createVehicleLocal (getpos _truck);
_towpoint attachTo [_truck,[0,0,0],"attach"];
_towing = (getpos _towpoint) nearestObject "Car_F";
deleteVehicle _towpoint;
_truckdir = getDir _truck;
_cardir = getDir _towing;


if ((getPos _truck) distance (getPos _towing) > 15) exitWith {titleText ["Aucuns véhicules trouvés, approchez vous plus", "PLAIN DOWN"];};
if ((_cardir + 20) <= _truckdir) exitWith  {titleText ["Véhicule non aligné correctement", "PLAIN DOWN"];};
if ((_cardir - 20) >= _truckdir) exitWith  {titleText ["Véhicule non aligné correctement", "PLAIN DOWN"];};
if ((_truck animationPhase "slide") != -4.5) exitWith {titleText ["Abaisser la rampe au sol", "PLAIN DOWN"];};
if ((_towpoint distance _towing) <= 2) exitWith {titleText ["Trop loin pour remorquer", "PLAIN DOWN"];};
if(not (_towing isKindOf "Car_F")) exitWith {titleText ["Véhicule non supporté", "PLAIN DOWN"];}; 
if (_truck == _towing) exitWith {titleText ["Aucune voiture trouvée, Trop loin du véhicule", "PLAIN DOWN"];};
_truck setVariable ["Car_Loaded", 0.5, TRUE];
{unassignVehicle _x;_x action ["EJECT", vehicle _x];sleep 0.4;} foreach crew _towing;

[[_towing,2], "lock", true, true] call BIS_fnc_MP;
sleep 0.5;
[_truck, _towing] remoteExecCall ["Jonzie_fnc_giveOwner", 2];

_distance = 0;
_height = 0;
_angle = 0;

_towing attachTo [_truck,[0,_distance,_height],"attach"];
_towing setvectorUp [0,_angle,1];
_towingmass = getMass _towing;
_truckmass = getMass _truck;
_totalmass = _towingmass + _truckmass;
_truck setMass [_totalmass,17];
_roleon = true;
_pullup = true;
_traytilt = true;
_unload = false;
_pushdown = true;
_roleoff = true;
_Edistance = 0;
_Fuel_lvl = fuel _truck;
_truck setFuel 0;
_truck setVariable ["Ramp_Lock", 1, TRUE];
_Supported_Vehicles = ["Jonzie_Datsun_Z432","Jonzie_Ceed","Jonzie_Datsun_510","Jonzie_Corolla","Jonzie_Volvo_242","Jonzie_Highway","Jonzie_VE","Jonzie_30CSL","Jonzie_STI","Jonzie_Galant","Jonzie_Mini_Cooper","Jonzie_Mini_Cooper_R_spec","Jonzie_Ute","Jonzie_Car_Crash","Jonzie_Ambulance","Jonzie_Forklift","Jonzie_Viper","Jonzie_Escalade","Jonzie_Raptor","Jonzie_Transit","Jonzie_Quattroporte","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F", "O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","C_Kart_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Offroad_01_F","B_G_Offroad_01_F","I_Quadbike_01_F","C_Quadbike_01_F","O_Quadbike_01_F","B_G_Quadbike_01_F","B_Quadbike_01_F","I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","C_SUV_01_F","C_Van_01_transport_F","B_G_Van_01_transport_F","C_Van_01_box_F"];
if !((typeOf _towing) in _Supported_Vehicles) then 
{
	_height = _height + 0.4;
	_distance = _distance - 6.5;
	titleText ["Vehicule non supporte d origine ...", "PLAIN DOWN"];
};

_type = typeOf _towing;
switch (_type) do
	{
		case "Jonzie_Datsun_Z432": {_height = _height + 0.4;_distance = _distance -5.5;};		
		case "Jonzie_Ceed": {_height = _height + 0.54;_distance = _distance -5.5;};		
		case "Jonzie_Datsun_510": {_height = _height -1.05;_distance = _distance -5.5;};		
		case "Jonzie_Corolla": {_height = _height - 0.13;_distance = _distance -5.5;};		
		case "Jonzie_Volvo_242": {_height = _height -1.09;_distance = _distance -5.5;};
		case "Jonzie_Highway": {_height = _height -1.09;_distance = _distance -5.5;};
		case "Jonzie_VE": {_height = _height -1.09;_distance = _distance -5.5;};				
		case "Jonzie_30CSL": {_height = _height + 0.4;_distance = _distance -5.5;};		
		case "Jonzie_STI": {_height = _height -1.08;_distance = _distance -5.5;};
		case "Jonzie_Galant": {_height = _height + 0.45;_distance = _distance -5.5;};
		case "Jonzie_Mini_Cooper": {_height = _height + 0.45;_distance = _distance -5.5;};
		case "Jonzie_Mini_Cooper_R_spec": {_height = _height + 0.45;_distance = _distance -5.5;};
		case "Jonzie_Ute": {_height = _height -1;_distance = _distance -5.5;};
		case "Jonzie_Car_Crash": {_height = _height + -1.1;_distance = _distance -5.5;};
		case "Jonzie_Ambulance": {_height = _height -1.2;_distance = _distance -5.5;};
		case "Jonzie_Forklift": {_height = _height -0.9;_distance = _distance -4;};	
		case "Jonzie_Viper": {_height = _height - 1.0;_distance = _distance -5.5;};
		case "Jonzie_Escalade": {_height = _height -0.8;_distance = _distance -5.5;};
		case "Jonzie_Raptor": {_height = _height -0.59;_distance = _distance -5.5;};
		case "Jonzie_Transit": {_height = _height -0.76;_distance = _distance -5.5;};
		case "Jonzie_Quattroporte": {_height = _height + 0.43;_distance = _distance -5.5;};
		case "C_Hatchback_01_F": {_height = _height + 0.25;_distance = _distance -5.5;};
		case "C_Hatchback_01_sport_F": {_height = _height + 0.25;_distance = _distance -5.5;};
		case "B_MRAP_01_F": {_height = _height + 0.6;_distance = _distance -5.5;_Edistance = _Edistance + 1;};
		case "B_MRAP_01_gmg_F": {_height = _height + 0.6;_distance = _distance -5.5;_Edistance = _Edistance + 1;};
		case "B_MRAP_01_hmg_F": {_height = _height + 0.6;_distance = _distance -5.5;_Edistance = _Edistance + 1;};
		case "O_MRAP_02_F": {_height = _height + 0.9;_distance = _distance -5.5;_Edistance = _Edistance + 1;};
		case "O_MRAP_02_gmg_F": {_height = _height + 0.9;_distance = _distance -5.5;_Edistance = _Edistance + 1;};
		case "O_MRAP_02_hmg_F": {_height = _height + 0.9;_distance = _distance -5.5;_Edistance = _Edistance + 1;};
		case "C_Kart_01_F": {_height = _height -0.05;_distance = _distance -5.5;};
		case "C_Kart_01_Blu_F": {_height = _height -0.05;_distance = _distance -5.5;};	
		case "C_Kart_01_Fuel_F": {_height = _height -0.05;_distance = _distance -5.5;};	
		case "C_Kart_01_Red_F": {_height = _height -0.05;_distance = _distance -5.5;};	
		case "C_Kart_01_Vrana_F": {_height = _height -0.05;_distance = _distance -5.5;};	
		case "C_Offroad_01_F": {_height = _height + 0.45;_distance = _distance -5.5;};	
		case "B_G_Offroad_01_F": {_height = _height + 0.45;_distance = _distance -5.5;};	
		case "I_Quadbike_01_F": {_height = _height + 0.3;_distance = _distance -5.5;};	
		case "C_Quadbike_01_F": {_height = _height + 0.3;_distance = _distance -5.5;};		
		case "O_Quadbike_01_F": {_height = _height + 0.3;_distance = _distance -5.5;};		
		case "B_G_Quadbike_01_F": {_height = _height + 0.3;_distance = _distance -5.5;};		
		case "B_Quadbike_01_F": {_height = _height + 0.3;_distance = _distance -5.5;};
		case "I_MRAP_03_F": {_height = _height + 0.55;_distance = _distance -5.5;};
		case "I_MRAP_03_gmg_F": {_height = _height + 0.55;_distance = _distance -5.5;};
		case "I_MRAP_03_hmg_F": {_height = _height + 0.55;_distance = _distance -5.5;};	
		case "C_SUV_01_F": {_height = _height + 0.35;_distance = _distance -5.5;};	
		case "C_Van_01_transport_F": {_height = _height + 0.6;_distance = _distance -5.5;};	
		case "B_G_Van_01_transport_F": {_height = _height + 0.6;_distance = _distance -5.5;};	
		case "C_Van_01_box_F": {_height = _height + 0.6;_distance = _distance -5.5;};																					
	};	

while {_roleon} do
	{
	waitUntil {_truck animationPhase "slide" == -4.5};
	_towing attachTo [_truck,[0,_distance,_height],"attach"];
	_towing setvectorUp [0,_angle,1];
	_distance = _distance + 0.01;
	_height = _height + 0.001452;
	_angle = _angle - 0.000846;
	If (_angle <= -0.28) then {_roleon = false; _stablize = true; [_towing,_truck] execVM "\Jonzie_Code\functions\Tow_Truck\stable.sqf";};
	sleep 0.01;
	};
	
while {_pullup} do
	{
	waitUntil {_truck animationPhase "slide" == -4.5};
	_towing attachTo [_truck,[0,_distance,_height],"attach"];
	_distance = _distance + 0.01;
	_height = _height + 0.002818;
	if (_distance >= _Edistance) then {_pullup = false;};
	sleep 0.01;
	};
_towing setPos getPos _towing;
_truck setFuel _Fuel_lvl;
_truck setVariable ["Ramp_Lock", 0, TRUE];
_truck setVariable ["Car_Loaded", 1, TRUE];