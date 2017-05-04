//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_herse = nearestObjects [getPosATL player, ["Pole_F"], distance_max_de_detection_des_herses];
if (count _verification_herse < 1) exitwith {hint "Aucune herse detecté !";};

_la_herse = _verification_herse select 0;

player removeaction actionpourprendreherse;
actionpourdeposerherse = player addAction ["<t color=""#ff0000"">" + "Déposer herse","divers\poser_objets\flics\herse\detacher_herse.sqf",[],7,true,true,"",""];

jedeposelaherse = 0;
_la_herse attachto [player,[-0.044,-0.06,0.12],"righthand"];
sleep 0.045;
[_la_herse,-90,0.3] call BIS_fnc_setPitchBank;

waituntil {sleep 0.1;jedeposelaherse >= 1;};

player allowdamage false;
detach _la_herse;
[_la_herse,-90,0] call BIS_fnc_setPitchBank;

actionpourprendreherse = player addAction ["<t color=""#ff0000"">" + "Attacher Herse","divers\poser_objets\flics\herse\attacher_herse.sqf",[],8,true,true,"","[] call condition_herses && jepeuxreprendreuneherse >= 1"];
player removeaction actionpourdeposerherse;
sleep 1;
player allowdamage true;

