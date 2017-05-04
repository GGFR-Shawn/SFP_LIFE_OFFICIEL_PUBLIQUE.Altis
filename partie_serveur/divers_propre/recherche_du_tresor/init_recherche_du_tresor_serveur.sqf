// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "sfp_config_activer_les_tresors" && !isnil "sfp_config_tresor_type" && !isnil "sfp_config_tresor_temps" && !isnil "sfp_config_tresor_distance"};
if (!sfp_config_activer_les_tresors) exitwith {};

"DIAG SFP : Recherche du trésor : Démarrage du script en attente." spawn historique_creation_log_sfp;

sleep sfp_config_tresor_temps;

// =================================================================================================================================================================
														// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Recherche Du Tresor", "Historique Recherche Du Tresor", _heure_du_log, "Demarrage de la recherche au tresor."] call saveToDB;
"DIAG SFP : Recherche du trésor : Démarrage du script validé." spawn historique_creation_log_sfp;
// =================================================================================================================================================================

// ------------------------------------------------------- choix de l'endroit du tresor -------------------------------------------- //
_condition_endroit_tresor = false;
spawn_du_tresor_choisit_emplacement_aleatoire = nil;
_choix_emplacement_tresor = [[3625.65,10276.2,0],[2894.19,12285.8,0],[6946.65,13017.4,0],[9620.27,13261.2,0],[11865.1,12664.2,0],[11343.8,5752.53,0],[9452.12,5458.23,0],[4794.31,7047.41,0]] call bis_fnc_selectrandom;
while {!_condition_endroit_tresor} do 
{
	_position_une_random = [-2500, 2500] call BIS_fnc_selectRandom; _position_deux_random = [-2500, 2500] call BIS_fnc_selectRandom;
	spawn_du_tresor_choisit_emplacement_aleatoire = [(_choix_emplacement_tresor select 0) + (random _position_une_random),(_choix_emplacement_tresor select 1) + (random _position_deux_random),0];
	if (spawn_du_tresor_choisit_emplacement_aleatoire select 2 > -20 && !isOnRoad spawn_du_tresor_choisit_emplacement_aleatoire && surfaceIsWater spawn_du_tresor_choisit_emplacement_aleatoire) then {_condition_endroit_tresor = true;};
	sleep 0.05;
};
if (isnil "spawn_du_tresor_choisit_emplacement_aleatoire") exitwith {sleep 0.3; execvm "partie_serveur\divers_propre\recherche_du_tresor\init_recherche_du_tresor_serveur.sqf";};

// ------------------------------------------------------- LANCEMENT INITIALISATION ------------------------------------------------------------- //
objet_du_tresor = createVehicle [sfp_config_tresor_type, spawn_du_tresor_choisit_emplacement_aleatoire, [], 0, 'CAN_COLLIDE'];
waitUntil {sleep 3; speed objet_du_tresor <= 0.01};
objet_du_tresor setvariable ["je_suis_le_tresor",true,true];

// Pour recherche autour
spawn_du_tresor_choisit_emplacement_aleatoire = [(spawn_du_tresor_choisit_emplacement_aleatoire select 0) - (random sfp_config_tresor_distance),(spawn_du_tresor_choisit_emplacement_aleatoire select 1) - (random sfp_config_tresor_distance),0];

createMarker ["_spawn_du_tresor_choisit", (spawn_du_tresor_choisit_emplacement_aleatoire)];
"_spawn_du_tresor_choisit" setMarkerShape "ICON";
"_spawn_du_tresor_choisit" setMarkerColor "Coloryellow";
"_spawn_du_tresor_choisit" setMarkerSize [1.5,1.5];
"_spawn_du_tresor_choisit" setMarkerType "hd_dot";
"_spawn_du_tresor_choisit" setMarkerText "Trésor !";

tresor_en_cours_de_recherche = true; 
publicvariable "tresor_en_cours_de_recherche";

sleep 2;
[[[],"divers\recherche_du_tresor\init_recherche_du_tresor_client.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

// ------------------------------------------------------- Attendre tresor trouvé -------------------------------------------------------- //
waituntil {sleep 2; !alive objet_du_tresor};

tresor_en_cours_de_recherche = nil; 
publicvariable "tresor_en_cours_de_recherche";

deleteMarker "_spawn_du_tresor_choisit";
deletevehicle objet_du_tresor;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Recherche Du Tresor", "Historique Recherche Du Tresor", _heure_du_log, "Fin de la recherche au tresor."] call saveToDB;
"DIAG SFP : Recherche du trésor : Fin du script." spawn historique_creation_log_sfp;

execvm "partie_serveur\divers_propre\recherche_du_tresor\init_recherche_du_tresor_serveur.sqf";
