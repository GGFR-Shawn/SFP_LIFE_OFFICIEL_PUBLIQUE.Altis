// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {alive player};
waitUntil {!isNil "serverID"};
waitUntil {!isnil "fin_verification_apres_chargement"};
waitUntil {!isnil "LoadToServer"};
private "_compilation_reinitialisation_variable_des_vehicules";

_compilation_reinitialisation_variable_des_vehicules =
{
	sauvegarde_vehicule_numero_plaque_immatriculation = nil;
	sauvegarde_vehicule_Type = nil;
	sauvegarde_vehicule_Position = nil;
	sauvegarde_vehicule_Direction = nil;
	sauvegarde_vehicule_Armes = nil;
	sauvegarde_vehicule_Munitions = nil;
	sauvegarde_vehicule_Items = nil;
	sauvegarde_vehicule_backpack = nil;
	sauvegarde_vehicule_proprietaire = nil;
	sauvegarde_vehicule_Couleur_Vehicule = nil;
	sauvegarde_vehicule_reservoir_d_eau_pour_pompier = nil;
	sauvegarde_vehicule_Klaxon_Perso = nil;
	sauvegarde_vehicule_Puce = nil;
	sauvegarde_vehicule_Neon = nil;
	sauvegarde_vehicule_Radar_De_Recul = nil;
	sauvegarde_vehicule_nouveau_poids = nil;
	sauvegarde_vehicule_Espace_utilise = nil;
	sauvegarde_vehicule_Espace_total = nil;
	sauvegarde_vehicule_Item_baleines = nil;
	sauvegarde_vehicule_Item_requins = nil;
	sauvegarde_vehicule_item_cocaine_feuille_coca = nil;
	sauvegarde_vehicule_item_cocaine_poudre = nil;
	sauvegarde_vehicule_Item_medicaments = nil;
	sauvegarde_vehicule_Item_Animaux = nil;
	sauvegarde_vehicule_Item_pommes = nil;
	sauvegarde_vehicule_Item_pommes_de_terre = nil;
	sauvegarde_vehicule_Item_sel = nil;
	sauvegarde_vehicule_Item_heroine = nil;
	sauvegarde_vehicule_Item_heroine_transforme = nil;
	sauvegarde_vehicule_Item_cuivre = nil;
	sauvegarde_vehicule_Item_cuivre_transfo = nil;
	sauvegarde_vehicule_Item_cannabis_traite = nil;
	sauvegarde_vehicule_Item_truffle = nil;
	sauvegarde_vehicule_Item_poissons = nil;
	sauvegarde_vehicule_Item_poissons_panes = nil;
	sauvegarde_vehicule_Item_unpoil = nil;
	sauvegarde_vehicule_Item_prooil = nil;
	sauvegarde_vehicule_Item_bois = nil;
	sauvegarde_vehicule_Item_lappins = nil;
	sauvegarde_vehicule_Item_or_non_traite = nil;
	sauvegarde_vehicule_Item_or_traite = nil;
	sauvegarde_vehicule_item_plante_illegale_prete_a_vendre = nil;
	sauvegarde_vehicule_dommage_roue_un = nil;
	sauvegarde_vehicule_dommage_roue_deux = nil;
	sauvegarde_vehicule_dommage_roue_trois = nil;
	sauvegarde_vehicule_dommage_roue_quatre = nil;
	sauvegarde_vehicule_body = nil;
	sauvegarde_vehicule_Degat_general = nil;
	sauvegarde_vehicule_Degat_reservoir_gasoil = nil;
	sauvegarde_vehicule_Degat_moteur_un = nil;
	sauvegarde_vehicule_Degat_moteur_deux = nil;
	sauvegarde_vehicule_Degat_moteur_trois = nil;
	sauvegarde_vehicule_Degat_rotor = nil;
	sauvegarde_vehicule_Degat_rotor_deux = nil;
	sauvegarde_vehicule_Degat_batterie = nil;
	sauvegarde_vehicule_degat_lumiere = nil;
	sauvegarde_vehicule_degat_hydraulique = nil;
	sauvegarde_vehicule_degat_transmissions = nil;
	sauvegarde_vehicule_degat_train_atterrisage = nil;
	sauvegarde_vehicule_Gasoil = nil;
	sauvegarde_vehicule_degat_stabilisateur = nil;
	sauvegarde_vehicule_degat_stabilisateur_deux = nil;
	sauvegarde_vehicule_degat_stabilisateur_trois = nil;
	sauvegarde_vehicule_degat_hit_trail = nil;
	sauvegarde_vehicule_degat_hit_pitot = nil;
	sauvegarde_vehicule_degat_static_port = nil;
	sauvegarde_vehicule_degat_hit_strarter_un = nil;
	sauvegarde_vehicule_degat_hit_strarter_deux = nil;
	sauvegarde_vehicule_degat_hit_strarter_trois = nil;
	sauvegarde_vehicule_degat_hit_avionics = nil;
	sauvegarde_vehicule_degat_hit_hull = nil;
	sauvegarde_vehicule_degat_hit_missiles = nil;
	sauvegarde_vehicule_degat_rg_glasse_un = nil;
	sauvegarde_vehicule_degat_rg_glasse_deux = nil;
	sauvegarde_vehicule_degat_glasse_une = nil;
	sauvegarde_vehicule_degat_glasse_deux = nil;
	sauvegarde_vehicule_degat_glasse_trois = nil;
	sauvegarde_vehicule_degat_glasse_quatre = nil;
	sauvegarde_vehicule_degat_glasse_cinq = nil;
	sauvegarde_vehicule_degat_glasse_six = nil;
	securite_temps_chargement = nil;
	sauvegarde_vehicule_prix_du_vehicule_neuf = nil;
	sauvegarde_vehicule_voiture_possede_une_assurance = nil;
	sauvegarde_vehicule_Item_serpent_non_transforme = nil;
	sauvegarde_vehicule_Item_serpent_transforme = nil;
	sleep 2;
	operation_sur_la_sauvegarde = nil;
};

