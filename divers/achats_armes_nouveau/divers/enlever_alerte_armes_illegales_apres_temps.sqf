// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
temps_restant_pour_armes_illegales = round (10 + (random 20));

while {alive player && temps_restant_pour_armes_illegales > 0 && !isnil {player getvariable "recherche_pour_armes_illegales"}} do
{
	sleep 10;
	player globalChat format["Encore %1 minutes et ton indice de recherche pour armes illégales sera réinitialisé !",round temps_restant_pour_armes_illegales];
	sleep 110;
	temps_restant_pour_armes_illegales = temps_restant_pour_armes_illegales - 2;
};

if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable ["recherche_pour_armes_illegales",nil,true];};
temps_restant_pour_armes_illegales = nil;