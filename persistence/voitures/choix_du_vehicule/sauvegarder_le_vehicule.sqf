// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

waitUntil {alive player};
waitUntil {!isNil "serverID"};
waitUntil {!isnil "fin_verification_apres_chargement"};
waitUntil {!isnil "fn_SaveToServer"};


// =====================================================================================================================================================================================================================
																				  // SECURITE //
// =====================================================================================================================================================================================================================
if (vehicle player != player) exitwith {hint "Descend de ton véhicule pour lancer une sauvegarde !";};
if (!isnil "operation_sur_la_sauvegarde") exitwith {hint "Patiente, une opération est déja en cours sur la sauvegarde !";};
if (isnil "listes_sauvegarde_de_mes_vehicules") exitwith {hint "Erreur sur l'enregistrement de vos véhicules !"; execvm "persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf";};
if (count sauvegarde_vehicules_ordre_de_rangement >= 20) exitwith {hint format ["Opération impossible ! \n\n Votre sauvegarde contient %1 véhicules sur un total max de 20 véhicules ... Vendez en !" count sauvegarde_vehicules_nombre_de_vehicules_total];};

titleText ["Attention, depuis le 29/11/2015 le farming illégal des véhicules n'est plus sauvegardé !","BLACK IN", 9]; 

// =====================================================================================================================================================================================================================
																				// INITIALISATION //
// =====================================================================================================================================================================================================================
hint "! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Initialisation et detection de votre véhicule dans la sauvegarde coté serveur ... \n\n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

operation_sur_la_sauvegarde = true;

_temps_attente = time + 5; // 5 Secondes
while {(!isnil "la_voiture_a_sauvegarder" or !isnil "type_nom_vehicule" or !isnil "voiture_selectionne" or !isnil "voiture_selectionne_texte") && time < _temps_attente} do
{
	la_voiture_a_sauvegarder = nil; 
	type_nom_vehicule = nil; 
	voiture_selectionne = nil; 
	voiture_selectionne_texte = nil; 
	sleep 0.001;
};
if (time > _temps_attente) exitwith {hint "Erreur (1), recommence ...";};

if (isnil "sauvegarde_vehicules_ordre_de_rangement") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ...";};
if (isnil "sauvegarde_vehicules_nombre_de_vehicules_total") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ...";};

// =====================================================================================================================================================================================================================
																						// DETECTION DES VEHICULES //
// =====================================================================================================================================================================================================================
voiture_selectionne = lbCurSel ((uiNamespace getVariable "Menu_tablette_sfp_Choix_Vehicule_A_Sauvegarder") displayCtrl 1500);
voiture_selectionne_texte = lbText [1500, voiture_selectionne];
{
	if (_x == (listes_sauvegarde_de_mes_vehicules select voiture_selectionne)) then
	{
		la_voiture_a_sauvegarder = _x;
	};
} foreach vehicles;

if (isnil "la_voiture_a_sauvegarder") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ..."; execvm "persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf";};
if (count crew la_voiture_a_sauvegarder >= 1) exitwith {operation_sur_la_sauvegarde = nil; hint "Opération impossible, un joueur est dans le véhicule ..."; sleep 3; execvm "persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf";};
if (!isnil {la_voiture_a_sauvegarder getvariable "sabot_roue_vehicule"}) exitwith {operation_sur_la_sauvegarde = nil; hint "Opération impossible, le véhicule à un sabot ..."; sleep 3; execvm "persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf";};
if (!isnil {la_voiture_a_sauvegarder getvariable "amende_vehicule"}) exitwith {operation_sur_la_sauvegarde = nil; hint "Opération impossible, le véhicule à une amende ... Rends toi dans le véhicule pour la payer."; sleep 3; execvm "persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf";};

// =====================================================================================================================================================================================================================
																							// HISTORIQUE SAV //
