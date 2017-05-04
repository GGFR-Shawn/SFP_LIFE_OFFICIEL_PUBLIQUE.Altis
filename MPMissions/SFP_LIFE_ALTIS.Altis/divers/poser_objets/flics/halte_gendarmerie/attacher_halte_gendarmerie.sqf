//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_panneau_halte_gendarmerie = nearestObjects [getPosATL player, ["SFP_Panneau_Pied_Rond"], distance_max_de_detection_des_cones];
_verification_panneau_halte_gendarmerie_deux = _verification_panneau_halte_gendarmerie select 0;		

if (isnil "_verification_panneau_halte_gendarmerie_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un panneau !";};

_le_panneau_halte_gendarmerie = _verification_panneau_halte_gendarmerie_deux;

player removeaction actionpourprendrepanneauhaltegendarmerie;

actionpourdeposerpanneauhaltegendarmerie = player addAction ["<t color=""#ff0000"">" + "Déposer Panneau Halte Gendarmerie","divers\poser_objets\flics\halte_gendarmerie\detacher_halte_gendarmerie.sqf",[],7,true,true,"",""];

jedeposelepanneauhaltedegendarmerie = 0;
_le_panneau_halte_gendarmerie attachTo [player,[0,1.5,0.7]];

waituntil {sleep 0.1;jedeposelepanneauhaltedegendarmerie >= 1;};

detach _le_panneau_halte_gendarmerie;
actionpourprendrepanneauhaltegendarmerie = player addAction ["<t color=""#ff0000"">" + "Attacher Panneau Halte Gendarmerie","divers\poser_objets\flics\halte_gendarmerie\attacher_halte_gendarmerie.sqf",[],8,true,true,"","[] call condition_panneau_halte_gendarmerie && jepeuxreprendreunpanneauhaltegendarmerie >= 1"];
player removeaction actionpourdeposerpanneauhaltegendarmerie;
