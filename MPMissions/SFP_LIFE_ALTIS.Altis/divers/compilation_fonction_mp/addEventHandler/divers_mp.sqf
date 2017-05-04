// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_joueur = _this select 0;
_condition = _this select 1;
if (isnil "_le_joueur") exitwith {};
if (isnil "_condition") exitwith {};

if (_condition == "0") then
{
	{	
		if (_x != player) then
		{
			_x addEventHandler
			[
				"HitPart",
				{
					_this spawn dire_les_kills;

					[_this select 0 select 2] spawn 
					{
						_position_by_maxou = getpos (_this select 0);
						_effet_maxou_blood_sfp = "#particlesource" createVehicleLocal _position_by_maxou;
						_effet_maxou_blood_sfp setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 13, 1],"","Billboard",0.5,0.1,[0,0,0],[random 1,random 1,random 1],1,0.30,0.22,0.035,[(0.05 + random 0.10),(0.09 + random 0.25)],[[0.2,0.01,0.01,1],[0.2,0.01,0.01,0]],[0.1],1,0.04,"","",_position_by_maxou];
						_effet_maxou_blood_sfp setParticleRandom [3, [0, 0, 0], [0.0, 0.0, 0.0], 0, 1, [0, 0, 0, 0.1], 4, 0, 10];
						_effet_maxou_blood_sfp setDropInterval 0.01;
						sleep 0.07;
						deletevehicle _effet_maxou_blood_sfp;
					};
								
					[_this, _this select 0 select 5 select 0] spawn
					{
						_partie_ou_toucher = _this select 1;
						_sur_qui = _this select 0 select 0 select 0;
						if (isnil "_partie_ou_toucher" or isnil "_sur_qui") exitwith {};

						_tete = ["head","HitHead"];
						_buste = ["spine3","HitDiaphragm"];
						_estomac = ["spine1","HitAbdomen"];
						_bras_et_main_droite = ["rightforearm","HitHands"];
						_bras_et_main_gauche = ["leftforearm","HitHands"];
						_cuisse_droite = ["rightupleg","HitLegs"];
						_cuisse_gauche = ["leftupleg","HitLegs"];
						_tibia_droit = ["rightleg","HitLegs"];
						_tibia_gauche = ["leftleg","HitLegs"];
						_pied_droit = ["rightfoot","HitLegs"];
						_pied_gauche = ["leftfoot","HitLegs"];

						_partie_a_modifier = 0;
						if (_partie_ou_toucher == _tete select 0) then {_partie_a_modifier = 0;};
						if (_partie_ou_toucher == _buste select 0) then {_partie_a_modifier = 1;};
						if (_partie_ou_toucher == _estomac select 0) then {_partie_a_modifier = 2;};
						if (_partie_ou_toucher == _bras_et_main_droite select 0) then {_partie_a_modifier = 3;};
						if (_partie_ou_toucher == _bras_et_main_gauche select 0) then {_partie_a_modifier = 4;};
						if (_partie_ou_toucher == _cuisse_droite select 0) then {_partie_a_modifier = 5;};
						if (_partie_ou_toucher == _cuisse_gauche select 0) then {_partie_a_modifier = 6;};
						if (_partie_ou_toucher == _tibia_droit select 0) then {_partie_a_modifier = 7;};
						if (_partie_ou_toucher == _tibia_gauche select 0) then {_partie_a_modifier = 8;};
						if (_partie_ou_toucher == _pied_droit select 0) then {_partie_a_modifier = 9;};
						if (_partie_ou_toucher == _pied_gauche select 0) then {_partie_a_modifier = 10;};

						_mes_blessures_sfp_a_mettre_a_jour = _sur_qui getvariable "mes_blessures_revive_sfp";
						_mes_blessures_sfp_a_mettre_a_jour set [_partie_a_modifier, (0 + (random 0.9))];

						if (isnil {_sur_qui getvariable "besoin_d_un_revive_news"}) then
						{
							waituntil {alive _sur_qui};
							
							_sur_qui setvariable ["mes_blessures_revive_sfp", _mes_blessures_sfp_a_mettre_a_jour, true];
						};
					};

					[_this select 0] spawn
					{
						_partie_de_mon_corp_by_maxou = (_this select 0) select 5;
					
						if (_partie_de_mon_corp_by_maxou select 0 == "head") then 
						{
							[[[(_this select 0 select 0),"2"],"divers\compilation_fonction_mp\addEventHandler\divers_mp.sqf"],"BIS_fnc_execVM",(_this select 0 select 0),false] spawn BIS_fnc_MP;
						};
					};
					
					_this spawn
					{
						waituntil {!isnil "creation_sang_sfp"};
						
						if (sfp_config_activer_sang_lors_de_tir) then
						{
							for "_i" from 0 to (1) do
							{							
								{
									_x spawn creation_sang_sfp;
								} foreach _this;
							};
						};
					};
				}
			];
		};
	} foreach playableUnits
};