// =====================================================================================================================================================================================================================
_nom_du_fichier_de_sauvegarde = format ["%1_%2_Historique_des_sauvegardes",getplayeruid player, revive_mon_side];
_heure_de_la_sauvegarde = format ["%1: %2/%3/%4 à %5H%6Min (ARMA :%7): ", name player, heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
[_nom_du_fichier_de_sauvegarde, "Historique chargement et sauvegarde", _heure_de_la_sauvegarde, "Début de la sauvegarde des véhicules !"] call fn_SaveToServer;

// =====================================================================================================================================================================================================================
																							// DEMARRAGE SAV //
// =====================================================================================================================================================================================================================
hint "! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n La sauvegarde de votre véhicule débute ... \n\n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

closedialog 0;

_listes_non_sauvegardable = ["C_Van_01_fuel_F","C_Kart_01_F"];

[[[la_voiture_a_sauvegarder],"persistence\voitures\glitch_inventaire_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

if (!isnil {la_voiture_a_sauvegarder getvariable "vehicule_info_parvariable"}) then
{
	if (getdammage la_voiture_a_sauvegarder < 1) then
	{
		if (la_voiture_a_sauvegarder getvariable "vehicule_info_parvariable" select 0 == name player) then
		{
			type_nom_vehicule = getText (configFile >> "CfgVehicles" >> typeOf(la_voiture_a_sauvegarder) >> "displayName");
			
			if !(typeOf la_voiture_a_sauvegarder in _listes_non_sauvegardable) then
			{
				if !(la_voiture_a_sauvegarder in list sarl_depannage_mettre_dehors) then
				{
					if (speed la_voiture_a_sauvegarder < 2) then
					{
						if (isnil {la_voiture_a_sauvegarder getvariable "jesuisenfeu"}) then
						{
							if (isnil {la_voiture_a_sauvegarder getvariable "jesuisattacher"}) then
							{
								if (isnil "uid_sav_voiture_fichier_listes_des_vehicules") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur de sauvegarde recommence ..."; execvm "persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf";};
								
								sauvegarde_vehicules_nombre_de_vehicules_total = round (sauvegarde_vehicules_nombre_de_vehicules_total + 1);
								uid_sav_voiture_fichier_listes_des_vehicules_partie_deux = format["vehicule_numero_%1", sauvegarde_vehicules_nombre_de_vehicules_total];
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules, "Nombre De Vehicules Actuel", round ((count sauvegarde_vehicules_ordre_de_rangement) + 1)] call fn_SaveToServer;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules, "Nombre De Vehicules Total", sauvegarde_vehicules_nombre_de_vehicules_total] call fn_SaveToServer; // Pour information seulement
								
								sauvegarde_vehicules_ordre_de_rangement = [sauvegarde_vehicules_ordre_de_rangement, [voiture_selectionne_texte,format ["vehicule_numero_%1",sauvegarde_vehicules_nombre_de_vehicules_total]]] call BIS_fnc_arrayPush; sleep 0.5;
								[uid_sav_voiture_fichier_listes_des_vehicules, "Ordre_De_Rangement", "Ordre De Rangement Vehicules", sauvegarde_vehicules_ordre_de_rangement] call fn_SaveToServer;
								
								// Debug local nombre de vehicule + Ordre De Rangement Vehicules
								_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total = format ["sauvegarde_vehicules_nombre_de_vehicules_total_%1", revive_mon_side];
								[_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total, sauvegarde_vehicules_nombre_de_vehicules_total] call uid_sauvegarde_ecrire_local_joueur_sfp;
								_cote_de_la_sauvegarde_vehicule_ordre_de_rangement = format ["sauvegarde_vehicules_ordre_de_rangement_%1", revive_mon_side];
								[_cote_de_la_sauvegarde_vehicule_ordre_de_rangement, sauvegarde_vehicules_ordre_de_rangement] call uid_sauvegarde_ecrire_local_joueur_sfp;
								
								_classname = typeOf la_voiture_a_sauvegarder; while {isnil "_classname"} do {sleep 0.0001; _classname = typeOf la_voiture_a_sauvegarder;};
								_pos = position la_voiture_a_sauvegarder; while {isnil "_pos"} do {sleep 0.0001; _pos = position la_voiture_a_sauvegarder;};
								_dir = [vectorDir la_voiture_a_sauvegarder] + [vectorUp la_voiture_a_sauvegarder]; while {isnil "_dir"} do {sleep 0.0001; _dir = [vectorDir la_voiture_a_sauvegarder] + [vectorUp la_voiture_a_sauvegarder];};
								_degat_general = getdammage la_voiture_a_sauvegarder; while {isnil "_degat_general"} do {sleep 0.0001; _degat_general = getdammage la_voiture_a_sauvegarder;};
								_backpack = getBackpackCargo la_voiture_a_sauvegarder;
								_weapons = getWeaponCargo la_voiture_a_sauvegarder;
								_magazines = getMagazineCargo la_voiture_a_sauvegarder;
								_items = getItemCargo la_voiture_a_sauvegarder;
								_fuel = fuel la_voiture_a_sauvegarder;
								
								_proprietaire = la_voiture_a_sauvegarder getVariable "vehicule_info_parvariable"; _temps_attente_proprietaire = 3; while {isnil "_proprietaire" && _temps_attente_proprietaire > 0} do {_temps_attente_proprietaire = _temps_attente_proprietaire - 1;_proprietaire = la_voiture_a_sauvegarder getVariable "vehicule_info_parvariable";sleep 1;}; if (isnil "_proprietaire") then {_proprietaire = [name player];};
								_plaque_immatriculation = la_voiture_a_sauvegarder getVariable "plaque_immatriculation_news"; _temps_attente_plaque = 3; while {isnil "_plaque_immatriculation" && _temps_attente_plaque > 0} do {_temps_attente_plaque = _temps_attente_plaque - 1;_plaque_immatriculation = la_voiture_a_sauvegarder getVariable "plaque_immatriculation_news";sleep 1; }; if (isnil "_plaque_immatriculation" or count _plaque_immatriculation < 2) then {_plaque_immatriculation = [] call compil_plaque_immatriculation;};
								_couleur_du_vehicule = getObjectTextures la_voiture_a_sauvegarder;
								_voiture_possede_un_klaxon = la_voiture_a_sauvegarder getVariable "voiture_possede_un_klaxon";
								_voiture_possede_une_puce = la_voiture_a_sauvegarder getVariable "voiture_possede_une_puce";
								_voiture_possede_un_neon = la_voiture_a_sauvegarder getVariable "voiture_possede_un_neon";
								_voiture_possede_un_radar_de_recul = la_voiture_a_sauvegarder getVariable "voiture_possede_un_radar_de_recul";
								_voiture_possede_un_detecteur_de_radar = la_voiture_a_sauvegarder getVariable "voiture_possede_un_detecteur_de_radar";
								_voiture_possede_un_nouveau_poids = la_voiture_a_sauvegarder getVariable "voiture_possede_un_nouveau_poids";
								_voiture_possede_de_l_eau = la_voiture_a_sauvegarder getVariable "reservoir_d_eau_pour_pompier";
								_voiture_prix_du_neuf = la_voiture_a_sauvegarder getVariable "prix_du_vehicule_neuf";
								_voiture_possede_une_assurance = la_voiture_a_sauvegarder getVariable "voiture_possede_une_assurance";
								_usedspace = la_voiture_a_sauvegarder getVariable "usedspace";
								_totalspace = la_voiture_a_sauvegarder getVariable "totalspace";
								_itemwhale = la_voiture_a_sauvegarder getVariable "item_baleine_sfp";
								_itemrequin = la_voiture_a_sauvegarder getVariable "item_requin_sfp";
								_item_medicaments = la_voiture_a_sauvegarder getVariable "item_medicaments_sfp";
								_item_organes_animaux = la_voiture_a_sauvegarder getVariable "item_organes_animaux_sfp";
								_itempommes = la_voiture_a_sauvegarder getVariable "item_pomme_sfp";
								_itempommedeterre = la_voiture_a_sauvegarder getVariable "item_pomme_de_terre_sfp";
								_itemsel = la_voiture_a_sauvegarder getVariable "item_sel_sfp";
								_itemunpheroin = la_voiture_a_sauvegarder getVariable "item_heroine_non_traite_sfp";
								_itemcuivre = la_voiture_a_sauvegarder getVariable "item_cuivre_non_transforme_sfp";
								_itemcuivretransfo = la_voiture_a_sauvegarder getVariable "item_cuivre_transforme_sfp";
								_itemproheroin = la_voiture_a_sauvegarder getVariable "item_heroine_traite_sfp";
								_itemcannabis_traite = la_voiture_a_sauvegarder getVariable "item_cannabis_traite_sfp";
								_itemcannabis_non_traite = la_voiture_a_sauvegarder getVariable "item_cannabis_non_traite_sfp";
								_itemtruffle = la_voiture_a_sauvegarder getVariable "item_truffe_sfp";
								_itemfish = la_voiture_a_sauvegarder getVariable "item_poissons_sfp";
								_itemfishpoissonspanes = la_voiture_a_sauvegarder getVariable "itemfishpoissonspanes";
								_itemunpoil = la_voiture_a_sauvegarder getVariable "item_petrole_non_traite_sfp";
								_itemprooil = la_voiture_a_sauvegarder getVariable "item_petrole_traite_sfp";
								_itemwood = la_voiture_a_sauvegarder getVariable "item_bois_sfp";
								_itemrabbitmeat = la_voiture_a_sauvegarder getVariable "item_lapins_sfp";
								_item_serpent_non_transforme = la_voiture_a_sauvegarder getVariable "serpent_non_transforme";
								_item_serpent_transforme = la_voiture_a_sauvegarder getVariable "serpent_transforme";
								_item_or_non_traite = la_voiture_a_sauvegarder getVariable "item_or_non_transforme_sfp";
								_item_or_traite = la_voiture_a_sauvegarder getVariable "item_or_transforme_sfp";
								_item_cocaine_feuille = la_voiture_a_sauvegarder getVariable "item_cocaine_feuille_coca_sfp";
								_item_cocaine_poudre = la_voiture_a_sauvegarder getVariable "item_cocaine_poudre_sfp";
								_item_plante_illegale_prete_a_vendre = la_voiture_a_sauvegarder getVariable "item_plante_illegale_prete_a_vendre_sfp";

								_dommage_roue_un = la_voiture_a_sauvegarder getHitPointDamage "HitLBWheel";
								_dommage_roue_deux = la_voiture_a_sauvegarder getHitPointDamage "HitLFWheel";
								_dommage_roue_trois = la_voiture_a_sauvegarder getHitPointDamage "HitRBWheel";
								_dommage_roue_quatre = la_voiture_a_sauvegarder getHitPointDamage "HitRFWheel";
								_body = la_voiture_a_sauvegarder getHitPointDamage "HitBody";
								_Fueldegat = la_voiture_a_sauvegarder getHitPointDamage "HitFuel";
								_HitEngine  = la_voiture_a_sauvegarder getHitPointDamage "HitEngine";
								_HitEngine2 = la_voiture_a_sauvegarder getHitPointDamage "HitEngine2";
								_HitEngine3 = la_voiture_a_sauvegarder getHitPointDamage "HitEngine3";
								_HitHRotor  = la_voiture_a_sauvegarder getHitPointDamage "HitHRotor";
								_HitVRotor = la_voiture_a_sauvegarder getHitPointDamage "HitVRotor";
								_HitBatteries  = la_voiture_a_sauvegarder getHitPointDamage "HitBatteries";
								_HitLight  = la_voiture_a_sauvegarder getHitPointDamage "HitLight";
								_HitHydraulics   = la_voiture_a_sauvegarder getHitPointDamage "HitHydraulics";
								_HitTransmission   = la_voiture_a_sauvegarder getHitPointDamage "HitTransmission";
								_HitGear   = la_voiture_a_sauvegarder getHitPointDamage "HitGear";
								_HitHStabilizerL1   = la_voiture_a_sauvegarder getHitPointDamage "HitHStabilizerL1";
								_HitHStabilizerR1   = la_voiture_a_sauvegarder getHitPointDamage "HitHStabilizerR1";
								_HitVStabilizer1    = la_voiture_a_sauvegarder getHitPointDamage "HitVStabilizer1";
								_HitTail    = la_voiture_a_sauvegarder getHitPointDamage "HitTail";
								_HitPitotTube   = la_voiture_a_sauvegarder getHitPointDamage "HitPitotTube";
								_HitStaticPort    = la_voiture_a_sauvegarder getHitPointDamage "HitStaticPort";
								_HitStarter1    = la_voiture_a_sauvegarder getHitPointDamage "HitStarter1";
								_HitStarter2   = la_voiture_a_sauvegarder getHitPointDamage "HitStarter2";
								_HitStarter3    = la_voiture_a_sauvegarder getHitPointDamage "HitStarter3";
								_HitAvionics   = la_voiture_a_sauvegarder getHitPointDamage "HitAvionics";
								_HitHull   = la_voiture_a_sauvegarder getHitPointDamage "HitHull";
								_HitMissiles   = la_voiture_a_sauvegarder getHitPointDamage "HitMissiles";
								_HitRGlass   = la_voiture_a_sauvegarder getHitPointDamage "HitRGlass";
								_HitLGlass   = la_voiture_a_sauvegarder getHitPointDamage "HitLGlass";
								_HitGlass1   = la_voiture_a_sauvegarder getHitPointDamage "HitGlass1";
								_HitGlass2   = la_voiture_a_sauvegarder getHitPointDamage "HitGlass2";
								_HitGlass3   = la_voiture_a_sauvegarder getHitPointDamage "HitGlass3";
								_HitGlass4   = la_voiture_a_sauvegarder getHitPointDamage "HitGlass4";
								_HitGlass5   = la_voiture_a_sauvegarder getHitPointDamage "HitGlass5";
								_HitGlass6   = la_voiture_a_sauvegarder getHitPointDamage "HitGlass6";
								
								// Debug local : _classname Position Proprietaire
								_valeur_debug_un = format ["sauvegarde_type_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
								[_valeur_debug_un, _classname] call uid_sauvegarde_ecrire_local_joueur_sfp;
								_valeur_debug_deux = format ["sauvegarde_position_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
								[_valeur_debug_deux, _pos] call uid_sauvegarde_ecrire_local_joueur_sfp;
								_valeur_debug_trois = format ["sauvegarde_proprietaire_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
								[_valeur_debug_trois, _proprietaire] call uid_sauvegarde_ecrire_local_joueur_sfp;
								_valeur_debug_quatre = format ["sauvegarde_direction_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
								[_valeur_debug_quatre, _dir] call uid_sauvegarde_ecrire_local_joueur_sfp;
								// Fin debug local
								
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Proprietaire", _proprietaire] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "plaque_immatriculation_news", _plaque_immatriculation] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Type", _classname] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Position", _pos] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Direction", _dir] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Armes", _weapons] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Munitions", _magazines] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "backpack", _backpack] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Items", _items] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Gasoil", _fuel] call fn_SaveToServer; sleep 0.0001;
								[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_general", _degat_general] call fn_SaveToServer; sleep 0.0001;
								
								if (!isnil "_couleur_du_vehicule") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Couleur du vehicule", _couleur_du_vehicule] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_voiture_possede_un_neon") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_neon", _voiture_possede_un_neon] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_voiture_possede_une_puce") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_une_puce", _voiture_possede_une_puce] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_voiture_possede_un_klaxon") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_klaxon", _voiture_possede_un_klaxon] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_voiture_possede_un_radar_de_recul") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_radar_de_recul", _voiture_possede_un_radar_de_recul] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_voiture_possede_un_detecteur_de_radar") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_detecteur_de_radar", _voiture_possede_un_detecteur_de_radar] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_voiture_possede_un_nouveau_poids") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_nouveau_poids", _voiture_possede_un_nouveau_poids] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_voiture_possede_de_l_eau") then {if (_voiture_possede_de_l_eau > 0) then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "reservoir_d_eau_pour_pompier", _voiture_possede_de_l_eau] call fn_SaveToServer;};}; sleep 0.0001;
								if (!isnil "_voiture_prix_du_neuf") then {if (_voiture_prix_du_neuf > 0) then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "prix_du_vehicule_neuf", _voiture_prix_du_neuf] call fn_SaveToServer;};}; sleep 0.0001;
								if (!isnil "_voiture_possede_une_assurance") then {if (_voiture_possede_une_assurance > 0) then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_une_assurance", _voiture_possede_une_assurance] call fn_SaveToServer;};}; sleep 0.0001;
								if (!isnil "_usedspace") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Espace utilise", _usedspace] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_totalspace") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Espace total", _totalspace] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemwhale") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_Baleines", _itemwhale] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemrequin") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_requins", _itemrequin] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_medicaments") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_medicaments_sfp", _item_medicaments] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_organes_animaux") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_Animaux", _item_organes_animaux] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itempommes") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_pommes", _itempommes] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itempommedeterre") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_pommes_de_terre", _itempommedeterre] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemsel") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_sel", _itemsel] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemunpheroin") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_heroine", _itemunpheroin] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemproheroin") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_heroine_transforme", _itemproheroin] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemcuivre") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cuivre", _itemcuivre] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemcuivretransfo") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cuivre_transfo", _itemcuivretransfo] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemcannabis_traite") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cannabis_traite", _itemcannabis_traite] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemcannabis_non_traite") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cannabis_non_traite", _itemcannabis_non_traite] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemtruffle") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_truffle", _itemtruffle] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemfish") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_poissons", _itemfish] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemfishpoissonspanes") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_poissons_panes", _itemfishpoissonspanes] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemunpoil") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_unpoil", _itemunpoil] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemprooil") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_prooil", _itemprooil] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemwood") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_bois", _itemwood] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_itemrabbitmeat") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_lapins_sfp", _itemrabbitmeat] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_serpent_non_transforme") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "serpent_non_transforme", _item_serpent_non_transforme] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_serpent_transforme") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "serpent_transforme", _item_serpent_transforme] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_or_non_traite") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_or_non_transforme_sfp", _item_or_non_traite] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_or_traite") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_or_transforme_sfp", _item_or_traite] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_cocaine_feuille") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_cocaine_feuille_coca_sfp", _item_cocaine_feuille] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_cocaine_poudre") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_cocaine_poudre_sfp", _item_cocaine_poudre] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_item_plante_illegale_prete_a_vendre") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_plante_illegale_prete_a_vendre_sfp", _item_plante_illegale_prete_a_vendre] call fn_SaveToServer;}; sleep 0.0001;
								
								if (!isnil "_dommage_roue_un") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_un", _dommage_roue_un] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_dommage_roue_deux") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_deux", _dommage_roue_deux] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_dommage_roue_trois") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_trois", _dommage_roue_trois] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_dommage_roue_quatre") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_quatre", _dommage_roue_quatre] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_body") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "body", _body] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_Fueldegat") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_reservoir_gasoil", _Fueldegat] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitEngine") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_moteur_un", _HitEngine] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitEngine2") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_moteur_deux", _HitEngine2] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitEngine3") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_moteur_trois", _HitEngine3] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitHRotor") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_rotor", _HitHRotor] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitVRotor") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_rotor_deux", _HitVRotor] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitBatteries") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_batterie", _HitBatteries] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitLight") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_lumiere", _HitLight] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitHydraulics") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hydraulique", _HitHydraulics] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitTransmission") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_transmissions", _HitTransmission] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitGear") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_train_atterrisage", _HitGear] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitHStabilizerL1") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_stabilisateur", _HitHStabilizerL1] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitHStabilizerR1") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_stabilisateur_deux", _HitHStabilizerR1] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitVStabilizer1") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_stabilisateur_trois", _HitVStabilizer1] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitTail") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_trail", _HitTail] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitPitotTube") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_pitot", _HitPitotTube] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitStaticPort") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_static_port", _HitStaticPort] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitStarter1") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_strarter_un", _HitStarter1] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitStarter2") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_strarter_deux", _HitStarter2] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitStarter3") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_strarter_trois", _HitStarter3] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitAvionics") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_avionics", _HitAvionics] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitHull") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_hull", _HitHull] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitMissiles") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_missiles", _HitMissiles] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitRGlass") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_rg_glasse_un", _HitRGlass] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitLGlass") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_rg_glasse_deux", _HitLGlass] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitGlass1") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_une", _HitGlass1] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitGlass2") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_deux", _HitGlass2] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitGlass3") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_trois", _HitGlass3] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitGlass4") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_quatre", _HitGlass4] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitGlass5") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_cinq", _HitGlass5] call fn_SaveToServer;}; sleep 0.0001;
								if (!isnil "_HitGlass6") then {[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_six", _HitGlass6] call fn_SaveToServer;}; sleep 0.0001;
								
								_nom_du_fichier_de_sauvegarde = format ["%1_%2_Historique_des_sauvegardes",getplayeruid player, revive_mon_side];
								_heure_de_la_sauvegarde = format ["%1: %2/%3/%4 à %5H%6Min (ARMA :%7): ", name player, heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
								_detail_sauvegarde = format ["Sauvegarde de : %1 pour plaque IMMAT : %2.", type_nom_vehicule, la_voiture_a_sauvegarder getVariable "plaque_immatriculation_news" select 1];
								[_nom_du_fichier_de_sauvegarde, "Historique chargement et sauvegarde", _heure_de_la_sauvegarde, _detail_sauvegarde] call fn_SaveToServer;
								
								historique_confirmation_sauvegarde_vehicule_joueur = la_voiture_a_sauvegarder; 
								sleep 0.1;
								publicvariable "historique_confirmation_sauvegarde_vehicule_joueur";
								
								deletevehicle la_voiture_a_sauvegarder;
							}else {hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Le véhicule de type %1 ne sera pas sauvegardé car il est attaché à une dépanneuse ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",type_nom_vehicule];sleep 5;};					
						}else {hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Le véhicule de type %1 ne sera pas sauvegardé car il est en feu ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",type_nom_vehicule];sleep 5;};					
					}else {hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Le véhicule de type %1 ne sera pas sauvegardé car il n'est pas à l'arret ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",type_nom_vehicule];sleep 5;};
				}else {hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Le véhicule de type %1 ne sera pas sauvegardé car il est situé dans la fourrière ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",type_nom_vehicule];sleep 5;};
			}else {hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Le véhicule de type %1 ne sera pas sauvegardé car il n'a pas le droit de l'être ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",type_nom_vehicule];sleep 5;};
		};
	};
};
// =====================================================================================================================================================================================================================
																		// HISTORIQUE SAV //
