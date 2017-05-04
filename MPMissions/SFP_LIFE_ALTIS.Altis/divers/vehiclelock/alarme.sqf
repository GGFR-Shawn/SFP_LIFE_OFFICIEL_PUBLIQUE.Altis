// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_veh = _this select 0;
_alarmeoupas = (floor(random 10) + 1);

if (_alarmeoupas == 6) then
{
	hint "Ce véhicle possède une alarme est tu l'as activé en essayant d'ouvrir la porte ! \n --------------------------- \n By SFP Maxou";
	[[[_veh],"divers\vehiclelock\alarme_sonner_a_fond.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
};
