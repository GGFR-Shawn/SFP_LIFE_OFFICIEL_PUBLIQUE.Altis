// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_lavoiture","_lefuel"];

_lavoiture = _this select 0;
_lefuel = _this select 1;
if (isNull _lavoiture) exitWith {};

_lavoiture setfuel _lefuel;

