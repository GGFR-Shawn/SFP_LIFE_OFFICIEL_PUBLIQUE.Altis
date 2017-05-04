// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Banque_Transfert";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Banque
if (player getvariable "mon_argent_banque_by_sfp_maxou" <= 0) then {couleur_banque = _couleur_rouge;}else{couleur_banque = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor couleur_banque;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetText format ["%1 €", (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];

{
	if (isPlayer _x) then 
	{
		_joueurs = lbAdd [1500,name _x];
	};
} forEach playableUnits;

lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl 1500), "ASC"];

waituntil {!dialog;};
cutText["","BLACK IN"];