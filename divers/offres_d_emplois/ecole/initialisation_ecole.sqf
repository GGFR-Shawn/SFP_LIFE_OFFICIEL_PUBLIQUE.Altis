// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


createDialog "FaireDesEtudes";
ctrlSetText[11120,format["       Argent En Banque : %1",(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp]];

lbAdd[11121,"Obtenir le BEP MECANIQUE : 400 Euros"];
lbAdd[11121,"Obtenir le BEPC : 460 Euros"];
lbAdd[11121,"Obtenir le BAC GENERAL : 540 Euros"];
lbAdd[11121,"Obtenir le BAC PRO : 670 Euros"];
lbAdd[11121,"Obtenir le BTS : 810 Euros"];
lbAdd[11121,"Obtenir le DEUG : 1200 Euros"];



