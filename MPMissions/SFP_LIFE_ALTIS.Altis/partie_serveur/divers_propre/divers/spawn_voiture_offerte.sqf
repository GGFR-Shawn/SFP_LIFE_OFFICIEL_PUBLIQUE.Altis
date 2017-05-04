// ===================================================================================================================================================================================================================
														// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
														  // Poursuite pénal possible ! Voir amar.arma3.fr //
// ===================================================================================================================================================================================================================

waituntil {sleep 1; !isnil "sfp_config_activer_vehicules_offert"};

_choix_demarrage = ["1","2","3"] call bis_fnc_selectrandom;
if (_choix_demarrage != "1") exitwith {};
if (!sfp_config_activer_vehicules_offert) exitwith {};

"DIAG SFP : Véhicule offert : Démarrage du script phase attente." spawn historique_creation_log_sfp;
// ===================================================================================================================================================================================================================
														// INITIALISATION TAILLE DES INVENTAIRES DES VOITURES //
// ===================================================================================================================================================================================================================

sleep (3700 + (random 4000)); // Attente aléatoire

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Vehicule offert", "Historique Vehicule offert", _heure_du_log, "Démarrage du script vehicule offert"] call saveToDB;
"DIAG SFP : Véhicule offert : Démarrage du script attente terminée." spawn historique_creation_log_sfp;
// =================================================================================================================================================================

// ===================================================================================================================================================================================================================
													// LISTE VOITURES OFFERTES ET NOM //
// ===================================================================================================================================================================================================================
_liste_voiture_offerte = [
							"C_Van_01_transport_F","SAL_77TRANSAMCiv_SFP","SAL_IROCCiv_SFP","Jonzie_96_Impala","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_SUV_01_F","DAR_ImpalaCivA",
							"UAZ_Unarmed","C_Offroad_01_F","C_Quadbike_01_F","SAL_AudiCivBlack","DAR_ChallengerCivBlack","C_SUV_01_Sport_Maxou",
							"DAR_TahoeCivBlack","Ikarus_Bus_SFP","C_Van_01_box_F"
						 ] call bis_fnc_selectrandom;
						 
nom_de_la_voiture_offerte = getText (configFile >> "CfgVehicles" >> _liste_voiture_offerte >> "displayName");

// ===================================================================================================================================================================================================================
															// ENDROIT SPAWN //
// ===================================================================================================================================================================================================================
_condition_endroit_voiture = false;
spawn_voiture_choisit = nil;
while {!_condition_endroit_voiture} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; 
	_position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	
	spawn_voiture_choisit = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	sleep 0.5;
	if (!isOnRoad spawn_voiture_choisit && !surfaceIsWater spawn_voiture_choisit) then {_condition_endroit_voiture = true;};
};
if (isnil "spawn_voiture_choisit") exitwith {sleep 0.3; execvm "partie_serveur\divers_propre\divers\spawn_voiture_offerte.sqf";};

// ===================================================================================================================================================================================================================
													// CREATION MARQUEUR ET BANNIERE HAUT ECRAN //
// ===================================================================================================================================================================================================================
_rayon = 300;
_position_une_random = [-_rayon, _rayon] call BIS_fnc_selectRandom; 
_position_deux_random = [-_rayon, _rayon] call BIS_fnc_selectRandom;
_position_approximatif_du_marqueur = [(spawn_voiture_choisit select 0) + (random _position_une_random),(spawn_voiture_choisit select 1) + (random _position_deux_random),0];

_nom_du_marqueur = format ["Maxou_voiture_offerte_%1",round random 9999];
_le_marqueur = createMarker [_nom_du_marqueur, _position_approximatif_du_marqueur];
_le_marqueur setMarkerShape "ICON";
_le_marqueur setMarkerColor "Coloryellow";
_le_marqueur setMarkerSize [1.2,1.2];
_le_marqueur setMarkerType "hd_dot";
_le_marqueur setMarkerText format ["Véhicule Offert (Rayon %1 M) !", _rayon];

_position_format_carte = mapGridPosition _position_approximatif_du_marqueur;
[[[_position_format_carte, "à découvrir"],"divers\divers\synchronisation_message_avertir_voiture_offerte.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

// ===================================================================================================================================================================================================================
													// CREATION VOITURE ET INITIALISATION //
// ===================================================================================================================================================================================================================
_veh = createVehicle [_liste_voiture_offerte, spawn_voiture_choisit, [], 0, "NONE"];
		
clearWeaponCargoGlobal _veh; 
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;	
clearBackpackCargoGlobal _veh;
_veh setdamage 0;
_veh lock false;

_veh setVariable["vehicule_info_parvariable",["voiture_maxou_attente_joueur"],true];

// ===================================================================================================================================================================================================================
													// ATTENDRE JOUEUR SY APPROCHE //
// ===================================================================================================================================================================================================================
"DIAG SFP : Véhicule offert : Véhicule créé attente qu'un joueur approche." spawn historique_creation_log_sfp;

_zone_detection = 15; // Mètres
waituntil {sleep 2; (({isplayer _x} count (spawn_voiture_choisit nearEntities [['MAN'], _zone_detection])) > 0)};

_les_nom_a_proximite_voiture_offerte = [];
{if (isplayer _x) then {_les_nom_a_proximite_voiture_offerte = _les_nom_a_proximite_voiture_offerte + [name _x];};} foreach (nearestObjects [spawn_voiture_choisit, ["Man"], _zone_detection]);

_lettres = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]; 
_numero_de_plaque = format ["%1%2-%3-%4%5", _lettres call bis_fnc_selectrandom,_lettres call bis_fnc_selectrandom,round (random 999),_lettres call bis_fnc_selectrandom,_lettres call bis_fnc_selectrandom];
_numero_de_plaque = [_numero_de_plaque, _numero_de_plaque];

_lancement_initilisation_inventaire = [_veh] execvm "config\tailles_des_inventaires_des_vehicules.sqf";
waitUntil {scriptDone _lancement_initilisation_inventaire;};

joueur_trouve_le_vehicule_offert = _les_nom_a_proximite_voiture_offerte select 0;
[_veh,[joueur_trouve_le_vehicule_offert],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
_veh setVariable["vehicule_info_parvariable",[joueur_trouve_le_vehicule_offert],true];
[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";

// ===================================================================================================================================================================================================================
												// AVERTIR QUI A TROUVE LE VEHICULE ET FIN //
// ===================================================================================================================================================================================================================
[{player globalchat "Un joueur à trouvé le véhicule offert dernièrement ! Félicitation !";},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;
deleteMarker _le_marqueur;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_information_qui_a_trouve = format ["%1 à trouvé le véhicule %2 offert en %3.", joueur_trouve_le_vehicule_offert, nom_de_la_voiture_offerte, mapGridPosition spawn_voiture_choisit];
["Historique Vehicule offert", "Historique Vehicule offert", _heure_du_log, _information_qui_a_trouve] call saveToDB;
"DIAG SFP : Véhicule offert : Fin du script joueur l'a trouvé." spawn historique_creation_log_sfp;
