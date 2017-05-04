// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "le_serveur_va_redemarrer_dans_20_minutes"};

"DIAG SFP : Voitures sécurité serveur plante : Lancement chargement 1/3." spawn historique_creation_log_sfp;

_check = ("sauvegarde_voitures_securite_si_serveur_plante") call base_de_donnee_existante;
if !(_check) exitwith {sleep 0.3; execvm "partie_serveur\persistence\world\voitures_securite_si_serveur_plante\oSave_voitures_securite_serveur_plante.sqf";};
_objectscount = ["sauvegarde_voitures_securite_si_serveur_plante", "Count", "Count", "test_valeur_existe"] call loadFromDB_Local_Serveur;
if !([_objectscount] call verification_si_donnee_existe) exitwith {sleep 0.3; execvm "partie_serveur\persistence\world\voitures_securite_si_serveur_plante\oSave_voitures_securite_serveur_plante.sqf";};

"DIAG SFP : Voitures sécurité serveur plante : Lancement chargement 2/3." spawn historique_creation_log_sfp;

for "_i" from 0 to (_objectscount) do
{
	_objSaveName = format["voiture securite numero %1", _i];
	
	_class = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "classname", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_pos = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "pos", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_direction = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Direction", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_proprietaire = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_proprietaire", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_plaque_immatriculation = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_plaque_immatriculation", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_couleur_du_vehicule = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_couleur_du_vehicule", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_prix_du_neuf = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_prix_du_neuf", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_klaxon = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_klaxon", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_une_puce = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_une_puce", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_neon = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_neon", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_radar_de_recul = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_radar_de_recul", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_detecteur_de_radar = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_detecteur_de_radar", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_un_nouveau_poids = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_nouveau_poids", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_une_assurance = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_une_assurance", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_voiture_possede_de_l_eau = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_de_l_eau", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_usedspace = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_usedspace", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_totalspace = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_totalspace", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemwhale = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemwhale", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemrequin = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemrequin", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_medicaments = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_medicaments", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_organes_animaux = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_organes_animaux", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itempommes = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itempommes", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itempommedeterre = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itempommedeterre", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemsel = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemsel", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemunpheroin = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemunpheroin", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemcuivre = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcuivre", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemcuivretransfo = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcuivretransfo", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemproheroin = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemproheroin", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemcannabis_traite = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcannabis_traite", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemcannabis_non_traite = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcannabis_non_traite", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemtruffle = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemtruffle", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemfish = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemfish", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemfishpoissonspanes = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemfishpoissonspanes", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemunpoil = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemunpoil", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemprooil = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemprooil", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemwood = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemwood", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemrabbitmeat = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemrabbitmeat", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_serpent_non_transforme = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_serpent_non_transforme", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_serpent_transforme = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_serpent_transforme", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_or_non_traite = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_or_non_traite", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_or_traite = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_or_traite", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_cocaine_feuille = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_cocaine_feuille", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_cocaine_poudre = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_cocaine_poudre", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_plante_illegale_prete_a_vendre = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_plante_illegale_prete_a_vendre", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_fuel = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Fuel", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_backpack = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "BackPack", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_weapons = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Weapons", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_magazines = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Magazines", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_items = ["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Items", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		
	if ([_objSaveName] call verification_si_donnee_existe && [_class] call verification_si_donnee_existe && [_pos] call verification_si_donnee_existe && [_direction] call verification_si_donnee_existe) then 
	{
		_type = "CAN_COLLIDE";
		_placement = 0;
		
		_obj = createVehicle [_class,_pos, [], _placement, _type];
		_obj setPosATL _pos;
		_obj setVectorDirAndUp _direction;
		
		sleep 1;
		[_obj, false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
		sleep 2;
		
		if ([_proprietaire] call verification_si_donnee_existe) then {if (count _proprietaire > 0) then {_obj setvariable ["vehicule_info_parvariable",_proprietaire ,true];};};
		if ([_plaque_immatriculation] call verification_si_donnee_existe) then {if (count _plaque_immatriculation > 0) then {_obj setvariable ["plaque_immatriculation_news",_plaque_immatriculation ,true];};};
		if ([_voiture_prix_du_neuf] call verification_si_donnee_existe) then {if (_voiture_prix_du_neuf > 0) then {_obj setvariable ["prix_du_vehicule_neuf",_voiture_prix_du_neuf ,true];};};
		if ([_voiture_possede_un_klaxon] call verification_si_donnee_existe) then {if (count _voiture_possede_un_klaxon > 0) then {_obj setvariable ["voiture_possede_un_klaxon",_voiture_possede_un_klaxon ,true];};};
		if ([_voiture_possede_une_puce] call verification_si_donnee_existe) then {if (count _voiture_possede_une_puce > 0) then {_obj setvariable ["voiture_possede_une_puce",_voiture_possede_une_puce ,true];};};
		if ([_voiture_possede_un_neon] call verification_si_donnee_existe) then {if (count _voiture_possede_un_neon > 0) then {_obj setvariable ["voiture_possede_un_neon",_voiture_possede_un_neon ,true];};};
		if ([_voiture_possede_un_radar_de_recul] call verification_si_donnee_existe) then {if (count _voiture_possede_un_radar_de_recul > 0) then {_obj setvariable ["voiture_possede_un_radar_de_recul",_voiture_possede_un_radar_de_recul ,true];};};
		if ([_voiture_possede_un_detecteur_de_radar] call verification_si_donnee_existe) then {if (count _voiture_possede_un_detecteur_de_radar > 0) then {_obj setvariable ["voiture_possede_un_detecteur_de_radar",_voiture_possede_un_detecteur_de_radar ,true];};};
		if ([_voiture_possede_un_nouveau_poids] call verification_si_donnee_existe) then {if (count _voiture_possede_un_nouveau_poids > 0) then {_obj setvariable ["voiture_possede_un_nouveau_poids",_voiture_possede_un_nouveau_poids ,true];};};
		if ([_voiture_possede_une_assurance] call verification_si_donnee_existe) then {if (_voiture_possede_une_assurance > 0) then {_obj setvariable ["voiture_possede_une_assurance",_voiture_possede_une_assurance ,true];};};
		if ([_voiture_possede_de_l_eau] call verification_si_donnee_existe) then {if (_voiture_possede_de_l_eau > 0) then {_obj setvariable ["reservoir_d_eau_pour_pompier",_voiture_possede_de_l_eau ,true];};};
		if ([_fuel] call verification_si_donnee_existe) then {if (_fuel > 0) then {_obj setfuel _fuel;};};
		
		
		if ([_usedspace] call verification_si_donnee_existe) then {if (_usedspace > 0) then {_obj setvariable ["usedspace",_usedspace ,true];};};
		if ([_totalspace] call verification_si_donnee_existe) then {if (_totalspace > 0) then {_obj setvariable ["totalspace",_totalspace ,true];};};
		if ([_itemwhale] call verification_si_donnee_existe) then {if (_itemwhale > 0) then {_obj setvariable ["item_baleine_sfp",_itemwhale ,true];};};
		if ([_itemrequin] call verification_si_donnee_existe) then {if (_itemrequin > 0) then {_obj setvariable ["_itemrequin",_itemrequin ,true];};};
		if ([_item_medicaments] call verification_si_donnee_existe) then {if (_item_medicaments > 0) then {_obj setvariable ["item_medicaments_sfp",_item_medicaments ,true];};};
		if ([_item_organes_animaux] call verification_si_donnee_existe) then {if (_item_organes_animaux > 0) then {_obj setvariable ["item_organes_animaux_sfp",_item_organes_animaux ,true];};};
		if ([_itempommes] call verification_si_donnee_existe) then {if (_itempommes > 0) then {_obj setvariable ["item_pomme_sfp",_itempommes ,true];};};
		if ([_itempommedeterre] call verification_si_donnee_existe) then {if (_itempommedeterre > 0) then {_obj setvariable ["item_pomme_de_terre_sfp",_itempommedeterre ,true];};};
		if ([_itemsel] call verification_si_donnee_existe) then {if (_itemsel > 0) then {_obj setvariable ["item_sel_sfp",_itemsel ,true];};};
		if ([_itemunpheroin] call verification_si_donnee_existe) then {if (_itemunpheroin > 0) then {_obj setvariable ["item_heroine_non_traite_sfp",_itemunpheroin ,true];};};
		if ([_itemcuivre] call verification_si_donnee_existe) then {if (_itemcuivre > 0) then {_obj setvariable ["item_cuivre_non_transforme_sfp",_itemcuivre ,true];};};
		if ([_itemcuivretransfo] call verification_si_donnee_existe) then {if (_itemcuivretransfo > 0) then {_obj setvariable ["item_cuivre_transforme_sfp",_itemcuivretransfo ,true];};};
		if ([_itemproheroin] call verification_si_donnee_existe) then {if (_itemproheroin > 0) then {_obj setvariable ["item_heroine_traite_sfp",_itemproheroin ,true];};};
		if ([_itemcannabis_traite] call verification_si_donnee_existe) then {if (_itemcannabis_traite > 0) then {_obj setvariable ["item_cannabis_traite_sfp",_itemcannabis_traite ,true];};};
		if ([_itemcannabis_non_traite] call verification_si_donnee_existe) then {if (_itemcannabis_non_traite > 0) then {_obj setvariable ["item_cannabis_non_traite_sfp",_itemcannabis_non_traite ,true];};};
		if ([_itemtruffle] call verification_si_donnee_existe) then {if (_itemtruffle > 0) then {_obj setvariable ["item_truffe_sfp",_itemtruffle ,true];};};
		if ([_itemfish] call verification_si_donnee_existe) then {if (_itemfish > 0) then {_obj setvariable ["item_poissons_sfp",_itemfish ,true];};};
		if ([_itemfishpoissonspanes] call verification_si_donnee_existe) then {if (_itemfishpoissonspanes > 0) then {_obj setvariable ["itemfishpoissonspanes",_itemfishpoissonspanes ,true];};};
		if ([_itemunpoil] call verification_si_donnee_existe) then {if (_itemunpoil > 0) then {_obj setvariable ["item_petrole_non_traite_sfp",_itemunpoil ,true];};};
		if ([_itemprooil] call verification_si_donnee_existe) then {if (_itemprooil > 0) then {_obj setvariable ["item_petrole_traite_sfp",_itemprooil ,true];};};
		if ([_itemwood] call verification_si_donnee_existe) then {if (_itemwood > 0) then {_obj setvariable ["item_bois_sfp",_itemwood ,true];};};
		if ([_itemrabbitmeat] call verification_si_donnee_existe) then {if (_itemrabbitmeat > 0) then {_obj setvariable ["item_lapins_sfp",_itemrabbitmeat ,true];};};
		if ([_item_serpent_non_transforme] call verification_si_donnee_existe) then {if (_item_serpent_non_transforme > 0) then {_obj setvariable ["serpent_non_transforme",_item_serpent_non_transforme ,true];};};
		if ([_item_serpent_transforme] call verification_si_donnee_existe) then {if (_item_serpent_transforme > 0) then {_obj setvariable ["serpent_transforme",_item_serpent_transforme ,true];};};
		if ([_item_or_non_traite] call verification_si_donnee_existe) then {if (_item_or_non_traite > 0) then {_obj setvariable ["item_or_non_transforme_sfp",_item_or_non_traite ,true];};};
		if ([_item_or_traite] call verification_si_donnee_existe) then {if (_item_or_traite > 0) then {_obj setvariable ["item_or_transforme_sfp",_item_or_traite ,true];};};
		if ([_item_cocaine_feuille] call verification_si_donnee_existe) then {if (_item_cocaine_feuille > 0) then {_obj setvariable ["item_cocaine_feuille",_item_cocaine_feuille ,true];};};
		if ([_item_cocaine_poudre] call verification_si_donnee_existe) then {if (_item_cocaine_poudre > 0) then {_obj setvariable ["item_cocaine_poudre_sfp",_item_cocaine_poudre ,true];};};
		if ([_item_plante_illegale_prete_a_vendre] call verification_si_donnee_existe) then {if (_item_plante_illegale_prete_a_vendre > 0) then {_obj setvariable ["item_plante_illegale_prete_a_vendre_sfp",_item_plante_illegale_prete_a_vendre ,true];};};

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
		
		[_obj,_weapons,_magazines, _items, _backpack] execvm "persistence\voitures\remettre_les_armes_etc_dans_le_coffre_du_vehicule.sqf";
	};
};

sleep 10;
execvm "partie_serveur\persistence\world\voitures_securite_si_serveur_plante\oSave_voitures_securite_serveur_plante.sqf";
diag_log format["Diag SFP : Chargement de %1 Voitures_Securite_Si_Serveur_Plante de iniDB", _objectscount];
"DIAG SFP : Voitures sécurité serveur plante : Lancement chargement 3/3." spawn historique_creation_log_sfp;

