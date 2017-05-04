//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if !(cursortarget iskindof "Land_TentA_F") exitwith {hint "Tu n'as pas pointé ta souris sur ta tante de couchage !";};
_ma_tante_de_couchage = cursortarget;

player removeaction actionpourprendrelatente;

actionpourdeposertente = player addAction ["<t color=""#ff0000"">" + "Déposer Tente","divers\poser_objets\civil\tente_de_couchage\detacher_tente.sqf",[],7,true,true,"",""];

jedeposelatente = 0;
_ma_tante_de_couchage attachTo [player,[0,2.5,0.4]];

waituntil {sleep 0.5;jedeposelatente == 1;};

detach _ma_tante_de_couchage;
actionpourprendrelatente = player addAction ["<t color=""#ff0000"">" + "Attacher Tente","divers\poser_objets\civil\tente_de_couchage\attacher_tente.sqf",[],8,true,true,"","cursortarget iskindof 'Land_TentA_F' && cursortarget distance player < 5 && cursortarget getvariable 'cestmatante' == 1"];
player removeaction actionpourdeposertente;
