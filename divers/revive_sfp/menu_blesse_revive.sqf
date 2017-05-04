// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Revive_Liste_Des_Blesses";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_text = 1001;
_couleur_verte = [0,0.91,0.07,1];

createDialog _nom_du_menu;
disableSerialization;

((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_text) ctrlSetText "Selectionne le joueur que tu souhaites prevenir de ton arrivée !";
((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_text) ctrlSetTextColor _couleur_verte;

nombre_de_blesse_menu_revive = 0;
{
	if (!isnil {_x getvariable "detection_demande_revive"}) then
	{
		lbAdd [_numero_add, format['%1', name _x]];
		nombre_de_blesse_menu_revive = round (nombre_de_blesse_menu_revive + 1);
	};
	lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];
	
} foreach allunits;

if (nombre_de_blesse_menu_revive < 1) then {lbAdd [_numero_add, "Aucun bléssé actuellement."];};
	
waituntil {!dialog;};
cutText["","BLACK IN"];
