// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

nombre_message_dans_mon_historique = 0;
for "_i" from 0 to (count historique_messages_nom_joueur_by_maxou - 1) do
{
	nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique - 1);
	
	for "_i" from 0 to (count (historique_messages_nom_joueur_by_maxou select _i) - 1) do
	{
		nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique + 1);
	};
};


if (nombre_message_dans_mon_historique < 100) then {couleur_historique_chat = "<t color = '#13FE56'>";};
if (nombre_message_dans_mon_historique >= 100 && nombre_message_dans_mon_historique < 140) then {couleur_historique_chat = "<t color = '#04AB25'>";};
if (nombre_message_dans_mon_historique >= 140) then {couleur_historique_chat = "<t color = '#FD2C11'>";};
if (isnil "couleur_historique_chat") then {couleur_historique_chat = "<t color = '#13FE56'>";};

_str = parseText format ["

! HISTORIQUE CHAT !
<br/>
--------------------------------
<br/>
<br/>
Espace de stockage restante : 
<br/>
%1 %2</t>/60.
<br/>
----------------------
<br/>
www.sfpteam.fr
<br/>
By Maxou
",
couleur_historique_chat,
nombre_message_dans_mon_historique
];
hintsilent _str;

