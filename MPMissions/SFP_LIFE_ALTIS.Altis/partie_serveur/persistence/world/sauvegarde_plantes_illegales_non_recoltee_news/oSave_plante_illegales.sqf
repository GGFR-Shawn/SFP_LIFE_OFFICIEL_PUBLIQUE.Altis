// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

compilation_enregistrement_des_plantes_illegales_serveur =
{
	"DIAG SFP : Plantes illégales : Lancement compilation de sauvegarde." spawn historique_creation_log_sfp;

	_la_plante_illegale = _this select 0;
	_objSaveName = _this select 1;
	if (isnil "_la_plante_illegale" or isnil "_objSaveName") exitwith {diag_log "Diag SFP : Erreur compil plantes illegales";};
	
	_classname = typeOf _la_plante_illegale;

	_pos = getPosATL _la_plante_illegale;
	_dir = [vectorDir _la_plante_illegale] + [vectorUp _la_plante_illegale];
	_jour_recolte = _la_plante_illegale getVariable "jour_recolte";
	_niveau_eau = _la_plante_illegale getVariable "niveau_eau";
	_fertilisant_rouge = _la_plante_illegale getVariable "item_plante_fertilisant_rouge";

	["sauvegarde_plantes_illegales", _objSaveName, "classname", _classname] call saveToDB;
	["sauvegarde_plantes_illegales", _objSaveName, "pos", _pos] call saveToDB;
	["sauvegarde_plantes_illegales", _objSaveName, "dir", _dir] call saveToDB;
	["sauvegarde_plantes_illegales", _objSaveName, "jour_recolte", _jour_recolte] call saveToDB;
	["sauvegarde_plantes_illegales", _objSaveName, "niveau_eau", _niveau_eau] call saveToDB;
	["sauvegarde_plantes_illegales", _objSaveName, "item_plante_fertilisant_rouge", _fertilisant_rouge] call saveToDB;
};

re_scanner_la_plante_illegale =
{
	"DIAG SFP : Plantes illégales : Lancement d'un rescan de plante." spawn historique_creation_log_sfp;

	_la_plante = _this select 0;
	if (isnil "_la_plante") exitwith {_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime]; ["Historique SERVEUR Achat Plantes Illegales", "Liste retours serveur achats plantes illegales", _heure_enregistrement, "Erreur plante sur demande de rescan."] call saveToDB;};
	
	[_la_plante, _la_plante getvariable "numero_de_la_plante_illegale"] spawn compilation_enregistrement_des_plantes_illegales_serveur;
};

