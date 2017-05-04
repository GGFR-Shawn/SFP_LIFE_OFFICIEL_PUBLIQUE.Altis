// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 3; alive player && player getVariable "mon_livret_a" > 0};

while {true} do 
{
	sleep 1200;
	
	if ((player getVariable "mon_livret_a") < sfp_config_montant_max_livret_A) then
	{
		_les_sous_sur_mon_livret = player getVariable "mon_livret_a";
		_interet = _les_sous_sur_mon_livret / 100;
		_interet_deux = _interet * sfp_config_montant_interet_livret_A;
		_interet_trois = ((_les_sous_sur_mon_livret) + (_interet_deux));
		
		player setVariable["mon_livret_a",_interet_trois,true];
		if ((player getVariable "mon_livret_a") > sfp_config_montant_max_livret_A) then {player setVariable["mon_livret_a",sfp_config_montant_max_livret_A,false];};

		hint format ["! MON LIVRET A ! \n ---------------------------------- \n L'argent sur mon livret me rapporte %1 Euros. Mon livret à maintenant %2 Euros. \n -------------------------------- \n www.sfpteam.fr\n By Maxou",_interet_deux, (player getVariable "mon_livret_a")];
	}else
	{
		hint format ["! MON LIVRET A ! \n ---------------------------------- \n L'argent sur mon livret A à atteint son maximum soit %1 Euros. \n -------------------------------- \n www.sfpteam.fr\n By Maxou", sfp_config_montant_max_livret_A];
	};
};