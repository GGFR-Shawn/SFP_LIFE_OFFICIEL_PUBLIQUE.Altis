// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Météo : Démarrage du script." spawn historique_creation_log_sfp;
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Meteo", "Historique Meteo", _heure_du_log, "Démarrage du script."] call saveToDB;

private ["_choix_bon_temps_sfp_maxou", "_choix_activer_vent_sfp_maxou", "_choix_activer_brouillard_sfp_maxou", "_choix_activer_neige_sfp_maxou","_temps_duree_changement_sfp", "_choix_meteo_nuage_sfp", "_choix_meteo_brouillard_sfp", "_choix_meteo_pluie_sfp", "_choix_meteo_vent_sfp", "_choix_meteo_rafal_de_vent", "_choix_meteo_vague_sfp","_activer_neige_sfp"];

if (round (random 1) == 1) then {_choix_bon_temps_sfp_maxou = true;};
if (round (random 3) == 1 && isnil "_choix_bon_temps_sfp_maxou") then {_choix_activer_vent_sfp_maxou = true;};
if (round (random 12) == 1 && isnil "_choix_bon_temps_sfp_maxou") then {_choix_activer_brouillard_sfp_maxou = true;};
if (round (random 20) == 1 && isnil "_choix_bon_temps_sfp_maxou") then {_choix_activer_neige_sfp_maxou = true;};

execvm "divers\divers\meteo_synchro_client_sfp.sqf";

while {true} do
{
	// Temps changement meteo
	if (isnil "_choix_bon_temps_sfp_maxou") then {_temps_duree_changement_sfp = 900;}else{_temps_duree_changement_sfp = 100;};

	// Choix nuage
	if (isnil "_choix_bon_temps_sfp_maxou") then {_choix_meteo_nuage_sfp = random 1;}else{_choix_meteo_nuage_sfp = 0;};
	
	// Choix pluie
	if (isnil "_choix_bon_temps_sfp_maxou" && _choix_meteo_nuage_sfp > 0.6) then {_choix_meteo_pluie_sfp = random 1;}else{_choix_meteo_pluie_sfp = 0;};
	
	// Choix vent, rafale de vent et effet vague mer si vent
	if (isnil "_choix_bon_temps_sfp_maxou" && !isnil "_choix_activer_vent_sfp_maxou") then {_choix_meteo_vent_sfp = random 30;}else{_choix_meteo_vent_sfp = random 4;};
	if (isnil "_choix_bon_temps_sfp_maxou" && _choix_meteo_vent_sfp >= 15) then {_choix_meteo_rafal_de_vent = 0.05;if (_choix_meteo_vent_sfp > 18) then {_choix_meteo_rafal_de_vent = 0.1;};if (_choix_meteo_vent_sfp > 21) then {_choix_meteo_rafal_de_vent = 0.2;};if (_choix_meteo_vent_sfp > 23) then {_choix_meteo_rafal_de_vent = 0.3;};if (_choix_meteo_vent_sfp > 25) then {_choix_meteo_rafal_de_vent = 0.5;};if (_choix_meteo_vent_sfp > 27) then {_choix_meteo_rafal_de_vent = 0.7;};if (_choix_meteo_vent_sfp > 28) then {_choix_meteo_rafal_de_vent = 0.8;};if (_choix_meteo_vent_sfp > 29) then {_choix_meteo_rafal_de_vent = 0.9;}; if (_choix_meteo_vent_sfp > 29.2) then {_choix_meteo_rafal_de_vent = 0.95;};if (_choix_meteo_vent_sfp >= 30) then {_choix_meteo_rafal_de_vent = 1;};}else{_choix_meteo_rafal_de_vent = 0;};
	if (isnil "_choix_bon_temps_sfp_maxou" && _choix_meteo_vent_sfp >= 15) then {_choix_meteo_vague_sfp = 0.05;if (_choix_meteo_vent_sfp > 18) then {_choix_meteo_vague_sfp = 0.1;};if (_choix_meteo_vent_sfp > 21) then {_choix_meteo_vague_sfp = 0.35;};if (_choix_meteo_vent_sfp > 23) then {_choix_meteo_vague_sfp = 0.42;};if (_choix_meteo_vent_sfp > 25) then {_choix_meteo_vague_sfp = 0.56;};if (_choix_meteo_vent_sfp > 27) then {_choix_meteo_vague_sfp = 0.7;};if (_choix_meteo_vent_sfp > 28) then {_choix_meteo_vague_sfp = 0.8;};if (_choix_meteo_vent_sfp > 29) then {_choix_meteo_vague_sfp = 0.9;}; if (_choix_meteo_vent_sfp > 29.2) then {_choix_meteo_vague_sfp = 0.95;};if (_choix_meteo_vent_sfp >= 30) then {_choix_meteo_vague_sfp = 1;};}else{_choix_meteo_vague_sfp = 0;};
	
	// Choix brouillard
	if (isnil "_choix_bon_temps_sfp_maxou" && !isnil "_choix_activer_brouillard_sfp_maxou" && _choix_meteo_nuage_sfp > 0.75) then {_choix_meteo_brouillard_sfp = (random 0.05);}else{_choix_meteo_brouillard_sfp = 0;};
	
	_activer_neige_sfp = false;
	if (isnil "_choix_bon_temps_sfp_maxou" && !isnil "_choix_activer_neige_sfp_maxou" && _choix_meteo_pluie_sfp > 0.6 && _choix_meteo_nuage_sfp > 0.4) then {if (round (random 3) == 1) then {_activer_neige_sfp = true;};};
	
	meteo_sfp_maxou = [_temps_duree_changement_sfp, _choix_meteo_nuage_sfp, _choix_meteo_brouillard_sfp, _choix_meteo_pluie_sfp, _choix_meteo_rafal_de_vent, _choix_meteo_vent_sfp, _choix_meteo_vague_sfp, _activer_neige_sfp];
	publicvariable "meteo_sfp_maxou";
	
	if (isnil "fin_initialisation_meteo_sfp") then {fin_initialisation_meteo_sfp = true; publicvariable "fin_initialisation_meteo_sfp"};

	sleep _temps_duree_changement_sfp;
	
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique Meteo", "Historique Meteo", _heure_du_log, "Changement de la meteo."] call saveToDB;	
	"DIAG SFP : Météo : Changement de la météo." spawn historique_creation_log_sfp;
};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Meteo", "Historique Meteo", _heure_du_log, "Fin du script car choix météo fixe."] call saveToDB;
"DIAG SFP : Météo : Fin du script car choix météo fixe." spawn historique_creation_log_sfp;

