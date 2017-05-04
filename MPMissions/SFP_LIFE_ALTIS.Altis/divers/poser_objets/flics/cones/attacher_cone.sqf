//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_cone = nearestObjects [getPosATL player, ["RoadCone_L_F"], distance_max_de_detection_des_cones];
_verification_cone_deux = _verification_cone select 0;		

if (isnil "_verification_cone_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un cone !";};

_lecone = _verification_cone_deux;

player removeaction actionpourprendrecone;

actionpourdeposercone = player addAction ["<t color=""#ff0000"">" + "Déposer Cone","divers\poser_objets\flics\cones\detacher_cone.sqf",[],7,true,true,"",""];

jedeposelecone = 0;
_lecone attachTo [player,[0,1.5,0.5]];

waituntil {sleep 0.1;jedeposelecone >= 1;};

detach _lecone;
actionpourprendrecone = player addAction ["<t color=""#ff0000"">" + "Attacher Cone","divers\poser_objets\flics\cones\attacher_cone.sqf",[],8,true,true,"","[] call condition_cone && jepeuxreprendreuncone >= 1"];
player removeaction actionpourdeposercone;
