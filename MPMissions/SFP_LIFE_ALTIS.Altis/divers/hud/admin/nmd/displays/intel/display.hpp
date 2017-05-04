
#include "define.inc"

class NMD_RscDisplayIntel
{
	idd = IDD_NMD_RSCDISPLAYINTEL;
	movingenable = 1;
	onLoad = "[ ""onLoad"", _this, ""NMD_RscDisplayIntel"" , ""intel"" ] call compile preprocessFileLineNumbers ""divers\hud\admin\nmd\displays\initDisplay.sqf""";
	onUnload = "[ ""onUnload"", _this, ""NMD_RscDisplayIntel"" , ""intel"" ] call compile preprocessFileLineNumbers ""divers\hud\admin\nmd\displays\initDisplay.sqf""";
	
	class ControlsBackground {

		class TitleBackground: NMD_RscText {
			idc = IDC_NMD_RSCDISPLAYINTEL_TITLEBACKGROUND;
			colorBackground[] = { 1, 0, 0, "( profileNamespace getVariable [ 'GUI_BCG_RGB_A', 0.8 ] )" };
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "6.5 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "22 *					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class Background: NMD_RscText {
			idc = IDC_NMD_RSCDISPLAYINTEL_BACKGROUND;
			colorBackground[] = { 0, 0, 0, 0.7 };

			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "7.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "22 *					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "9.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

	};

	class Controls {

		class Title: NMD_RscTitle {
			idc = IDC_NMD_RSCDISPLAYINTEL_TITLE;
			text = "Choisir meteo";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "6.5 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "22 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class TextTime: NMD_RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.2 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Time:";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ComboHour: NMD_RscCombo
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_COMBOHOUR;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "14.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ComboMinute: NMD_RscCombo
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_COMBOMINUTE;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "17 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextDate: NMD_RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.2 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Date:";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "9.3 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ComboDay: NMD_RscCombo
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_COMBODAY;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "14.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "9.3 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ComboMonth: NMD_RscCombo
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_COMBOMONTH;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "17 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "9.3 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ComboYear: NMD_RscCombo
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_COMBOYEAR;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "19.5 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "9.3 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "3 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextOvercast: NMD_RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.2 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Overcast:";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11.7 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class SliderOvercast: NMD_RscXSliderH
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_SLIDEROVERCAST;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "18 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class EditOvercast: NMD_RscEdit
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_EDITOVERCAST;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "28.5 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextFog: NMD_RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.2 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Fog:";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "12.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class SliderFog: NMD_RscXSliderH
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_SLIDERFOG;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "18 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "12.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class EditFog: NMD_RscEdit
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_EDITFOG;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "28.5 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "12.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextRain: NMD_RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.2 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Rain:";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "13.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class CheckRain: NMD_RscCheckbox
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_CHECKRAIN;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			strings[] = { "manual" };
			checked_strings[] = { "auto" };
			colorText[] = { 1, 1, 1 , 1 };
			colorTextSelect[] = { 1, 1, 1 , 1 };
			
			x = "14.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "13.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class SliderRain: NMD_RscXSliderH
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_SLIDERRAIN;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "18 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "13.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class EditRain: NMD_RscEdit
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_EDITRAIN;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "28.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "13.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextLightning: NMD_RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.2 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Lightning:";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "14.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class CheckLightning: NMD_RscCheckbox
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_CHECKLIGHTNING;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			strings[] = { "manual" };
			checked_strings[] = { "auto" };
			colorText[] = { 1, 1, 1 , 1 };
			colorTextSelect[] = { 1, 1, 1 , 1 };
			
			x = "14.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "14.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class SliderLightning: NMD_RscXSliderH
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_SLIDERLIGHTNING;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "18 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "14.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class EditLightning: NMD_RscEdit
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_EDITLIGHTNING;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "28.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "14.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextWaves: NMD_RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.2 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Waves:";
			
			x = "9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "15.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class CheckWaves: NMD_RscCheckbox
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_CHECKWAVES;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			strings[] = { "manual" };
			checked_strings[] = { "auto" };
			colorText[] = { 1, 1, 1 , 1 };
			colorTextSelect[] = { 1, 1, 1 , 1 };
			
			x = "14.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "15.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.5 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class SliderWaves: NMD_RscXSliderH
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_SLIDERWAVES;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "18 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "15.7 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class EditWaves: NMD_RscEdit
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_EDITWAVES;
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			
			x = "28.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "15.7 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ButtonApply: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYINTEL_BUTTONAPPLY;
			text = "Apliquer";
			
			x = "18.9 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "17 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ButtonCancel: NMD_RscButtonMenuOK
		{
			text = "Annuler";
			
			x = "25 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "17 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
	};
};