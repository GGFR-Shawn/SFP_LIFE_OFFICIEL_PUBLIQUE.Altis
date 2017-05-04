// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

message_en_bas_de_couleur_sfp = 
{
	[format["<t size='0.75' color='#ffff00'>%1</t>",_this], 0,1,5,0,0,301] spawn bis_fnc_dynamicText;
};

SFP_Endommager_Pneus_Nid_De_Poules = 
{
	_vehicule = _this select 0; 
	if (isnil "_vehicule") exitwith {};
	
	if (((assignedVehicleRole player) select 0) == "Driver") then
	{
		_vehicule setHit ["wheel_1_1_steering", random 1];sleep 0.045;
		_vehicule setHit ["wheel_1_2_steering", random 1];sleep 0.045;
		_vehicule setHit ["wheel_2_1_steering", random 1];sleep 0.045;
		_vehicule setHit ["wheel_2_2_steering", random 1];sleep 0.045;
		_vehicule setHit ["wheel_2_1_damper", random 1];sleep 0.045;
		_vehicule setHit ["wheel_2_2_damper", random 1];sleep 0.045;

		hint "Aie Aie Aie ! Vous êtes passé trop vite sur un nid de poule ! \n\n La prochaine fois, passez à moins de 50 Kms/heures sur les routes fissurées (voir carte).";
	};	
};

SFP_creuver_pneu = 
{
	_vehicule = _this select 0; 
	if (isnil "_vehicule") exitwith {};
	
	_vehicule setHit ["wheel_1_1_steering", 1];
	_vehicule setHit ["wheel_1_2_steering", 1];
	_vehicule setHit ["wheel_2_1_steering", 1];
	_vehicule setHit ["wheel_2_2_steering", 1];
	_vehicule setHit ["wheel_2_1_damper", 1];
	_vehicule setHit ["wheel_2_2_damper", 1];
	
	_vehicule say "explosiondupneu";
	sleep (random 0.10);
	_vehicule say "explosiondupneu";
	sleep (random 0.10);
	_vehicule say "explosiondupneu";
	sleep (random 0.10);
	_vehicule say "explosiondupneu";
	sleep (random 0.10);
};

bar_de_progression_by_maxou =
{
	_delai = round (_this select 0);
	if (isnil "_delai") exitwith {hint "Erreur lancement barre de progression !";};
	
	disableSerialization;
	99999 cutRsc ["Bar_De_Progression","PLAIN",1,true];

	for "_i" from 1 to _delai do 
	{
		if (alive player && isnil "bar_de_progression_by_maxou_reinitialisation") then
		{
			((uiNamespace getVariable "Bar_De_Progression") displayCtrl 5000) progressSetPosition (_i / _delai); 
			((uiNamespace getVariable "Bar_De_Progression") displayCtrl 5001) ctrlSetStructuredText parseText format ["Pourcentage restant %1 %2 \ Temps restant : %3 Secondes ...", round (100 - ((_i / _delai) * 100)), "%", _delai - _i];
			sleep 1;
		}else
		{
			99999 cutText ["", "PLAIN"];
		};
	};  
	99999 cutText ["", "PLAIN"];
	bar_de_progression_by_maxou_reinitialisation = nil;
};

