//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

private ["_veh", "_condition"];

_veh = vehicle player;
_condition = {_retour = false;if (surfaceIsWater getPosATL vehicle player) then {_retour = true;};if (count (nearestObjects [vehicle player, ["Land_ReservoirTank_Airport_F"], 20]) >= 1) then {_retour = true;};_retour};

if ((vehicle player) getvariable "reservoir_d_eau_pour_pompier" >= 300) exitwith {hint "Désolé, ce camion est remplit d'eau !";};
if (speed player > 1) exitwith {hint "Désolé, il faut être à l'arret pour remplir ce véhicule d'eau !";};
if !([] call _condition) exitwith {hint "Désolé, tu n'es pas dans l'eau ou à proximité d'un chateau d'eau !";};

je_recharge_en_eau_pour_camion = 1;

while {_veh getvariable "reservoir_d_eau_pour_pompier" < 300 && alive (vehicle player) && ((assignedVehicleRole player) select 0) == "Driver"} do
{
	if (speed player < 1 && vehicle player != player) then
	{
		if ([] call _condition) then
		{
			_veh setvariable ["reservoir_d_eau_pour_pompier",(_veh getvariable "reservoir_d_eau_pour_pompier") + (round (random 10)),false];
			if (_veh getvariable "reservoir_d_eau_pour_pompier" > 300) then {_veh setvariable ["reservoir_d_eau_pour_pompier",300,true];};
			titletext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Capacité restante à remplir : %1 / 300 litres d'eau.",round (_veh getvariable "reservoir_d_eau_pour_pompier")],"PLAIN"];
			sleep 1;
		}else
		{
			titletext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Tu n'est plus dans l'eau ou à proximité d'un chateau d'eau !","PLAIN"];
			sleep 1;
		};
	}else
	{
		titletext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Tu ne dois pas bouger et être dans ton camion pour continuer à le remplir.","PLAIN"];
		sleep 1;
	};
};

// Diffusion publique
_veh setvariable ["reservoir_d_eau_pour_pompier", (_veh getvariable "reservoir_d_eau_pour_pompier"), true];

je_recharge_en_eau_pour_camion = nil;