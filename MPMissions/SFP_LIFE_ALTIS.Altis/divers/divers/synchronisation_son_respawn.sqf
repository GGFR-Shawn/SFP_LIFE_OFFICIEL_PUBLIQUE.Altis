// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_position", "_le_son"];
_position = _this select 0;
_le_son = _this select 1;
if (isnil "_position" or isnil "_le_son") exitwith {};

_emplacement_son_sfp_maxou = "Land_HelipadEmpty_F" createvehiclelocal _position;

_emplacement_son_sfp_maxou say _le_son;

sleep 3;

deletevehicle _emplacement_son_sfp_maxou;