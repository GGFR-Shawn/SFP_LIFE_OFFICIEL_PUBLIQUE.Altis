// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

fin_de_chargement_des_maisons = 1;

"nouvel_achat_maison" addPublicVariableEventHandler 
{
	"DIAG SFP : Sauvegarde des maisons : Lancement d'une sauvegarde d'une maison." spawn historique_creation_log_sfp;
	
	[] spawn
	{
		if (isnil "nouvel_achat_maison") exitwith {};
		
		_la_maison = nouvel_achat_maison;
		nouvel_achat_maison = nil;
		
		_protection_sauvegarde_attente = 50; // Divise par 10 secondes
		while {isnil {_la_maison getvariable "proprietaire_de_la_maison"} && _protection_sauvegarde_attente > 0} do
		{
			sleep 0.1;
			_protection_sauvegarde_attente = round (_protection_sauvegarde_attente - 1);
		};
		if (isnil {_la_maison getvariable "proprietaire_de_la_maison"}) exitwith {};
		
		_listes_des_maisons_achetes = ["sauvegarde_maisons", "Informations maisons", "Listes des numeros", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_maisons_achetees_total = ["sauvegarde_maisons", "Informations maisons", "Nombre de maisons achetees depuis le debut", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_maisons_achetees_actuel = ["sauvegarde_maisons", "Informations maisons", "Nombre de maisons actuels", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		if (!([_listes_des_maisons_achetes] call verification_si_donnee_existe)) then {_listes_des_maisons_achetes = [];};
		if (!([_nombre_de_maisons_achetees_total] call verification_si_donnee_existe)) then {_nombre_de_maisons_achetees_total = -1;};
		if (!([_nombre_de_maisons_achetees_actuel] call verification_si_donnee_existe)) then {_nombre_de_maisons_achetees_actuel = -1;};
		
		_objSaveName = format ["Maison numero %1",round (_nombre_de_maisons_achetees_total + 1)];
		
		_nombre_de_maisons_achetees_total = round (_nombre_de_maisons_achetees_total + 1);
		_nombre_de_maisons_achetees_actuel = round (_nombre_de_maisons_achetees_actuel + 1);
		_listes_des_maisons_achetes = [_listes_des_maisons_achetes, _objSaveName] call BIS_fnc_arrayPush;
				
		_classname = typeof _la_maison;
		_pos = getPosATL _la_maison;
		_leproprietaire = _la_maison getVariable "proprietaire_de_la_maison";							
		_fermeraclef = _la_maison getVariable "maison_verrouiller_a_clef";							
		_prixdachat = _la_maison getVariable "le_prix_de_la_maison";							
		_numero_de_la_maison = format ["Maison numero %1",_nombre_de_maisons_achetees_total];
		_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];

		["sauvegarde_maisons", "Informations maisons", "Nombre de maisons actuels", _nombre_de_maisons_achetees_actuel] call saveToDB;
		["sauvegarde_maisons", "Informations maisons", "Nombre de maisons achetees depuis le debut", _nombre_de_maisons_achetees_total] call saveToDB;
		["sauvegarde_maisons", "Informations maisons", "Listes des numeros", _listes_des_maisons_achetes] call saveToDB;

		["sauvegarde_maisons", _objSaveName, "classname", _classname] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "pos", _pos] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "leproprietaire", _leproprietaire] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "fermeraclef", _fermeraclef] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "prixdachat", _prixdachat] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "numerodelamaison", _numero_de_la_maison] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "Date achat", _heure_enregistrement] call saveToDB;
		
		_la_maison setVariable ["numero_de_la_maison",_numero_de_la_maison, true];
		
		nombre_de_maison_total_achetable = round (1136 - _nombre_de_maisons_achetees_actuel);
		publicvariable "nombre_de_maison_total_achetable";
		
		diag_log format ["Diag SFP : Sauvegarde de la maison %1", _objSaveName];
		_detail_log = format ["La maison de %1 à bien été sauvegardé ! Son prix était de %2",_leproprietaire, _prixdachat];
		["Historique SERVEUR Achat Maison", "Liste retours serveur achats de maisons", _heure_enregistrement, _detail_log] call saveToDB;
	};
};

