// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {player getvariable "joueur_menotte"}) exitwith {hint "Désolé, tu ne peux pas car tu es menotté !";};

_animation_selectionne = sfp_config_listes_des_animations_sfp select (lbCurSel 1500) select 1;
_configuration_switch = sfp_config_listes_des_animations_sfp select (lbCurSel 1500) select 2;
if (isnil "_animation_selectionne" or isnil "_configuration_switch") exitwith {hint "Erreur dialogue, recommence ...";};
if !(IsClass (configFile  >> "CfgMovesMaleSdr" >> "States" >> _animation_selectionne)) exitwith {hint "Désolé, vous n'avez pas le launcher pour jouer cette animation !";};

[[[player,_animation_selectionne, _configuration_switch],"divers\faire_les_animations\synchro_animation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;