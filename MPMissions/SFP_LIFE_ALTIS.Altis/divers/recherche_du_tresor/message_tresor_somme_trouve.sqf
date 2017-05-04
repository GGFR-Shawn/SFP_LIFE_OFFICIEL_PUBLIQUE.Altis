// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_nom_du_joueur = _this select 0;
_somme_gagne = _this select 1;
if (isnil "_le_nom_du_joueur" or isnil "_somme_gagne") exitwith {};

hint format ["%1 à trouvé le trésor et à trouvé la somme de %2 Euros à l'intérieur !",_le_nom_du_joueur, _somme_gagne];
