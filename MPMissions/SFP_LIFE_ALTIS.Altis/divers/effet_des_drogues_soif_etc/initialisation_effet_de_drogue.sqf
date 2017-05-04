// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != civilian) exitwith {};
waituntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};

player addaction ["<t color=""#ff0000"">" + "Utiliser L'Effet D'Une Drogue", "divers\effet_des_drogues_soif_etc\menu_effets_des_drogues.sqf", [], 1, false, true, "", 
'player getVariable "item_cocaine_poudre_sfp" >= 10 or player getVariable "item_heroine_traite_sfp" >= 10 or player getVariable "item_cannabis_traite_sfp" >= 1 or player getVariable "item_medicaments_sfp" >= 35'
];
