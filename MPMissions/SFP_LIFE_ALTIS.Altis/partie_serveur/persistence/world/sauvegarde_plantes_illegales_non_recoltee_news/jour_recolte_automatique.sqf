// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_la_plante";
_la_plante = _this select 0;
if (isnil "_la_plante") exitwith {_heure_enregistrement = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime]; ["Historique SERVEUR Achat Plantes Illegales", "Liste retours serveur achats plantes illegales", _heure_enregistrement, "Erreur plante script recolte automatique."] call saveToDB;};

"DIAG SFP : Plantes illégales : Lancement vérification de la récolte." spawn historique_creation_log_sfp;

while {alive _la_plante} do
{	
	_la_plante setvariable ["jour_recolte",(_la_plante getvariable "jour_recolte") - 10,true];
	if (_la_plante getvariable "jour_recolte" < -2160) then {deletevehicle _la_plante;};
	
	_temps_attente = 700;
	while {alive _la_plante && _temps_attente > 1} do
	{
		_temps_attente = round (_temps_attente - 1);
		sleep 1;
	};
};