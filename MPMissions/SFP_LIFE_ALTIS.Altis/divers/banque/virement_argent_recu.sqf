// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_nom_joueur_transfert_argent", "_nom_joueur_recoit_argent","_montant_argent_transfere"];
_nom_joueur_transfert_argent = _this select 0;
_nom_joueur_recoit_argent = _this select 1;
_montant_argent_transfere = _this select 2;
if (isnil "_nom_joueur_transfert_argent" or isnil "_nom_joueur_recoit_argent" or isnil "_montant_argent_transfere") exitwith {hint "Erreur virement reçu";};
if (name player != _nom_joueur_recoit_argent) exitwith {};

player setVariable ['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') + _montant_argent_transfere),true]; 
autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 

hint format[" %1 euros a été transféré sur votre compte de la part de %2 !",_montant_argent_transfere, _nom_joueur_transfert_argent];
