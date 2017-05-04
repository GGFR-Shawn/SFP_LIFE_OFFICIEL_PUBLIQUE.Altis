if !((getPlayerUID player) in sfp_config_liste_admin) exitWith {};

#include "define.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

	case "onLoad": {
		
		_display = ( _params select 0 );
		

		_ctrlComboHour = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_COMBOHOUR;
		for "_x" from 0 to 23 do { _ctrlComboHour lbAdd ( str _x ) };
		_ctrlComboHour lbSetCurSel ( date select 3 );


		_ctrlComboHour = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_COMBOMINUTE;
		{ _ctrlComboHour lbAdd _x } forEach [ "00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55" ];
		_ctrlComboHour lbSetCurSel ( 5 * ( round ( ( date select 4 ) / 5 ) ) / 5 );


		_ctrlComboDay = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_COMBODAY;
		_ctrlComboDay ctrlEnable false;

		_ctrlComboMonth = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_COMBOMONTH;
		_ctrlComboMonth ctrlEnable false;

		_ctrlComboYear = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_COMBOYEAR;
		_ctrlComboYear ctrlEnable false;


		{

			_value = ( round ( ( _x select 2 ) * 100 ) );

			_ctrl = _display displayCtrl ( _x select 0 );
			_ctrl sliderSetRange [ 0, 100 ];
			_ctrl ctrlAddEventHandler [ "SliderPosChanged", format [ "[ 'sliderValueChanged', _this, '%1', %2 ] call %1_script", _class, _x ] ];
			_ctrl sliderSetPosition _value;

			_ctrl = _display displayCtrl ( _x select 1 );
			_ctrl ctrlAddEventHandler [ "KeyDown", format [ "[ 'sliderValueChanged', _this, '%1', %2 ] call %1_script", _class, _x ] ];
			_ctrl ctrlAddEventHandler [ "KeyUp", format [ "[ 'sliderValueChanged', _this, '%1', %2 ] call %1_script", _class, _x ] ];
			_ctrl ctrlSetText ( str _value );


			if( count _x == 4 ) then {

				_ctrl = _display displayCtrl ( _x select 3 );
				_ctrl ctrlAddEventHandler [ "CheckBoxesSelChanged", format [ "[ 'autoCheck', _this, '%1', %2 ] call %1_script", _class, _x ] ];
				_ctrl ctrlSetChecked true;

			};

		} forEach [

			[ IDC_NMD_RSCDISPLAYINTEL_SLIDEROVERCAST, IDC_NMD_RSCDISPLAYINTEL_EDITOVERCAST, overcast ], 
			[ IDC_NMD_RSCDISPLAYINTEL_SLIDERFOG,  IDC_NMD_RSCDISPLAYINTEL_EDITFOG, fog ],

			[ IDC_NMD_RSCDISPLAYINTEL_SLIDERRAIN, IDC_NMD_RSCDISPLAYINTEL_EDITRAIN, 0, IDC_NMD_RSCDISPLAYINTEL_CHECKRAIN ], 
			[ IDC_NMD_RSCDISPLAYINTEL_SLIDERLIGHTNING, IDC_NMD_RSCDISPLAYINTEL_EDITLIGHTNING, 0, IDC_NMD_RSCDISPLAYINTEL_CHECKLIGHTNING ], 
			[ IDC_NMD_RSCDISPLAYINTEL_SLIDERWAVES, IDC_NMD_RSCDISPLAYINTEL_EDITWAVES, 0, IDC_NMD_RSCDISPLAYINTEL_CHECKWAVES ]

		];


		_ctrlCheckRain = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_CHECKRAIN;
		_ctrlCheckRain ctrlAddEventHandler [ "CheckBoxesSelChanged", format [ "[ 'handleRain', _this, '%1', %2 ] call %1_script", _class, _x ] ];


		_ctrlButtonApply = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_BUTTONAPPLY;
		_ctrlButtonApply ctrlAddEventHandler [ "ButtonClick", format [ "[ 'apply', _this, '%1' ] call %1_script", _class ] ];


		ctrlSetFocus ( _display displayCtrl 1 );

	};
	
	/////////////////////////////////////////////////////////////////////////////////
	
	case "sliderValueChanged": {

		_display = ctrlParent ( _params select 0 );
		_ctrl = ( _params select 0 );
		_ctrlSlider = _display displayCtrl ( ( _this select 3 ) select 0 );
		_ctrlEdit = _display displayCtrl ( ( _this select 3 ) select 1 );
		_value = 0;

		if( ctrlType _ctrl == 2 ) then {

			_value = parseNumber ( ctrlText _ctrlEdit );

		} else {

			_value = sliderPosition _ctrlSlider;

		};

		_value = ( ( ( round _value ) min 100 ) max 0 );

		_ctrlSlider sliderSetPosition _value;
		_ctrlEdit ctrlSetText ( str _value );

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "autoCheck": {

		_display = ctrlParent ( _params select 0 );
		_ctrlCheckRain = ( _params select 0 );
		_ctrlSlider = _display displayCtrl ( ( _this select 3 ) select 0 );
		_ctrlEdit = _display displayCtrl ( ( _this select 3 ) select 1 );
		_enabled = ctrlChecked _ctrlCheckRain;

		_ctrlSlider ctrlEnable !_enabled;
		_ctrlEdit ctrlEnable !_enabled;

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "handleRain": {

		_display = ctrlParent ( _params select 0 );
		_ctrlCheckRain = ( _params select 0 );
		_ctrlSliderOvercast = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_SLIDEROVERCAST;
		_ctrlEditOvercast = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_EDITOVERCAST;
		_enabled = ctrlChecked _ctrlCheckRain;
		_overcast = ( sliderPosition _ctrlSliderOvercast / 100 );
		_minOvercast = getNumber ( configfile >> "CfgWorlds" >> "DefaultWorld" >> "Weather" >> "RainConfig" >> "averageCloudLimit" );

		// Auto
		if( !_enabled ) then {

			if( _overcast < _minOvercast ) then {

				_ctrlSliderOvercast sliderSetPosition ( _minOvercast * 100 );
				_ctrlEditOvercast ctrlSetText str ( _minOvercast * 100 );

			};

		};

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "apply": {

		_display = ctrlParent ( _params select 0 );

		_ctrlCheckRain = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_CHECKRAIN;
		_ctrlCheckLightning = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_CHECKLIGHTNING;
		_ctrlCheckWaves = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_CHECKWAVES;

		_ctrlComboHour = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_COMBOHOUR;
		_ctrlComboMinute = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_COMBOMINUTE;

		_ctrlSliderOvercast = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_SLIDEROVERCAST;
		_ctrlSliderFog = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_SLIDERFOG;
		_ctrlSliderRain = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_SLIDERRAIN;
		_ctrlSliderLightning = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_SLIDERLIGHTNING;
		_ctrlSliderWaves = _display displayCtrl IDC_NMD_RSCDISPLAYINTEL_SLIDERWAVES;

		_hour = parseNumber( _ctrlComboHour lbText ( lbCurSel _ctrlComboHour ) );
		_minute = parseNumber( _ctrlComboMinute lbText ( lbCurSel _ctrlComboMinute ) );

		_date = [ ( date select 0 ), ( date select 1 ), ( date select 2 ), _hour, _minute ]; 

		_overcast = ( sliderPosition _ctrlSliderOvercast / 100 );
		_fog = ( sliderPosition _ctrlSliderFog / 100 );
		_rain = if( !( ctrlChecked _ctrlCheckRain ) ) then { ( sliderPosition _ctrlSliderRain / 100 ) } else { -1 };
		_lightning = if( !( ctrlChecked _ctrlCheckLightning ) ) then { ( sliderPosition _ctrlSliderLightning / 100 ) } else { -1 };
		_waves = if( !( ctrlChecked _ctrlCheckWaves ) ) then { ( sliderPosition _ctrlSliderWaves / 100 ) } else { -1 };

		[ [ _date, _overcast, _fog, _rain, _lightning, _waves ], "NMD_fnc_setEnvironment", true ] spawn BIS_fnc_MP;

		closeDialog 0;

	};

};