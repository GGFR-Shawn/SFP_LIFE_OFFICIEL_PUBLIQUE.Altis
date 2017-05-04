// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};

while {sfp_config_activer_soif} do
{
	sleep (150 + (random 30));;
	
	if (isnil "temps_activation_effet_drogue_heroine") then
	{
		if (niveau_de_soif > 100) then {niveau_de_soif = 100;};
		
		niveau_de_soif = round (niveau_de_soif - 1);
		
		if (niveau_de_soif == 50) then
		{
			hint "Vous êtes en train de vous déshydrater ! Buvez ou vous mourrez !"; 
		};
		
		if (niveau_de_soif == 20) then
		{
			hint "Vous êtes de plus en plus déshydraté ! Buvez ou vous mourrez !"; 
		};
		
		if (niveau_de_soif < 1) then
		{
			player setDamage 1;
			hint "Vous êtes mort de soif !"; 
		};
	};
};
 