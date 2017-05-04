// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};
waitUntil {alive player};
if (revive_mon_side != west) exitwith {};

removeAllActions player;

execvm "divers\gendarmerie\chien_d_attaque\initialisation_chien_d_attaque.sqf";
execVM "divers\addaction_gendarmes.sqf";
execVM "divers\choix_respawn\initialisation_choix_respawn.sqf";

[[[player,"1"],"divers\compilation_fonction_mp\addEventHandler\divers_mp.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

niveau_de_soif = 100;

if (!isnil {player getvariable "besoin_d_un_revive_news"}) then {player setVariable["besoin_d_un_revive_news",nil,true];};
if (!isnil {player getvariable "detection_demande_revive"}) then {player setVariable ["detection_demande_revive",nil,true];};
if (isnil {player getvariable "barredecereale"} or player getvariable "barredecereale" >= 1) then {player setVariable["barredecereale",0,true];};
if (isnil {player getvariable "bouteilledeau"} or player getvariable "bouteilledeau" >= 1) then {player setVariable["bouteilledeau",0,true];};
if (isnil {player getvariable "traceur_vehicule"} or player getvariable "traceur_vehicule" >= 1) then {player setVariable["traceur_vehicule",0,true];};
if (isnil {player getvariable "poignard_item"} or player getvariable "poignard_item" >= 1) then {player setVariable["poignard_item",0,true];};
if (isnil {player getvariable "corde_et_sac"} or player getvariable "corde_et_sac" >= 1) then {player setVariable["corde_et_sac",0,true];};
if (isnil {player getvariable "brouilleur_sacoche_c4"} or player getvariable "brouilleur_sacoche_c4" >= 1) then {player setVariable["brouilleur_sacoche_c4",0,true];};
if (isnil {player getvariable "cocktail_molotov"} or player getvariable "cocktail_molotov" >= 1) then {player setVariable["cocktail_molotov",0,true];};
if (isnil {player getvariable "sacoche_de_c4"} or player getvariable "sacoche_de_c4" >= 1) then {player setVariable["sacoche_de_c4",0,true];};
if (isnil {player getvariable "redbull"} or player getvariable "redbull" >= 1) then {player setVariable["redbull",0,true];};
if (isnil {player getvariable "hache_pour_coupe_de_bois"} or player getvariable "hache_pour_coupe_de_bois" >= 1) then {player setVariable["hache_pour_coupe_de_bois",0,true];};
if (isnil {player getvariable "canne_a_peche"} or player getvariable "canne_a_peche" >= 1) then {player setVariable["canne_a_peche",0,true];};
if (isnil {player getvariable "tente_pour_dormir"} or player getvariable "tente_pour_dormir" >= 1) then {player setVariable["tente_pour_dormir",0,true];};
if (isnil {player getvariable "seau_plante_illegal"} or player getvariable "seau_plante_illegal" >= 1) then {player setVariable["seau_plante_illegal",0,true];};
if (isnil {player getvariable "valise_pour_le_farming"} or player getvariable "valise_pour_le_farming" >= 1) then {player setVariable["valise_pour_le_farming",0,true];};
if (isnil {player getvariable "coffre_fort"} or player getvariable "coffre_fort" >= 1) then {player setVariable["coffre_fort",0,true];};
if (isnil {player getvariable "bidon_d_essence"} or player getvariable "bidon_d_essence" >= 1) then {player setVariable["bidon_d_essence",0,true];};
if (isnil {player getvariable "gants_pour_petrole"} or player getvariable "gants_pour_petrole" >= 1) then {player setVariable["gants_pour_petrole",0,true];};
if (isnil {player getvariable "harpon_pour_la_peche"} or player getvariable "harpon_pour_la_peche" >= 1) then {player setVariable["harpon_pour_la_peche",0,true];};
if (isnil {player getvariable "pied_de_biche"} or player getvariable "pied_de_biche" >= 1) then {player setVariable["pied_de_biche",0,true];};
if (isnil {player getvariable "license_permis_de_conduire_by_sfp_maxou"} or player getvariable "license_permis_de_conduire_by_sfp_maxou" < 1) then {player setVariable["license_permis_de_conduire_by_sfp_maxou",1,true];};
if (isnil {player getvariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou"} or player getvariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou" >= 1) then {player setVariable["license_permis_de_conduire_poids_lourd_by_sfp_maxou",1,true];};
if (isnil {player getvariable "permis_port_d_arme"}) then {player setVariable["permis_port_d_arme",true,true];};
if (!isnil {player getvariable "j_ai_un_antibiotique"}) then {['j_ai_un_antibiotique', false] call uid_sauvegarde_ecrire_local_joueur_sfp; player setvariable["j_ai_un_antibiotique",nil,false];};
if (!isnil {player getvariable "jaibu_by_sfp_maxou"}) then {player setVariable["jaibu_by_sfp_maxou",nil,true];};
if (!isnil {player getvariable "boite_allumette"}) then {player setVariable["boite_allumette",nil,true];};
if (!isnil {player getvariable "corde_descente_rappel_sfp"}) then {player setVariable["corde_descente_rappel_sfp",nil,true];};
if (!isnil {player getvariable "marteau_sfp"}) then {player setVariable["marteau_sfp",nil,true];};
if (isnil {player getvariable "usedspace"} or player getvariable "usedspace" > 0) then {player setVariable["usedspace",0,true];};
player setVariable["toilette_by_sfp_maxou",100,false];
player setVariable["thirstLevel_cafe",0,false];
player setVariable["niveau_de_faim",100,false];
player setVariable["fautdormir",100,false];

player allowdamage true;

player addAction ["Mon Inventaire Personnel", "divers\gendarmerie\copinventory.sqf", ["0"], 4, false, false, "", ""];
player addAction ["Faire PIPI","divers\toilettes\toilette_by_sfp_maxou_faire_pipi.sqf",[],1,true,true,"","player getvariable 'toilette_by_sfp_maxou' < 50"];
player addAction ["Donner Argent", "divers\donner_argent_joueur\initialisation_donner_argent.sqf", [], 7, false, false, "", '!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8'];
player addAction ["<t color=""#ED2744"">" + "Faire Un Paiement Par CB !", "divers\banque\menu_banque.sqf", [], 11, false, false, "", "!isnil {cursortarget getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}"];
player addAction ["<t color=""#ff0000"">" + "Réparer le véhicule",{cutText["","BLACK FADED"]; 0 cutFadeOut 9999999;createDialog "Choix_Menu_Reparation"; disableSerialization; waituntil {!dialog;}; cutText["","BLACK IN"];},[],7,false,false,"","alive cursortarget && cursortarget distance player < 7 && !isnil {cursortarget getVariable 'vehicule_info_parvariable'}"];
player addAction ["Montrer Ma Carte Identite", {if (isnil "j_ai_montrer_ma_carte_identite") then {j_ai_montrer_ma_carte_identite = 0}; if (j_ai_montrer_ma_carte_identite >= 1) exitwith {titletext ["Carte déja affichée ... Attend 10 secondes !","PLAIN"];}; j_ai_montrer_ma_carte_identite = 1; [] spawn {sleep 10; j_ai_montrer_ma_carte_identite = nil;}; titletext ["Carte affichée ...","PLAIN"];[[[player getvariable "ma_carte_identite" select 0, player getvariable "ma_carte_identite" select 1,player getvariable "ma_carte_identite" select 2,player getvariable "ma_carte_identite" select 3,player getvariable "ma_carte_identite" select 4,player getvariable "ma_carte_identite" select 5,player getvariable "ma_date_de_naissance"],"divers\services_publiques\declaration_mairie_et_carte_identite\montrer_carte_identite.sqf"],"BIS_fnc_execVM",cursortarget,false] spawn BIS_fnc_MP}, [], 10, false, false, "", "player getvariable 'ma_carte_identite' select 1 != 'nom' && !isNull cursorTarget && cursorTarget isKindOf 'Man' && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && speed player < 1 && speed cursorTarget < 1"];	
player addAction ["<t color='#0adb00'>Activer/Desactiver Neon Véhicule</t>", activer_desactiver_neon, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_neon') > 0)"];
player addAction ["<t color='#0adb00'>Activer/Desactiver Puce Moteur</t>", activer_desactiver_puce_moteur, [],1, false, false, "", "driver assignedVehicle player == player && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_une_puce') > 0)"];
player addAction ["<t color='#0adb00'>Activer/Desactiver Radar De Recul</t>", activer_desactiver_radar_de_recul, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_radar_de_recul') > 0)"];
player addAction ["<t color='#0adb00'>Activer/Desactiver Detecteur De Radar</t>", activer_desactiver_detecteur_de_radar, [],1, false, false, "", "driver assignedVehicle player == player && (vehicle player) iskindof 'CAR' && alive (vehicle player) && (count ((vehicle player) getvariable 'voiture_possede_un_detecteur_de_radar') > 0)"];
player addAction ["<t color='#ff0000'>Récuperer Le Téléphone Portable</t>", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_recuperation_d_un_telephone.sqf", [],11, false, false, "", "count (nearestObjects [getPosATL player, ['Land_MobilePhone_smart_F'], 2]) >= 1"];
player addAction ["<t color='#ff0000'>Prendre La Récompense (Objet trouvé)</t>", "divers\divers\recompense_objet_trouve.sqf", [],20, false, false, "", "!isnil {((nearestObjects [getPosATL player, ['Land_Maroula_F{'], 3]) select 0) getvariable 'objet_pour_recompense'}"];
