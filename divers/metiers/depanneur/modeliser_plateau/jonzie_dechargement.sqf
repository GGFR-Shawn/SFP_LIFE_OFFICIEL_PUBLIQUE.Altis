_truck = _this select 0;
_truck setVariable ["Car_Loaded", 0.5, TRUE];

_towpoint = "Land_HelipadEmpty_F" createVehicleLocal (getpos _truck);
_towpoint attachTo [_truck,[0,0,3],"attach"];
_towing = (getpos _towpoint) nearestObject "Car_F";
deleteVehicle _towpoint;
if (isServer) then {[_truck, _towing] call Jonzie_fnc_giveOwner;};

_pushdown = true;
_roleoff = true;
_distance = 0;
_Edistance = 0;
_height = 0;
_Eheight = 0;
_angle = - ((_truck animationPhase "lift") / 10);
_Supported_Vehicles = ["Jonzie_Datsun_Z432","Jonzie_Ceed","Jonzie_Datsun_510","Jonzie_Corolla","Jonzie_Volvo_242","Jonzie_Highway","Jonzie_VE","Jonzie_30CSL","Jonzie_STI","Jonzie_Galant","Jonzie_Mini_Cooper","Jonzie_Mini_Cooper_R_spec","Jonzie_Ute","Jonzie_Car_Crash","Jonzie_Ambulance","Jonzie_Forklift","Jonzie_Viper","Jonzie_Escalade","Jonzie_Raptor","Jonzie_Transit","Jonzie_Quattroporte","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F", "O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","C_Kart_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Offroad_01_F","B_G_Offroad_01_F","I_Quadbike_01_F","C_Quadbike_01_F","O_Quadbike_01_F","B_G_Quadbike_01_F","B_Quadbike_01_F","I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","C_SUV_01_F","C_Van_01_transport_F","B_G_Van_01_transport_F","C_Van_01_box_F"];
if !((typeOf _towing) in _Supported_Vehicles) then 
{
	_height = _height + 1.3;
	_distance = _distance - 0;
	_Edistance = _distance - 8.5;
	_Eheight = _height - 1;
};

