// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_personnes","_etat_verrouillage"];
_personnes = crew cursorTarget;
_etat_verrouillage = locked cursortarget;

if (isnil {cursortarget getvariable "vehicule_info_parvariable"}) exitWith {hint "Ce n'est pas un véhicule !"};
if (_etat_verrouillage == 2) exitWith {hint "Désolé, le véhicule est vérouillé !"};
if (count crew cursortarget < 1) exitWith {hint "Personne n'est dans le véhicule !"};
if ((cursortarget distance player) >= 10) exitWith {hint "La personne est trop loin pour être extraite !"};

{
	if (side _x != west) then
	{
		[[[_x,"1"],"divers\vehiclelock\ejecter_civil_synchro.sqf"],"BIS_fnc_execVM",_x,false] spawn BIS_fnc_MP;
	}else
	{
		hint "Opération impossible !";
	};
} foreach _personnes;