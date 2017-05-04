// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2; !isnil "fin_de_chargement_des_maisons"};

"DIAG SFP : Chargement objets décoration : Lancement 1/3." spawn historique_creation_log_sfp;

_check = ("sauvegarde_objets_decorateurs") call base_de_donnee_existante;
if !(_check) exitwith {sleep 0.3; execvm "partie_serveur\persistence\world\sauvegarde_objets_decorateur\oSave_objets_decorateur.sqf";};
_objectscount = ["sauvegarde_objets_decorateurs", "Count", "Count", "test_valeur_existe"] call loadFromDB_Local_Serveur;
if !([_objectscount] call verification_si_donnee_existe) exitwith {sleep 0.3; execvm "partie_serveur\persistence\world\sauvegarde_objets_decorateur\oSave_objets_decorateur.sqf";};

"DIAG SFP : Chargement objets décoration : Lancement 2/3." spawn historique_creation_log_sfp;

for "_i" from 0 to (_objectscount - 1) do
{
	_objSaveName = format["Objet Decorateur Numero %1", _i];
	
	_class = ["sauvegarde_objets_decorateurs", _objSaveName, "classname", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_pos = ["sauvegarde_objets_decorateurs", _objSaveName, "pos", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	_dir = ["sauvegarde_objets_decorateurs", _objSaveName, "dir", "test_valeur_existe"] call loadFromDB_Local_Serveur;
	
	if ([_pos] call verification_si_donnee_existe) then
	{
		_verif_maison_chargement_serveur = nearestObjects [_pos, ["house"], 60];
			
		if (count _verif_maison_chargement_serveur > 0) then
		{	
			if (!isnil {_verif_maison_chargement_serveur select 0 getvariable "proprietaire_de_la_maison"}) then
			{
				if ([_objSaveName] call verification_si_donnee_existe && [_class] call verification_si_donnee_existe && [_pos] call verification_si_donnee_existe && [_dir] call verification_si_donnee_existe) then 
				{
					_obj = createVehicle [_class,[_pos select 0, _pos select 1, 1], [], 0, "can_collide"];					
					_obj setVectorDirAndUp _dir;
					clearWeaponCargoGlobal _obj;
					clearMagazineCargoGlobal _obj;
					clearItemCargoGlobal _obj;
					sleep 0.2;

					_obj setvariable ["object_decoration_interieur",true, true];
				};
			};
		};
	};
};

execVM "partie_serveur\persistence\world\sauvegarde_objets_decorateur\oSave_objets_decorateur.sqf";

diag_log format["Diag SFP : Chargement de %1 objet decorateur de iniDB", _objectscount];
"DIAG SFP : Chargement objets décoration : Lancement 3/3." spawn historique_creation_log_sfp;
