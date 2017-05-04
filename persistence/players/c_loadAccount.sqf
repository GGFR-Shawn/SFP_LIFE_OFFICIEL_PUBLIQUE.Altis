// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {alive player};
waitUntil {!isNil "serverID"};
waitUntil {!isNil "finintro"};

if !(isServer) then {jai_le_droit_de_me_tp = 1; player setpos (getmarkerpos "respawn_civilian"); player setdir 168; cutText["","BLACK IN"];};

// Lancer un chargement de sauvegarde pour savoir si joueur à déja une sauvegarde et/ou n'a pas besoin de relecture
[uid_unique_pour_la_sauvegarde, uid_unique_pour_la_sauvegarde, "ma_date_de_naissance", "test_valeur_existe"] call LoadToServer;  
[uid_unique_pour_la_sauvegarde, uid_unique_pour_la_sauvegarde, "dernier_speudo_utiliser_news", "test_valeur_existe"] call LoadToServer;  

_temps_attente = 5;
while {(isnil "ma_date_de_naissance_confirme" or isnil "relire_toute_ma_sauvegarde_confirme") && isnil "passer_verification_sauvegarde"} do 
{
	if (_temps_attente <= 0) then 
	{
		passer_verification_sauvegarde = true;
	}; 
	sleep 1; 
	_temps_attente = round (_temps_attente - 1);
}; 
passer_verification_sauvegarde = nil;

// Verifier si joueur à une amende ou un remboursement
[] spawn
{
	waituntil {!isnil "fin_verification_apres_chargement"}; sleep 1;
	if (player getvariable "ma_date_de_naissance" <= 2) exitwith {};
	
	[uid_pour_mettre_amende, uid_pour_mettre_amende, "Montant de l amende", "test_valeur_existe"] call LoadToServer;  sleep 5;
	if (player getvariable "montant_de_l_amende" >= 1) then 
	{
		[uid_pour_mettre_amende, uid_pour_mettre_amende, "Message amende", "test_valeur_existe"] call LoadToServer; 
		[uid_pour_mettre_amende, uid_pour_mettre_amende, "Historique nombre amende", "test_valeur_existe"] call LoadToServer; 
	};

	[uid_pour_remboursement, uid_pour_remboursement, "Montant du remboursement", "test_valeur_existe"] call LoadToServer;  sleep 5;
	if (player getvariable "montant_du_remboursement" >= 1) then 
	{
		[uid_pour_remboursement, uid_pour_remboursement, "Message remboursement", "test_valeur_existe"] call LoadToServer; 
		[uid_pour_remboursement, uid_pour_remboursement, "Historique nombre remboursement", "test_valeur_existe"] call LoadToServer; 
	};
};

