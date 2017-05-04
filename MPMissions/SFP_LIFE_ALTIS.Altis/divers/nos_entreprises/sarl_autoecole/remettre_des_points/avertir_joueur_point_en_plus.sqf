// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nom_moniteur = _this select 0;
_client_moniteur = _this select 1;
_nombre_de_points = _this select 2;

if (isnil "_nom_moniteur") exitwith {};
if (isnil "_client_moniteur") exitwith {};
if (isnil "_nombre_de_points") exitwith {};

if (name player != name _client_moniteur) exitwith {};

systemchat format ["Le moniteur %1 à remit des points sur votre permis : %2.", _nom_moniteur, _nombre_de_points];