suppression_de_la_plante_illegale = 
{
	"DIAG SFP : Plantes illégales : Lancement d'une suppression de plante." spawn historique_creation_log_sfp;

	_this spawn
	{
		_la_plante = _this select 0;
		if (isnil "_la_plante") exitwith {_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime]; ["Historique SERVEUR Achat Plantes Illegales", "Liste retours serveur achats plantes illegales", _heure_enregistrement, "Erreur plante sur une suppression."] call saveToDB;};
		
		_objSaveName = format ["%1",_la_plante];
		
		_listes_des_plantes_achetees = ["sauvegarde_plantes_illegales", "Informations plantes", "Listes des numeros des plantes", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_plantes_achetees_actuel = ["sauvegarde_plantes_illegales", "Informations plantes", "Nombre de plantes actuels actuels", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		if !([_listes_des_plantes_achetees] call verification_si_donnee_existe) then {_listes_des_plantes_achetees = [];};
		if !([_nombre_de_plantes_achetees_actuel] call verification_si_donnee_existe) then {_nombre_de_plantes_achetees_actuel = -1;};
		
		_nombre_de_plantes_achetees_actuel = round (_nombre_de_plantes_achetees_actuel - 1);
		_listes_des_plantes_achetees = _listes_des_plantes_achetees - [_la_plante];
				
		["sauvegarde_plantes_illegales", "Informations plantes", "Nombre de plantes actuels actuels", _nombre_de_plantes_achetees_actuel] call saveToDB;
		["sauvegarde_plantes_illegales", "Informations plantes", "Listes des numeros des plantes", _listes_des_plantes_achetees] call saveToDB;
		["sauvegarde_plantes_illegales", _objSaveName] call delete_section;
			
		_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_log = format ["%1 a ete supprime !", _objSaveName];
		["Historique SERVEUR Achat Plantes Illegales", "Liste retours serveur achats plantes illegales", _heure_enregistrement, _detail_log] call saveToDB;
	};
};

"nouvel_achat_plante_illegale" addPublicVariableEventHandler 
{
	"DIAG SFP : Plantes illégales : Lancement d'une sauvegarde de plante." spawn historique_creation_log_sfp;

	[] spawn
	{
		if (isnil "nouvel_achat_plante_illegale") exitwith {};
		
		_la_plante_illegale = nouvel_achat_plante_illegale;
		nouvel_achat_plante_illegale = nil;
		
		_listes_des_plantes_achetees = ["sauvegarde_plantes_illegales", "Informations plantes", "Listes des numeros des plantes", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_plantes_illegales_achetes_totales = ["sauvegarde_plantes_illegales", "Informations plantes", "Nombre de plantes achetees depuis le debut", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		_nombre_de_plantes_achetees_actuel = ["sauvegarde_plantes_illegales", "Informations plantes", "Nombre de plantes actuels actuels", "test_valeur_existe"] call loadFromDB_Local_Serveur;
		if !([_listes_des_plantes_achetees] call verification_si_donnee_existe) then {_listes_des_plantes_achetees = [];};
		if !([_nombre_de_plantes_illegales_achetes_totales] call verification_si_donnee_existe) then {_nombre_de_plantes_illegales_achetes_totales = -1;};
		if !([_nombre_de_plantes_achetees_actuel] call verification_si_donnee_existe) then {_nombre_de_plantes_achetees_actuel = -1;};
		
		_objSaveName = format ["Plante_Illegale_%1",round (_nombre_de_plantes_illegales_achetes_totales + 1)];
		
		_nombre_de_plantes_illegales_achetes_totales = round (_nombre_de_plantes_illegales_achetes_totales + 1);
		_nombre_de_plantes_achetees_actuel = round (_nombre_de_plantes_achetees_actuel + 1);
		_listes_des_plantes_achetees = [_listes_des_plantes_achetees, _objSaveName] call BIS_fnc_arrayPush;
				
		_numero_de_la_plante_illegale = format ["Plante_Illegale_%1",_nombre_de_plantes_illegales_achetes_totales];
		_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];

		_les_nom_a_proximite_de_la_plante = [];
		{if (isplayer _x) then {_les_nom_a_proximite_de_la_plante = _les_nom_a_proximite_de_la_plante + [name _x];};} foreach (nearestObjects [position _la_plante_illegale, ["Man"], 20]);

		["sauvegarde_plantes_illegales", "Informations plantes", "Nombre de plantes actuels actuels", _nombre_de_plantes_achetees_actuel] call saveToDB;
		["sauvegarde_plantes_illegales", "Informations plantes", "Nombre de plantes achetees depuis le debut", _nombre_de_plantes_illegales_achetes_totales] call saveToDB;
		["sauvegarde_plantes_illegales", "Informations plantes", "Listes des numeros des plantes", _listes_des_plantes_achetees] call saveToDB;
		["sauvegarde_plantes_illegales", _objSaveName, "Date achat", _heure_enregistrement] call saveToDB;
		["sauvegarde_plantes_illegales", _objSaveName, "Proprietaire et personnes proches", _les_nom_a_proximite_de_la_plante] call saveToDB;
		
		_detail_log = format ["La plante illegale de %1 à bien été sauvegardée !", _les_nom_a_proximite_de_la_plante];
		["Historique SERVEUR Achat Plantes Illegales", "Liste retours serveur achats plantes illegales", _heure_enregistrement, _detail_log] call saveToDB;
		
		_la_plante_illegale setVariable ["numero_de_la_plante_illegale",_numero_de_la_plante_illegale, true];
		_la_plante_illegale setvariable ["jour_recolte",(round (3200 + (random 2000))),true];
		_la_plante_illegale setvariable ["niveau_eau",(round (30 + (random 70))),true];
		_la_plante_illegale setvariable ["item_plante_fertilisant_rouge",0,true];
		_la_plante_illegale setvariable ["c_est_une_plante_illegal",1,true];
		sleep 3;
		[_la_plante_illegale] execvm "partie_serveur\persistence\world\sauvegarde_plantes_illegales_non_recoltee_news\besoin_en_eau_automatique.sqf"; 
		[_la_plante_illegale] execvm "partie_serveur\persistence\world\sauvegarde_plantes_illegales_non_recoltee_news\jour_recolte_automatique.sqf"; 

		[_la_plante_illegale, _objSaveName] spawn compilation_enregistrement_des_plantes_illegales_serveur;
	};
};