waituntil {!isnil "fin_verification_apres_chargement_pour_revive"};
waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {alive player};
if (revive_mon_side != west) exitwith {};

removeAllActions player;

execvm "divers\gendarmerie\chien_d_attaque\initialisation_chien_d_attaque.sqf";
execVM "divers\addaction_gendarmes.sqf";

player allowdamage true;

if (sfp_config_activer_toilette) then {player addAction ["Faire PIPI","divers\toilettes\toilette_by_sfp_maxou_faire_pipi.sqf",[],1,true,true,"","player getvariable 'toilette_by_sfp_maxou' < 50"];};
player addAction ["Mon Inventaire Personnel", "divers\gendarmerie\copinventory.sqf", ["0"], 4, false, false, "", ""];
player addAction ["Donner Argent", "divers\donner_argent_joueur\initialisation_donner_argent.sqf", [], 7, false, false, "", '!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8'];
player addAction ["<t color=""#ED2744"">" + "Faire Un Paiement Par CB !", "divers\banque\menu_banque.sqf", [], 11, false, false, "", "!isnil {cursortarget getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}"];
player addAction ["<t color=""#ff0000"">" + "Réparer le véhicule",{cutText["","BLACK FADED"]; 0 cutFadeOut 9999999;createDialog "Choix_Menu_Reparation"; disableSerialization; waituntil {!dialog;}; cutText["","BLACK IN"];},[],7,false,false,"","alive cursortarget && cursortarget distance player < 7 && !isnil {cursortarget getVariable 'vehicule_info_parvariable'}"];
player addAction ["Montrer Ma Carte Identite", {if (isnil "j_ai_montrer_ma_carte_identite") then {j_ai_montrer_ma_carte_identite = 0}; if (j_ai_montrer_ma_carte_identite >= 1) exitwith {titletext ["Carte déja affichée ... Attend 10 secondes !","PLAIN"];}; j_ai_montrer_ma_carte_identite = 1; [] spawn {sleep 10; j_ai_montrer_ma_carte_identite = nil;}; titletext ["Carte affichée ...","PLAIN"];[[[player getvariable "ma_carte_identite" select 0, player getvariable "ma_carte_identite" select 1,player getvariable "ma_carte_identite" select 2,player getvariable "ma_carte_identite" select 3,player getvariable "ma_carte_identite" select 4,player getvariable "ma_carte_identite" select 5,player getvariable "ma_date_de_naissance"],"divers\services_publiques\declaration_mairie_et_carte_identite\montrer_carte_identite.sqf"],"BIS_fnc_execVM",cursortarget,false] spawn BIS_fnc_MP}, [], 10, false, false, "", "player getvariable 'ma_carte_identite' select 1 != 'nom' && !isNull cursorTarget && cursorTarget isKindOf 'Man' && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && speed player < 1 && speed cursorTarget < 1"];	
player addAction ["<t color='#0adb00'>Activer/Desactiver Neon Véhicule</t>", activer_desactiver_neon, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_neon') > 0)"];
player addAction ["<t color='#0adb00'>Activer/Desactiver Puce Moteur</t>", activer_desactiver_puce_moteur, [],1, false, false, "", "driver assignedVehicle player == player && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_une_puce') > 0)"];
player addAction ["<t color='#0adb00'>Activer/Desactiver Radar De Recul</t>", activer_desactiver_radar_de_recul, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_radar_de_recul') > 0)"];
player addAction ["<t color='#0adb00'>Activer/Desactiver Detecteur De Radar</t>", activer_desactiver_detecteur_de_radar, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_detecteur_de_radar') > 0)"];
player addAction ["<t color='#ff0000'>Récuperer Le Téléphone Portable</t>", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_recuperation_d_un_telephone.sqf", [],11, false, false, "", "count (nearestObjects [getPosATL player, ['Land_MobilePhone_smart_F'], 2]) >= 1"];
player addAction ["<t color='#ff0000'>Prendre La Récompense (Objet trouvé)</t>", "divers\divers\recompense_objet_trouve.sqf", [],20, false, false, "", "!isnil {((nearestObjects [getPosATL player, ['Land_Maroula_F'], 3]) select 0) getvariable 'objet_pour_recompense'}"];
