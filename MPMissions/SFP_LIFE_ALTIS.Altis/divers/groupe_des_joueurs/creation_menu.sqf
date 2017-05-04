// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {player getvariable "joueur_menotte"}) exitwith {hint "Opération impossible vous êtes menotté !";};
if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) exitwith {hint "Opération impossible vous avez un sac sur la tête !";};

// cutText["","BLACK FADED"];
// 0 cutFadeOut 9999999;

_nom_du_menu = "Menu_tablette_sfp_Menu_Groupe";

createDialog _nom_du_menu;
disableSerialization;

_numero_add = 1500;
_nombre_de_joueur = 0;
{
	_nombre_de_joueur = round (_nombre_de_joueur + 1);
	_nom_ajout = format ["%1",name _x];
	lbAdd [_numero_add, _nom_ajout];
} foreach playableUnits;

lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];
if (_nombre_de_joueur < 1) then {lbAdd [_numero_add, "Aucun joueur connecté ..."];lbAdd [_numero_add, ""];lbAdd [_numero_add, "Système unique By Maxou ..."];lbAdd [_numero_add, ""];lbAdd [_numero_add, "www.sfpteam.fr ..."];};

// waituntil {!dialog;};
// cutText["","BLACK IN"];

