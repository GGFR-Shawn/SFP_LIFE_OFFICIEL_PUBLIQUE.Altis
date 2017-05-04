//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (cursortarget iskindof "man") exitwith {hint "Pas besoin d'eteindre un homme, il serait déjà mort :)";};

lincendie = nil;
condition_incendie_trouve = false;
{
	if (!isnil {_x getvariable "jesuisenfeu"} && !condition_incendie_trouve) then
	{
		lincendie = _x;
		condition_incendie_trouve = true;
	};
} foreach (nearestObjects [getPosATL player, [], 11]);

if (isnil "lincendie") exitwith {hint "Désolé, aucun objet en feu déclaré près de toi sur le serveur SFP !";};
if (lincendie getvariable "jesuisenfeu" <= 0) exitwith {hint "Désolé, ce feu est déjà eteint !";};
if (isnil "duree_de_mon_reservoir") exitwith {hint "Désolé, tu n'as pas d'extincteur !";};
if (duree_de_mon_reservoir <= 0) exitwith {hint "Désolé, tu n'as plus d'eau dans ton extincteur !";};

je_peux_deployer_l_extincteur = 1;
menu_deployer_extincteur = 1;

extincteur = createVehicle ["Land_FireExtinguisher_F", getPosATL player, [], 0, "CAN_COLLIDE"];
extincteur attachto [player,[-0.044,-0.03,-0.2],"righthand"];
extincteur setdir 88;

sleep 1;
execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\extincteur\autonomie_extincteur.sqf";

waituntil {!isnil {lincendie getvariable "temps_pour_eteindre_le_feu"}};

player setvariable ["je_deploie_eau_sfp",true,true];

[[[player, extincteur],"divers\nos_entreprises\sarl_pompier\sarl_pompier_client\extincteur\synchro_animation_exctinteur.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;

waituntil {sleep 0.5; je_peux_deployer_l_extincteur < 1 or duree_de_mon_reservoir <= 0 or !alive lincendie or !alive player};

player setvariable ["je_deploie_eau_sfp",nil,true];

