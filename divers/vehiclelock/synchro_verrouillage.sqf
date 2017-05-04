// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_la_voiture","_le_verrouillage"];
_la_voiture = _this select 0;
_le_verrouillage = _this select 1;
if (isnil "_la_voiture" or isnil "_le_verrouillage") exitWith {};

_la_voiture lock _le_verrouillage;


