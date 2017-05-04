// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_joueur = cursortarget;
_mon_argent_sfp = player getvariable "mon_argent_poche_by_sfp_maxou";
_son_argent_sfp = cursortarget getvariable "mon_argent_poche_by_sfp_maxou";
if (isnil "_le_joueur" or isnil "_mon_argent_sfp" or isnil "_son_argent_sfp") exitwith {hint "Erreur, contact Maxou.";};
if (_son_argent_sfp <= 0) exitwith {hint format ["Vous avez prit les %1 %2 de %3 ! \n\n Vous avez maintenant %4 %2.", (_son_argent_sfp) call retour_formatage_chiffre_sfp, "€", name _le_joueur, (_mon_argent_sfp + _son_argent_sfp) call retour_formatage_chiffre_sfp];	};

player setvariable ["mon_argent_poche_by_sfp_maxou",_mon_argent_sfp + _son_argent_sfp, true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 

hint format ["Vous avez prit les %1 %2 de %3 ! \n\n Vous avez maintenant %4 %2.", (_son_argent_sfp) call retour_formatage_chiffre_sfp, "€", name _le_joueur, (_mon_argent_sfp + _son_argent_sfp) call retour_formatage_chiffre_sfp];	

[[[_le_joueur, _son_argent_sfp, player],"divers\divers\braquer_argent_joueur_avertir.sqf"],"BIS_fnc_execVM",_le_joueur,false] spawn BIS_fnc_MP;
