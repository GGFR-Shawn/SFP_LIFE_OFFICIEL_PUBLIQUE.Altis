// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// AddEventHandler
[[[player,"1"],"divers\compilation_fonction_mp\addEventHandler\divers_mp.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

// Amende hors ligne
player setVariable["montant_de_l_amende",0,false];
player setVariable["message_amende","aucun",false];
player setVariable["historique_nombre_amende",0,false];

// Remboursement hors ligne
player setVariable["montant_du_remboursement",0,false];
player setVariable["message_du_remboursement","aucun",false];
player setVariable["historique_nombre_remboursement",0,false];

player setVariable["mon_livret_a",0,false];
player setVariable["evade_de_prison",0,false];
player setVariable["mes_aides_caf", 0,false];
player setVariable["ma_paye_by_sfp_maxou", 0,false];

mon_dernier_vehicule_achete = "";

liste_de_mes_maisons = [];

player setVariable["license_BAC_PRO",0,false];
player setVariable["license_BTS",0,false];
player setVariable["license_BEPC",0,false];
player setVariable["license_BAC_GENERAL",0,false];
player setVariable["license_DEUG",0,false];
player setVariable["license_BEP_Mecanique",0,false];

player setVariable["mon_niveau_secouriste",1,false];

player setVariable["experience_transformation_cocaine",0,false];

player setVariable["niveau_de_faim",100,false];
player setVariable["toilette_by_sfp_maxou",100,false];
player setVariable["thirstLevel_cafe",0,false];
player setVariable["fautdormir",100,false];
player setVariable["temps_fatigue_niveau_1",1,false];
player setVariable["temps_fatigue_niveau_2",0,false];
player setVariable["temps_fatigue_niveau_3",0,false];
player setVariable["temps_fatigue_niveau_4",0,false];
player setVariable["temps_fatigue_niveau_5",0,false];
player setVariable["niveau_force",0,false];

player setVariable["ma_mutuelle_niveau_10_pour_cent",0,false];
player setVariable["ma_mutuelle_niveau_vingt_cinq_pour_cent",0,false];
player setVariable["ma_mutuelle_niveau_cinquante_pour_cent",0,false];
player setVariable["ma_mutuelle_niveau_soixante_quinze_pour_cent",0,false];
player setVariable["ma_mutuelle_niveau_cent_pour_cent",0,false];

execVM "divers\gendarmerie\taser\initialisation_taser_flashball_et_lacrymogene.sqf";

if (revive_mon_side == west) then
{	
	player setVariable["ma_paye_by_sfp_maxou", 1500,false];
	
	execVM "divers\addaction_gendarmes.sqf";
};

relire_toute_ma_sauvegarde = "non";
dernier_speudo_utiliser_news = name player;

historique_messages_nom_joueur_by_maxou = [["Aucun message reçu","Aucun message reçu"]];

niveau_de_soif = 100;

player setVariable["thirstLevel_cafe",0,false];
player setVariable["niveau_de_faim",100,false];
player setVariable["toilette_by_sfp_maxou",100,false];

waitUntil { alive player };

// ---- Divers ----

player addAction ["Deverouiller / Verrouiller (Raccourci touche Inférieur/Supérieur)","divers\vehiclelock\unlocklock.sqf","",1,true,true,"","player distance cursorTarget < 10 && (((cursortarget getvariable 'vehicule_info_parvariable') select 0) != 'Altis location\nVéhicule de location\n Véhicule SANS PERMIS') && !isnil {cursortarget getvariable 'vehicule_info_parvariable'}"];
player addAction ["Holster",{(_this select 1) action ["SwitchWeapon",(_this select 1),(_this select 1),100];},true,1,false,false,"","(!(currentWeapon _target == '') && (count weapons player > 0))"];

if (revive_mon_side == civilian) then
{
	if (sfp_config_activer_toilette) then {player addAction ["Faire PIPI","divers\toilettes\toilette_by_sfp_maxou_faire_pipi.sqf",[],1,true,true,"","player getvariable 'toilette_by_sfp_maxou' < 50"];};
	player addAction ["<t color=""#ff0000"">" + "Menu Inventaire Vehicule","divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf","",1,true,true,"","(cursorTarget isKindOf 'LandVehicle' or cursorTarget isKindOf 'Air' or cursorTarget isKindOf 'Ship' or typeof cursorTarget == 'chalutier_SFP') && (revive_mon_side == civilian) && player distance cursorTarget < 12"];
	player addAction ["Montrer Ma Carte Identite", {if (isnil "j_ai_montrer_ma_carte_identite") then {j_ai_montrer_ma_carte_identite = 0}; if (j_ai_montrer_ma_carte_identite >= 1) exitwith {titletext ["Carte déja affichée ... Attend 10 secondes !","PLAIN"];}; j_ai_montrer_ma_carte_identite = 1; [] spawn {sleep 10; j_ai_montrer_ma_carte_identite = nil;}; titletext ["Carte affichée ...","PLAIN"];[[[player getvariable "ma_carte_identite" select 0, player getvariable "ma_carte_identite" select 1,player getvariable "ma_carte_identite" select 2,player getvariable "ma_carte_identite" select 3,player getvariable "ma_carte_identite" select 4,player getvariable "ma_carte_identite" select 5,player getvariable "ma_date_de_naissance"],"divers\services_publiques\declaration_mairie_et_carte_identite\montrer_carte_identite.sqf"],"BIS_fnc_execVM",cursortarget,false] spawn BIS_fnc_MP}, [], 10, false, false, "", "player getvariable 'ma_carte_identite' select 1 != 'nom' && !isNull cursorTarget && cursorTarget isKindOf 'Man' && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && speed player < 1 && speed cursorTarget < 1"];	
	player addAction ["Mon Inventaire Personnel", "divers\inventory.sqf", ["0"], 4, false, false, "", ""];
	player addAction ["Vendre Du Matos", "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf", [], 4, false, false, "", '(isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 8'];
	player addAction ["Donner Argent", "divers\donner_argent_joueur\initialisation_donner_argent.sqf", [], 7, false, false, "", '!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 8'];
	player addAction ["<t color=""#ED2744"">" + "Faire Un Paiement Par CB !", "divers\banque\menu_banque.sqf", [], 11, false, false, "", "!isnil {cursortarget getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Neon Véhicule</t>", activer_desactiver_neon, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_neon') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Puce Moteur</t>", activer_desactiver_puce_moteur, [],1, false, false, "", "driver assignedVehicle player == player && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_une_puce') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Radar De Recul</t>", activer_desactiver_radar_de_recul, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_radar_de_recul') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Detecteur De Radar</t>", activer_desactiver_detecteur_de_radar, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_detecteur_de_radar') > 0)"];
	player addAction ["<t color='#ff0000'>Récuperer Le Téléphone Portable</t>", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_recuperation_d_un_telephone.sqf", [],11, false, false, "", "count (nearestObjects [getPosATL player, ['Land_MobilePhone_smart_F'], 3]) >= 1"];
	player addAction ["<t color='#ff0000'>Arracher/Remettre Plaque Immatriculation</t>", "divers\divers\arracher_remettre_plaque_immatriculation.sqf", [],1, false, false, "", "player distance cursorTarget < 6 && alive cursorTarget && cursorTarget getvariable 'vehicule_info_parvariable' select 0 == name player"];
	player addAction ["<t color='#ff0000'>Detruire Le Radar</t>", "divers\radar\radar_detruire_reparer.sqf", [0],11, false, false, "", "count (nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) >= 1 && isnil {((nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) select 0) getvariable 'radar_sfp_desactive'}"];
	player addAction ["<t color='#ff0000'>Prendre Son Argent</t>", "divers\divers\braquer_argent_joueur.sqf", [],20, false, false, "", "player distance cursorTarget < 3 && alive cursorTarget && !isnil {cursorTarget getvariable 'jai_les_mains_sur_la_tete'} && !isnil {cursorTarget getvariable 'je_me_suis_prit_un_coup_de_poing'}"];
	player addAction ["<t color='#ff0000'>Prendre La Récompense (Objet trouvé)</t>", "divers\divers\recompense_objet_trouve.sqf", [],20, false, false, "", "!isnil {((nearestObjects [getPosATL player, ['Land_Maroula_F'], 3]) select 0) getvariable 'objet_pour_recompense'}"];
	
	player addAction ["<t color='#ff0000'>Ramasser Lapin</t>","divers\farming\ramasser_lapin.sqf",[],7,true,true,"","count (nearestObjects [getPosATL player, ['Rabbit_F'], 3]) >= 1"];
	player addAction ["<t color='#ff0000'>Tuer Serpent</t>","divers\farming\ramasser_serpent.sqf",[],7,true,true,"","count (nearestObjects [getPosATL player, ['Snake_random_F'], 3]) >= 1"];
};

if (revive_mon_side == west) then
{
	player addAction ["Montrer Ma Carte Identite", {if (isnil "j_ai_montrer_ma_carte_identite") then {j_ai_montrer_ma_carte_identite = 0}; if (j_ai_montrer_ma_carte_identite >= 1) exitwith {titletext ["Carte déja affichée ... Attend 10 secondes !","PLAIN"];}; j_ai_montrer_ma_carte_identite = 1; [] spawn {sleep 10; j_ai_montrer_ma_carte_identite = nil;}; titletext ["Carte affichée ...","PLAIN"];[[[player getvariable "ma_carte_identite" select 0, player getvariable "ma_carte_identite" select 1,player getvariable "ma_carte_identite" select 2,player getvariable "ma_carte_identite" select 3,player getvariable "ma_carte_identite" select 4,player getvariable "ma_carte_identite" select 5,player getvariable "ma_date_de_naissance"],"divers\services_publiques\declaration_mairie_et_carte_identite\montrer_carte_identite.sqf"],"BIS_fnc_execVM",cursortarget,false] spawn BIS_fnc_MP}, [], 10, false, false, "", "player getvariable 'ma_carte_identite' select 1 != 'nom' && !isNull cursorTarget && cursorTarget isKindOf 'Man' && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && speed player < 1 && speed cursorTarget < 1"];	
	player addAction ["Mon Inventaire Personnel", "divers\gendarmerie\copinventory.sqf", ["0"], 4, false, false, "", ""];
	player addAction ["Faire PIPI","divers\toilettes\toilette_by_sfp_maxou_faire_pipi.sqf",[],1,true,true,"","player getvariable 'toilette_by_sfp_maxou' < 50"];
	player addAction ["Donner Argent", "divers\donner_argent_joueur\initialisation_donner_argent.sqf", [], 7, false, false, "", '!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8'];
	player addAction ["<t color=""#ED2744"">" + "Faire Un Paiement Par CB !", "divers\banque\menu_banque.sqf", [], 11, false, false, "", "!isnil {cursortarget getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Neon Véhicule</t>", activer_desactiver_neon, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_neon') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Puce Moteur</t>", activer_desactiver_puce_moteur, [],1, false, false, "", "driver assignedVehicle player == player && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_une_puce') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Radar De Recul</t>", activer_desactiver_radar_de_recul, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_radar_de_recul') > 0)"];
	player addAction ["<t color='#0adb00'>Activer/Desactiver Detecteur De Radar</t>", activer_desactiver_detecteur_de_radar, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_detecteur_de_radar') > 0)"];
	player addAction ["<t color='#ff0000'>Récuperer Le Téléphone Portable</t>", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_recuperation_d_un_telephone.sqf", [],11, false, false, "", "count (nearestObjects [getPosATL player, ['Land_MobilePhone_smart_F'], 2]) >= 1"];
	player addAction ["<t color='#ff0000'>Prendre La Récompense (Objet trouvé)</t>", "divers\divers\recompense_objet_trouve.sqf", [],20, false, false, "", "!isnil {((nearestObjects [getPosATL player, ['Land_Maroula_F'], 3]) select 0) getvariable 'objet_pour_recompense'}"];
	
	execvm "divers\gendarmerie\chien_d_attaque\initialisation_chien_d_attaque.sqf";
};

player addAction ["<t color=""#ff0000"">" + "Réparer le véhicule",{cutText["","BLACK FADED"]; 0 cutFadeOut 9999999;createDialog "Choix_Menu_Reparation"; disableSerialization; waituntil {!dialog;}; cutText["","BLACK IN"];},[],7,false,false,"","alive cursortarget && cursortarget distance player < 7 && !isnil {cursortarget getVariable 'vehicule_info_parvariable'}"];
