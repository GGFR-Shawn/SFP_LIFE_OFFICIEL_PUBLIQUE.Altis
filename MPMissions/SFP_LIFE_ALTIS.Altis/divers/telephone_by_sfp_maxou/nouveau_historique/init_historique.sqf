// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

createdialog "Menu_tablette_sfp_historique_message_sms";

initialisation_du_chat = 
{
	if (isnil "historique_messages_nom_joueur_by_maxou") then {historique_messages_nom_joueur_by_maxou = [];};
	if (count historique_messages_nom_joueur_by_maxou < 1) then {historique_messages_nom_joueur_by_maxou = [["Aucun message reçu","Aucun message reçu"]];};

	for "_i" from 0 to (count historique_messages_nom_joueur_by_maxou - 1) do
	{
		lbAdd [1500, format ["%1",historique_messages_nom_joueur_by_maxou select _i select 0]];
		((uiNamespace getVariable "Menu_tablette_sfp_historique_message_sms") displayCtrl 1500) lbSetColor [_i, [0.14,1,0.18,1]];
	};
	for "_i" from 0 to (count (historique_messages_nom_joueur_by_maxou select 0) - 1) do
	{
		lbAdd [1501, format ["%1",historique_messages_nom_joueur_by_maxou select 0 select _i]];
		((uiNamespace getVariable "Menu_tablette_sfp_historique_message_sms") displayCtrl 1501) lbSetTooltip [_i, "Selectionner pour voir le message en entier."];
	};

	lbDelete [1501, 0]; lbDelete [1502, 0];
};

[] call initialisation_du_chat;
	
