//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if !(cursortarget iskindof "Land_TentA_F") exitwith {hint "Tu n'as pas pointé ta souris sur ta tante, recommence !";};

deletevehicle cursortarget;
player setVariable ['tente_pour_dormir', (player getVariable "tente_pour_dormir") + 1,true];
player setVariable["usedspace",(player getVariable "usedspace") + 10,true];


	