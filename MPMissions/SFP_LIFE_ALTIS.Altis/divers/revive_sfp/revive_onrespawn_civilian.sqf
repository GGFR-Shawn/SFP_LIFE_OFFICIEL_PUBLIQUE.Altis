waituntil {!isnil "fin_verification_apres_chargement_pour_revive"};
waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {alive player};

player setCustomAimCoef sfp_config_vitesse_stabilite_du_viseur;
player setAnimSpeedCoef sfp_config_vitesse_du_personnage; // vitesse deplacement du personnage
player enableStamina true;

if (revive_mon_side != civilian) then
{
	removeAllActions player;
	removeAllweapons player;
	removevest player;
	removeheadgear player;
	removegoggles player;
	removeBackPack player;
	removeAllAssignedItems player;

	disableUserInput false;

	player setVariable ["mes_blessures_revive_sfp", [0,0,0,0,0,0,0,0,0,0,0],true];
	if (!isnil {player getvariable "besoin_d_un_revive_news"}) then {player setVariable["besoin_d_un_revive_news",nil,true];};
	if (!isnil {player getvariable "detection_demande_revive"}) then {player setVariable ["detection_demande_revive",nil,true];};
	if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {player setVariable["jai_un_sac_sur_la_tete",nil,true];};
	if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {player setVariable["jai_fait_un_cambriolage_news",nil,true];};
	if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable["recherche_pour_armes_illegales",nil,true];};
	if (!isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",nil,true];};
	if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable["recherche_pour_conduite_sans_permis",nil,true];};
	if (!isnil {player getvariable "jaibu_by_sfp_maxou"}) then {player setVariable["jaibu_by_sfp_maxou",nil,true];};
	if (isnil {player getvariable "barredecereale"} or player getvariable "barredecereale" > 0) then {player setVariable["barredecereale",0,true];};
	if (isnil {player getvariable "bouteilledeau"} or player getvariable "bouteilledeau" > 0) then {player setVariable["bouteilledeau",0,true];};
	if (isnil {player getvariable "traceur_vehicule"} or player getvariable "traceur_vehicule" > 0) then {player setVariable["traceur_vehicule",0,true];};
	if (isnil {player getvariable "poignard_item"} or player getvariable "poignard_item" > 0) then {player setVariable["poignard_item",0,true];};
	if (isnil {player getvariable "corde_et_sac"} or player getvariable "corde_et_sac" > 0) then {player setVariable["corde_et_sac",0,true];};
	if (isnil {player getvariable "sacoche_de_c4"} or player getvariable "sacoche_de_c4" > 0) then {player setVariable["sacoche_de_c4",0,true];};
	if (isnil {player getvariable "cocktail_molotov"} or player getvariable "cocktail_molotov" > 0) then {player setVariable["cocktail_molotov",0,true];};
	if (isnil {player getvariable "brouilleur_sacoche_c4"} or player getvariable "brouilleur_sacoche_c4" > 0) then {player setVariable["brouilleur_sacoche_c4",0,true];};
	if (isnil {player getvariable "redbull"} or player getvariable "redbull" > 0) then {player setVariable["redbull",0,true];};
	if (isnil {player getvariable "hache_pour_coupe_de_bois"} or player getvariable "hache_pour_coupe_de_bois" > 0) then {player setVariable["hache_pour_coupe_de_bois",0,true];};
	if (isnil {player getvariable "coffre_fort"} or player getvariable "coffre_fort" > 0) then {player setVariable["coffre_fort",0,true];};
	if (isnil {player getvariable "tente_pour_dormir"} or player getvariable "tente_pour_dormir" > 0) then {player setVariable["tente_pour_dormir",0,true];};
	if (isnil {player getvariable "seau_plante_illegal"} or player getvariable "seau_plante_illegal" > 0) then {player setVariable["seau_plante_illegal",0,true];};
	if (isnil {player getvariable "valise_pour_le_farming"} or player getvariable "valise_pour_le_farming" > 0) then {player setVariable["valise_pour_le_farming",0,true];};
	if (isnil {player getvariable "bidon_d_essence"} or player getvariable "bidon_d_essence" > 0) then {player setVariable["bidon_d_essence",0,true];};
	if (isnil {player getvariable "canne_a_peche"} or player getvariable "canne_a_peche" > 0) then {player setVariable["canne_a_peche",0,true];};
	if (isnil {player getvariable "gants_pour_petrole"} or player getvariable "gants_pour_petrole" > 0) then {player setVariable["gants_pour_petrole",0,true];};
	if (isnil {player getvariable "harpon_pour_la_peche"} or player getvariable "harpon_pour_la_peche" > 0) then {player setVariable["harpon_pour_la_peche",0,true];};
	if (!isnil {player getvariable "bombe_porte_prison"}) then {player setVariable["bombe_porte_prison",nil,true];};
	if (!isnil {player getvariable "boite_allumette"}) then {player setVariable["boite_allumette",nil,true];};
	if (!isnil {player getvariable "corde_descente_rappel_sfp"}) then {player setVariable["corde_descente_rappel_sfp",nil,true];};
	if (!isnil {player getvariable "marteau_sfp"}) then {player setVariable["marteau_sfp",nil,true];};
	if (isnil {player getvariable "pied_de_biche"} or player getvariable "pied_de_biche" > 0) then {player setVariable["pied_de_biche",0,true];};
	if (isnil {player getvariable "usedspace"} or player getvariable "usedspace" > 0) then {player setVariable["usedspace",0,true];};
	if (!isnil {player getvariable "j_ai_un_antibiotique"}) then {['j_ai_un_antibiotique', false] call uid_sauvegarde_ecrire_local_joueur_sfp; player setVariable["j_ai_un_antibiotique",nil,false];};
	if (isnil {player getvariable "mon_argent_poche_by_sfp_maxou"} or player getvariable "mon_argent_poche_by_sfp_maxou" > 0) then {player setVariable["mon_argent_poche_by_sfp_maxou",0,true]; autorisation_mouvement_argent = true;};

	if (isnil {player getvariable "item_baleine_sfp"} or player getvariable "item_baleine_sfp" > 0) then {player setVariable["item_baleine_sfp",0,true];};
	if (isnil {player getvariable "item_requin_sfp"} or player getvariable "item_requin_sfp" > 0) then {player setVariable["item_requin_sfp",0,true];};
	if (isnil {player getvariable "item_plante_illegale_prete_a_vendre_sfp"} or player getvariable "item_plante_illegale_prete_a_vendre_sfp" > 0) then {player setVariable["item_plante_illegale_prete_a_vendre_sfp",0,true];};
	if (isnil {player getvariable "item_cocaine_feuille_coca_sfp"} or player getvariable "item_cocaine_feuille_coca_sfp" > 0) then {player setVariable["item_cocaine_feuille_coca_sfp",0,true];};
	if (isnil {player getvariable "item_cocaine_poudre_sfp"} or player getvariable "item_cocaine_poudre_sfp" > 0) then {player setVariable["item_cocaine_poudre_sfp",0,true];};
	if (isnil {player getvariable "item_cannabis_non_traite_sfp"} or player getvariable "item_cannabis_non_traite_sfp" > 0) then {player setVariable["item_cannabis_non_traite_sfp",0,true];};
	if (isnil {player getvariable "item_medicaments_sfp"} or player getvariable "item_medicaments_sfp" > 0) then {player setVariable["item_medicaments_sfp",0,true];};
	if (isnil {player getvariable "item_organes_animaux_sfp"} or player getvariable "item_organes_animaux_sfp" > 0) then {player setVariable["item_organes_animaux_sfp",0,true];};
	if (isnil {player getvariable "item_pomme_sfp"} or player getvariable "item_pomme_sfp" > 0) then {player setVariable["item_pomme_sfp",0,true];};
	if (isnil {player getvariable "item_sel_sfp"} or player getvariable "item_sel_sfp" > 0) then {player setVariable["item_sel_sfp",0,true];};
	if (isnil {player getvariable "item_pomme_de_terre_sfp"} or player getvariable "item_pomme_de_terre_sfp" > 0) then {player setVariable["item_pomme_de_terre_sfp",0,true];};
	if (isnil {player getvariable "item_or_transforme_sfp"} or player getvariable "item_or_transforme_sfp" > 0) then {player setVariable["item_or_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_or_non_transforme_sfp"} or player getvariable "item_or_non_transforme_sfp" > 0) then {player setVariable["item_or_non_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_heroine_non_traite_sfp"} or player getvariable "item_heroine_non_traite_sfp" > 0) then {player setVariable["item_heroine_non_traite_sfp",0,true];};
	if (isnil {player getvariable "item_cuivre_non_transforme_sfp"} or player getvariable "item_cuivre_non_transforme_sfp" > 0) then {player setVariable["item_cuivre_non_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_cuivre_transforme_sfp"} or player getvariable "item_cuivre_transforme_sfp" > 0) then {player setVariable["item_cuivre_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_heroine_traite_sfp"} or player getvariable "item_heroine_traite_sfp" > 0) then {player setVariable["item_heroine_traite_sfp",0,true];};
	if (isnil {player getvariable "item_plante_pour_planter"} or player getvariable "item_plante_pour_planter" > 0) then {player setVariable["item_plante_pour_planter",0,true];};
	if (isnil {player getvariable "item_plante_fertilisant_rouge"} or player getvariable "item_plante_fertilisant_rouge" > 0) then {player setVariable["item_plante_fertilisant_rouge",0,true];};
	if (isnil {player getvariable "item_cannabis_traite_sfp"} or player getvariable "item_cannabis_traite_sfp" > 0) then {player setVariable["item_cannabis_traite_sfp",0,true];};
	if (isnil {player getvariable "item_poissons_sfp"} or player getvariable "item_poissons_sfp" > 0) then {player setVariable["item_poissons_sfp",0,true];};
	if (isnil {player getvariable "itemfishpoissonspanes"} or player getvariable "itemfishpoissonspanes" > 0) then {player setVariable["itemfishpoissonspanes",0,true];};
	if (isnil {player getvariable "item_petrole_non_traite_sfp"} or player getvariable "item_petrole_non_traite_sfp" > 0) then {player setVariable["item_petrole_non_traite_sfp",0,true];};
	if (isnil {player getvariable "item_petrole_traite_sfp"} or player getvariable "item_petrole_traite_sfp" > 0) then {player setVariable["item_petrole_traite_sfp",0,true];};
	if (isnil {player getvariable "item_bois_sfp"} or player getvariable "item_bois_sfp" > 0) then {player setVariable["item_bois_sfp",0,true];};
	if (isnil {player getvariable "gelule_amphetamines"} or player getvariable "gelule_amphetamines" > 0) then {player setVariable["gelule_amphetamines",0,true];};

	if (!isnil {player getvariable "je_collecte"}) then {player setVariable["je_collecte",nil,true];};

	niveau_de_soif = 100;
	player setVariable["toilette_by_sfp_maxou",100,false];
	player setVariable["thirstLevel_cafe",0,false];
	player setVariable["niveau_de_faim",100,false];
	player setVariable["fautdormir",100,false];

	jepeuxramasserdechets = 1;
	jepeuxchoisiruntravail = 0;
	resetCamShake;
	player allowdamage true;
	player setdamage 0;

	player addWeapon "ItemMap";
	player addWeapon "ItemCompass";
	player addWeapon "ItemWatch";

	execVM "divers\choix_respawn\initialisation_choix_respawn.sqf";
	execvm "divers\gendarmerie\prison\remettreenprisonsitriche.sqf";

	[[[player,"1"],"divers\compilation_fonction_mp\addEventHandler\divers_mp.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	disableUserInput false;

	if (sfp_config_activer_toilette) then {player addAction ["Faire PIPI","divers\toilettes\toilette_by_sfp_maxou_faire_pipi.sqf",[],1,true,true,"","player getvariable 'toilette_by_sfp_maxou' < 50"];};
	player addAction ["Montrer Ma Carte Identite", {if (isnil "j_ai_montrer_ma_carte_identite") then {j_ai_montrer_ma_carte_identite = 0}; if (j_ai_montrer_ma_carte_identite >= 1) exitwith {titletext ["Carte déja affichée ... Attend 10 secondes !","PLAIN"];}; j_ai_montrer_ma_carte_identite = 1; [] spawn {sleep 10; j_ai_montrer_ma_carte_identite = nil;}; titletext ["Carte affichée ...","PLAIN"];[[[player getvariable "ma_carte_identite" select 0, player getvariable "ma_carte_identite" select 1,player getvariable "ma_carte_identite" select 2,player getvariable "ma_carte_identite" select 3,player getvariable "ma_carte_identite" select 4,player getvariable "ma_carte_identite" select 5,player getvariable "ma_date_de_naissance"],"divers\services_publiques\declaration_mairie_et_carte_identite\montrer_carte_identite.sqf"],"BIS_fnc_execVM",cursortarget,false] spawn BIS_fnc_MP}, [], 10, false, false, "", "player getvariable 'ma_carte_identite' select 1 != 'nom' && !isNull cursorTarget && cursorTarget isKindOf 'Man' && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && speed player < 1 && speed cursorTarget < 1"];	
	player addAction ["Mon Inventaire Personnel", "divers\inventory.sqf", ["0"], 4, false, false, "", ""];
	player addAction ["Vendre Du Matos", "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf", [], 4, false, false, "", '(isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 8'];
	player addAction ["Donner Argent", "divers\donner_argent_joueur\initialisation_donner_argent.sqf", [], 7, false, false, "", '!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 8'];
	player addAction ["<t color=""#ff0000"">" + "Réparer le véhicule",{cutText["","BLACK FADED"]; 0 cutFadeOut 9999999;createDialog "Choix_Menu_Reparation"; disableSerialization; waituntil {!dialog;}; cutText["","BLACK IN"];},[],7,false,false,"","alive cursortarget && cursortarget distance player < 7 && !isnil {cursortarget getVariable 'vehicule_info_parvariable'}"];
	player addAction ["<t color=""#ED2744"">" + "Faire Un Paiement Par CB !", "divers\banque\menu_banque.sqf", [], 11, false, false, "", "!isnil {cursortarget getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Neon Véhicule</t>", activer_desactiver_neon, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_neon') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Puce Moteur</t>", activer_desactiver_puce_moteur, [],1, false, false, "", "driver assignedVehicle player == player && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_une_puce') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Radar De Recul</t>", activer_desactiver_radar_de_recul, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_radar_de_recul') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Detecteur De Radar</t>", activer_desactiver_detecteur_de_radar, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_detecteur_de_radar') > 0)"];
	player addAction ["<t color='#ff0000'>Récuperer Le Téléphone Portable</t>", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_recuperation_d_un_telephone.sqf", [],11, false, false, "", "count (nearestObjects [getPosATL player, ['Land_MobilePhone_smart_F'], 2]) >= 1"];
	player addAction ["<t color='#ff0000'>Arracher/Remettre Plaque Immatriculation</t>", "divers\divers\arracher_remettre_plaque_immatriculation.sqf", [],1, false, false, "", "player distance cursorTarget < 6 && alive cursorTarget && cursorTarget getvariable 'vehicule_info_parvariable' select 0 == name player"];
	player addAction ["<t color='#ff0000'>Detruire Le Radar</t>", "divers\radar\radar_detruire_reparer.sqf", [0],11, false, false, "", "count (nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) >= 1 && isnil {((nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) select 0) getvariable 'radar_sfp_desactive'}"];
	player addAction ["<t color='#ff0000'>Prendre Son Argent</t>", "divers\divers\braquer_argent_joueur.sqf", [],20, false, false, "", "player distance cursorTarget < 3 && alive cursorTarget && !isnil {cursorTarget getvariable 'jai_les_mains_sur_la_tete'} && !isnil {cursorTarget getvariable 'je_me_suis_prit_un_coup_de_poing'}"];
	player addAction ["<t color='#ff0000'>Prendre La Récompense (Objet trouvé)</t>", "divers\divers\recompense_objet_trouve.sqf", [],20, false, false, "", "!isnil {((nearestObjects [getPosATL player, ['Land_Maroula_F'], 3]) select 0) getvariable 'objet_pour_recompense'}"];
	player addAction ["<t color='#ff0000'>Ramasser Lapin</t>","divers\farming\ramasser_lapin.sqf",[],7,true,true,"","count (nearestObjects [getPosATL player, ['Rabbit_F'], 3]) >= 1"];
	player addAction ["<t color='#ff0000'>Tuer Serpent</t>","divers\farming\ramasser_serpent.sqf",[],7,true,true,"","count (nearestObjects [getPosATL player, ['Snake_random_F'], 3]) >= 1"];

	// ---- Divers ----

	player addAction ["Deverouiller / Verrouiller (Raccourci touche Inférieur/Supérieur)","divers\vehiclelock\unlocklock.sqf","",1,true,true,"","player distance cursorTarget < 10 && (((cursortarget getvariable 'vehicule_info_parvariable') select 0) != 'Altis location\nVéhicule de location\n Véhicule SANS PERMIS') && !isnil {cursortarget getvariable 'vehicule_info_parvariable'}"];
	player addAction ["<t color=""#ff0000"">" + "Menu Inventaire Vehicule","divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf","",1,true,true,"","(cursorTarget isKindOf 'LandVehicle' or cursorTarget isKindOf 'Air' or cursorTarget isKindOf 'Ship' or typeof cursorTarget == 'chalutier_SFP') && (revive_mon_side == civilian) && player distance cursorTarget < 12"];
};