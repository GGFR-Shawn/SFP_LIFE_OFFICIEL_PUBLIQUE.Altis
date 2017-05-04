// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_veh";
_veh = _this select 0; // Le véhicule
_type = typeOf _veh; // Le type de véhicule
if (isnil "_veh") exitwith {player globalchat "Erreur ... Recommence !";};

_lancement_initilisation_inventaire = [_veh] execvm "config\tailles_des_inventaires_des_vehicules.sqf";
waitUntil {scriptDone _lancement_initilisation_inventaire;};

if (valeur_de_l_inventaire_vehicule_a_appliquer != 0) then
{
	_veh setVariable["usedspace",0,true];
	_veh setVariable["totalspace",valeur_de_l_inventaire_vehicule_a_appliquer,true];
};