// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};

while {sfp_config_activer_dormir} do
{
	sleep 2;
	if (isnil "temps_activation_effet_drogue_cannabis") then
	{
		// Cafe
		if (player getvariable "thirstLevel_cafe" <= 0) then 
		{
			sleep 120;
		}else
		{
			sleep 131;
			player setvariable ["thirstLevel_cafe",(player getvariable "thirstLevel_cafe") - 1,false];
		};
		
		// Dormir
		player setVariable["fautdormir",round ((player getVariable "fautdormir") - 1),false];
		if (player getVariable "fautdormir" == 50) then	{hint "Vous êtes fatigué ! Pensez à aller dormir.";};
		if (player getVariable "fautdormir" == 20) then	{hint "Vous êtes de plus en plus fatigué ! Vous allez bientôt tomber de fatigue !";};
		if (player getVariable "fautdormir" == 0) then 
		{
			hint "Vous êtes tombé de fatigue ! Allez dormir !";
			disableUserInput true;
			player switchMove "TestSurrender";
			sleep 9;
			disableUserInput false;
			player setVariable["fautdormir",1,false];
			sleep 2;
			player setVariable["fautdormir",2,false];
		};
	};
};
 