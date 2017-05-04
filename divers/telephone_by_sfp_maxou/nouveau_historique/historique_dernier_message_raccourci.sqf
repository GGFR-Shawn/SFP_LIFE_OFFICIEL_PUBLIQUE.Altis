// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "le_message_recu_un") exitwith {hint "Désolé, vous n'avez pas encore recu de message !";};

_str = parseText format ["

! HISTORIQUE CHAT !
<br/>
--------------------------------
<br/>
<br/>
Bonjour %1, 
<br/>
Voici le dernier message recu :
<br/>
<br/>
<t color = '#01CE2E'>%2</t>
<br/>
<br/>
Position :
<br/>
<br/>
<t color = '#01CE2E'>%3</t>
<br/>
----------------------
<br/>
www.sfpteam.fr
<br/>
By Maxou
",
name player,
le_message_recu_un,
ma_position_pour_le_chat
];
hintsilent _str;