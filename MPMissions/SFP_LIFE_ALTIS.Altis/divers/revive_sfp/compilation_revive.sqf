// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite penal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

variable_condition_addaction_joueur_besoin_revive =
{
	_cond = false;
	{
		if (!isnil {_x getvariable 'besoin_d_un_revive_news'} && alive _x && isnil "revive_joueur_entrain_de_soigner") then
		{
			_cond = true;
		};
	} foreach (player nearEntities ['MAN', 2]);
	_cond;
};
variable_addaction_revive = 
{
	waituntil {sleep 1; isnil {player getvariable "besoin_d_un_revive_news"}};
	
	menu_addaction_revive =
	{
		player removeaction menu_deroule_du_revive;
		
		player addAction [("<t color=""#ED2744"">") + ("Stabiliser Le Blesse") + "</t>",variable_stabilise_revive,[], 8, true, true, "", "[] call variable_condition_addaction_joueur_besoin_revive"];
		
		player addAction [("<t color=""#ED2744"">") + ("Premiers Soins") + "</t>",variable_soigner_joueur_revive,[], 8, true, true, "", "[] call variable_condition_addaction_joueur_besoin_revive"];
		
		player addAction [("<t color=""#ED2744"">") + ("Trainer") + "</t>",variable_tirer_le_blesse_et_charger_revive,[], 8, true, true, "", "[] call variable_condition_addaction_joueur_besoin_revive && isnil {cursortarget getvariable 'revive_joueur_attache'}"];
		player addAction [("<t color=""#ED2744"">") + ("Sortir Le Blesse") + "</t>",variable_action_ejecter_le_blesse,[], 8, true, true, "", "[] call variable_action_ejecter_le_blesse_detection"];
		
		player addAction [("<t color=""#ED2744"">") + ("Achever Le Blesse") + "</t>",variable_action_achever_joueur,[], 8, true, true, "", "[] call variable_condition_addaction_joueur_besoin_revive"];
	};
	
	menu_deroule_du_revive = player addAction [("<t color=""#ED2744"">") + ("AFFICHER MENU REVIVE") + "</t>",menu_addaction_revive,[], 8, true, true, "", "[] call variable_condition_addaction_joueur_besoin_revive"];

	player addAction [("<t color=""#ED2744"">") + ("Ramasser Argent") + "</t>",variable_action_revive_ramasser_argent,[], 8, true, true, "", "count (nearestObjects [getPosATL player, ['Land_Money_F'], 3]) >= 1 && isnil {player getvariable 'besoin_d_un_revive_news'}"];	
};
variable_message_couleur_revive = 
{
	[format["<t size='0.7' color='#FEF979'>%1</t>",_this], 0,1,5,0,0,301] spawn bis_fnc_dynamicText;
};
variable_sauvegarde_joueur_revive =
{
	_joueur = _this select 0;
	
	_gear = [];
	_weapons = [];	
	_prim_weap = primaryWeapon _joueur;
	_prim_items = primaryWeaponItems _joueur;
	_sec_weap = secondaryWeapon _joueur;
	_sec_items = secondaryWeaponItems _joueur;
	_items_assigned = assignedItems _joueur;
	_handgun = handgunWeapon _joueur;
	_handgun_items = handgunItems _joueur;
	if (_prim_weap != "") then {_weapons = _weapons + [_prim_weap]};
	if (_sec_weap != "") then {_weapons = _weapons + [_sec_weap]};
	if (_handgun != "") then {_weapons = _weapons + [_handgun]};
	_goggles = goggles _joueur;
	_headgear = headgear _joueur;
	_uniform = uniform _joueur;
	_uniform_items = uniformItems _joueur;
	_vest = vest _joueur;
	_vest_items = vestItems _joueur;
	_back_pack = backpack _joueur;
	_back_pack_items = backpackItems _joueur;
	_back_pack_weap = getWeaponCargo (unitBackpack _joueur);
	_weap_sel = currentWeapon _joueur;
	_weap_mode = currentWeaponMode _joueur;
	_fire_mode_array = getArray (configFile >> "cfgWeapons" >> _weap_sel >> "modes");
	_fire_mode = _fire_mode_array find _weap_mode;

	_magazinesAmmoFull = magazinesAmmoFull _joueur;
	_mag_uniform = [];_mag_vest = [];_mag_back = [];_mag_loaded_prim = [];_mag_loaded_sec = [];_mag_loaded_at = [];
	{
		if !(_x select 2) then
		{
			switch (true) do
			{
				case ((_x select 4) == "Vest" && ((_x select 3) != 0) && (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 1))     : {_mag_vest = _mag_vest + [[(_x select 0),(_x select 1)]]};
				case ((_x select 4) == "Uniform" && ((_x select 3) != 0) && (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 1))  : {_mag_uniform = _mag_uniform + [[(_x select 0),(_x select 1)]]};
				case ((_x select 4) == "Backpack" && ((_x select 3) != 0) && (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 1)) : {_mag_back = _mag_back + [[(_x select 0),(_x select 1)]]};
			};
		}
		else
		{
			switch (true) do
			{
				case ((_x select 3) == 1)  : {_mag_loaded_prim = [(_x select 0),(_x select 1)]};
				case ((_x select 3) == 2)  : {_mag_loaded_sec = [(_x select 0),(_x select 1)]};
				case ((_x select 3) == 4) : {_mag_loaded_at = [(_x select 0),(_x select 1)]};
			};			
		};
	} foreach _magazinesAmmoFull;

	_ammo = [_mag_loaded_prim,_mag_loaded_sec,_mag_loaded_at,_mag_uniform,_mag_vest,_mag_back];
	
	private ["_variable_un","_variable_deux","_variable_trois","_variable_quatre","_variable_cinq","_variable_huit","_variable_dixhuit","_variable_cinquante_cinq","_variable_cinquante_six","_variable_cinquante_huit","_variable_cinquante_neuf","_variable_soixante_deux"];
	_variable_un = _joueur getvariable "sacoche_de_c4";
	if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {_variable_deux = true;} else {_variable_deux = false;};
	if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {_variable_trois = true;} else {_variable_trois = false;};
	if (!isnil {player getvariable "recherche_pour_braquage"}) then {_variable_quatre = true;} else {_variable_quatre = false;};
	if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {_variable_cinq = true;} else {_variable_cinq = false;};
	_variable_six = _joueur getvariable "niveau_de_faim";
	_variable_sept = _joueur getvariable "fautdormir";
	if (!isnil {player getvariable "jaibu_by_sfp_maxou"}) then {_variable_huit = player getvariable "jaibu_by_sfp_maxou";} else {_variable_huit = false;};
	_variable_neuf = _joueur getvariable "barredecereale";
	_variable_dix = _joueur getvariable "bouteilledeau";
	_variable_onze = _joueur getvariable "redbull";
	_variable_douze = _joueur getvariable "hache_pour_coupe_de_bois";
	_variable_treize = _joueur getvariable "tente_pour_dormir";
	_variable_quatorze = _joueur getvariable "canne_a_peche";
	_variable_qinze = _joueur getvariable "gants_pour_petrole";
	_variable_seize = _joueur getvariable "harpon_pour_la_peche";
	_variable_dixsept = _joueur getvariable "pied_de_biche";
	if (!isnil {player getvariable "j_ai_un_antibiotique"}) then {_variable_dixhuit = true;} else {_variable_dixhuit = false;};
	_variable_dixneuf = _joueur getvariable "mon_argent_poche_by_sfp_maxou";
	_variable_vingt = _joueur getvariable "usedspace";
	_variable_vingtetun = _joueur getvariable "totalspace";
	_variable_vingtdeux = _joueur getvariable "item_baleine_sfp";
	_variable_vingttrois = _joueur getvariable "item_requin_sfp";
	_variable_vingtquatre = _joueur getvariable "item_cannabis_non_traite_sfp";
	_variable_vingtcinq = _joueur getvariable "item_medicaments_sfp";
	_variable_vingtsix = _joueur getvariable "item_organes_animaux_sfp";
	_variable_vingtsept = _joueur getvariable "item_pomme_sfp";
	_variable_vingthuit = _joueur getvariable "item_sel_sfp";
	_variable_vingtneuf = _joueur getvariable "item_pomme_de_terre_sfp";
	_variable_trente = _joueur getvariable "item_heroine_non_traite_sfp";
	_variable_trenteetun = _joueur getvariable "item_cuivre_non_transforme_sfp";
	_variable_trentedeux = _joueur getvariable "item_cuivre_transforme_sfp";
	_variable_trentetrois = _joueur getvariable "item_heroine_traite_sfp";
	_variable_trentequatre = _joueur getvariable "item_cannabis_traite_sfp";
	_variable_trentecinq = _joueur getvariable "item_poissons_sfp";
	_variable_trentesix = _joueur getvariable "itemfishpoissonspanes";
	_variable_trentesept = _joueur getvariable "item_petrole_non_traite_sfp";
	_variable_trentehuit = _joueur getvariable "item_petrole_traite_sfp";
	_variable_trenteneuf = _joueur getvariable "item_bois_sfp";
	_variable_quarante = _joueur getvariable "item_or_non_transforme_sfp";
	_variable_quarante_et_un = _joueur getvariable "item_or_transforme_sfp";
	_variable_quarante_deux = _joueur getvariable "bidon_d_essence";
	_variable_quarante_trois = _joueur getvariable "coffre_fort";
	_variable_quarante_quatre = _joueur getvariable "valise_pour_le_farming";
	_variable_quarante_cinq = _joueur getvariable "poignard_item";
	_variable_quarante_six = _joueur getvariable "thirstLevel_cafe";
	_variable_quarante_sept = _joueur getvariable "item_cocaine_feuille_coca_sfp";
	_variable_quarante_huit = _joueur getvariable "item_cocaine_poudre_sfp";
	_variable_quarante_neuf = _joueur getvariable "toilette_by_sfp_maxou";
	_variable_cinquante = _joueur getvariable "item_plante_pour_planter";
	_variable_cinquante_et_un = _joueur getvariable "seau_plante_illegal";
	_variable_cinquante_deux = _joueur getvariable "item_plante_illegale_prete_a_vendre_sfp";
	_variable_cinquante_trois = _joueur getvariable "cocktail_molotov";
	_variable_cinquante_quatre = _joueur getvariable "corde_et_sac";
	if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {_variable_cinquante_cinq = true;} else {_variable_cinquante_cinq = false;};
	if (!isnil {player getvariable "bombe_porte_prison"}) then {_variable_cinquante_six = true;} else {_variable_cinquante_six = false;};
	_variable_cinquante_sept = _joueur getvariable "traceur_vehicule";
	if (!isnil {player getvariable "boite_allumette"}) then {_variable_cinquante_huit = true;} else {_variable_cinquante_huit = false;};
	if (!isnil {player getvariable "marteau_sfp"}) then {_variable_cinquante_neuf = true;} else {_variable_cinquante_neuf = false;};
	_variable_soixante = _joueur getvariable "item_plante_fertilisant_rouge";
	_variable_soixante_et_un = _joueur getvariable "brouilleur_sacoche_c4";
	if (!isnil {player getvariable "corde_descente_rappel_sfp"}) then {_variable_soixante_deux = true;} else {_variable_soixante_deux = false;};

	_sauvegarde_revive_joueur =
	[
		_uniform,
		_vest,
		_goggles,
		_headgear,
		_back_pack,
		_back_pack_items,
		_back_pack_weap,
		_weapons,
		_prim_items,
		_sec_items,
		_handgun_items,
		_items_assigned,
		_uniform_items,
		_vest_items,
		_weap_sel,
		_fire_mode,
		_ammo,
		_variable_un,
		_variable_deux,
		_variable_trois,
		_variable_quatre,
		_variable_cinq,
		_variable_six,
		_variable_sept,
		_variable_huit,
		_variable_neuf,
		_variable_dix,
		_variable_onze,
		_variable_douze,
		_variable_treize,
		_variable_quatorze,
		_variable_qinze,
		_variable_seize,
		_variable_dixsept,
		_variable_dixhuit,
		_variable_dixneuf,
		_variable_vingt,
		_variable_vingtetun,
		_variable_vingtdeux,
		_variable_vingttrois,
		_variable_vingtquatre,
		_variable_vingtcinq,
		_variable_vingtsix,
		_variable_vingtsept,
		_variable_vingthuit,
		_variable_vingtneuf,
		_variable_trente,
		_variable_trenteetun,
		_variable_trentedeux,
		_variable_trentetrois,
		_variable_trentequatre,
		_variable_trentecinq,
		_variable_trentesix,
		_variable_trentesept,
		_variable_trentehuit,
		_variable_trenteneuf,
		_variable_quarante,
		_variable_quarante_et_un,
		_variable_quarante_deux,
		_variable_quarante_trois,
		_variable_quarante_quatre,
		_variable_quarante_cinq,
		_variable_quarante_six,
		_variable_quarante_sept,
		_variable_quarante_huit,
		_variable_quarante_neuf,
		_variable_cinquante,
		_variable_cinquante_et_un,
		_variable_cinquante_deux,
		_variable_cinquante_trois,
		_variable_cinquante_quatre,
		_variable_cinquante_cinq,
		_variable_cinquante_six,
		_variable_cinquante_sept,
		_variable_cinquante_huit,
		_variable_cinquante_neuf,
		_variable_soixante,
		_variable_soixante_et_un,
		_variable_soixante_deux
	];
	_sauvegarde_revive_joueur;
};
variable_chargement_joueur_revive =
{
	_joueur = _this select 0;
	_gear = _this select 1;
		
	sleep 5; // Temps initialisation pour garder les vetements etc
	
	{_joueur removeItem _x} foreach (items _joueur);
	{_joueur unassignItem _x;_joueur removeItem _x} foreach (assignedItems _joueur);

	if ((_gear select 0) != "") then 
	{
		if (uniform _joueur != (_gear select 0)) then
		{
			_joueur forceAddUniform (_gear select 0);
		};
	};
	
	if ((_gear select 1) != "") then {_joueur addVest (_gear select 1);};
	if (count (_gear select 11) > 0) then {{if (_x != "" && _x != "Binocular" && _x != "Rangefinder" && _x != "Laserdesignator") then {_joueur addItem _x;_joueur assignItem _x;} else {_joueur addWeapon _x;};} foreach (_gear select 11);};  

	_ammo = _gear select 16;
	if (count (_ammo select 0) > 0) then {_joueur addMagazine (_ammo select 0)};
	if (count (_ammo select 1) > 0) then {_joueur addMagazine (_ammo select 1)};
	if (count (_ammo select 2) > 0) then {_joueur addMagazine (_ammo select 2)};
	
	{if (isClass (configFile >> "cfgWeapons" >> _x)) then {_joueur addweapon _x;};} foreach (_gear select 7);
	removeBackPack _joueur;
	if ((_gear select 4) != "") then {_joueur addBackPack (_gear select 4); clearAllItemsFromBackpack _joueur;};

	if ((_gear select 17) > 0) then {_joueur setvariable ["sacoche_de_c4",(_gear select 17),true];};
	if (_gear select 18) then {_joueur setvariable ["jai_fait_un_cambriolage_news",(_gear select 18),true];};
	if (_gear select 19) then {_joueur setvariable ["recherche_pour_armes_illegales",(_gear select 19),true];};
	if (_gear select 20) then {_joueur setvariable ["recherche_pour_braquage",(_gear select 20),true];};
	if (_gear select 21) then {_joueur setvariable ["recherche_pour_conduite_sans_permis",(_gear select 21),true];};
	if ((_gear select 22) > 0) then {_joueur setvariable ["niveau_de_faim",(_gear select 22),false];};
	if ((_gear select 23) > 0) then {_joueur setvariable ["fautdormir",(_gear select 23),false];};
	// if (!isnil (_gear select 24)) then {if ((_gear select 24) > 0) then {_joueur setvariable ["jaibu_by_sfp_maxou",(_gear select 24),true];};};
	if ((_gear select 25) > 0) then {_joueur setvariable ["barredecereale",(_gear select 25),true];};
	if ((_gear select 26) > 0) then {_joueur setvariable ["bouteilledeau",(_gear select 26) ,true];};
	if ((_gear select 27) > 0) then {_joueur setvariable ["redbull",(_gear select 27),true];};
	if ((_gear select 28) > 0) then {_joueur setvariable ["hache_pour_coupe_de_bois",(_gear select 28),true];};
	if ((_gear select 29) > 0) then {_joueur setvariable ["tente_pour_dormir",(_gear select 29),true];};
	if ((_gear select 30) > 0) then {_joueur setvariable ["canne_a_peche",(_gear select 30),true];};
	if ((_gear select 31) > 0) then {_joueur setvariable ["gants_pour_petrole",(_gear select 31),true];};
	if ((_gear select 32) > 0) then {_joueur setvariable ["harpon_pour_la_peche",(_gear select 32),true];};
	if ((_gear select 33) > 0) then {_joueur setvariable ["pied_de_biche",(_gear select 33),true];};
	if (_gear select 34) then {_joueur setvariable ["j_ai_un_antibiotique",(_gear select 34),false];};
	if ((_gear select 35) > 0) then {_joueur setvariable ["mon_argent_poche_by_sfp_maxou",(_gear select 35),true]; autorisation_mouvement_argent = true;}; 
	if ((_gear select 36) > 0) then {_joueur setvariable ["usedspace",(_gear select 36),true];};
	if ((_gear select 37) > 0) then {_joueur setvariable ["totalspace",(_gear select 37),true];};
	if ((_gear select 38) > 0) then {_joueur setvariable ["item_baleine_sfp",(_gear select 38),true];};
	if ((_gear select 39) > 0) then {_joueur setvariable ["item_requin_sfp",(_gear select 39),true];};
	if ((_gear select 40) > 0) then {_joueur setvariable ["item_cannabis_non_traite_sfp",(_gear select 40),true];}; 
	if ((_gear select 41) > 0) then {_joueur setvariable ["item_medicaments_sfp",(_gear select 41),true];};
	if ((_gear select 42) > 0) then {_joueur setvariable ["item_organes_animaux_sfp",(_gear select 42),true];};
	if ((_gear select 43) > 0) then {_joueur setvariable ["item_pomme_sfp",(_gear select 43),true];};
	if ((_gear select 44) > 0) then {_joueur setvariable ["item_sel_sfp",(_gear select 44),true];};
	if ((_gear select 45) > 0) then {_joueur setvariable ["item_pomme_de_terre_sfp",(_gear select 45),true];};
	if ((_gear select 46) > 0) then {_joueur setvariable ["item_heroine_non_traite_sfp",(_gear select 46),true];};
	if ((_gear select 47) > 0) then {_joueur setvariable ["item_cuivre_non_transforme_sfp",(_gear select 47),true];};
	if ((_gear select 48) > 0) then {_joueur setvariable ["item_cuivre_transforme_sfp",(_gear select 48),true];};
	if ((_gear select 49) > 0) then {_joueur setvariable ["item_heroine_traite_sfp",(_gear select 49),true];};
	if ((_gear select 50) > 0) then {_joueur setvariable ["item_cannabis_traite_sfp",(_gear select 50),true];}; 
	if ((_gear select 51) > 0) then {_joueur setvariable ["item_poissons_sfp",(_gear select 51),true];};
	if ((_gear select 52) > 0) then {_joueur setvariable ["itemfishpoissonspanes",(_gear select 52),true];};
	if ((_gear select 53) > 0) then {_joueur setvariable ["item_petrole_non_traite_sfp",(_gear select 53),true];};
	if ((_gear select 54) > 0) then {_joueur setvariable ["item_petrole_traite_sfp",(_gear select 54),true];};
	if ((_gear select 55) > 0) then {_joueur setvariable ["item_bois_sfp",(_gear select 55),true];}; 
	if ((_gear select 56) > 0) then {_joueur setvariable ["item_or_non_transforme_sfp",(_gear select 56),true];}; 
	if ((_gear select 57) > 0) then {_joueur setvariable ["item_or_transforme_sfp",(_gear select 57),true];}; 
	if ((_gear select 58) > 0) then {_joueur setvariable ["bidon_d_essence",(_gear select 58),true];}; 
	if ((_gear select 59) > 0) then {_joueur setvariable ["coffre_fort",(_gear select 59),true];}; 
	if ((_gear select 60) > 0) then {_joueur setvariable ["valise_pour_le_farming",(_gear select 60),true];}; 
	if ((_gear select 61) > 0) then {_joueur setvariable ["poignard_item",(_gear select 61),true];}; 
	if ((_gear select 62) > 0) then {_joueur setvariable ["thirstLevel_cafe",(_gear select 62),false];}; 
	if ((_gear select 63) > 0) then {_joueur setvariable ["item_cocaine_feuille_coca_sfp",(_gear select 63),true];}; 
	if ((_gear select 64) > 0) then {_joueur setvariable ["item_cocaine_poudre_sfp",(_gear select 64),true];}; 
	if ((_gear select 65) > 0) then {_joueur setvariable ["toilette_by_sfp_maxou",(_gear select 65),false];}; 
	if ((_gear select 66) > 0) then {_joueur setvariable ["item_plante_pour_planter",(_gear select 66),true];}; 
	if ((_gear select 67) > 0) then {_joueur setvariable ["seau_plante_illegal",(_gear select 67),true];}; 
	if ((_gear select 68) > 0) then {_joueur setvariable ["item_plante_illegale_prete_a_vendre_sfp",(_gear select 68),true];}; 
	if ((_gear select 69) > 0) then {_joueur setvariable ["cocktail_molotov",(_gear select 69),true];}; 
	if ((_gear select 70) > 0) then {_joueur setvariable ["corde_et_sac",(_gear select 70),true];}; 
	if (_gear select 71) then {_joueur setvariable ["jai_un_sac_sur_la_tete",(_gear select 71),true];}; 
	if (_gear select 72) then {_joueur setvariable ["bombe_porte_prison",(_gear select 72),true];}; 
	if ((_gear select 73) > 0) then {_joueur setvariable ["traceur_vehicule",(_gear select 73),true];}; 
	if (_gear select 74) then {_joueur setvariable ["boite_allumette",(_gear select 74),true];}; 
	if (_gear select 75) then {_joueur setvariable ["marteau_sfp",(_gear select 75),true];}; 
	if ((_gear select 76) > 0) then {_joueur setvariable ["item_plante_fertilisant_rouge",(_gear select 76),true];}; 
	if ((_gear select 77) > 0) then {_joueur setvariable ["brouilleur_sacoche_c4",(_gear select 77),true];}; 
	if (_gear select 78) then {_joueur setvariable ["corde_descente_rappel_sfp",(_gear select 78),true];}; 

	_u_cont = (uniformContainer _joueur);
	_v_cont = (vestContainer _joueur);	
	
	{_joueur addMagazine _x;} foreach (_ammo select 3);
	{if (!(isClass (configFile >> "cfgMagazines" >> _x))) then {_joueur addItem _x;} else {if (getNumber(configFile >> "cfgMagazines" >> _x >> "count") < 2) then {_joueur addMagazine _x;};};} foreach (_gear select 12);

	if (!isnull _u_cont) then {_u_cont addItemCargo ["itemWatch",25];};
	
	{_joueur addMagazine _x;} foreach (_ammo select 4);
	{if (!(isClass (configFile >> "cfgMagazines" >> _x))) then {_joueur addItem _x;} else {if (getNumber(configFile >> "cfgMagazines" >> _x >> "count") < 2) then {_joueur addMagazine _x;};};} foreach (_gear select 13);
	
	if (!isnull _v_cont) then {_v_cont addItemCargo ["itemWatch",80];};
	
	{_joueur addMagazine _x;} foreach (_ammo select 5);
	
	{if (!(isClass (configFile >> "cfgMagazines" >> _x))) then {_joueur addItem _x;} else {if (getNumber(configFile >> "cfgMagazines" >> _x >> "count") < 2) then {_joueur addMagazine _x;};};} foreach (_gear select 5);
	
	if (!isnull _u_cont) then {for "_i" from 1 to 25 do {_joueur removeItemFromUniform "itemWatch";};};
	if (!isnull _v_cont) then {for "_i" from 1 to 80 do {_joueur removeItemFromVest "itemWatch";};};		
	
	if ((_gear select 2) != "") then {_joueur addGoggles (_gear select 2);};
	if ((_gear select 3) != "") then {_joueur addHeadgear (_gear select 3);};
	
	removeAllPrimaryWeaponItems _joueur;
	
	if (count (_gear select 8) > 0) then {{if (_x != "") then {_joueur addPrimaryWeaponItem _x;};} foreach (_gear select 8);};
	if (count (_gear select 9) > 0) then {{if (_x != "") then {_joueur addSecondaryWeaponItem _x;};} foreach (_gear select 9);};
	if (count (_gear select 10) > 0) then {{if (_x != "") then {_joueur addHandgunItem _x;};} foreach (_gear select 10);};
	_joueur selectweapon (_gear select 14);
	if ((_gear select 15) != -1) then {_joueur action ["SWITCHWEAPON", _joueur, _joueur, (_gear select 15)];};
};
variable_sauvegarde_automatique_revive =
{
	while {true} do
	{
		sleep 2;
		if (alive player && isnil {player getvariable "besoin_d_un_revive_news"}) then
		{
			revive_sauvegarde = [player] call variable_sauvegarde_joueur_revive;
		};
	};
};
variable_soigner_joueur_revive =
{
	private ["_le_joueur_a_soigne","_compter_nombre_de_pompier","_detection_possibilite_de_revive"];
	
	// Detection du blesse
	{if (!isnil {_x getvariable "besoin_d_un_revive_news"}) then {_le_joueur_a_soigne = _x;};} foreach (nearestObjects [player, ["Man"], 3]);
	if (isnil "_le_joueur_a_soigne") exitWith {"Aucun blesse detecte ... <br/> Si un blesse est quand même sur place, rapproches toi plus de sa position." call variable_message_couleur_revive;};
	if ((items player) find 'FirstAidKit' == -1) exitWith {"Desole, vous avez besoin d'un kit de soins !" call variable_message_couleur_revive;};	
	
	_calcul_degat_tete = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 0) * 100);
	_calcul_degat_buste = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 1) * 100);
	_calcul_degat_estomac = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 2) * 100);
	_calcul_degat_bras_droit = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 3) * 100);
	_calcul_degat_bras_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 4) * 100);
	_calcul_degat_cuisse_droite = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 5) * 100);
	_calcul_degat_cuisse_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 6) * 100);
	_calcul_degat_tibia_droit = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 7) * 100);
	_calcul_degat_tibia_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 8) * 100);
	_calcul_degat_pied_droit = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 9) * 100);
	_calcul_degat_pied_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 10) * 100);
	_calcul_sante_global = ((_calcul_degat_tete + _calcul_degat_buste + _calcul_degat_estomac + _calcul_degat_bras_droit + _calcul_degat_bras_gauche + _calcul_degat_cuisse_droite + _calcul_degat_cuisse_gauche + _calcul_degat_tibia_droit + _calcul_degat_tibia_gauche + _calcul_degat_pied_droit + _calcul_degat_pied_gauche) / 11);
	if (isnil {_le_joueur_a_soigne getvariable "revive_stabilise_le_patient"} && _calcul_sante_global >= 70) exitWith {"Le blesse est dans un etat critique ! Il faut le stabiliser avant." call variable_message_couleur_revive;};
	
	_compter_nombre_de_pompier = 0;
	_nom = "";
	_listes_des_noms_de_connectes_pour_le_revive = [];
	{
		if (isnil "jesuis_au_taff_a_la_sarl_pompier" && !isnil {_x getvariable "sarl_pompier_en_ligne"}) then 
		{
			_compter_nombre_de_pompier = round (_compter_nombre_de_pompier + 1); 
			_nom = _nom + format ["%1 <br/>", name _x];
			_listes_des_noms_de_connectes_pour_le_revive = _listes_des_noms_de_connectes_pour_le_revive + [name _x];
		};
	} foreach allunits;

	if (round (revive_nombre_max_de_medecin_pour_revive_entre_joueur - _compter_nombre_de_pompier) < 1) exitwith 
	{
		(format["Desole, tu ne peux pas revive car le nombre max de pompiers est connecte (%1 pompiers) ! \n\n Contact par exemple : <br/> %2.", revive_nombre_max_de_medecin_pour_revive_entre_joueur, _nom]) call variable_message_couleur_revive;
	};
	
	[_le_joueur_a_soigne] execvm "divers\revive_sfp\menu_liste_des_blessures_revive.sqf";
};
variable_action_achever_joueur =
{
	private ["_le_blesse"];
	
	{if (!isnil {_x getvariable "besoin_d_un_revive_news"} && alive _x) then {_le_blesse = _x;};} foreach (nearestObjects [player, ["Man"], 4]);
	if (isnil "_le_blesse") exitWith {"Aucun blesse detecte ... <br/> Si un blesse est quand même sur place, rapproches toi plus de sa position." call variable_message_couleur_revive;};
	if (player getvariable "poignard_item" < 1) exitWith {"Desole, tu n'as pas de poignard !" call variable_message_couleur_revive;};
	if (!sfp_config_revive_acheve_joueur) exitWith {"Desole, fonction non active sur ce serveur !" call variable_message_couleur_revive;};
	
	[[[player,"AwopPercMstpSgthWrflDnon_End2"],"divers\taper_un_joueur\tapersynchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	(format["Vous avez acheve %1 !", name _le_blesse]) call variable_message_couleur_revive;
	
	variable_public_achever_le_joueur = [12, _le_blesse]; sleep 0.1; publicVariable "variable_public_achever_le_joueur";	
};
variable_stabilise_revive =
{
	private "_le_joueur_a_soigne";
	
	// Recherche du blesse
	{if (!isnil {_x getvariable "besoin_d_un_revive_news"}) then {_le_joueur_a_soigne = _x;};} foreach (nearestObjects [player, ["Man"], 3]);
	if (isnil "_le_joueur_a_soigne") exitWith {"Aucun blesse detecte ... <br/> Si un blesse est quand même sur place, rapproches toi plus de sa position." call variable_message_couleur_revive;};
	if (!isnil {_le_joueur_a_soigne getvariable "revive_stabilise_le_patient"}) exitWith {"Le blesse est dejà stabilise !" call variable_message_couleur_revive;};
	
	if ((items player) find 'FirstAidKit' == -1) exitWith {"Desole, vous avez besoin d'un kit de soins !" call variable_message_couleur_revive;};	
	player removeItem "FirstAidKit";
	
	revive_joueur_entrain_de_soigner = true;
	
	(format["Patiente, tu vas stabiliser %1 ...", name _le_joueur_a_soigne]) call variable_message_couleur_revive;
	_trousse_de_soins = createVehicle ["Land_Defibrillator_F", getPosATL player, [], 0, "NONE"];
	_trousse_de_soins attachto [player,[0.5,0.3,0.1],"RightToeBase"];
	detach _trousse_de_soins;
	_antibiotique = createVehicle ["Land_VitaminBottle_F", getPosATL player, [], 0, "NONE"];
	_antibiotique attachto [player,[0.9,0.3,0.1],"RightToeBase"];
	detach _antibiotique;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";

	_temps_pour_stabiliser = round (15 + (random 60));
	while {_temps_pour_stabiliser > 0 && !isnil {_le_joueur_a_soigne getvariable "besoin_d_un_revive_news"} && alive player && alive _le_joueur_a_soigne && player distance _le_joueur_a_soigne < 5} do
	{
		sleep 1;
		if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then
		{
			(format["Stabilisation professionnel en cours ! Encore %1 Secondes.", _temps_pour_stabiliser]) call variable_message_couleur_revive;
		}else
		{
			(format["Stabilisation civil en cours ! Encore %1 Secondes.", _temps_pour_stabiliser]) call variable_message_couleur_revive;
		};
		
		_temps_pour_stabiliser = round (_temps_pour_stabiliser - 1);
	};

	player switchmove "";
	deletevehicle _trousse_de_soins;
	deletevehicle _antibiotique;
	
	revive_joueur_entrain_de_soigner = nil;
	
	if (_temps_pour_stabiliser > 0) exitwith {"Stabilisation annulee ..." call variable_message_couleur_revive;};
	
	(format["%1 à bien ete stabilise ! Merci.", name _le_joueur_a_soigne]) call variable_message_couleur_revive;
	
	if (Alive player && Alive _le_joueur_a_soigne && isnil {player getvariable "revive_stabilise_le_patient"}) then
	{
		_le_joueur_a_soigne setVariable ["revive_stabilise_le_patient",true,true];
		_le_joueur_a_soigne playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
	};
};
variable_tirer_le_blesse_et_charger_revive =
{
	private ["_le_blesse","_id"];
	_recherche_du_blesse = nearestObjects [player, ["Man"], 2];
	if (count _recherche_du_blesse > 1) then {_le_blesse = _recherche_du_blesse select 1;};
	if (!sfp_config_revive_trainer_blesse) exitWith {player globalchat "Cette fonction est desactive sur ce serveur.";};
	if (isnil "_le_blesse") exitWith {player globalchat "Personne detecte.";};
	if (isnil {_le_blesse getvariable "besoin_d_un_revive_news"}) exitWith {player globalchat "Personne detecte.";};

	despompierssontenligne = nil;	
	{if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then {despompierssontenligne = 1;};} foreach playableUnits;
	
	_calcul_degat_tete = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 0) * 100);
	_calcul_degat_buste = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 1) * 100);
	_calcul_degat_estomac = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 2) * 100);
	_calcul_degat_bras_droit = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 3) * 100);
	_calcul_degat_bras_gauche = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 4) * 100);
	_calcul_degat_cuisse_droite = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 5) * 100);
	_calcul_degat_cuisse_gauche = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 6) * 100);
	_calcul_degat_tibia_droit = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 7) * 100);
	_calcul_degat_tibia_gauche = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 8) * 100);
	_calcul_degat_pied_droit = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 9) * 100);
	_calcul_degat_pied_gauche = ((_le_blesse getvariable "mes_blessures_revive_sfp" select 10) * 100);
	_calcul_sante_global = ((_calcul_degat_tete + _calcul_degat_buste + _calcul_degat_estomac + _calcul_degat_bras_droit + _calcul_degat_bras_gauche + _calcul_degat_cuisse_droite + _calcul_degat_cuisse_gauche + _calcul_degat_tibia_droit + _calcul_degat_tibia_gauche + _calcul_degat_pied_droit + _calcul_degat_pied_gauche) / 11);
	if (_calcul_sante_global >= 70 && isnil "jesuis_au_taff_a_la_sarl_pompier" && !isnil "despompierssontenligne") exitWith {"Le joueur est dans un sale etat ... <br/> Appel les pompiers !" call variable_message_couleur_revive;};

	revive_autorisation_tirer_blesse = true;
	_le_blesse setVariable ["revive_joueur_attache",true,true];
	_le_blesse attachTo [player, [0, 1.1, 0.092]];
	_id = player addAction [("<t color=""#ED2744"">") + ("Deposer Le Blesse") + "</t>",variable_action_deposer_le_blesse,[], 9, true, true, "", "true"];
	player switchmove "";
	
	variable_public_revive_tirer_et_charger = [1,_le_blesse]; sleep 0.1; publicVariable "variable_public_revive_tirer_et_charger";
	
	private ["_action_id","_vehicule_revive_selectionne","_detection_joueur_revive","_joueur_dans_le_vehicule","_nom_du_vehicule_du_revive","_texte_action","_action_id"];
	_vehicule_revive_selectionne = objNull;
	_joueur_dans_le_vehicule = [];
	while {!isNull player && alive player && !isNull _le_blesse && alive _le_blesse && !isnil {_le_blesse getvariable "besoin_d_un_revive_news"} && revive_autorisation_tirer_blesse} do
	{
		_detection_joueur_revive = nearestObjects [player, ["Air","LandVehicle"], 5];
		_joueur_dans_le_vehicule = [];
		
		if (count _detection_joueur_revive < 1) then
		{
			 if (!isnil "_action_id") then
			 {
				 player removeAction _action_id;
			 };
		};

		{if (_x emptyPositions "cargo" != 0) then {_joueur_dans_le_vehicule = _joueur_dans_le_vehicule + [_x];};} foreach _detection_joueur_revive;
		if (count _joueur_dans_le_vehicule < 1) then {_vehicule_revive_selectionne = objNull;};
		if (count _joueur_dans_le_vehicule > 0 && _vehicule_revive_selectionne != _joueur_dans_le_vehicule select 0) then 
		{
			 if (!isnil "_action_id") then
			 {
				 player removeAction _action_id;
			 };
			
			_vehicule_revive_selectionne    = _joueur_dans_le_vehicule select 0;
			_nom_du_vehicule_du_revive        = getText (configFile >> "cfgVehicles" >> typeof _vehicule_revive_selectionne >> "displayName");
			_texte_action     = ("<t color=""#ED2744"">" + "Charger le blesse dans " + (_nom_du_vehicule_du_revive) + "</t>");
			_action_id = player addAction [_texte_action,variable_action_charger_le_blesse,[_le_blesse, _detection_joueur_revive select 0], 7, true, true];
		};
		sleep 0.1;
	};
	_le_blesse setVariable ["revive_joueur_attache",nil,true];
	if (!isnil {_le_blesse getvariable "besoin_d_un_revive_news"}) then {detach _le_blesse; _le_blesse playMoveNow "AinjPpneMstpSnonWrflDb_release";};
	if (!isnil "_id") then {player removeAction _id;};
	if (!isnil "_action_id") then {player removeAction _action_id;};
	revive_autorisation_tirer_blesse = false;
};
variable_action_deposer_le_blesse =
{
	revive_autorisation_tirer_blesse = false;
	sleep 33;
	player playmove "";
	player switchmove "";
};
variable_action_charger_le_blesse =
{
	_tout = _this ;
	_le_blesse = _this select 0;
	_la_voiture     = _this select 3;
	revive_autorisation_tirer_blesse = false;
	
	variable_public_revive_action_charger_blesse = [3,_le_blesse,_la_voiture];sleep 0.1; publicVariable "variable_public_revive_action_charger_blesse";
};
variable_action_ejecter_le_blesse_detection =
{
	_cond = false;
	_le_blesse = nearestObjects [player, ["Air","LandVehicle"], 7];
	if (count _le_blesse > 0) then
	{
		{
			if (!isnil {_x getvariable "besoin_d_un_revive_news"}) then 
			{
				_cond = true;
			};
		} foreach crew (_le_blesse select 0);
	};
	_cond
};
variable_action_ejecter_le_blesse =
{
	_le_blesse = nearestObjects [player, ["Air","LandVehicle"], 5];
	_liste_des_blesses = [];
	if (count _le_blesse > 0) then
	{
		{
			if (!isnil {_x getvariable "besoin_d_un_revive_news"}) then 
			{
				_liste_des_blesses = _liste_des_blesses + [_x];
			};
		} foreach crew (_le_blesse select 0);
	};
	variable_public_revive_action_decharger_blesse = [4,_liste_des_blesses];sleep 0.1; publicVariable "variable_public_revive_action_decharger_blesse";
};
variable_joueur_mort_revive =
{
	private ["_ui"];
	titleText ["", "BLACK OUT"];
	_le_joueur = _this select 0;
	
	[_le_joueur] spawn
	{
		_le_joueur = _this select 0;
		_dir = getDir _le_joueur;
		_pos = getPosATL (vehicle _le_joueur);
		
		hidebody _le_joueur;
		
		removeAllWeapons _le_joueur;
		removeAllAssignedItems _le_joueur;
		removeAllItems _le_joueur;
		removeBackpack _le_joueur;
		removeAllHandgunItems _le_joueur;
		removeAllContainers _le_joueur;
		
		{if (!alive _x) then {deletevehicle _x;};} foreach (nearestObjects [getPos player, ["CAR","AIR","BOAT"], 20]);
		
		WaitUntil {sleep 1; Alive player};
		
		while {rating player < 0} do {player addrating 9999999;};
		
		camera_du_revive_sfp = objNull;
		
		respawn_condition_revive = false;
		
		if (sfp_config_revive_activation) then 
		{
			revive_choix_possible = round (random sfp_config_revive_pas_de_chance);
			if (revive_choix_possible != 0) then 
			{
				if (revive_impossibilite_de_respawn < 1) then 
				{
					jai_le_droit_de_me_tp = 1; while {isnil "jai_le_droit_de_me_tp"} do {jai_le_droit_de_me_tp = 1;};

					player setDir _dir;
					player setVelocity [0,0,0];
					player setPosATL _pos;

					player allowdamage false; [] spawn {sleep 3; player allowdamage false;};
					revive_camera_de_nuit = false;
					detach player;
					variable_public_revive_mort_d_un_joueur = [2,player];sleep 0.1; publicVariable "variable_public_revive_mort_d_un_joueur";
					if (isnil {player getvariable "besoin_d_un_revive_news"}) then {player setvariable ["besoin_d_un_revive_news",true,true];};
					player switchMove "AinjPpneMstpSnonWrflDnon";
					
					_lancement_initilisation_inventaire = ["1"] execVM "divers\onRespawn_habbit_aleatoire.sqf"; 
					waitUntil {scriptDone _lancement_initilisation_inventaire;};
					
					revive_chargement = [player,revive_sauvegarde] spawn variable_chargement_joueur_revive;

					WaitUntil {animationstate player == "ainjppnemstpsnonwrfldnon"};
					
					variable_public_revive_marker = [0,revive_mon_side,_pos,player];sleep 0.1; publicVariable "variable_public_revive_marker";
					
					for [{_n = revive_temps_minimum_respawn}, {_n > 0 && !isnil {player getvariable "besoin_d_un_revive_news"} && isnil "revive_je_suis_acheve" && isnil "revive_soins_rate_du_joueur"}, {_n = _n - 1}] do
					{
						titleText [format ["Le menu respawn apparaitra dans %1 secondes ... \n\n Tu pourras cliquer sur le boutton URGENCE pour contacter directement les Pompiers ! \n\n Egalement, tu peux etre reanime par un collegue a l'hopital si besoin !",_n], "BLACK FADED"];
						sleep 1;
					};
					titleText ["", "BLACK IN"];
					
					_time = time;
					_fin_du_revive = _time + revive_temps_maximum_respawn;
					
					3 fadeSound 0.01;
					camera_du_revive_sfp = "camera" camCreate [(getPosATL vehicle player select 0) + (random 20), (getPosATL vehicle player select 1) + (random 20),(getPosATL vehicle player select 2) + (10)];
					if ((dayTime > 20 && dayTime < 23.99) or (dayTime >= 0 && dayTime < 6)) then {camUseNVG true;}else{camUseNVG false;};
					showCinemaBorder true;
					camera_du_revive_sfp cameraEffect ["internal","back"];
					camera_du_revive_sfp camSetFOV 1;
					camera_du_revive_sfp camCommit 0;
					waitUntil {camCommitted camera_du_revive_sfp};
					camera_du_revive_sfp camSetTarget vehicle player;
					camera_du_revive_sfp camSetRelPos [-1,0.6,0.1];
					camera_du_revive_sfp camCommit 5;
					waitUntil {camCommitted camera_du_revive_sfp};
					camera_du_revive_sfp attachTo [(vehicle player), revive_camera_distance, "Head"];

					[] call ouverture_menu_revive;
					
					format_du_message_revive_contact_urgence = nil;
					revive_temps_depuis_stabilisation = 0;
					while {alive player && !isnil {player getvariable "besoin_d_un_revive_news"} && time < _fin_du_revive && !respawn_condition_revive && isnil "revive_je_suis_acheve" && isnil "revive_soins_rate_du_joueur"} do
					{
						while {!isnil {player getvariable "revive_stabilise_le_patient"} && alive player && !isnil {player getvariable "besoin_d_un_revive_news"} && !respawn_condition_revive && isnil "revive_je_suis_acheve" && isnil "revive_soins_rate_du_joueur"} do
						{
							revive_temps_depuis_stabilisation = round (revive_temps_depuis_stabilisation + 1);
							_format_revive_un = format ["Vous etes stabilise ! \n\n Temps depuis la stabilisation : %1 Secondes.", round (revive_temps_depuis_stabilisation)];
							titleText [_format_revive_un, "PLAIN DOWN"];
							sleep 1;
						};

						_format_revive_un = format ["Temps restants avant le respawn automatique : %1 secondes / %2 Minutes !", round (_fin_du_revive - time), round ((_fin_du_revive - time) / 60)];
						if (isnil "format_du_message_revive_contact_urgence") then
						{
							titleText [_format_revive_un, "PLAIN DOWN"];
						}else
						{
							titleText [_format_revive_un + format_du_message_revive_contact_urgence, "PLAIN DOWN"];
						};
						
						if (getOxygenRemaining player < 1) then
						{
							player setOxygenRemaining 1;  
						};
						
						sleep 1;
					};
					
					detach camera_du_revive_sfp;
					camera_du_revive_sfp cameraEffect ["TERMINATE", "BACK"];
					camDestroy camera_du_revive_sfp;	
					camera_du_revive_sfp = objNull;
					
					3 fadeSound 1;

					while {!isnull (findDisplay 1111)} do {closedialog 1111;};
					(findDisplay 1111) displayRemoveEventHandler ["KeyDown", pas_de_boutton_echappe];
					
					if ((time > _fin_du_revive && !isnil {player getvariable "besoin_d_un_revive_news"}) or !isnil "revive_je_suis_acheve" or !isnil "revive_soins_rate_du_joueur") then 
					{
						_respawn = [] spawn variable_respawn_revive;
					};

					if (isnil {player getvariable "besoin_d_un_revive_news"} && !respawn_condition_revive) then 
					{
						player playMove "amovppnemstpsraswrfldnon";
						player playMove "";
					};

					hintSilent "";
					if (!respawn_condition_revive && alive player) then
					{
						if (revive_mon_side == civilian && isnil {player getvariable "besoin_d_un_revive_news"}) then {execvm "divers\revive_sfp\remettre_addaction_civilian_quand_soigne.sqf";};
						if (revive_mon_side == west && isnil {player getvariable "besoin_d_un_revive_news"}) then {execvm "divers\revive_sfp\remettre_addaction_west_quand_soigne.sqf";};
						
						revive_contacter_service_urgence = 0;
					};
					
					if (!isnil {player getvariable "besoin_d_un_revive_news"}) then {player setVariable["besoin_d_un_revive_news",nil,true];};
					variable_public_revive_retirer_god_mod = [11, player]; sleep 0.1; publicVariable "variable_public_revive_retirer_god_mod";
					player allowDamage true;
				}else
				{
					_respawn = [] spawn variable_respawn_revive;
				};
			}else
			{
				_respawn = [] spawn variable_respawn_revive;
				systemchat "Revive non autorise cette fois ci ...";
			};
		}else
		{
			_respawn = [] spawn variable_respawn_revive;
			systemchat "Revive non active sur ce serveur.";
		};
		
		if (!isnil {_x getvariable "detection_demande_revive"}) then {player setVariable ["detection_demande_revive",nil,true];};
		if (!isnil {player getvariable "revive_stabilise_le_patient"}) then {player setVariable ["revive_stabilise_le_patient",nil,true];};
	};
};
variable_action_soigner_joueur_revive =
{
	private ["_le_joueur_a_soigne","_niveau_de_la_variable","_temps_pour_soigner","_choix_lancement_hemoragie","_delai_lancement_hemoragie","_partie_a_soigner"];
	_condition = _this select 0;
	if (isnil "_condition") exitwith {hint "Erreur sur le choix à soigner ..";};
	
	{if (!isnil {_x getvariable "besoin_d_un_revive_news"}) then {_le_joueur_a_soigne = _x;};} foreach (nearestObjects [player, ["Man"], 3]);
	if (isnil "_le_joueur_a_soigne") exitWith {"Aucun blesse detecte ... <br/> Rapproche toi plus de sa position si un blesse est quand meme present." call variable_message_couleur_revive;};

	revive_joueur_entrain_de_soigner = true;
	if (!isnil "hemoragie_non_stoppe") then {hemoragie_non_stoppe = nil;};
	
	despompierssontenligne = nil;	
	{if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then {despompierssontenligne = 1;};} foreach playableUnits;

	_calcul_degat_tete = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 0) * 100);
	_calcul_degat_buste = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 1) * 100);
	_calcul_degat_estomac = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 2) * 100);
	_calcul_degat_bras_droit = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 3) * 100);
	_calcul_degat_bras_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 4) * 100);
	_calcul_degat_cuisse_droite = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 5) * 100);
	_calcul_degat_cuisse_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 6) * 100);
	_calcul_degat_tibia_droit = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 7) * 100);
	_calcul_degat_tibia_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 8) * 100);
	_calcul_degat_pied_droit = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 9) * 100);
	_calcul_degat_pied_gauche = ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select 10) * 100);
	_calcul_sante_global = ((_calcul_degat_tete + _calcul_degat_buste + _calcul_degat_estomac + _calcul_degat_bras_droit + _calcul_degat_bras_gauche + _calcul_degat_cuisse_droite + _calcul_degat_cuisse_gauche + _calcul_degat_tibia_droit + _calcul_degat_tibia_gauche + _calcul_degat_pied_droit + _calcul_degat_pied_gauche) / 11);
	if (!isnil "despompierssontenligne" && _calcul_sante_global >= 70 && isnil "jesuis_au_taff_a_la_sarl_pompier" && (((player distance (getmarkerpos 'pnj_hopital_un') < 10) or (player distance (getmarkerpos 'pnj_hopital_deux') < 10) or (player distance (getmarkerpos 'pnj_hopital_trois') < 10)))) exitWith {revive_joueur_entrain_de_soigner = nil; "Le blesse à trop souffert, il faut aller à l'hopital pour le soigner ..." call variable_message_couleur_revive;};
		
	if (((player distance (getmarkerpos 'pnj_hopital_un') < 10) or (player distance (getmarkerpos 'pnj_hopital_deux') < 10) or (player distance (getmarkerpos 'pnj_hopital_trois') < 10))) exitWith 
	{
		"Le blesse va etre soigne par les infirmiers de l hopital ... <br/> Patiente ..." call variable_message_couleur_revive;
		
		sleep (5 + (random 40));
		
		_le_joueur_a_soigne setVariable ["besoin_d_un_revive_news",nil,true];
		_le_joueur_a_soigne setVariable ["mes_blessures_revive_sfp", [0,0,0,0,0,0,0,0,0,0,0],true];
		
		revive_joueur_entrain_de_soigner = nil;
	};
	
	switch _condition do
	{
		// Tete
		case 0 :
		{
			_niveau_de_la_variable = 0;
			_partie_a_soigner = ["la tete","soins_revive_tete"];
		};
		
		// Buste
		case 1 :
		{
			_niveau_de_la_variable = 1;
			_partie_a_soigner = ["le buste","soins_revive_buste"];
		};
		
		// Estomac
		case 2 :
		{
			_niveau_de_la_variable = 2;
			_partie_a_soigner = ["l estomac","soins_revive_estomac"];
		};
		
		// Bras droit
		case 3 :
		{
			_niveau_de_la_variable = 3;
			_partie_a_soigner = ["le bras droit","soins_revive_bras_droit"];
		};
		
		// Bras gauche
		case 4 :
		{
			_niveau_de_la_variable = 4;
			_partie_a_soigner = ["le bras gauche","soins_revive_bras_gauche"];
		};
		
		// Cuisse droite
		case 5 :
		{
			_niveau_de_la_variable = 5;
			_partie_a_soigner = ["la cuisse droite","soins_revive_cuisse_droite"];
		};
		
		// Cuisse gauche
		case 6 :
		{
			_niveau_de_la_variable = 6;
			_partie_a_soigner = ["la cuisse gauche","soins_revive_cuisse_gauche"];
		};
		
		// Tibia droit
		case 7 :
		{
			_niveau_de_la_variable = 7;
			_partie_a_soigner = ["le tibia droit","soins_revive_tibia_droit"];
		};
		
		// Tibia gauche
		case 8 :
		{
			_niveau_de_la_variable = 8;
			_partie_a_soigner = ["le tibia gauche","soins_revive_tibia_gauche"];
		};
		
		// Pied droit
		case 9 :
		{
			_niveau_de_la_variable = 9;
			_partie_a_soigner = ["le pied droit","soins_revive_pied_droit"];
		};
		
		// Pied gauche
		case 10 :
		{
			_niveau_de_la_variable = 10;
			_partie_a_soigner = ["le pied gauche","soins_revive_pied_gauche"];
		};
	};
	
	if (isnil "_niveau_de_la_variable") exitwith 
	{
		revive_joueur_entrain_de_soigner = nil;
		"Erreur sur le choix, recommence ..." call variable_message_couleur_revive;
	};
	
	if (!isnil {_le_joueur_a_soigne getvariable (_partie_a_soigner select 1)}) exitwith 
	{
		revive_joueur_entrain_de_soigner = nil;
		(format["Desole, un soin est deja en cours sur %1 ...", _partie_a_soigner select 0]) call variable_message_couleur_revive;
	};
	
	if (isnil {_le_joueur_a_soigne getvariable (_partie_a_soigner select 1)}) then 
	{
		(format["Patiente, tu vas soigner %1 du joueur.", _partie_a_soigner select 0]) call variable_message_couleur_revive;
		_le_joueur_a_soigne setvariable [(_partie_a_soigner select 1),true,true];
	};
	
	closedialog 0;

	if (isnil "nombre_de_soins_actuel") then {nombre_de_soins_actuel = round (sfp_config_nombre_de_soins_par_kit_de_soins + 1);};
	nombre_de_soins_actuel = round (nombre_de_soins_actuel - 1);
	if (nombre_de_soins_actuel < 0) then
	{
		player removeItem "FirstAidKit";
		nombre_de_soins_actuel = nil;
	};

	_trousse_de_soins = createVehicle ["Land_Defibrillator_F", getPosATL player, [], 0, "NONE"];
	_trousse_de_soins attachto [player,[0.5,0.3,0.1],"RightToeBase"];
	detach _trousse_de_soins;
	_antibiotique = createVehicle ["Land_VitaminBottle_F", getPosATL player, [], 0, "NONE"];
	_antibiotique attachto [player,[0.9,0.3,0.1],"RightToeBase"];
	detach _antibiotique;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";

	_choix_lancement_hemoragie = false;
	if ((round ((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select _niveau_de_la_variable) * 100)) > 50) then
	{
		if ((round (random (player getvariable "mon_niveau_secouriste"))) == 1) then
		{
			_choix_lancement_hemoragie = true;
		};
	};
	
	_temps_pour_soigner = round (((_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp" select _niveau_de_la_variable) * 40) - ((player getvariable "mon_niveau_secouriste") * (random 3)));
	if (_temps_pour_soigner < 3) then {_temps_pour_soigner = round (2 + (random 7))};
	if (_choix_lancement_hemoragie) then {_delai_lancement_hemoragie = round (random _temps_pour_soigner);};
	while {_temps_pour_soigner > 0 && alive player && alive _le_joueur_a_soigne && player distance _le_joueur_a_soigne < 3 && !isnil {_le_joueur_a_soigne getvariable "besoin_d_un_revive_news"}} do
	{
		_temps_pour_soigner = round (_temps_pour_soigner - 1);

		if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then
		{
			(format["Soin professionnel en cours ! Encore %1 Secondes.", _temps_pour_soigner]) call variable_message_couleur_revive;
		}else
		{
			(format["Soin civil en cours ! Encore %1 Secondes.", _temps_pour_soigner]) call variable_message_couleur_revive;
		};
		
		if (_choix_lancement_hemoragie && !isnil "_delai_lancement_hemoragie") then
		{
			if (_temps_pour_soigner == _delai_lancement_hemoragie) then
			{
				[] call bar_de_progression_revive_by_maxou;
				if (delais_revive_soigner_patient <= 0) then 
				{
					"Hemoragie non stoppee ... Le joueur va mourrir !" call variable_message_couleur_revive;
					revive_joueur_entrain_de_soigner = nil;
					variable_public_achever_le_joueur = [13, _le_joueur_a_soigne]; sleep 0.1; publicVariable "variable_public_achever_le_joueur";	
					_temps_pour_soigner = 0;
					hemoragie_non_stoppe = true;
				};
			};
		};

		sleep 1;		
	};
	
	player switchmove "";
	deletevehicle _trousse_de_soins;
	deletevehicle _antibiotique;

	_le_joueur_a_soigne setvariable [(_partie_a_soigner select 1),nil,true];

	if (!isnil "hemoragie_non_stoppe") exitwith {};
	if (_temps_pour_soigner > 0) exitwith {revive_joueur_entrain_de_soigner = nil; "Soins annules ! Merci." call variable_message_couleur_revive;};

	_mes_blessures_sfp_a_mettre_a_jour = _le_joueur_a_soigne getvariable "mes_blessures_revive_sfp";
	_mes_blessures_sfp_a_mettre_a_jour set [_niveau_de_la_variable, 0];
	_le_joueur_a_soigne setvariable ["mes_blessures_revive_sfp", _mes_blessures_sfp_a_mettre_a_jour,true];

	_detection_si_joueur_soigner_entierement = true;
	{
		if (_x > 0) then
		{
			_detection_si_joueur_soigner_entierement = false;
		};
	} foreach (_le_joueur_a_soigne getvariable "mes_blessures_revive_sfp");
	
	if (Alive player && Alive _le_joueur_a_soigne) then
	{
		if (_detection_si_joueur_soigner_entierement) then
		{
			(format["%1 à bien ete soigne totalement ! Merci.", name _le_joueur_a_soigne]) call variable_message_couleur_revive;
			
			_le_joueur_a_soigne setVariable ["besoin_d_un_revive_news",nil,true];
			_le_joueur_a_soigne setVariable ["mes_blessures_revive_sfp", [0,0,0,0,0,0,0,0,0,0,0],true];
			_le_joueur_a_soigne playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
		}else
		{
			(format["%1 n est pas soigne totalement ! Continue encore ...", name _le_joueur_a_soigne]) call variable_message_couleur_revive;
		};
	};
	
	revive_joueur_entrain_de_soigner = nil;	
};
variable_synchronisation_MP_revive =
{
	_type  = _this select 1 select 0;
	_le_blesse = _this select 1;
	
	switch (true) do
	{
		case (_type == 0) : 
		{
			if (isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {};
			
			_unit_tableau = _le_blesse select 3;
			_pos = _le_blesse select 2;
			if (isnil "_unit_tableau" or isnil "_pos") exitwith {};
			
			_nom_marqueur = format ["%1%2" ,_pos, round (random 999999)];
			_marqueur_mort_sfp = createMarkerLocal [_nom_marqueur, _pos];
			_marqueur_mort_sfp setMarkerColorLocal "ColorBlue";
			_marqueur_mort_sfp setMarkerTypeLocal "mil_box";
			_marqueur_mort_sfp setMarkerTextLocal format ["Blesse : %1", name _unit_tableau];
			_marqueur_mort_sfp setMarkerSizeLocal [0.62, 0.62];

			[_pos,_unit_tableau, _nom_marqueur] spawn
			{
				_pos  = _this select 0;
				_unit_tableau = _this select 1;
				_nom_marqueur = _this select 2;
				if (isnil "_pos" or isnil "_unit_tableau" or isnil "_nom_marqueur") exitwith {};
				
				while {(!(isNull _unit_tableau) && !isnil {_unit_tableau getvariable "besoin_d_un_revive_news"})} do
				{
					_nom_marqueur setMarkerPosLocal getPosATL _unit_tableau;
					sleep 2;
				};
				deletemarkerlocal _nom_marqueur;
			};
		};
		case (_type == 1) : 
		{
			(_le_blesse select 1) setDir 180;
			(_le_blesse select 1) playMoveNow "AinjPpneMstpSnonWrflDb_grab";
		};
		case (_type == 2) : 
		{
			private ["_le_blesse_selectionne"];
			_le_blesse_selectionne = (_le_blesse select 1);
			[_le_blesse_selectionne] spawn
			{
				_le_blesse_selectionne = _this select 0;
				_le_blesse_selectionne allowDamage false;
				WaitUntil {sleep 1; (isNull _le_blesse_selectionne) && isnil {_le_blesse_selectionne getVariable "besoin_d_un_revive_news"}};
				_le_blesse_selectionne allowDamage true;
			};
		};
		case (_type == 3) : 
		{
			private ["_le_blesse_selectionne","_le_vehicule"];
			jai_le_droit_de_me_tp = 1;
			_le_blesse_selectionne = (_le_blesse select 2 select 0);
			_le_vehicule = (_le_blesse select 2 select 1);
			_le_blesse_selectionne moveInCargo _le_vehicule;
		};
		case (_type == 4) : 
		{
			private ["_array_injured"];
			_array_injured = (_le_blesse select 1);
			{
				if (name player == name _x) then {unAssignVehicle player;player action ["eject", vehicle player];_spawn = [] spawn {sleep 0.5; player switchMove "ainjppnemstpsnonwrfldnon";};};
			} foreach _array_injured;
		};
		case (_type == 5) : 
		{
			private ["_array_injured"];
			_spawn = [(_le_blesse select 1),(_le_blesse select 2)] spawn
			{
				_le_blesse_selectionne = _this select 0;
				_pplayer  = _this select 1;
				jai_le_droit_de_me_tp = 1;
				_le_blesse_selectionne setPos (_pplayer modelToWorld [0,1,0]);				
				_le_blesse_selectionne setDir (getDir _pplayer + 180);
				_le_blesse_selectionne switchMove "AinjPfalMstpSnonWnonDnon_carried_up";
				WaitUntil {!Alive _pplayer || ((animationstate _pplayer == "acinpercmstpsraswrfldnon") || (animationstate _pplayer == "acinpercmrunsraswrfldf") || (animationstate _pplayer == "acinpercmrunsraswrfldr") || (animationstate _pplayer == "acinpercmrunsraswrfldl"))};
				_le_blesse_selectionne switchMove "AinjPfalMstpSnonWnonDf_carried_dead";
				sleep 0.2;
				_le_blesse_selectionne setDir 180;
			};
		};
		case (_type == 6) : 
		{
			private ["_array_injured"];
			_spawn = [(_le_blesse select 1)] spawn
			{
				(_this select 0) switchMove "AinjPfalMstpSnonWrflDnon_carried_down";
				sleep 3;
				if (!isnil {(_this select 0) getVariable "besoin_d_un_revive_news"}) then 
				{
					(_this select 0) switchMove "ainjppnemstpsnonwrfldnon";
				};
			};
		};
		case (_type == 10) : 
		{
			private ["_le_blesse_selectionne"];
			_unit_tableau = _le_blesse select 1;
			_anim = _le_blesse select 2;
			_unit_tableau switchMove _anim;
		};
		case (_type == 11) : 
		{
			_sur_qui_agir = _le_blesse select 1;
			if (isnil "_sur_qui_agir") exitwith {};
			
			_sur_qui_agir allowdamage true;
		};
		case (_type == 12) : 
		{
			_le_blesse = _le_blesse select 1;
			if (isnil "_le_blesse") exitwith {};
			
			if (player == _le_blesse) then
			{
				revive_je_suis_acheve = true;
			};
		};
		case (_type == 13) : 
		{
			_le_blesse = _le_blesse select 1;
			if (isnil "_le_blesse") exitwith {};
			
			if (player == _le_blesse) then
			{
				revive_soins_rate_du_joueur = true;
			};
		};
	};
};
variable_action_revive_supprimer_argent =
{
	_le_billet = _this;
	_temps_suppression = round (5 * 60);
	if (isnil "_le_billet") exitwith {hint "Erreur, creation argent ...";};
	
	while {alive _le_billet && _temps_suppression > 0} do
	{
		sleep 1;
		_temps_suppression = round (_temps_suppression - 1);
	};
	if (_temps_suppression <= 0) then {deletevehicle _le_billet;};
};
variable_action_revive_ramasser_argent =
{
	private "_l_argent";
	{
		if (_x getvariable "argent_joueur_revive" > 0) then
		{
			_l_argent = _x;
		};
	} foreach (nearestObjects [getPosATL player, ['Land_Money_F'], 3]);
	if (isnil "_l_argent") exitwith {hint "Desole, pas d'argent detecte ...";};
	
	player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + (_l_argent getvariable "argent_joueur_revive"),true];
	
	(format["Vous avez ramasse %1 Euros.", (_l_argent getvariable "argent_joueur_revive") call retour_formatage_chiffre_sfp]) call variable_message_couleur_revive;
	
	deletevehicle _l_argent;
};
variable_respawn_revive =
{
	waitUntil {isnull camera_du_revive_sfp;};
	"Respawn en cours ... <br/> Vous allez perdre tout ce que vous possedez sur vous ... Argent etc !" call variable_message_couleur_revive;
	deTach player;
	closeDialog 0;
	if (vehicle player != player) then {unAssignVehicle player; player action ["eject", vehicle player];};
	waitUntil {!isNull player};
	waitUntil {player == player};
	waitUntil {alive player};
	jai_le_droit_de_me_tp = 1; while {isnil "jai_le_droit_de_me_tp"} do {jai_le_droit_de_me_tp = 1;};
	player setDamage 0;
	
	if (isnil "revive_je_suis_acheve" && isnil "revive_soins_rate_du_joueur") then
	{
		if (revive_choix_possible != 0) then 
		{
			if (revive_impossibilite_de_respawn >= 1) then 
			{
				"Vous avez prit une balle dans la tête, votre cervelle a eclatee ... <br/> Vous n'avez pas pu etre soigne ! <br/> Bonne nouvelle vie !" call variable_message_couleur_revive;
			}else
			{
				_compter_nombre_secouriste_connecte = 0;
				{
					if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then 
					{
						_compter_nombre_secouriste_connecte = round (_compter_nombre_secouriste_connecte + 1);
					};
				} foreach playableunits;
				
				if (_compter_nombre_secouriste_connecte >= 1 && respawn_condition_revive) then
				{
					(format["Re bienvenue dans votre nouvelle vie ! <br/> Vous avez paye %1 Euros pour cette action !", (tarif_menu_revive select 0)]) call variable_message_couleur_revive;
					player setvariable ["mon_argent_banque_by_sfp_maxou",(player getVariable "mon_argent_banque_by_sfp_maxou") - (tarif_menu_revive select 0),true];
				}else
				{
					"Re bienvenue dans votre nouvelle vie ! <br/> Vous avez paye 0 Euros pour cette action !" call variable_message_couleur_revive;
				};
			};
		} else
		{
			"Vous avez subit de trop gros degats ... Vous n'avez pas pu etre soigne ! <br/> Bonne nouvelle vie !" call variable_message_couleur_revive;
			systemchat "Vous avez subit de trop gros degats ... Vous n avez pas pu etre soigne ! Bonne nouvelle vie !";		
		};
	} else
	{
		if (!isnil "revive_je_suis_acheve") then
		{
			"Un joueur vous à acheve ! Vous n'avez pas pu finir le revive ! <br/> Bonne nouvelle vie !" call variable_message_couleur_revive;
			systemchat "Un joueur vous a acheve ! Vous n avez pas pu finir le revive ! Bonne nouvelle vie !";		
		};
		if (!isnil "revive_soins_rate_du_joueur") then
		{
			"Le joueur vous ayant soigne vous a charcute ... Vous n'avez pas survecu ! <br/> Bonne nouvelle vie !" call variable_message_couleur_revive;
			systemchat "Le joueur vous ayant soigne vous a charcute ...Vous n avez pas survecu ! Bonne nouvelle vie !";
		};
	};

	if (!isnil "revive_je_suis_acheve") then {revive_je_suis_acheve = nil;};
	if (!isnil "revive_soins_rate_du_joueur") then {revive_soins_rate_du_joueur = nil;};
	if (revive_choix_possible != 0) then {revive_choix_possible = 0;};
	if (revive_impossibilite_de_respawn != 0) then {revive_impossibilite_de_respawn = 0;};
	if (revive_contacter_service_urgence != 0) then {revive_contacter_service_urgence = 0;};

	player switchMove "";
	player allowDamage true;
	
	if (player getvariable "mon_argent_poche_by_sfp_maxou" > 0) then
	{
		if (sfp_config_revive_tas_billet) then
		{
			_creation_billet_revive_sfp = createVehicle ["Land_Money_F", position player, [], 0, "CAN_COLLIDE"];
			_creation_billet_revive_sfp setvariable ["argent_joueur_revive",(player getvariable "mon_argent_poche_by_sfp_maxou"),true];
		
			_creation_billet_revive_sfp spawn variable_action_revive_supprimer_argent;
		};
		player setvariable ["mon_argent_poche_by_sfp_maxou",0,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	};
	
	if (revive_mon_side == civilian) then {execvm "divers\revive_sfp\revive_onrespawn_civilian.sqf";};
	if (revive_mon_side == west) then {execvm "divers\gendarmerie\quand_gendarme_respawn.sqf";};
	if (!isnil {player getvariable "besoin_d_un_revive_news"}) then {player setVariable ["besoin_d_un_revive_news",nil,true];};
	if (!isnil {player getvariable "detection_demande_revive"}) then {player setVariable ["detection_demande_revive",nil,true];};
	
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "Revive_news", false] call fn_SaveToServer;
};
variable_marker_revive =
{
	_3d = addMissionEventHandler ["Draw3D",
	{
		{
			if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then
			{			
				if (((_x distance player) < revive_icone_max_vu_distance) && !isnil {_x getVariable "besoin_d_un_revive_news"}) then
				{
					drawIcon3D["a3\ui_f\data\map\locationtypes\hill_ca.paa",revive_icone_couleur,_x,revive_icone_taille,revive_icone_taille,0,format["%1 à %2 M.", name _x, ceil (player distance _x)],0,0.03];
				};
			};
		} foreach playableUnits;
	}];
};
ouverture_menu_revive =
{
	disableSerialization;
	createdialog "Menu_Revive";	
	((uiNamespace getVariable "Menu_Revive") displayCtrl 1001) ctrlSetText "MENU REVIVE";
	((uiNamespace getVariable "Menu_Revive") displayCtrl 1001) ctrlSetTextColor [0.99,0.04,0.01,1];

	_compter_nombre_secouriste_connecte = 0;
	{
		if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then 
		{
			_compter_nombre_secouriste_connecte = round (_compter_nombre_secouriste_connecte + 1);
		};
	} foreach playableunits;
	
	if (_compter_nombre_secouriste_connecte >= 1) then
	{
		lbAdd [1500, format['Repartir sur une nouvelle vie. (- %1 %2)', tarif_menu_revive select 0, '€']];	
		lbAdd [1500, format['Appeler les secours (+ %1 %2).', tarif_menu_revive select 1, '€']];	
	}else
	{
		lbAdd [1500, format['Nouvelle vie. (- %1 %2 si appuis maintenant)', tarif_menu_revive select 0, '€']];	
		lbAdd [1500, 'Appeler les secours. (NON CONNECTE)'];	
	};
	((uiNamespace getVariable "Menu_Revive") displayCtrl 1500) lbSetTooltip [0, "Double clique pour valider."];	
	((uiNamespace getVariable "Menu_Revive") displayCtrl 1500) lbSetTooltip [1, "Double clique pour valider."];	

	pas_de_boutton_echappe = (findDisplay 1111) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
};
menu_liste_revive =
{
	_choix_selectionne = _this select 0 select 1;

	if (vehicle player != player) exitwith {player globalchat "Impossible car tu es dans un vehicule !";};
	if (revive_contacter_service_urgence >= 1) exitwith {player globalchat "Impossible puisque tu as contacte les secours !";};
	
	if (_choix_selectionne == 0) then {respawn_condition_revive = true; closeDialog 1111; _respawn = [] spawn variable_respawn_revive;};
	if (_choix_selectionne == 1) then {execvm "divers\revive_sfp\contacter_les_secours.sqf";};
};
variable_cherche_blesse_menu_revive =
{
	_le_joueur = lbtext [1500, lbCurSel 1500];
	if (lbCurSel 1500 == -1) exitwith {hint "Desole, personne n est selectionne !";};

	le_joueur_blesse_message = nil;
	{
		if (_le_joueur == name _x) then 
		{
			le_joueur_blesse_message = _x;
		};
	} foreach allunits;
	
	if (isnil "le_joueur_blesse_message") exitwith {hint "Erreur recommence !";};
	
	[[player],"avertit_joueur_demandant_secours", le_joueur_blesse_message, false] spawn BIS_fnc_MP;
};
avertit_joueur_demandant_secours =
{
	_nom_du_soigneur = _this select 0;
	
	["<t size='0.75' color='#ff0000'>Un urgentiste à prit votre demande et va arriver d'ici peu ... </t>", 0,-0.30,5,6,0,301] spawn bis_fnc_dynamicText;	
	
	for [{_i = 20}, {_i > 0}, {_i = _i - 1}] do
	{
		player globalchat format ["Bonjour Mr %1, l'urgentiste %2 a prit votre demande et va arriver d ici peu ...", name player, name _nom_du_soigneur];
		sleep 0.1;
	};
};
avertit_demande_secours_revive =
{
	_nom_du_malade = _this select 0;
		
	if !(player in list sarl_pompier) then
	{
		systemchat format ["Une demande de secours est en cours pour %1 ! Ouvre ton menu pompier pour lui confirmer ton arrivee !", name _nom_du_malade];
	
		["Revive_Demande",["Urgence medical, consulte ta carte pour l'emplacement !", ""]] call bis_fnc_showNotification;
	};
	
	[] spawn
	{
		for "_i" from 0 to 4 do
		{
			player say "beeper_pompier_sfp";
			sleep 1;
		};
	};
	tombe_sirene_pompier say "pompier_depart_sap";
};
compilation_revive_calcul_droit_demande_urgence = 
{
	_revive_nombre_d_urgentiste = 0;
	_revive_nombre_blesse_actuel = 0;
	{
		if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then {_revive_nombre_d_urgentiste = round (_revive_nombre_d_urgentiste + 1);};
		if (!isnil {_x getvariable "detection_demande_revive"}) then {_revive_nombre_blesse_actuel = round (_revive_nombre_blesse_actuel + 1);};
	} foreach playableUnits;
	_resultat = round (_revive_nombre_d_urgentiste - _revive_nombre_blesse_actuel);
	_resultat
};
