// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != west) exitwith {hint "Désolé, seul les gendarmes peuvent prendre cette douane !";};
if (isnil "checkpointduty") then {checkpointduty = 0;};

if (checkpointduty == 0) then
{
	checkpointduty = 1;
	
	hint "Prise de garde démarrée ... Plus vous restez sur cette zone et plus vous gagnerez d'argent ! Si vous quittez ce poste, la garde s'arretera !";
	
	_position_de_base = getpos player;
	_combien_gagner = 0;
	_combien_de_temps = 0;
	
	while {player distance _position_de_base < 30} do
	{
		_combien_gagner = round (_combien_gagner + 3.05);
		_combien_de_temps = round (_combien_de_temps + 1);
		
		sleep 1;
	};
	
	player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _combien_gagner,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format['Vous avez gagné %1 euros grace à la garde du poste de contrôle qui à duré %2 secondes.', _combien_gagner, _combien_de_temps];
	
	checkpointduty = 0;
}else
{
	hint "Prise de garde déja en cours ...";
};
