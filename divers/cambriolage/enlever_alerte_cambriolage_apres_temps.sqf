// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};
private "_temps_restant_de_cambriolage";
_temps_restant_de_cambriolage = round (10 + (random 20));

while {alive player && _temps_restant_de_cambriolage > 0 && !isnil {player getvariable "jai_fait_un_cambriolage_news"}} do
{
	player globalChat format["Encore %1 minutes et ton indice de recherche pour cambriolage sera réinitialisé !",round _temps_restant_de_cambriolage];
	sleep 120;
	_temps_restant_de_cambriolage = _temps_restant_de_cambriolage - 2;
};

if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then 
{
	player setVariable["jai_fait_un_cambriolage_news",nil,true];
};