bar_de_progression_revive_by_maxou =
{
	_delais_revive_soigner_patient_base = 100;
	delais_revive_soigner_patient = 50;
	_touche_du_revive_choix_a_appuyer = [["ESPACE",57],["CTRL GAUCHE",29],["ALT GAUCHE",56]];
	touche_du_revive_valider = (_touche_du_revive_choix_a_appuyer call bis_fnc_selectrandom);
	autorisation_barre_pour_revive = true;
	
	disableSerialization;
	99999 cutRsc ["Bar_De_Progression","PLAIN",1,true];

	while {alive player && (delais_revive_soigner_patient > 0 && delais_revive_soigner_patient < 99)} do
	{
		if (isnil "bar_de_progression_by_maxou_reinitialisation") then
		{
			((uiNamespace getVariable "Bar_De_Progression") displayCtrl 5000) progressSetPosition (delais_revive_soigner_patient / _delais_revive_soigner_patient_base); 
			((uiNamespace getVariable "Bar_De_Progression") displayCtrl 5001) ctrlSetStructuredText parseText format ["!!! HEMORAGIE !!!!! Appuyer sur la touche %1 pour eviter le décès du joueur ! Actuel : %2/%3 %4.", touche_du_revive_valider select 0, round (delais_revive_soigner_patient), _delais_revive_soigner_patient_base, "%"];
			
			delais_revive_soigner_patient = (delais_revive_soigner_patient - (random 1));
			
			if (round random 10 == 1) then
			{
				touche_du_revive_valider = (_touche_du_revive_choix_a_appuyer call bis_fnc_selectrandom);
			};
			
			sleep 0.1;
		}else
		{
			99999 cutText ["", "PLAIN"];
		};
	};  
	99999 cutText ["", "PLAIN"];
	
	bar_de_progression_by_maxou_reinitialisation = nil;
	autorisation_barre_pour_revive = nil;
};

bar_de_progression_banque_by_maxou =
{
	_delai = round (_this select 0);
	if (isnil "_delai") exitwith {hint "Erreur lancement barre de progression !";};
	
	disableSerialization;
	99999 cutRsc ["Bar_De_Progression","PLAIN",1,true];

	for "_i" from 1 to _delai do 
	{
		if (alive player && isnil "bar_de_progression_by_maxou_reinitialisation") then
		{
			((uiNamespace getVariable "Bar_De_Progression") displayCtrl 5000) progressSetPosition (_i / _delai); 
			((uiNamespace getVariable "Bar_De_Progression") displayCtrl 5001) ctrlSetStructuredText parseText format ["Pourcentage restant %1 %2 \ Temps restant : %3 Secondes ...", pourcentage_barre_braquage_de_banque, "%", _delai - _i];
			sleep 1;
		}else
		{
			99999 cutText ["", "PLAIN"];
		};
	};  
	99999 cutText ["", "PLAIN"];
	bar_de_progression_by_maxou_reinitialisation = nil;
};

compil_plaque_immatriculation =
{
	_lettres = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]; 
	_numero_de_plaque_choisit = format ["%1%2-%3-%4%5", _lettres call bis_fnc_selectrandom,_lettres call bis_fnc_selectrandom,round (random 999),_lettres call bis_fnc_selectrandom,_lettres call bis_fnc_selectrandom];
	_numero_de_plaque_choisit = [_numero_de_plaque_choisit, _numero_de_plaque_choisit];
	_numero_de_plaque_choisit;
};

