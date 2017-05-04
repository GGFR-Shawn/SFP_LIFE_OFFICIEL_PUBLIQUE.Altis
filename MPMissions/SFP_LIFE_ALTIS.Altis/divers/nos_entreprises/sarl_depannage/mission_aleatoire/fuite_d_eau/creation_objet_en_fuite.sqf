// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (!hasInterface) exitwith {};

l_objet_en_fuite = _this select 0;
sa_position_de_lobjet_en_fuite = getPosATL l_objet_en_fuite;
if (isnil "l_objet_en_fuite") exitwith {};
if (!alive l_objet_en_fuite) exitwith {};

["Fuite_d_eau",["Fuite d'eau détectée, faites attention !", ""]] call bis_fnc_showNotification;
player globalchat "Attention, une fuite d'eau vient d'être détectée, la DIR va intervenir d'ici peu !";

[] spawn 
{
	_ps1 = "#particlesource" createVehicleLocal [(sa_position_de_lobjet_en_fuite select 0),(sa_position_de_lobjet_en_fuite select 1),sa_position_de_lobjet_en_fuite select 2];
	_ps1 setParticleCircle [0, [0, 0, 0]];
	_ps1 setParticleRandom [1, [0, 0, 1], [50, 50, 0], 0.1, 0.1, [1, 1, 0, 0.9], 0, 0];
	_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 9, 5,100], "", "Billboard", 10, 1000, [0, 0, 1], [0.5, 0.5, 0.5], 10, 9.1, 7.9, 0.05, [70, 70, 6], [[0,0,0,0.1], [0,0,0,0.1], [0,0,0,0.1],[0,0,0,0.9]], [0.125], 1, 5, "", "", sa_position_de_lobjet_en_fuite];
	_ps1 setDropInterval 0.002;
	sleep 1.2;
	deletevehicle _ps1;
};		

[] spawn 
{
	while {alive l_objet_en_fuite} do
	{
		_random_effet_fuite_maxou = (random 1) / 1000;
		sleep _random_effet_fuite_maxou;
				
		if (player distance sa_position_de_lobjet_en_fuite < 500) then
		{
			private ["_array", "_position", "_arcini_maxou", "_deg_maxou", "_spd_maxou", "_spdv_maxou", "_size_maxou", "_color_maxou", "_dur_maxou", "_rot_maxou", "_mass_maxou", "_vol_maxou", "_pos", "_i", "_ang", "_vel"];
			_arcini_maxou = 0;
			_deg_maxou = 1;
			_spd_maxou = (random 30);
			_spdv_maxou = (random 30);
			_size_maxou = [0.10,0.20,0.01,0.01,0.01,0.01];
			_color_maxou = [[0.27,0.91,0.93,1],[0.27,0.91,0.93,1],[0.27,0.91,0.93,1],[0.27,0.91,0.93,1],[0.27,0.91,0.93,1],[0.27,0.91,0.93,1],[0.27,0.91,0.93,1],[0.27,0.91,0.93,1]];
			_dur_maxou  = 10;
			_rot_maxou  = 1;
			_mass_maxou = 40;
			_vol_maxou  = 1;

			_nombre_effet_d_eau_maxou = (random 30);
			while {_nombre_effet_d_eau_maxou > 0} do
			{	
				_nombre_effet_d_eau_maxou = _nombre_effet_d_eau_maxou - 1;
				_ang = (_arcini_maxou - _deg_maxou/2 + random(_deg_maxou));
				_vel = [sin(_ang)*_spd_maxou, cos(_ang)*_spd_maxou, _spdv_maxou];
				drop[ ["\A3\data_f\cl_water", 4,1, 5],"","Billboard",100,_dur_maxou,[((random 2)),((random 2)),0],_vel,_rot_maxou,_mass_maxou,_vol_maxou,0,_size_maxou,_color_maxou,[1,0,1,0,1],1,0.8,"","",l_objet_en_fuite];
			};
		}else
		{
			sleep 1;
		};
	};

	["Fuite_d_eau",["La fuite d'eau vient d'être réparée !", ""]] call bis_fnc_showNotification;
	l_objet_en_fuite = nil;
	sa_position_de_lobjet_en_fuite = nil;
};		
		
