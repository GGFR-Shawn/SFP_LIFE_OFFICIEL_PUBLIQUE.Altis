// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_objet_mission_intervention_une = _this select 0;
_objet_mission_intervention_deux = _this select 1;
_civil_un = _this select 2;
_civil_deux = _this select 3;
_le_marqueur = _this select 4;

_attente = 1200;
while {_attente > 0 && alive _objet_mission_intervention_une && alive _objet_mission_intervention_deux} do
{
	_attente = round (_attente - 1);
	sleep 1;
};


deletemarkerlocal _le_marqueur;
deletevehicle _objet_mission_intervention_une;
deletevehicle _objet_mission_intervention_deux;
deletevehicle _civil_un;
deletevehicle _civil_deux;
