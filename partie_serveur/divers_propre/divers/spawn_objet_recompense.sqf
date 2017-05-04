// ===================================================================================================================================================================================================================
														// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
														  // Poursuite pénal possible ! Voir amar.arma3.fr //
// ===================================================================================================================================================================================================================

waituntil {sleep 1; !isnil "sfp_config_activer_objet_recompense"};
if (!sfp_config_activer_objet_recompense) exitwith {};


private "_endroit_spawn_recompense";

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min: 1)",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
["Historique Objet Recompense", "Historique Objet Recompense", _heure_du_log, "Démarrage du script recompense"] call saveToDB;
"DIAG SFP : Objet récompense : Démarrage du script." spawn historique_creation_log_sfp;

// ===================================================================================================================================================================================================================
														  // LISTE OBJETS RECOMPENSE ET NOM //
// ===================================================================================================================================================================================================================
_liste_objets_a_trouver = ["Land_Maroula_F"] call bis_fnc_selectrandom; // Statut

// ===================================================================================================================================================================================================================
															// ENDROIT SPAWN //
// ===================================================================================================================================================================================================================
_condition_endroit_choisit = false;
while {!_condition_endroit_choisit} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; 
	_position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	
	_endroit_spawn_recompense = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	sleep 0.5;
	if (!isOnRoad _endroit_spawn_recompense && !surfaceIsWater _endroit_spawn_recompense) then {_condition_endroit_choisit = true;};
};

// ===================================================================================================================================================================================================================
														// CREATION RECOMPENSE ET INITIALISATION //
// ===================================================================================================================================================================================================================
_objet = createVehicle [_liste_objets_a_trouver, _endroit_spawn_recompense, [], 0, "NONE"];
_objet setVariable["objet_pour_recompense",true,true];

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min: 2)",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
["Historique Objet Recompense", "Historique Objet Recompense", _heure_du_log, "Fin du script recompense"] call saveToDB;
"DIAG SFP : Objet récompense : Fin du script." spawn historique_creation_log_sfp;
