// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil "demarrage_scan_marqueur_dir") exitwith {};
demarrage_scan_marqueur_dir = true;
_type_a_scanner = ["C_Van_01_transport_Depannage_F","O_Heli_Light_Depanneur_SFP","SFP_MASTER","Offroad_01_depanneur_sfp","B_Truck_01_mover_F_Depanneur_SFP","SFP_Depanneur_mantgs","Jonzie_Tow_Truck_SFP"];
_marqueur_depanneur = [];

_creation_marqueur_dir =
{
	_le_vehicule_sfp = _this select 0;
	if (isnil "_le_vehicule_sfp") exitwith {};
	
	_marker = createMarkerLocal [typeof _le_vehicule_sfp, position _le_vehicule_sfp];
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTextLocal format ["Véhicule DIR : %1.", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_sfp >> "displayName")];
	
	while {!isnil "_le_vehicule_sfp"} do
	{
		_marker setMarkerPoslocal (position _le_vehicule_sfp);
		sleep (1 + random 3);
	};
	
	deleteMarkerLocal _marker;
};

while {true} do
{
	{
		if (typeof _x in _type_a_scanner && alive _x && !(_x in _marqueur_depanneur)) then
		{
			_marqueur_depanneur pushback _x;
			_marqueur_depanneur = _marqueur_depanneur - [objNull];
			
			[_x] spawn _creation_marqueur_dir;
		};
	} foreach vehicles;
	
	sleep 6;
};	
