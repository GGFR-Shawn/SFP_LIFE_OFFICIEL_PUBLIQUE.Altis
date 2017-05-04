// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_message = lbText [1501,_this select 0 select 1];
if (lbtext ([1500,0]) == "Aucun message reçu") exitwith {};


_str = parseText format ["

! HISTORIQUE CHAT !
<br/>
--------------------------------
<br/>
<br/>
Bonjour %1, 
<br/>
<br/>
Voici le message selectionné :
<br/>
<br/>
<t color = '#01CE2E'>%2</t>
<br/>
<br/>
----------------------
<br/>
www.sfpteam.fr
<br/>
By Maxou
",
name player,
_le_message
];
hintsilent _str;