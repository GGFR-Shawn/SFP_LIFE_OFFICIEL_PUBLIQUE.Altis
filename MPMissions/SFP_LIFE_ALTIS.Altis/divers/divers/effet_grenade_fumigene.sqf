// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "condition_effet_grenade_fumigene"};

while {alive player && sfp_config_activer_effet_grenade_fumigene} do
{
	sleep 2;
	
	if ([] call condition_effet_grenade_fumigene) then
	{
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [10];
		"dynamicBlur" ppEffectCommit 2;
		
		enableCamShake true;
		addCamShake [10, 45, 10];
		[] spawn {while {getStamina player > 10} do {player SetStamina (getStamina player - (random 3)); sleep 0.1;};};
		5 fadeSound 0.1;
		
		waituntil {ppEffectCommitted "dynamicBlur"};
		
		"dynamicBlur" ppEffectAdjust [20];
		"dynamicBlur" ppEffectCommit 0;
		
		waituntil {!([] call condition_effet_grenade_fumigene)};
		
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 7;
		
		[] spawn 
		{
			for "_i" from 0 to 10 do
			{
				addCamShake [_i, _i, _i];
				sleep 0.63;
			};
			resetCamShake;
		};
		10 fadeSound 1;
	};
};