// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Adapté par sfp maxou pour notre mission

waitUntil {!isnil "fin_verification_apres_chargement" && !isnil "fin_trigger_des_collectes" && !isnil "fin_marker_des_transformations"};

listes_des_marqueurs_filtre_sfp = [];
disableSerialization;

_map = findDisplay 12;
_map ctrlCreate ["RscPicture", 2102];
_background = ((findDisplay 12) displayCtrl (2102));
_backX = 0.74 * safezoneW + safezoneX;
_backY = 0.69 * safezoneH + safezoneY;
_backW = 0.25 * safezoneW;
_backH = 0.29 * safezoneH;
_background ctrlSetPosition [_backX, _backY, _backW, _backH];
_background ctrlCommit 0;
_background ctrlSetText "divers\filtre_marker\tablet.paa";

_map ctrlCreate ["RscTree", 2103];
_tree = ((findDisplay 12) displayCtrl (2103));
_lbposX = 0.765 * safezoneW + safezoneX;
_lbposY = 0.725 * safezoneH + safezoneY;
_lbwidth = 0.2015 * safezoneW;
_lbheight = 0.2125 * safezoneH;
_tree ctrlSetPosition [_lbposX,_lbposY,_lbwidth, _lbheight];
_tree ctrlSetBackgroundColor [0, 0, 0, 0];
_tree ctrlCommit 0;
tvClear _tree;
_tree ctrlSetEventHandler ["TreeSelChanged","_this call FLTR_fnc_TreeSel"];

	
_allTrunk = _tree tvAdd [[],"Tout afficher"];
_tree tvSetPicture [[_allTrunk], "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa"];

_noneTrunk = _tree tvAdd [[],"Tout masquer"];
_tree tvSetPicture [[_noneTrunk], "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa"];

_locTrunk = _tree tvAdd [[],"Villes"];
_tree tvSetPicture [[_locTrunk], "\A3\ui_f\data\map\mapcontrol\Tourism_CA.paa"];
_worldCenter = getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition");
_worldSize = getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
 _locations =  nearestLocations [_worldCenter, ["NameCity","NameCityCapital"], _worldSize];
{
	_locBranch =  _tree tvAdd [[ _locTrunk],text _x];
	_count = _tree tvCount [_locTrunk];
	_tree tvSetData [ [_locTrunk,_count - 1], text _x];
}forEach _locations;

