// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private"_type";
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {};
	
switch (_type) do
{
	case "none": {setTerrainGrid 50; ['graphique_terrain', 50] call uid_sauvegarde_ecrire_local_joueur_sfp;};
	case "low": {setTerrainGrid 30; ['graphique_terrain', 30] call uid_sauvegarde_ecrire_local_joueur_sfp;};
	case "norm": {setTerrainGrid 12.5; ['graphique_terrain', 12.5] call uid_sauvegarde_ecrire_local_joueur_sfp;};
	case "high": {setTerrainGrid 3.125; ['graphique_terrain', 3.125] call uid_sauvegarde_ecrire_local_joueur_sfp;};
};