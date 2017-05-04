// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_deletebase_voitures","_delete_section_voitures","_saveToDB_deux","_saveToDB","_array","_varName","_varValue","_saveArray","_loadFromDB_voitures","_loadFromDB","_type","_loadArray"];

// ======================================================================================================================================================================================== //
																				// VOITURES
// ======================================================================================================================================================================================== //

heure_sfp =
{
	_heure = "getTimeStamp" call (["new", _this] call OO_INIDBI);
	_heure
};

historique_creation_log_sfp =
{
	_le_message = _this;
	if (isnil "_le_message") then {_le_message = "Erreur information LOG SFP ...";};
	
	systemchat _le_message;
	diag_log _le_message;
};

verification_si_donnee_existe =
{
	private ["_condition","_valeur"];
	_condition = true;
	_valeur = _this select 0;
	if (isnil "_valeur") then {_valeur == "test_valeur_existe";};
	
	if (typename _valeur == "STRING") then 
	{
		if (_valeur == "test_valeur_existe") then 
		{
			_condition = false;
		};
	};
	_condition
};

base_de_donnee_existante =
{
	_nom_de_la_base_compile = ["new", _this] call OO_INIDBI;
	"exists" call _nom_de_la_base_compile;
};

delete_fichier_entier =
{
	_nom_de_la_base_compile = ["new", _this] call OO_INIDBI;
	"delete" call _nom_de_la_base_compile;
};

delete_section =
{
	_nom_de_la_base_compile = ["new", _this select 0] call OO_INIDBI;
	["deleteSection", _this select 1] call _nom_de_la_base_compile;
};

loadFromDB =
{
	_nom_de_la_base_compile = ["new", _this select 0] call OO_INIDBI;
	_valeur = ["read", [_this select 1, _this select 2, _this select 3]] call _nom_de_la_base_compile;
	
	// Verif si existe sinon renvoi test_valeur_existe
	_condition = true;
	if (typename _valeur == "STRING") then {if (_valeur == "test_valeur_existe") then {_condition = false;};};
	if !(_condition) exitwith {}; 

	accountToClient = [_this select 0, _this select 1, _this select 2, _valeur];
	publicVariable 'accountToClient';
};

loadFromDB_Local_Serveur =
{
	_nom_de_la_base_compile = ["new", _this select 0] call OO_INIDBI;
	_valeur = ["read", [_this select 1, _this select 2, _this select 3]] call _nom_de_la_base_compile;
	_valeur;
};

saveToDB =
{
	_nom_de_la_base_compile = ["new", _this select 0] call OO_INIDBI;
	["write", [_this select 1, _this select 2, _this select 3]] call _nom_de_la_base_compile;
};

"accountToServerSave" addPublicVariableEventHandler {(_this select 1) spawn saveToDB;};
"accountToServerLoad" addPublicVariableEventHandler {(_this select 1) spawn loadFromDB;};
"accountToServer_delete_section" addPublicVariableEventHandler {(_this select 1) spawn delete_section;};

fin_server_gather = true;
"DIAG SFP : INIDBI 2 : Fin Initialisation." spawn historique_creation_log_sfp;