// Charger reste de la sauvegarde
[] spawn
{
	waituntil {sleep 0.1; !isnil "fin_verification_apres_chargement"}; sleep 1;

	// Exit car aucune valeur et remise à zéro du profil local
	if (player getvariable "ma_date_de_naissance" <= 2) exitwith 
	{
		[] spawn {sleep 10; for "_i" from 0 to 2 do {systemchat "Initialisation de votre sauvegarde en tant que nouveau joueur ..."; sleep 3;};};
		
		_valeur_a_effacer = [
							  "sauvegarde_vehicules_nombre_de_vehicules_total_CIV","sauvegarde_vehicules_nombre_de_vehicules_total_WEST","sauvegarde_vehicules_ordre_de_rangement_CIV","sauvegarde_vehicules_ordre_de_rangement_WEST","niveau_de_faim","fautdormir","toilette_by_sfp_maxou","niveau_de_soif","thirstLevel_cafe",
							  "damage_player","joueur_menotte","evade_de_prison","joueur_arreter","j_ai_un_antibiotique","je_suis_malade_a_la_sauvegarde","historique_messages_nom_joueur_by_maxou",
							  "experience_transformation_cocaine","license_permis_de_conduire_by_sfp_maxou","combien_de_point_by_sfp_maxou",
							  "license_permis_de_conduire_poids_lourd_by_sfp_maxou","license_pilote_news","licence_bateau_news","licence_fusils","permis_port_d_arme","licence_heroine","licence_cannabis",
							  "licence_gang_v2","permis_de_chasse","licence_petrole","recherche_pour_armes_illegales","recherche_pour_conduite_sans_permis","jai_fait_un_cambriolage_news","recherche_pour_braquage","infraction_wanted_liste",
							  "barredecereale","bouteilledeau","poignard_item","corde_et_sac","brouilleur_sacoche_c4","cocktail_molotov","redbull","canne_a_peche","tente_pour_dormir","seau_plante_illegal","valise_pour_le_farming","coffre_fort","bidon_d_essence",
							  "gants_pour_petrole","pied_de_biche","hache_pour_coupe_de_bois","harpon_pour_la_peche","gelule_amphetamines","temps_fatigue_niveau_1","temps_fatigue_niveau_2","temps_fatigue_niveau_3","temps_fatigue_niveau_4",
							  "temps_fatigue_niveau_5","license_BAC_PRO","license_BTS","license_BEPC","license_BAC_GENERAL","license_DEUG","license_BEP_Mecanique","sarl_car_shop","sarl_depannage","sarl_pompier","sarl_autoecole","sarl_taxis_gsept",
							  "sarl_neomedia","sarl_avocat","ma_mutuelle_niveau_10_pour_cent","ma_mutuelle_niveau_vingt_cinq_pour_cent","ma_mutuelle_niveau_cinquante_pour_cent","ma_mutuelle_niveau_soixante_quinze_pour_cent","ma_mutuelle_niveau_cent_pour_cent",
							  "getPosATL_vehicle_player","direction_vehicle_player","traceur_vehicule","boite_allumette","temps_avant_d_avoir_un_chargement_gratuit","sacoche_de_c4","marteau_sfp","etat_verrou_du_groupe_sfp",
							  "ma_carte_identite","mon_dernier_vehicule_achete","licence_fusils_illegaux",sfp_config_famille_une_nom_pour_variable, sfp_config_famille_deux_nom_pour_variable, "niveau_force","mon_repertoire_de_telephone","mon_numero_de_telephone","mon_niveau_secouriste",
							  "corde_descente_rappel_sfp"
							];
							
		for "_i" from 0 to count (_valeur_a_effacer) - 1 do {[(_valeur_a_effacer select _i), nil] call uid_sauvegarde_ecrire_local_joueur_sfp; sleep 0.001;};
	};
	
	if (relire_toute_ma_sauvegarde == "oui") then
	{
		[] spawn 
		{
			for "_i" from 0 to 6 do 
			{
				systemchat "Re lecture de votre sauvegarde obligatoire lors de la beta ...";
				sleep 1;
			};
		};
	};

// =======================================================================================================================================================================================
																		// SERVEUR //
// =======================================================================================================================================================================================
	[uid_unique_pour_la_sauvegarde, uid_unique_pour_la_sauvegarde, "mes_pseudos_utilises", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_pour_la_sauvegarde, uid_unique_pour_la_sauvegarde, "Livret A", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_pour_la_sauvegarde, uid_unique_pour_la_sauvegarde, "Argent Poche", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_pour_la_sauvegarde, uid_unique_pour_la_sauvegarde, "Argent Banque", "test_valeur_existe"] call LoadToServer; 

	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "nombre_de_permis", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "Revive_news", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "liste_de_mes_maisons", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "credit_sfp_sauvegarde", "test_valeur_existe"] call LoadToServer; 
	
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "usedspace", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "totalspace", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_poissons_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "itemfishpoissonspanes", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_truffe_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_bois_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_lapins_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_heroine_non_traite_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_cuivre_non_transforme_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_cuivre_transforme_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_heroine_traite_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_plante_pour_planter", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_plante_fertilisant_rouge", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_baleine_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_requin_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_plante_illegale_prete_a_vendre_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_cocaine_feuille_coca_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_cocaine_poudre_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_cannabis_non_traite_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_cannabis_traite_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_medicaments_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_organes_animaux_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_pomme_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_sel_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_pomme_de_terre_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_or_transforme_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_or_non_transforme_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_petrole_non_traite_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "item_petrole_traite_sfp", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "serpent_non_transforme", "test_valeur_existe"] call LoadToServer; 
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "serpent_transforme", "test_valeur_existe"] call LoadToServer; 