// ==========================================================================================================================================================================================
																			  // SECURITE //
// ==========================================================================================================================================================================================
if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitWith {hint "Opération impossible ! Le serveur va redémarrer dans moins de 20 minutes !";};
if (!isnil "operation_sur_la_sauvegarde") exitwith {hint "Patiente, une opération est déja en cours sur la sauvegarde !";};
operation_sur_la_sauvegarde = true;

// ==========================================================================================================================================================================================
																			// INITIALISATION //
// ==========================================================================================================================================================================================
hint "! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Initialisation et detection de votre véhicule dans la sauvegarde serveur ... \n\n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

_temps_attente = time + 5; // 5 Secondes
while {(!isnil "tableau_suppression_trouve_vehicule" or !isnil "voiture_selectionne" or !isnil "voiture_selectionne_texte") && time < _temps_attente} do
{
	voiture_selectionne = nil; 
	voiture_selectionne_texte = nil; 
	tableau_suppression_trouve_vehicule = nil; 
	sleep 0.001;
};
if (time > _temps_attente) exitwith {hint "Erreur (1), recommence ..."; operation_sur_la_sauvegarde = nil;};

if (isnil "sauvegarde_vehicules_ordre_de_rangement") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ...";};
if (isnil "sauvegarde_vehicules_nombre_de_vehicules_total") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ...";};

// ==========================================================================================================================================================================================
										// DETECTION DES VEHICULES DANS LA SAUVEGARDE //
// ==========================================================================================================================================================================================
voiture_selectionne = lbCurSel ((uiNamespace getVariable "Menu_tablette_sfp_Choix_Vehicule_A_Charger") displayCtrl 1500);
voiture_selectionne_texte = lbText [1500, voiture_selectionne];
if (isnil "voiture_selectionne") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ...";};
if (isnil "voiture_selectionne_texte") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ...";};

for "_i" from 0 to (count sauvegarde_vehicules_ordre_de_rangement) do
{
	if (sauvegarde_vehicules_ordre_de_rangement select _i select 0 == voiture_selectionne_texte) then
	{
		tableau_suppression_trouve_vehicule = _i;
	};
};
if (isnil "tableau_suppression_trouve_vehicule") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur sur la recherche du véhicule, recommence ...";};
if (isnil "uid_sav_voiture_fichier_listes_des_vehicules") exitwith {operation_sur_la_sauvegarde = nil; hint "Erreur de sauvegarde recommence ...";};
// ==========================================================================================================================================================================================
													// HISTORIQUE CHARGEMENT //
// ==========================================================================================================================================================================================

