// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_dire_valeur_resultat_serveur_sfp";

sleep 10; // Attente lancement des parametres serveurs

_dire_valeur_resultat_serveur_sfp =
{
	_valeur = _this select 0;
	_resultat = "Validé";
	if (isnil "_valeur") exitwith {"DIAG SFP : Configuration du serveur : Erreur parametre." spawn historique_creation_log_sfp;};
	
	switch _valeur do
	{
		case "1" :
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then 
			{
				_resultat = "Non valide";
			};
		};
		case "2" :
		{
			if (isnil "OO_INIDBI") then 
			{
				_resultat = "Non valide";
			};
		};
		case "3" :
		{
			if (isnil "fin_initialisation_meteo_sfp") then 
			{
				_resultat = "Non valide";
			};
		};
		case "4" :
		{
			if (isnil "Menu_Valide_Hackeur" or isnil "blacklist_variable_hackeur" or isnil "sfp_config_liste_addons_autorise_anti_hack" or isnil "boutton_de_dialogue_autorise") then 
			{
				_resultat = "Non valide";
			};
		};
		case "5" :
		{
			if (isnil "listes_des_farming_avec_parametre") then 
			{
				_resultat = "Non valide";
			};
		};
		case "6" :
		{
			if (isnil "fin_server_gather") then 
			{
				_resultat = "Non valide";
			};
		};
	};
	_resultat
};

_description_config_sfp = 
[
	format ["DIAG SFP : Configuration du serveur : Résultat configuration des addons SFP du serveur = %1.", ["1"] call _dire_valeur_resultat_serveur_sfp],
	format ["DIAG SFP : Configuration du serveur : Résultat configuration de l'heure du serveur = %1.", ["2"] call _dire_valeur_resultat_serveur_sfp],
	format ["DIAG SFP : Configuration du serveur : Résultat configuration de la météo du serveur = %1.", ["3"] call _dire_valeur_resultat_serveur_sfp],
	format ["DIAG SFP : Configuration du serveur : Résultat configuration des valeurs anti hack = %1.", ["4"] call _dire_valeur_resultat_serveur_sfp],
	format ["DIAG SFP : Configuration du serveur : Résultat configuration des valeurs de farming = %1.", ["5"] call _dire_valeur_resultat_serveur_sfp],
	format ["DIAG SFP : Configuration du serveur : Résultat configuration des valeurs de sauvegarde = %1.", ["6"] call _dire_valeur_resultat_serveur_sfp]
];

for "_i" from 0 to (count _description_config_sfp - 1) do
{
	(format ["%1",_description_config_sfp select _i]) spawn historique_creation_log_sfp;
};
