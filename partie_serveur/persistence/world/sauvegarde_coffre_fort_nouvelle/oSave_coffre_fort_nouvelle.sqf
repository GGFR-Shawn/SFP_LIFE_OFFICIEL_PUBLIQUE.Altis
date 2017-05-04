// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

compilation_enregistrement_des_coffres_forts_serveur =
{
	"DIAG SFP : Sauvegarde des coffres forts : Lancement de la compilation." spawn historique_creation_log_sfp;

	_le_coffre_fort = _this select 0;
	_objSaveName = _this select 1;
	if (isnil "_le_coffre_fort" or isnil "_objSaveName") exitwith {diag_log "Diag SFP : Erreur compil coffre fort";};
	
	_classname = typeOf _le_coffre_fort;

	_pos = getPosATL _le_coffre_fort;
	_dir = [vectorDir _le_coffre_fort] + [vectorUp _le_coffre_fort];
	_weapons = getWeaponCargo _le_coffre_fort;
	_magazines = getMagazineCargo _le_coffre_fort;
	_items = getItemCargo _le_coffre_fort;
	_damage = getdammage _le_coffre_fort;
	_backpack = getBackpackCargo _le_coffre_fort;
	
	_argent_coffre_fort = _le_coffre_fort getVariable "mon_argent_poche_by_sfp_maxou";
	_usedspace = _le_coffre_fort getVariable "usedspace";
	_totalspace = _le_coffre_fort getVariable "totalspace";
	_itemwhale = _le_coffre_fort getVariable "item_baleine_sfp";
	_itemrequin = _le_coffre_fort getVariable "item_requin_sfp";
	_item_plante_illegale_prete_a_vendre = _le_coffre_fort getVariable "item_plante_illegale_prete_a_vendre_sfp";
	_item_medicaments = _le_coffre_fort getVariable "item_medicaments_sfp";
	_item_organes_animaux = _le_coffre_fort getVariable "item_organes_animaux_sfp";
	_itempommes = _le_coffre_fort getVariable "item_pomme_sfp";
	_itempommedeterre = _le_coffre_fort getVariable "item_pomme_de_terre_sfp";
	_itemsel = _le_coffre_fort getVariable "item_sel_sfp";
	_itemunpheroin = _le_coffre_fort getVariable "item_heroine_non_traite_sfp";
	_itemcuivre = _le_coffre_fort getVariable "item_cuivre_non_transforme_sfp";
	_itemcuivretransfo = _le_coffre_fort getVariable "item_cuivre_transforme_sfp";
	_itemproheroin = _le_coffre_fort getVariable "item_heroine_traite_sfp";
	_itemcannabis_traite = _le_coffre_fort getVariable "item_cannabis_traite_sfp";
	_itemtruffle = _le_coffre_fort getVariable "item_truffe_sfp";
	_itemfish = _le_coffre_fort getVariable "item_poissons_sfp";
	_itemfishpoissonspanes = _le_coffre_fort getVariable "itemfishpoissonspanes";
	_itemunpoil = _le_coffre_fort getVariable "item_petrole_non_traite_sfp";
	_itemprooil = _le_coffre_fort getVariable "item_petrole_traite_sfp";
	_itemwood = _le_coffre_fort getVariable "item_bois_sfp";
	_itemrabbitmeat = _le_coffre_fort getVariable "item_lapins_sfp";
	_item_serpent_non_transforme = _le_coffre_fort getVariable "serpent_non_transforme";
	_item_serpent_transforme = _le_coffre_fort getVariable "serpent_transforme";
	_item_or_non_traite = _le_coffre_fort getVariable "item_or_non_transforme_sfp";
	_item_or_traite = _le_coffre_fort getVariable "item_or_transforme_sfp";
	_item_cocaine_feuille_coca = _le_coffre_fort getVariable "item_cocaine_feuille_coca_sfp";
	_item_cocaine_poudre = _le_coffre_fort getVariable "item_cocaine_poudre_sfp";
	
	_proprietaire_du_coffre = _le_coffre_fort getVariable "proprietaire_du_coffre";
	_mot_de_passe = _le_coffre_fort getVariable "mot_de_passe_du_coffre_fort";
	
	_heure_du_scan = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["sauvegarde_coffres_forts", _objSaveName, "Date du dernier scan", _heure_du_scan] call saveToDB;

	["sauvegarde_coffres_forts", _objSaveName, "classname", _classname] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "pos", _pos] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "dir", _dir] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "weapons", _weapons] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "magazines", _magazines] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "items", _items] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "damage", _damage] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "Backpack", _backpack] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "proprietaire_du_coffre", _proprietaire_du_coffre] call saveToDB;
	["sauvegarde_coffres_forts", _objSaveName, "mot_de_passe", _mot_de_passe] call saveToDB;
	
	if (!isnil "_argent_coffre_fort") then {["sauvegarde_coffres_forts", _objSaveName, "argent_coffre_fort", _argent_coffre_fort] call saveToDB;};
	if (!isnil "_usedspace") then {["sauvegarde_coffres_forts", _objSaveName, "usedspace", _usedspace] call saveToDB;};
	if (!isnil "_totalspace") then {["sauvegarde_coffres_forts", _objSaveName, "totalspace", _totalspace] call saveToDB;};
	if (!isnil "_itemwhale") then {["sauvegarde_coffres_forts", _objSaveName, "item_baleine_sfp", _itemwhale] call saveToDB;};
	if (!isnil "_item_plante_illegale_prete_a_vendre") then {["sauvegarde_coffres_forts", _objSaveName, "item_plante_illegale_prete_a_vendre_sfp", _item_plante_illegale_prete_a_vendre] call saveToDB;};
	if (!isnil "_itemrequin") then {["sauvegarde_coffres_forts", _objSaveName, "item_requin_sfp", _itemrequin] call saveToDB;};
	if (!isnil "_item_medicaments") then {["sauvegarde_coffres_forts", _objSaveName, "item_medicaments_sfp", _item_medicaments] call saveToDB;};
	if (!isnil "_item_organes_animaux") then {["sauvegarde_coffres_forts", _objSaveName, "item_organes_animaux_sfp", _item_organes_animaux] call saveToDB;};
	if (!isnil "_itempommes") then {["sauvegarde_coffres_forts", _objSaveName, "item_pomme_sfp", _itempommes] call saveToDB;};
	if (!isnil "_itempommedeterre") then {["sauvegarde_coffres_forts", _objSaveName, "item_pomme_de_terre_sfp", _itempommedeterre] call saveToDB;};
	if (!isnil "_itemsel") then {["sauvegarde_coffres_forts", _objSaveName, "item_sel_sfp", _itemsel] call saveToDB;};
	if (!isnil "_itemunpheroin") then {["sauvegarde_coffres_forts", _objSaveName, "item_heroine_non_traite_sfp", _itemunpheroin] call saveToDB;};
	if (!isnil "_itemcuivre") then {["sauvegarde_coffres_forts", _objSaveName, "item_cuivre_non_transforme_sfp", _itemcuivre] call saveToDB;};
	if (!isnil "_itemcuivretransfo") then {["sauvegarde_coffres_forts", _objSaveName, "item_cuivre_transforme_sfp", _itemcuivretransfo] call saveToDB;};
	if (!isnil "_itemproheroin") then {["sauvegarde_coffres_forts", _objSaveName, "item_heroine_traite_sfp", _itemproheroin] call saveToDB;};
	if (!isnil "_itemcannabis_traite") then {["sauvegarde_coffres_forts", _objSaveName, "item_cannabis_traite_sfp", _itemcannabis_traite] call saveToDB;};
	if (!isnil "_itemtruffle") then {["sauvegarde_coffres_forts", _objSaveName, "item_truffe_sfp", _itemtruffle] call saveToDB;};
	if (!isnil "_itemfish") then {["sauvegarde_coffres_forts", _objSaveName, "item_poissons_sfp", _itemfish] call saveToDB;};
	if (!isnil "_itemfishpoissonspanes") then {["sauvegarde_coffres_forts", _objSaveName, "itemfishpoissonspanes", _itemfishpoissonspanes] call saveToDB;};
	if (!isnil "_itemunpoil") then {["sauvegarde_coffres_forts", _objSaveName, "item_petrole_non_traite_sfp", _itemunpoil] call saveToDB;};
	if (!isnil "_itemprooil") then {["sauvegarde_coffres_forts", _objSaveName, "item_petrole_traite_sfp", _itemprooil] call saveToDB;};
	if (!isnil "_itemwood") then {["sauvegarde_coffres_forts", _objSaveName, "item_bois_sfp", _itemwood] call saveToDB;};
	if (!isnil "_itemrabbitmeat") then {["sauvegarde_coffres_forts", _objSaveName, "item_lapins_sfp", _itemrabbitmeat] call saveToDB;};
	if (!isnil "_item_serpent_non_transforme") then {["sauvegarde_coffres_forts", _objSaveName, "serpent_non_transforme", _item_serpent_non_transforme] call saveToDB;};
	if (!isnil "_item_serpent_transforme") then {["sauvegarde_coffres_forts", _objSaveName, "serpent_transforme", _item_serpent_transforme] call saveToDB;};
	if (!isnil "_item_or_non_traite") then {["sauvegarde_coffres_forts", _objSaveName, "item_or_non_transforme_sfp", _item_or_non_traite] call saveToDB;};
	if (!isnil "_item_or_traite") then {["sauvegarde_coffres_forts", _objSaveName, "item_or_transforme_sfp", _item_or_traite] call saveToDB;};
	if (!isnil "_item_cocaine_feuille_coca") then {["sauvegarde_coffres_forts", _objSaveName, "item_cocaine_feuille_coca_sfp", _item_cocaine_feuille_coca] call saveToDB;};
	if (!isnil "_item_cocaine_poudre") then {["sauvegarde_coffres_forts", _objSaveName, "item_cocaine_poudre_sfp", _item_cocaine_poudre] call saveToDB;};
};

