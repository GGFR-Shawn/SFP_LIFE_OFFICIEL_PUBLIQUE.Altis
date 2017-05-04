// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !(surfaceIsWater getPosATL player) exitwith {hint "Désolé, tu n'es pas au dessus de l'eau !";};
if ((getPosASL player) select 2 > 4) exitwith {hint format ["Désolé, tu es à %1 mètres de l'eau et tu devrais être à moins de 4 mètres pour remplir l'hélicoptère d'eau !",round (getPosASL player select 2)];};
if (speed player > 1) exitwith {hint "Désolé, il faut être à l'arret !";};
if ((vehicle player) getvariable "reservoir_d_eau_pour_pompier" >= 800) exitwith {hint "Désolé, l'hélicoptère est remplit d'eau !";};

fin_remplissage_helicoptere_pompier = nil;
je_recharge_en_eau_pour_helicoptere = 1;
capacite_eau_helicoptere = (vehicle player) getvariable "reservoir_d_eau_pour_pompier";

while {isnil "fin_remplissage_helicoptere_pompier" && alive (vehicle player) && ((assignedVehicleRole player) select 0) == "Driver"} do
{
	if (speed player < 1) then
	{
		if ((getPosATL player) select 2 < 4) then
		{
			if (surfaceIsWater getPosATL player) then
			{
				capacite_eau_helicoptere = round (capacite_eau_helicoptere + 60);
				if (capacite_eau_helicoptere > 800) then {capacite_eau_helicoptere = 800; fin_remplissage_helicoptere_pompier = true;};
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Capacité restante à remplir : %1 / 800 litres d'eau.",capacite_eau_helicoptere],"PLAIN"];
				sleep 1;
			}else
			{
				titletext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Tu n'est plus au dessus de l'eau !","PLAIN"];
				sleep 1;
			};
		}else
		{
			titletext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Tu es trop haut, redescend à moins de 4 mètres.","PLAIN"];
			sleep 1;
		};
	}else
	{
		titletext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Tu ne dois pas bouger pour remplir l'hèlicoptère.","PLAIN"];
		sleep 1;
	};
};

if (!alive (vehicle player)) exitwith {};

(vehicle player) setvariable ["reservoir_d_eau_pour_pompier", capacite_eau_helicoptere, true];
je_recharge_en_eau_pour_helicoptere = nil;
capacite_eau_helicoptere = nil;