// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// ==========================================================================================================================================================================================
											  // WHITELIST SIMPLE SANS PATRONS //
// ==========================================================================================================================================================================================
"DIAG SFP : whitelist : Démarrage de la création." spawn historique_creation_log_sfp;

_valeur_a_creer_et_tester = [
								"Whitelist Stagiaires Gendarmerie", 
								"Whitelist Gendarmes", 
								"Whitelist PSIG", 
								"Whitelist GIGN", 
								"Whitelist Maire"
							];

for "_i" from 0 to (count _valeur_a_creer_et_tester - 1) do
{
	_valeur = _valeur_a_creer_et_tester select _i;
	
	_check_whitelist = (_valeur) call base_de_donnee_existante;
	sleep 0.1;
	if !(_check_whitelist) then {[_valeur, _valeur, "76561198087719454", ["[SFP] Maxou"]] call saveToDB;};
};

// ==========================================================================================================================================================================================
										  // WHITELIST AVEC PATRONS //
// ==========================================================================================================================================================================================
_valeur_a_creer_et_tester = [
								"Whitelist SARL ET FURIOUS", 
								"Whitelist AUTO ECOLE", 
								"Whitelist AVOCAT", 
								"Whitelist CARSHOP",
								"Whitelist DIR",
								"Whitelist NEOMEDIA",
								"Whitelist POMPIERS",
								"Whitelist TAXI G7",
								"Whitelist Famille Deux",
								"Whitelist Famille Une"
							];
							
for "_i" from 0 to (count _valeur_a_creer_et_tester - 1) do
{
	_valeur = _valeur_a_creer_et_tester select _i;
	_cherche = 0;
	
	_check_whitelist = (_valeur) call base_de_donnee_existante; 
	sleep 0.1;
	if !(_check_whitelist) then 
	{
		[_valeur, _valeur, 'Patrons', ["76561198087719454"]] call saveToDB;
		
		if (_i == _cherche) then {whitelist_sarl_et_furious = ['76561198087719454']; publicvariable "whitelist_sarl_et_furious";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_auto_ecole = ['76561198087719454']; publicvariable "whitelist_auto_ecole";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_avocat = ['76561198087719454']; publicvariable "whitelist_avocat";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_carshop = ['76561198087719454']; publicvariable "whitelist_carshop";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_dir = ['76561198087719454']; publicvariable "whitelist_dir";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_neomedia = ['76561198087719454']; publicvariable "whitelist_neomedia";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_pompiers = ['76561198087719454']; publicvariable "whitelist_pompiers";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_taxi_g_sept = ['76561198087719454']; publicvariable "whitelist_taxi_g_sept";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_famille_deux = ['76561198087719454']; publicvariable "whitelist_famille_deux";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_famille_une = ['76561198087719454']; publicvariable "whitelist_famille_une";}; _cherche = round (_cherche + 1);
	}else
	{
		if (_i == _cherche) then {whitelist_sarl_et_furious = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_sarl_et_furious";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_auto_ecole = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_auto_ecole";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_avocat = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_avocat";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_carshop = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_carshop";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_dir = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_dir";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_neomedia = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_neomedia";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_pompiers = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_pompiers";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_taxi_g_sept = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_taxi_g_sept";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_famille_deux = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_famille_deux";}; _cherche = round (_cherche + 1);
		if (_i == _cherche) then {whitelist_famille_une = [_valeur, _valeur, "Patrons", "test_valeur_existe"] call loadFromDB_Local_Serveur; publicvariable "whitelist_famille_une";}; _cherche = round (_cherche + 1);
	};
};

"DIAG SFP : whitelist : Fin de la création." spawn historique_creation_log_sfp;
