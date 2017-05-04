//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !


while {true} do
{
	sleep (480 + (random 1000));
	
	"DIAG SFP : Lancement d'une annonce serveur." spawn historique_creation_log_sfp;
	
	[[[],"divers\annonce_du_serveur_valide.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	
	sleep 20;
};

