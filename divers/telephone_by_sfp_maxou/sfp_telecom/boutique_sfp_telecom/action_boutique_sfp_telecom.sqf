// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_action_telecom_option_maxou_choisit = _this select 0 select 1;
_choix_selection_de_l_option = sfp_config_liste_des_forfaits_telecoms select _action_telecom_option_maxou_choisit;
if (isnil "_action_telecom_option_maxou_choisit") exitwith {hint "Erreur, recommence ...";};

_son_nom_sfp_telecom = _choix_selection_de_l_option select 0;
_son_prix_sfp_telecom = _choix_selection_de_l_option select 1;
_son_nombres_de_sms_sfp_telecom = _choix_selection_de_l_option select 2;

hint format ["! SFP TELECOM !\n ------------------------------------- \n Bonjour, \n\n SFP TELECOM est heureux de vous annoncer la bonne reception du choix de votre forfait. \n\n Voici un récapitulatif : \n - %1. \n - Prix : %2 %3. \n - Nombres SMS : %4. \n\n A bientot chez SFP TELECOM !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr", _son_nom_sfp_telecom, _son_prix_sfp_telecom, "€", _son_nombres_de_sms_sfp_telecom];

player setvariable ["je_possede_un_telephone_sfp", [1, 1, _son_nombres_de_sms_sfp_telecom], true];
player setVariable ['mon_argent_banque_by_sfp_maxou', (player getvariable "mon_argent_banque_by_sfp_maxou") - _son_prix_sfp_telecom,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

closedialog 0;