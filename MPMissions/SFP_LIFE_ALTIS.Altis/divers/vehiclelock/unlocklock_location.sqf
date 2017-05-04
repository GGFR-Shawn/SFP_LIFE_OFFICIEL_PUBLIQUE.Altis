// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_veh";
_veh = cursortarget;

if (!isnil {_veh getvariable "sabot_roue_vehicule"}) exitwith {hint "Désolé, ce véhicule à un sabot sur la roue !";};

if (isnil {_veh getvariable "vehicule_info_parvariable"} or isnil "_veh") then 
{
	_nearcar = nearestObjects [getPosATL player, ["Car", "Ship","Air"], 2];
	_veh = _nearcar select 0;
};

_it = locked _veh;


if (_it == 2) then 
{
	hint "Véhicule déverrouillé !";
	[[[_veh],"divers\vehiclelock\son_ouverture.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	[[[_veh,0],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
};

if (_it == 1) then 
{
	hint "Véhicule verrouillé !";
	[[[_veh],"divers\vehiclelock\son_fermeture.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	[[[_veh,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
};