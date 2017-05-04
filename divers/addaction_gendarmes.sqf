// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

condition_detection_joueur_arrete =
{
	_parametre = _this select 0;
	_condition = false;
	{
		if (side _x == civilian && _x != player) then
		{
			switch _parametre do
			{
				case "1" :
				{
					if (!isnil {_x getvariable "joueur_menotte"}) then
					{
						_condition = true;
					};
				};
					
				case "2" :
				{
					if (!isnil {_x getvariable "joueur_menotte"} && isNull attachedTo _x) then
					{
						_condition = true;
					};
				};
					
				case "3" :
				{
					if (!isnil {_x getvariable "joueur_menotte"} && !isNull attachedTo _x) then
					{
						_condition = true;
					};
				};
			};
		};
	} foreach (player nearEntities ['Man', 1.5]);
	_condition;
};

detection_du_joueur_arrete_gendarmerie =
{
	le_joueur_arrete_gendarmerie = nil;
	if (isplayer cursortarget && side cursortarget == civilian && player distance cursortarget < 4 && !isnil {cursortarget getvariable "joueur_menotte"}) then
	{
		le_joueur_arrete_gendarmerie = cursortarget;
	}else
	{
		_condition = true;
		{
			if (_condition && isplayer _x && side _x == civilian && player distance _x < 4 && !isnil {_x getvariable "joueur_menotte"}) then
			{
					le_joueur_arrete_gendarmerie = _x;
					_condition = false;
			};
		} foreach (player nearEntities [['man'], 2]);
	};
	if (isnil "le_joueur_arrete_gendarmerie") exitwith {hint "Erreur, pas de joueur trouvé ...";};
};

// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												// QUAND JOUEUR MENOTTE //
// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
menu_addaction_gendarme_joueur_arreter =
{	
	player removeaction ouvrir_menu_addaction_joueur_arreter;
	
	player addaction ["<t color=""#ff0000"">" + "Attacher le prisonnier !","divers\gendarmerie\menotter\attacher_detacher_joueur_menotte.sqf", ["1"], 15, true, true, "", 
	"['2'] call condition_detection_joueur_arrete"
	];

	player addaction ["<t color=""#ff0000"">" + "Detacher le prisonnier !","divers\gendarmerie\menotter\attacher_detacher_joueur_menotte.sqf", ["2"], 15, true, true, "", 
	"['3'] call condition_detection_joueur_arrete"
	];

	player addaction ["<t color=""#ff0000"">" + "Enlever les menottes !","divers\gendarmerie\menotter\demenotter_local.sqf", [], 15, true, true, "", 
	"['1'] call condition_detection_joueur_arrete"
	];

	player addaction ["<t color=""#ff0000"">" + "Charger dans un véhicule !","divers\gendarmerie\charger_joueur_dans_vehicule.sqf", [], 15, true, true, "", 
	"['1'] call condition_detection_joueur_arrete"
	];

	player addaction ["<t color=""#ff0000"">" + "Envoyer le civil en prison si besoin !","divers\gendarmerie\prison\envoyer_prison_local.sqf", [], 15, true, true, "", 
	"['1'] call condition_detection_joueur_arrete"
	];

	player addaction ["<t color=""#ff0000"">" + "Mettre en garde à vue !","divers\gendarmerie\garde_a_vue\garde_a_vue_1.sqf", [], 15, true, true, "", 
	"['1'] call condition_detection_joueur_arrete"
	];
};
	
ouvrir_menu_addaction_joueur_arreter = player addaction ["<t color=""#ff0000"">" + "Menu Gendarme Joueur Arreter !", menu_addaction_gendarme_joueur_arreter, [], 60, true, true, "", "['1'] call condition_detection_joueur_arrete"];

// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												// MENU CLASSIQUE //
// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
sleep 0.02;
player addaction ["<t color=""#ff0000"">" + "------------------------- GENDARME MENU CIVIL -----------------", "", [], 5, false, true, "", 
"({side _x == civilian && isPlayer _x} count (player nearEntities ['Man', 8])) >= 1"
];
sleep 0.02;

sleep 0.02;
player addaction ["1) Fouiller le civil (Raccourci Touche TAB)", "divers\gendarmerie\fouiller\essaitestinventaire.sqf", [], 5, false, true, "", 
"({side _x == civilian && isPlayer _x} count (player nearEntities ['Man', 8])) >= 1"
];
sleep 0.02;

sleep 0.02;
player addaction ["2) Menotter le civil", "divers\gendarmerie\menotter\menotter_le_civil_local.sqf", [], 5, false, true, "", 
"({side _x == civilian && isPlayer _x} count (player nearEntities ['Man', 8])) >= 1"
];
sleep 0.02;

