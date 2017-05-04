//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_veh = cursortarget;

if (isnil "duree_de_mon_reservoir") then {duree_de_mon_reservoir = 0;}; // 300 max

je_recharge_en_eau_pour_extincteur = 1;

while {cursortarget getvariable "reservoir_d_eau_pour_pompier" > 0 && alive player && alive cursortarget && duree_de_mon_reservoir <= 1000} do
{
	if (speed player < 1) then
	{
		if (cursortarget getvariable "reservoir_d_eau_pour_pompier" > 0) then
		{
			_veh setvariable ["reservoir_d_eau_pour_pompier",(_veh getvariable "reservoir_d_eau_pour_pompier") - (round (random 10)),false];
			duree_de_mon_reservoir = round (duree_de_mon_reservoir + (random 60));
			
			if (_veh getvariable "reservoir_d_eau_pour_pompier" < 0) then {_veh setvariable ["reservoir_d_eau_pour_pompier",0,true];};
			titletext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Capacité restante à remplir : %1 / 100 Pour cents.",round (duree_de_mon_reservoir / 10)],"PLAIN"];
			sleep 1;
		}else
		{
			titletext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Désolé, le camion n'a plus d'eau !","PLAIN"];
			sleep 1;
		};
	}else
	{
		titletext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Tu ne dois pas bouger pour remplir le camion.","PLAIN"];
		sleep 1;
	};
};

// Diffusion publique
_veh setvariable ["reservoir_d_eau_pour_pompier", (_veh getvariable "reservoir_d_eau_pour_pompier"), true];

je_recharge_en_eau_pour_extincteur = nil;
if (!alive player) exitwith {};
