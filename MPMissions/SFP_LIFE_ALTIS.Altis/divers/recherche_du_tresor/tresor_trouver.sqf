// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "sfp_config_tresor_montant_argent_gagne") exitwith {hint "Désolé, le montant du trésor n'est pas défini !";};

hint format ["! TRESOR ! \n ------------------------------------- \n\n Bien joué, tu as trouvé le trésor et remporte donc la somme de %1 Euros ! \n Félicitation ! \n\n ----------------------------------- \n www.sfp-team.fr.nf \n By SFP Maxou",sfp_config_tresor_montant_argent_gagne];

player setVariable["mon_argent_poche_by_sfp_maxou",(player getVariable "mon_argent_poche_by_sfp_maxou") + sfp_config_tresor_montant_argent_gagne,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

[[[name player, sfp_config_tresor_montant_argent_gagne],"divers\recherche_du_tresor\message_tresor_somme_trouve.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

deletevehicle jai_trouve_le_tresor;