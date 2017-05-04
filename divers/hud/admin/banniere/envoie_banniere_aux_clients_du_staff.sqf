// =======================================================================================================================================================================================
														// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
														  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
_le_titre_du_message_staff_by_maxou_formate = _this select 0;
_le_message_staff_by_maxou = _this select 1;
_temps_effacement = _this select 2;
	
if (isnil "_le_titre_du_message_staff_by_maxou_formate") exitwith {};	
if (isnil "_le_message_staff_by_maxou") exitwith {};	
if (isnil "_temps_effacement") exitwith {};	
	
cache_hud_dialogue_BIS_AAN = true;
_annonce_neomedia = [_le_titre_du_message_staff_by_maxou_formate,_le_message_staff_by_maxou] spawn BIS_fnc_AAN;
sleep _temps_effacement;
(uinamespace getvariable "BIS_AAN") closeDisplay 3003;
cache_hud_dialogue_BIS_AAN = nil;
	