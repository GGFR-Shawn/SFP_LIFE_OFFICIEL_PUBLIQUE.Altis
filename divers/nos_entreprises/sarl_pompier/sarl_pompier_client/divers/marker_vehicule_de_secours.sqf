// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil "demarrage_scan_marqueur_pompier") exitwith {};
demarrage_scan_marqueur_pompier = true;
_marqueur_pompiers = [];

_creation_marqueur_pompiers =
{
	_le_vehicule_sfp = _this select 0;
	if (isnil "_le_vehicule_sfp") exitwith {};

	_marker = createMarkerLocal [typeof _le_vehicule_sfp, position _le_vehicule_sfp];
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTextLocal format ["Véhicule secours : %1.", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_sfp >> "displayName")];

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
		if (typeof _x in sfp_config_listes_des_vehicules_pompiers && alive _x && !(_x in _marqueur_pompiers)) then
		{
			_marqueur_pompiers pushback _x;
			_marqueur_pompiers = _marqueur_pompiers - [objNull];
			
			[_x] spawn _creation_marqueur_pompiers;
		};
	} foreach vehicles;
	
	sleep 6;
};	
