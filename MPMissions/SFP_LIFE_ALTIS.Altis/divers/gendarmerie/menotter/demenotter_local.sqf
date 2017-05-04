// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call detection_du_joueur_arrete_gendarmerie;

if (!isnil {le_joueur_arrete_gendarmerie getvariable "joueur_menotte"}) then {le_joueur_arrete_gendarmerie setVariable["joueur_menotte",nil,true];};
detach le_joueur_arrete_gendarmerie;

[[[le_joueur_arrete_gendarmerie],"divers\gendarmerie\menotter\demenotter_synchronisation.sqf"],"BIS_fnc_execVM",le_joueur_arrete_gendarmerie,false] spawn BIS_fnc_MP;