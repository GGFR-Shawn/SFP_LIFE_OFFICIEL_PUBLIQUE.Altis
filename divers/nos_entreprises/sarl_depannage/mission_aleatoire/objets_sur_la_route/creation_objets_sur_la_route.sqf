// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_des_objets_sur_la_route = _this select 0;
if (isnil "_position_des_objets_sur_la_route") exitwith {};
if (!hasInterface) exitwith {};

["Warning",["Des objets sont tombés sur la route, faites attention !", ""]] call bis_fnc_showNotification;

for "_i" from 0 to 5 do
{
	player globalchat "Attention, des objets sont tombés d'un camion sur la route ! La DIR va intervenir !";
};

waituntil {sleep 1; isnil "objets_sur_la_route_DIR_en_cours"};

["Warning",["Les objets sur la route ont bien étés enlevé par la DIR !", ""]] call bis_fnc_showNotification;
