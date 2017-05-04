// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_maison = _this select 0;
_listes_proprio = _this select 1;

if (isnull _la_maison) exitwith {};
if (isnil "_listes_proprio") exitwith {};
if (count _listes_proprio < 1) exitwith {};


if (isnil {_la_maison getvariable "vehicule_info_parvariable"}) then
{
	_la_maison setvariable ["vehicule_info_parvariable", _listes_proprio, false];
};