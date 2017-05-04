// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Voitures fourrieres : Lancement chargement 1/3." spawn historique_creation_log_sfp;

_check = ("sauvegarde_voitures_fourrieres") call base_de_donnee_existante;
if !(_check) exitwith {sleep 0.3; execvm "partie_serveur\persistence\world\voitures_fourriere\oSave_voitures_fourriere.sqf";};
_objectscount = ["sauvegarde_voitures_fourrieres", "Count", "Count", "test_valeur_existe"] call loadFromDB_Local_Serveur;
if !([_objectscount] call verification_si_donnee_existe) exitwith {sleep 0.3; execvm "partie_serveur\persistence\world\voitures_fourriere\oSave_voitures_fourriere.sqf";};

"DIAG SFP : Voitures fourrieres : Lancement chargement 2/3." spawn historique_creation_log_sfp;

for "_i" from 0 to (_objectscount - 1) do
{
	_objSaveName = format["voiture fourriere numero %1", _i];
	
	_class = ["sauvegarde_voitures_fourrieres", _objSaveName, "classname", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_pos = ["sauvegarde_voitures_fourrieres", _objSaveName, "pos", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_direction = ["sauvegarde_voitures_fourrieres", _objSaveName, "Direction", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_leproprietaire = ["sauvegarde_voitures_fourrieres", _objSaveName, "leproprietaire", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_plaque_immatriculation = ["sauvegarde_voitures_fourrieres", _objSaveName, "plaque_immatriculation_news", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_voiture_possede_un_klaxon = ["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_klaxon", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_une_puce = ["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_une_puce", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_neon = ["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_neon", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_radar_de_recul = ["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_radar_de_recul", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_detecteur_de_radar = ["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_detecteur_de_radar", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_nouveau_poids = ["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_un_nouveau_poids", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_couleur_du_vehicule = ["sauvegarde_voitures_fourrieres", _objSaveName, "Couleur du vehicule", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_de_l_eau = ["sauvegarde_voitures_fourrieres", _objSaveName, "reservoir_d_eau_pour_pompier", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_prix_du_vehicule_neuf = ["sauvegarde_voitures_fourrieres", _objSaveName, "prix_du_vehicule_neuf", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_une_assurance = ["sauvegarde_voitures_fourrieres", _objSaveName, "voiture_possede_une_assurance", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_gasoil = ["sauvegarde_voitures_fourrieres", _objSaveName, "Gasoil", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_espace_total = ["sauvegarde_voitures_fourrieres", _objSaveName, "Espace Total", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_dommage_roue_un = ["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_un", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_dommage_roue_deux = ["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_deux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_dommage_roue_trois = ["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_trois", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_dommage_roue_quatre = ["sauvegarde_voitures_fourrieres", _objSaveName, "dommage_roue_quatre", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_body = ["sauvegarde_voitures_fourrieres", _objSaveName, "body", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_general = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_general", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_reservoir_gasoil = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_reservoir_gasoil", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_moteur_un = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_moteur_un", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_moteur_deux = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_moteur_deux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_moteur_trois = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_moteur_trois", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_rotor = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_rotor", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_rotor_deux = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_rotor_deux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_batterie = ["sauvegarde_voitures_fourrieres", _objSaveName, "Degat_batterie", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_lumiere = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_lumiere", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hydraulique = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hydraulique", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_transmission = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_transmissions", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_train_atterissage = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_train_atterrisage", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_fuel = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_fuel", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_stabilisateur = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_stabilisateur", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_stabilisateur_deux = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_stabilisateur_deux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_stabilisateur_trois = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_stabilisateur_trois", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_trail = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_trail", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_pitot = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_pitot", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_static_port = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_static_port", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_strarter_un = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_strarter_un", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_strarter_deux	= ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_strarter_deux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_strarter_trois = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_strarter_trois", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_avionics = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_avionics", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_hull = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_hull", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_hit_missiles = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_hit_missiles", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_rg_glasse_un = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_rg_glasse_un", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_rg_glasse_deux = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_rg_glasse_deux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_glasse_une = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_une", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_glasse_deux = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_deux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_glasse_trois = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_trois", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_glasse_quatre = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_quatre", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_glasse_cinq = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_cinq", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_degat_glasse_six = ["sauvegarde_voitures_fourrieres", _objSaveName, "degat_glasse_six", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	if ([_objSaveName] call verification_si_donnee_existe && [_class] call verification_si_donnee_existe && [_pos] call verification_si_donnee_existe && [_direction] call verification_si_donnee_existe) then 
	{
		_type = "CAN COLLIDE";
		_placement = 0;
		
		_obj = createVehicle [_class,_pos, [], _placement, _type];
		_obj setPosATL _pos;
		_obj setVectorDirAndUp _direction;
		
		sleep 1;
		[_obj, false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
		sleep 2;
		
		if ([_espace_total] call verification_si_donnee_existe) then {if (_espace_total > 0) then {_obj setVariable ["totalspace", _espace_total, true];} else {_obj setVariable ["totalspace", 45, true];};};
		
		if ([_gasoil] call verification_si_donnee_existe) then {if (_gasoil > 0) then {_obj setfuel _gasoil;};};
		if ([_dommage_roue_un] call verification_si_donnee_existe) then {if (_dommage_roue_un > 0) then {_obj setHitPointDamage ["HitLBWheel", _dommage_roue_un];};};
		if ([_dommage_roue_deux] call verification_si_donnee_existe) then {if (_dommage_roue_deux > 0) then {_obj setHitPointDamage ["HitLBWheel", _dommage_roue_deux];};};
		if ([_dommage_roue_trois] call verification_si_donnee_existe) then {if (_dommage_roue_trois > 0) then {_obj setHitPointDamage ["HitLBWheel", _dommage_roue_trois];};};
		if ([_dommage_roue_quatre] call verification_si_donnee_existe) then {if (_dommage_roue_quatre > 0) then {_obj setHitPointDamage ["HitLBWheel", _dommage_roue_quatre];};};
		
		
		if ([_body] call verification_si_donnee_existe) then {if (_body > 0) then {_obj setHitPointDamage ["HitBody", _body];};};
		if ([_degat_general] call verification_si_donnee_existe) then {if (_degat_general > 0) then {_obj setdamage _degat_general;};};
		if ([_degat_reservoir_gasoil] call verification_si_donnee_existe) then {if (_degat_reservoir_gasoil > 0) then {_obj setHitPointDamage ["HitFuel", _degat_reservoir_gasoil];};};
		if ([_degat_moteur_un] call verification_si_donnee_existe) then {if (_degat_moteur_un > 0) then {_obj setHitPointDamage ["HitEngine", _degat_moteur_un];};};
		if ([_degat_moteur_deux] call verification_si_donnee_existe) then {if (_degat_moteur_deux > 0) then {_obj setHitPointDamage ["HitEngine2", _degat_moteur_deux];};};
		if ([_degat_moteur_trois] call verification_si_donnee_existe) then {if (_degat_moteur_trois > 0) then {_obj setHitPointDamage ["HitEngine3", _degat_moteur_trois];};};
		if ([_degat_rotor] call verification_si_donnee_existe) then {if (_degat_rotor > 0) then {_obj setHitPointDamage ["HitHRotor", _degat_rotor];};};
		if ([_degat_rotor_deux] call verification_si_donnee_existe) then {if (_degat_rotor_deux > 0) then {_obj setHitPointDamage ["HitVRotor", _degat_rotor_deux];};};
		if ([_degat_batterie] call verification_si_donnee_existe) then {if (_degat_batterie > 0) then {_obj setHitPointDamage ["HitBatteries", _degat_batterie];};};
		if ([_degat_lumiere] call verification_si_donnee_existe) then {if (_degat_lumiere > 0) then {_obj setHitPointDamage ["HitLight", _degat_lumiere];};};
		if ([_degat_hydraulique] call verification_si_donnee_existe) then {if (_degat_hydraulique > 0) then {_obj setHitPointDamage ["HitHydraulics", _degat_hydraulique];};};
		if ([_degat_transmission] call verification_si_donnee_existe) then {if (_degat_transmission > 0) then {_obj setHitPointDamage ["HitTransmission", _degat_transmission];};};
		if ([_degat_train_atterissage] call verification_si_donnee_existe) then {if (_degat_train_atterissage > 0) then {_obj setHitPointDamage ["HitGear", _degat_train_atterissage];};};
		if ([_degat_stabilisateur] call verification_si_donnee_existe) then {if (_degat_stabilisateur > 0) then {_obj setHitPointDamage ["HitHStabilizerL1", _degat_stabilisateur];};};
		if ([_degat_stabilisateur_deux] call verification_si_donnee_existe) then {if (_degat_stabilisateur_deux > 0) then {_obj setHitPointDamage ["HitHStabilizerR1", _degat_stabilisateur_deux];};};
		if ([_degat_stabilisateur_trois] call verification_si_donnee_existe) then {if (_degat_stabilisateur_trois > 0) then {_obj setHitPointDamage ["HitVStabilizer1", _degat_stabilisateur_trois];};};
		if ([_degat_hit_trail] call verification_si_donnee_existe) then {if (_degat_hit_trail > 0) then {_obj setHitPointDamage ["HitTail", _degat_hit_trail];};};
		if ([_degat_hit_pitot] call verification_si_donnee_existe) then {if (_degat_hit_pitot > 0) then {_obj setHitPointDamage ["HitPitotTube", _degat_hit_pitot];};};
		if ([_degat_static_port] call verification_si_donnee_existe) then {if (_degat_static_port > 0) then {_obj setHitPointDamage ["HitStaticPort", _degat_static_port];};};
		if ([_degat_hit_strarter_un] call verification_si_donnee_existe) then {if (_degat_hit_strarter_un > 0) then {_obj setHitPointDamage ["HitStarter1", _degat_hit_strarter_un];};};
		if ([_degat_hit_strarter_deux] call verification_si_donnee_existe) then {if (_degat_hit_strarter_deux > 0) then {_obj setHitPointDamage ["HitStarter2", _degat_hit_strarter_deux];};};
		if ([_degat_hit_strarter_trois] call verification_si_donnee_existe) then {if (_degat_hit_strarter_trois > 0) then {_obj setHitPointDamage ["HitStarter3", _degat_hit_strarter_trois];};};
		if ([_degat_hit_avionics] call verification_si_donnee_existe) then {if (_degat_hit_avionics > 0) then {_obj setHitPointDamage ["HitAvionics", _degat_hit_avionics];};};
		if ([_degat_hit_hull] call verification_si_donnee_existe) then {if (_degat_hit_hull > 0) then {_obj setHitPointDamage ["HitHull", _degat_hit_hull];};};
		if ([_degat_hit_missiles] call verification_si_donnee_existe) then {if (_degat_hit_missiles > 0) then {_obj setHitPointDamage ["HitMissiles", _degat_hit_missiles];};};
		if ([_degat_rg_glasse_un] call verification_si_donnee_existe) then {if (_degat_rg_glasse_un > 0) then {_obj setHitPointDamage ["HitRGlass", _degat_rg_glasse_un];};};
		if ([_degat_rg_glasse_deux] call verification_si_donnee_existe) then {if (_degat_rg_glasse_deux > 0) then {_obj setHitPointDamage ["HitLGlass", _degat_rg_glasse_deux];};};
		if ([_degat_glasse_une] call verification_si_donnee_existe) then {if (_degat_glasse_une > 0) then {_obj setHitPointDamage ["HitGlass1", _degat_glasse_une];};};
		if ([_degat_glasse_deux] call verification_si_donnee_existe) then {if (_degat_glasse_deux > 0) then {_obj setHitPointDamage ["HitGlass2", _degat_glasse_deux];};};
		if ([_degat_glasse_trois] call verification_si_donnee_existe) then {if (_degat_glasse_trois > 0) then {_obj setHitPointDamage ["HitGlass3", _degat_glasse_trois];};};
		if ([_degat_glasse_quatre] call verification_si_donnee_existe) then {if (_degat_glasse_quatre > 0) then {_obj setHitPointDamage ["HitGlass4", _degat_glasse_quatre];};};
		if ([_degat_glasse_cinq] call verification_si_donnee_existe) then {if (_degat_glasse_cinq > 0) then {_obj setHitPointDamage ["HitGlass5", _degat_glasse_cinq];};};
		if ([_degat_glasse_six] call verification_si_donnee_existe) then {if (_degat_glasse_six > 0) then {_obj setHitPointDamage ["HitGlass6", _degat_glasse_six];};};
		if ([_leproprietaire] call verification_si_donnee_existe) then {if (count _leproprietaire > 0) then {_obj setvariable ["vehicule_info_parvariable",_leproprietaire ,true];};};
		if ([_plaque_immatriculation] call verification_si_donnee_existe) then {if (count _plaque_immatriculation > 0) then {_obj setvariable ["plaque_immatriculation_news",_plaque_immatriculation ,true];};};
		
		if ([_voiture_possede_un_neon] call verification_si_donnee_existe) then {if (count _voiture_possede_un_neon > 0) then {_obj setvariable ["voiture_possede_un_neon",_voiture_possede_un_neon ,true];};};
		if ([_voiture_possede_une_puce] call verification_si_donnee_existe) then {if (count _voiture_possede_une_puce > 0) then {_obj setvariable ["voiture_possede_une_puce",_voiture_possede_une_puce ,true];};};
		if ([_voiture_possede_un_radar_de_recul] call verification_si_donnee_existe) then {if (count _voiture_possede_un_radar_de_recul > 0) then {_obj setvariable ["voiture_possede_un_radar_de_recul",_voiture_possede_un_radar_de_recul ,true];};};
		if ([_voiture_possede_un_klaxon] call verification_si_donnee_existe) then {if (count _voiture_possede_un_klaxon > 0) then {_obj setvariable ["voiture_possede_un_klaxon",_voiture_possede_un_klaxon ,true];};};
		if ([_voiture_possede_un_nouveau_poids] call verification_si_donnee_existe) then {if (count _voiture_possede_un_nouveau_poids > 0) then {_obj setvariable ["voiture_possede_un_nouveau_poids",_voiture_possede_un_nouveau_poids ,true];};};
		if ([_voiture_possede_un_detecteur_de_radar] call verification_si_donnee_existe) then {if (count _voiture_possede_un_detecteur_de_radar > 0) then {_obj setvariable ["voiture_possede_un_detecteur_de_radar",_voiture_possede_un_detecteur_de_radar ,true];};};
		if ([_voiture_possede_de_l_eau] call verification_si_donnee_existe) then {if (_voiture_possede_de_l_eau > 0) then {_obj setvariable ["reservoir_d_eau_pour_pompier",_voiture_possede_de_l_eau ,true];};};
		if ([_voiture_prix_du_vehicule_neuf] call verification_si_donnee_existe) then {if (_voiture_prix_du_vehicule_neuf > 0) then {_obj setvariable ["prix_du_vehicule_neuf",_voiture_prix_du_vehicule_neuf ,true];};};
		if ([_voiture_possede_une_assurance] call verification_si_donnee_existe) then {if (_voiture_possede_une_assurance > 0) then {_obj setvariable ["voiture_possede_une_assurance", _voiture_possede_une_assurance ,true];};};
		
		if ([_couleur_du_vehicule] call verification_si_donnee_existe) then
		{
			if (count _couleur_du_vehicule > 0) then
			{	
				for "_i" from 0 to (count _couleur_du_vehicule - 1) do
				{
					_obj setObjectTextureGlobal [_i, _couleur_du_vehicule select _i];		
				};
			};
		};
		
		_obj lock true;

	};
};

sleep 10;
execVM "partie_serveur\persistence\world\voitures_fourriere\oSave_voitures_fourriere.sqf";
diag_log format["Diag SFP : Chargement de %1 Voitures_fourriere de iniDB", _objectscount];
"DIAG SFP : Voitures fourrieres : Lancement chargement 3/3." spawn historique_creation_log_sfp;
