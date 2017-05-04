// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != west) exitwith {hint "Tu ne peux pas faire cette action. \n Seuls les gendarmes peuvent.";};

createDialog "JoueurEnGendarmerieBySFPMaxou";
{
	if (_x distance player < 10) then
	{
		if (isPlayer _x && !isnil {_x getvariable "joueur_arreter"}) then 
		{
			_Playeridx = lbAdd [11165,name _x];
		};
	};
}forEach playableUnits;
