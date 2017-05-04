// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "sfp_config_liste_des_plantes_illegale") exitwith {hint "Désolé, la liste des plantes illégales est inconnue ...";};
if !(typeOf cursorTarget in sfp_config_liste_des_plantes_illegale) exitwith {hint "Tu n'as pas pointé ta souris sur une plante !";};

_ma_plante_illegale = cursortarget;

_ma_plante_illegale attachTo [player,[0,3,0.4]];
deplacer_plante = 1;

waituntil {sleep 0.1;deplacer_plante < 1};
detach _ma_plante_illegale;
