// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

while {tempsavantmort > 0} do
{
	tempsavantmort = tempsavantmort - 2;
	sleep 120;
	
	if (isnil "jesuismalade") then {jesuismalade = 0;};
	if (jesuismalade < 1) exitwith {};
	hint format ["! MALADIE DANGEREUSE ! \n\n Attention encore %1 minutes avant ton déces si tu ne te soignes pas ! \n Seul l'hopital peut te soigner ! \n------------------------\n By SFP Maxou",tempsavantmort];
	
	if ((tempsavantmort <= 0) && (jesuismalade == 1)) then {player setdamage 1;};
};