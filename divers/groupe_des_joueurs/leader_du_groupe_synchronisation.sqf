// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_groupe_joueur = _this select 0;
_le_joueur = _this select 1;
if (group player != _le_groupe_joueur) exitwith {};

_le_groupe_joueur selectLeader _le_joueur;
