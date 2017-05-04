// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

titleText ["*** !! La banque centrale à été dérobée !! Le/Les voleurs ont une valise dans leurs mains !! ***", "PLAIN"];

bank_atm2 say "bankalarm";

_temps_sirene_banque = 100;
for "_i" from 0 to (_temps_sirene_banque - 1) do
{
	bank_atm2 say "alarmbank";
	sleep 1;
};
