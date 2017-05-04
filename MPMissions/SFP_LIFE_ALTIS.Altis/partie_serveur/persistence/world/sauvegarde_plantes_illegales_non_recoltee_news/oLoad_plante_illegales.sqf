// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_objSaveName","_class","_pos","_dir","_jour_recolte","_niveau_eau","_fertilisant_rouge"];

"DIAG SFP : Plantes illégales : Lancement chargement 1/3." spawn historique_creation_log_sfp;

execVM "partie_serveur\persistence\world\sauvegarde_plantes_illegales_non_recoltee_news\oSave_plante_illegales.sqf";
waituntil {sleep 0.3; !isnil "compilation_enregistrement_des_plantes_illegales_serveur"};

_listes_des_plantes_illegales = ["sauvegarde_plantes_illegales", "Informations plantes", "Listes des numeros des plantes", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
if !([_listes_des_plantes_illegales] call verification_si_donnee_existe) exitwith {};
if (count _listes_des_plantes_illegales < 1) exitwith {};
		
"DIAG SFP : Plantes illégales : Lancement chargement 2/3." spawn historique_creation_log_sfp;

for "_i" from 0 to (count _listes_des_plantes_illegales - 1) do
{
	_objSaveName = format["%1", _listes_des_plantes_illegales select _i]; 
	
	_class = ["sauvegarde_plantes_illegales", _objSaveName, "classname", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_pos = ["sauvegarde_plantes_illegales", _objSaveName, "pos", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_dir = ["sauvegarde_plantes_illegales", _objSaveName, "dir", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_jour_recolte = ["sauvegarde_plantes_illegales", _objSaveName, "jour_recolte", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_niveau_eau = ["sauvegarde_plantes_illegales", _objSaveName, "niveau_eau", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_fertilisant_rouge = ["sauvegarde_plantes_illegales", _objSaveName, "item_plante_fertilisant_rouge", "test_valeur_existe"] call loadFromDB_Local_Serveur;

	if ([_objSaveName] call verification_si_donnee_existe && [_class] call verification_si_donnee_existe && [_pos] call verification_si_donnee_existe && [_dir] call verification_si_donnee_existe) then 
	{
		if (count _pos >= 3) then
		{					
			_obj = createVehicle [_class, [_pos select 0, _pos select 1, 0], [], 0, "can_collide"];
			_obj setVectorDirAndUp _dir;

			_obj setVariable ["jour_recolte",_jour_recolte,true];
			_obj setVariable ["niveau_eau",_niveau_eau,true];
			_obj setVariable ["numero_de_la_plante_illegale", _objSaveName, true];
			_obj setVariable ["c_est_une_plante_illegal",1, true];
			_obj setVariable ["item_plante_fertilisant_rouge", _fertilisant_rouge, true];
	
			sleep 0.5;
			[_obj] execvm "partie_serveur\persistence\world\sauvegarde_plantes_illegales_non_recoltee_news\besoin_en_eau_automatique.sqf"; 
			[_obj] execvm "partie_serveur\persistence\world\sauvegarde_plantes_illegales_non_recoltee_news\jour_recolte_automatique.sqf"; 
		};
	};
	sleep 0.01;
};

_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_log = format ["Diag SFP : Chargement de %1 plantes illegales !", count _listes_des_plantes_illegales];
["Historique SERVEUR Achat Plantes Illegales", "Liste retours serveur achats plantes illegales", _heure_enregistrement, _detail_log] call saveToDB;
"DIAG SFP : Plantes illégales : Lancement chargement 3/3." spawn historique_creation_log_sfp;
