// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

_nom_personne_qui_donne = _this select 0;
_qui_recoit = _this select 1;
_montant_donne = _this select 2;
_nom_du_produit_de_farming = _this select 3;
if (isnil "_nom_personne_qui_donne" or isnil "_qui_recoit" or isnil "_montant_donne" or isnil "_nom_du_produit_de_farming") exitwith {};
if (!hasInterface) exitwith {};
if (!isplayer _qui_recoit) exitwith {};
if (player != _qui_recoit) exitwith {};

["popup_objet_recu_joueur", [format["<t color='#0FC702'>%1</t> vous à mit %2 %3.", name _nom_personne_qui_donne, _montant_donne, _nom_du_produit_de_farming]]] call bis_fnc_showNotification;
systemchat format ["%1 vous à mit %2 %3.", name _nom_personne_qui_donne, _montant_donne, _nom_du_produit_de_farming];
