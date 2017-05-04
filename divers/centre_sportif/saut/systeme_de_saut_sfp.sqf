// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
	
if (player distance (position jesuisdevantlaprison) < 25) exitwith {systemchat "Tu ne peux pas sauter/escalader dans la prison !";};
if (player getvariable "temps_fatigue_niveau_5" < 1) exitwith {systemchat "Entraine toi au niveau 5 au camp d'entrainement pour pouvoir sauter et escalader !";};
if (getStamina player < 15) exitwith {systemchat "Tu es trop essouflé pour sauter/escalader !";};
if !(isClass(configFile >> "CfgPatches" >> "babe_fd")) exitwith {systemchat "Désolé, tu n'as pas le launcher pour pouvoir sauter et escalader !";};
if (!isnil "autorisation_barre_pour_braquage") exitwith {};

if (isnil "protection_spam_boutton_saut") then {protection_spam_boutton_saut = false;};
if (protection_spam_boutton_saut) exitwith {};
protection_spam_boutton_saut = true;

_detection_des_sauts_sfp =
{
	private ["_pos", "_toppos"];

	_st = stance player;
	_stnope = ["PRONE", "UNDEFINED"];

	if (EM_climbing or _st in _stnope or vehicle player != player) exitwith {};

	EM_busy = true;

	_pos = _this select 0;
	_top = _this select 1;
	_toppos = _this select 2;
	_anm = "";

	if (str _pos == "[0,0,0]") exitwith{call babe_em_fnc_jump};

	_h = ((player worldToModel asltoagl _pos) select 2) max 0;

	_stepa = EM_heightsOn select 0;
	_stepb = EM_heightsOn select 1;
	_ona = EM_heightsOn select 1;
	_onb = EM_heightsOn select 2;
	_onha = EM_heightsOn select 2;
	_onhb = EM_heightsOn select 3;
	_onhera = EM_heightsOn select 3;
	_onherb = EM_heightsOn select 4;
	_vaulta = EM_heightsOver select 0;
	_vaultb = EM_heightsOver select 1;
	_overa = EM_heightsOver select 1;
	_overb = EM_heightsOver select 2;
	_overha = EM_heightsOver select 2;
	_overhb = EM_heightsOver select 3;
	_overhera = EM_heightsOver select 3;
	_overherb = EM_heightsOver select 4;
	_wl1 = EM_weightlimits select 0;
	_wl2 = EM_weightlimits select 1;
	_wl3 = EM_weightlimits select 2;

	_over = false;

	if (_top) then
	{

		switch (true) do
		{
			case (_h > _onhera && _h <= _onherb && loadabs player < _wl1):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_climbonHer_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_climbonHer_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_climbonHer_pst";
					};
				};
			};
			case (_h > _onha && _h < _onhb && loadabs player < _wl2):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_climbonH_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_climbonH_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_climbonH_pst";
					};
				};
			};
			case (_h > _ona && _h <= _onb && loadabs player < _wl3):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_climbon_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_climbon_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_climbon_pst";
					};
				};
			};
			case (_h > _stepa && _h <= _stepb):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_stepon_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_stepon_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_stepon_pst";
					};
				};
			};
		};
	} else
	{
		switch (true) do
		{
			case (_h > _overhera && _h <= _overherb && loadabs player < _wl1):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_climboverHer_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_climboverHer_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_climboverHer_pst";
					};
				};
			};
			case (_h > _overha && _h <= _overhb && loadabs player < _wl2):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_climboverH_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_climboverH_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_climboverH_pst";
					};
				};
			};
			case (_h > _overa && _h < _overb && loadabs player < _wl3):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_climbover_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_climbover_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_climbover_pst";
					};
				};
			};
			case (_h > _vaulta && _h <= _vaultb):
			{
				switch (currentWeapon player) do
				{
					case (""):
					{
						_anm = "babe_vaultover_ua";
					};
					case (primaryWeapon player):
					{
						_anm = "babe_vaultover_rfl";
					};
					case (handgunWeapon player):
					{
						_anm = "babe_vaultover_pst";
					};
				};
			};
		};
	_over = true;	
	};
	if (_anm == "") exitwith 
	{
		if (isTouchingGround player && !EM_climbing) then
		{
			call babe_em_fnc_jump
		};
	};
	EM_climbing = true;

	["EH_em", "animationState player == " + str _anm, "babe_em_fnc_exec_em", [_pos, _over], true, "babe_em_fnc_finish_em", [_toppos, _over], -1] call babe_core_fnc_addEH;

	player playMove _anm;
};

private ["_pos", "_posa", "_posb", "_toppos", "_testpos", "_poses", "_posWT", "_int", "_int2", "_int3"];

_pos = [0,0,0];
_posa = [0,0,0];
_posb = [0,0,0];
_toppos = [0,0,0];
_goodZ = [];
_blocked = false;
_top = false;
_poses = [];
_int = [];
_obj = player;

