// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

sleep (60 * 10); // Le temps que tout le monde s'installe 

while {true} do
{
	"DIAG SFP : Mission Pompiers : Choix d'une mission 1/3." spawn historique_creation_log_sfp;

	waituntil {sleep 2; isnil "demarage_d_une_mission_pompier_sfp";};

	"DIAG SFP : Mission Pompiers : Choix d'une mission 2/3." spawn historique_creation_log_sfp;

	sleep (200 + random 600);
	
	"DIAG SFP : Mission Pompiers : Choix d'une mission 3/3." spawn historique_creation_log_sfp;

	_condition_pompier_en_ligne = false;
	{if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then {_condition_pompier_en_ligne = true;};} foreach playableUnits;

	if (_condition_pompier_en_ligne) then
	{
		switch round (random 5) do
		{
			demarage_d_une_mission_pompier_sfp = true;
			
			case 0 :
			{
				// Feu de déchets
				execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\dechets\initialisation_sarl_pompier_serveur_dechets.sqf";
			};
				
			case 1 :
			{
				// Feu de champs
				execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_champs\initialisation_sarl_pompier_serveur_feu_de_champs.sqf";
			};

			case 2 :
			{
				// Feu de maisons
				execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_maison\initialisation_sarl_pompier_serveur_maison.sqf";
			};

			case 3 :
			{
				// Feu de poubelles
				execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\poubelle\initialisation_sarl_pompier_serveur_que_feu_de_poubelle_en_ville.sqf";
			};

			case 4 :
			{
				// Feu de véhicule non joueurs
				execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\voitures\initialisation_sarl_pompier_serveur_voiture.sqf";
			};

			case 5 :
			{
				// Feu de véhicule joueurs
				execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_voiture_joueur\initialisation_sarl_pompier_serveur_feu_voiture_joueur.sqf";
			};
		};
	};
};