affichage_des_noms_des_joueurs = 
{
	_recherche_des_joueurs_noms = player nearEntities [['MAN',"LANDVEHICLE"], 16];
	{
		_ligne_de_recherche = lineIntersects [eyePos player, eyePos _x,player, _x];
		if(!_ligne_de_recherche) then
		{
			switch (true) do
			{
				case (_x getvariable "ma_date_de_naissance" >= 0 && isplayer _x && _x != player && alive _x) : 
				{
					private ["_texte_playertag", "_joueur_parle", "_sa_date_de_naissance_calcul_tag", "_texte_calcul_playertag"];
					_texte_playertag = "";
					_joueur_parle = "";
					_sa_date_de_naissance_calcul_tag = 0;
					_texte_calcul_playertag = "";
					
					_sa_date_de_naissance = _x getvariable "ma_date_de_naissance";
					if (_sa_date_de_naissance >= 60) then {_sa_date_de_naissance_calcul_tag = _sa_date_de_naissance / 60;} else {_sa_date_de_naissance_calcul_tag = 0;};
					if (_sa_date_de_naissance >= 99999999999999999) then {_texte_calcul_playertag = "Jésus";}else{_texte_calcul_playertag = format ["%1 H",round _sa_date_de_naissance_calcul_tag];};
					
					if (!isnil {_x getvariable "ma_carte_identite"}) then
					{
						if (_x getvariable "ma_carte_identite" select 1 != "nom" && isnil {_x getvariable "avertir_carte_tuer"}) then
						{
							_texte_playertag = _joueur_parle + format ["%1 %2 - (%3)", _x getvariable "ma_carte_identite" select 1, _x getvariable "ma_carte_identite" select 2, _texte_calcul_playertag]; 
						} else
						{
							if (isnil {_x getvariable "avertir_carte_tuer"}) then
							{
								_texte_playertag = _joueur_parle + format ["Clandestin : %1 - (%2)", name _x, _texte_calcul_playertag]; 
							}else
							{
								_texte_playertag = _joueur_parle + format ["%1", _x getvariable "ma_carte_identite" select 2]; 						
							};
						};
					};
										
					// if (!(isnil {_x getvariable "avertir_carte_tuer"}) or getplayeruid player in sfp_config_liste_moderateur) then
					if (!(isnil {_x getvariable "avertir_carte_tuer"}) or sfp_config_activer_nom_des_joueurs_en_jeu) then
					{
						drawIcon3D ["", [1,1,1,1], [(getPosATL _x select 0), (getPosATL _x select 1), (getPosATL _x select 2) + 2.2], 0, 0, 45, _texte_playertag, 1, 0.030, "PuristaBold"];
					};
				};
				
				case (!isnil {_x getvariable "plaque_immatriculation_news"} && driver vehicle _x != player) : 
				{
					if (count (_x getvariable "plaque_immatriculation_news") >= 2) then
					{	
						private "_texte_playertag";
						_texte_playertag = "";
						
						if (je_suis_en_service_a_la_sarl_depannage >= 1) then
						{
							_texte_playertag = format ["%1 - (%2 %3)", _x getvariable "plaque_immatriculation_news" select 0, round (getDammage _x * 100), "%"];
						}else
						{
							_texte_playertag = format ["%1", _x getvariable "plaque_immatriculation_news" select 0];
						};
						
						drawIcon3D ["", [1,1,1,1], [(getPosATL _x select 0), (getPosATL _x select 1), (getPosATL _x select 2) + 3], 0, 0, 45, _texte_playertag, 1, 0.037, "PuristaBold"];
					};
				};
			};
		};
	} forEach _recherche_des_joueurs_noms ;
}; 

condition_effet_grenade_fumigene = 
{
	_listes_des_effets_de_grenade_sfp_maxou = ["SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow","Smokeshell"];
	_detection = (getPosATL player) nearObjects ["SmokeShell", 4];
	
	_retour_grenade = false;
	if (count _detection > 0) then
	{
		if (typeof (_detection select 0) in _listes_des_effets_de_grenade_sfp_maxou && getPosATL (_detection select 0) select 2 < 0.5) then 
		{
			_retour_grenade = true;
		};
	};
	_retour_grenade;
};

