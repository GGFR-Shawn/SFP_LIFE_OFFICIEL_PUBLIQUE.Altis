// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nom_du_gendarme = _this select 0;
_personne_reprimande = _this select 1;

if (isnil "_nom_du_gendarme") exitwith {};
if (isnil "_personne_reprimande") exitwith {};


systemchat format ["Le gendarme %1 à retiré la licence pilote de %2.", _nom_du_gendarme, name _personne_reprimande];
