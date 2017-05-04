// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_position_pour_le_chat = _this select 0;
_l_envoyeur_du_message = _this select 1;
_le_message =_this select 2;
_qui_doit_recevoir =_this select 3;
if (isnil "_la_position_pour_le_chat" or isnil "_l_envoyeur_du_message" or isnil "_le_message" or isnil "_qui_doit_recevoir") exitwith {};
if !(name player in _qui_doit_recevoir) exitwith {};

_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE PERSONNEL DE :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",_l_envoyeur_du_message, _la_position_pour_le_chat, _le_message]; 
hint _encouleur;

playSound "son_sms_sfp";
