// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

sleep 4;
_voiture = _this select 0;
_listes_proprio = _this select 1;

if (isnull _voiture) exitwith {};
if (isnil "_listes_proprio") exitwith {};
if (count _listes_proprio < 1) exitwith {};


if (isnil {_voiture getvariable "vehicule_info_parvariable"}) then
{
	_voiture setvariable ["vehicule_info_parvariable", _listes_proprio, false];
};