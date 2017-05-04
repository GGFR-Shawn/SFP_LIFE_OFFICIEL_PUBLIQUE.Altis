// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nomjoueur = _this select 0;
_lasomme = _this select 1;


player setVariable ["mon_argent_poche_by_sfp_maxou",round ((player getvariable "mon_argent_poche_by_sfp_maxou") + _lasomme),true];

hint format ["Vous avez recu %1 Euros du joueur %2 ! \n\n Avant cette somme vous avez %3 Euros ce qui fait donc %4 Euros !",_lasomme,_nomjoueur, (round ((player getvariable "mon_argent_poche_by_sfp_maxou") - _lasomme)) call retour_formatage_chiffre_sfp, (round (player getvariable "mon_argent_poche_by_sfp_maxou")) call retour_formatage_chiffre_sfp];
autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
