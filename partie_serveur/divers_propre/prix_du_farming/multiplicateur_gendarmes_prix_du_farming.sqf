// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_sauvegarde_multiplicateur_actuel","_multiplicateur","_scan_nombre_gendarme"];

waituntil {sleep 1; "DIAG SFP : Multiplicateur Farming : Attente des valeurs." spawn historique_creation_log_sfp; !isnil "heure_serveur" && !isnil "prixserpenttransforme_original"};

"DIAG SFP : Multiplicateur Farming : Lancement du script." spawn historique_creation_log_sfp;

_multiplicateur = 1;
_sauvegarde_multiplicateur_actuel = 0;
_scan_nombre_gendarme =
{	
	_nombre_de_gendarme_connecte = _this select 0;
	{
		if (side _x == west) then
		{
			_nombre_de_gendarme_connecte = round (_nombre_de_gendarme_connecte - 1);
		};
		sleep 0.045;
	} foreach playableunits;
	
	if (_nombre_de_gendarme_connecte < 1) then
	{
		sleep (7 * 60); // Attends que les gendarmes s'installent sur le serveur
		
		_nombre_de_gendarme_connecte = _this select 0;
		{
			if (side _x == west) then
			{
				_nombre_de_gendarme_connecte = round (_nombre_de_gendarme_connecte - 1);
			};
			sleep 0.045;
		} foreach playableunits;
	};
	
	_nombre_de_gendarme_connecte
};

["Prix du farming", "Actualisé toutes les 10 minutes.", "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", ""] call saveToDB; sleep 0.3;
["Prix du farming", "Actualisé toutes les 10 minutes.", "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", ""] call saveToDB; sleep 0.3;
["Prix du farming", "Actualisé toutes les 10 minutes.", "Multiplicateur farming :", "Actuellement 1 fois le prix de base !"] call saveToDB; sleep 0.3;


while {true} do
{
	"DIAG SFP : Multiplicateur Farming : Lancement du scan." spawn historique_creation_log_sfp;
	
	// Suivant heures
	if (heure_serveur select 3 >= 1 && heure_serveur select 3 < 8) then
	{
		_multiplicateur = 1;
	}else
	{
		_multiplicateur = 2;
	};
	
	// Suivant gendarmes connectés
	if ([6] call _scan_nombre_gendarme <= 0) then 
	{
		_multiplicateur = 3;
	};
	if ([11] call _scan_nombre_gendarme <= 0) then 
	{
		_multiplicateur = 4;
	};

	if (_sauvegarde_multiplicateur_actuel != _multiplicateur) then
	{	
		_sauvegarde_multiplicateur_actuel = _multiplicateur;
		
		prixdelabaleine = (round (prixdelabaleine_original * _multiplicateur)); sleep 0.2; publicvariable "prixdelabaleine";
		prixducannabis = (round (prixducannabis_original * _multiplicateur)); sleep 0.2; publicvariable "prixducannabis";
		prixdelacocaine = (round (prixdelacocaine_original * _multiplicateur)); sleep 0.2; publicvariable "prixdelacocaine";
		prixdelheroine = (round (prixdelheroine_original * _multiplicateur)); sleep 0.2; publicvariable "prixdelheroine";
		prixdesorganesanimaux = (round (prixdesorganesanimaux_original * _multiplicateur)); sleep 0.2; publicvariable "prixdesorganesanimaux";
		prixdelaplante = (round (prixdelaplante_original * _multiplicateur)); sleep 0.2; publicvariable "prixdelaplante";
		prixdesmedicaments = (round (prixdesmedicaments_original * _multiplicateur)); sleep 0.2; publicvariable "prixdesmedicaments";
		prixdurequins = (round (prixdurequins_original * _multiplicateur)); sleep 0.2; publicvariable "prixdurequins";
		prixserpenttransforme = (round (prixserpenttransforme_original * _multiplicateur)); sleep 0.2; publicvariable "prixserpenttransforme";
	};
	
	_detail_du_log = format ["Actuellement %1 fois le prix de base !", _multiplicateur];
	["Prix du farming", "Actualisé toutes les 10 minutes.", "Multiplicateur farming :", _detail_du_log] call saveToDB; sleep 0.3;

	sleep 100;
};


