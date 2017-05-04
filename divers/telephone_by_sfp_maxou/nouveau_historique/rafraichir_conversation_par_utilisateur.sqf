// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_nom_selectionne = lbText [1500,_this select 0 select 1];


lbClear 1501; lbClear 1502;

for "_i" from 0 to (count historique_messages_nom_joueur_by_maxou - 1) do
{
	_l_index_trouve = _i;
	if (historique_messages_nom_joueur_by_maxou select _i select 0 == _le_nom_selectionne) then
	{
		for "_i" from 0 to (count (historique_messages_nom_joueur_by_maxou select _i) - 1) do
		{
			lbAdd [1501, format ["%1",historique_messages_nom_joueur_by_maxou select _l_index_trouve select _i]];
			lbAdd [1502, "........."];
			((uiNamespace getVariable "Menu_tablette_sfp_historique_message_sms") displayCtrl 1501) lbSetTooltip [_i, "Selectionner pour voir le message en entier."];
		};
		lbDelete [1501, 0]; lbDelete [1502, 0];
	};
};