if (_condition == "1") then
{
	if (_le_joueur != player) then
	{
		_le_joueur addEventHandler
		[
			"HitPart",
			{
				_this spawn dire_les_kills;
				
				[_this select 0 select 2] spawn 
				{
					_position_by_maxou = getpos (_this select 0);
					_effet_maxou_blood_sfp = "#particlesource" createVehicleLocal _position_by_maxou;
					_effet_maxou_blood_sfp setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 13, 1],"","Billboard",0.5,0.1,[0,0,0],[random 1,random 1,random 1],1,0.30,0.22,0.035,[(0.05 + random 0.10),(0.09 + random 0.25)],[[0.2,0.01,0.01,1],[0.2,0.01,0.01,0]],[0.1],1,0.04,"","",_position_by_maxou];
					_effet_maxou_blood_sfp setParticleRandom [3, [0, 0, 0], [0.0, 0.0, 0.0], 0, 1, [0, 0, 0, 0.1], 4, 0, 10];
					_effet_maxou_blood_sfp setDropInterval 0.01;
					sleep 0.07;
					deletevehicle _effet_maxou_blood_sfp;
				};

				[_this, _this select 0 select 5 select 0] spawn
				{
					_partie_ou_toucher = _this select 1;
					_sur_qui = _this select 0 select 0 select 0;
					if (isnil "_partie_ou_toucher" or isnil "_sur_qui") exitwith {};

					_tete = ["head","HitHead"];
					_buste = ["spine3","HitDiaphragm"];
					_estomac = ["spine1","HitAbdomen"];
					_bras_et_main_droite = ["rightforearm","HitHands"];
					_bras_et_main_gauche = ["leftforearm","HitHands"];
					_cuisse_droite = ["rightupleg","HitLegs"];
					_cuisse_gauche = ["leftupleg","HitLegs"];
					_tibia_droit = ["rightleg","HitLegs"];
					_tibia_gauche = ["leftleg","HitLegs"];
					_pied_droit = ["rightfoot","HitLegs"];
					_pied_gauche = ["leftfoot","HitLegs"];

					_partie_a_modifier = 0;
					if (_partie_ou_toucher == _tete select 0) then {_partie_a_modifier = 0;};
					if (_partie_ou_toucher == _buste select 0) then {_partie_a_modifier = 1;};
					if (_partie_ou_toucher == _estomac select 0) then {_partie_a_modifier = 2;};
					if (_partie_ou_toucher == _bras_et_main_droite select 0) then {_partie_a_modifier = 3;};
					if (_partie_ou_toucher == _bras_et_main_gauche select 0) then {_partie_a_modifier = 4;};
					if (_partie_ou_toucher == _cuisse_droite select 0) then {_partie_a_modifier = 5;};
					if (_partie_ou_toucher == _cuisse_gauche select 0) then {_partie_a_modifier = 6;};
					if (_partie_ou_toucher == _tibia_droit select 0) then {_partie_a_modifier = 7;};
					if (_partie_ou_toucher == _tibia_gauche select 0) then {_partie_a_modifier = 8;};
					if (_partie_ou_toucher == _pied_droit select 0) then {_partie_a_modifier = 9;};
					if (_partie_ou_toucher == _pied_gauche select 0) then {_partie_a_modifier = 10;};

					_mes_blessures_sfp_a_mettre_a_jour = _sur_qui getvariable "mes_blessures_revive_sfp";
					_mes_blessures_sfp_a_mettre_a_jour set [_partie_a_modifier, (0 + (random 0.9))];

					if (isnil {_sur_qui getvariable "besoin_d_un_revive_news"}) then
					{
						waituntil {alive _sur_qui};
						
						_sur_qui setvariable ["mes_blessures_revive_sfp", _mes_blessures_sfp_a_mettre_a_jour, true];
					};
				};

				[_this select 0] spawn
				{
					_partie_de_mon_corp_by_maxou = (_this select 0) select 5;
				
					if (_partie_de_mon_corp_by_maxou select 0 == "head") then 
					{
						[[[(_this select 0 select 0),"2"],"divers\compilation_fonction_mp\addEventHandler\divers_mp.sqf"],"BIS_fnc_execVM",(_this select 0 select 0),false] spawn BIS_fnc_MP;
					};
				};

				_this spawn
				{
					waituntil {!isnil "creation_sang_sfp"};
					
						if (sfp_config_activer_sang_lors_de_tir) then
						{
							for "_i" from 0 to (1) do
							{							
								{
									_x spawn creation_sang_sfp;
								} foreach _this;
							};
						};
				};
			}
		];
	};
};

if (_condition == "2") then
{
	if (player == _le_joueur) then
	{
		if (isnil "revive_impossibilite_de_respawn") then {revive_impossibilite_de_respawn = 0;};
		revive_impossibilite_de_respawn = 1;
		waituntil {sleep 10; alive player;};
		player globalchat "Vous avez prit une balle dans la tête, votre cervelle a eclatée ... Vous n avez pas pu etre soigné ! Bonne nouvelle vie !";
	};
};
