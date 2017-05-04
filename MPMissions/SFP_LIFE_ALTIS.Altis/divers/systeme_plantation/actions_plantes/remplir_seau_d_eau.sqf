// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (player getvariable "seau_plante_illegal" < 1) exitwith {hint "Désolé, tu n'as pas de seau ! \n\n Tu peux en acheter un en quincaillerie !";};
if !(surfaceIsWater getPosATL player) exitwith {hint "Désolé, tu n'es pas dans l'eau !";};
if (isnil "niveau_de_mon_reservoir_eau_plante_illegales") then {niveau_de_mon_reservoir_eau_plante_illegales = 0;};

_seaudeau = createVehicle ["Land_Bucket_clean_F", getPosATL player, [], 0, "CAN_COLLIDE"];
_seaudeau attachto [player,[-0.044,-0.03,-0.1],"righthand"];
_seaudeau setdir 88;
player playActionNow "medicstartup";

while {surfaceIsWater getPosATL player && niveau_de_mon_reservoir_eau_plante_illegales < 100} do
{
	niveau_de_mon_reservoir_eau_plante_illegales = round (niveau_de_mon_reservoir_eau_plante_illegales + 20);
	if (niveau_de_mon_reservoir_eau_plante_illegales > 100) then {niveau_de_mon_reservoir_eau_plante_illegales = 100;};
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Votre seau est à : %1 pourcent de sa capacité total !",niveau_de_mon_reservoir_eau_plante_illegales],"PLAIN"];
	sleep 1;
};
deletevehicle _seaudeau;
waitUntil {((animationState player) != "medicstartup")};player switchmove "";

if !(surfaceIsWater getPosATL player) exitwith {0 cuttext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Désolé, tu n'es plus dans l'eau !","PLAIN"];};
if (niveau_de_mon_reservoir_eau_plante_illegales < 100) exitwith {0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Votre seau est à : %1 pourcent de sa capacité total !",niveau_de_mon_reservoir_eau_plante_illegales],"PLAIN"];};
if (niveau_de_mon_reservoir_eau_plante_illegales >= 100) exitwith {0 cuttext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Votre seau est plein !","PLAIN"];};

sleep 1;_debug_animation = 5;
while {_debug_animation > 0} do {sleep 0.5;_debug_animation = _debug_animation - 1; player switchmove "";};