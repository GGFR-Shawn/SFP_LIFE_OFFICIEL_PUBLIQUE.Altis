#include "define.inc"

class NMD_RscDisplayAdmin
{
	idd = IDD_NMD_RSCDISPLAYADMIN;
	movingenable = 1;
	onLoad = "[ ""onLoad"", _this, ""NMD_RscDisplayAdmin"" , ""admin"" ] call compile preprocessFileLineNumbers ""divers\hud\admin\nmd\displays\initDisplay.sqf""";
	onUnload = "[ ""onUnload"", _this, ""NMD_RscDisplayAdmin"" , ""admin"" ] call compile preprocessFileLineNumbers ""divers\hud\admin\nmd\displays\initDisplay.sqf""";
	
	class ControlsBackground {

		class TitleBackground: NMD_RscText {
			idc = IDC_NMD_RSCDISPLAYADMIN_TITLEBACKGROUND;
			colorBackground[] = { 1, 0, 0, "( profileNamespace getVariable [ 'GUI_BCG_RGB_A', 0.8 ] )" };
			
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class LeftBackground: NMD_RscText {
			idc = IDC_NMD_RSCDISPLAYADMIN_LEFTBACKGROUND;
			colorBackground[] = { 0, 0, 0, 0.7 };

			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10.9 * 				( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "19 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class RightBackground: NMD_RscText {
			idc = IDC_NMD_RSCDISPLAYADMIN_RIGHTBACKGROUND;
			colorBackground[] = { 0, 0, 0, 0.7 };

			x = "12 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "27 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "19 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

	};

	class Controls {

		class Title: NMD_RscTitle {
			idc = IDC_NMD_RSCDISPLAYADMIN_TITLE;
			text = "SFP ADMINISTRATION";
			
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
	
		class TextPlayerName: NMD_RscText {
			idc = IDC_NMD_RSCDISPLAYADMIN_TEXTPLAYERNAME;
			style = 1;
			shadow = 0;
			text = "";
			
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextPlayers: NMD_RscText {
			idc = IDC_NMD_RSCDISPLAYADMIN_TEXTPLAYERS;
			colorBackground[] = { 0, 0, 0, 1 };
			sizeEx = "( ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) * 0.8 )";
			text = "Joueurs:";
			
			x = "1.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.5 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "9.9 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class PlayerList: NMD_RscListbox
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_PLAYERLIST;

			x = "1.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.3 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "9.9 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "17.4 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class Map: NMD_RscMapControl
		{			
			idc = IDC_NMD_RSCDISPLAYADMIN_MAP;
			tooltip = "Clique pour te téléporter";
			
			x = "12.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.5 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "26 *					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "15.5 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class ButtonKill: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONKILL;
			colorBackground[] = { "( profileNamespace getVariable [ 'GUI_BCG_RGB_R', 0.69 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_G', 0.75 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_B', 0.5 ] )", .8 };
			text = "Tuer";
			
			x = "12.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "18.5 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class ButtonFreeze: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONFREEZE;
			colorBackground[] = { "( profileNamespace getVariable [ 'GUI_BCG_RGB_R', 0.69 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_G', 0.75 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_B', 0.5 ] )", .8 };
			text = "Freeze";
			
			x = "18.7 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "18.5 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class ButtonKick: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONKICK;
			colorBackground[] = { "( profileNamespace getVariable [ 'GUI_BCG_RGB_R', 0.69 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_G', 0.75 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_B', 0.5 ] )", .8 };
			text = "Kick";
			
			x = "24.9 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "18.5 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class ButtonToPlayer: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONTPADMIN;
			colorBackground[] = { "( profileNamespace getVariable [ 'GUI_BCG_RGB_R', 0.69 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_G', 0.75 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_B', 0.5 ] )", .8 };
			text = "Au joueur";
			
			x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "19.7 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class ButtonToAdmin: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONTPPLAYER;
			colorBackground[] = { "( profileNamespace getVariable [ 'GUI_BCG_RGB_R', 0.69 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_G', 0.75 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_B', 0.5 ] )", .8 };
			text = "A vous";
			
			x = "18.7 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "19.7 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
		class ButtonInvincible: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONTINVINCIBLE;
			colorBackground[] = { "( profileNamespace getVariable [ 'GUI_BCG_RGB_R', 0.69 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_G', 0.75 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_B', 0.5 ] )", .8 };
			text = "Invincible";
			
			x = "24.9 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "19.7 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		class ButtonInvincible_enlever: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONTINVINCIBLE_ENLEVER;
			colorBackground[] = { "( profileNamespace getVariable [ 'GUI_BCG_RGB_R', 0.69 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_G', 0.75 ] )", "( profileNamespace getVariable [ 'GUI_BCG_RGB_B', 0.5 ] )", .8 };
			text = "Plus Invincible";
			
			x = "31.1 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "19.7 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ButtonGodMode: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONGOD;
			colorBackground[] = { 1, 0, 0, "( profileNamespace getVariable [ 'GUI_BCG_RGB_A', 0.8 ] )" };
			text = "God Mode";
			
			x = "1 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "21.2 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ButtonIntel: NMD_RscButtonMenu
		{
			idc = IDC_NMD_RSCDISPLAYADMIN_BUTTONINTEL;
			text = "Météo";
			
			x = "26.9 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "21.2 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class tablette_sfp_boutton_fermer: NMD_RscButtonMenuOK
		{
			text = "Fermer";
			
			x = "33 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "21.2 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};
		
	};
};