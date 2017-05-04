// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_numero_de_transfert = lbCurSel 11165;
_nomdujoueur = lbtext [11165, _numero_de_transfert];
_position_sortie_de_garde_a_vue = getPosATL player;

[[[_nomdujoueur, _position_sortie_de_garde_a_vue],"divers\gendarmerie\garde_a_vue\ok_joueur_sortie.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

closeDialog 0;