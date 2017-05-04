//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (isnil "historique_confirmation_sauvegarde_vehicule_serveur") then {historique_confirmation_sauvegarde_vehicule_serveur = [];};
"historique_confirmation_sauvegarde_vehicule_joueur" addPublicVariableEventHandler {historique_confirmation_sauvegarde_vehicule_serveur = historique_confirmation_sauvegarde_vehicule_serveur + [historique_confirmation_sauvegarde_vehicule_joueur];};

_listes_non_surveillable_destruction_sauvegarde = ["helico_taxi"];
while {true} do
{
	sleep 15;

	"DIAG SFP : Historique des véhicules : Lancement d'un scan GENERAL." spawn historique_creation_log_sfp;
	
	{
		if !(vehicleVarName _x in _listes_non_surveillable_destruction_sauvegarde) then
		{
			if (!isnil {_x getvariable "vehicule_info_parvariable"}) then
			{
				if (isnil {_x getvariable "attente_mouvement_pour_sauvegarde"}) then 
				{
					_x setvariable ["attente_mouvement_pour_sauvegarde",1,false];
					[_x] execvm "partie_serveur\historiques_des_vehicules\attente_quil_soit_detruit.sqf";
				};
			};
		};
		sleep 0.25;
	} foreach vehicles;
};