"nouvel_achat_coffre_fort" addPublicVariableEventHandler 
{
	"DIAG SFP : Sauvegarde des coffres forts : Lancement d'un achat de coffre." spawn historique_creation_log_sfp;

	[] spawn
	{
		if (isnil "nouvel_achat_coffre_fort") exitwith {};
		
		_le_coffre_fort = nouvel_achat_coffre_fort;
		nouvel_achat_coffre_fort = nil;
		
		_listes_des_coffres_achetes = ["sauvegarde_coffres_forts", "Informations coffres", "Listes des numeros des coffres", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_coffres_forts_achetes_totaux = ["sauvegarde_coffres_forts", "Informations coffres", "Nombre de coffres achetes depuis le debut", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_coffre_fort_achetes_actuel = ["sauvegarde_coffres_forts", "Informations coffres", "Nombre de coffres actuels actuels", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		if !([_listes_des_coffres_achetes] call verification_si_donnee_existe) then {_listes_des_coffres_achetes = [];};
		if !([_nombre_de_coffres_forts_achetes_totaux] call verification_si_donnee_existe) then {_nombre_de_coffres_forts_achetes_totaux = -1;};
		if !([_nombre_de_coffre_fort_achetes_actuel] call verification_si_donnee_existe) then {_nombre_de_coffre_fort_achetes_actuel = -1;};
		
		_objSaveName = format ["Coffre Fort numero %1",round (_nombre_de_coffres_forts_achetes_totaux + 1)];
		
		_nombre_de_coffres_forts_achetes_totaux = round (_nombre_de_coffres_forts_achetes_totaux + 1);
		_nombre_de_coffre_fort_achetes_actuel = round (_nombre_de_coffre_fort_achetes_actuel + 1);
		_listes_des_coffres_achetes = [_listes_des_coffres_achetes, _objSaveName] call BIS_fnc_arrayPush;
				
		_numero_du_coffre_fort = format ["Coffre Fort numero %1",_nombre_de_coffres_forts_achetes_totaux];
		_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];

		["sauvegarde_coffres_forts", "Informations coffres", "Nombre de coffres actuels actuels", _nombre_de_coffre_fort_achetes_actuel] call saveToDB;
		["sauvegarde_coffres_forts", "Informations coffres", "Nombre de coffres achetes depuis le debut", _nombre_de_coffres_forts_achetes_totaux] call saveToDB;
		["sauvegarde_coffres_forts", "Informations coffres", "Listes des numeros des coffres", _listes_des_coffres_achetes] call saveToDB;

		["sauvegarde_coffres_forts", _objSaveName, "numero_du_coffre_fort", _numero_du_coffre_fort] call saveToDB;
		["sauvegarde_coffres_forts", _objSaveName, "Date achat", _heure_enregistrement] call saveToDB;
		
		_le_coffre_fort setVariable ["numero_du_coffre_fort",_numero_du_coffre_fort, true];
		
		diag_log format ["Diag SFP : Sauvegarde du coffre fort %1", _objSaveName];
		
		_detail_log = format ["Le coffre fort de %1 à bien été sauvegardé !", _le_coffre_fort getVariable "proprietaire_du_coffre"];
		["Historique SERVEUR Achat Coffre Fort", "Liste retours serveur achats coffre fort", _heure_enregistrement, _detail_log] call saveToDB;
		
		[_le_coffre_fort, _objSaveName] spawn compilation_enregistrement_des_coffres_forts_serveur;
	};
};

"re_scanner_le_coffre_fort" addPublicVariableEventHandler 
{
	"DIAG SFP : Sauvegarde des coffres forts : Lancement d'un rescan." spawn historique_creation_log_sfp;

	[] spawn
	{
		if (isnil "re_scanner_le_coffre_fort") exitwith {};
		
		_le_coffre_fort = re_scanner_le_coffre_fort;
		re_scanner_le_coffre_fort = nil;

		if (isnil {_le_coffre_fort getvariable "coffre_attente_scan"}) then
		{
			_le_coffre_fort setvariable ["coffre_attente_scan", true, false];
			
			_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
			_detail_log = format ["Le coffre fort de %1 est en attente de rescann", _le_coffre_fort getVariable "proprietaire_du_coffre"];
			["Historique SERVEUR Achat Coffre Fort", "Liste retours serveur achats coffre fort", _heure_enregistrement, _detail_log] call saveToDB;

			waituntil {sleep 2; ({isPlayer _x} count ((getPosATL _le_coffre_fort) nearEntities [["man"], 4]) < 1)};
			
			_objSaveName = format ["%1",_le_coffre_fort getvariable "numero_du_coffre_fort"];
			
			_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
			_detail_log = format ["Le coffre fort de %1 à été rescanné", _le_coffre_fort getVariable "proprietaire_du_coffre"];
			["Historique SERVEUR Achat Coffre Fort", "Liste retours serveur achats coffre fort", _heure_enregistrement, _detail_log] call saveToDB;
			
			[_le_coffre_fort, _objSaveName] spawn compilation_enregistrement_des_coffres_forts_serveur;
			
			_le_coffre_fort setvariable ["coffre_attente_scan", nil, false];
		};
	};
};
