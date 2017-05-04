// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2;!isnil "fin_verification_apres_chargement"};

while {player getvariable "evade_de_prison" > 0} do
{
	if (isnil "premiere_fois_habit_de_prison") then
	{
		premiere_fois_habit_de_prison = true;
		player forceAddUniform "U_Rangemaster";
		sleep 1;
		player setObjectTextureGlobal [0, "textures\tenue_prisonnier.jpg"];
	};
	
	_habit_actuel_prisonnier = uniform player;
	if (_habit_actuel_prisonnier != "U_Rangemaster") then 
	{
		player forceAddUniform "U_Rangemaster";
		sleep 1;
		player setObjectTextureGlobal [0, "textures\tenue_prisonnier.jpg"];
	};
	sleep 2;
};

premiere_fois_habit_de_prison = nil;