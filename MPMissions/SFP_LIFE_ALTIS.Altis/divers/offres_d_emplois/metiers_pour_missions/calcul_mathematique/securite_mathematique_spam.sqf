// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

securite_calcul_mathematique_temps = 20;

waituntil {!dialog};

while {securite_calcul_mathematique_temps > 0} do
{
	securite_calcul_mathematique_temps = round (securite_calcul_mathematique_temps - 1);
	sleep 1;
};

securite_calcul_mathematique = nil;
securite_calcul_mathematique_temps = nil;