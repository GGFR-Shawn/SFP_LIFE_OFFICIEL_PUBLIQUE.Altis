// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "jedemandedurenfort") then {jedemandedurenfort = 0;};
if (jedemandedurenfort >= 1) exitwith {hint "Désolé, tu viens déjà de demander de l'aide ... Patiente.";};
jedemandedurenfort = 1;

hint "Ta demande à bien été prise en compte ! \n Les gendarmes ont étés avertis ;)";

[[[player],"divers\gendarmerie\appel_d_urgence_synchro.sqf"],"BIS_fnc_execVM",west,false] spawn BIS_fnc_MP;

tempsavanteffacement = 50;
while {tempsavanteffacement > 0} do {sleep 1; tempsavanteffacement = tempsavanteffacement - 1;};

jedemandedurenfort = 0;
