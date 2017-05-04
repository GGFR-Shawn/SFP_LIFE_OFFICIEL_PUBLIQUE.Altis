// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

#define GUI_GRID_X	(safezoneX)
#define GUI_GRID_Y	(safezoneY)
#define GUI_GRID_W	(safezoneW / 32)
#define GUI_GRID_H	(safezoneH / 20)
#define GUI_GRID_WAbs	(safezoneW)
#define GUI_GRID_HAbs	(safezoneH)

class Menu_voitures_prise_de_gang
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_voitures_prise_de_gang',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_voitures_prise_de_gang', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_disponible: RscText
		{
			idc = 1004;
			text = "Argent Disponible (Euros) :"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.219444 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1005;
			text = "0"; //--- ToDo: Localize;
			x = 0.554375 * safezoneW + safezoneX;
			y = 0.219445 * safezoneH + safezoneY;
			w = 0.24375 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class combo_list: RscListbox
		{
			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 7.9 * GUI_GRID_W + GUI_GRID_X;
			y = 5.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.2 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class boutton_previsualisation: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\licence_gang_et_territoire_gang\territoire_gang\les_menus_prise_de_gang\voitures_prise_de_gang\previsualisation_voitures_prise_de_gang.sqf';";

			idc = 1702;
			text = "               Previsualiser ..."; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.359375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.37875 * safezoneW + safezoneX;
			y = 0.738889 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\licence_gang_et_territoire_gang\territoire_gang\les_menus_prise_de_gang\voitures_prise_de_gang\achat_voitures_prise_de_gang.sqf';";

			idc = 1700;
			text = "  Acheter"; //--- ToDo: Localize;
			x = 0.5225 * safezoneW + safezoneX;
			y = 0.741111 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.693125 * safezoneW + safezoneX;
			y = 0.718889 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.71875 * safezoneW + safezoneX;
			y = 0.747222 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1006: RscText
		{
			style = ST_CENTER;

			idc = 1006;
			text = "Achetable"; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "Non Achetable"; //--- ToDo: Localize;
			x = 0.59375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
	};
};
class Menu_Armes_Pistolets_Prise_De_Gang
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Armes_Pistolets_Prise_De_Gang',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Armes_Pistolets_Prise_De_Gang', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_disponible: RscText
		{
			idc = 1004;
			text = "Argent Disponible (Euros) :"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.219444 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1005;
			text = "0"; //--- ToDo: Localize;
			x = 0.554375 * safezoneW + safezoneX;
			y = 0.219445 * safezoneH + safezoneY;
			w = 0.24375 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class combo_list: RscListbox
		{
			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 7.9 * GUI_GRID_W + GUI_GRID_X;
			y = 5.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.2 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class boutton_previsualisation: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\licence_gang_et_territoire_gang\territoire_gang\les_menus_prise_de_gang\armes_prise_de_gang\previsualisation_armes_prise_de_gang.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Previsualiser"; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.359375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.785 * safezoneH + safezoneY;
			w = 0.359375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Armes: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\licence_gang_et_territoire_gang\territoire_gang\les_menus_prise_de_gang\armes_prise_de_gang\acheter_armes_prise_de_gang.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Acheter Armes"; //--- ToDo: Localize;
			x = 0.265625 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.203125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.693125 * safezoneW + safezoneX;
			y = 0.718889 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.71875 * safezoneW + safezoneX;
			y = 0.747222 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1006: RscText
		{
			style = ST_CENTER;

			idc = 1006;
			text = "Achetable"; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "Non Achetable"; //--- ToDo: Localize;
			x = 0.59375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class Boutton_Munitions: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\licence_gang_et_territoire_gang\territoire_gang\les_menus_prise_de_gang\armes_prise_de_gang\acheter_munitions_prise_de_gang.sqf';";
			style = ST_CENTER;

			idc = 1703;
			text = "Acheter Munitions"; //--- ToDo: Localize;
			x = 0.53125 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.203125 * safezoneW;
			h = 0.05 * safezoneH;
		};
	};
};
class Menu_Attachement_Armes_Prise_De_Gang
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Attachement_Armes_Prise_De_Gang',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Attachement_Armes_Prise_De_Gang', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_disponible: RscText
		{
			idc = 1004;
			text = "Argent Disponible (Euros) :"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.219444 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1005;
			text = "0"; //--- ToDo: Localize;
			x = 0.554375 * safezoneW + safezoneX;
			y = 0.219445 * safezoneH + safezoneY;
			w = 0.24375 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class combo_list: RscListbox
		{
			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 7.9 * GUI_GRID_W + GUI_GRID_X;
			y = 5.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.2 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "         Fermer"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.21875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Armes: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\licence_gang_et_territoire_gang\territoire_gang\les_menus_prise_de_gang\equipements_armes_prise_de_gang\acheter_attachement_armes_prise_de_gang.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "     Acheter Objet"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.21875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.693125 * safezoneW + safezoneX;
			y = 0.718889 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.71875 * safezoneW + safezoneX;
			y = 0.747222 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1006: RscText
		{
			style = ST_CENTER;

			idc = 1006;
			text = "Achetable"; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "Non Achetable"; //--- ToDo: Localize;
			x = 0.59375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
	};
};