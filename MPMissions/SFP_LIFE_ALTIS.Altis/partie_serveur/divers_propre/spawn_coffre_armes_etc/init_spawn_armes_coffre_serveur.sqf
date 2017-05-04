// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "sfp_config_activer_coffre_armes"};

_choix_demarrage = ["1","2","3"] call bis_fnc_selectrandom;
if (_choix_demarrage != "1") exitwith {};
if (!sfp_config_activer_coffre_armes) exitwith {};

"DIAG SFP : Caisse arme : Démarrage du script en attente." spawn historique_creation_log_sfp;

sleep (600 + (random (60 * 20)));

"DIAG SFP : Caisse arme : Démarrage du script lancé vérification nombre joueurs." spawn historique_creation_log_sfp;

private ["_position_des_coffres_d_armes_choisit","_que_mettre_dans_le_coffre"];
if ((count ([] call BIS_fnc_listPlayers)) < 25) then {waituntil {sleep 60; (count ([] call BIS_fnc_listPlayers)) >= 25};};

// =================================================================================================================================================================
														// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Spawn Armes Gilets Etc", "Historique Spawn Armes Gilets Etc", _heure_du_log, "Demarrage du script."] call saveToDB;
"DIAG SFP : Caisse arme : Démarrage du script validé." spawn historique_creation_log_sfp;
// =================================================================================================================================================================

_condition_endroit_spawn_des_armes = false;
while {!_condition_endroit_spawn_des_armes} do 
{
	_position_une_random = [-15000, 15000] call BIS_fnc_selectRandom; 
	_position_deux_random = [-15000, 15000] call BIS_fnc_selectRandom;
	_position_des_coffres_d_armes_choisit = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verifierjoueurautour = _position_des_coffres_d_armes_choisit nearEntities [["man"], 300];
	
	if (_position_des_coffres_d_armes_choisit select 2 >= 0 && {isPlayer _x} count (_verifierjoueurautour) < 1 && !isOnRoad _position_des_coffres_d_armes_choisit && !surfaceIsWater _position_des_coffres_d_armes_choisit) then {_condition_endroit_spawn_des_armes = true;};
	sleep 0.05;
};
if (isnil "_position_des_coffres_d_armes_choisit") exitwith {sleep 0.3; [] execvm "partie_serveur\divers_propre\spawn_coffre_armes_etc\init_spawn_armes_coffre_serveur.sqf";};

// ------------------------------------------------------- LANCEMENT INITIALISATION ------------------------------------------------------------- //
_que_mettre_dans_le_coffre =
{
	_le_coffre = _this;
	if (isnil "_le_coffre") exitwith {};
	if (isnil {_le_coffre getvariable "usedspace"}) then {_le_coffre setvariable ["usedspace",0,true];};
	if (isnil {_le_coffre getvariable "sacoche_de_c4"}) then {_le_coffre setvariable ["sacoche_de_c4",0,true];};

	clearWeaponCargoGlobal _le_coffre;
	clearMagazineCargoGlobal _le_coffre;
	clearItemCargoGlobal _le_coffre;

	// C4
	if ((round (random 2)) == 2) then
	{
		_combien = round (random 4);
		_le_coffre setVariable ['sacoche_de_c4', _combien,true];
		_le_coffre setVariable ["usedspace", _combien,true];
	};
	
	// Argent dans le coffre
	if ((round (random 2)) == 2) then
	{
		_le_coffre setVariable ['argent_dans_le_coffre_d_arme', round (random 250000),true];
	};
	
	// Armes
	if ((round (random 1)) == 1) then
	{
		_listes_armes_spawn = sfp_config_liste_des_armes_coffre_d_armes;
	
		_combien_en_donner = round (random 10);
		for "_i" from 0 to _combien_en_donner do
		{
			_munitions_choisit = (_listes_armes_spawn call bis_fnc_selectrandom) select 0;
			_armes_choisit = (_listes_armes_spawn call bis_fnc_selectrandom) select 1;
			
			if (_armes_choisit != "") then 
			{
				_le_coffre addWeaponCargoGlobal [_armes_choisit, 1];
				_le_coffre addItemCargoGlobal [_munitions_choisit, round (random 10)];				
			};
		};
	};
	
	// Accessoires
	if ((round (random 1)) == 1) then
	{
		_listes_accessoires_spawn =
		[
			"optic_AMS_khk",
			"optic_AMS",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_DMS",
			"optic_KHS_tan",
			"optic_KHS_blk",
			"optic_KHS_old",
			"optic_LRPS",
			"R3F_AIMPOINT",
			"R3F_AIMPOINT_DES",
			"R3F_ZEISS",
			"R3F_ZEISS_DES",
			"optic_MRCO",
			"optic_NVS",
			"optic_Hamr",
			"R3F_SILENCIEUX_HK416",
			"R3F_LAMPE_SURB",
			"optic_SOS",
			"R3F_SILENCIEUX_HK416_DES",
			"R3F_LAMPE_SURB_DES",
			"R3F_SILENCIEUX_HK417",
			"R3F_SILENCIEUX_HK417_DES",
			"muzzle_snds_338_black",
			"muzzle_snds_338_sand",
			"muzzle_snds_338_green",
			"muzzle_snds_H",
			"R3F_SILENCIEUX_FRF2",
			"R3F_SILENCIEUX_FRF2_DES",
			"R3F_SILENCIEUX_FAMAS",
			"R3F_SILENCIEUX_FAMAS_DES",
			"muzzle_snds_93mmg_tan",
			"muzzle_snds_93mmg",
			"R3F_SILENCIEUX_MINIMI",
			"muzzle_snds_H_MG",
			"muzzle_snds_B",
			"muzzle_snds_M"
		];
	
		_combien_en_donner = round (random 10);
		for "_i" from 0 to _combien_en_donner do
		{
			_accessoires_choisit = _listes_accessoires_spawn call bis_fnc_selectrandom;
			
			if (_accessoires_choisit != "") then 
			{
				_le_coffre addItemCargoGlobal [_accessoires_choisit, 1];				
			};
		};
	};
	
	// Sacs à dos
	if ((round (random 2)) == 1) then
	{
		_cfg = configfile >> "CfgVehicles";
		_liste_sacs_by_maxou = [];

		for "_i" from 0 to count _cfg - 1 do 
		{ 
			if (isClass (_cfg select _i)) then 
			{
				_la_classe = configName (_cfg select _i);
				_scope = getNumber (_cfg >> _la_classe >> "scope");
				_type_class = getText (_cfg >> _la_classe >> "vehicleClass");
			
				if (_scope >= 2 && {_type_class == "Backpacks"}) then 
				{
					_liste_sacs_by_maxou = _liste_sacs_by_maxou + [_la_classe];
				};
			};
		};
		
		_combien_en_donner = round (random 10);
		for "_i" from 0 to _combien_en_donner do
		{			
			_sac_choisit = _liste_sacs_by_maxou call bis_fnc_selectrandom;
			if (_sac_choisit != "") then 
			{
				_le_coffre addBackpackCargoGlobal [_sac_choisit,1];
			};
		};
	};
};

