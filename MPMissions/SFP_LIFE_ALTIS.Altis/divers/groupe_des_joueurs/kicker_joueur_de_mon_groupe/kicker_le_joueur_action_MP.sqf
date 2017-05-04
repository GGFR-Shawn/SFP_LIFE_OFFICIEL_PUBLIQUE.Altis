// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_personne_a_kicker = _this select 0;
_nom_admin_groupe = _this select 1;

if (isnil "_personne_a_kicker" or isnil "_nom_admin_groupe") exitwith {};
if (name player != _personne_a_kicker) exitwith {};

[player] join grpNull;
hint format ["Vous avez été kické de votre groupe par %1 !", _nom_admin_groupe];
