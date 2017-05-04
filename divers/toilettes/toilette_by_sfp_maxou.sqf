//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

while {sfp_config_activer_toilette} do
{
	if (player getvariable "toilette_by_sfp_maxou" > 100) then {player setvariable ["toilette_by_sfp_maxou",100,false];};
	
	sleep 130;
	
	player setvariable ["toilette_by_sfp_maxou",(player getvariable "toilette_by_sfp_maxou") - 1,false];
	
	if (player getvariable "toilette_by_sfp_maxou" == 50) then
	{
		hint "Vous avez la vessie pleine ! Pensez à aller aux toilettes !"; 
	};
	
	if (player getvariable "toilette_by_sfp_maxou" == 30) then
	{
		hint "Vous avez de plus en plus envie d'aller aux toilettes ! \n\n Aller aux toilettes publiques !"; 
	};
	
	if ((player getvariable "toilette_by_sfp_maxou" <= 15) && (player getvariable "toilette_by_sfp_maxou" > 0)) then
	{
		addCamShake [20, 20, 1];
		hint "Attention, vous avez la vessie pratiquement pleine !";
		sleep 6;
	};
	
	if (player getvariable "toilette_by_sfp_maxou" <= 0) then
	{
		player say "Ouille";
		_dommage_progressive = (damage player) + 0.05;
		player setdamage _dommage_progressive;
		hint "Attention, vous avez la vessie pleine et vous perdez de la vie !";
		addCamShake [26, 20, 1];
		sleep 10;
	};
};
 