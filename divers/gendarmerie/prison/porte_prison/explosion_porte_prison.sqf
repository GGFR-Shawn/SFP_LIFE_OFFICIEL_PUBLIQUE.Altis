// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nombre_prisonnier = 0;
{
	if (!isnil {_x getvariable "joueur_arreter"} && _x in list jesuisdevantlaprison) then
	{
		_nombre_prisonnier = round (_nombre_prisonnier + 1);
	};
} foreach playableunits;

if (_nombre_prisonnier < 1) exitwith {hint "Désolé, aucun prisonnier n'est dans la prison !";};
if (isnil {player getvariable "bombe_porte_prison"}) exitwith {hint "Désolé, vous n'avez pas de bombe pour ouvrir la cellule ! \n\n Vous pouvez en acheter en quincaillerie.";};
if (!isnil "destruction_porte_prison_sfp") exitwith {hint "Désolé, la prison à déja été explosé !";};

[[[],"divers\gendarmerie\prison\porte_prison\explosion_porte_prison _message_gendarmes.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

les_portes_de_la_prison = nil;
{
	les_portes_de_la_prison = _x;
} foreach (nearestObjects [getPosATL player, ["Prison_Australian_SFP"], 6]);
if (isnil "les_portes_de_la_prison") exitwith {hint "Erreur sur la detection des portes de prisons, recommence !";};

_temps_avant_destruction = 80;
while {alive player && player distance les_portes_de_la_prison < 10 && _temps_avant_destruction >= 0} do
{
	_temps_avant_destruction spawn
	{
		if (isnil "animation_porte_prison") then
		{
			_c4_porte_de_prison = "satchelcharge_remote_ammo" createVehicle (getPosATL player);
			_c4_porte_de_prison enablesimulation false;
			_c4_porte_de_prison attachTo [les_portes_de_la_prison];
			
			animation_porte_prison = true;
			while {_this > 0 && alive player && !isnil "animation_porte_prison"} do
			{
				sleep 2.5;
			};
			
			deletevehicle _c4_porte_de_prison;
		};
	};
	titletext [format ["Temps restant avant destruction : %1 secondes.",_temps_avant_destruction],"PLAIN DOWN"];
	_temps_avant_destruction = round (_temps_avant_destruction - 1);
	sleep 1;
};

player switchmove "";
animation_porte_prison = nil;

if (_temps_avant_destruction > 0 && player distance les_portes_de_la_prison > 5) then
{
	titletext ["Opération annulé, vous êtes trop loin de la cellule !","PLAIN DOWN"];
};

if (_temps_avant_destruction <= 0 && alive player) then
{
	_bombe_porte_prison = "Bo_GBU12_LGB_MI10" createVehicle (position les_portes_de_la_prison);
	[[[position les_portes_de_la_prison],"divers\gendarmerie\prison\porte_prison\synchro_porte_de_prison.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;	
	
	player setvariable ["bombe_porte_prison",nil,true];
	player setvariable ["usedspace",(player getvariable "usedspace") - 10,true];

	destruction_porte_prison_sfp = true; 
	publicvariable "destruction_porte_prison_sfp";	
};