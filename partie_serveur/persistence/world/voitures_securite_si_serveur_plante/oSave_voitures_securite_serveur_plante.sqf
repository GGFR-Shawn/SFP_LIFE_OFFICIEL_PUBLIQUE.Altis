// =======================================================================================================================================================================================
							// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
							  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] execVM "partie_serveur\persistence\world\voitures_fourriere\oLoad_voitures_fourriere.sqf";

sleep 10;

while {le_serveur_va_redemarrer_dans_20_minutes < 1} do
{
	sleep 60;
	
	"DIAG SFP : Voitures sécurité serveur plante : Lancement d'une sauvegarde." spawn historique_creation_log_sfp;

	_vehicule_a_ne_pas_sauvegarder = ["vehicule_capture_gang","non prenable"];
	_PersistentDB_ObjCount = 0;
	{
		if (!isnil {_x getvariable "vehicule_info_parvariable"} && alive _x) then
		{
			if !(_x getvariable "vehicule_info_parvariable" select 0 in _vehicule_a_ne_pas_sauvegarder) then
			{		
				_le_vehicule = _x;
				
				_classname = typeOf _le_vehicule;
				_pos = position _le_vehicule;
				_dir = [vectorDir _le_vehicule] + [vectorUp _le_vehicule];
				_backpack = getBackpackCargo _le_vehicule;
				_weapons = getWeaponCargo _le_vehicule;
				_magazines = getMagazineCargo _le_vehicule;
				_items = getItemCargo _le_vehicule;
				_fuel = fuel _le_vehicule;
				
				_proprietaire = _le_vehicule getVariable "vehicule_info_parvariable"; 
				_plaque_immatriculation = _le_vehicule getVariable "plaque_immatriculation_news";
				_couleur_du_vehicule = getObjectTextures _le_vehicule;
				_voiture_possede_un_klaxon = _le_vehicule getVariable "voiture_possede_un_klaxon";
				_voiture_possede_une_puce = _le_vehicule getVariable "voiture_possede_une_puce";
				_voiture_possede_un_neon = _le_vehicule getVariable "voiture_possede_un_neon";
				_voiture_possede_un_radar_de_recul = _le_vehicule getVariable "voiture_possede_un_radar_de_recul";
				_voiture_possede_un_detecteur_de_radar = _le_vehicule getVariable "voiture_possede_un_detecteur_de_radar";
				_voiture_possede_un_nouveau_poids = _le_vehicule getVariable "voiture_possede_un_nouveau_poids";
				_voiture_possede_de_l_eau = _le_vehicule getVariable "reservoir_d_eau_pour_pompier";
				_voiture_prix_du_neuf = _le_vehicule getVariable "prix_du_vehicule_neuf";
				_voiture_possede_une_assurance = _le_vehicule getVariable "voiture_possede_une_assurance";
				
				_usedspace = _le_vehicule getVariable "usedspace";
				_totalspace = _le_vehicule getVariable "totalspace";
				_itemwhale = _le_vehicule getVariable "item_baleine_sfp";
				_itemrequin = _le_vehicule getVariable "item_requin_sfp";
				_item_medicaments = _le_vehicule getVariable "item_medicaments_sfp";
				_item_organes_animaux = _le_vehicule getVariable "item_organes_animaux_sfp";
				_itempommes = _le_vehicule getVariable "item_pomme_sfp";
				_itempommedeterre = _le_vehicule getVariable "item_pomme_de_terre_sfp";
				_itemsel = _le_vehicule getVariable "item_sel_sfp";
				_itemunpheroin = _le_vehicule getVariable "item_heroine_non_traite_sfp";
				_itemcuivre = _le_vehicule getVariable "item_cuivre_non_transforme_sfp";
				_itemcuivretransfo = _le_vehicule getVariable "item_cuivre_transforme_sfp";
				_itemproheroin = _le_vehicule getVariable "item_heroine_traite_sfp";
				_itemcannabis_traite = _le_vehicule getVariable "item_cannabis_traite_sfp";
				_itemcannabis_non_traite = _le_vehicule getVariable "item_cannabis_non_traite_sfp";
				_itemtruffle = _le_vehicule getVariable "item_truffe_sfp";
				_itemfish = _le_vehicule getVariable "item_poissons_sfp";
				_itemfishpoissonspanes = _le_vehicule getVariable "itemfishpoissonspanes";
				_itemunpoil = _le_vehicule getVariable "item_petrole_non_traite_sfp";
				_itemprooil = _le_vehicule getVariable "item_petrole_traite_sfp";
				_itemwood = _le_vehicule getVariable "item_bois_sfp";
				_itemrabbitmeat = _le_vehicule getVariable "item_lapins_sfp";
				_item_serpent_non_transforme = _le_vehicule getVariable "serpent_non_transforme";
				_item_serpent_transforme = _le_vehicule getVariable "serpent_transforme";
				_item_or_non_traite = _le_vehicule getVariable "item_or_non_transforme_sfp";
				_item_or_traite = _le_vehicule getVariable "item_or_transforme_sfp";
				_item_cocaine_feuille = _le_vehicule getVariable "item_cocaine_feuille_coca_sfp";
				_item_cocaine_poudre = _le_vehicule getVariable "item_cocaine_poudre_sfp";
				_item_plante_illegale_prete_a_vendre = _le_vehicule getVariable "item_plante_illegale_prete_a_vendre_sfp";


				_objSaveName = format["voiture securite numero %1", _PersistentDB_ObjCount];

				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "classname", _classname] call saveToDB;
				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "pos", _pos] call saveToDB;
				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Direction", _dir] call saveToDB;
				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "BackPack", _backpack] call saveToDB;
				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Weapons", _weapons] call saveToDB;
				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Magazines", _magazines] call saveToDB;
				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Items", _items] call saveToDB;
				["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "Fuel", _fuel] call saveToDB;
				
				if (!isnil "_proprietaire") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_proprietaire", _proprietaire] call saveToDB;};
				if (!isnil "_plaque_immatriculation") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_plaque_immatriculation", _plaque_immatriculation] call saveToDB;};
				if (!isnil "_couleur_du_vehicule") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_couleur_du_vehicule", _couleur_du_vehicule] call saveToDB;};
				if (!isnil "_voiture_possede_un_klaxon") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_klaxon", _voiture_possede_un_klaxon] call saveToDB;};
				if (!isnil "_voiture_possede_une_puce") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_une_puce", _voiture_possede_une_puce] call saveToDB;};
				if (!isnil "_voiture_possede_un_neon") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_neon", _voiture_possede_un_neon] call saveToDB;};
				if (!isnil "_voiture_possede_un_radar_de_recul") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_radar_de_recul", _voiture_possede_un_radar_de_recul] call saveToDB;};
				if (!isnil "_voiture_possede_un_detecteur_de_radar") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_detecteur_de_radar", _voiture_possede_un_detecteur_de_radar] call saveToDB;};
				if (!isnil "_voiture_possede_un_nouveau_poids") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_un_nouveau_poids", _voiture_possede_un_nouveau_poids] call saveToDB;};
				if (!isnil "_voiture_possede_de_l_eau") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_de_l_eau", _voiture_possede_de_l_eau] call saveToDB;};
				if (!isnil "_voiture_prix_du_neuf") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_prix_du_neuf", _voiture_prix_du_neuf] call saveToDB;};
				if (!isnil "_voiture_possede_une_assurance") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_voiture_possede_une_assurance", _voiture_possede_une_assurance] call saveToDB;};
				
				if (!isnil "_usedspace") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_usedspace", _usedspace] call saveToDB;};
				if (!isnil "_totalspace") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_totalspace", _totalspace] call saveToDB;};
				if (!isnil "_itemwhale") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemwhale", _itemwhale] call saveToDB;};
				if (!isnil "_itemrequin") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemrequin", _itemrequin] call saveToDB;};
				if (!isnil "_item_medicaments") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_medicaments", _item_medicaments] call saveToDB;};
				if (!isnil "_item_organes_animaux") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_organes_animaux", _item_organes_animaux] call saveToDB;};
				if (!isnil "_itempommes") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itempommes", _itempommes] call saveToDB;};
				if (!isnil "_itempommedeterre") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itempommedeterre", _itempommedeterre] call saveToDB;};
				if (!isnil "_itemsel") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemsel", _itemsel] call saveToDB;};
				if (!isnil "_itemunpheroin") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemunpheroin", _itemunpheroin] call saveToDB;};
				if (!isnil "_itemcuivre") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcuivre", _itemcuivre] call saveToDB;};
				if (!isnil "_itemcuivretransfo") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcuivretransfo", _itemcuivretransfo] call saveToDB;};
				if (!isnil "_itemproheroin") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemproheroin", _itemproheroin] call saveToDB;};
				if (!isnil "_itemcannabis_traite") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcannabis_traite", _itemcannabis_traite] call saveToDB;};
				if (!isnil "_itemcannabis_non_traite") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemcannabis_non_traite", _itemcannabis_non_traite] call saveToDB;};
				if (!isnil "_itemtruffle") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemtruffle", _itemtruffle] call saveToDB;};
				if (!isnil "_itemfish") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemfish", _itemfish] call saveToDB;};
				if (!isnil "_itemfishpoissonspanes") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemfishpoissonspanes", _itemfishpoissonspanes] call saveToDB;};
				if (!isnil "_itemunpoil") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemunpoil", _itemunpoil] call saveToDB;};
				if (!isnil "_itemprooil") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemprooil", _itemprooil] call saveToDB;};
				if (!isnil "_itemwood") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemwood", _itemwood] call saveToDB;};
				if (!isnil "_itemrabbitmeat") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_itemrabbitmeat", _itemrabbitmeat] call saveToDB;};
				if (!isnil "_item_serpent_non_transforme") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_serpent_non_transforme", _item_serpent_non_transforme] call saveToDB;};
				if (!isnil "_item_serpent_transforme") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_serpent_transforme", _item_serpent_transforme] call saveToDB;};
				if (!isnil "_item_or_non_traite") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_or_non_traite", _item_or_non_traite] call saveToDB;};
				if (!isnil "_item_or_traite") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_or_traite", _item_or_traite] call saveToDB;};
				if (!isnil "_item_cocaine_feuille") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_cocaine_feuille", _item_cocaine_feuille] call saveToDB;};
				if (!isnil "_item_cocaine_poudre") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_cocaine_poudre", _item_cocaine_poudre] call saveToDB;};
				if (!isnil "_item_plante_illegale_prete_a_vendre") then {["sauvegarde_voitures_securite_si_serveur_plante", _objSaveName, "_item_plante_illegale_prete_a_vendre", _item_plante_illegale_prete_a_vendre] call saveToDB;};
				
				["sauvegarde_voitures_securite_si_serveur_plante", "Count", "Count", _PersistentDB_ObjCount] call saveToDB;

				_PersistentDB_ObjCount = _PersistentDB_ObjCount + 1;
			};
		};
		sleep 0.5;
	} forEach vehicles;

	diag_log format["Diag SFP : %1 voiture de la fourrière ont bien etes sav dans iniDB", _PersistentDB_ObjCount];
};

("sauvegarde_voitures_securite_si_serveur_plante") call delete_fichier_entier;