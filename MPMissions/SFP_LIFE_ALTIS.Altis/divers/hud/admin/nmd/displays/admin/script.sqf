if !((getPlayerUID player) in sfp_config_liste_admin) exitWith {};

#include "define.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

	case "onLoad": {
		
		_display = ( _params select 0 );


		_ctrlTextPlayerName = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_TEXTPLAYERNAME;
		_ctrlTextPlayerName ctrlSetText ( name player );
				

		_ctrlListPlayers = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_PLAYERLIST;
		_ctrlListPlayers ctrlAddEventHandler [ "LBSelChanged", format [ "[ 'selectPlayer', _this, '%1' ] call %1_script", _class ] ];
		_ctrlListPlayers ctrlAddEventHandler [ "LBDblClick", format [ "[ 'mapPlayer', _this, '%1' ] call %1_script", _class ] ];


		_ctrlMap = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_MAP;
		_ctrlMap ctrlAddEventHandler [ "Draw", format [ "[ 'onDrawMap', _this, '%1' ] call %1_script", _class ] ];
		_ctrlMap ctrlAddEventHandler [ "MouseButtonClick", format [ "[ 'onClickMap', _this, '%1' ] call %1_script", _class ] ];
		

		_ctrlButtonKill = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONKILL;
		_ctrlButtonKill ctrlAddEventHandler [ "ButtonClick", format [ "[ 'kill', _this, '%1' ] call %1_script", _class ] ];
		

		_ctrlButtonFreeze = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONFREEZE;
		_ctrlButtonFreeze ctrlAddEventHandler [ "ButtonClick", format [ "[ 'freeze', _this, '%1' ] call %1_script", _class ] ];
		

		_ctrlButtonKick = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONKICK;
		_ctrlButtonKick ctrlAddEventHandler [ "ButtonClick", format [ "[ 'kick', _this, '%1' ] call %1_script", _class ] ];
		

		_ctrlButtonToPlayer = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONTPADMIN;
		_ctrlButtonToPlayer ctrlAddEventHandler [ "ButtonClick", format [ "[ 'toPlayer', _this, '%1' ] call %1_script", _class ] ];
		

		_ctrlButtonToAdmin = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONTPPLAYER;
		_ctrlButtonToAdmin ctrlAddEventHandler [ "ButtonClick", format [ "[ 'toAdmin', _this, '%1' ] call %1_script", _class ] ];
		
		
		_ctrlButtonInvincible = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONTINVINCIBLE;
		_ctrlButtonInvincible ctrlAddEventHandler [ "ButtonClick", format [ "[ 'invincible', _this, '%1' ] call %1_script", _class ] ];
		
		
		_ctrlButtonInvincible_enlever = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONTINVINCIBLE_ENLEVER;
		_ctrlButtonInvincible_enlever ctrlAddEventHandler [ "ButtonClick", format [ "[ 'invincibleenlever', _this, '%1' ] call %1_script", _class ] ];


		_ctrlButtonGodMode = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONGOD;
		_ctrlButtonGodMode ctrlAddEventHandler [ "ButtonClick", format [ "[ 'godMode', _this, '%1' ] call %1_script", _class ] ];
		

		_ctrlButtonIntel = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_BUTTONINTEL;
		_ctrlButtonIntel ctrlAddEventHandler [ "ButtonClick", format [ "[ 'intel', _this, '%1' ] call %1_script", _class ] ];


		// Populate player list
		{
			
			_ctrlListPlayers lbAdd ( name _x );
			_ctrlListPlayers lbSetTooltip [ ( lbSize _ctrlListPlayers ) -1, ( name _x ) ];

			if((getPlayerUID player) in sfp_config_liste_admin) then {

				_ctrlListPlayers lbSetColor [ ( lbSize _ctrlListPlayers ) -1, [ 1, 0, 0, 1 ] ];

			} else {

				_ctrlListPlayers lbSetColor [ ( lbSize _ctrlListPlayers ) -1, ( getNumber ( configFile >> "CfgVehicles" >> typeOf _x >> "side" ) call BIS_fnc_sideColor ) ];

			}

		} foreach ( call NMD_fnc_listPlayers );
		_ctrlListPlayers lbSetCurSel 0;
		ctrlSetFocus _ctrlListPlayers;
		
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "onUnload": {
	
		NMD_DisplayAdmin_selectedPlayer = nil;

	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "onDrawMap": {
	
		_ctrlMap = ( _params select 0 );
		
		//--- Draw player icons
		{

			_ctrlMap drawIcon [
				"\A3\ui_f\data\map\markers\system\empty_ca.paa",
				( ( [ configFile >> "CfgVehicles" >> typeOf _x >> "side" ] call BIS_fnc_returnConfigEntry ) call BIS_fnc_sideColor ),
				( getPosATL _x ),
				26,
				26,
				0,
				( name _x ),
				2
			];

		} foreach ( call NMD_fnc_listPlayers );

	};

	/////////////////////////////////////////////////////////////////////////////////
	
	case "onClickMap": {
	
		_ctrlMap = ( _params select 0 );
		
		[ [ NMD_DisplayAdmin_selectedPlayer, ( _ctrlMap ctrlMapScreenToWorld [ ( _params select 2 ), ( _params select 3 ) ] ) ], "NMD_fnc_setPos", NMD_DisplayAdmin_selectedPlayer ] spawn BIS_fnc_MP;
		
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "selectPlayer": {
	
		_ctrlListPlayers = ( _params select 0 );
		_selectedIndex = ( _params select 1 );		
		_display = ctrlParent _ctrlListPlayers;
			
		//--- Get and set the currently select player
		NMD_DisplayAdmin_selectedPlayer = ( _ctrlListPlayers lbText _selectedIndex ) call NMD_fnc_playerFromName;
		
		//--- Disable buttons if selected player is self
		{
		
			( _display displayCtrl _x ) ctrlEnable !( NMD_DisplayAdmin_selectedPlayer == player );
		
		} foreach [ 
		
			IDC_NMD_RSCDISPLAYADMIN_BUTTONKILL,
			IDC_NMD_RSCDISPLAYADMIN_BUTTONFREEZE,
			IDC_NMD_RSCDISPLAYADMIN_BUTTONKICK,
			IDC_NMD_RSCDISPLAYADMIN_BUTTONTPADMIN,
			IDC_NMD_RSCDISPLAYADMIN_BUTTONTPPLAYER,
			IDC_NMD_RSCDISPLAYADMIN_BUTTONTINVINCIBLE,
			IDC_NMD_RSCDISPLAYADMIN_BUTTONTINVINCIBLE_ENLEVER
		];
	
	};

	/////////////////////////////////////////////////////////////////////////////////
	
	case "mapPlayer": {
		
		_display = ctrlParent ( _params select 0 );
		_ctrlMap = _display displayCtrl IDC_NMD_RSCDISPLAYADMIN_MAP;
		
		//--- Animate map to selected player
		if( !ctrlMapAnimDone _ctrlMap ) then {

			ctrlMapAnimClear _ctrlMap;

		};

		_ctrlMap ctrlMapAnimAdd [ .7, 0.1, ( getPosATL NMD_DisplayAdmin_selectedPlayer ) ];
		ctrlMapAnimCommit _ctrlMap;
	
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "kill": 
	{

		if !(getPlayerUID player in sfp_config_liste_admin) exitWith {hint "Opération impossible ...";};
		NMD_DisplayAdmin_selectedPlayer setDamage 1;
		
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "invincible": 
	{
		if !(getPlayerUID player in sfp_config_liste_admin) exitWith {hint "Opération impossible ...";};
		hint "Invinsible OUI !";
		NMD_DisplayAdmin_selectedPlayer setdamage 0;
		NMD_DisplayAdmin_selectedPlayer allowDamage false;
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "invincibleenlever": 
	{
		if !(getPlayerUID player in sfp_config_liste_admin) exitWith {hint "Opération impossible ...";};
		hint "Invinsible NON !";
		NMD_DisplayAdmin_selectedPlayer removeAllEventHandlers 'handleDamage';
		NMD_DisplayAdmin_selectedPlayer allowDamage true;
		NMD_DisplayAdmin_selectedPlayer addEventHandler ['handleDamage', {true}];
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "freeze": 
	{
		if !(getPlayerUID player in sfp_config_liste_admin) exitWith {hint "Opération impossible ...";};
		if( NMD_DisplayAdmin_selectedPlayer getVariable [ "NMD_DisplayAdmin_isFrozen", false ] ) then {

			[ [ NMD_DisplayAdmin_selectedPlayer, true ], "NMD_fnc_enableSimulation" ] spawn BIS_fnc_MP;
			NMD_DisplayAdmin_selectedPlayer setVariable [ "NMD_DisplayAdmin_isFrozen", false, true ];
			
			[ "NMD Admin", format[ "Vous avez unfreeze %1.", ( name NMD_DisplayAdmin_selectedPlayer ) ] ] call NMD_fnc_titleHint;
			// [ [ "NMD Admin", format[ "%1 vous a unfreeze.", ( name player ) ] ], "NMD_fnc_titleHint", NMD_DisplayAdmin_selectedPlayer ] spawn BIS_fnc_MP;

		} else {

			[ [ NMD_DisplayAdmin_selectedPlayer, false ], "NMD_fnc_enableSimulation" ] spawn BIS_fnc_MP;
			NMD_DisplayAdmin_selectedPlayer setVariable [ "NMD_DisplayAdmin_isFrozen", true, true ];
			
			[ "NMD Admin", format[ "Vous avez freeze %1.", ( name NMD_DisplayAdmin_selectedPlayer ) ] ] call NMD_fnc_titleHint;
			// [ [ "NMD Admin", format[ "%1 vous a freeze.", ( name player ) ] ], "NMD_fnc_titleHint", NMD_DisplayAdmin_selectedPlayer ] spawn BIS_fnc_MP;

		};
	
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "kick": {
		
		if( serverCommandAvailable "#kick" ) then {

			serverCommand format[ "#kick %1", ( name NMD_DisplayAdmin_selectedPlayer ) ];

		} else {

			[ [ "kick", false, false ], "BIS_fnc_endMission", NMD_DisplayAdmin_selectedPlayer ] spawn BIS_fnc_MP;

		};
	
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "toPlayer": {
	
		player setPos ( getPosATL NMD_DisplayAdmin_selectedPlayer );
	
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "toAdmin": 
	{
		if !(getPlayerUID player in sfp_config_liste_admin) exitWith {hint "Opération impossible ...";};
		[ [ NMD_DisplayAdmin_selectedPlayer, ( getPosATL player ) ], "NMD_fnc_setPos", NMD_DisplayAdmin_selectedPlayer ] spawn BIS_fnc_MP;
	
	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "intel": {
	
		if !(getPlayerUID player in sfp_config_liste_admin) exitWith {hint "Opération impossible ...";};
		createDialog "NMD_RscDisplayIntel";
	
	};

	/////////////////////////////////////////////////////////////////////////////////
	
	case "godMode": {
	
		if( player getVariable [ "NMD_DisplayAdmin_isGodMode", false ] ) then 
		{
			player allowDamage true;
			player setdamage 0;
			player setVariable [ "NMD_DisplayAdmin_isGodMode", false ];
			[ "NMD Admin", "God mode desactivé" ] call NMD_fnc_titleHint;
		} else 
		{
			player allowDamage false;
			player setVariable [ "NMD_DisplayAdmin_isGodMode", true ];
			[ "NMD Admin", "God mode activé" ] call NMD_fnc_titleHint;
		};
	};
};
