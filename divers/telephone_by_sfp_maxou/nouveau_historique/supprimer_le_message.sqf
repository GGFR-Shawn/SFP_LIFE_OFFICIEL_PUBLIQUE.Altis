// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_tableau_selectionne = [1500,lbCurSel 1500] select 1;
_le_nom_selectionne = lbText [1501,lbCurSel 1501];

if (_le_tableau_selectionne == -1) exitwith {hint "Désolé, aucun nom selectionné ...";};
if ([1501,lbCurSel 1501] select 1 == -1) exitwith {hint "Désolé, aucun message selectionné ...";};
if (lbtext ([1501,0]) == "Aucun message reçu") exitwith {hint "Aucuns messages n'est à supprimer ...";};

[historique_messages_nom_joueur_by_maxou, _le_nom_selectionne] call BIS_fnc_removeNestedElement;
execvm "divers\telephone_by_sfp_maxou\nouveau_historique\recompter_historique.sqf";

lbClear 1501; lbClear 1502;

for "_i" from 0 to (count (historique_messages_nom_joueur_by_maxou select _le_tableau_selectionne) - 1) do
{
	lbAdd [1501, format ["%1",historique_messages_nom_joueur_by_maxou select _le_tableau_selectionne select _i]];
	lbAdd [1502, "........."];
	((uiNamespace getVariable "Menu_tablette_sfp_historique_message_sms") displayCtrl 1501) lbSetTooltip [_i, "Selectionner pour voir le message en entier."];
};
lbDelete [1501, 0]; lbDelete [1502, 0];

if (count (historique_messages_nom_joueur_by_maxou select _le_tableau_selectionne) <= 1) then
{
	historique_messages_nom_joueur_by_maxou = historique_messages_nom_joueur_by_maxou - [historique_messages_nom_joueur_by_maxou select _le_tableau_selectionne];
	
	lbClear 1500;

	[] call initialisation_du_chat;
}; 