_type = typeOf _towing;
switch (_type) do
{
	case "Jonzie_Datsun_Z432": {_height = _height + 1.5;_distance = _distance - 0;_Edistance = _distance - 5.5;_Eheight = _height - 1;};		
	case "Jonzie_Ceed": {_height = _height + 1.64;_distance = _distance - 0;_Edistance = _distance - 5.4;_Eheight = _height - 1;};		
	case "Jonzie_Datsun_510": {_height = _height + 0;_distance = _distance - 0;_Edistance = _distance - 5.5;_Eheight = _height - 1;};	
	case "Jonzie_Corolla": {_height = _height + 0.97;_distance = _distance - 0;_Edistance = _distance - 5.4;_Eheight = _height - 1;};		
	case "Jonzie_30CSL": {_height = _height + 1.5;_distance = _distance - 0;_Edistance = _distance - 5.5;_Eheight = _height - 1;};		
	case "Jonzie_Highway": {_height = _height + 0.1;_distance = _distance - 0;_Edistance = _distance - 5.8;_Eheight = _height - 1.5;};
	case "Jonzie_VE": {_height = _height + 0.1;_distance = _distance - 0;_Edistance = _distance - 5.8;_Eheight = _height - 1.5;};			
	case "Jonzie_Galant": {_height = _height + 1.55;_distance = _distance - 0;_Edistance = _distance - 4.8;_Eheight = _height - 1;};	
	case "Jonzie_Mini_Cooper": {_height = _height + 1.5;_distance = _distance - 0;_Edistance = _distance - 3.5;_Eheight = _height - 1;};	
	case "Jonzie_Mini_Cooper_R_spec": {_height = _height + 1.5;_distance = _distance - 0;_Edistance = _distance - 3.5;_Eheight = _height - 1;};	
	case "Jonzie_Ute": {_height = _height + 0.1;_distance = _distance - 0;_Edistance = _distance - 5.8;_Eheight = _height - 1.5;};
	case "Jonzie_Ambulance": {_height = _height - 0.2;_distance = _distance - 0.2;_Edistance = _distance -6.2;_Eheight = _height - 0.8;};
	case "Jonzie_Forklift": {_height = _height - 0.25;_distance = _distance - 0.15;_Edistance = _distance -5.0;_Eheight = _height - 1.3;};
	case "Jonzie_Viper": {_height = _height + 0.1;_distance = _distance - 0;_Edistance = _distance - 5.5;_Eheight = _height - 1.5;};
	case "Jonzie_Escalade": {_height = _height + 0.3;_distance = _distance - 0;_Edistance = _distance - 6.5;_Eheight = _height - 1.5;};
	case "Jonzie_Raptor": {_height = _height + 0.51;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "Jonzie_Transit": {_height = _height + 0.34;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "Jonzie_Quattroporte": {_height = _height + 1.53;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "C_Hatchback_01_F": {_height = _height + 1.35;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "C_Hatchback_01_sport_F": {_height = _height + 1.35;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "B_MRAP_01_F": {_height = _height + 2;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "B_MRAP_01_gmg_F": {_height = _height + 2;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "B_MRAP_01_hmg_F": {_height = _height + 2;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "O_MRAP_02_F": {_height = _height + 2.3;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "O_MRAP_02_gmg_F": {_height = _height + 2.3;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "O_MRAP_02_hmg_F": {_height = _height + 2.3;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "C_Kart_01_F": {_height = _height + 1.05;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "C_Kart_01_Blu_F": {_height = _height + 1.05;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "C_Kart_01_Fuel_F": {_height = _height + 1.05;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "C_Kart_01_Red_F": {_height = _height + 1.05;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "C_Kart_01_Vrana_F": {_height = _height + 1.05;_distance = _distance - 0;_Edistance = _distance - 5.0;_Eheight = _height - 1.5;};
	case "C_Offroad_01_F": {_height = _height + 1.55;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "B_G_Offroad_01_F": {_height = _height + 1.55;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "I_Quadbike_01_F": {_height = _height + 1.4;_distance = _distance - 0;_Edistance = _distance - 4.5;_Eheight = _height - 1.5;};
	case "C_Quadbike_01_F": {_height = _height + 1.4;_distance = _distance - 0;_Edistance = _distance - 4.5;_Eheight = _height - 1.5;};
	case "O_Quadbike_01_F": {_height = _height + 1.4;_distance = _distance - 0;_Edistance = _distance - 4.5;_Eheight = _height - 1.5;};
	case "B_G_Quadbike_01_F": {_height = _height + 1.4;_distance = _distance - 0;_Edistance = _distance - 4.5;_Eheight = _height - 1.5;};
	case "B_Quadbike_01_F": {_height = _height + 1.4;_distance = _distance - 0;_Edistance = _distance - 4.5;_Eheight = _height - 1.5;};
	case "I_MRAP_03_F": {_height = _height + 1.65;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "I_MRAP_03_gmg_F": {_height = _height + 1.65;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "I_MRAP_03_hmg_F": {_height = _height + 1.65;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "C_SUV_01_F": {_height = _height + 1.45;_distance = _distance - 0;_Edistance = _distance - 6.0;_Eheight = _height - 1.5;};
	case "C_Van_01_transport_F": {_height = _height + 1.7;_distance = _distance - 0;_Edistance = _distance - 5.5;_Eheight = _height - 1.5;};
	case "B_G_Van_01_transport_F": {_height = _height + 1.7;_distance = _distance - 0;_Edistance = _distance - 5.5;_Eheight = _height - 1.5;};
	case "C_Van_01_box_F": {_height = _height + 1.7;_distance = _distance - 0;_Edistance = _distance - 5.5;_Eheight = _height - 1.5;};
};
	
_towing setPos getPos _towing;
_towingmass = getMass _towing;
_truckmass = getMass _truck;
_totalmass = _truckmass - _towingmass;
_truck setMass [_totalmass,17];
_Fuel_lvl = fuel _truck;
_truck setFuel 0;
while {_pushdown} do
{
	waitUntil {_truck animationPhase "slide" == -4.5};
	_towing attachTo [_truck,[0,_distance,_height],"attach"];
	_distance = _distance - 0.01;
	_height = _height - 0.002818;
	if (_distance <= -2.2) then {_pushdown = false;};
	sleep 0.01;
};

_angle = - ((_truck animationPhase "lift") / 10);
while {_roleoff} do
{
	waitUntil {_truck animationPhase "slide" == -4.5};
	_towing attachTo [_truck,[0,_distance,_height],"attach"];
	_towing setvectorUp [0,_angle,1];
	If (_distance >= _Edistance) then {_distance = _distance - 0.01;};
	If (_height >= _Eheight) then {_height = _height - 0.001452;};
	If (_angle < 0) then {_angle = _angle + 0.000846; sleep 0.01;};
	If (_distance <= _Edistance) then {_roleoff = false;};
	sleep 0.01;
};

detach _towing;
sleep 1;
// _towing setPos getPos _towing;
// _towing setVelocity [0, 0, 1];
// [[_towing,0], "lock", true, true] call BIS_fnc_MP;
// sleep 1;
_towing setPos getPos _towing;
_towing setVelocity [0, 0, 1];
_truck setFuel _Fuel_lvl;
_truck setVariable ["Car_Loaded", 0, TRUE];