// =====================================================================================================================================================================================================================

_nom_du_fichier_de_sauvegarde = format ["%1_%2_Historique_des_sauvegardes",getplayeruid player, revive_mon_side];
_heure_de_la_sauvegarde = format ["%1: %2/%3/%4 à %5H%6Min (ARMA :%7): ", name player, heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
[_nom_du_fichier_de_sauvegarde, "Historique chargement et sauvegarde", _heure_de_la_sauvegarde, "Fin de sauvegarde des véhicules !"] call fn_SaveToServer;

// =====================================================================================================================================================================================================================
																		// FIN SAUVEGARDE //
// =====================================================================================================================================================================================================================

if (le_serveur_va_redemarrer_dans_20_minutes < 1) then
{
	nombre_de_vehicule_autorise_max_actuellement = round (nombre_de_vehicule_autorise_max_actuellement - 1);
	['nombre_de_vehicule_autorise_max_actuellement', nombre_de_vehicule_autorise_max_actuellement] call uid_sauvegarde_ecrire_local_joueur_sfp;
	
	hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Fin de sauvegarde de votre véhicule %1 ! \n\n Sauvegarde restante : %2. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", type_nom_vehicule, nombre_de_vehicule_autorise_max_actuellement];	
}else
{
	hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Fin de la sauvegarde illimité du véhicule %1. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", type_nom_vehicule];	
};

sleep 2;
operation_sur_la_sauvegarde = nil;
execvm "persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf";
