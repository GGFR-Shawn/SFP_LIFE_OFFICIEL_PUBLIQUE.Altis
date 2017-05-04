// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_condition";
_condition = true;

sleep 10;

while {_condition} do
{
	sleep 7;

	diag_log "Diag SFP : Lancement sauvegarde fourriere dans iniDB";
	"DIAG SFP : Voitures fourrieres : Lancement d'une sauvegarde." spawn historique_creation_log_sfp;

	_PersistentDB_ObjCount = 0;
	{
		if (!isnil {_x getvariable "vehicule_info_parvariable"} && _x in list sarl_depannage_mettre_dehors && speed _x < 2 && count crew _x < 1) then
		{
			_classname = typeOf _x;
			_pos = getPosATL _x;
			_dir = [vectorDir _x] + [vectorUp _x];

			_proprietaire = _x getVariable "vehicule_info_parvariable"; 
			_totalspace = _x getVariable "totalspace";
			_plaque_immatriculation = _x getVariable "plaque_immatriculation_news";
			_couleur_du_vehicule = getObjectTextures _x;
			_voiture_possede_de_l_eau = _x getvariable "reservoir_d_eau_pour_pompier";
			_voiture_prix_du_vehicule_neuf = _x getvariable "prix_du_vehicule_neuf";
			_voiture_possede_une_assurance = _x getvariable "voiture_possede_une_assurance";
			
			_voiture_possede_un_neon = _x getvariable "voiture_possede_un_neon";
			_voiture_possede_une_puce = _x getvariable "voiture_possede_une_puce";
			_voiture_possede_un_radar_de_recul = _x getvariable "voiture_possede_un_radar_de_recul";
			_voiture_possede_un_klaxon = _x getvariable "voiture_possede_un_klaxon";
			_voiture_possede_un_detecteur_de_radar = _x getvariable "voiture_possede_un_detecteur_de_radar";
			_voiture_possede_un_nouveau_poids = _x getvariable "voiture_possede_un_nouveau_poids";

			_fuel = fuel _x;
			_degat_general = getdammage _x;
			_dommage_roue_un = _x getHitPointDamage "HitLBWheel";
			_dommage_roue_deux = _x getHitPointDamage "HitLFWheel";
			_dommage_roue_trois = _x getHitPointDamage "HitRBWheel";
			_dommage_roue_quatre = _x getHitPointDamage "HitRFWheel";
			_body = _x getHitPointDamage "HitBody";
			_Fueldegat = _x getHitPointDamage "HitFuel";
			_HitEngine  = _x getHitPointDamage "HitEngine";
			_HitEngine2 = _x getHitPointDamage "HitEngine2";
			_HitEngine3 = _x getHitPointDamage "HitEngine3";
			_HitHRotor  = _x getHitPointDamage "HitHRotor";
			_HitVRotor = _x getHitPointDamage "HitVRotor";
			_HitBatteries  = _x getHitPointDamage "HitBatteries";
			_HitLight  = _x getHitPointDamage "HitLight";
			_HitHydraulics   = _x getHitPointDamage "HitHydraulics";
			_HitTransmission   = _x getHitPointDamage "HitTransmission";
			_HitGear   = _x getHitPointDamage "HitGear";
			_HitFuel   = _x getHitPointDamage "HitFuel";
			_HitHStabilizerL1   = _x getHitPointDamage "HitHStabilizerL1";
			_HitHStabilizerR1   = _x getHitPointDamage "HitHStabilizerR1";
			_HitVStabilizer1    = _x getHitPointDamage "HitVStabilizer1";
			_HitTail    = _x getHitPointDamage "HitTail";
			_HitPitotTube   = _x getHitPointDamage "HitPitotTube";
			_HitStaticPort    = _x getHitPointDamage "HitStaticPort";
			_HitStarter1    = _x getHitPointDamage "HitStarter1";
			_HitStarter2   = _x getHitPointDamage "HitStarter2";
			_HitStarter3    = _x getHitPointDamage "HitStarter3";
			_HitAvionics   = _x getHitPointDamage "HitAvionics";
			_HitHull   = _x getHitPointDamage "HitHull";
			_HitMissiles   = _x getHitPointDamage "HitMissiles";
			_HitRGlass   = _x getHitPointDamage "HitRGlass";
			_HitLGlass   = _x getHitPointDamage "HitLGlass";
			_HitGlass1   = _x getHitPointDamage "HitGlass1";
			_HitGlass2   = _x getHitPointDamage "HitGlass2";
			_HitGlass3   = _x getHitPointDamage "HitGlass3";
			_HitGlass4   = _x getHitPointDamage "HitGlass4";
			_HitGlass5   = _x getHitPointDamage "HitGlass5";
			_HitGlass6   = _x getHitPointDamage "HitGlass6";

			_objSaveName = format["voiture fourriere numero %1", _PersistentDB_ObjCount];
			
			["sauvegarde_voitures_fourrieres", _objSaveName, "classname", _classname] call saveToDB;
			["sauvegarde_voitures_fourrieres", _objSaveName, "pos", _pos] call saveToDB;
			["sauvegarde_voitures_fourrieres", _objSaveName, "Direction", _dir] call saveToDB;
			
			if (!isnil "_proprietaire") then {["sauvegarde_voitures_fourrieres", _objSaveName, "leproprietaire", _proprietaire] call saveToDB;};
			if (!isnil "_totalspace") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Espace Total", _totalspace] call saveToDB;};
			if (!isnil "_plaque_immatriculation") then {["sauvegarde_voitures_fourrieres", _objSaveName, "plaque_immatriculation_news", _plaque_immatriculation] call saveToDB;};
			if (!isnil "_couleur_du_vehicule") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Couleur du vehicule", _couleur_du_vehicule] call saveToDB;};
			if (!isnil "_voiture_possede_de_l_eau") then {["sauvegarde_voitures_fourrieres", _objSaveName, "reservoir_d_eau_pour_pompier", _voiture_possede_de_l_eau] call saveToDB;};
			if (!isnil "_voiture_prix_du_vehicule_neuf") then {["sauvegarde_voitures_fourrieres", _objSaveName, "prix_du_vehicule_neuf", _voiture_prix_du_vehicule_neuf] call saveToDB;};
			if (!isnil "_voiture_possede_une_assurance") then {["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_une_assurance", _voiture_possede_une_assurance] call saveToDB;};
			
			if (!isnil "_voiture_possede_un_neon") then {["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_neon", _voiture_possede_un_neon] call saveToDB;};
			if (!isnil "_voiture_possede_une_puce") then {["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_une_puce", _voiture_possede_une_puce] call saveToDB;};
			if (!isnil "_voiture_possede_un_radar_de_recul") then {["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_radar_de_recul", _voiture_possede_un_radar_de_recul] call saveToDB;};
			if (!isnil "_voiture_possede_un_klaxon") then {["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_klaxon", _voiture_possede_un_klaxon] call saveToDB;};
			if (!isnil "_voiture_possede_un_detecteur_de_radar") then {["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_detecteur_de_radar", _voiture_possede_un_detecteur_de_radar] call saveToDB;};
			if (!isnil "_voiture_possede_un_nouveau_poids") then {["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_nouveau_poids", _voiture_possede_un_nouveau_poids] call saveToDB;};
			
			if (!isnil "_fuel") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Gasoil", _fuel] call saveToDB;};
			if (!isnil "_degat_general") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_general", _degat_general] call saveToDB;};
			if (!isnil "_dommage_roue_un") then {["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_un", _dommage_roue_un] call saveToDB;};
			if (!isnil "_dommage_roue_deux") then {["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_deux", _dommage_roue_deux] call saveToDB;};
			if (!isnil "_dommage_roue_trois") then {["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_trois", _dommage_roue_trois] call saveToDB;};
			if (!isnil "_dommage_roue_quatre") then {["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_quatre", _dommage_roue_quatre] call saveToDB;};
			if (!isnil "_body") then {["sauvegarde_voitures_fourrieres", _objSaveName, "body", _body] call saveToDB;};
			if (!isnil "_Fueldegat") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_reservoir_gasoil", _Fueldegat] call saveToDB;};
			if (!isnil "_HitEngine") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_moteur_un", _HitEngine] call saveToDB;};
			if (!isnil "_HitEngine2") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_moteur_deux", _HitEngine2] call saveToDB;};
			if (!isnil "_HitEngine3") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_moteur_trois", _HitEngine3] call saveToDB;};
			if (!isnil "_HitHRotor") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_rotor", _HitHRotor] call saveToDB;};
			if (!isnil "_HitVRotor") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_rotor_deux", _HitVRotor] call saveToDB;};
			if (!isnil "_HitBatteries") then {["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_batterie", _HitBatteries] call saveToDB;};
			if (!isnil "_HitLight") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_lumiere", _HitLight] call saveToDB;};
			if (!isnil "_HitHydraulics") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hydraulique", _HitHydraulics] call saveToDB;};
			if (!isnil "_HitTransmission") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_transmissions", _HitTransmission] call saveToDB;};
			if (!isnil "_HitGear") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_train_atterrisage", _HitGear] call saveToDB;};
			if (!isnil "_HitHStabilizerL1") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_stabilisateur", _HitHStabilizerL1] call saveToDB;};
			if (!isnil "_HitHStabilizerR1") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_stabilisateur_deux", _HitHStabilizerR1] call saveToDB;};
			if (!isnil "_HitVStabilizer1") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_stabilisateur_trois", _HitVStabilizer1] call saveToDB;};
			if (!isnil "_HitTail") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_trail", _HitTail] call saveToDB;};
			if (!isnil "_HitPitotTube") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_pitot", _HitPitotTube] call saveToDB;};
			if (!isnil "_HitStaticPort") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_static_port", _HitStaticPort] call saveToDB;};
			if (!isnil "_HitStarter1") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_strarter_un", _HitStarter1] call saveToDB;};
			if (!isnil "_HitStarter2") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_strarter_deux", _HitStarter2] call saveToDB;};
			if (!isnil "_HitStarter3") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_strarter_trois", _HitStarter3] call saveToDB;};
			if (!isnil "_HitAvionics") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_avionics", _HitAvionics] call saveToDB;};
			if (!isnil "_HitHull") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_hull", _HitHull] call saveToDB;};
			if (!isnil "_HitMissiles") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_missiles", _HitMissiles] call saveToDB;};
			if (!isnil "_HitRGlass") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_rg_glasse_un", _HitRGlass] call saveToDB;};
			if (!isnil "_HitLGlass") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_rg_glasse_deux", _HitLGlass] call saveToDB;};
			if (!isnil "_HitGlass1") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_une", _HitGlass1] call saveToDB;};
			if (!isnil "_HitGlass2") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_deux", _HitGlass2] call saveToDB;};
			if (!isnil "_HitGlass3") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_trois", _HitGlass3] call saveToDB;};
			if (!isnil "_HitGlass4") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_quatre", _HitGlass4] call saveToDB;};
			if (!isnil "_HitGlass5") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_cinq", _HitGlass5] call saveToDB;};
			if (!isnil "_HitGlass6") then {["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_six", _HitGlass6] call saveToDB;};
			
			_PersistentDB_ObjCount = _PersistentDB_ObjCount + 1;
		};
		sleep 0.5;
	} forEach vehicles;

	["sauvegarde_voitures_fourrieres", "Count", "Count", _PersistentDB_ObjCount] call saveToDB;

	diag_log format["Diag SFP : %1 voiture de la fourrière ont bien etes sav dans iniDB", _PersistentDB_ObjCount];

	_temps_attente_avant_sauvegarde = 2700; // Secondes
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitWith {_condition = false;}; // Arreter dernière sauvegarde
	while {_condition && _temps_attente_avant_sauvegarde > 0 && le_serveur_va_redemarrer_dans_20_minutes < 1} do
	{
		_temps_attente_avant_sauvegarde = round (_temps_attente_avant_sauvegarde - 5);
		sleep 5;
	};

	if (_condition) then {("sauvegarde_voitures_fourrieres") call delete_fichier_entier;};
};
