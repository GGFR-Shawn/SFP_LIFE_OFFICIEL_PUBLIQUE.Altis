// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_medecin_qui_fait_faillite = _this select 0;
_son_marqueur = _this select 1;

if (isnil "_le_medecin_qui_fait_faillite") exitwith {};
if (isnil "_son_marqueur") exitwith {};

sleep (3600 + (random 7200));

deletevehicle _le_medecin_qui_fait_faillite;
deletemarker _son_marqueur;
	
[{systemchat "Un medecin vient de fermer ! :/";},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;
