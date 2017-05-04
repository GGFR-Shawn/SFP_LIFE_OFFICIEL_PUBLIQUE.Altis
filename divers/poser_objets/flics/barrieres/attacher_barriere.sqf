//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_barriere_gendarmerie = nearestObjects [getPosATL player, ["RoadBarrier_F"], distance_max_de_detection_barriere_gendarmerie];
_verification_barriere_gendarmerie_deux = _verification_barriere_gendarmerie select 0;		
if (isnil "_verification_barriere_gendarmerie_deux") exitwith {hint "Tu n'as pas pointé ta souris sur une barrière de chantier !";};
_labarriere = _verification_barriere_gendarmerie_deux;

player removeaction actionpourprendrebarriere;

actionpourdeposerbarriere = player addAction ["<t color=""#ff0000"">" + "Déposer Barrière","divers\poser_objets\flics\barrieres\detacher_barriere.sqf",[],7,true,true,"",""];

jedeposelabarriere = 0;
_labarriere attachTo [player,[0,1.5,0.5]];

waituntil {sleep 0.1;jedeposelabarriere >= 1;};

detach _labarriere;
actionpourprendrebarriere = player addAction ["<t color=""#ff0000"">" + "Attacher Barrière","divers\poser_objets\flics\barrieres\attacher_barriere.sqf",[],8,true,true,"","[] call condition_barriere_gendarmerie && jepeuxreprendreunebarriere >= 1"];
player removeaction actionpourdeposerbarriere;