for "_i" from 0 to 60 do   
{ 
	_posa = player modeltoWorld [0, 0, (_i*0.05)];   
	_posb = player modeltoWorld [0, 1.5, (_i*0.05)+ 0.1];   
	_int = lineintersectsSurfaces [agltoasl _posa, agltoasl _posb, player, objNull, true, 1, "GEOM", "FIRE"]; 
	_respos = (_int select 0) select 0;
	_succ = count _int > 0;

	if (_succ) then
	{
		_obj = (_int select 0) select 3;

		if (EM_debug) then
		{
			drawLine3D [_posa, _posb, [1,0,0,1]];
		};

		_testpos = (_int select 0) select 0;
		_posWT = player worldToModel (asltoagl _testpos);

		if (_posWT select 2 > 0.5) then
		{
			_pos = _testpos;
			_goodZ pushback (_posWT select 1);
		};
	} else
	{
		if (str _pos != "[0,0,0]") then
		{
			_ppWT = (player worldtomodel (asltoagl _pos)) select 2;
			_tpWT = (_i*0.05)+ 0.1;
			_dst = (_ppWT max _tpWT) - (_ppWT min _tpWT);

			if (EM_debug) then
			{	
				drawLine3D [_posa, _posb, [0,1,1,1]];
			};

			_posWT = player worldToModel (asltoagl _pos);

			if (!(_pos in _poses) && _posWT select 2 > 0.5 && _dst > 0.5) then
			{
				_poses pushback _pos;
			};

		};
	};
};

if (count _poses > 0) then
{
	_pos = _poses select 0;
};

_posWT = player worldToModel (asltoagl _pos);
_posa = player modeltoWorld [_posWT select 0, (_posWT select 1) + 0.75, (_posWT select 2) + 0.5];
_posb = player modeltoWorld [_posWT select 0, (_posWT select 1) + 0.75, (_posWT select 2) - 5];
_toptest = lineintersectsSurfaces [agltoasl _posa, agltoasl _posb, player, objNull, true, 1, "GEOM", "FIRE"];
_toppos = (_toptest select 0)select 0;
_postopos = ((_toptest select 0)select 3);
_top = !isNil "_postopos";

if (!_top) then 
{
	_toppos = agltoasl(player modeltoworld [0,2,0]);
}else
{		
	_a = abs (_pos select 2);
	_b = abs (_toppos select 2);
	_max = _a max _b;

	if (_max == _a) then 
	{
		if (_a - _b > 0.6) then
		{
			_top = false;
			if (_a-_b > 1.8) then
			{
				_toppos = agltoasl(player modeltoworld [0,2,0]);
			};
		} else
		{
			_top = true
		};
	}else
	{
		_top = true;
	};
};

if (str _pos != "[0,0,0]" && _top) then
{
	_avZ = 0;
	_min = 999;
	_max = 0;
	for "_i" from 0 to (count _goodZ)-1 do   
	{ 
		_z = _goodZ select _i;

		if (_i > 0) then
		{
			_min = _min min _z;	
			_max = _max max _z;
		};

		_avZ = _avZ + _z;
	};

	if (_max - _min > 0.5) then
	{
		_avZ = _avZ/(count _goodZ);

		_pos = agltoasl (player modeltoworld [_posWT select 0, _avZ, _posWT select 2]);
	};
};


_posWT = player worldToModel (asltoagl _pos);
_bone = player selectionPosition "Spine3";
_posa = player modeltoWorld _bone;
_posb = player modeltoWorld [_bone select 0, _bone select 1, (_posWT select 2)+0.5];
_int2 = lineintersectsSurfaces [agltoasl _posa, agltoasl _posb, player, objNull, true, 1, "GEOM", "FIRE"];

_posa = player modeltoworld [0,0, (_posWT select 2) + 0.2];
_posb = player modeltoworld [_posWT select 0, (_posWT select 1)+ 0.2, (_posWT select 2) + 0.2];
_int3 = lineintersectsSurfaces [agltoasl _posa, agltoasl _posb, player, objNull, true, 1, "GEOM", "FIRE"];
_blocked = ((count _int2) + (count _int3) > 0);

if (_blocked) then
{
	_pos = [0,0,0];
};

if (!_top && _obj != player && _obj isKindOf "CaManBase") then 
{
	_pos = [0,0,0];
};

_wide = true;

if (!_top) then
{
	_posWT = player worldToModel asltoagl _pos;
	_a = agltoasl (player modeltoworld [(_posWT select 0) + 0.3, _posWT select 1, (_posWT select 2)+0.2]);
	_b = agltoasl (player modeltoworld [(_posWT select 0) - 0.3, _posWT select 1, (_posWT select 2)+0.2]);
	_c = agltoasl (player modeltoworld [(_posWT select 0) + 0.3, (_posWT select 1) + 0.1, (_posWT select 2)+0.2]);
	_d = agltoasl (player modeltoworld [(_posWT select 0) - 0.3, (_posWT select 1) - 0.1, (_posWT select 2)+0.2]);
	_e = agltoasl (player modeltoworld [(_posWT select 0) + 0.3, (_posWT select 1) - 0.1, (_posWT select 2)+0.2]);
	_f = agltoasl (player modeltoworld [(_posWT select 0) - 0.3, (_posWT select 1) + 0.1, (_posWT select 2)+0.2]);
	_int1 = lineintersectsSurfaces [_a, _b, player, objNull, true, 1, "GEOM", "FIRE"]; 
	_int2 = lineintersectsSurfaces [_c, _d, player, objNull, true, 1, "GEOM", "FIRE"]; 
	_int3 = lineintersectsSurfaces [_e, _f, player, objNull, true, 1, "GEOM", "FIRE"]; 
	_wide = (count _int1) + (count _int2) + (count _int3) == 0;

};
if !_wide then 
{
	_pos = [0,0,0];
};

[_pos, _top, _toppos] call _detection_des_sauts_sfp;

sleep 1;
protection_spam_boutton_saut = false;
