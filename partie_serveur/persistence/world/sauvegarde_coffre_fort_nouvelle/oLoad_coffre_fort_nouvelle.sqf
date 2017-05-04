// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : chargement des coffres forts : Lancement 1/3." spawn historique_creation_log_sfp;

execVM "partie_serveur\persistence\world\sauvegarde_coffre_fort_nouvelle\oSave_coffre_fort_nouvelle.sqf";

_listes_des_coffres_achetes = ["sauvegarde_coffres_forts", "Informations coffres", "Listes des numeros des coffres", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
if (!([_listes_des_coffres_achetes] call verification_si_donnee_existe)) exitwith {};
if (count _listes_des_coffres_achetes < 1) exitwith {};
	
"DIAG SFP : chargement des coffres forts : Lancement 2/3." spawn historique_creation_log_sfp;
	
for "_i" from 0 to (count _listes_des_coffres_achetes - 1) do
{
	_objSaveName = format["%1", _listes_des_coffres_achetes select _i]; 
	
	_class = ["sauvegarde_coffres_forts", _objSaveName, "classname", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_pos = ["sauvegarde_coffres_forts", _objSaveName, "pos", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_dir = ["sauvegarde_coffres_forts", _objSaveName, "dir", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_weapons = ["sauvegarde_coffres_forts", _objSaveName, "weapons", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_magazines = ["sauvegarde_coffres_forts", _objSaveName, "magazines", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_items = ["sauvegarde_coffres_forts", _objSaveName, "items", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_backpack = ["sauvegarde_coffres_forts", _objSaveName, "Backpack", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_argent_coffre_fort = ["sauvegarde_coffres_forts", _objSaveName, "argent_coffre_fort", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_usedspace = ["sauvegarde_coffres_forts", _objSaveName, "usedspace", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_totalspace = ["sauvegarde_coffres_forts", _objSaveName, "totalspace", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemwhale = ["sauvegarde_coffres_forts", _objSaveName, "item_baleine_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemrequin = ["sauvegarde_coffres_forts", _objSaveName, "item_requin_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_plante_illegale_prete_a_vendre = ["sauvegarde_coffres_forts", _objSaveName, "item_plante_illegale_prete_a_vendre_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_medicaments = ["sauvegarde_coffres_forts", _objSaveName, "item_medicaments_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_organes_animaux = ["sauvegarde_coffres_forts", _objSaveName, "item_organes_animaux_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itempommes = ["sauvegarde_coffres_forts", _objSaveName, "item_pomme_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itempommedeterre = ["sauvegarde_coffres_forts", _objSaveName, "item_pomme_de_terre_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemsel = ["sauvegarde_coffres_forts", _objSaveName, "item_sel_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemunpheroin = ["sauvegarde_coffres_forts", _objSaveName, "item_heroine_non_traite_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemcuivre = ["sauvegarde_coffres_forts", _objSaveName, "item_cuivre_non_transforme_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemcuivretransfo = ["sauvegarde_coffres_forts", _objSaveName, "item_cuivre_transforme_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemproheroin = ["sauvegarde_coffres_forts", _objSaveName, "item_heroine_traite_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemcannabis_traite = ["sauvegarde_coffres_forts", _objSaveName, "item_cannabis_traite_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemtruffle = ["sauvegarde_coffres_forts", _objSaveName, "item_truffe_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemfish = ["sauvegarde_coffres_forts", _objSaveName, "item_poissons_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemfishpoissonspanes = ["sauvegarde_coffres_forts", _objSaveName, "itemfishpoissonspanes", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemunpoil = ["sauvegarde_coffres_forts", _objSaveName, "item_petrole_non_traite_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemprooil = ["sauvegarde_coffres_forts", _objSaveName, "item_petrole_traite_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemwood = ["sauvegarde_coffres_forts", _objSaveName, "item_bois_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_itemrabbitmeat = ["sauvegarde_coffres_forts", _objSaveName, "item_lapins_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_serpent_non_transforme = ["sauvegarde_coffres_forts", _objSaveName, "serpent_non_transforme", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_serpent_transforme = ["sauvegarde_coffres_forts", _objSaveName, "serpent_transforme", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_or_non_traite = ["sauvegarde_coffres_forts", _objSaveName, "item_or_non_transforme_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_or_traite = ["sauvegarde_coffres_forts", _objSaveName, "item_or_transforme_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_cocaine_feuille_coca = ["sauvegarde_coffres_forts", _objSaveName, "item_cocaine_feuille_coca_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_item_cocaine_poudre = ["sauvegarde_coffres_forts", _objSaveName, "item_cocaine_poudre_sfp", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	_proprietaire_du_coffre = ["sauvegarde_coffres_forts", _objSaveName, "proprietaire_du_coffre", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_mot_de_passe = ["sauvegarde_coffres_forts", _objSaveName, "mot_de_passe", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_numero_du_coffre = ["sauvegarde_coffres_forts", _objSaveName, "numero_du_coffre_fort", "test_valeur_existe"] call loadFromDB_Local_Serveur;

	if (([_objSaveName] call verification_si_donnee_existe) && ([_class] call verification_si_donnee_existe) && ([_pos] call verification_si_donnee_existe) && ([_dir] call verification_si_donnee_existe)) then 
	{
		if (count _pos >= 3) then
		{		
			_obj = createVehicle [_class, [_pos select 0, _pos select 1, _pos select 2], [], 0, "can_collide"];
			_obj setVectorDirAndUp _dir;
			_obj setpos _pos;
			clearWeaponCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			clearItemCargoGlobal _obj;
			sleep 1;

			for [{_ii = 0}, {_ii < (count (_weapons select 0))}, {_ii = _ii + 1}] do 
			{			
				if (((_weapons select 0) select _ii) != "") then
				{	
					_obj addWeaponCargoGlobal [(_weapons select 0) select _ii, (_weapons select 1) select _ii];
				};
			};

			for [{_ii = 0}, {_ii < (count (_magazines select 0))}, {_ii = _ii + 1}] do 
			{
				if (((_magazines select 0) select _ii) != "") then
				{			
					_obj addMagazineCargoGlobal [(_magazines select 0) select _ii, (_magazines select 1) select _ii];
				};
			};
			
			for [{_ii = 0}, {_ii < (count (_items select 0))}, {_ii = _ii + 1}] do 
			{
				if (((_items select 0) select _ii) != "") then
				{			
					_obj addItemCargoGlobal [(_items select 0) select _ii, (_items select 1) select _ii];
				};
			};
			
			if ([_backpack] call verification_si_donnee_existe) then 
			{
				for [{_ii = 0}, {_ii < (count (_backpack select 0))}, {_ii = _ii + 1}] do 
				{
					_obj addBackpackCargoGlobal  [(_backpack select 0) select _ii, (_backpack select 1) select _ii];
				};
			};
			
			if ([_usedspace] call verification_si_donnee_existe) then {_obj setVariable ["usedspace",_usedspace , true];};
			if ([_totalspace] call verification_si_donnee_existe) then {_obj setVariable ["totalspace",_totalspace , true];};
			if ([_itemwhale] call verification_si_donnee_existe) then {_obj setVariable ["item_baleine_sfp",_itemwhale , true];};
			if ([_itemrequin] call verification_si_donnee_existe) then {_obj setVariable ["item_requin_sfp",_itemrequin , true];};
			if ([_item_medicaments] call verification_si_donnee_existe) then {_obj setVariable ["item_medicaments_sfp",_item_medicaments , true];};
			if ([_item_plante_illegale_prete_a_vendre] call verification_si_donnee_existe) then {_obj setVariable ["item_plante_illegale_prete_a_vendre_sfp",_item_plante_illegale_prete_a_vendre , true];};
			if ([_item_organes_animaux] call verification_si_donnee_existe) then {_obj setVariable ["item_organes_animaux_sfp",_item_organes_animaux , true];};
			if ([_itempommes] call verification_si_donnee_existe) then {_obj setVariable ["item_pomme_sfp",_itempommes , true];};
			if ([_itempommedeterre] call verification_si_donnee_existe) then {_obj setVariable ["item_pomme_de_terre_sfp",_itempommedeterre, true];};
			if ([_itemsel] call verification_si_donnee_existe) then {_obj setVariable ["item_sel_sfp",_itemsel, true];};
			if ([_itemunpheroin] call verification_si_donnee_existe) then {_obj setVariable ["item_heroine_non_traite_sfp",_itemunpheroin, true];};
			if ([_itemcuivre] call verification_si_donnee_existe) then {_obj setVariable ["item_cuivre_non_transforme_sfp",_itemcuivre, true];};
			if ([_itemcuivretransfo] call verification_si_donnee_existe) then {_obj setVariable ["item_cuivre_transforme_sfp",_itemcuivretransfo, true];};
			if ([_itemproheroin] call verification_si_donnee_existe) then {_obj setVariable ["item_heroine_traite_sfp",_itemproheroin, true];};
			if ([_itemcannabis_traite] call verification_si_donnee_existe) then {_obj setVariable ["item_cannabis_traite_sfp",_itemcannabis_traite, true];};
			if ([_itemtruffle] call verification_si_donnee_existe) then {_obj setVariable ["item_truffe_sfp",_itemtruffle, true];};
			if ([_itemfish] call verification_si_donnee_existe) then {_obj setVariable ["item_poissons_sfp",_itemfish , true];};
			if ([_itemfishpoissonspanes] call verification_si_donnee_existe) then {_obj setVariable ["itemfishpoissonspanes",_itemfishpoissonspanes, true];}; 
			if ([_itemunpoil] call verification_si_donnee_existe) then {_obj setVariable ["item_petrole_non_traite_sfp",_itemunpoil, true];};
			if ([_itemprooil] call verification_si_donnee_existe) then {_obj setVariable ["item_petrole_traite_sfp",_itemprooil, true];};
			if ([_itemwood] call verification_si_donnee_existe) then {_obj setVariable ["item_bois_sfp",_itemwood, true];};
			if ([_itemrabbitmeat] call verification_si_donnee_existe) then {_obj setVariable ["item_lapins_sfp",_itemrabbitmeat, true];};
			if ([_item_serpent_non_transforme] call verification_si_donnee_existe) then {_obj setVariable ["serpent_non_transforme",_item_serpent_non_transforme, true];};
			if ([_item_serpent_transforme] call verification_si_donnee_existe) then {_obj setVariable ["serpent_transforme",_item_serpent_transforme, true];};
			if ([_item_or_non_traite] call verification_si_donnee_existe) then {_obj setVariable ["item_or_non_transforme_sfp",_item_or_non_traite, true];};
			if ([_item_or_traite] call verification_si_donnee_existe) then {_obj setVariable ["item_or_transforme_sfp",_item_or_traite, true];};
			if ([_item_cocaine_feuille_coca] call verification_si_donnee_existe) then {_obj setVariable ["item_cocaine_feuille_coca_sfp",_item_cocaine_feuille_coca, true];};
			if ([_item_cocaine_poudre] call verification_si_donnee_existe) then {_obj setVariable ["item_cocaine_poudre_sfp",_item_cocaine_poudre, true];};
			
			if ([_argent_coffre_fort] call verification_si_donnee_existe) then {_obj setVariable ["argent_coffre_fort",_argent_coffre_fort , true];};
			if ([_proprietaire_du_coffre] call verification_si_donnee_existe) then {_obj setVariable ["proprietaire_du_coffre", _proprietaire_du_coffre, true];};
			if ([_mot_de_passe] call verification_si_donnee_existe) then {_obj setVariable ["mot_de_passe_du_coffre_fort", _mot_de_passe, true];};
			if ([_numero_du_coffre] call verification_si_donnee_existe) then {_obj setVariable ["numero_du_coffre_fort", _numero_du_coffre, true];};
		};
	};
};

diag_log format ["Diag SFP : Chargement de %1 coffres forts total !", count _listes_des_coffres_achetes];
"DIAG SFP : chargement des coffres forts : Lancement 3/3." spawn historique_creation_log_sfp;
