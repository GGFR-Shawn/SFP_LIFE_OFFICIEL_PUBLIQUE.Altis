// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Chargement des maisons : Lancement 1/2." spawn historique_creation_log_sfp;

_listes_des_maisons_achetes = ["sauvegarde_maisons", "Informations maisons", "Listes des numeros", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
if (!([_listes_des_maisons_achetes] call verification_si_donnee_existe)) exitWith {nombre_de_maison_total_achetable = 1136; publicvariable "nombre_de_maison_total_achetable"; execVM "partie_serveur\persistence\world\maison\oSave_maisons.sqf";};
if (count _listes_des_maisons_achetes < 1) exitWith {nombre_de_maison_total_achetable = 1136; publicvariable "nombre_de_maison_total_achetable"; execVM "partie_serveur\persistence\world\maison\oSave_maisons.sqf";};

"DIAG SFP : Chargement des maisons : Lancement 2/2." spawn historique_creation_log_sfp;
	
for "_i" from 0 to (count _listes_des_maisons_achetes - 1) do
{
	_objSaveName = format ["%1", _listes_des_maisons_achetes select _i]; 
	
	_class = ["sauvegarde_maisons", _objSaveName, "classname", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	_pos = ["sauvegarde_maisons", _objSaveName, "pos", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	_leproprietaire = ["sauvegarde_maisons", _objSaveName, "leproprietaire", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	_fermeraclef = ["sauvegarde_maisons", _objSaveName, "fermeraclef", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	_prixdachat = ["sauvegarde_maisons", _objSaveName, "prixdachat", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	_numero_de_la_maison = ["sauvegarde_maisons", _objSaveName, "numerodelamaison", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	
	if (_class != "test_valeur_existe") then
	{
		if (!isnil "_pos") then
		{
			if (count _pos >= 3) then
			{
				_verif_maison_chargement_serveur = nearestObjects [_pos, ["house"], 50];
				diag_log format ["Diag SFP : Chargement de la maison : %1.", _numero_de_la_maison];	
				
				if (count _verif_maison_chargement_serveur > 0) then
				{
					_la_maison = _verif_maison_chargement_serveur select 0;
					
					_la_maison setVariable ["proprietaire_de_la_maison",_leproprietaire, true];
					_la_maison setVariable ["maison_verrouiller_a_clef",_fermeraclef, true];
					_la_maison setVariable ["le_prix_de_la_maison",_prixdachat, true];
					_la_maison setVariable ["numero_de_la_maison",_numero_de_la_maison, true];
				};
			};
		};
	};
};

_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_log = format ["Diag SFP : Chargement de %1 maisons totales.", count _listes_des_maisons_achetes];
["Historique SERVEUR Achat Maison", "Liste retours serveur achats de maisons", _heure_enregistrement, _detail_log] call saveToDB;
"DIAG SFP : Chargement des maisons : Fin de chargement." spawn historique_creation_log_sfp;

nombre_de_maison_total_achetable = round (1136 - (count _listes_des_maisons_achetes));
publicvariable "nombre_de_maison_total_achetable";

sleep 2;

execVM "partie_serveur\persistence\world\maison\oSave_maisons.sqf";