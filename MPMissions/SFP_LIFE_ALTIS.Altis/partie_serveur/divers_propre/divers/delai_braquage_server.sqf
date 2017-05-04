// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

sleep 300;

while {true} do
{
	"DIAG SFP : Delai braquage serveur : Démarrage non autorisation." spawn historique_creation_log_sfp;

	variable_banque_peut_etre_braque = 0;
	publicvariable "variable_banque_peut_etre_braque";
	
	sleep (720 + (random 1200));
	
	variable_banque_peut_etre_braque = 1;
	publicvariable "variable_banque_peut_etre_braque";
	
	"DIAG SFP : Delai braquage serveur : Démarrage autorisation." spawn historique_creation_log_sfp;

	waituntil {sleep 2; variable_banque_peut_etre_braque < 1;};
};	