"re_scanner_la_maison" addPublicVariableEventHandler 
{
	"DIAG SFP : Sauvegarde des maisons : Lancement d'un rescan d'une maison." spawn historique_creation_log_sfp;
	
	[] spawn
	{
		if (isnil "re_scanner_la_maison") exitwith {};
		
		_la_maison = re_scanner_la_maison;
		re_scanner_la_maison = nil;
		
		_protection_sauvegarde_attente = 50; // Divise par 10 secondes
		while {isnil {_la_maison getvariable "proprietaire_de_la_maison"} && _protection_sauvegarde_attente > 0} do
		{
			sleep 0.1;
			_protection_sauvegarde_attente = round (_protection_sauvegarde_attente - 1);
		};
		if (isnil {_la_maison getvariable "proprietaire_de_la_maison"}) exitwith {};
		
		_objSaveName = format ["%1",_la_maison getvariable "numero_de_la_maison"];
		_leproprietaire = _la_maison getVariable "proprietaire_de_la_maison";							
		_fermeraclef = _la_maison getVariable "maison_verrouiller_a_clef";							
		
		["sauvegarde_maisons", _objSaveName, "leproprietaire", _leproprietaire] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "fermeraclef", _fermeraclef] call saveToDB;
		
		_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_log = format ["La maison de %1 à été rescanné", _leproprietaire];
		["Historique SERVEUR Achat Maison", "Liste retours serveur achats de maisons", _heure_enregistrement, _detail_log] call saveToDB;
		["sauvegarde_maisons", _objSaveName, "Date du dernier scan", _heure_enregistrement] call saveToDB;
	};
};

"revente_maison_joueur" addPublicVariableEventHandler 
{
	"DIAG SFP : Sauvegarde des maisons : Lancement d'une revente d'une maison." spawn historique_creation_log_sfp;

	[] spawn
	{
		private "_leproprietaire";
		if (isnil "revente_maison_joueur") exitwith {};
		_la_maison = revente_maison_joueur;
		revente_maison_joueur = nil;
		
		_objSaveName = format ["%1",_la_maison];
		
		_listes_des_maisons_achetes = ["sauvegarde_maisons", "Informations maisons", "Listes des numeros", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_maisons_achetees_actuel = ["sauvegarde_maisons", "Informations maisons", "Nombre de maisons actuels", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_leproprietaire = ["sauvegarde_maisons", _objSaveName, "leproprietaire", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		if (!([_listes_des_maisons_achetes] call verification_si_donnee_existe)) then {_listes_des_maisons_achetes = [];};
		if (!([_nombre_de_maisons_achetees_actuel] call verification_si_donnee_existe)) then {_nombre_de_maisons_achetees_actuel = -1;};
		if (!([_leproprietaire] call verification_si_donnee_existe)) then {_leproprietaire = "Inconnu (BUG)";};
		
		_nombre_de_maisons_achetees_actuel = round (_nombre_de_maisons_achetees_actuel - 1);
		_listes_des_maisons_achetes = _listes_des_maisons_achetes - [_la_maison];
				
		["sauvegarde_maisons", "Informations maisons", "Nombre de maisons actuels", _nombre_de_maisons_achetees_actuel] call saveToDB;
		["sauvegarde_maisons", "Informations maisons", "Listes des numeros", _listes_des_maisons_achetes] call saveToDB;
		["sauvegarde_maisons", _objSaveName] call delete_section;

		nombre_de_maison_total_achetable = round (1136 - _nombre_de_maisons_achetees_actuel);
		publicvariable "nombre_de_maison_total_achetable";
	
		diag_log format ["Diag SFP : Revente de la maison %1", _objSaveName];
	
		_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_log = format ["La maison de %1 à été revendu.", _leproprietaire];
		["Historique SERVEUR Achat Maison", "Liste retours serveur achats de maisons", _heure_enregistrement, _detail_log] call saveToDB;
	};
};
