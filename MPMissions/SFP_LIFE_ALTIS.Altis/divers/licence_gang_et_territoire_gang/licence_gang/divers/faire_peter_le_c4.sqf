//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (player distance gang_1 < 400) exitwith {hint "Tu ne peux pas faire peter le c4 près du gang !!!";};


[{player globalchat "Un kamikaze à fait sauter sa ceinture c4 ...";},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;
_test = "Bo_Mk82" createVehicle (getPosATL player);
player setdamage 1;