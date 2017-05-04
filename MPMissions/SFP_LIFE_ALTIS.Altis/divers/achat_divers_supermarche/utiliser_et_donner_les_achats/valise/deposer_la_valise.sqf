// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_surface = surfaceType getPosATL player;
_verificationsurface = ["#GdtAsphalt"];
if (_surface in _verificationsurface) exitwith {hint "Désolé, tu ne peux pas mettre la valise sur la route !";};

player allowdamage false;
jai_prit_une_valise = 0;
deposer_la_valise = 1;
jai_prit_la_valise = 0;

if (isnil "pointeur_valise") then 
{
	pointeur_valise = createVehicle ["Sign_Arrow_Large_Yellow_F", getPosATL la_valise, [], 0, "CAN_COLLIDE"];	
	pointeur_valise setPosATL [(getPosATL pointeur_valise select 0),(getPosATL pointeur_valise select 1),(getPosATL pointeur_valise select 2) + 2];
	pointeur_valise attachTo [la_valise,[0,0,2]]; 
	sleep 2;
	player allowdamage true;
	sleep 40;
	deletevehicle pointeur_valise;
	pointeur_valise = nil;
};

sleep 1;
player allowdamage true;