_nom_du_fichier_de_sauvegarde = format ["%1_%2_Historique_des_sauvegardes",getplayeruid player, revive_mon_side];
_heure_de_la_sauvegarde = format ["%1: %2/%3/%4 à %5H%6Min (ARMA :%7): ", name player, heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
[_nom_du_fichier_de_sauvegarde, "Historique chargement et sauvegarde", _heure_de_la_sauvegarde, "Début du chargement des véhicules !"] call fn_SaveToServer;
// ==========================================================================================================================================================================================
													// DEMARRAGE CHARGEMENT //
// ==========================================================================================================================================================================================
hint "! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Le chargement de votre véhicule débute ... \n\n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

closeDialog 0;

uid_sav_voiture_fichier_listes_des_vehicules_partie_deux = format["%1", sauvegarde_vehicules_ordre_de_rangement select tableau_suppression_trouve_vehicule select 1];

[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Proprietaire", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "plaque_immatriculation_news", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Couleur du vehicule", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_une_puce", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_neon", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_klaxon", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_radar_de_recul", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_detecteur_de_radar", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_un_nouveau_poids", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "reservoir_d_eau_pour_pompier", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "prix_du_vehicule_neuf", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "voiture_possede_une_assurance", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Type", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Position", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Direction", "test_valeur_existe"] call LoadToServer;sleep 0.01;

[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Armes", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Munitions", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Items", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "backpack", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Gasoil", "test_valeur_existe"] call LoadToServer;sleep 0.01;

[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Espace utilise", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Espace total", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_pommes", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_pommes_de_terre", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_sel", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cuivre", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cuivre_transfo", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_truffle", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_poissons", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_poissons_panes", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_unpoil", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_prooil", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_bois", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_lapins_sfp", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "serpent_non_transforme", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "serpent_transforme", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_or_non_transforme_sfp", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_or_transforme_sfp", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_plante_illegale_prete_a_vendre_sfp", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cannabis_traite", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_cannabis_non_traite", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_heroine", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_heroine_transforme", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_baleines", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_requins", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_cocaine_feuille_coca_sfp", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_cocaine_poudre_sfp", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "item_medicaments_sfp", "test_valeur_existe"] call LoadToServer;sleep 0.01;
// [uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Item_Animaux", "test_valeur_existe"] call LoadToServer;sleep 0.01;

[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_un", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_deux", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_trois", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "dommage_roue_quatre", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "body", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_general", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_reservoir_gasoil", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_moteur_un", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_moteur_deux", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_moteur_trois", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_rotor", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_rotor_deux", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "Degat_batterie", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_lumiere", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hydraulique", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_transmissions", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_train_atterrisage", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_stabilisateur", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_stabilisateur_deux", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_stabilisateur_trois", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_trail", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_pitot", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_static_port", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_strarter_un", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_strarter_deux", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_strarter_trois", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_avionics", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_hull", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_hit_missiles", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_rg_glasse_un", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_rg_glasse_deux", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_une", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_deux", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_trois", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_quatre", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_cinq", "test_valeur_existe"] call LoadToServer;sleep 0.01;
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux, "degat_glasse_six", "test_valeur_existe"] call LoadToServer;sleep 0.01;


// ==========================================================================================================================================================================================
																	// SECURITE SI SOUCIS SAUVEGARDE //
// ==========================================================================================================================================================================================
_delai_max_attente_des_informations_de_la_sauvegarde = 60; // Divisé par 3
while {isnil "securite_temps_chargement" && (isnil "sauvegarde_vehicule_numero_plaque_immatriculation" or isnil "sauvegarde_vehicule_Items" or isnil "sauvegarde_vehicule_backpack" or isnil "sauvegarde_vehicule_proprietaire" or isnil "sauvegarde_vehicule_degat_general" or isnil "sauvegarde_vehicule_type" or isnil "sauvegarde_vehicule_position" or isnil "sauvegarde_vehicule_Direction")} do
{
	sleep 0.2;
	_delai_max_attente_des_informations_de_la_sauvegarde = round (_delai_max_attente_des_informations_de_la_sauvegarde - 1);
	if (_delai_max_attente_des_informations_de_la_sauvegarde <= 0) then {securite_temps_chargement = 1;};
	hintsilent "Attente des informations du véhicule pour continuer le chargement ... \n\n Si vous possédez un nom avec des guillemets, utiliser un autre pseudo sans ca, le script se freezera !";
};

// Debug en local
if (isnil "sauvegarde_vehicule_type") then {_valeur_debug = format ["sauvegarde_type_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_type = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};
if (!isnil "sauvegarde_vehicule_type") then {if (sauvegarde_vehicule_type == "") then {_valeur_debug = format ["sauvegarde_type_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_type = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};};
if (isnil "sauvegarde_vehicule_Position") then {_valeur_debug = format ["sauvegarde_position_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_Position = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};
if (!isnil "sauvegarde_vehicule_Position") then {if (count sauvegarde_vehicule_position < 1) then {_valeur_debug = format ["sauvegarde_position_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_Position = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};};
if (isnil "sauvegarde_vehicule_proprietaire") then {_valeur_debug = format ["sauvegarde_proprietaire_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_proprietaire = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};
if (!isnil "sauvegarde_vehicule_proprietaire") then {if (count sauvegarde_vehicule_proprietaire < 1) then {_valeur_debug = format ["sauvegarde_proprietaire_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_proprietaire = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};};
if (isnil "sauvegarde_vehicule_numero_plaque_immatriculation") then {sauvegarde_vehicule_numero_plaque_immatriculation = [] call compil_plaque_immatriculation; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};
if (!isnil "sauvegarde_vehicule_numero_plaque_immatriculation") then {if (count sauvegarde_vehicule_numero_plaque_immatriculation < 2) then {sauvegarde_vehicule_numero_plaque_immatriculation = [] call compil_plaque_immatriculation; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};};
if (isnil "sauvegarde_vehicule_Direction") then {_valeur_debug = format ["sauvegarde_direction_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_Direction = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};
if (!isnil "sauvegarde_vehicule_Direction") then {if (count sauvegarde_vehicule_Direction < 1) then {_valeur_debug = format ["sauvegarde_direction_vehicle_%1",round (sauvegarde_vehicules_nombre_de_vehicules_total)]; sauvegarde_vehicule_Direction = [_valeur_debug] call uid_sauvegarde_lire_local_joueur_sfp; il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = 1;};};

// ==========================================================================================================================================================================================
																// SECURITE JOUEURS ZONE DE SPAWN //
// ==========================================================================================================================================================================================
_type_nom_vehicule = getText ( configFile >> "CfgVehicles" >> sauvegarde_vehicule_Type >> "displayName");

_pos = [sauvegarde_vehicule_Position select 0, sauvegarde_vehicule_Position select 1, 0];
_verifierjoueurautour = _pos nearEntities ["man", 2];
_verifierjoueurautour_deux = nearestObjects [_pos, ["Car","Ship","Air"], 2];
_verifierjoueurautour_deux_check_ok = _verifierjoueurautour_deux select 0;
while {({isPlayer _x} count (_verifierjoueurautour) > 0) or (!isnil "_verifierjoueurautour_deux_check_ok")} do
{
	_verifierjoueurautour = _pos nearEntities ["man", 2];
	_verifierjoueurautour_deux = nearestObjects [_pos, ["Car","Ship","Air"], 2];
	_verifierjoueurautour_deux_check_ok = _verifierjoueurautour_deux select 0;
	
	if ({isPlayer _x} count (_verifierjoueurautour) > 0) then 
	{
		hintsilent format ["Chargement impossible du véhicule de type %1 puisque un joueur, est dans la zone du spawn !",_type_nom_vehicule];
	};
	if (!isnil "_verifierjoueurautour_deux_check_ok" && !isnil {_verifierjoueurautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0}) then 
	{
		hintsilent format ["Chargement impossible du véhicule de type %1 puisque un vehicule de type %2 appartenant à %3 est dans la zone du spawn ! \n\n Demande donc au joueur de bouger son véhicule ou appel la DDE ;) \n\n Tu peux consulter ta carte pour trouver le point.",_type_nom_vehicule,_verifierjoueurautour_deux_check_ok,_verifierjoueurautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];
	};
	if (!isnil "_verifierjoueurautour_deux_check_ok" && isnil {_verifierjoueurautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0}) then 
	{
		hintsilent format ["Chargement impossible du véhicule de type %1 puisque un vehicule de type %2 n'appartenant pas à un joueur est dans la zone du spawn ! \n\n Appel donc un ADMIN ou un CO ADMIN qu'il vienne te le supprimer ! \n\n Tu peux consulter ta carte pour trouver le point.",_type_nom_vehicule,_verifierjoueurautour_deux_check_ok];
	};
	
	sleep 2;
	if (isnil "marker") then
	{
		marker = 1;
		createMarkerLocal ["pointdegene", _pos];
		"pointdegene" setMarkerShapeLocal "ICON";
		"pointdegene" setMarkerColorLocal "Coloryellow";	
		"pointdegene" setMarkerSizeLocal [2,2];
		"pointdegene" setMarkerTypeLocal "hd_dot";
		"pointdegene" setMarkerTextLocal "Vehicule genant chargement";
	};
};
if (!isnil "marker") then {marker = nil; deletemarkerlocal "pointdegene";};

// ==========================================================================================================================================================================================
																// SECURITE GRUE OU MAISON //
// ==========================================================================================================================================================================================
_position_de_base = 0;
if (count (nearestObjects [sauvegarde_vehicule_position, ["House","Land_Crane_F"], 7]) > 0) then
{
	while {(count (nearestObjects [sauvegarde_vehicule_position, [], 7])) > 0} do
	{
		_position_de_base = round (_position_de_base + 1);
		_position_trois_random = [_position_de_base,-_position_de_base] call BIS_fnc_selectRandom;
		_position_quatre_random = [_position_de_base,-_position_de_base] call BIS_fnc_selectRandom;
		sauvegarde_vehicule_position = [((sauvegarde_vehicule_position select 0) + random _position_trois_random),((sauvegarde_vehicule_position select 1) + random _position_quatre_random), sauvegarde_vehicule_position select 2];
		
		hintsilent "! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Votre véhicule est trop près d'une maison ou une grue ... \n\n Nous recherchons une nouvelle position à proximité ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";	
		sleep 0.001;
	};
};

// ==========================================================================================================================================================================================
																	// CHARGEMENT DES VEHICULES //
// ==========================================================================================================================================================================================
hint format ["! NEW SYSTEME DE CHARGEMENT ! \n -------------------------------------------- \n \n Chargement du véhicule de type %1 en cours ... \n\n Un marqueur ou le véhicule à été chargé sera créé pour 60 secondes ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_type_nom_vehicule];

_nom_du_fichier_de_sauvegarde = format ["%1_%2_Historique_des_sauvegardes",getplayeruid player, revive_mon_side];
_heure_de_la_sauvegarde = format ["%1: %2/%3/%4 à %5H%6Min (ARMA :%7): ", name player, heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_sauvegarde = format ["Chargement du véhicule de type : %1 pour plaque IMMAT : %2.", _type_nom_vehicule, sauvegarde_vehicule_numero_plaque_immatriculation select 0];
[_nom_du_fichier_de_sauvegarde, "Historique chargement et sauvegarde", _heure_de_la_sauvegarde, _detail_sauvegarde] call fn_SaveToServer;

_obj = createVehicle [sauvegarde_vehicule_Type, sauvegarde_vehicule_Position, [], 0, "CAN_COLLIDE"];
_obj setPos [sauvegarde_vehicule_Position select 0, sauvegarde_vehicule_Position select 1, 0.2];
_obj setVectorDirAndUp sauvegarde_vehicule_Direction;
_type_pour_position_vehicule = sauvegarde_vehicule_Type;
if (!alive _obj) exitwith {operation_sur_la_sauvegarde = nil; deletevehicle _obj; hint "Le véhicule à explosé, il n'à pas été supprimé de votre sauvegarde ! \n\n Si soucis, passe sur le forum www.sfpteam.fr !"; [] call _compilation_reinitialisation_variable_des_vehicules;};

_les_armes_a_remettre_dans_le_vehicule = sauvegarde_vehicule_Armes;
_les_munitions_a_remettre_dans_le_vehicule = sauvegarde_vehicule_Munitions;
_les_items_a_remettre_dans_le_vehicule = sauvegarde_vehicule_Items;
_les_sac_a_dos_a_remettre_dans_le_vehicule = sauvegarde_vehicule_backpack;

[_obj,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
sleep 1;
[_obj,_les_armes_a_remettre_dans_le_vehicule,_les_munitions_a_remettre_dans_le_vehicule, _les_items_a_remettre_dans_le_vehicule, _les_sac_a_dos_a_remettre_dans_le_vehicule] execvm "persistence\voitures\remettre_les_armes_etc_dans_le_coffre_du_vehicule.sqf";

if (!isnil "sauvegarde_vehicule_Espace_utilise") then {if (sauvegarde_vehicule_Espace_utilise >= 0) then {_obj setVariable ["usedspace",sauvegarde_vehicule_Espace_utilise , true];};};
if (!isnil "sauvegarde_vehicule_Espace_total") then {if (sauvegarde_vehicule_Espace_total >= 0) then {_obj setVariable ["totalspace",sauvegarde_vehicule_Espace_total , true];};};
if (!isnil "sauvegarde_vehicule_Item_baleines") then {if (sauvegarde_vehicule_Item_baleines >= 0) then {_obj setVariable ["item_baleine_sfp",sauvegarde_vehicule_Item_baleines , true];};};
if (!isnil "sauvegarde_vehicule_Item_requins") then {if (sauvegarde_vehicule_Item_requins >= 0) then {_obj setVariable ["item_requin_sfp",sauvegarde_vehicule_Item_requins , true];};};
if (!isnil "sauvegarde_vehicule_item_cocaine_feuille_coca") then {if (sauvegarde_vehicule_item_cocaine_feuille_coca >= 0) then {_obj setVariable ["item_cocaine_feuille_coca_sfp",sauvegarde_vehicule_item_cocaine_feuille_coca , true];};};
if (!isnil "sauvegarde_vehicule_item_cocaine_poudre") then {if (sauvegarde_vehicule_item_cocaine_poudre >= 0) then {_obj setVariable ["item_cocaine_poudre_sfp",sauvegarde_vehicule_item_cocaine_poudre , true];};};
if (!isnil "sauvegarde_vehicule_Item_medicaments") then {if (sauvegarde_vehicule_Item_medicaments >= 0) then {_obj setVariable ["item_medicaments_sfp",sauvegarde_vehicule_Item_medicaments , true];};};
if (!isnil "sauvegarde_vehicule_Item_Animaux") then {if (sauvegarde_vehicule_Item_Animaux >= 0) then {_obj setVariable ["item_organes_animaux_sfp",sauvegarde_vehicule_Item_Animaux , true];};};
if (!isnil "sauvegarde_vehicule_Item_pommes") then {if (sauvegarde_vehicule_Item_pommes >= 0) then {_obj setVariable ["item_pomme_sfp",sauvegarde_vehicule_Item_pommes , true];};};
if (!isnil "sauvegarde_vehicule_Item_pommes_de_terre") then {if (sauvegarde_vehicule_Item_pommes_de_terre >= 0) then {_obj setVariable ["item_pomme_de_terre_sfp",sauvegarde_vehicule_Item_pommes_de_terre, true];};};
if (!isnil "sauvegarde_vehicule_Item_sel") then {if (sauvegarde_vehicule_Item_sel >= 0) then {_obj setVariable ["item_sel_sfp",sauvegarde_vehicule_Item_sel, true];};};
if (!isnil "sauvegarde_vehicule_Item_heroine") then {if (sauvegarde_vehicule_Item_heroine >= 0) then {_obj setVariable ["item_heroine_non_traite_sfp",sauvegarde_vehicule_Item_heroine, true];};};
if (!isnil "sauvegarde_vehicule_Item_heroine_transforme") then {if (sauvegarde_vehicule_Item_heroine_transforme >= 0) then {_obj setVariable ["item_heroine_traite_sfp",sauvegarde_vehicule_Item_heroine_transforme, true];};};
if (!isnil "sauvegarde_vehicule_Item_cuivre") then {if (sauvegarde_vehicule_Item_cuivre >= 0) then {_obj setVariable ["item_cuivre_non_transforme_sfp",sauvegarde_vehicule_Item_cuivre, true];};};
if (!isnil "sauvegarde_vehicule_Item_cuivre_transfo") then {if (sauvegarde_vehicule_Item_cuivre_transfo >= 0) then {_obj setVariable ["item_cuivre_transforme_sfp",sauvegarde_vehicule_Item_cuivre_transfo, true];};};
if (!isnil "sauvegarde_vehicule_Item_cannabis_traite") then {if (sauvegarde_vehicule_Item_cannabis_traite >= 0) then {_obj setVariable ["item_cannabis_traite_sfp",sauvegarde_vehicule_Item_cannabis_traite, true];};};
if (!isnil "sauvegarde_vehicule_Item_cannabis_non_traite") then {if (sauvegarde_vehicule_Item_cannabis_non_traite >= 0) then {_obj setVariable ["item_cannabis_non_traite_sfp",sauvegarde_vehicule_Item_cannabis_non_traite, true];};};
if (!isnil "sauvegarde_vehicule_Item_truffle") then {if (sauvegarde_vehicule_Item_truffle >= 0) then {_obj setVariable ["item_truffe_sfp",sauvegarde_vehicule_Item_truffle, true];};};
if (!isnil "sauvegarde_vehicule_Item_poissons") then {if (sauvegarde_vehicule_Item_poissons >= 0) then {_obj setVariable ["item_poissons_sfp",sauvegarde_vehicule_Item_poissons , true];};};
if (!isnil "sauvegarde_vehicule_Item_poissons_panes") then {if (sauvegarde_vehicule_Item_poissons_panes >= 0) then {_obj setVariable ["itemfishpoissonspanes",sauvegarde_vehicule_Item_poissons_panes, true];};}; 
if (!isnil "sauvegarde_vehicule_Item_unpoil") then {if (sauvegarde_vehicule_Item_unpoil >= 0) then {_obj setVariable ["item_petrole_non_traite_sfp",sauvegarde_vehicule_Item_unpoil, true];};};
if (!isnil "sauvegarde_vehicule_Item_prooil") then {if (sauvegarde_vehicule_Item_prooil >= 0) then {_obj setVariable ["item_petrole_traite_sfp",sauvegarde_vehicule_Item_prooil, true];};};
if (!isnil "sauvegarde_vehicule_Item_bois") then {if (sauvegarde_vehicule_Item_bois >= 0) then {_obj setVariable ["item_bois_sfp",sauvegarde_vehicule_Item_bois, true];};};
if (!isnil "sauvegarde_vehicule_Item_lappins") then {if (sauvegarde_vehicule_Item_lappins >= 0) then {_obj setVariable ["item_lapins_sfp",sauvegarde_vehicule_Item_lappins, true];};};
if (!isnil "sauvegarde_vehicule_Item_serpent_non_transforme") then {if (sauvegarde_vehicule_Item_serpent_non_transforme >= 0) then {_obj setVariable ["serpent_non_transforme",sauvegarde_vehicule_Item_serpent_non_transforme, true];};};
if (!isnil "sauvegarde_vehicule_Item_serpent_transforme") then {if (sauvegarde_vehicule_Item_serpent_transforme >= 0) then {_obj setVariable ["serpent_transforme",sauvegarde_vehicule_Item_serpent_transforme, true];};};
if (!isnil "sauvegarde_vehicule_Item_or_non_traite") then {if (sauvegarde_vehicule_Item_or_non_traite >= 0) then {_obj setVariable ["item_or_non_transforme_sfp",sauvegarde_vehicule_Item_or_non_traite, true];};};
if (!isnil "sauvegarde_vehicule_Item_or_traite") then {if (sauvegarde_vehicule_Item_or_traite >= 0) then {_obj setVariable ["item_or_transforme_sfp",sauvegarde_vehicule_Item_or_traite, true];};};
if (!isnil "sauvegarde_vehicule_item_plante_illegale_prete_a_vendre") then {if (sauvegarde_vehicule_item_plante_illegale_prete_a_vendre >= 0) then {_obj setVariable ["item_plante_illegale_prete_a_vendre_sfp",sauvegarde_vehicule_item_plante_illegale_prete_a_vendre, true];};};

if (!isnil "sauvegarde_vehicule_degat_general") then {if (sauvegarde_vehicule_Degat_general > 0) then {_obj setdamage sauvegarde_vehicule_Degat_general;};};
if (!isnil "sauvegarde_vehicule_degat_lumiere") then {if (sauvegarde_vehicule_degat_lumiere > 0) then {_obj setHitPointDamage ["HitLight", sauvegarde_vehicule_degat_lumiere];};};
if (!isnil "sauvegarde_vehicule_degat_hydraulique") then {if (sauvegarde_vehicule_degat_hydraulique > 0) then {_obj setHitPointDamage ["HitHydraulics", sauvegarde_vehicule_degat_hydraulique];};};
if (!isnil "sauvegarde_vehicule_degat_transmissions") then {if (sauvegarde_vehicule_degat_transmissions > 0) then {_obj setHitPointDamage ["HitTransmission", sauvegarde_vehicule_degat_transmissions];};};
if (!isnil "sauvegarde_vehicule_degat_train_atterrisage") then {if (sauvegarde_vehicule_degat_train_atterrisage > 0) then {_obj setHitPointDamage ["HitGear", sauvegarde_vehicule_degat_train_atterrisage];};};
if (!isnil "sauvegarde_vehicule_degat_stabilisateur") then {if (sauvegarde_vehicule_degat_stabilisateur > 0) then {_obj setHitPointDamage ["HitHStabilizerL1", sauvegarde_vehicule_degat_stabilisateur];};};
if (!isnil "sauvegarde_vehicule_degat_stabilisateur_deux") then {if (sauvegarde_vehicule_degat_stabilisateur_deux > 0) then {_obj setHitPointDamage ["HitHStabilizerR1", sauvegarde_vehicule_degat_stabilisateur_deux];};};
if (!isnil "sauvegarde_vehicule_degat_stabilisateur_trois") then {if (sauvegarde_vehicule_degat_stabilisateur_trois > 0) then {_obj setHitPointDamage ["HitVStabilizer1", sauvegarde_vehicule_degat_stabilisateur_trois];};};
if (!isnil "sauvegarde_vehicule_degat_hit_trail") then {if (sauvegarde_vehicule_degat_hit_trail > 0) then {_obj setHitPointDamage ["HitTail", sauvegarde_vehicule_degat_hit_trail];};};
if (!isnil "sauvegarde_vehicule_degat_hit_pitot") then {if (sauvegarde_vehicule_degat_hit_pitot > 0) then {_obj setHitPointDamage ["HitPitotTube", sauvegarde_vehicule_degat_hit_pitot];};};
if (!isnil "sauvegarde_vehicule_degat_static_port") then {if (sauvegarde_vehicule_degat_static_port > 0) then {_obj setHitPointDamage ["HitStaticPort", sauvegarde_vehicule_degat_static_port];};};
if (!isnil "sauvegarde_vehicule_degat_hit_strarter_un") then {if (sauvegarde_vehicule_degat_hit_strarter_un > 0) then {_obj setHitPointDamage ["HitStarter1", sauvegarde_vehicule_degat_hit_strarter_un];};};
if (!isnil "sauvegarde_vehicule_degat_hit_strarter_deux") then {if (sauvegarde_vehicule_degat_hit_strarter_deux > 0) then {_obj setHitPointDamage ["HitStarter2", sauvegarde_vehicule_degat_hit_strarter_deux];};};
if (!isnil "sauvegarde_vehicule_degat_hit_strarter_trois") then {if (sauvegarde_vehicule_degat_hit_strarter_trois > 0) then {_obj setHitPointDamage ["HitStarter3", sauvegarde_vehicule_degat_hit_strarter_trois];};};
if (!isnil "sauvegarde_vehicule_degat_hit_avionics") then {if (sauvegarde_vehicule_degat_hit_avionics > 0) then {_obj setHitPointDamage ["HitAvionics", sauvegarde_vehicule_degat_hit_avionics];};};
if (!isnil "sauvegarde_vehicule_degat_hit_hull") then {if (sauvegarde_vehicule_degat_hit_hull > 0) then {_obj setHitPointDamage ["HitHull", sauvegarde_vehicule_degat_hit_hull];};};
if (!isnil "sauvegarde_vehicule_degat_hit_missiles") then {if (sauvegarde_vehicule_degat_hit_missiles > 0) then {_obj setHitPointDamage ["HitMissiles", sauvegarde_vehicule_degat_hit_missiles];};};
if (!isnil "sauvegarde_vehicule_degat_rg_glasse_un") then {if (sauvegarde_vehicule_degat_rg_glasse_un > 0) then {_obj setHitPointDamage ["HitRGlass", sauvegarde_vehicule_degat_rg_glasse_un];};};
if (!isnil "sauvegarde_vehicule_Degat_rotor") then {if (sauvegarde_vehicule_Degat_rotor > 0) then {_obj setHitPointDamage ["HitHRotor", sauvegarde_vehicule_Degat_rotor];};};
if (!isnil "sauvegarde_vehicule_Degat_rotor_deux") then {if (sauvegarde_vehicule_Degat_rotor_deux > 0) then {_obj setHitPointDamage ["HitVRotor", sauvegarde_vehicule_Degat_rotor_deux];};};
if (!isnil "sauvegarde_vehicule_Degat_batterie") then {if (sauvegarde_vehicule_Degat_batterie > 0) then {_obj setHitPointDamage ["HitBatteries", sauvegarde_vehicule_Degat_batterie];};};
if (!isnil "sauvegarde_vehicule_Degat_moteur_deux") then {if (sauvegarde_vehicule_Degat_moteur_deux > 0) then {_obj setHitPointDamage ["HitEngine2", sauvegarde_vehicule_Degat_moteur_deux];};};
if (!isnil "sauvegarde_vehicule_Degat_moteur_trois") then {if (sauvegarde_vehicule_Degat_moteur_trois > 0) then {_obj setHitPointDamage ["HitEngine3", sauvegarde_vehicule_Degat_moteur_trois];};};

if (!isnil "sauvegarde_vehicule_body") then {if (sauvegarde_vehicule_body > 0) then {_obj setHitPointDamage ["HitBody", sauvegarde_vehicule_body];};};
if (!isnil "sauvegarde_vehicule_Gasoil") then {if (sauvegarde_vehicule_Gasoil > 0) then {_obj setfuel sauvegarde_vehicule_Gasoil; [[[_obj,sauvegarde_vehicule_Gasoil],"divers\achat_divers_supermarche\utiliser_et_donner_les_achats\bidon_d_essence\synchro_fuel.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;};};
if (!isnil "sauvegarde_vehicule_degat_rg_glasse_deux") then {if (sauvegarde_vehicule_degat_rg_glasse_deux > 0) then {_obj setHitPointDamage ["HitLGlass", sauvegarde_vehicule_degat_rg_glasse_deux];};};
if (!isnil "sauvegarde_vehicule_degat_glasse_une") then {if (sauvegarde_vehicule_degat_glasse_une > 0) then {_obj setHitPointDamage ["HitGlass1", sauvegarde_vehicule_degat_glasse_une];};};
if (!isnil "sauvegarde_vehicule_degat_glasse_deux") then {if (sauvegarde_vehicule_degat_glasse_deux > 0) then {_obj setHitPointDamage ["HitGlass2", sauvegarde_vehicule_degat_glasse_deux];};};
if (!isnil "sauvegarde_vehicule_degat_glasse_trois") then {if (sauvegarde_vehicule_degat_glasse_trois > 0) then {_obj setHitPointDamage ["HitGlass3", sauvegarde_vehicule_degat_glasse_trois];};};
if (!isnil "sauvegarde_vehicule_degat_glasse_quatre") then {if (sauvegarde_vehicule_degat_glasse_quatre > 0) then {_obj setHitPointDamage ["HitGlass4", sauvegarde_vehicule_degat_glasse_quatre];};};
if (!isnil "sauvegarde_vehicule_degat_glasse_cinq") then {if (sauvegarde_vehicule_degat_glasse_cinq > 0) then {_obj setHitPointDamage ["HitGlass5", sauvegarde_vehicule_degat_glasse_cinq];};};
if (!isnil "sauvegarde_vehicule_degat_glasse_six") then {if (sauvegarde_vehicule_degat_glasse_six > 0) then {_obj setHitPointDamage ["HitGlass6", sauvegarde_vehicule_degat_glasse_six];};};
if (!isnil "sauvegarde_vehicule_dommage_roue_un") then {if (sauvegarde_vehicule_dommage_roue_un > 0) then {_obj setHitPointDamage ["HitLBWheel", sauvegarde_vehicule_dommage_roue_un];};};
if (!isnil "sauvegarde_vehicule_dommage_roue_deux") then {if (sauvegarde_vehicule_dommage_roue_deux > 0) then {_obj setHitPointDamage ["HitLFWheel", sauvegarde_vehicule_dommage_roue_deux];};};
if (!isnil "sauvegarde_vehicule_dommage_roue_trois") then {if (sauvegarde_vehicule_dommage_roue_trois > 0) then {_obj setHitPointDamage ["HitRBWheel", sauvegarde_vehicule_dommage_roue_trois];};};
if (!isnil "sauvegarde_vehicule_dommage_roue_quatre") then {if (sauvegarde_vehicule_dommage_roue_quatre > 0) then {_obj setHitPointDamage ["HitRFWheel", sauvegarde_vehicule_dommage_roue_quatre];};};
if (!isnil "sauvegarde_vehicule_Degat_reservoir_gasoil") then {if (sauvegarde_vehicule_Degat_reservoir_gasoil > 0) then {_obj setHitPointDamage ["HitFuel", sauvegarde_vehicule_Degat_reservoir_gasoil];};};
if (!isnil "sauvegarde_vehicule_Degat_moteur_un") then {if (sauvegarde_vehicule_Degat_moteur_un > 0) then {_obj setHitPointDamage ["HitEngine", sauvegarde_vehicule_Degat_moteur_un];};};

if (!isnil "sauvegarde_vehicule_Klaxon_Perso") then {if (count sauvegarde_vehicule_Klaxon_Perso > 0) then {_obj setvariable ["voiture_possede_un_klaxon", sauvegarde_vehicule_Klaxon_Perso,true];};};
if (!isnil "sauvegarde_vehicule_Puce") then {if (count sauvegarde_vehicule_Puce > 0) then {_obj setvariable ["voiture_possede_une_puce", sauvegarde_vehicule_Puce,true];};};
if (!isnil "sauvegarde_vehicule_Neon") then {if (count sauvegarde_vehicule_Neon > 0) then {_obj setvariable ["voiture_possede_un_neon", sauvegarde_vehicule_Neon,true];};};
if (!isnil "sauvegarde_vehicule_Radar_De_Recul") then {if (count sauvegarde_vehicule_Radar_De_Recul > 0) then {_obj setvariable ["voiture_possede_un_radar_de_recul", sauvegarde_vehicule_Radar_De_Recul,true];};};
if (!isnil "sauvegarde_vehicule_detecteur_De_Radar") then {if (count sauvegarde_vehicule_detecteur_De_Radar > 0) then {_obj setvariable ["voiture_possede_un_detecteur_de_radar", sauvegarde_vehicule_detecteur_De_Radar,true];};};
if (!isnil "sauvegarde_vehicule_nouveau_poids") then {if (count sauvegarde_vehicule_nouveau_poids > 0) then {_obj setvariable ["voiture_possede_un_nouveau_poids", sauvegarde_vehicule_nouveau_poids,true];};};
if (!isnil "sauvegarde_vehicule_reservoir_d_eau_pour_pompier") then {if (sauvegarde_vehicule_reservoir_d_eau_pour_pompier > 0) then {_obj setvariable ["reservoir_d_eau_pour_pompier", sauvegarde_vehicule_reservoir_d_eau_pour_pompier,true];};};
if (!isnil "sauvegarde_vehicule_prix_du_vehicule_neuf") then {_obj setvariable ["prix_du_vehicule_neuf", sauvegarde_vehicule_prix_du_vehicule_neuf,true];};
if (!isnil "sauvegarde_vehicule_voiture_possede_une_assurance") then {if (sauvegarde_vehicule_voiture_possede_une_assurance > 0) then {_obj setvariable ["voiture_possede_une_assurance", sauvegarde_vehicule_voiture_possede_une_assurance,false]; [_obj] execvm "divers\assurance_des_vehicules\attente_destruction_vehicule_assure.sqf";};};

if (!isnil "sauvegarde_vehicule_Couleur_Vehicule") then
{
	if (count sauvegarde_vehicule_Couleur_Vehicule > 0) then
	{	
		for "_i" from 0 to (count sauvegarde_vehicule_Couleur_Vehicule - 1) do
		{
			if (sauvegarde_vehicule_Couleur_Vehicule select _i != "") then
			{
				_obj setObjectTextureGlobal [_i, sauvegarde_vehicule_Couleur_Vehicule select _i];		
			};
		};
	};
};

if (name player != sauvegarde_vehicule_proprietaire select 0) then
{
	attente_avant_appliquation = nil;
	_valeur_a_surveiller = count sauvegarde_vehicule_proprietaire;
	while {_valeur_a_surveiller >= 1} do
	{
		_la_variable_choisit = sauvegarde_vehicule_proprietaire select _valeur_a_surveiller;
		if (!isnil "_la_variable_choisit") then
		{
			if (name player == _la_variable_choisit) then
			{
				attente_avant_appliquation = sauvegarde_vehicule_proprietaire - [_la_variable_choisit];
			};
		};
		_valeur_a_surveiller = round (_valeur_a_surveiller - 1);
	};
	if (!isnil "attente_avant_appliquation") then {sauvegarde_vehicule_proprietaire = attente_avant_appliquation;};
	sauvegarde_vehicule_proprietaire = [name player] + sauvegarde_vehicule_proprietaire;
	sleep 0.5;
};
_obj setvariable ["vehicule_info_parvariable", sauvegarde_vehicule_proprietaire ,true];
_obj setvariable ["plaque_immatriculation_news", sauvegarde_vehicule_numero_plaque_immatriculation ,true];
_obj spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};

[[[_obj,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

[_pos,_type_pour_position_vehicule] execvm "persistence\voitures\position_des_vehicules.sqf";

// ==========================================================================================================================================================================================
												// SUPPRESSIONS ANCIENNES VALEURS //
// ==========================================================================================================================================================================================
// Mise a jour du tableau de chargement et de la sauvegarde
sauvegarde_vehicules_ordre_de_rangement set [tableau_suppression_trouve_vehicule,-1];
sauvegarde_vehicules_ordre_de_rangement = sauvegarde_vehicules_ordre_de_rangement - [-1];
[uid_sav_voiture_fichier_listes_des_vehicules, "Ordre_De_Rangement", "Ordre De Rangement Vehicules", sauvegarde_vehicules_ordre_de_rangement] call fn_SaveToServer;

// Suppression du véhicule en sauvegarde
[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules_partie_deux] call fn_delete_section;

// Debug local : Suppression
_valeur_debug_un = format ["sauvegarde_type_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
[_valeur_debug_un, nil] call uid_sauvegarde_ecrire_local_joueur_sfp;
_valeur_debug_deux = format ["sauvegarde_position_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
[_valeur_debug_deux, nil] call uid_sauvegarde_ecrire_local_joueur_sfp;
_valeur_debug_trois = format ["sauvegarde_proprietaire_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
[_valeur_debug_trois, nil] call uid_sauvegarde_ecrire_local_joueur_sfp;
_valeur_debug_quatre = format ["sauvegarde_direction_vehicle_%1",sauvegarde_vehicules_nombre_de_vehicules_total];
[_valeur_debug_quatre, nil] call uid_sauvegarde_ecrire_local_joueur_sfp;
_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total = format ["sauvegarde_vehicules_nombre_de_vehicules_total_%1", revive_mon_side];
[_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total, sauvegarde_vehicules_nombre_de_vehicules_total] call uid_sauvegarde_ecrire_local_joueur_sfp;
_cote_de_la_sauvegarde_vehicule_ordre_de_rangement = format ["sauvegarde_vehicules_ordre_de_rangement_%1", revive_mon_side];
[_cote_de_la_sauvegarde_vehicule_ordre_de_rangement, sauvegarde_vehicules_ordre_de_rangement] call uid_sauvegarde_ecrire_local_joueur_sfp;

// ==========================================================================================================================================================================================
																		// FIN CHARGEMENT //
// ==========================================================================================================================================================================================
if (!isnil "il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde") then 
{
	il_y_a_eu_un_bug_au_chargement_de_ma_sauvegarde = nil; 
	hintsilent "Attention, pendant le chargement de vos véhicules, il y à eu un bug, celui ci à été corrigé automatiquement. \n\n Merci de votre compréhension ;) \n\n Attention, si vous utilisez un pseudo avec des guillemets, changez le puisqu'il bloquera automatiquement le script sur les valeurs proprietaires etc.";
	sleep 4;
};

_nom_du_fichier_de_sauvegarde = format ["%1_%2_Historique_des_sauvegardes",getplayeruid player, revive_mon_side];
_heure_de_la_sauvegarde = format ["%1: %2/%3/%4 à %5H%6Min (ARMA :%7): ", name player, heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
[_nom_du_fichier_de_sauvegarde, "Historique chargement et sauvegarde", _heure_de_la_sauvegarde, "Fin du chargement des véhicules !"] call fn_SaveToServer;

if (le_serveur_va_redemarrer_dans_20_minutes < 1) then
{
	nombre_de_vehicule_autorise_max_actuellement = round (nombre_de_vehicule_autorise_max_actuellement - 1);
	['nombre_de_vehicule_autorise_max_actuellement', nombre_de_vehicule_autorise_max_actuellement] call uid_sauvegarde_ecrire_local_joueur_sfp;
	
	hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Fin du chargement de votre véhicule ! \n\n Chargement restant : %1. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", nombre_de_vehicule_autorise_max_actuellement];	
}else
{
	hint "! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Fin du chargement de votre véhicule en illimité ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";	
};

[] call _compilation_reinitialisation_variable_des_vehicules;
