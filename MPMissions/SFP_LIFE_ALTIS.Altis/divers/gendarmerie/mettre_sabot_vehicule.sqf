// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_vehicule","_temps_attente","_temps_attente","_animation_sabot"];
if (isNull cursortarget) exitWith {hint "Aucun véhicule detecté !"};
_le_vehicule = cursortarget;
_temps_attente = 30; // Secondes

_animation_sabot =
{
	while {alive player && alive _le_vehicule && player distance _le_vehicule < 5 && _temps_attente >= 0} do
	{
		titletext [format ["\n\n\n\n\n Encore %1 secondes d'action sur le sabot du véhicule %2 de %3 ...", _temps_attente, getText ( configFile >> "CfgVehicles" >> typeOf(_le_vehicule) >> "displayName"), _le_vehicule getvariable "vehicule_info_parvariable" select 0],"PLAIN",1];
		_temps_attente = round (_temps_attente - 1);
		player playActionNow "medicstartup";
		sleep 1;	
	};
	
	if (_temps_attente > 0 && player distance _le_vehicule > 5) then {titletext ["Opération annulée .. \n Vous êtes trop loin du véhicule !","PLAIN DOWN"];};
};


if (isnil {_le_vehicule getvariable "sabot_roue_vehicule"}) then
{
	[] call _animation_sabot;
	if (_temps_attente > 0) exitwith {};

	_le_vehicule setvariable ["sabot_roue_vehicule",1,true];
	[[[_le_vehicule,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	
	titletext ["Le sabot à bien été posé !","PLAIN DOWN"];
}else
{
	[] call _animation_sabot;
	if (_temps_attente > 0) exitwith {};

	_le_vehicule setvariable ["sabot_roue_vehicule",nil,true];
	// [[[_le_vehicule,0],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	titletext ["Le sabot à bien été enlevé !","PLAIN DOWN"];
};

player switchmove "";