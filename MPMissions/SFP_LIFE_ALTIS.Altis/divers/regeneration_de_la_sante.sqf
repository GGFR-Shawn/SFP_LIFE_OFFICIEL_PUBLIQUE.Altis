//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {alive player};

private "_degat_minimum_avant_regeneration";
while {sfp_config_activer_regeneration_de_sante} do
{
	waituntil {sleep 2; damage player > 0;};
	
	// Effet Médicaments Sur La Regénération De La Vie
	if (isnil "temps_activation_effet_drogue_medicaments") then 
	{
		_degat_minimum_avant_regeneration = 0.25;
	}else
	{
		_degat_minimum_avant_regeneration = 0.75;
	};
		
	while {damage player > 0 && damage player <= _degat_minimum_avant_regeneration && player getvariable "toilette_by_sfp_maxou" > 0} do
	{
		sleep 6;
		if (isnil "avertir_regeneration") then {avertir_regeneration = 1; cuttext ["\n\n\n\n\n\n\n Regénération de votre vie en cours ... !","PLAIN",2];};
		_damage_actuel = damage player;
		_rajouter_la_vie = _damage_actuel - 0.01;
		player setdamage _rajouter_la_vie;
	};
};