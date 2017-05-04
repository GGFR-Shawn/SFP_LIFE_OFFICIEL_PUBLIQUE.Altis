// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_quel_klaxon_jouer", "_vehicule_ou_jouer_le_klaxon"];

_quel_klaxon_jouer = _this select 0;
_vehicule_ou_jouer_le_klaxon = _this select 1;
if (isnil "_quel_klaxon_jouer") exitwith {};
if (isnil "_vehicule_ou_jouer_le_klaxon") exitwith {};

_vehicule_ou_jouer_le_klaxon say _quel_klaxon_jouer;
