//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_panneau_danger_dde = nearestObjects [getPosATL player, ["SFP_Panneau_Pied_Triangle"], distance_max_de_detection_danger_dde];
_verification_panneau_danger_dde_deux = _verification_panneau_danger_dde select 0;		

if (isnil "_verification_panneau_danger_dde_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un panneau !";};

_le_panneau_danger_dde = _verification_panneau_danger_dde_deux;

player removeaction actionpourprendrepanneaudangerdde;

actionpourdeposerpanneaudangerdde = player addAction ["<t color=""#ff0000"">" + "Déposer Panneau Danger","divers\poser_objets\civil\panneau_danger\detacher_panneau_danger.sqf",[],7,true,true,"",""];

jedeposelepanneaudangerdde = 0;
_le_panneau_danger_dde attachTo [player,[0,1.5,0.7]];

waituntil {sleep 0.1;jedeposelepanneaudangerdde >= 1;};

detach _le_panneau_danger_dde;
actionpourprendrepanneaudangerdde = player addAction ["<t color=""#ff0000"">" + "Attacher Panneau Danger","divers\poser_objets\civil\panneau_danger\attacher_panneau_danger.sqf",[],8,true,true,"","[] call condition_panneau_danger_dde && jepeuxreprendreunpanneaudangerdde >= 1"];
player removeaction actionpourdeposerpanneaudangerdde;
