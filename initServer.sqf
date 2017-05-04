// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !((_this select 0)) exitWith {};

onPlayerDisconnected 
{
	[_id, _name, _uid] call compile preprocessfilelinenumbers "divers\divers\supprimer_weapons_deco.sqf";
};

[] execvm "partie_serveur\init.sqf"; 
[] execvm "partie_serveur\retour_configuration_du_serveur.sqf";
[6,true,21] execFSM "divers\divers\temps_serveur.fsm";