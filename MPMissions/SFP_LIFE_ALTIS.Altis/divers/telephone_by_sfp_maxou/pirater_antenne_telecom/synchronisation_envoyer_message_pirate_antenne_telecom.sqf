// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_message = _this select 0;
if (isnil "_le_message") exitwith {};

_encouleur = parseText format 
[
	"
	! SFP TELECOM !
	<br/> ------------------------------------------------ <br/>
	<br/>
	<t size='1.1' color='#8789F1'>! MESSAGE ANONYME ANTENNE PIRATEE !</t><br/>
	<br/>
	<t size='1' color='#02E632'>%1</t>
	<br/>
	<br/> --------------------------------------------- <br/> 
	By Maxou 
	<br/> 
	www.sfpteam.fr
	",
	_le_message
];

hint _encouleur;

playSound "son_sms_sfp";