dire_les_kills = 
{
	if (isnil "nombre_de_kill_total") then {nombre_de_kill_total = 0; publicvariable "nombre_de_kill_total";};
	
	_this spawn
	{
		if (_this select 0 select 10) then
		{			
			sleep 0.5;
			if (!alive (_this select 0 select 0)) then
			{
				if (!isnil {(_this select 0 select 0) getvariable "information_freekil_joueur"}) then
				{
					(_this select 0 select 0) setvariable ["information_freekil_joueur",nil,false];

					nombre_de_kill_total = round (nombre_de_kill_total + 1); 
					publicvariable "nombre_de_kill_total";
					
					_le_joueur = (name (_this select 0 select 0));
					_le_tueur = (name (_this select 0 select 1));
					_la_position = format ["%1%2",round ((_this select 0 select 3 select 0) / 100),round ((_this select 0 select 3 select 1) / 100)];
					_la_distance = round ((_this select 0 select 0) distance (_this select 0 select 1));
					_arme_du_tueur = (currentWeapon (_this select 0 select 1));
					_arme_du_tueur_nom = getText (configFile >> "cfgWeapons" >> _arme_du_tueur >> "displayName");
					_type_de_balle = getText (configFile >> "cfgMagazines" >> (getarray (configFile >> "cfgWeapons" >> _arme_du_tueur >> "magazines") select 0) >> "displayName");
					if (isnil "_type_de_balle") then {_type_de_balle = format ["(Pas d'infos sur la munition. Le type simple est donc : %1)",(_this select 0 select 6 select 4)];};
					_l_endroit_du_tir = format ["dans %1",_this select 0 select 5 select 0];
					if (_l_endroit_du_tir == "dans Head") then {_l_endroit_du_tir = "dans la tête";};
					if (_l_endroit_du_tir == "dans Body") then {_l_endroit_du_tir = "dans le corp";};
					if (_l_endroit_du_tir == "dans hands") then {_l_endroit_du_tir = "dans la main";};
					if (_l_endroit_du_tir == "dans legs") then {_l_endroit_du_tir = "dans la jambe";};
					if (_l_endroit_du_tir == "dans rightlegs") then {_l_endroit_du_tir = "dans la jambe";};
					if (_l_endroit_du_tir == "dans leftlegs") then {_l_endroit_du_tir = "dans la jambe";};
					if (_l_endroit_du_tir == "dans leftupleg") then {_l_endroit_du_tir = "dans la jambe";};
					if (_l_endroit_du_tir == "dans rightupleg") then {_l_endroit_du_tir = "dans la jambe";};
					if (_l_endroit_du_tir == "dans spine1") then {_l_endroit_du_tir = "dans le dos";};
					if (_l_endroit_du_tir == "dans spine2") then {_l_endroit_du_tir = "dans le dos";};
					if (_l_endroit_du_tir == "dans spine3") then {_l_endroit_du_tir = "dans le dos";};
					if (_l_endroit_du_tir == "dans pelvis") then {_l_endroit_du_tir = "dans le bassin";};
					if (_l_endroit_du_tir == "dans neck") then {_l_endroit_du_tir = "dans le cou";};
					if (_l_endroit_du_tir == "dans neck1") then {_l_endroit_du_tir = "dans le cou";};
					
					if (nombre_de_kill_total <= 1) then
					{
						_nombre_de_tiret = 4;
						for "_i" from 0 to _nombre_de_tiret do
						{
							["Historique kill des joueurs", "Historique kill des joueurs", "============================================================================================", "============================================================================================"] call fn_SaveToServer;
							sleep 0.01;
						};
					};
					
					_heure_du_kill = format ["%1/%2/%3 à %4H%5Min:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
					_nom_du_kill = format ["Kill numéro %1 du %2", nombre_de_kill_total, _heure_du_kill];
					_detail_du_kill = format ["%1 à été tué par %2 à la position %3. Il s'est prit une balle %4 de type %5 qui était sur l'arme %6 (%7). Ils étaient à %8 mètres de distance.",_le_joueur, _le_tueur, _la_position, _l_endroit_du_tir, _type_de_balle, _arme_du_tueur, _arme_du_tueur_nom, _la_distance];
					["Historique kill des joueurs", "Historique kill des joueurs", _nom_du_kill, _detail_du_kill] call fn_SaveToServer;
				};
			};
		};
	};
};

listes_des_avatars_carte_identite =
[
	"textures\icones\avatars\avatar_0001.jpg","textures\icones\avatars\avatar_0002.jpg","textures\icones\avatars\avatar_0003.jpg","textures\icones\avatars\avatar_0004.jpg","textures\icones\avatars\avatar_0005.jpg","textures\icones\avatars\avatar_0006.jpg","textures\icones\avatars\avatar_0007.jpg",
	"textures\icones\avatars\avatar_0008.jpg","textures\icones\avatars\avatar_0009.jpg","textures\icones\avatars\avatar_0010.jpg","textures\icones\avatars\avatar_0011.jpg","textures\icones\avatars\avatar_0012.jpg","textures\icones\avatars\avatar_0013.jpg","textures\icones\avatars\avatar_0014.jpg",
	"textures\icones\avatars\avatar_0015.jpg","textures\icones\avatars\avatar_0016.jpg","textures\icones\avatars\avatar_0017.jpg","textures\icones\avatars\avatar_0018.jpg","textures\icones\avatars\avatar_0019.jpg","textures\icones\avatars\avatar_0020.jpg","textures\icones\avatars\avatar_0021.jpg",
	"textures\icones\avatars\avatar_0022.jpg","textures\icones\avatars\avatar_0023.jpg","textures\icones\avatars\avatar_0024.jpg","textures\icones\avatars\avatar_0025.jpg","textures\icones\avatars\avatar_0026.jpg","textures\icones\avatars\avatar_0027.jpg","textures\icones\avatars\avatar_0028.jpg",
	"textures\icones\avatars\avatar_0029.jpg","textures\icones\avatars\avatar_0030.jpg","textures\icones\avatars\avatar_0031.jpg","textures\icones\avatars\avatar_0032.jpg","textures\icones\avatars\avatar_0033.jpg","textures\icones\avatars\avatar_0034.jpg","textures\icones\avatars\avatar_0035.jpg",
	"textures\icones\avatars\avatar_0036.jpg","textures\icones\avatars\avatar_0037.jpg","textures\icones\avatars\avatar_0038.jpg","textures\icones\avatars\avatar_0039.jpg"
];

retour_formatage_chiffre_sfp =
{
	private ["_valeur_integre", "_retour", "_valeur_integre_deux", "_decimalPoint", "_thousandsSeparator", "_basePlaces"];

	_valeur_a_traite = _this;
	_valeur_integre = round (abs _valeur_a_traite);
	_valeur_integre_deux = 0;
	_retour = "";

	while {_valeur_integre > 0} do 
	{
		if (_valeur_integre_deux > 0 && {(_valeur_integre_deux mod 3) == 0}) then {_retour = "," + _retour;};

		_retour =  (str (_valeur_integre mod 10)) + _retour;
		_valeur_integre_deux = _valeur_integre_deux + 1;
		_valeur_integre = floor (_valeur_integre / 10);
	};

	while {_valeur_integre_deux < 0} do 
	{
		if (_valeur_integre_deux > 0 && {(_valeur_integre_deux mod 3) == 0}) then {_retour = "," + _retour;};

		_retour = "0" + _retour;
		_valeur_integre_deux = _valeur_integre_deux + 1;
	};

	if (_valeur_a_traite < 0) then {_retour = "-" + _retour;};
	if (_retour == "") then {_retour = "0";};
	
	_retour;
};

debug_farming_vehicule =
{
	_le_vehicule = _this select 0;
	_type = typeOf _le_vehicule;
	if (isnil "_le_vehicule") exitwith {systemchat "Erreur farming vehicule ...";};

	_lancement_initilisation_inventaire = [_le_vehicule] execvm "config\tailles_des_inventaires_des_vehicules.sqf";
	waitUntil {scriptDone _lancement_initilisation_inventaire;};
	
	if (valeur_de_l_inventaire_vehicule_a_appliquer != 0) then 
	{
		if (isnil {_le_vehicule getvariable "totalspace"}) then {_le_vehicule setVariable["totalspace",valeur_de_l_inventaire_vehicule_a_appliquer,true];};
		if (_le_vehicule getvariable "totalspace" != valeur_de_l_inventaire_vehicule_a_appliquer) then {_le_vehicule setVariable["totalspace",valeur_de_l_inventaire_vehicule_a_appliquer,true];};

		if (isnil {_le_vehicule getvariable "usedspace"}) then {_le_vehicule setvariable ["usedspace",0,true];};
		if (typename (_le_vehicule getvariable "usedspace") != typename 0) then {_le_vehicule setvariable ["usedspace",0,true];};
		if (_le_vehicule getvariable "usedspace" < 0) then {_le_vehicule setvariable ["usedspace",0,true];};
		if (_le_vehicule getvariable "usedspace" > 700) then {_le_vehicule setvariable ["usedspace",700,true];};
	};
};

nombre_de_vehicule_max_sur_la_carte =
{
	private "_nombre_max_de_vehicule_sur_la_carte";
	_nombre_max_de_vehicule_sur_la_carte = sfp_config_nombre_de_vehicule_max_par_joueur_sorties_civil;
	if (getPlayerUID player in whitelist_sarl_et_furious) then {_nombre_max_de_vehicule_sur_la_carte = sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_altis_and_furious;};
	if (!isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then {_nombre_max_de_vehicule_sur_la_carte = sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_carshop;};
	if (!isnil "jesuis_au_taff_a_la_sarl_neomedia") then {_nombre_max_de_vehicule_sur_la_carte = sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_neomedia;};

	{
		if (name player == _x getvariable "vehicule_info_parvariable" select 0) then
		{
			_nombre_max_de_vehicule_sur_la_carte = round (_nombre_max_de_vehicule_sur_la_carte - 1);
		};
	} foreach vehicles;
	_nombre_max_de_vehicule_sur_la_carte
};

sfp_afficher_dernier_vehicule_achete =
{
	sleep 2;
	_le_vehicule = _this;
	_sa_plaque = _le_vehicule getvariable "plaque_immatriculation_news" select 1; 
	_son_nom = getText ( configFile >> "CfgVehicles" >> typeOf(_le_vehicule) >> "displayName");
	if (isnil "_le_vehicule" or isnil "_sa_plaque" or isnil "_son_nom") exitwith {};
	
	mon_dernier_vehicule_achete = format ["<br/>Dernier VEH : %1 (%2) <br/>", _son_nom, _sa_plaque];
	['mon_dernier_vehicule_achete', mon_dernier_vehicule_achete] call uid_sauvegarde_ecrire_local_joueur_sfp;
};

supprimer_inventaire_farming_etc =
{
	private "_sur_quoi";
	_sur_quoi = _this select 0;
	_quel_farming = _this select 1;
	if (isnil "_sur_quoi" or isnil "_quel_farming") exitwith {};
	
	for "_i" from 0 to (count _quel_farming - 1) do
	{
		switch (_quel_farming select _i) do
		{
			// Legal
			case "0" :
			{
				if (!isnil {_sur_quoi getvariable "item_pomme_sfp"}) then {if (_sur_quoi getvariable "item_pomme_sfp" > 0) then {_sur_quoi setVariable["item_pomme_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_sel_sfp"}) then {if (_sur_quoi getvariable "item_sel_sfp" > 0) then {_sur_quoi setVariable["item_sel_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_pomme_de_terre_sfp"}) then {if (_sur_quoi getvariable "item_pomme_de_terre_sfp" > 0) then {_sur_quoi setVariable["item_pomme_de_terre_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_or_non_transforme_sfp"}) then {if (_sur_quoi getvariable "item_or_non_transforme_sfp" > 0) then {_sur_quoi setVariable["item_or_non_transforme_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_or_transforme_sfp"}) then {if (_sur_quoi getvariable "item_or_transforme_sfp" > 0) then {_sur_quoi setVariable["item_or_transforme_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_bois_sfp"}) then {if (_sur_quoi getvariable "item_bois_sfp" > 0) then {_sur_quoi setVariable["item_bois_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_lapins_sfp"}) then {if (_sur_quoi getvariable "item_lapins_sfp" > 0) then {_sur_quoi setVariable["item_lapins_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_truffe_sfp"}) then {if (_sur_quoi getvariable "item_truffe_sfp" > 0) then {_sur_quoi setVariable["item_truffe_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_poissons_sfp"}) then {if (_sur_quoi getvariable "item_poissons_sfp" > 0) then {_sur_quoi setVariable["item_poissons_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "itemfishpoissonspanes"}) then {if (_sur_quoi getvariable "itemfishpoissonspanes" > 0) then {_sur_quoi setVariable["itemfishpoissonspanes",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_petrole_non_traite_sfp"}) then {if (_sur_quoi getvariable "item_petrole_non_traite_sfp" > 0) then {_sur_quoi setVariable["item_petrole_non_traite_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_petrole_traite_sfp"}) then {if (_sur_quoi getvariable "item_petrole_traite_sfp" > 0) then {_sur_quoi setVariable["item_petrole_traite_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_cuivre_non_transforme_sfp"}) then {if (_sur_quoi getvariable "item_cuivre_non_transforme_sfp" > 0) then {_sur_quoi setVariable["item_cuivre_non_transforme_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_cuivre_transforme_sfp"}) then {if (_sur_quoi getvariable "item_cuivre_transforme_sfp" > 0) then {_sur_quoi setVariable["item_cuivre_transforme_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "serpent_non_transforme"}) then {if (_sur_quoi getvariable "serpent_non_transforme" > 0) then {_sur_quoi setVariable["serpent_non_transforme",0,true];};};
				
				systemchat format ["Inventaire Legal de %1 vidé ...", typeof _sur_quoi];
				titletext [format["Inventaire Legal de %1 vidé ...", typeof _sur_quoi], "PLAIN"];
			};
			
			// Illegal
			case "1" :
			{				
				if (!isnil {_sur_quoi getvariable "item_baleine_sfp"}) then {if (_sur_quoi getvariable "item_baleine_sfp" > 0) then {_sur_quoi setVariable["item_baleine_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "serpent_transforme"}) then {if (_sur_quoi getvariable "serpent_transforme" > 0) then {_sur_quoi setVariable["serpent_transforme",0,true];};};
				if (!isnil {_sur_quoi getvariable "gelule_amphetamines"}) then {if (_sur_quoi getvariable "gelule_amphetamines" > 0) then {_sur_quoi setVariable["gelule_amphetamines",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_requin_sfp"}) then {if (_sur_quoi getvariable "item_requin_sfp" > 0) then {_sur_quoi setVariable["item_requin_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_plante_illegale_prete_a_vendre_sfp"}) then {if (_sur_quoi getvariable "item_plante_illegale_prete_a_vendre_sfp" > 0) then {_sur_quoi setVariable["item_plante_illegale_prete_a_vendre_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_heroine_non_traite_sfp"}) then {if (_sur_quoi getvariable "item_heroine_non_traite_sfp" > 0) then {_sur_quoi setVariable["item_heroine_non_traite_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_heroine_traite_sfp"}) then {if (_sur_quoi getvariable "item_heroine_traite_sfp" > 0) then {_sur_quoi setVariable["item_heroine_traite_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_plante_pour_planter"}) then {if (_sur_quoi getvariable "item_plante_pour_planter" > 0) then {_sur_quoi setVariable["item_plante_pour_planter",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_plante_fertilisant_rouge"}) then {if (_sur_quoi getvariable "item_plante_fertilisant_rouge" > 0) then {_sur_quoi setVariable["item_plante_fertilisant_rouge",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_cannabis_non_traite_sfp"}) then {if (_sur_quoi getvariable "item_cannabis_non_traite_sfp" > 0) then {_sur_quoi setVariable["item_cannabis_non_traite_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_cannabis_traite_sfp"}) then {if (_sur_quoi getvariable "item_cannabis_traite_sfp" > 0) then {_sur_quoi setVariable["item_cannabis_traite_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_cocaine_feuille_coca_sfp"}) then {if (_sur_quoi getvariable "item_cocaine_feuille_coca_sfp" > 0) then {_sur_quoi setVariable["item_cocaine_feuille_coca_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_cocaine_poudre_sfp"}) then {if (_sur_quoi getvariable "item_cocaine_poudre_sfp" > 0) then {_sur_quoi setVariable["item_cocaine_poudre_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_medicaments_sfp"}) then {if (_sur_quoi getvariable "item_medicaments_sfp" > 0) then {_sur_quoi setVariable["item_medicaments_sfp",0,true];};};
				if (!isnil {_sur_quoi getvariable "item_organes_animaux_sfp"}) then {if (_sur_quoi getvariable "item_organes_animaux_sfp" > 0) then {_sur_quoi setVariable["item_organes_animaux_sfp",0,true];};};
				
				systemchat format ["Inventaire Illegal de %1 vidé ...", typeof _sur_quoi];
				titletext [format["Inventaire Illegal de %1 vidé ...", typeof _sur_quoi], "PLAIN"];
			};
		};
			
		if ((count _quel_farming - 1) == 1) then
		{
			if (!isnil {_sur_quoi getvariable "usedspace"}) then 
			{
				if (_sur_quoi getvariable "usedspace" > 0) then 
				{
					sleep 1;
					_sur_quoi setVariable["usedspace",0,true];
				};
			};
		};
	};
};

creation_sang_sfp =
{    
    _target = _this select 0;
    _bullet = _this select 2;
    _hitPosition = _this select 3;
    _velocity = _this select 4;
    _direction = _this select 7;
    _angle_sang_sfp = (random 15 - random 15) / 15;
    _distance_tache_du_corp = random 1;
    _targetPositionASL = getPosASL _target;
    _tableau_textures_du_sang = ["textures\sang_sfp\splatter1.paa","textures\sang_sfp\splatter2.paa","textures\sang_sfp\splatter3.paa","textures\sang_sfp\streak1.paa","textures\sang_sfp\streak2.paa","textures\sang_sfp\streak3.paa","textures\sang_sfp\spray1.paa","textures\sang_sfp\spray2.paa","textures\sang_sfp\spray3.paa","textures\sang_sfp\spray4.paa"];
    _si_tete = "head" in (_this select 5);
	
	_direction_aleatoir_calcul_sfp =
	{
		_tache_de_sang = _this select 0;
		_yaw    = _this select 1;
		_pitch  = _this select 2;
		_roll   = _this select 3;
		
		_tache_de_sang setVectorDirAndUp [[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],[[ sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D];
	};
	
	_obtenir_distance_de_la_surface_sfp =
	{
		_position      = _this select 0;
		_ignoreObject1 = _this select 1;
		_ignoreObject2 = _this select 2;
		_distance      = 0;
		_intersections = lineIntersectsSurfaces [_position,_position vectorAdd [0, 0, -100],_ignoreObject1,_ignoreObject2,true,1,"GEOM","NONE"];
		
		if (count _intersections > 0) then {_surfacePosition = (_intersections select 0) select 0;_distance = (_position select 2) - (_surfacePosition select 2);        };
		_distance;
	};

	if (_si_tete) then {_tableau_textures_du_sang pushback "textures\sang_sfp\brainsplatter1.paa";};
    
    _tache_de_sang_position_sfp  =
	[
		(_hitPosition select 0) - ((_direction select 0) * _distance_tache_du_corp),
		(_hitPosition select 1) - ((_direction select 1) * _distance_tache_du_corp),
		_targetPositionASL select 2
	];
    _tache_de_sang_position_sfp =
    [
        _tache_de_sang_position_sfp select 0,
        _tache_de_sang_position_sfp select 1,
        (_tache_de_sang_position_sfp select 2) - ([_tache_de_sang_position_sfp, _target, objNull] call _obtenir_distance_de_la_surface_sfp) + 0.01
    ];    
    
    _splatter = "UserTexture1m_F" createVehiclelocal [0,0,0];
    _splatter setObjectTexture [0, selectRandom _tableau_textures_du_sang];        
    _splatter setPosASL _tache_de_sang_position_sfp;
    [_splatter, direction _bullet + (_angle_sang_sfp * 15), -90, 0] call _direction_aleatoir_calcul_sfp;   
		
	waitUntil {sleep 2; player distance _tache_de_sang_position_sfp > 60};
		
	deletevehicle _splatter;
};
