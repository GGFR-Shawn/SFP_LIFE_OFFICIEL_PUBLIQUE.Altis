// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
// Script de nomisum modifié, amélioré et corrigé par SFP par Maxou

waituntil {sleep 1; !isnil "sfp_config_activer_feux_artifices"};

_choix_si_lancement_script = ["1","2","3"] call bis_fnc_selectrandom;
if (_choix_si_lancement_script != "1") exitwith {};
if (!sfp_config_activer_feux_artifices) exitwith {};

"DIAG SFP : Feu artifice : Démarrage du script en attente." spawn historique_creation_log_sfp;

sleep (round ((random 60) * 60));

_combien_d_artifice_a_lancer = round (70 + random 100);

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_log = format ["Creation feux artice %1 ...", _combien_d_artifice_a_lancer];
["Historique Artifice", "Historique Artifice", _heure_du_log, _detail_du_log] call saveToDB;
"DIAG SFP : Feu artifice : Démarrage du script validé." spawn historique_creation_log_sfp;

for "_i" from 0 to _combien_d_artifice_a_lancer do
{
	_endroit_tir_feux_artifice = getpos chalutier_neo;
	_type = ["fizzer","normal","rain"] call BIS_fnc_selectRandom;
	_couleur_sfp_tir = [random 1, random 1, random 1];
	_force_explosion = (20 + (random 100));
	_dispertion_feu_sfp = (2 + (random 20)); 
	_choix_direction_artifice_sfp = {[random 60, random -60] call BIS_fnc_selectRandom;};
	_ligne_velocity_feu = [random 4, [] call _choix_direction_artifice_sfp, (60 + (random 200))];
	_random_temps_attente = (random 0.5) - 0.25;
	_random_temps_attente_long = (random 8) - 4;
	_random_temps_attente_court = (random 0.1) - 0.05;

	_explosion_fragments_tableau = [];
	_explosion_fragments_substitu = [];
	_son_lanceur_sfp = ["lanceur_feu_artifice_sfp_1"] call BIS_fnc_selectRandom;
	_son_lanceur_sfp_deux = ["lanceur_feu_artifice_sfp_2","lanceur_feu_artifice_sfp_3","lanceur_feu_artifice_sfp_4","lanceur_feu_artifice_sfp_5"] call BIS_fnc_selectRandom;
	_son_explosion_sfp = ["explosion_feu_artifice_sfp_1","explosion_feu_artifice_sfp_2","explosion_feu_artifice_sfp_3","explosion_feu_artifice_sfp_4","explosion_feu_artifice_sfp_5","explosion_feu_artifice_sfp_6","explosion_feu_artifice_sfp_7","explosion_feu_artifice_sfp_8","explosion_feu_artifice_sfp_9","explosion_feu_artifice_sfp_10"] call BIS_fnc_selectRandom;
	_son_apres_explosion_sfp = ["feu_artifice_apres_explosion_5","feu_artifice_apres_explosion_6","feu_artifice_apres_explosion_7","feu_artifice_apres_explosion_8","feu_artifice_apres_explosion_9","feu_artifice_apres_explosion_10","feu_artifice_apres_explosion_11"] call BIS_fnc_selectRandom;
	_son_apres_explosion_deux_sfp = ["feu_artifice_apres_explosion_1","feu_artifice_apres_explosion_2","feu_artifice_apres_explosion_3","feu_artifice_apres_explosion_4"] call BIS_fnc_selectRandom;

	for [{_h= 0},{_h < _dispertion_feu_sfp},{_h=_h+1}] do 
	{ 
		_random_explosion_une = ((random _force_explosion)*2) - _force_explosion;
		_random_explosion_deux = ((random _force_explosion)*2) - _force_explosion;
		_random_explosion_trois = ((random _force_explosion)*2) - _force_explosion;
		_explosion_fragments_tableau pushback [(_random_explosion_une) -_random_explosion_une/2,(_random_explosion_deux) -_random_explosion_deux/2, (_random_explosion_trois) -_random_explosion_trois/2];
	};

	[[
	[
		_endroit_tir_feux_artifice,
		_type,
		_ligne_velocity_feu,
		_force_explosion,
		_dispertion_feu_sfp,
		_couleur_sfp_tir,
		_explosion_fragments_tableau,
		_explosion_fragments_substitu,
		_random_temps_attente,
		_random_temps_attente_long,
		_son_lanceur_sfp,
		_son_lanceur_sfp_deux,
		_son_explosion_sfp,
		_son_apres_explosion_sfp,
		_son_apres_explosion_deux_sfp,
		_random_temps_attente_court
	]
	,"divers\divers\creation_artifice_sfp_client.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	
	"DIAG SFP : Feu artifice : Artifice lancé." spawn historique_creation_log_sfp;

	// Bouquet final
	if ((_combien_d_artifice_a_lancer - _i) > 10) then
	{	
		sleep (1 + (random 2));
	}else
	{
		sleep (random 1);
	};
};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Artifice", "Historique Artifice", _heure_du_log, "Fin feux artifice ..."] call saveToDB;
"DIAG SFP : Feu artifice : Fin du script." spawn historique_creation_log_sfp;
