// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
														
		// ATTENTION, LAISSER DANS CET ORDRE //		// ATTENTION, LAISSER DANS CET ORDRE //		// ATTENTION, LAISSER DANS CET ORDRE //

[] execvm "config\init_config_sfp.sqf";
[] call compile preProcessFile "partie_serveur\persistence\players\s_serverGather.sqf";
waitUntil {sleep 1; diag_log "Diag SFP : Attente fin fin_server_gather."; !isnil "fin_server_gather"};

[] execVM "partie_serveur\serverID.sqf";
[] execvm "partie_serveur\heure_serveur.sqf";
waitUntil {sleep 1; diag_log "Diag SFP : Attente heure serveur."; !isnil "heure_serveur"};

[] execVM "partie_serveur\persistence\world\maison\oLoad_maisons.sqf";
[] execVM "partie_serveur\persistence\world\sauvegarde_plantes_illegales_non_recoltee_news\oLoad_plante_illegales.sqf";
[] execVM "partie_serveur\persistence\world\sauvegarde_coffre_fort_nouvelle\oLoad_coffre_fort_nouvelle.sqf";
[] execVM "partie_serveur\persistence\world\voitures_securite_si_serveur_plante\oLoad_voitures_securite_serveur_plante.sqf";
[] execVM "partie_serveur\persistence\world\sauvegarde_objets_decorateur\oLoad_objets_decorateur.sqf";

[] execvm "partie_serveur\divers_propre\creation_des_whitelists\creation_des_whitelists_gendarmes_etc.sqf";

[] execvm "partie_serveur\divers_propre\spawn_marche_noir\creation_du_marche_noir_aleatoire.sqf";

[] execvm "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\kebabs_nourriture\creer_les_kebabs.sqf";
[] execvm "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\points_de_collectes\chargement_des_points_de_collectes.sqf";
[] execvm "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\medecin\creer_les_medecins.sqf";
[] execvm "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\antenne_sfp_telecom\blackout_reseau_sfp_telecom.sqf";
[sfp_config_nombre_max_antennes_telecom,[20000,-20000]] execVM "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\antenne_sfp_telecom\systeme_de_reseau_creation_des_antennes.sqf";

[] execvm "partie_serveur\historiques_des_vehicules\initialisation_historiques_des_vehicules.sqf";

[] execVM "partie_serveur\sarl_pompier\sarl_pompier_serveur\choix_mission_pompier.sqf";

[] execVM "partie_serveur\sarl_depannage\missions_aleatoires\choix_mission_dir.sqf";

[] execvm "partie_serveur\divers_propre\chasse_au_bots\serveur\initialisation_chasse_aux_bots_serveur.sqf";

[] execvm "partie_serveur\divers_propre\recherche_du_tresor\init_recherche_du_tresor_serveur.sqf";

[] execvm "partie_serveur\divers_propre\spawn_coffre_armes_etc\init_spawn_armes_coffre_serveur.sqf";

[] execvm "partie_serveur\divers_propre\reception_des_publicvariables\init_reception_des_publicvariables.sqf";

[] execvm "partie_serveur\divers\tremblement_de_terre.sqf";

[] execvm "partie_serveur\divers\patrouille_de_france.sqf";

[] execvm "partie_serveur\divers_propre\cameras_de_video_surveillance\creation_poteaux_envoi_informations.sqf";

[] spawn 
{
	waitUntil {!isNil "autorisation_bis_fnc_mp"};
	"BIS_fnc_MP_packet" addPublicVariableEventHandler compileFinal preprocessFileLineNumbers "divers\anti_hack_bis_fnc_mp.sqf";
};

"je_peux_demarre_un_go_fast_headless" addPublicVariableEventHandler {[] spawn {sleep (round 60 * 10); je_peux_demarre_un_go_fast = nil; publicvariable "je_peux_demarre_un_go_fast"; diag_log "Diag SFP : GoFast de nouveau autorisé.";};};

[] execvm "partie_serveur\anti_hack\anti_hack_kikou_initialisation.sqf";
[] execvm "partie_serveur\anti_hack\ban_automatique_si_hack_etc.sqf";
[] execvm "partie_serveur\anti_hack\protection_hackeur_bombe.sqf";
[] execvm "partie_serveur\divers_propre\prix_du_farming\prix_du_farming.sqf";
[] execvm "partie_serveur\divers\annonce_du_serveur.sqf";
[] execvm "partie_serveur\divers_propre\divers\creation_objets_cause_addons.sqf";
[] execvm "partie_serveur\divers_propre\divers\nettoyage_du_serveur.sqf";
[] execvm "partie_serveur\divers_propre\divers\spawn_voiture_offerte.sqf";
[] execvm "partie_serveur\divers_propre\divers\spawn_objet_recompense.sqf";
[] execvm "partie_serveur\divers_propre\divers\spawn_vie_vehicule.sqf";
[] execvm "partie_serveur\divers_propre\gang\prise_de_camp\creation_prise_de_gang.sqf";
[] execvm "partie_serveur\divers_propre\divers\delai_braquage_server.sqf";
[] execvm "partie_serveur\divers_propre\divers\creation_argent_gendarmerie.sqf";

[] execvm "partie_serveur\divers_propre\divers\meteo_sfp_serveur.sqf";
waitUntil {sleep 1; diag_log "Diag SFP : Attente fin meteo."; !isnil "fin_initialisation_meteo_sfp"};

[] execvm "partie_serveur\divers_propre\divers\destruction_de_maison_et_grue.sqf";

[] execvm "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\points_de_transformation_etc\chargement_des_points_de_transformation_etc.sqf";

patron_des_ressources_du_serveur = 12; 
publicvariable "patron_des_ressources_du_serveur";
