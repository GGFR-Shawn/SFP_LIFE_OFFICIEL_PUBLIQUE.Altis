// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_condition";
_condition = true;

sleep 10;

while {_condition} do
{
	sleep 7;

	"DIAG SFP : Sauvegarde objets décoration : Lancement d'une sauvegarde." spawn historique_creation_log_sfp;

	_PersistentDB_ObjCount = 0;
	{
		_object_decorateur_interieur = _x;

		if (!isnil {_object_decorateur_interieur getVariable "object_decoration_interieur"}) then
		{
			_classname = typeof _object_decorateur_interieur;
			_pos = getPosATL _object_decorateur_interieur;
			_dir = [vectorDir _object_decorateur_interieur] + [vectorUp _object_decorateur_interieur];
			
			_objSaveName = format["Objet Decorateur Numero %1", _PersistentDB_ObjCount];
			
			["sauvegarde_objets_decorateurs", _objSaveName, "classname", _classname] call saveToDB;
			["sauvegarde_objets_decorateurs", _objSaveName, "pos", _pos] call saveToDB;
			["sauvegarde_objets_decorateurs", _objSaveName, "dir", _dir] call saveToDB;
			
			_PersistentDB_ObjCount = _PersistentDB_ObjCount + 1;
		};
	    sleep 0.02;
	} forEach allMissionObjects "all";

	["sauvegarde_objets_decorateurs", "Count", "Count", _PersistentDB_ObjCount] call saveToDB;

	diag_log format["Diag SFP : %1 coffre de décoration a bien ete sav dans iniDB", _PersistentDB_ObjCount];

	_temps_attente_avant_sauvegarde = 2900; // Secondes
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitWith {_condition = false;}; // Arreter dernière sauvegarde
	while {_condition && _temps_attente_avant_sauvegarde > 0 && le_serveur_va_redemarrer_dans_20_minutes < 1} do
	{
		_temps_attente_avant_sauvegarde = round (_temps_attente_avant_sauvegarde - 10);
		sleep 10;
	};
	
	if (_condition) then {("sauvegarde_objets_decorateurs") call delete_fichier_entier;};
};
