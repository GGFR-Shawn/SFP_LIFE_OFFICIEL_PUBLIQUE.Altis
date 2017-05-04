//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_choix_demarrage = ["1","2","3"] call bis_fnc_selectrandom;
if (_choix_demarrage != "1") exitwith {};

"DIAG SFP : Lumière de la ville : Démarrage du script en attente." spawn historique_creation_log_sfp;

sleep ((random 600) + (random 180)); 

_heure_du_log = format ["%1/%2/%3 à %4H%5Min:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
["Historique Lumiere De La Ville", "Historique Lumiere De La Ville", _heure_du_log, "Demarrage du script."] call saveToDB;
"DIAG SFP : Lumière de la ville : Démarrage du script validé." spawn historique_creation_log_sfp;

[[[0.95],"divers\eteindre_lumiere_de_la_ville\eteindre_lumiere_de_la_ville_synchro_client.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

sleep ((random 300) + (random 1500));

[[[0],"divers\eteindre_lumiere_de_la_ville\eteindre_lumiere_de_la_ville_synchro_client.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
["Historique Lumiere De La Ville", "Historique Lumiere De La Ville", _heure_du_log, "Fin du script."] call saveToDB;
"DIAG SFP : Lumière de la ville : Fin du script." spawn historique_creation_log_sfp;


