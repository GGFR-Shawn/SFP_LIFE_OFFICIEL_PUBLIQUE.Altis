// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Demarrage script feu voiture joueur."] call saveToDB;
"DIAG SFP : Mission Pompiers : Démarrage script feux voiture joueur." spawn historique_creation_log_sfp;

_listes_des_vehicules_trouve = [];
_type_exclu = ["Steerable_Parachute_F","B_UAV_01_F","Black_Hornet_Nano_UAV_Bag"];
_whitelist = [helico_taxi];
		
{
	if (count crew _x > 0 && !(typeof _x in _type_exclu) && !(_x in _whitelist) && (getPosATL _x select 2) < 2) then
	{
		_listes_des_vehicules_trouve = _listes_des_vehicules_trouve + [_x];
	};
	sleep 0.5;
} forEach vehicles;

if (count _listes_des_vehicules_trouve > 0) then
{
	_vehicule_choisit_pour_application = _listes_des_vehicules_trouve call BIS_fnc_selectRandom;

	{
		[[["1", _x],"divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\feu_voiture_joueur\initialisation_sarl_pompier_client_feu_voiture_joueur.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;
	} foreach (crew _vehicule_choisit_pour_application);

	_vehicule_choisit_pour_application allowdamage false;
	_vehicule_choisit_pour_application setvariable ["jesuisenfeu",2,true];
	_vehicule_choisit_pour_application setvariable ["temps_pour_eteindre_le_feu", round (60 + (random 60)),true];

	combien_de_fois_effet_beug = (20 + (random 50));
	while {combien_de_fois_effet_beug > 0} do
	{
		_vehicule_choisit_pour_application setdamage (0.1 + (random 0.8));
		_fuel = fuel _vehicule_choisit_pour_application;
		_vehicule_choisit_pour_application setfuel (_fuel - 0.05);
		combien_de_fois_effet_beug = combien_de_fois_effet_beug - 1;
		sleep 0.1;
	};

	createMarker ["spawn_du_feu_voiture_joueur", getPosATL _vehicule_choisit_pour_application];
	"spawn_du_feu_voiture_joueur" setMarkerShape "ICON";
	"spawn_du_feu_voiture_joueur" setMarkerColor "Colorred";
	"spawn_du_feu_voiture_joueur" setMarkerSize [3,3];
	"spawn_du_feu_voiture_joueur" setMarkerType "hd_dot";
	"spawn_du_feu_voiture_joueur" setMarkerText "Incendie Joueur !";	

	creation_feu_voiture_joueur = _vehicule_choisit_pour_application;
	publicvariable "creation_feu_voiture_joueur";

	while {!isnil {_vehicule_choisit_pour_application getvariable "jesuisenfeu"} && alive _vehicule_choisit_pour_application} do
	{
		sleep 0.5;
		if (speed _vehicule_choisit_pour_application > 0.3) then
		{
			"spawn_du_feu_voiture_joueur" setMarkerPos (getPosATL _vehicule_choisit_pour_application);
		};
	};
	
	deleteMarker "spawn_du_feu_voiture_joueur";
	
	sleep 3;
	
	creation_feu_voiture_joueur = nil; 
	publicvariable "creation_feu_voiture_joueur";
};

demarage_d_une_mission_pompier_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Fin script feu voiture joueur."] call saveToDB;
"DIAG SFP : Mission Pompiers : Fin script feux voiture joueur." spawn historique_creation_log_sfp;
