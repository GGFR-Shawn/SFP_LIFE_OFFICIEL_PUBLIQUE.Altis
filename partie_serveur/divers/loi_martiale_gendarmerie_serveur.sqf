// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_temps_choisit";
_temps_choisit = _this select 0;
if (hasinterface) exitwith {};
if (isnil "_temps_choisit") exitwith {};
if (!isnil "temps_restant_loi_martiale") exitwith {"DIAG SFP : Loi Martial : Parametre déja en cours." spawn historique_creation_log_sfp;};

"DIAG SFP : Loi Martial : Parametre validé. Lancement du script." spawn historique_creation_log_sfp;

temps_restant_loi_martiale = _temps_choisit;
publicvariable "temps_restant_loi_martiale";

_lancement_son_toutes_les_minutes = 4;
while {temps_restant_loi_martiale > 0} do
{
	"DIAG SFP : Loi Martial : Lancement du son sur les clients." spawn historique_creation_log_sfp;

	[[[],"divers\gendarmerie\Loi_Martiale\annonce_loi_martiale_synchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	sleep (60 * _lancement_son_toutes_les_minutes);
	
	temps_restant_loi_martiale = round (temps_restant_loi_martiale - _lancement_son_toutes_les_minutes);
	if (temps_restant_loi_martiale < 0) then {temps_restant_loi_martiale = 0;};	
	publicvariable "temps_restant_loi_martiale";
};

temps_restant_loi_martiale = nil;
publicvariable "temps_restant_loi_martiale";

"DIAG SFP : Loi Martial : Fin du script." spawn historique_creation_log_sfp;
