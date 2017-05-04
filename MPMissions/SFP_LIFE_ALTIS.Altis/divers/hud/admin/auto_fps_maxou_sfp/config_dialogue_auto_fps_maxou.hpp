// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


#define GUI_GRID_X	(safezoneX)
#define GUI_GRID_Y	(safezoneY)
#define GUI_GRID_W	(safezoneW / 32)
#define GUI_GRID_H	(safezoneH / 20)
#define GUI_GRID_WAbs	(safezoneW)
#define GUI_GRID_HAbs	(safezoneH)

//--- Menu_fps_auto
#define IDC_MENU_FPS_AUTO_COULEURFOND			9450
#define IDC_MENU_FPS_AUTO_RSCTEXT_1001			9451
#define IDC_MENU_FPS_AUTO_SFPTEAM_MAXOU			9452
#define IDC_MENU_FPS_AUTO_BY_MAXOU			9453
#define IDC_MENU_FPS_AUTO_TITRE_MODIFIABLE		9454
#define IDC_MENU_FPS_AUTO_MESSAGE_EXPLICATION		9455
#define IDC_MENU_FPS_AUTO_TEXTE_FPS_SOUHAITE		9456
#define IDC_MENU_FPS_AUTO_TEXTE_FPS_EN_COMBAT		9457
#define IDC_MENU_FPS_AUTO_BOUTTON_ACTIVER_DESACTIVER	10150
#define IDC_MENU_FPS_AUTO_BOUTTON_ANNULER		10151
#define IDC_MENU_FPS_AUTO_RSCSLIDER_1900		10350
#define IDC_MENU_FPS_AUTO_RSCSLIDER_1901		10351

class Menu_Auto_FPS_Maxou
{
	idd = 100000;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Auto_FPS_Maxou',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Auto_FPS_Maxou', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.355 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.525 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.241146 * safezoneW + safezoneX;
			y = 0.535186 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.7 * safezoneW + safezoneX;
			y = 0.575 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscSlider_1900: RscSlider
		{
			onSliderPosChanged = "[1, _this] execVM 'divers\hud\admin\auto_fps_maxou_sfp\initialisation_auto_fps.sqf';";

			idc = 1900;
			x = 0.38125 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscSlider_1901: RscSlider
		{
			onSliderPosChanged = "[2, _this] execVM 'divers\hud\admin\auto_fps_maxou_sfp\initialisation_auto_fps.sqf';";

			idc = 1901;
			x = 0.38125 * safezoneW + safezoneX;
			y = 0.51 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class texte_fps_souhaite: RscText
		{
			idc = 1006;
			text = "FPS minimum souhaite :"; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class texte_vue: RscText
		{
			idc = 1007;
			text = "Distance de vue minimum :"; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.11875 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class message_explication: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;

			idc = 1005;
			text = "Message explication"; //--- ToDo: Localize;
			x = 0.24375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.509375 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Titre a modifier"; //--- ToDo: Localize;
			x = 7.9 * safezoneW + safezoneX;
			y = 0.281667 * safezoneH + safezoneY;
			w = 0.30625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class Titre_modifiable: RscText
		{
			idc = 1004;
			text = "Titre a modifier"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class boutton_activer_desactiver: RscShortcutButton
		{
			onButtonClick = "[3,[0]] execVM 'divers\hud\admin\auto_fps_maxou_sfp\initialisation_auto_fps.sqf';";

			idc = 1700;
			text = "Activer/Desactiver"; //--- ToDo: Localize;
			x = 0.590625 * safezoneW + safezoneX;
			y = 0.575 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class valeur_activation: RscText
		{
			idc = 1008;
			text = "Actuellement activÃ©."; //--- ToDo: Localize;
			x = 0.6625 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.09375 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class indication_fps: RscText
		{
			idc = 1009;
			text = "FPS Actuel :"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.053125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class distance_actuel: RscText
		{
			idc = 1010;
			text = "12000"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.053125 * safezoneW;
			h = 0.035 * safezoneH;
		};
	};
};
