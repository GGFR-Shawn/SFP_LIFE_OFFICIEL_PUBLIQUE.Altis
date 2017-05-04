// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

jepeuxencoreconsultercombiendoffredemploi = round (14 + (random 20));
reinitialisersidepasse = jepeuxencoreconsultercombiendoffredemploi;
while {true} do
{
	sleep (100 + (random 300));
	direcombiendetravaildisponible = 1;
	jepeuxencoreconsultercombiendoffredemploi = jepeuxencoreconsultercombiendoffredemploi + 1;
	jepeuxencoreconsultercombiendoffredemploi = floor jepeuxencoreconsultercombiendoffredemploi;
	if (jepeuxencoreconsultercombiendoffredemploi > reinitialisersidepasse) then {jepeuxencoreconsultercombiendoffredemploi = reinitialisersidepasse;};
	if (jepeuxencoreconsultercombiendoffredemploi < 0) then {jepeuxencoreconsultercombiendoffredemploi = 0;};
};
	