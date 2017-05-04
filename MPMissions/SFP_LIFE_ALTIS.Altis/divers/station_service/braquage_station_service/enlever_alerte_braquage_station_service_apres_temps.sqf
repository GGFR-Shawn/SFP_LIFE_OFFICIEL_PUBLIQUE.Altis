// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

temps_restant_pour_braquage_banque = round (20 + (random 20)); // Minutes

while {alive player && temps_restant_pour_braquage_banque > 0 && !isnil {player getvariable "recherche_pour_braquage"}} do
{
	sleep 10;
	player globalChat format["Encore %1 minutes et ton indice de recherche pour braquage sera réinitialisé !",round temps_restant_pour_braquage_banque];
	sleep 110;
	temps_restant_pour_braquage_banque = temps_restant_pour_braquage_banque - 2;
};

if (alive player && !isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",nil,true];};