"DIAG SFP : Caisse arme : Création de la caisse 1/2." spawn historique_creation_log_sfp;

le_coffre_a_remplir = createVehicle ["Box_East_WpsSpecial_F", _position_des_coffres_d_armes_choisit, [], 0, 'CAN_COLLIDE'];
publicvariable "le_coffre_a_remplir";
le_coffre_a_remplir setvariable ["je_suis_le_coffre_d_arme",true,true];
le_coffre_a_remplir call _que_mettre_dans_le_coffre;

waitUntil {sleep 1; speed le_coffre_a_remplir < 1};

"DIAG SFP : Caisse arme : Création de la caisse 2/2." spawn historique_creation_log_sfp;

if (alive le_coffre_a_remplir) then 
{
	// Pour recherche autour
	_position_des_coffres_d_armes_choisit_pour_le_marker = [(_position_des_coffres_d_armes_choisit select 0) - (random 700),(_position_des_coffres_d_armes_choisit select 1) - (random 700),0];
	
	createMarker ["_spawn_de_la_caisse_d_armes", (_position_des_coffres_d_armes_choisit_pour_le_marker)];
	"_spawn_de_la_caisse_d_armes" setMarkerShape "ICON";
	"_spawn_de_la_caisse_d_armes" setMarkerColor "Coloryellow";
	"_spawn_de_la_caisse_d_armes" setMarkerSize [3,3];
	"_spawn_de_la_caisse_d_armes" setMarkerType "hd_dot";
	"_spawn_de_la_caisse_d_armes" setMarkerText "Coffre D'Armes ! (rayon 700 M)";

	caisse_d_armes_en_cours_de_recherche = 1; sleep 0.1;
	publicvariable "caisse_d_armes_en_cours_de_recherche";
	
	sleep 0.5;
	[[[],"divers\recherche_de_la_caisse_d_armes\init_recherche_de_la_caisse_d_armes_client.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
// ------------------------------------------------------- Attendre spawn d'armes trouvé -------------------------------------------------------- //
	
	"DIAG SFP : Caisse arme : Attente qu'un joueur la trouve." spawn historique_creation_log_sfp;
	
	waituntil {sleep 2; !alive le_coffre_a_remplir or (({isplayer _x} count (_position_des_coffres_d_armes_choisit nearEntities [['MAN'], 6])) > 0)};
	
	_les_nom_a_proximite_coffre_d_armes = [];
	{if (isplayer _x) then {_les_nom_a_proximite_coffre_d_armes = _les_nom_a_proximite_coffre_d_armes + [name _x];};} foreach (nearestObjects [_position_des_coffres_d_armes_choisit, ["Man"], 6]);

	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	_personne_trouve_coffre = format ["%1 ont trouves le coffre remplit d armes !", _les_nom_a_proximite_coffre_d_armes];
	["Historique Spawn Armes Gilets Etc", "Historique Spawn Armes Gilets Etc", _heure_du_log, _personne_trouve_coffre] call saveToDB;
	"DIAG SFP : Caisse arme : Un joueur la trouvé attente suppression de la caisse." spawn historique_creation_log_sfp;
	
	caisse_d_armes_en_cours_de_recherche = nil; sleep 1;
	publicvariable "caisse_d_armes_en_cours_de_recherche";

	deleteMarker "_spawn_de_la_caisse_d_armes";
	
	sleep ((6 * 60) + (random 600));
	deletevehicle le_coffre_a_remplir;

	"DIAG SFP : Caisse arme : Suppression de la caisse." spawn historique_creation_log_sfp;
	
	le_coffre_a_remplir = nil; sleep 0.5;
	publicvariable "le_coffre_a_remplir";
}else
{
	[] execvm "partie_serveur\divers_propre\spawn_coffre_armes_etc\init_spawn_armes_coffre_serveur.sqf";
};