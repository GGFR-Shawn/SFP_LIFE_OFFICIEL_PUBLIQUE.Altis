// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = _this select 0;
_le_joueur = _this select 1;
if (isnil "_le_vehicule" or isnil "_le_joueur") exitwith {hint "Erreur, recommence ...";};

_le_vehicule setVelocity [(velocity (_le_joueur) select 0)+(sin direction (_le_joueur) * 2),(velocity (_le_joueur) select 1)+(cos direction (_le_joueur) * 2),(velocity (_le_joueur) select 2)];