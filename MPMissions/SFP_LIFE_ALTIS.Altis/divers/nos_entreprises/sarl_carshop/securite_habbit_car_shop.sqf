// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "autoriser_maj_habit") then {autoriser_maj_habit = 0;};
if (autoriser_maj_habit >= 1) exitwith {};
autoriser_maj_habit = 1;

while {alive player} do
{
	sleep 1;
	_habbitactuel = uniform player;
	if (_habbitactuel != "U_Rangemaster") then 
	{
		player forceAddUniform "U_Rangemaster";
		sleep 1;
		player setObjectTextureGlobal [0, "textures\habit_car_shop.jpg"];
	};
};

autoriser_maj_habit = nil;