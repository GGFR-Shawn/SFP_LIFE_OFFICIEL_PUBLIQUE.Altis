//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_mat_eclairage = nearestObjects [getPosATL player, ["Land_PortableLight_double_F"], distance_max_de_detection_mat_eclairage_object];
_verification_mat_eclairage_deux = _verification_mat_eclairage select 0;		

if (isnil "_verification_mat_eclairage_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un mat !";};

_le_mat_d_eclairage = _verification_mat_eclairage_deux;

player removeaction actionpourprendreunmatdeclairageobjet;

actionpourdeposermatdeclairage = player addAction ["<t color=""#ff0000"">" + "Déposer Mat Eclairage","divers\poser_objets\civil\mat_eclairage\detacher_mat_eclairage.sqf",[],10,true,true,"",""];

jedeposelematdeclairage = 0;
_le_mat_d_eclairage attachTo [player,[0,1.5,1]];
_le_mat_d_eclairage setdir ((getdir _le_mat_d_eclairage - getdir player) + 180);

waituntil {sleep 0.1; jedeposelematdeclairage >= 1;};

detach _le_mat_d_eclairage;
actionpourprendreunmatdeclairageobjet = player addAction ["<t color=""#ff0000"">" + "Attacher Mat Eclairage","divers\poser_objets\civil\mat_eclairage\attacher_mat_eclairage.sqf",[],10,true,true,"","[] call condition_mat_eclairage_object && jepeuxreprendreunmatdeclairageobject >= 1"];
player removeaction actionpourdeposermatdeclairage;
