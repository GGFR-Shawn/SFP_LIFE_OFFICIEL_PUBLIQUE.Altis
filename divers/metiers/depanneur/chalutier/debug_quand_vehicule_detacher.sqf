// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = _this select 0;
if (isnil "_le_vehicule") exitwith {};

_le_vehicule setVelocity [((velocity _le_vehicule) select 0)+(sin (direction _le_vehicule)* 0.25),((velocity _le_vehicule) select 1)+(cos (direction _le_vehicule)* 0.25),((velocity _le_vehicule) select 2)];
