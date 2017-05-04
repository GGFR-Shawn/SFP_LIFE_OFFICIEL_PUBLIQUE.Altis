// =======================================================================================================================================================================================
														// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
														  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_choix_eclair_declenchement_sfp_maxou = round (random 5);
if (_choix_eclair_declenchement_sfp_maxou != 1) exitwith {};

while {true} do
{
	if (rain < 0.6) then {sleep 400;} else {sleep (round (8 + (random 20)));};
	if (rain >= 0.6) then
	{
		if (isnil "dire_message_attention_orage") then {dire_message_attention_orage = 1; systemchat "Des orages approchent ... Faite attention !";};
		_nombre_d_eclair_sfp_maxou = round (random 7);
		for "_i" from 0 to _nombre_d_eclair_sfp_maxou do
		{
			sleep (random 20);
				
			[] spawn
			{
				_condition_endroit_eclair_sfp_maxou = false;
				spawn_de_l_eclair_choisit_emplacement_aleatoire_sfp_maxou = nil;
				while {!_condition_endroit_eclair_sfp_maxou} do 
				{
					_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
					spawn_de_l_eclair_choisit_emplacement_aleatoire_sfp_maxou = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
					if (!surfaceIsWater spawn_de_l_eclair_choisit_emplacement_aleatoire_sfp_maxou) then {_condition_endroit_eclair_sfp_maxou = true;};
					sleep 0.01;
				};
				if (isnil "spawn_de_l_eclair_choisit_emplacement_aleatoire_sfp_maxou") exitwith {execvm "divers\divers\eclair_maxou.sqf";};

				_random_position = random 1000;
				_direction = random 360;
				_posx = (spawn_de_l_eclair_choisit_emplacement_aleatoire_sfp_maxou) select 0;
				_posy = (spawn_de_l_eclair_choisit_emplacement_aleatoire_sfp_maxou) select 1;
				_pos =  [_posx+_random_position*Cos(_direction),_posy+_random_position*Sin(_direction),0];

				_choix_dommage_eclair_sfp_maxou = round (random 5);
				if (_choix_dommage_eclair_sfp_maxou == 1) then
				{
					_dommage_eclair_sfp_maxou = createvehicle ["LightningBolt",_pos,[],0,"CAN_COLLIDE"];
					_dommage_eclair_sfp_maxou setposatl _pos;
					_dommage_eclair_sfp_maxou setdamage 1;
				};
				
				_lumiere_eclair_sfp_maxou = "#lightpoint" createvehiclelocal _pos;
				_lumiere_eclair_sfp_maxou setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
				_lumiere_eclair_sfp_maxou setLightDayLight true;
				_lumiere_eclair_sfp_maxou setLightBrightness (2000 + (random 8000));
				_lumiere_eclair_sfp_maxou setLightAmbient [0.05, 0.05, 0.1];
				_lumiere_eclair_sfp_maxou setlightcolor [1, 1, 20];

				_emplacement_son_sfp_maxou = "Land_HelipadEmpty_F" createvehiclelocal _pos;
				_emplacement_son_sfp_maxou say (["thunder_1", "thunder_2"] call BIS_fnc_selectRandom);

				sleep 0.1;
				_lumiere_eclair_sfp_maxou setLightBrightness (random 2);
				sleep (random 0.1);

				_choix_classe_sfp_maxou = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
				_lumiere_eclair_deux_sfp_maxou = _choix_classe_sfp_maxou createvehiclelocal [100,100,100];
				_lumiere_eclair_deux_sfp_maxou setdir _direction;
				_lumiere_eclair_deux_sfp_maxou setpos _pos;

				_duree_eclair_sfp_maxou = (3 + random 18);

				for "_i" from 0 to _duree_eclair_sfp_maxou do 
				{
					_time = time + 0.1;
					_lumiere_eclair_sfp_maxou setLightBrightness (100 + random 100);
					waituntil {time > _time};
				};

				deletevehicle _lumiere_eclair_deux_sfp_maxou;
				deletevehicle _lumiere_eclair_sfp_maxou;
				0 setlightnings 0;
				sleep 10; 
				deletevehicle _emplacement_son_sfp_maxou;
			};
		};
	};
};