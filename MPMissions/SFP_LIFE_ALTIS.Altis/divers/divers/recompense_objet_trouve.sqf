// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_montant_de_la_recompense = sfp_config_montant_recompense_statut_a_trouver;
_l_objet_de_la_recompense = nearestObjects [getPosATL player, ['Land_Maroula_F'], 3];
if (count _l_objet_de_la_recompense < 1) exitwith {hint "Erreur, recommence ...";}; 

deletevehicle (_l_objet_de_la_recompense select 0);

player setVariable ['mon_argent_poche_by_sfp_maxou', (player getvariable "mon_argent_poche_by_sfp_maxou") + _montant_de_la_recompense,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

hint format ["! RECOMPENSE ! \n --------------------------------------  \n\n Félicitation %1, \n\n Tu as trouvé l'objet caché et remporte donc %2 %3 ! \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou", name player, (_montant_de_la_recompense) call retour_formatage_chiffre_sfp, "€"];

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_log = format ["%1 a trouve la recompense.", name player];
["Historique Objet Recompense", "Historique Objet Recompense", _heure_du_log, _detail_du_log] call fn_SaveToServer;