sleep 0.02;
player addaction ["3) Test D'Alcoolémie (Positif !)", "divers\gendarmerie\fouiller\testdalcoolemie.sqf", [], 5, false, true, "", 
"!isnil {cursorTarget getvariable 'jaibu_by_sfp_maxou'}"
];
sleep 0.02;

sleep 0.02;
player addaction ["4) Mettre Amende + Liste Infractions", "divers\gendarmerie\amendes\initialisation_amende.sqf", [], 5, false, true, "", 
"({side _x == civilian && isPlayer _x} count (player nearEntities ['Man', 8])) >= 1"
];
sleep 0.02;

sleep 0.02;
player addaction ["5) Listes Des Infractions", "divers\gendarmerie\wanted_liste\check_wanted_liste_nouveau.sqf", [1], 5, false, true, "", 
"!isnil {cursorTarget getvariable 'infraction_wanted_liste' select 0}"
];
sleep 0.02;

sleep 0.02;
player addaction ["6) Retirer Points Permis", "divers\gendarmerie\retrait_de_points\initialisation_retrait_de_points.sqf", [], 5, false, true, "", 
"cursorTarget getvariable 'combien_de_point_by_sfp_maxou' > 0"
];
sleep 0.02;

sleep 0.02;
player addaction ["7) Retirer Licence Pilote", "divers\gendarmerie\retrait_licence_a_un_joueur\envoyer_retrait_licence_pilote.sqf", [], 5, false, true, "", 
"!isnil {cursorTarget getvariable 'license_pilote_news'}"
];
sleep 0.02;

sleep 0.02;
player addaction ["8) Retirer Licence Port D'Armes", "divers\gendarmerie\retrait_licence_port_armes\envoyer_retrait_licence_port_d_armes.sqf", [], 5, false, true, "", 
"!isnil {cursorTarget getvariable 'licence_fusils'} or !isnil {cursorTarget getvariable 'permis_port_d_arme'}"
];
sleep 0.02;

sleep 0.02;
player addaction ["<t color=""#ff0000"">" + "------------------------- FIN MENU CIVIL -----------------", "", [], 5, false, true, "", 
"({side _x == civilian && isPlayer _x} count (player nearEntities ['Man', 8])) >= 1"
];
sleep 0.02;

player addaction ["<t color=""#ff0000"">" + "------------------------- MENU GENDARME VEHICULE -----------------", "", [], 5, false, true, "",'(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8']; sleep 0.02;

player addaction ["1) Info Sur Le Véhicule (Raccourci Touche C)", "divers\gendarmerie\recherche_proprio_vehicule.sqf", [], 5, false, true, "",'(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8'];sleep 0.02;

player addaction ["2) Contenu Du Véhicule", "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf", [], 5, false, true, "", '(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8'];sleep 0.02;

player addaction ["3) Supprimer Contenu Véhicule (Farming, Puce, etc)", {[cursorTarget] execVM "divers\gendarmerie\supprimer_chose_inventaire\menu_supprimer_chose_inventaire.sqf"}, [], 5, false, true, "", '(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8'];sleep 0.02;

player addaction ["4) Supprimer Le Vehicule Pointé (Pas d'abus ou BAN !)", "divers\gendarmerie\fourriere.sqf", [], 5, false, true, "", '(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8'];sleep 0.02;

player addaction ["5) Mettre/Enlever Sabot Roue Véhicule", "divers\gendarmerie\mettre_sabot_vehicule.sqf", [], 5, false, true, "", '(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8'];sleep 0.02;

player addaction ["6) Extraire Civil Du Vehicule (Pas d'abus ou BAN !)", "divers\vehiclelock\ejecter_civil_local.sqf", [], 5, false, true, "", '(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8 && count crew cursorTarget > 0'];sleep 0.02;

player addaction ["7) Prendre la vitesse du vehicule (Radar Mobile - Raccourci Touche L)", "divers\radar.sqf", [], 5, false, true, "",'(!isnil {cursortarget getvariable "vehicule_info_parvariable"})'];sleep 0.02;

player addaction ["8) Mettre Une Amende Sur Le Vehicule", "divers\gendarmerie\amendes _sur_un_vehicule\ouvrir_menu_amendes_sur_un_vehicule.sqf", [], 5, false, true, "",'(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8'];sleep 0.02;

player addaction ["<t color=""#ff0000"">" + "------------------------- FIN MENU VEHICULE -----------------", "", [], 5, false, true, "", '(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && cursorTarget distance player < 8'];sleep 0.02;