// =======================================================================================================================================================================================
																			// LOCAL SINON SERVEUR //
// =======================================================================================================================================================================================
	_valeur = ['joueur_arreter'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["joueur_arreter", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "joueur_arreter", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['je_suis_malade_a_la_sauvegarde'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["je_suis_malade_a_la_sauvegarde", _valeur, true]; execvm "divers\maladie\init_maladie_si_sauvegarde_affirmatif.sqf";};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "je_suis_malade_a_la_sauvegarde", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['joueur_menotte'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["joueur_menotte", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "Joueur Menotte", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['evade_de_prison'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["evade_de_prison", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "evade_de_prison", "test_valeur_existe"] call LoadToServer; };
	
	_valeur = ['experience_transformation_cocaine'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["experience_transformation_cocaine", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "Experience Cocaine", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_permis_de_conduire_by_sfp_maxou'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_permis_de_conduire_by_sfp_maxou", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "License permis de conduire", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['combien_de_point_by_sfp_maxou'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["combien_de_point_by_sfp_maxou", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "Point permis de conduire", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_permis_de_conduire_poids_lourd_by_sfp_maxou'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_permis_de_conduire_poids_lourd_by_sfp_maxou", _valeur, true];};} else {	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "License permis lourd", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_pilote_news'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["license_pilote_news", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "license_pilote_news", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['licence_bateau_news'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["licence_bateau_news", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "licence_bateau_news", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['licence_fusils'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["licence_fusils", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "licence_fusils", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['licence_fusils_illegaux'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["licence_fusils_illegaux", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "licence_fusils_illegaux", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['permis_port_d_arme'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["permis_port_d_arme", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "permis_port_d_arme", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['licence_heroine'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["licence_heroine", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "licence_heroine", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['licence_cannabis'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["licence_cannabis", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "licence_cannabis", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['licence_gang_v2'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["licence_gang_v2", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "licence_gang_v2", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['permis_de_chasse'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["permis_de_chasse", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "permis_de_chasse", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['licence_petrole'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["licence_petrole", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "licence_petrole", "test_valeur_existe"] call LoadToServer; };

	_valeur = ['jai_fait_un_cambriolage_news'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["jai_fait_un_cambriolage_news", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "jai_fait_un_cambriolage_news", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['recherche_pour_armes_illegales'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["recherche_pour_armes_illegales", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "recherche_pour_armes_illegales", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['recherche_pour_braquage'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["recherche_pour_braquage", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "recherche_pour_braquage", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['recherche_pour_conduite_sans_permis'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["recherche_pour_conduite_sans_permis", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "recherche_pour_conduite_sans_permis", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['infraction_wanted_liste'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (count _valeur >= 1) then {player setVariable ["infraction_wanted_liste", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "infraction_wanted_liste", "test_valeur_existe"] call LoadToServer; };

	_valeur = ['corde_descente_rappel_sfp'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["corde_descente_rappel_sfp", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "corde_descente_rappel_sfp", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['boite_allumette'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["boite_allumette", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "boite_allumette", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['marteau_sfp'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["marteau_sfp", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "marteau_sfp", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['barredecereale'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["barredecereale", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "barredecereale", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['bouteilledeau'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["bouteilledeau", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "bouteilledeau", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['traceur_vehicule'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["traceur_vehicule", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "traceur_vehicule", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['poignard_item'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["poignard_item", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "poignard_item", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['corde_et_sac'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["corde_et_sac", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "corde_et_sac", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['cocktail_molotov'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["cocktail_molotov", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "cocktail_molotov", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['brouilleur_sacoche_c4'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["brouilleur_sacoche_c4", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "brouilleur_sacoche_c4", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['sacoche_de_c4'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["sacoche_de_c4", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sacoche_de_c4", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['redbull'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["redbull", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "redbull", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['canne_a_peche'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["canne_a_peche", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "canne_a_peche", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['tente_pour_dormir'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["tente_pour_dormir", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "tente_pour_dormir", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['seau_plante_illegal'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["seau_plante_illegal", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "seau_plante_illegal", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['valise_pour_le_farming'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["valise_pour_le_farming", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "valise_pour_le_farming", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['coffre_fort'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["coffre_fort", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "coffre_fort", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['bidon_d_essence'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["bidon_d_essence", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "bidon_d_essence", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['gants_pour_petrole'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["gants_pour_petrole", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "gants_pour_petrole", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['pied_de_biche'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["pied_de_biche", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "pied_de_biche", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['hache_pour_coupe_de_bois'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["hache_pour_coupe_de_bois", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "hache_pour_coupe_de_bois", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['harpon_pour_la_peche'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["harpon_pour_la_peche", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "harpon_pour_la_peche", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['gelule_amphetamines'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["gelule_amphetamines", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "gelule_amphetamines", "test_valeur_existe"] call LoadToServer; };
	
	_valeur = ['temps_fatigue_niveau_1'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["temps_fatigue_niveau_1", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "temps_fatigue_niveau_1", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['temps_fatigue_niveau_2'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["temps_fatigue_niveau_2", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "temps_fatigue_niveau_2", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['temps_fatigue_niveau_3'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["temps_fatigue_niveau_3", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "temps_fatigue_niveau_3", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['temps_fatigue_niveau_4'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["temps_fatigue_niveau_4", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "temps_fatigue_niveau_4", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['temps_fatigue_niveau_5'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["temps_fatigue_niveau_5", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "temps_fatigue_niveau_5", "test_valeur_existe"] call LoadToServer; };
	
	_valeur = ['niveau_force'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["niveau_force", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "niveau_force", "test_valeur_existe"] call LoadToServer; };
	
	_valeur = ['license_BAC_PRO'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_BAC_PRO", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "license_BAC_PRO", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_BTS'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_BTS", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "license_BTS", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_BEPC'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_BEPC", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "license_BEPC", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_BAC_GENERAL'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_BAC_GENERAL", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "license_BAC_GENERAL", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_DEUG'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_DEUG", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "license_DEUG", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['license_BEP_Mecanique'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["license_BEP_Mecanique", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "license_BEP_Mecanique", "test_valeur_existe"] call LoadToServer; };

	_valeur = ['sarl_car_shop'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["sarl_car_shop", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sarl_car_shop", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['sarl_depannage'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["sarl_depannage", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sarl_depannage", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['sarl_pompier'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["sarl_pompier", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sarl_pompier", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['sarl_autoecole'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["sarl_autoecole", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sarl_autoecole", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['sarl_taxis_gsept'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["sarl_taxis_gsept", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sarl_taxis_gsept", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['sarl_neomedia'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["sarl_neomedia", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sarl_neomedia", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['sarl_avocat'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable ["sarl_avocat", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "sarl_avocat", "test_valeur_existe"] call LoadToServer; };

	_valeur = [sfp_config_famille_une_nom_pour_variable] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable [sfp_config_famille_une_nom_pour_variable, _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, sfp_config_famille_une_nom_pour_variable, "test_valeur_existe"] call LoadToServer; };
	_valeur = [sfp_config_famille_deux_nom_pour_variable] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur) then {player setVariable [sfp_config_famille_deux_nom_pour_variable, _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, sfp_config_famille_deux_nom_pour_variable, "test_valeur_existe"] call LoadToServer; };

	_valeur = ['ma_mutuelle_niveau_10_pour_cent'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["ma_mutuelle_niveau_10_pour_cent", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "ma_mutuelle_niveau_10_pour_cent", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['ma_mutuelle_niveau_vingt_cinq_pour_cent'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["ma_mutuelle_niveau_vingt_cinq_pour_cent", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "ma_mutuelle_niveau_vingt_cinq_pour_cent", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['ma_mutuelle_niveau_cinquante_pour_cent'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["ma_mutuelle_niveau_cinquante_pour_cent", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "ma_mutuelle_niveau_cinquante_pour_cent", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['ma_mutuelle_niveau_soixante_quinze_pour_cent'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["ma_mutuelle_niveau_soixante_quinze_pour_cent", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "ma_mutuelle_niveau_soixante_quinze_pour_cent", "test_valeur_existe"] call LoadToServer; };
	_valeur = ['ma_mutuelle_niveau_cent_pour_cent'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (_valeur >= 1) then {player setVariable ["ma_mutuelle_niveau_cent_pour_cent", _valeur, false];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "ma_mutuelle_niveau_cent_pour_cent", "test_valeur_existe"] call LoadToServer; };

	_valeur = ['ma_carte_identite'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (count _valeur >= 1) then {player setvariable ["ma_carte_identite",_valeur,true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "ma_carte_identite", "test_valeur_existe"] call LoadToServer; };

	_valeur = ['je_possede_un_telephone_sfp'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && relire_toute_ma_sauvegarde == "non") then {if (count _valeur > 0) then {player setVariable ["je_possede_un_telephone_sfp", _valeur, true];};} else {[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "je_possede_un_telephone_sfp", "test_valeur_existe"] call LoadToServer; };

// =======================================================================================================================================================================================
																				// LOCAL ONLY //
// =======================================================================================================================================================================================
	_valeur = ['distance_de_vue_pied'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {setViewDistance _valeur; distance_de_vue_pied = _valeur;};};
	_valeur = ['distance_de_vue_voiture'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {setViewDistance _valeur; distance_de_vue_voiture = _valeur;};};
	_valeur = ['distance_de_vue_air'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {setViewDistance _valeur; distance_de_vue_air = _valeur;};};
	_valeur = ['distance_de_vue_ombrage'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {setObjectViewDistance [_valeur, _valeur]; distance_de_vue_ombrage = _valeur;};}else{setObjectViewDistance [500,100];};
	_valeur = ['graphique_terrain'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {setTerrainGrid _valeur;};}else{setTerrainGrid 50;};

	_valeur = ['sfp_config_armes_autorisation_effet'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (count _valeur > 0) then {sfp_config_armes_autorisation_effet = _valeur;};};
	
	_valeur = ['j_ai_un_antibiotique'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur) then {player setVariable ["j_ai_un_antibiotique", _valeur, false];};};
	_valeur = ['niveau_de_faim'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {player setVariable ["niveau_de_faim", _valeur, false];};};
	_valeur = ['mon_niveau_secouriste'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 1) then {player setVariable ["mon_niveau_secouriste", _valeur, false];};};
	_valeur = ['fautdormir'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {player setVariable ["fautdormir", _valeur, false];};};
	_valeur = ['toilette_by_sfp_maxou'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur >= 0) then {player setVariable ["toilette_by_sfp_maxou", _valeur, false];};};
	_valeur = ['niveau_de_soif'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0 && _valeur != 100) then {niveau_de_soif = _valeur;};};
	_valeur = ['thirstLevel_cafe'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {player setVariable ["thirstLevel_cafe", _valeur, false];};};
	_valeur = ['damage_player'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur != 1) then {player setDamage _valeur;};};

	_valeur = ['personne_dans_mon_groupe'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (count _valeur >= 1) then {personne_dans_mon_groupe = _valeur;};} else {personne_dans_mon_groupe = [];};
	_valeur = ['etat_verrou_du_groupe_sfp'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {player setVariable ["etat_verrou_du_groupe_sfp", _valeur, true];};};

	_valeur = ['historique_messages_nom_joueur_by_maxou'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (count _valeur >= 2) then {historique_messages_nom_joueur_by_maxou = _valeur;};};
		
	_valeur = ['mon_repertoire_de_telephone'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {mon_repertoire_de_telephone = _valeur;}else{_mon_repertoire_telephonique = format ['06%1%2%3%4%5%6%7%8', round (random 9),round (random 9),round (random 9),round (random 9),round (random 9),round (random 9),round (random 9),round (random 9)]; mon_repertoire_de_telephone = [[_mon_repertoire_telephonique, name player]]; ['mon_repertoire_de_telephone', mon_repertoire_de_telephone] call uid_sauvegarde_ecrire_local_joueur_sfp;};
	_valeur = ['mon_numero_de_telephone'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {player setvariable ["mon_numero_de_telephone",_valeur,true];}else{[] spawn {waitUntil {!isnil "mon_repertoire_de_telephone"}; player setvariable ["mon_numero_de_telephone", mon_repertoire_de_telephone select 0 select 0,true]; ['mon_numero_de_telephone', mon_repertoire_de_telephone select 0 select 0] call uid_sauvegarde_ecrire_local_joueur_sfp;};};
	
	_valeur = ['mon_dernier_vehicule_achete'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {mon_dernier_vehicule_achete = _valeur;};

	_valeur = ['getPosATL_vehicle_player'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && !isserver) then {if (count _valeur > 0) then {jai_le_droit_de_me_tp = 1; player setPos _valeur};};
	_valeur = ['direction_vehicle_player'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur" && !isserver) then {player setDir _valeur;};
	
	[] spawn 
	{
		sleep 5; [uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "integralite_items", "test_valeur_existe"] call LoadToServer; 
		sleep 5; {if !(_x in (assignedItems player)) then{player addItem _x; player assignitem _x;};} foreach ["ItemMap","ItemCompass","ItemWatch"];
		if !("itemgps" in (assignedItems player) or "B_UavTerminal" in (assignedItems player)) then {player addweapon "itemgps";};
	};
};

//======================================================================================================================================================================

if (!isServer) then 
{
	_message_intro_un = format ["Paris : %1:%2:%3 H",heure_serveur select 3, heure_serveur select 4, round (random 60)];
	_message_intro_deux = format ["Altis : %1 H",[daytime] call BIS_fnc_TimeToString];
	["Altis",_message_intro_un,_message_intro_deux] spawn BIS_fnc_infoText; 
	sleep 0.3;
	_choix_un = [-10, 10] call BIS_fnc_selectRandom;
	_choix_deux = [-10, 10] call BIS_fnc_selectRandom;
	_choix_trois = [-10, 10] call BIS_fnc_selectRandom;
	if ((dayTime > 20 && dayTime < 23.99) or (dayTime >= 0 && dayTime < 6)) then {camUseNVG true;}else{camUseNVG false;};showCinemaBorder true;_creation_camera_sfp_maxou = "camera" camCreate [(getPosATL player select 0) + (random _choix_un), (getPosATL player select 1) + (random _choix_deux),(getPosATL player select 2) + (random _choix_trois)];_creation_camera_sfp_maxou cameraEffect ["internal","back"]; _creation_camera_sfp_maxou camSetFOV 1;_creation_camera_sfp_maxou camCommit 0;
	waitUntil {camCommitted _creation_camera_sfp_maxou};
	_creation_camera_sfp_maxou camSetTarget vehicle player;_creation_camera_sfp_maxou camSetRelPos [0,-0.8,2.2];_creation_camera_sfp_maxou camCommit 6;
	waitUntil {camCommitted _creation_camera_sfp_maxou};
	_creation_camera_sfp_maxou cameraEffect ["terminate","back"];camDestroy _creation_camera_sfp_maxou;
	systemchat format "Cette mission est téléchargable sur www.sfpteam.fr !";
};

execvm "divers\divers\accueil_phase_rp_en_bateau.sqf";
execvm "persistence\players\c_savePlayerToServer.sqf";
execVM "divers\divers\verifier_argent_apres_chargement_sauvegarde.sqf";
execVM "persistence\players\appliquer_variable_apres_chargement_si_inconnu.sqf";