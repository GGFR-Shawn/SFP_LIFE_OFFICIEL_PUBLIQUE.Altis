// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_la_plante","_numero_de_plante"];
_la_plante = _this select 0;
_numero_de_plante = _la_plante getvariable "numero_de_la_plante_illegale";
if (isnil "_la_plante" or isnil "_numero_de_plante") exitwith {_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime]; ["Historique SERVEUR Achat Plantes Illegales", "Liste retours serveur achats plantes illegales", _heure_enregistrement, "Erreur plante script besoin en eau."] call saveToDB;};

"DIAG SFP : Plantes illégales : Lancement vérification en eau." spawn historique_creation_log_sfp;

while {alive _la_plante} do
{
	_la_plante setvariable ["niveau_eau",(_la_plante getvariable "niveau_eau") - 1,true];
	if (_la_plante getvariable "niveau_eau" < 0) then {deletevehicle _la_plante;};
	
	[_la_plante] call re_scanner_la_plante_illegale;
	
	_temps_attente = 1240;
	while {alive _la_plante && _temps_attente > 1} do
	{
		_temps_attente = round (_temps_attente - 1);
		sleep 1;
	};
};

[_numero_de_plante] call suppression_de_la_plante_illegale;