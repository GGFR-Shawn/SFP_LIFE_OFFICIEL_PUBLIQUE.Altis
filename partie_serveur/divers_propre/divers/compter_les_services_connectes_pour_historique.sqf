// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Entreprises connectés : Démarrage du script." spawn historique_creation_log_sfp;

private ["_liste_a_scanner","_nom_des_personnes"];
_liste_a_scanner = [
						["Auto Ecole", "sarl_autoecole"],
						["Avocats", "sarl_avocat"],
						["CarShop", "sarl_car_shop"],
						["Depanneurs", "sarl_depannage"],
						["Neomedia", "sarl_neomedia"],
						["Pompiers", "sarl_pompier"],
						["Taxi G7", "sarl_taxis_gsept"],
						
						[sfp_config_famille_une_nom, sfp_config_famille_une_nom_pour_variable],
						[sfp_config_famille_deux_nom, sfp_config_famille_deux_nom_pour_variable]
				   ];

for "_i" from 0 to (count _liste_a_scanner - 1) do
{
	_nom_a_affiche = _liste_a_scanner select _i select 0;
	_variable_a_scanner = _liste_a_scanner select _i select 1;
	_compter = 0;
	_nom_des_personnes = "";
	
	{
		if (!isnil {_x getvariable _variable_a_scanner}) then
		{
			_nom_des_personnes = _nom_des_personnes + (format ["// %1", name _x]);
			_compter = round (_compter + 1);
		};
	} foreach playableUnits;
	
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	_detail_du_log = format ["%1 connectes actuellements (%2) : %3.", _nom_a_affiche, _compter, _nom_des_personnes];
	["Historique Des Personnes Connectes", "Historique Des Personnes Connectes", _heure_du_log, _detail_du_log] call saveToDB;

	sleep 1;
};

"DIAG SFP : Entreprises connectés : Fin du script." spawn historique_creation_log_sfp;
