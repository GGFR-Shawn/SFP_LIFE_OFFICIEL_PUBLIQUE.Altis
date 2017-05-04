//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_barriere_de_securite = nearestObjects [getPosATL player, ["PlasticBarrier_03_orange_F"], distance_max_de_detection_des_barriere_de_chantier_dde];
_verification_barriere_de_securite_deux = _verification_barriere_de_securite select 0;		

if (isnil "_verification_barriere_de_securite_deux") exitwith {hint "Tu n'as pas pointé ta souris sur une barrière de chantier !";};
_labarrieredechantier = _verification_barriere_de_securite_deux;

player removeaction actionpourprendreunebarrieredechantier_orange;

actionpourdeposerbarrieredechantier_orange = player addAction ["<t color=""#ff0000"">" + "Déposer Barriere","divers\poser_objets\civil\barriere_chantier_dde_orange\detacher_barriere_chantier.sqf",[],7,true,true,"",""];

jedeposelabarrieredechantier = 0;
_labarrieredechantier attachTo [player,[0,1.5,0.42]];

waituntil {sleep 0.1; jedeposelabarrieredechantier >= 1;};

detach _labarrieredechantier;
// _labarrieredechantier setpos [position _labarrieredechantier select 0, position _labarrieredechantier select 1, 0];
actionpourprendreunebarrieredechantier_orange = player addAction ["<t color=""#ff0000"">" + "Attacher Barriere","divers\poser_objets\civil\barriere_chantier_dde_orange\attacher_barriere_chantier.sqf",[],8,true,true,"","[] call condition_barriere_de_chantier_dde_deux && jepeuxreprendreunebarrieredechantier_orange >= 1"];
player removeaction actionpourdeposerbarrieredechantier_orange;