_valeur_a_rechercher_par_nom = 
					   [
							["Amphetamines", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Amphetamines"],
							["Anpe/Mutuelle/Ecole/CAF", "\A3\ui_f\data\map\mapcontrol\power_CA.paa", "Anpe"],
							["Assurance Vehicule", "\A3\ui_f\data\map\mapcontrol\stack_CA.paa", " Assurance Vehicule"],
							["Bar", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Bar !"],
							["Boutique Armes Légales", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Armes Légales"],
							["Boutique Armes Ilégales", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Armes Illégales"],
							["Boutique Location Vehicules", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", "Location Vehicules !"],
							["Boutique Plongee", "\A3\ui_f\data\map\mapcontrol\tree_CA.paa", "Boutique Plongee"],
							["Boutique Télécom", "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa", " SFP Telecom !"],
							["Boutique Tuning", "\A3\ui_f\data\map\mapcontrol\stack_CA.paa", " Tuning !"],
							["Boutique Vetements", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", "Vetements"],
							["Carrosserie", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " Carrosserie !"],
							["Collecte Baleine", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Baleine"],
							["Collecte Bois", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Bois"],
							["Collecte Cannabis", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Cannabis"],
							["Collecte Cocaine", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Cocaine"],
							["Collecte Cuivre", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Cuivre"],
							["Collecte Heroine", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Heroine"],
							["Collecte Medicaments", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Medicaments"],
							["Collecte Or", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Or"],
							["Collecte Organes Animaux", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Organes Animaux"],
							["Collecte Petrole", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Petrole"],
							["Collecte Poissons Chalutier", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Poissons Chalutier"],
							["Collecte Poissons", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Poissons"],
							["Collecte Pommes De Terre", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Pommes De Terre"],
							["Collecte Pommes", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Pommes"],
							["Collecte Requin", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Requin"],
							["Collecte Sel", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Sel"],
							["Collecte Truffes", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa", " Truffes"],
							["Employer travailleur au noir", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Travailleur Au noir"],
							["Ferry", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", " Ferry !"],
							["Formation Laboratoire", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Formation Laboratoire"],
							["Française des jeux", "\A3\ui_f\data\map\mapcontrol\tree_CA.paa", "Fr Des Jeux !"],
							["Gendarmerie", "\A3\ui_f\data\map\mapcontrol\tree_CA.paa", " Gendarmerie !"],
							["Go Fast", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Go Fast"],
							["Hack Informatique", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", " Hack Informatique"],
							["Hopital", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", " Hopital !"],
							["Karting", "\A3\ui_f\data\map\mapcontrol\tree_CA.paa", "Karting"],
							["Laboratoire (Drogue)", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Laboratoire (Drogue)"],
							["Licences Drogues", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Licences Drogues"],
							["Livrer Colis", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Colis"],
							["Livrer Gasoil", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Livrer Gasoil"],
							["Livrer Journaux", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Journaux"],
							["Livrer Marchandises", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Livrer Marchandise"],
							["Mairie", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", "Mairie !"],
							["Marche", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Marche"],
							["Mission Calcul", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Calcul !"],
							["Mission Marine", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", "Mission Marine"],
							["Pepiniere", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Pepiniere"],
							["Pharmarcie", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", " Pharmarcie !"],
							["Quincaillerie", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " Quincaillerie !"],
							["Restaurant", "\A3\ui_f\data\map\mapcontrol\smalltree_CA.paa", " Restaurant !"],
							["Sarl Auto Ecole", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL AUTOECOLE"],
							["Sarl Avocat", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL AVOCAT"],
							["Sarl Car Shop", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL CAR SHOP"],
							["Sarl DIR", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL D.I.R"],
							["Sarl Néomédia", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL NEOMEDIA"],
							["Sarl Pompier", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL POMPIER"],
							["Sarl ALTIS && FURIOUS", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL ALTIS && FURIOUS"],
							["Sarl Taxi G7", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " SARL TAXI G7"],
							["Saut Parachute", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", "Saut Parachute"],
							["Transformation Cannabis", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Transf Cannabis"],
							["Transformation Cuivre", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Transformation Cuivre"],
							["Transformation Heroine", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Transf Heroine"],
							["Transformation Or", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Transformation Or"],
							["Transformation Pétrole", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", " Transf petrole"],
							["Transformation Poissons Panes", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", "Transf Poissons Pane"],
							["Transformation Serpent", "\A3\ui_f\data\map\mapcontrol\fortress_CA.paa", " Transf Serpent"],
							["Vendre Petrole", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", "Vendre Petrole"],
							["Vendre Voitures Volées", "\A3\ui_f\data\map\mapcontrol\stack_CA.paa", " Voitures Voles !"]
					   ];

_valeur_a_rechercher_par_type_sfp = 
					   [
							["Boutique Bateaux", "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa", "c_ship", "ColorOrange"],
							["Boutique Avions", "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa", "c_plane", "ColorRed"],
							["Boutique Hélicoptères", "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa", "c_air", "ColorKhaki"],
							["Boutique Véhicules", "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa", "c_car", "ColorWhite"],
							["Réarmer Véhicules", "\A3\ui_f\data\map\mapcontrol\waypointeditor_CA.paa", "loc_Bunker", "AUCUNE"],
							["Réparer Hélicoptères", "\A3\ui_f\data\map\mapcontrol\custommark_CA.paa", "n_maint", "AUCUNE"],
							["Réparer Bateaux", "\A3\ui_f\data\map\mapcontrol\custommark_CA.paa", "o_maint", "AUCUNE"],
							["Réparer Véhicules", "\A3\ui_f\data\map\mapcontrol\custommark_CA.paa", "b_maint", "AUCUNE"],
							["Relais Télécom", "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa", "loc_Transmitter", "AUCUNE"],
							["Vendre Sa Voiture", "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa", "c_car", "ColorOrange"],
							["Radar 130", "\A3\ui_f\data\map\mapcontrol\tree_CA.paa", "hd_warning", "ColorYellow"],
							["Radar 50", "\A3\ui_f\data\map\mapcontrol\tree_CA.paa", "hd_warning", "ColorRed"],
							["Médecins", "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa", "loc_Hospital", "AUCUNE"]
					   ];

{
	_nombre = 0;
	_texte_base_sfp = _x select 0;
	_icones_sfp = _x select 1;
	_type_icone_sfp = _x select 2;
	_couleur_icone_sfp = _x select 3;
	_locTrunk = _tree tvAdd [[],_texte_base_sfp];
	_tree tvSetPicture [[_locTrunk], _icones_sfp];
	
	{
		if (getmarkertype _x == _type_icone_sfp && (markerColor _x == _couleur_icone_sfp or _couleur_icone_sfp == "AUCUNE")) then 
		{
			if (getmarkerpos _x distance [18960.2,33471.8,0] > 8000) then
			{
				_nombre = round (_nombre + 1);
				_texte = format ["%1 - %2.", _texte_base_sfp, _nombre];
				
				_locBranch =  _tree tvAdd [[ _locTrunk], _texte];
				_count = _tree tvCount [_locTrunk];
				_tree tvSetData [ [_locTrunk,_count - 1], _texte];
				
				listes_des_marqueurs_filtre_sfp pushback [_texte, getmarkerpos _x];
			};
		};
	} forEach allMapMarkers;
} foreach _valeur_a_rechercher_par_type_sfp;

{
	_nombre = 0;
	_texte_base_sfp = _x select 0;
	_icones_sfp = _x select 1;
	_nom_icone_sfp = _x select 2;
	_locTrunk = _tree tvAdd [[],_texte_base_sfp];
	_tree tvSetPicture [[_locTrunk], _icones_sfp];
	
	{
		if (markerText _x == _nom_icone_sfp) then 
		{
			if (getmarkerpos _x distance [18960.2,33471.8,0] > 8000) then
			{
				_nombre = round (_nombre + 1);
				_texte = format ["%1 - %2.", _texte_base_sfp, _nombre];
				
				_locBranch =  _tree tvAdd [[ _locTrunk], _texte];
				_count = _tree tvCount [_locTrunk];
				_tree tvSetData [ [_locTrunk,_count - 1], _texte];
				
				listes_des_marqueurs_filtre_sfp pushback [_texte, getmarkerpos _x];
			};
		};
	} forEach allMapMarkers;
} foreach _valeur_a_rechercher_par_nom;
					   					   
