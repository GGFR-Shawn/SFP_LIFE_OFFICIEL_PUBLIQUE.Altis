// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};

while {sfp_config_activer_faim} do
{
	sleep 160;
	
	if (isnil "temps_activation_effet_drogue_heroine") then
	{
		if (player getvariable "niveau_de_faim" > 100) then {player setVariable["niveau_de_faim",100,false];};
		
		player setVariable["niveau_de_faim",(player getVariable "niveau_de_faim") - 1,false];
		
		if (player getVariable "niveau_de_faim" == 50) then
		{
			hint "Vous avez faim ! Manger ou vous mourrez !"; 
		};
		
		if (player getVariable "niveau_de_faim" == 20) then
		{
			hint "Vous avez de plus en plus faim ! Manger ou vous mourrez !"; 
		};
		
		if (player getVariable "niveau_de_faim" < 1) then
		{
			player setDamage 1;
			hint "Vous êtes mort de faim !"; 
			sleep 4;
			player setVariable["niveau_de_faim",100,false];
		};
	};
};
 