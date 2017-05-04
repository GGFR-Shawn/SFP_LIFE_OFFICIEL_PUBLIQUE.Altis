// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_travailleur = _this select 0;
if (isnil "_le_travailleur") exitwith {hint "Erreur travailleur ...";};

while {alive _le_travailleur && _le_travailleur getvariable "je_peux_travailler" >= 1} do
{
	_le_travailleur playActionNow "medicstartup";
	sleep 4;
};

_le_travailleur switchmove "";
