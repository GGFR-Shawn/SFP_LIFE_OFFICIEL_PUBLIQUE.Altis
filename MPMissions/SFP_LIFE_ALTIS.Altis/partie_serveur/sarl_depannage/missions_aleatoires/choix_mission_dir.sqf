// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_compter_dir";

while {true} do
{
	"DIAG SFP : Mission Dir : Choix selection mission 1/3." spawn historique_creation_log_sfp;

	waituntil {sleep 2; isnil "demarage_d_une_mission_dir_sfp";};
	
	"DIAG SFP : Mission Dir : Choix selection mission 2/3." spawn historique_creation_log_sfp;

	sleep (200 + (random 600));

	"DIAG SFP : Mission Dir : Choix selection mission 3/3." spawn historique_creation_log_sfp;

	_compter_dir = 0;
	{if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {_compter_dir = round (_compter_dir + 1);};} foreach allunits;
	
	if (_compter_dir >= 1) then
	{
		switch round (random 3) do
		{
			demarage_d_une_mission_dir_sfp = true;
			
			case 0:
			{
				execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_canalisation_sarl_depannage\mission_canalisation_dir.sqf";
			};
			case 1:
			{
				execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_fuite_produit_inconnu\mission_fuite_produit_inconnu.sqf";
			};
			case 2:
			{
				execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_arbre_sur_la_route\mission_DIR_objets_tombe_sur_la_route.sqf";
			};
			case 3:
			{
				execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_route_casse_dir\mission_DIR_route_casse_dir.sqf";
			};
		};
	};
};

