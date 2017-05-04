// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; alive player};
waituntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};
if (revive_mon_side == west) exitwith {};
if (!sfp_config_autoriser_cambriolages_maisons) exitwith {};

// ------------------------------------------------------- Initialisation ------------------------------------------------------------- //

sleep 0.02;
player addaction ["<t color=""#ff0000"">" + "Cambrioler cette maison", "divers\cambriolage\cambriolage_essai.sqf", [], 1, false, true, "", 
"typeOf cursorTarget in sfp_config_listes_des_maisons_cambriolables && alive cursorTarget && cursorTarget distance player < 8"
];
sleep 0.02;