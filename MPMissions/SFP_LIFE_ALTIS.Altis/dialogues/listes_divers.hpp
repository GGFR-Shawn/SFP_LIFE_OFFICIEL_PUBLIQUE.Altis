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

class Banniere_NeoMedia
{
	idd = -1;
	movingenable = 0;

	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
		};
		class Titre_NeoNew: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "   !!! Banderole NeoNews !!!"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Text_Edit_NeoMedia: RscEdit
		{
			idc = 1234;

			text = "                  Taper ici le titre de la news ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.213333 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "['2'] execVM 'divers\nos_entreprises\sarl_neomedia\banniere_neomedia\creation_banniere_neonews.sqf';";

			idc = 1700;
			text = "  Envoyer"; //--- ToDo: Localize;
			x = 0.5625 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.693125 * safezoneW + safezoneX;
			y = 0.718889 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1235;
			style = ST_MULTI;

			text = "                      Taper ici la news ..."; //--- ToDo: Localize;
			x = 0.244375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.35 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.71875 * safezoneW + safezoneX;
			y = 0.747222 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "['1'] execVM 'divers\nos_entreprises\sarl_neomedia\banniere_neomedia\creation_banniere_neonews.sqf';";

			idc = 1702;
			text = "               Previsualiser ..."; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.359375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			idc = 1703;
			text = " Tps Affichage :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class combo_temps: RscCombo
		{
			idc = 4040;

			text = "Temps affichage"; //--- ToDo: Localize;
			x = 13.82 * GUI_GRID_W + GUI_GRID_X;
			y = 13.37 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.4 * GUI_GRID_W;
			h = 0.6 * GUI_GRID_H;
			colorText[] = {0,0,0,0.1};
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,0.9};
		};
	};
};
class Banniere_Staff
{
	idd = -1;
	movingenable = 0;

	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
		};
		class Titre_NeoNew: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "  !!! Banderole STAFF !!!"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Text_Edit_NeoMedia: RscEdit
		{
			idc = 1234;

			text = "                  Taper ici le titre de modération ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.213333 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "['2'] execVM 'divers\hud\admin\banniere\creation_banniere_staff.sqf';";

			idc = 1700;
			text = "  Envoyer"; //--- ToDo: Localize;
			x = 0.5625 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.693125 * safezoneW + safezoneX;
			y = 0.718889 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1235;
			style = ST_MULTI;

			text = "                 Taper ici le message de modération ..."; //--- ToDo: Localize;
			x = 0.244375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.35 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.71875 * safezoneW + safezoneX;
			y = 0.747222 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "['1'] execVM 'divers\hud\admin\banniere\creation_banniere_staff.sqf';";

			idc = 1702;
			text = "               Previsualiser ..."; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.359375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			idc = 1703;
			text = " Tps Affichage :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class combo_temps: RscCombo
		{
			idc = 4040;

			text = "Temps affichage"; //--- ToDo: Localize;
			x = 13.82 * GUI_GRID_W + GUI_GRID_X;
			y = 13.37 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.4 * GUI_GRID_W;
			h = 0.6 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,0.9};
		};
	};
};
class Menu_Boutique_Divers
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Boutique_Divers',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Boutique_Divers', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\shop_divers\acheter_boutique_divers.sqf';";
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
class Menu_Shop_Un_Fumigene
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Shop_Un_Fumigene',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Shop_Un_Fumigene', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\shop_divers\acheter_grenade_fumigene.sqf';";
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
class Menu_Boutique_Plongee
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Boutique_Plongee',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Boutique_Plongee', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\shop_divers\acheter_boutique_plongee.sqf';";
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
class Chat_Repondre_A_Un_Joueur
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Chat_Repondre_A_Un_Joueur',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Chat_Repondre_A_Un_Joueur', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.135 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_disponible: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Repondre directement a un joueur ..."; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.095 * safezoneH + safezoneY;
			w = 0.40625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "         Fermer"; //--- ToDo: Localize;
			x = 0.384375 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Repondre: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\nouveau_historique\repondre_au_message.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "   Envoyer le message"; //--- ToDo: Localize;
			x = 0.384375 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.78375 * safezoneW + safezoneX;
			y = 0.718889 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.8 * safezoneW + safezoneX;
			y = 0.747222 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = "Message :"; //--- ToDo: Localize;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.090625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "Pour :"; //--- ToDo: Localize;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.053125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscEdit_1400: RscEdit
		{
			style = ST_MULTI;

			idc = 1400;
			text = "       Taper ici directement la reponse ..."; //--- ToDo: Localize;
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.375 * safezoneW;
			h = 0.4 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Son nom :"; //--- ToDo: Localize;
			x = 0.371875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.325 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0,0.83,0.1,1};
		};
	};
};
class Menu_Banque_news
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Banque_news',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Banque_news', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2204 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.4096 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_banque: RscText
		{
			idc = 1004;
			text = "Banque :"; //--- ToDo: Localize;
			x = 0.252248 * safezoneW + safezoneX;
			y = 0.2388 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_banque_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1005;
			text = "2000000"; //--- ToDo: Localize;
			x = 0.320998 * safezoneW + safezoneX;
			y = 0.2388 * safezoneH + safezoneY;
			w = 0.117408 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class mettre_en_poche: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\banque\mettre_argent_en_poche.sqf';";

			idc = 1702;
			text = "    Mettre en poche ..."; //--- ToDo: Localize;
			x = 0.268125 * safezoneW + safezoneX;
			y = 0.464 * safezoneH + safezoneY;
			w = 0.2225 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.260938 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.273687 * safezoneW + safezoneX;
			y = 0.6428 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "GERER MON ARGENT"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.1774 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class texte_argent_poche: RscText
		{
			idc = 1001;
			text = "Poche :"; //--- ToDo: Localize;
			x = 0.439157 * safezoneW + safezoneX;
			y = 0.2388 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_poche_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1006;
			text = "10000"; //--- ToDo: Localize;
			x = 0.501657 * safezoneW + safezoneX;
			y = 0.2388 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class texte_livret_a_poche: RscText
		{
			idc = 1008;
			text = "Livret A :"; //--- ToDo: Localize;
			x = 0.603532 * safezoneW + safezoneX;
			y = 0.239844 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_livret_a_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1009;
			text = "10000"; //--- ToDo: Localize;
			x = 0.684157 * safezoneW + safezoneX;
			y = 0.2388 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper le montant que vous souhaitez ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.315467 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class mettre_en_banque: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\banque\mettre_argent_en_banque.sqf';";

			idc = 1700;
			text = "   Mettre en banque ..."; //--- ToDo: Localize;
			x = 0.2675 * safezoneW + safezoneX;
			y = 0.404 * safezoneH + safezoneY;
			w = 0.2225 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class mettre_sur_mon_livret_a: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\livret_a_banque\livret_a_banque_deposer_sur_mon_compte.sqf';";

			idc = 1703;
			text = "Mettre sur mon Livret ..."; //--- ToDo: Localize;
			x = 0.505 * safezoneW + safezoneX;
			y = 0.404 * safezoneH + safezoneY;
			w = 0.2225 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class retirer_de_mon_livret_a: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\livret_a_banque\livret_a_banque_retirer_sur_mon_compte.sqf';";

			idc = 1704;
			text = "Retirer de mon Livret ..."; //--- ToDo: Localize;
			x = 0.505 * safezoneW + safezoneX;
			y = 0.464 * safezoneH + safezoneY;
			w = 0.2225 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class faire_un_virement: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\banque\menu_faire_un_virement.sqf';";

			idc = 1705;
			text = "        Faire un virement ..."; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
};
class Menu_Banque_Transfert
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Banque_Transfert',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Banque_Transfert', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2204 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.4096 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_banque: RscText
		{
			idc = 1004;
			text = "Banque :"; //--- ToDo: Localize;
			x = 0.413939 * safezoneW + safezoneX;
			y = 0.2382 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_banque_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1005;
			text = "10000"; //--- ToDo: Localize;
			x = 0.481992 * safezoneW + safezoneX;
			y = 0.237622 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.260938 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.273687 * safezoneW + safezoneX;
			y = 0.6428 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "ENVOYER UN VIREMENT"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.1774 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper le montant que vous souhaitez et choissez un joueur ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.478667 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class faire_un_virement: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\banque\virement_argent.sqf';";

			idc = 1705;
			text = "        Envoyer l'argent ..."; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.5604 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class listes_des_joueurs: RscListbox
		{
			idc = 1500;
			x = 0.248188 * safezoneW + safezoneX;
			y = 0.2858 * safezoneH + safezoneY;
			w = 0.502031 * safezoneW;
			h = 0.1734 * safezoneH;
		};
	};
};
class Menu_Banque_Envoyer_Argent_Poche
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Banque_Envoyer_Argent_Poche',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Banque_Envoyer_Argent_Poche', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.243 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.260938 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.273687 * safezoneW + safezoneX;
			y = 0.6258 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "ENVOYER ARGENT DE POCHE"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.3304 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class texte_argent_poche: RscText
		{
			idc = 1001;
			text = "Argent en poche :"; //--- ToDo: Localize;
			x = 0.388149 * safezoneW + safezoneX;
			y = 0.3816 * safezoneH + safezoneY;
			w = 0.137349 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_poche_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1006;
			text = "10000"; //--- ToDo: Localize;
			x = 0.528755 * safezoneW + safezoneX;
			y = 0.3816 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper le montant que vous souhaitez donner ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.454867 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class faire_un_virement: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\donner_argent_joueur\donner_argent_au_joueur.sqf';";

			idc = 1705;
			text = "Donner a "; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
};
class Menu_Camera_Altis
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Camera_Altis',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Camera_Altis', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.26875 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.4625 * safezoneW;
			h = 0.52 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_controler_camera: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Controler les cameras de Altis ..."; //--- ToDo: Localize;
			x = 0.271875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.45625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class combo_list: RscListbox
		{
			onLBDblClick = "[_this] execVM ""divers\camera_surveillance\prendre_controle_d_une_camera.sqf"";";

			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "   Fermer"; //--- ToDo: Localize;
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.28125 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "Double cliquez pour prendre le control ..."; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0.75,0.15,1};
		};
	};
};
class Choix_Menu_Gendarme_Armes_Etc
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Choix_Menu_Gendarme_Armes_Etc',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Choix_Menu_Gendarme_Armes_Etc', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.435 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix_vehicule: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Choix menu liste gendarmerie"; //--- ToDo: Localize;
			x = 0.184375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.63125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "   Fermer"; //--- ToDo: Localize;
			x = 0.6625 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.1875 * safezoneW + safezoneX;
			y = 0.605 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\banque\menu_banque.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Menu Banque"; //--- ToDo: Localize;
			x = 0.265625 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "[] execVM 'menu\licensemenu.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Menu License"; //--- ToDo: Localize;
			x = 0.265 * safezoneW + safezoneX;
			y = 0.309444 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\demarrage_patrouille_gendarmerie.sqf';";
			style = ST_CENTER;

			idc = 1703;
			text = "Mission de patrouille"; //--- ToDo: Localize;
			x = 0.265 * safezoneW + safezoneX;
			y = 0.486667 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			onButtonClick = "[0,0,0,[[0,0,0,['0']]]] execVM 'divers\achats_divers_et_vehicules\vetements\menu_vetement.sqf';";
			style = ST_CENTER;

			idc = 1704;
			text = "Boutique Habits"; //--- ToDo: Localize;
			x = 0.265 * safezoneW + safezoneX;
			y = 0.368333 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1705: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\achats_armes_nouveau\divers\menudronedesurveillance.sqf';";
			style = ST_CENTER;

			idc = 1705;
			text = "Drone de surveillance"; //--- ToDo: Localize;
			x = 0.533125 * safezoneW + safezoneX;
			y = 0.249444 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1707: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\gendarmerie\chien_d_attaque\acheter_chien_d_attaque.sqf';";
			style = ST_CENTER;

			idc = 1707;
			text = "Acheter Un Chien"; //--- ToDo: Localize;
			x = 0.533125 * safezoneW + safezoneX;
			y = 0.309444 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1708: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\achats_divers_et_vehicules\shop_divers\menu_boutique_divers.sqf';";
			style = ST_CENTER;

			idc = 1708;
			text = "Boutique Divers"; //--- ToDo: Localize;
			x = 0.265 * safezoneW + safezoneX;
			y = 0.427222 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1709: RscShortcutButton
		{
			onButtonClick = "[0,0,0,[5]] execVM 'divers\achats_armes_nouveau\menu_armes_sfp.sqf';";
			style = ST_CENTER;

			idc = 1709;
			text = "Armes GIGN"; //--- ToDo: Localize;
			x = 0.533125 * safezoneW + safezoneX;
			y = 0.369444 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1710: RscShortcutButton
		{
			onButtonClick = "createDialog ""Menu_Choix_Armes_Legales"";disableSerialization;((uiNamespace getVariable ""Menu_Choix_Armes_Legales"") displayCtrl 1004) ctrlSetText ""... Vendeur D'armes Légales ..."";";
			style = ST_CENTER;

			idc = 1710;
			text = "Armes Gendarme"; //--- ToDo: Localize;
			x = 0.533125 * safezoneW + safezoneX;
			y = 0.428333 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1711: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\achats_armes_nouveau\menu_attachements_des_armes.sqf';";
			style = ST_CENTER;

			idc = 1711;
			text = "Accessoires armes"; //--- ToDo: Localize;
			x = 0.53375 * safezoneW + safezoneX;
			y = 0.487222 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
	};
};
class Menu_GIGN_Drone
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_GIGN_Drone',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_GIGN_Drone', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_armes_nouveau\divers\dronedesurveillance.sqf';";
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
class Menu_Retrait_De_Points
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Retrait_De_Points',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Retrait_De_Points', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.243 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.6294 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.260938 * safezoneW + safezoneX;
			y = 0.5816 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.273687 * safezoneW + safezoneX;
			y = 0.6054 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "RETIRER POINTS PERMIS DE CONDUIRE"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.3304 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class texte_points_restants: RscText
		{
			idc = 1001;
			text = "Points restants sur son permis :"; //--- ToDo: Localize;
			x = 0.363551 * safezoneW + safezoneX;
			y = 0.3816 * safezoneH + safezoneY;
			w = 0.260087 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class points_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1006;
			text = "2"; //--- ToDo: Localize;
			x = 0.61455 * safezoneW + safezoneX;
			y = 0.3816 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "Taper les points que vous souhaitez retirer ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.454867 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class faire_un_virement: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\gendarmerie\retrait_de_points\envoyer_retrait_de_point.sqf';";

			idc = 1705;
			text = "Envoyer le retrait a."; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
};
class Menu_Remettre_Des_Points
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Remettre_Des_Points',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Remettre_Des_Points', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.243 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.6294 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.260938 * safezoneW + safezoneX;
			y = 0.5816 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.273687 * safezoneW + safezoneX;
			y = 0.6054 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "REMETTRE DES POINTS PERMIS DE CONDUIRE"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.3304 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class texte_points_restants: RscText
		{
			idc = 1001;
			text = "Points restants sur son permis :"; //--- ToDo: Localize;
			x = 0.363551 * safezoneW + safezoneX;
			y = 0.3816 * safezoneH + safezoneY;
			w = 0.260087 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class points_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1006;
			text = "2"; //--- ToDo: Localize;
			x = 0.61455 * safezoneW + safezoneX;
			y = 0.3816 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "Taper les points que vous souhaitez remettre au joueur ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.454867 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class faire_un_virement: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\nos_entreprises\sarl_autoecole\remettre_des_points\envoyer_remettre_points.sqf';";

			idc = 1705;
			text = "Remettre les points a."; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
};
class Menu_Choix_Clefs_Maison
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Choix_Clefs_Maison',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Choix_Clefs_Maison', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.3802 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.2566 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Preter_Clefs: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\achat_de_maison\pret_des_clefs\preter_clef_maison\menu_pret_clefs_maisons.sqf';";

			idc = 1702;
			text = "   Preter Mes Clefs"; //--- ToDo: Localize;
			x = 0.3725 * safezoneW + safezoneX;
			y = 0.5238 * safezoneH + safezoneY;
			w = 0.2225 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.260938 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.273687 * safezoneW + safezoneX;
			y = 0.6428 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "CLEFS DE VOTRE MAISON"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.3984 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Farming_Legal: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\achat_de_maison\pret_des_clefs\reprendre_clef_maison\menu_reprendre_clefs_maisons.sqf';";

			idc = 1700;
			text = " Reprendre Mes Clefs"; //--- ToDo: Localize;
			x = 0.3725 * safezoneW + safezoneX;
			y = 0.4626 * safezoneH + safezoneY;
			w = 0.2225 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
};
class Menu_Preter_Clefs_Maison
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Preter_Clefs_Maison',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Preter_Clefs_Maison', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.52 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix_vehicule: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Choix de la maison ..."; //--- ToDo: Localize;
			x = 0.184375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.63125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class combo_list: RscListbox
		{
			onLBDblClick = "[_this] execVM ""divers\achat_de_maison\pret_des_clefs\preter_clef_maison\action_pret_clefs_maisons.sqf"";";

			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 8.7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "   Fermer"; //--- ToDo: Localize;
			x = 0.6625 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.1875 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "Double cliquez pour preter les clefs au joueur ..."; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0.75,0.15,1};
		};
	};
};
class Menu_Reprendre_Clefs_Maison
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Reprendre_Clefs_Maison',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Reprendre_Clefs_Maison', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.52 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix_vehicule: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Choix de la maison ..."; //--- ToDo: Localize;
			x = 0.184375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.63125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class combo_list: RscListbox
		{
			onLBDblClick = "[_this] execVM ""divers\achat_de_maison\pret_des_clefs\reprendre_clef_maison\action_reprendre_clefs_maisons.sqf"";";

			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 8.7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "   Fermer"; //--- ToDo: Localize;
			x = 0.6625 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.1875 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "Double cliquez pour reprendre les clefs au joueur ..."; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0.75,0.15,1};
		};
	};
};
class Menu_Decorateur_Interieur
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Decorateur_Interieur',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Decorateur_Interieur', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.52 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix_vehicule: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Choix de la maison ..."; //--- ToDo: Localize;
			x = 0.184375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.63125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class combo_list: RscListbox
		{
			onLBDblClick = "[_this] execVM ""divers\achat_de_maison\decorateur_interieur\poser_l_objet_decoration_interieur_by_maxou.sqf"";";

			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 8.7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "   Fermer"; //--- ToDo: Localize;
			x = 0.6625 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.1875 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "Double cliquez pour reprendre les clefs au joueur ..."; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0.75,0.15,1};
		};
	};
};
class Menu_SuperMarche
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_SuperMarche',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_SuperMarche', nil]";
	
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
			onButtonClick = "execVM 'divers\achat_divers_supermarche\acheter.sqf';";
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
class menu_carte_identite_sfp_maxou_creation
{
	idd = 456987;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['menu_carte_identite_sfp_maxou_creation',_this select 0]";
	onUnLoad="uiNamespace setVariable ['menu_carte_identite_sfp_maxou_creation', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.254407 * safezoneW + safezoneX;
			y = 0.135 * safezoneH + safezoneY;
			w = 0.506891 * safezoneW;
			h = 0.564575 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class titre: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Creation de votre carte d'identité ..."; //--- ToDo: Localize;
			x = 0.25625 * safezoneW + safezoneX;
			y = 0.075 * safezoneH + safezoneY;
			w = 0.503125 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.271797 * safezoneW + safezoneX;
			y = 0.66245 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.286703 * safezoneW + safezoneX;
			y = 0.686425 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class bouton_visualiser: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\services_publiques\declaration_mairie_et_carte_identite\me_declarer_a_la_mairie_previsualisation.sqf';";

			idc = 1700;
			text = "  Visualiser la carte"; //--- ToDo: Localize;
			x = 0.540108 * safezoneW + safezoneX;
			y = 0.706975 * safezoneH + safezoneY;
			w = 0.208094 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			x = 0.259375 * safezoneW + safezoneX;
			y = 0.14185 * safezoneH + safezoneY;
			w = 0.496875 * safezoneW;
			h = 0.551425 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.1};
		};
		class nom: RscText
		{
			idc = 1005;
			text = "Nom :"; //--- ToDo: Localize;
			x = 0.278766 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.06375 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class prenom: RscText
		{
			idc = 1006;
			text = "Prenom :"; //--- ToDo: Localize;
			x = 0.278766 * safezoneW + safezoneX;
			y = 0.2424 * safezoneH + safezoneY;
			w = 0.0687188 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class sexe: RscText
		{
			idc = 1007;
			text = "Sexe :"; //--- ToDo: Localize;
			x = 0.279251 * safezoneW + safezoneX;
			y = 0.33365 * safezoneH + safezoneY;
			w = 0.06375 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class lieu_de_naissance: RscText
		{
			idc = 1008;
			text = "Lieu De Naissance :"; //--- ToDo: Localize;
			x = 0.279251 * safezoneW + safezoneX;
			y = 0.426125 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class Taille: RscText
		{
			idc = 1009;
			text = "Taille :"; //--- ToDo: Localize;
			x = 0.278766 * safezoneW + safezoneX;
			y = 0.518575 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class avertir: RscText
		{
			idc = 1010;
			text = "Attention, une fois validé vous ne pourrez plus recommencer !"; //--- ToDo: Localize;
			x = 0.286701 * safezoneW + safezoneX;
			y = 0.611075 * safezoneH + safezoneY;
			w = 0.462116 * safezoneW;
			h = 0.03425 * safezoneH;
			colorText[] = {1,0,0,1};
		};
		class editer_nom: RscEdit
		{
			idc = 1400;
			text = "Taper votre nom (RP)."; //--- ToDo: Localize;
			x = 0.435748 * safezoneW + safezoneX;
			y = 0.152125 * safezoneH + safezoneY;
			w = 0.230184 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class editer_prenom: RscEdit
		{
			idc = 1401;
			text = "Taper votre prenom (RP)."; //--- ToDo: Localize;
			x = 0.43576 * safezoneW + safezoneX;
			y = 0.24055 * safezoneH + safezoneY;
			w = 0.22995 * safezoneW;
			h = 0.085625 * safezoneH;
		};
		class editer_sexe: RscEdit
		{
			idc = 1402;
			text = "Taper votre sexe."; //--- ToDo: Localize;
			x = 0.435754 * safezoneW + safezoneX;
			y = 0.33365 * safezoneH + safezoneY;
			w = 0.230184 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class editer_lieu_de_naissance: RscEdit
		{
			idc = 1403;
			text = "Taper votre lieu de naissance."; //--- ToDo: Localize;
			x = 0.435767 * safezoneW + safezoneX;
			y = 0.426125 * safezoneH + safezoneY;
			w = 0.230184 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class editer_taille: RscEdit
		{
			idc = 1404;
			text = "Taper votre taille."; //--- ToDo: Localize;
			x = 0.435754 * safezoneW + safezoneX;
			y = 0.5186 * safezoneH + safezoneY;
			w = 0.230184 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class RscText_1011: RscText
		{
			idc = 1011;
			text = "Ne depasser pas la largeur d'écriture, sinon bug !"; //--- ToDo: Localize;
			x = 0.286703 * safezoneW + safezoneX;
			y = 0.64875 * safezoneH + safezoneY;
			w = 0.462116 * safezoneW;
			h = 0.03425 * safezoneH;
			colorText[] = {1,0,0,1};
		};
		class avatar: RscText
		{
			style = ST_CENTER;

			idc = 1012;
			text = "... Avatar ..."; //--- ToDo: Localize;
			x = 0.050709 * safezoneW + safezoneX;
			y = 0.152125 * safezoneH + safezoneY;
			w = 0.192924 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.0487246 * safezoneW + safezoneX;
			y = 0.22135 * safezoneH + safezoneY;
			w = 0.197892 * safezoneW;
			h = 0.348725 * safezoneH;
		};
		class boutton_autres: RscShortcutButton
		{
			onButtonClick = "choix_avatar_carte_identite = round (random 36); ((findDisplay 456987) displayCtrl 1200) ctrlSetText (listes_des_avatars_carte_identite select choix_avatar_carte_identite);";

			idc = 1701;
			text = "Autres photos"; //--- ToDo: Localize;
			x = 0.075532 * safezoneW + safezoneX;
			y = 0.58025 * safezoneH + safezoneY;
			w = 0.141026 * safezoneW;
			h = 0.05 * safezoneH;
		};	
	};
};
class menu_carte_identite_sfp_maxou_visualisation
{
	idd = 456986;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['menu_carte_identite_sfp_maxou_visualisation',_this select 0]";
	onUnLoad="uiNamespace setVariable ['menu_carte_identite_sfp_maxou_visualisation', nil]";
	
	class Controls
	{
		class image_carte_identite: RscPicture
		{
			idc = 1200;
			text = "textures\icones\carte_identite_altis_life_sfp_maxou.jpeg";
			x = 0.109531 * safezoneW + safezoneX;
			y = 0.075 * safezoneH + safezoneY;
			w = 0.796875 * safezoneW;
			h = 0.816 * safezoneH;
		};
		class numero_de_la_carte_un: RscText
		{
			idc = 1000;
			text = "numero_de_la_carte_un"; //--- ToDo: Localize;
			x = 0.476875 * safezoneW + safezoneX;
			y = 0.217111 * safezoneH + safezoneY;
			w = 0.21675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_deux: RscText
		{
			idc = 1001;
			text = "numero_de_la_carte_deux"; //--- ToDo: Localize;
			x = 0.174375 * safezoneW + safezoneX;
			y = 0.687111 * safezoneH + safezoneY;
			w = 0.21675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_trois: RscText
		{
			idc = 1002;
			text = "numero_de_la_carte_trois"; //--- ToDo: Localize;
			x = 0.735625 * safezoneW + safezoneX;
			y = 0.691556 * safezoneH + safezoneY;
			w = 0.14425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_quatre: RscText
		{
			idc = 1003;
			text = "numero_de_la_carte_quatre"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.753778 * safezoneH + safezoneY;
			w = 0.30675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_cinq: RscText
		{
			idc = 1004;
			text = "numero_de_la_carte_cinq"; //--- ToDo: Localize;
			x = 0.55375 * safezoneW + safezoneX;
			y = 0.757111 * safezoneH + safezoneY;
			w = 0.09425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_six: RscText
		{
			idc = 1005;
			text = "numero_de_la_carte_six"; //--- ToDo: Localize;
			x = 0.681875 * safezoneW + safezoneX;
			y = 0.753778 * safezoneH + safezoneY;
			w = 0.14425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class date_de_naissance: RscText
		{
			idc = 1006;
			text = "date_de_naissance"; //--- ToDo: Localize;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.421555 * safezoneH + safezoneY;
			w = 0.21675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class nom_de_famille: RscText
		{
			idc = 1007;
			text = "nom_de_famille"; //--- ToDo: Localize;
			x = 0.4375 * safezoneW + safezoneX;
			y = 0.265556 * safezoneH + safezoneY;
			w = 0.19175 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class prenom: RscText
		{
			idc = 1008;
			text = "prenom"; //--- ToDo: Localize;
			x = 0.471875 * safezoneW + safezoneX;
			y = 0.344889 * safezoneH + safezoneY;
			w = 0.22425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class sexe: RscText
		{
			idc = 1009;
			text = "sexe"; //--- ToDo: Localize;
			x = 0.435 * safezoneW + safezoneX;
			y = 0.422667 * safezoneH + safezoneY;
			w = 0.11175 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class lieu_de_naissance: RscText
		{
			idc = 1010;
			text = "lieu_de_naissance"; //--- ToDo: Localize;
			x = 0.414375 * safezoneW + safezoneX;
			y = 0.458222 * safezoneH + safezoneY;
			w = 0.23425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class taille: RscText
		{
			idc = 1011;
			text = "taille"; //--- ToDo: Localize;
			x = 0.446875 * safezoneW + safezoneX;
			y = 0.499333 * safezoneH + safezoneY;
			w = 0.23425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class Boutton_Valider: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\services_publiques\declaration_mairie_et_carte_identite\me_declarer_a_la_mairie_validation.sqf';";

			idc = 1700;
			text = "Valider la carte d'identite !"; //--- ToDo: Localize;
			x = 0.64125 * safezoneW + safezoneX;
			y = 0.9004 * safezoneH + safezoneY;
			w = 0.235 * safezoneW;
			h = 0.048 * safezoneH;
			tooltip = "Attention ! Plus de retour en arrière possible !"; //--- ToDo: Localize;
		};
		class boutton_remodif: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Refaire des modification !"; //--- ToDo: Localize;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.235 * safezoneW;
			h = 0.048 * safezoneH;
		};
		class emplacement_photo_identite: RscPicture
		{
			idc = 1201;
			text = "textures\icones\avatars\avatar_0001.jpg";
			x = 0.1475 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.2175 * safezoneW;
			h = 0.408 * safezoneH;
		};
	};
};
class menu_carte_identite_sfp_maxou_affichage_seulement
{
	idd = 156986;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['menu_carte_identite_sfp_maxou_affichage_seulement',_this select 0]";
	onUnLoad="uiNamespace setVariable ['menu_carte_identite_sfp_maxou_affichage_seulement', nil]";
	
	class Controls
	{
		class image_carte_identite: RscPicture
		{
			idc = 1200;
			text = "textures\icones\carte_identite_altis_life_sfp_maxou.jpeg";
			x = 0.109531 * safezoneW + safezoneX;
			y = 0.075 * safezoneH + safezoneY;
			w = 0.796875 * safezoneW;
			h = 0.816 * safezoneH;
		};
		class numero_de_la_carte_un: RscText
		{
			idc = 1000;
			text = "numero_de_la_carte_un"; //--- ToDo: Localize;
			x = 0.476875 * safezoneW + safezoneX;
			y = 0.217111 * safezoneH + safezoneY;
			w = 0.21675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_deux: RscText
		{
			idc = 1001;
			text = "numero_de_la_carte_deux"; //--- ToDo: Localize;
			x = 0.174375 * safezoneW + safezoneX;
			y = 0.687111 * safezoneH + safezoneY;
			w = 0.21675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_trois: RscText
		{
			idc = 1002;
			text = "numero_de_la_carte_trois"; //--- ToDo: Localize;
			x = 0.735625 * safezoneW + safezoneX;
			y = 0.691556 * safezoneH + safezoneY;
			w = 0.14425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_quatre: RscText
		{
			idc = 1003;
			text = "numero_de_la_carte_quatre"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.753778 * safezoneH + safezoneY;
			w = 0.30675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_cinq: RscText
		{
			idc = 1004;
			text = "numero_de_la_carte_cinq"; //--- ToDo: Localize;
			x = 0.55375 * safezoneW + safezoneX;
			y = 0.757111 * safezoneH + safezoneY;
			w = 0.09425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class numero_de_la_carte_six: RscText
		{
			idc = 1005;
			text = "numero_de_la_carte_six"; //--- ToDo: Localize;
			x = 0.681875 * safezoneW + safezoneX;
			y = 0.753778 * safezoneH + safezoneY;
			w = 0.14425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class date_de_naissance: RscText
		{
			idc = 1006;
			text = "date_de_naissance"; //--- ToDo: Localize;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.421555 * safezoneH + safezoneY;
			w = 0.21675 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class nom_de_famille: RscText
		{
			idc = 1007;
			text = "nom_de_famille"; //--- ToDo: Localize;
			x = 0.4375 * safezoneW + safezoneX;
			y = 0.265556 * safezoneH + safezoneY;
			w = 0.19175 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class prenom: RscText
		{
			idc = 1008;
			text = "prenom"; //--- ToDo: Localize;
			x = 0.471875 * safezoneW + safezoneX;
			y = 0.344889 * safezoneH + safezoneY;
			w = 0.22425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class sexe: RscText
		{
			idc = 1009;
			text = "sexe"; //--- ToDo: Localize;
			x = 0.435 * safezoneW + safezoneX;
			y = 0.422667 * safezoneH + safezoneY;
			w = 0.11175 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class lieu_de_naissance: RscText
		{
			idc = 1010;
			text = "lieu_de_naissance"; //--- ToDo: Localize;
			x = 0.414375 * safezoneW + safezoneX;
			y = 0.458222 * safezoneH + safezoneY;
			w = 0.23425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class taille: RscText
		{
			idc = 1011;
			text = "taille"; //--- ToDo: Localize;
			x = 0.446875 * safezoneW + safezoneX;
			y = 0.499333 * safezoneH + safezoneY;
			w = 0.23425 * safezoneW;
			h = 0.0306 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class emplacement_photo_identite: RscPicture
		{
			idc = 1201;
			text = "textures\icones\avatars\avatar_0001.jpg";
			x = 0.1475 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.2175 * safezoneW;
			h = 0.408 * safezoneH;
		};
	};
};
class Menu_SFP_Telecom
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_SFP_Telecom',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_SFP_Telecom', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.23435 * safezoneW + safezoneX;
			y = 0.21004 * safezoneH + safezoneY;
			w = 0.531251 * safezoneW;
			h = 0.449999 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Titre_modifiable: RscText
		{
			idc = 1001;
			text = "Titre a modifier."; //--- ToDo: Localize;
			x = 0.237547 * safezoneW + safezoneX;
			y = 0.16494 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class combo_list_tuning: RscListBox
		{
			onLBDblClick = "[_this] execvm ""divers\telephone_by_sfp_maxou\sfp_telecom\boutique_sfp_telecom\action_boutique_sfp_telecom.sqf"";";

			idc = 1002;
			text = "combo_tuning"; //--- ToDo: Localize;
			x = 0.246828 * safezoneW + safezoneX;
			y = 0.26658 * safezoneH + safezoneY;
			w = 0.50839 * safezoneW;
			h = 0.3346 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1700;
			text = "    Fermer"; //--- ToDo: Localize;
			x = 0.655203 * safezoneW + safezoneX;
			y = 0.6738 * safezoneH + safezoneY;
			w = 0.094313 * safezoneW;
			h = 0.0324001 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1003;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.23435 * safezoneW + safezoneX;
			y = 0.63002 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1004;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.246828 * safezoneW + safezoneX;
			y = 0.6419 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class choix_menu_un: RscText
		{
			idc = 1006;
			text = "Choix SFP TELECOM :"; //--- ToDo: Localize;
			x = 0.250025 * safezoneW + safezoneX;
			y = 0.21994 * safezoneH + safezoneY;
			w = 0.30625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1012;
			text = "Double cliquer pour acheter ..."; //--- ToDo: Localize;
			x = 0.573416 * safezoneW + safezoneX;
			y = 0.6133 * safezoneH + safezoneY;
			w = 0.186821 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
	};
};
class Menu_TaskForce_Telecom
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_TaskForce_Telecom',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_TaskForce_Telecom', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.23435 * safezoneW + safezoneX;
			y = 0.21004 * safezoneH + safezoneY;
			w = 0.531251 * safezoneW;
			h = 0.449999 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Titre_modifiable: RscText
		{
			idc = 1001;
			text = "Titre a modifier."; //--- ToDo: Localize;
			x = 0.237547 * safezoneW + safezoneX;
			y = 0.16494 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class combo_list_tuning: RscListBox
		{
			onLBDblClick = "[_this] execvm ""divers\telephone_by_sfp_maxou\sfp_telecom\boutique_sfp_telecom\action_taskforce_sfp_telecom.sqf"";";

			idc = 1002;
			text = "combo_tuning"; //--- ToDo: Localize;
			x = 0.246828 * safezoneW + safezoneX;
			y = 0.26658 * safezoneH + safezoneY;
			w = 0.50839 * safezoneW;
			h = 0.3346 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1700;
			text = "    Fermer"; //--- ToDo: Localize;
			x = 0.655203 * safezoneW + safezoneX;
			y = 0.6738 * safezoneH + safezoneY;
			w = 0.094313 * safezoneW;
			h = 0.0324001 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1003;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.23435 * safezoneW + safezoneX;
			y = 0.63002 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1004;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.246828 * safezoneW + safezoneX;
			y = 0.6419 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class choix_menu_un: RscText
		{
			idc = 1006;
			text = "Choix SFP TELECOM :"; //--- ToDo: Localize;
			x = 0.250025 * safezoneW + safezoneX;
			y = 0.21994 * safezoneH + safezoneY;
			w = 0.30625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1012;
			text = "Double cliquer pour acheter ..."; //--- ToDo: Localize;
			x = 0.573416 * safezoneW + safezoneX;
			y = 0.6133 * safezoneH + safezoneY;
			w = 0.186821 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
	};
};
class Menu_Credit_SFP
{
	idd = 200000;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Credit_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Credit_SFP', nil]";
	
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
			onSliderPosChanged = "[0, _this] execVM 'divers\banque\credit_sfp\action_credit_sfp.sqf';";

			idc = 1900;
			x = 0.38125 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscSlider_1901: RscSlider
		{
			onSliderPosChanged = "[1, _this] execVM 'divers\banque\credit_sfp\action_credit_sfp.sqf';";

			idc = 1901;
			x = 0.38125 * safezoneW + safezoneX;
			y = 0.51 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class montant_souhaite: RscText
		{
			idc = 1006;
			text = "Montant souhaite :"; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class Mensualite: RscText
		{
			idc = 1007;
			text = "Mensualite :"; //--- ToDo: Localize;
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
			w = 0.359375 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class boutton_activer_desactiver: RscShortcutButton
		{
			onButtonClick = "[2,[0,0]] execVM 'divers\banque\credit_sfp\action_credit_sfp.sqf';";

			idc = 1700;
			text = "Valider credit"; //--- ToDo: Localize;
			x = 0.60625 * safezoneW + safezoneX;
			y = 0.575 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class credit_restant_du_info: RscText
		{
			idc = 1008;
			text = "Credit restant du :"; //--- ToDo: Localize;
			x = 0.609375 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.084375 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class indication_montant: RscText
		{
			idc = 1009;
			text = "200000 :"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.053125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class indiquation_mensualite: RscText
		{
			idc = 1010;
			text = "12000"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.053125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class credit_restant_du_valeur: RscText
		{
			idc = 1011;
			text = "200000 Euros."; //--- ToDo: Localize;
			x = 0.69375 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class Message_explication_deux_sfp: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;

			idc = 1012;
			text = "Message explication deux"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.130556 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Remboursement_Menu_Credit_SFP
{
	idd = 200000;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Remboursement_Menu_Credit_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Remboursement_Menu_Credit_SFP', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.315 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.485 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.241146 * safezoneW + safezoneX;
			y = 0.495186 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.7 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscSlider_1900: RscSlider
		{
			onSliderPosChanged = "[0, _this] execVM 'divers\banque\credit_sfp\action_remboursement_credit_sfp.sqf';";

			idc = 1900;
			x = 0.38125 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class montant_souhaite_remboursement: RscText
		{
			idc = 1006;
			text = "Montant a rembourser :"; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
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
			h = 0.21 * safezoneH;
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
			w = 0.359375 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class boutton_remboursement: RscShortcutButton
		{
			onButtonClick = "[1,[0,0]] execVM 'divers\banque\credit_sfp\action_remboursement_credit_sfp.sqf';";

			idc = 1700;
			text = "Valider remboursement"; //--- ToDo: Localize;
			x = 0.571875 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.121875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class credit_restant_du_info: RscText
		{
			idc = 1008;
			text = "Credit restant du :"; //--- ToDo: Localize;
			x = 0.609375 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.084375 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class indication_montant: RscText
		{
			idc = 1009;
			text = "200000 :"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.053125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class credit_restant_du_valeur: RscText
		{
			idc = 1011;
			text = "200000 Euros."; //--- ToDo: Localize;
			x = 0.69375 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.035 * safezoneH;
		};
	};
};
class Menu_Hack_Informatique
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Hack_Informatique',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Hack_Informatique', nil]";
	
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

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\hack_informatique\action_hack_informatique.sqf';";

			idc = 1700;
			text = "  Acheter"; //--- ToDo: Localize;
			x = 0.675 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
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
class Choix_Menu_Pompiers
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Choix_Menu_Pompiers',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Choix_Menu_Pompiers', nil]";
	
	class Controls
	{
		class CouleurFond_Deux: RscText
		{
			idc = 1001;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.34 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class CouleurFond_UN: RscText
		{
			idc = 1000;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.21 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix_vehicule: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Menu Pompier ..."; //--- ToDo: Localize;
			x = 0.184375 * safezoneW + safezoneX;
			y = 0.09 * safezoneH + safezoneY;
			w = 0.63125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "   Fermer"; //--- ToDo: Localize;
			x = 0.721875 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.196875 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class Dodo_Au_Hq: RscShortcutButton
		{
			onButtonClick = "[] execVM 'menu\hotel.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Dodo Au QG"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boire_Une_Boisson: RscShortcutButton
		{
			onButtonClick = "[] execVM 'menu\restauranteau.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Boire Une Boisson"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Prendre_Un_Repas: RscShortcutButton
		{
			onButtonClick = "[] execVM 'menu\restaurantnourriture.sqf';";
			style = ST_CENTER;

			idc = 1703;
			text = "Prendre Un Repas"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Helicoptere_Un: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_helicoptere_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1704;
			text = "Helicoptere Normal (2 000 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.365 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Helicoptere_Deux: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_helicoptere_securite_civil_pompier.sqf';";
			style = ST_CENTER;

			idc = 1705;
			text = "Helicoptere Securite Civil (3 000 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Un: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_voiture_pompier_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1706;
			text = "Tahoe Pompier (400 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Deux: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_offroad_pompier_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1707;
			text = "OffRoad Pompier (500 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.435 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Trois: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_VSAV_pompier_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1708;
			text = "VSAV Pompier (500 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.575 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Quatre: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_ambulance_suv_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1709;
			text = "SUV Pompier (300 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.505 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Cinq: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_ambulance_hatchback_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1710;
			text = "HatchBack Pompier (352 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Six: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_camion_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1711;
			text = "Poids Lourds Pompier (400 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Sept: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_ambulance_pompier_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1712;
			text = "Ambulance Pompier (560 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.365 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Equiper_Pour_Travailler: RscShortcutButton
		{
			onButtonClick = "[1] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\equiper_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1713;
			text = "Equiper Pour Travailler"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Extincteur_Et_GPS: RscShortcutButton
		{
			onButtonClick = "[2] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\equiper_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1714;
			text = "Extincteur + GPS"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Casque_Pompier: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\casques\menu_casques.sqf';";
			style = ST_CENTER;

			idc = 1715;
			text = "Casque Pompier"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1716: RscShortcutButton
		{
			onButtonClick = "[] spawn {tenue_feu_pompier = true; sleep 1; player forceAddUniform 'U_O_OfficerUniform_ocamo';sleep 1;player setObjectTextureGlobal [0, 'textures\habbit_pompier_feu.jpg'];}";
			style = ST_CENTER;

			idc = 1716;
			text = "Tenue De Feu"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.285 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Sprinter_Pompier: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_Sprinter_pompier_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1717;
			text = "Sprinter Pompier (700 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Vehicule_Mercedes_Pompier: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\acheter_Mercedes_pompier_sarl_pompier.sqf';";
			style = ST_CENTER;

			idc = 1718;
			text = "Mercedes Pompier (900 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.644445 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Tenue_Pompier_Plongee: RscShortcutButton
		{
			onButtonClick = "[] spawn {tenue_feu_pompier = true; sleep 1; player forceAddUniform 'U_B_Wetsuit';	player addVest 'V_RebreatherB'; player addItem 'G_Diving'; player assignitem 'G_Diving'; sleep 1; player setObjectTextureGlobal [0, 'textures\tenue_pompier_plongee.jpg']; hint 'Tenue de plongee ajoutee ...';}";
			style = ST_CENTER;

			idc = 1719;
			text = "Tenue de Plongee"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.284921 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutique_Divers: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\achats_divers_et_vehicules\shop_divers\menu_boutique_divers.sqf';"; 
			style = ST_CENTER;

			idc = 1720;
			text = "Boutique Divers"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.14471 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Choix_Menu_Casques_Pompiers
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Choix_Menu_Casques_Pompiers',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Choix_Menu_Casques_Pompiers', nil]";
	
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

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.675625 * safezoneW + safezoneX;
			y = 0.661111 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\nos_entreprises\sarl_pompier\sarl_pompier_client\casques\acheter_casques_pompiers.sqf';";

			idc = 1700;
			text = "  Acheter"; //--- ToDo: Localize;
			x = 0.59125 * safezoneW + safezoneX;
			y = 0.661111 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.240625 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.249479 * safezoneW + safezoneX;
			y = 0.671852 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1006: RscText
		{
			style = ST_CENTER;

			idc = 1006;
			text = "Achetable"; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
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
			y = 0.165 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
	};
};
class Menu_Joueur_Demandant_Depannage
{
	idd = 1111;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Joueur_Demandant_Depannage',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Joueur_Demandant_Depannage', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.243 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.0518 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.24181 * safezoneW + safezoneX;
			y = 0.5816 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.256153 * safezoneW + safezoneX;
			y = 0.6054 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "LISTE DES DEPANNAGES"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.3304 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class texte_personnalise: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "texte editable"; //--- ToDo: Localize;
			x = 0.244689 * safezoneW + safezoneX;
			y = 0.3816 * safezoneH + safezoneY;
			w = 0.511939 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class boutton_envoyer: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\systeme_contacter_dir\employes\avertir_le_joueur_que_j_arrive.sqf';";

			idc = 1705;
			text = "L'avertir que j'arrive"; //--- ToDo: Localize;
			x = 0.452182 * safezoneW + safezoneX;
			y = 0.6428 * safezoneH + safezoneY;
			w = 0.184796 * safezoneW;
			h = 0.0518 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.246593 * safezoneW + safezoneX;
			y = 0.432 * safezoneH + safezoneY;
			w = 0.508407 * safezoneW;
			h = 0.1666 * safezoneH;
		};
	};
};
class Menu_Argent_De_La_Gendarmerie
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Argent_De_La_Gendarmerie',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Argent_De_La_Gendarmerie', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2204 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.3942 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_gendarmerie: RscText
		{
			idc = 1004;
			text = "Argent disponible :"; //--- ToDo: Localize;
			x = 0.398474 * safezoneW + safezoneX;
			y = 0.2382 * safezoneH + safezoneY;
			w = 0.0831561 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class argent_gendarmerie_en_couleur: RscText
		{
			style = ST_LEFT;

			idc = 1005;
			text = "10000"; //--- ToDo: Localize;
			x = 0.481992 * safezoneW + safezoneX;
			y = 0.237622 * safezoneH + safezoneY;
			w = 0.179451 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.69124 * safezoneW + safezoneX;
			y = 0.6204 * safezoneH + safezoneY;
			w = 0.0609084 * safezoneW;
			h = 0.0302 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.6056 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0384 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.249974 * safezoneW + safezoneX;
			y = 0.6318 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0274 * safezoneH;
		};
		class classe_titre_gendarmerie: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "COMPTE DE LA GENDARMERIE"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.1774 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper le montant que vous souhaitez retirer ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.478667 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class boutton_retirer_argent: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\gendarmerie\compte_de_la_gendarmerie\action_argent_gendarmerie.sqf';";

			idc = 1705;
			text = "Retirer l argent du compte de la gendarmerie ..."; //--- ToDo: Localize;
			x = 0.382709 * safezoneW + safezoneX;
			y = 0.5626 * safezoneH + safezoneY;
			w = 0.22814 * safezoneW;
			h = 0.0318 * safezoneH;
		};
		class Texte_Message: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;

			idc = 1001;
			text = "Le message ici"; //--- ToDo: Localize;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.2866 * safezoneH + safezoneY;
			w = 0.492937 * safezoneW;
			h = 0.1738 * safezoneH;
		};
	};
};
class Menu_Assurance_Des_Vehicules
{
	idd = 200000;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Assurance_Des_Vehicules',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Assurance_Des_Vehicules', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.34 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.51 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.241146 * safezoneW + safezoneX;
			y = 0.520186 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.7 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscSlider_1900: RscSlider
		{
			onSliderPosChanged = "[0, _this] execVM 'divers\assurance_des_vehicules\action_assurance_des_vehicules.sqf';";

			idc = 1900;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class montant_remboursement_souhaite: RscText
		{
			idc = 1006;
			text = "Montant remboursement souhaite :"; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.153125 * safezoneW;
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
			y = 0.17 * safezoneH + safezoneY;
			w = 0.359375 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class boutton_activer_desactiver: RscShortcutButton
		{
			onButtonClick = "[1,[0,0]] execVM 'divers\assurance_des_vehicules\action_assurance_des_vehicules.sqf';";

			idc = 1700;
			text = "Valider assurance"; //--- ToDo: Localize;
			x = 0.596875 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.096875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class valeur_neuf_du_vehicule: RscText
		{
			idc = 1008;
			text = "Valeur neuf du véhicule :"; //--- ToDo: Localize;
			x = 0.584375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.109375 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class indication_montant: RscText
		{
			idc = 1009;
			text = "200000"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.053125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class valeur_du_vehicules: RscText
		{
			idc = 1011;
			text = "200000 Euros."; //--- ToDo: Localize;
			x = 0.69375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class Message_explication_deux_sfp: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;

			idc = 1012;
			text = "Message explication deux"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.135556 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class montant_a_payer: RscText
		{
			size = 0.040;

			idc = 1007;
			text = "Le montant à payer pour assurer votre véhicule est de %1 Euros. (A payer en une seul fois)"; //--- ToDo: Localize;
			x = 0.24375 * safezoneW + safezoneX;
			y = 0.515 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};

class Choix_Menu_Reparation
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Choix_Menu_Reparation',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Choix_Menu_Reparation', nil]";
	
	class Controls
	{
		class CouleurFond_UN: RscText
		{
			idc = 1000;
			x = 0.409375 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.184375 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix_vehicule: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Menu Reparation ..."; //--- ToDo: Localize;
			x = 0.411458 * safezoneW + safezoneX;
			y = 0.420926 * safezoneH + safezoneY;
			w = 0.18125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.534375 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.41875 * safezoneW + safezoneX;
			y = 0.545 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class Menu_Un: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\reparation_des_vehicules.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Reparer Moi Meme Le Vehicule"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Menu_Deux: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\systeme_contacter_dir\clients\contacter_la_dir_pour_reparation.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Appeler La DIR Pour Reparer"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.495 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};

class Menu_Stagiaire_Gendarmerie
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Stagiaire_Gendarmerie',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Stagiaire_Gendarmerie', nil]";
	
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

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.565625 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\gendarmerie\menu_stagiaire\action_menu_stagiaire.sqf';";

			idc = 1700;
			text = "  Acheter"; //--- ToDo: Localize;
			x = 0.6625 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.240625 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.248423 * safezoneW + safezoneX;
			y = 0.673959 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.04 * safezoneH;
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
class Choix_Menu_Dir
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Choix_Menu_Dir',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Choix_Menu_Dir', nil]";
	
	class Controls
	{
		class CouleurFond_Deux: RscText
		{
			idc = 1001;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.245 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class CouleurFond_UN: RscText
		{
			idc = 1000;
			x = 0.18125 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.6375 * safezoneW;
			h = 0.28 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix_vehicule: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Menu DIR ..."; //--- ToDo: Localize;
			x = 0.184375 * safezoneW + safezoneX;
			y = 0.09 * safezoneH + safezoneY;
			w = 0.63125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "   Fermer"; //--- ToDo: Localize;
			x = 0.728125 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class Helicoptere_Un: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_d_un_orca_sarl_depannage.sqf';";
			style = ST_CENTER;

			idc = 1704;
			text = "Orca (5 000 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.435 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1712: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_d_un_camion_benne_sarl_depannage.sqf';";
			style = ST_CENTER;

			idc = 1712;
			text = "Camion Benne (317 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.505 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1720: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\equiper_sarl_depannage.sqf';"; 
			style = ST_CENTER;

			idc = 1720;
			text = "M Equiper Pour Travailler (49 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.14471 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1706: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_d_une_depanneuse_lourde_sarl_depannage.sqf';";
			style = ST_CENTER;

			idc = 1706;
			text = "Depanneuse Lourde (500 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1707: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_d_une_depanneuse_legere_sarl_depannage.sqf';";
			style = ST_CENTER;

			idc = 1707;
			text = "Depanneuse Legere (250 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.435 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1708: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_d_un_renault_master_sarl_depannage.sqf';";
			style = ST_CENTER;

			idc = 1708;
			text = "Renault Master (253 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1709: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_d_une_depanneuse_modelise_sarl_depannage.sqf';";
			style = ST_CENTER;

			idc = 1709;
			text = "Camion Plateau (1 000 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.577365 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'divers\telephone_by_sfp_maxou\sfp_telecom\boutique_sfp_telecom\menu_taskforce_sfp_telecom.sqf';"; 
			style = ST_CENTER;

			idc = 1700;
			text = "Radio SFP Telecom (XX Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "[] execVM 'menu\hotel.sqf';"; 
			style = ST_CENTER;

			idc = 1702;
			text = "Dodo Au HQ (0 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.14471 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'menu\restaurantcafe.sqf';"; 
			style = ST_CENTER;

			idc = 1703;
			text = "Boire Un Cafe (21 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1705: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\equiper_casque_sarl_depannage.sqf';"; 
			style = ST_CENTER;

			idc = 1705;
			text = "Casque De Pilote (5 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1710: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_chemlight_sarl_DIR.sqf';"; 
			style = ST_CENTER;

			idc = 1710;
			text = "Achat De Chemlight (7 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.250037 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1711: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'menu\restauranteau.sqf';"; 
			style = ST_CENTER;

			idc = 1711;
			text = "Boire Une Boisson (14 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1713: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'menu\restaurantnourriture.sqf';"; 
			style = ST_CENTER;

			idc = 1713;
			text = "Prendre Un Repas (35 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1714: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'menu\restaurantcafe.sqf';"; 
			style = ST_CENTER;

			idc = 1714;
			text = "Boire Un Cafe (21 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.284185 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1715: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\acheter_repair_kit_sarl_depannage.sqf';"; 
			style = ST_CENTER;

			idc = 1715;
			text = "Acheter Repair Kit (20 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.28357 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1716: RscShortcutButton
		{
				 onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\acheter_tenue_protection_sarl_depannage.sqf';"; 
			style = ST_CENTER;

			idc = 1716;
			text = "Achat Tenue Protection (25 Euros)"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.320005 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1717: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\nos_entreprises\sarl_depannage\achat_d_une_depanneuse_plateau_fonctionnel_sarl_depannage.sqf';";
			style = ST_CENTER;

			idc = 1717;
			text = "Camion Plateau  Fonctionnel (1 500 Euros)"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.612365 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Choix_Couper_Fil_C4
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Choix_Couper_Fil_C4',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Choix_Couper_Fil_C4', nil]";
	
	class Controls
	{
		class CouleurFond_UN: RscText
		{
			idc = 1000;
			x = 0.409375 * safezoneW + safezoneX;
			y = 0.415 * safezoneH + safezoneY;
			w = 0.184375 * safezoneW;
			h = 0.12 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Menu C4 ..."; //--- ToDo: Localize;
			x = 0.411458 * safezoneW + safezoneX;
			y = 0.390926 * safezoneH + safezoneY;
			w = 0.18125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.534375 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.41875 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class Menu_Un: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\couper_les_fils_sacoche_c4.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Couper Fil Rouge ..."; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Menu_Deux: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\couper_les_fils_sacoche_c4.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Couper Fil Noir ..."; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.495 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\couper_les_fils_sacoche_c4.sqf';";
			style = ST_CENTER;

			idc = 1703;
			text = "Couper Fil Bleu ..."; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.426185 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Menu_Amende_Sur_Un_Vehicule
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Amende_Sur_Un_Vehicule',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Amende_Sur_Un_Vehicule', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.2204 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.20714 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class RscText_1004: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Soyez conciliant avec les amendes."; //--- ToDo: Localize;
			x = 0.252248 * safezoneW + safezoneX;
			y = 0.231021 * safezoneH + safezoneY;
			w = 0.504938 * safezoneW;
			h = 0.0417849 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = " Fermer"; //--- ToDo: Localize;
			x = 0.686544 * safezoneW + safezoneX;
			y = 0.434002 * safezoneH + safezoneY;
			w = 0.0702086 * safezoneW;
			h = 0.0345944 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.23926 * safezoneW + safezoneX;
			y = 0.418606 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0427792 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.246477 * safezoneW + safezoneX;
			y = 0.438417 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0405784 * safezoneH;
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "AMENDE SUR UN VEHICULE"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.190606 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper le montant que vous souhaitez ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.291278 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\gendarmerie\amendes _sur_un_vehicule\valider_amende_sur_le_vehicule.sqf';";
			style = ST_CENTER;

			idc = 1703;
			text = "Valider montant amende"; //--- ToDo: Localize;
			x = 0.391799 * safezoneW + safezoneX;
			y = 0.370249 * safezoneH + safezoneY;
			w = 0.2225 * safezoneW;
			h = 0.033996 * safezoneH;
		};
	};
};
class Menu_Amende_A_Accepter_Sur_Un_Vehicule
{
	idd = 200000;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Amende_A_Accepter_Sur_Un_Vehicule',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Amende_A_Accepter_Sur_Un_Vehicule', nil]";
	
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
		class message_explication: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;

			idc = 1005;
			text = "Message explication amende"; //--- ToDo: Localize;
			x = 0.24375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.509375 * safezoneW;
			h = 0.325 * safezoneH;
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
			style = ST_CENTER;

			idc = 1004;
			text = "AMENDE SUR VOTRE VEHICULE"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class boutton_un: RscShortcutButton
		{
			onButtonClick = "[0] execVM 'divers\gendarmerie\amendes _sur_un_vehicule\accepter_ou_refuser_payer_amende_sur_le_vehicule.sqf';";

			idc = 1700;
			text = "Accepter Amende"; //--- ToDo: Localize;
			x = 0.55625 * safezoneW + safezoneX;
			y = 0.575 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class boutton_deux: RscShortcutButton
		{
			onButtonClick = "[1] execVM 'divers\gendarmerie\amendes _sur_un_vehicule\accepter_ou_refuser_payer_amende_sur_le_vehicule.sqf';";

			idc = 1701;
			text = "Refuser Amende"; //--- ToDo: Localize;
			x = 0.658302 * safezoneW + safezoneX;
			y = 0.575 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Choix_Menu_Inventaire
{
	idd = 147852;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Choix_Menu_Inventaire',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Choix_Menu_Inventaire', nil]";
	
	class Controls
	{
		class CouleurFond_UN: RscText
		{
			idc = 1000;
			x = 0.409375 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.184375 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre_choix: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Menu inventaire ..."; //--- ToDo: Localize;
			x = 0.411458 * safezoneW + safezoneX;
			y = 0.420926 * safezoneH + safezoneY;
			w = 0.18125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.534375 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.41875 * safezoneW + safezoneX;
			y = 0.545 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class Menu_Un: RscShortcutButton
		{
			onButtonClick = "[0,0,0,['1']] execVM 'divers\inventory.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Inventaire Plus Poussé"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Menu_Deux: RscShortcutButton
		{
			onButtonClick = "[0,0,0,['2']] execVM 'divers\inventory.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Inventaire Classique"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.495 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Tchat_Pirate_By_Maxou
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Tchat_Pirate_By_Maxou',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Tchat_Pirate_By_Maxou', nil]";
	
	class Controls
	{

		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.078125 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.84375 * safezoneW;
			h = 0.63 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class combo_list: RscListbox
		{
			idc = 11173;
			onLBDblClick = "[_this] execVM ""divers\telephone_by_sfp_maxou\envoyer_un_joueur.sqf"";";

			text = "combo"; //--- ToDo: Localize;
			x = 0.09375 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.8125 * safezoneW;
			h = 0.485 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.825 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.08125 * safezoneW + safezoneX;
			y = 0.755 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1006: RscText
		{
			style = ST_CENTER;
			idc = 11172;

			text = "!!! SFP TELECOM By SFP Maxou !!! --- www.sfpteam.fr ---"; //--- ToDo: Localize;
			x = 0.08125 * safezoneW + safezoneX;
			y = 0.095 * safezoneH + safezoneY;
			w = 0.840625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1001: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "Votre message :"; //--- ToDo: Localize;
			x = 0.104375 * safezoneW + safezoneX;
			y = 0.685556 * safezoneH + safezoneY;
			w = 0.128125 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,0.8};
			tooltip = "Double cliquez sur un joueur pour lui envoyer directement !"; //--- ToDo: Localize;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 11175;

			text = "Pas d'insultes, ni de spam !"; //--- ToDo: Localize;
			x = 0.24 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.640625 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\pirater_antenne_telecom\envoyer_message_pirate_antenne_telecom.sqf';";
			style = ST_CENTER;
			idc = 11177;

			text = "Envoyer au peuple de Altis"; //--- ToDo: Localize;
			x = 0.703125 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.11875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			x = 1.1875 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.265625 * safezoneW;
			h = 0.125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Mon numero de telephone :"; //--- ToDo: Localize;
			x = 0.37789 * safezoneW + safezoneX;
			y = 0.14116 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Edit_numero_de_tel: RscText
		{
			idc = 1009;
			text = "Inconnu antenne piratÃ©"; //--- ToDo: Localize;
			x = 0.493515 * safezoneW + safezoneX;
			y = 0.14116 * safezoneH + safezoneY;
			w = 0.365625 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};
class choix_montant_transformation_serpent
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['choix_montant_transformation_serpent',_this select 0]";
	onUnLoad="uiNamespace setVariable ['choix_montant_transformation_serpent', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.356738 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.176506 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.690235 * safezoneW + safezoneX;
			y = 0.543453 * safezoneH + safezoneY;
			w = 0.069151 * safezoneW;
			h = 0.0302072 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.240317 * safezoneW + safezoneX;
			y = 0.53104 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0318248 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.247911 * safezoneW + safezoneX;
			y = 0.552641 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0252272 * safezoneH;
		};
		class class_titre: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "Taper le montant souhaité à transformer"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.324733 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper le montant que vous souhaitez transformer ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.388034 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.0895856 * safezoneH;
		};
		class class_valider: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\farming\transformation\serpent_en_venin\action_transformer_serpent_en_venin.sqf';";

			idc = 1700;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.616551 * safezoneW + safezoneX;
			y = 0.541794 * safezoneH + safezoneY;
			w = 0.069151 * safezoneW;
			h = 0.0302072 * safezoneH;
		};
	};
};
class Menu_wanted_liste
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_wanted_liste',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_wanted_liste', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.21875 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.46 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.221875 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.23125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class class_fermer: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1703;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.747412 * safezoneW + safezoneX;
			y = 0.716434 * safezoneH + safezoneY;
			w = 0.059375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class class_combo_liste_de_l_objet: RscListbox
		{
			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 7.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.6 * GUI_GRID_W;
			h = 7.9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.07};
		};
		class class_espace_total_joueur: RscText
		{
			style = ST_RIGHT;

			idc = 1008;
			text = "16 infractions actuellement"; //--- ToDo: Localize;
			x = 0.703427 * safezoneW + safezoneX;
			y = 0.221129 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class class_titre_joueur: RscText
		{
			idc = 1009;
			text = "Casier Judiciaire de : Inconnu."; //--- ToDo: Localize;
			x = 0.21875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.334375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\gendarmerie\wanted_liste\supprimer_infraction_wanted_liste.sqf';"; 

			idc = 1700;
			text = "Supprimer une infraction"; //--- ToDo: Localize;
			x = 0.456787 * safezoneW + safezoneX;
			y = 0.716434 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Utiliser_Objet: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\gendarmerie\wanted_liste\ajouter_une infraction.sqf';"; 

			idc = 1701;
			text = "Ajouter une infraction"; //--- ToDo: Localize;
			x = 0.600537 * safezoneW + safezoneX;
			y = 0.716434 * safezoneH + safezoneY;
			w = 0.14375 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Menu_Choix_texte_wanted_liste
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Choix_texte_wanted_liste',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Choix_texte_wanted_liste', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.356738 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.176506 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.690235 * safezoneW + safezoneX;
			y = 0.543453 * safezoneH + safezoneY;
			w = 0.069151 * safezoneW;
			h = 0.0302072 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.240317 * safezoneW + safezoneX;
			y = 0.53104 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0318248 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.247911 * safezoneW + safezoneX;
			y = 0.552641 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0252272 * safezoneH;
		};
		class class_titre: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "Taper le motif de la wanted liste"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.324733 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper votre texte ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.388034 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.0895856 * safezoneH;
		};
		class class_valider: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\gendarmerie\wanted_liste\texte_tableau_validation_wanted_liste.sqf';";

			idc = 1700;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.616551 * safezoneW + safezoneX;
			y = 0.541794 * safezoneH + safezoneY;
			w = 0.069151 * safezoneW;
			h = 0.0302072 * safezoneH;
		};
	};
};
class Menu_Habits
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Habits',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Habits', nil]";
	
	class Controls
	{
		class sfpteam_maxou: RscText
		{
			idc = 1002;

			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.894966 * safezoneW + safezoneX;
			y = 0.924548 * safezoneH + safezoneY;
			w = 0.0835608 * safezoneW;
			h = 0.0247557 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;

			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.902183 * safezoneW + safezoneX;
			y = 0.944348 * safezoneH + safezoneY;
			w = 0.0660295 * safezoneW;
			h = 0.0247557 * safezoneH;
		};
		class combo_list: RscListBox
		{
			idc = 1500;
			onLBDblClick = "[_this] execVM ""divers\achats_divers_et_vehicules\vetements\acheter_vetement.sqf"";"; 

			text = "combo"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.13701 * safezoneH + safezoneY;
			w = 0.272717 * safezoneW;
			h = 0.57283 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class boutton_fermer: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = 2;
			idc = 1701;

			text = "Fermer"; //--- ToDo: Localize;
			x = 0.881615 * safezoneW + safezoneX;
			y = 0.891522 * safezoneH + safezoneY;
			w = 0.0680795 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class Boutton_menu_Vetement: RscShortcutButton
		{
			onButtonClick = "['0'] execVM 'divers\achats_divers_et_vehicules\vetements\habits_choix_a_afficher_menu.sqf';"; 

			idc = 1700;
			text = "Boutique Vetements"; //--- ToDo: Localize;
			x = 0.746455 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.205218 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class bouton_boutique_lunettes: RscShortcutButton
		{
			onButtonClick = "['1'] execVM 'divers\achats_divers_et_vehicules\vetements\habits_choix_a_afficher_menu.sqf';"; 

			idc = 1702;
			text = "Boutique Lunettes"; //--- ToDo: Localize;
			x = 0.746455 * safezoneW + safezoneX;
			y = 0.752985 * safezoneH + safezoneY;
			w = 0.205218 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class Boutton_boutique_casque: RscShortcutButton
		{
			onButtonClick = "['2'] execVM 'divers\achats_divers_et_vehicules\vetements\habits_choix_a_afficher_menu.sqf';"; 

			idc = 1704;
			text = "Boutique Casques"; //--- ToDo: Localize;
			x = 0.746455 * safezoneW + safezoneX;
			y = 0.78597 * safezoneH + safezoneY;
			w = 0.205218 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class argent_en_couleur: RscText
		{
			idc = 1005;

			text = "0"; //--- ToDo: Localize;
			x = 0.780478 * safezoneW + safezoneX;
			y = 0.1062 * safezoneH + safezoneY;
			w = 0.13928 * safezoneW;
			h = 0.0274201 * safezoneH;
		};
		class texte_argent_disponible: RscText
		{
			idc = 1004;

			text = "Argent Disponible :"; //--- ToDo: Localize;
			x = 0.701077 * safezoneW + safezoneX;
			y = 0.1062 * safezoneH + safezoneY;
			w = 0.0846295 * safezoneW;
			h = 0.0274201 * safezoneH;
		};
		class boutton_classe_vestes: RscShortcutButton
		{
			onButtonClick = "['3'] execVM 'divers\achats_divers_et_vehicules\vetements\habits_choix_a_afficher_menu.sqf';"; 

			idc = 1701;
			text = "Boutique Vestes"; //--- ToDo: Localize;
			x = 0.746791 * safezoneW + safezoneX;
			y = 0.818742 * safezoneH + safezoneY;
			w = 0.205218 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class boutton_sac_a_dos: RscShortcutButton
		{
			onButtonClick = "['4'] execVM 'divers\achats_divers_et_vehicules\vetements\habits_choix_a_afficher_menu.sqf';"; 

			idc = 1705;
			text = "Boutique Sacs A Dos"; //--- ToDo: Localize;
			x = 0.746183 * safezoneW + safezoneX;
			y = 0.851655 * safezoneH + safezoneY;
			w = 0.205218 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class boutton_annuler_changement: RscShortcutButton
		{
			onButtonClick = "annuler_boutique_habit = true; closedialog 0;";

			idc = 1706;
			text = "Annuler"; //--- ToDo: Localize;
			x = 0.8146 * safezoneW + safezoneX;
			y = 0.891459 * safezoneH + safezoneY;
			w = 0.0639535 * safezoneW;
			h = 0.0286 * safezoneH;
		};
	};
};
class Menu_liste_choix_respawn
{
	idd = 7896;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_liste_choix_respawn',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_liste_choix_respawn', nil]";
	
	class Controls
	{
		class RscListbox_1500: RscListbox
		{
			onLBSelChanged = "[_this] execVM ""divers\choix_respawn\choix_respawn_maj_de_la_position.sqf"";"; 
			onLBDblClick = "[_this] execVM ""divers\choix_respawn\choix_respawn_position_selectionne.sqf"";";	

			idc = 1500;
			x = 0.327928 * safezoneW + safezoneX;
			y = 0.0314184 * safezoneH + safezoneY;
			w = 0.344419 * safezoneW;
			h = 0.089634 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};
};
class Menu_liste_choix_destination_ferry_sfp
{
	idd = 7896;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_liste_choix_destination_ferry_sfp',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_liste_choix_destination_ferry_sfp', nil]";
	
	class Controls
	{
		class RscListbox_1500: RscListbox
		{
			onLBSelChanged = "[_this] execVM ""divers\ferry_sfp\choix_ferry_sfp_maj_de_la_position.sqf"";"; 
			onLBDblClick = "[_this] execVM ""divers\ferry_sfp\choix_ferry_sfp_position_selectionne.sqf"";";	

			idc = 1500;
			x = 0.327928 * safezoneW + safezoneX;
			y = 0.0314184 * safezoneH + safezoneY;
			w = 0.344419 * safezoneW;
			h = 0.089634 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};
};
class Menu_Choisir_Phase_RP
{
	idd = 7896;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Choisir_Phase_RP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Choisir_Phase_RP', nil]";
	
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
			y = 0.565 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.241146 * safezoneW + safezoneX;
			y = 0.580186 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
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
			h = 0.275 * safezoneH;
		};
		class classe_boutton_choisir: RscShortcutButton
		{
			onButtonClick = "debarquement_choisit_sfp = 1; closedialog 0;";

			idc = 1700;
			text = "Debarquer en bateau"; //--- ToDo: Localize;
			x = 0.358122 * safezoneW + safezoneX;
			y = 0.521978 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1701: RscShortcutButton
		{
			onButtonClick = "debarquement_choisit_sfp = 2; closedialog 0;";

			idc = 1701;
			text = "Debarquer en parachute"; //--- ToDo: Localize;
			x = 0.504997 * safezoneW + safezoneX;
			y = 0.521978 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};

class Menu_SIV_Vehicules_Gendarmerie
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_SIV_Vehicules_Gendarmerie',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_SIV_Vehicules_Gendarmerie', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;

			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.1249 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.6512 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class pannel_titre: RscText
		{
			style = 2;
			idc = 1004;

			text = "... Système d'Immatriculation des Véhicules ..."; //--- ToDo: Localize;
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class combo_list: RscListBox
		{
			idc = 1500;

			text = "combo"; //--- ToDo: Localize;
			x = 0.0761561 * safezoneW + safezoneX;
			y = 0.1656 * safezoneH + safezoneY;
			w = 0.738384 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {0,0,0,0.07};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1700;
			text = "FERMER"; //--- ToDo: Localize;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0785627 * safezoneW;
			h = 0.0301987 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;

			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.7376 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;

			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.0699689 * safezoneW + safezoneX;
			y = 0.7552 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;

			text = "Liste des véhicules sur l'ile."; //--- ToDo: Localize;
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
	};
};

class Menu_Effets_Des_Drogues
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Effets_Des_Drogues',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Effets_Des_Drogues', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;

			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.1249 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.527944 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class pannel_titre: RscText
		{
			style = 2;
			idc = 1004;

			text = "... Effet Des Drogues ..."; //--- ToDo: Localize;
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1700;
			text = "FERMER"; //--- ToDo: Localize;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.664945 * safezoneH + safezoneY;
			w = 0.0785627 * safezoneW;
			h = 0.0301987 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;

			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.647359 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0383803 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;

			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.0699689 * safezoneW + safezoneX;
			y = 0.669361 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0339789 * safezoneH;
		};
		class RscText_1002: RscText
		{
			type = CT_STRUCTURED_TEXT;
			size = 0.040;

			idc = 1122;
			text = "Message explication des drogues"; //--- ToDo: Localize;
			x = 0.10288 * safezoneW + safezoneX;
			y = 0.158885 * safezoneH + safezoneY;
			w = 0.680777 * safezoneW;
			h = 0.20907 * safezoneH;
		};
		class image_cocaine : RscShortcutImage
		{
			idc = 1600;
			x = 0.166828 * safezoneW + safezoneX;
			y = 0.39657 * safezoneH + safezoneY;
			w = 0.134092 * safezoneW;
			h = 0.187063 * safezoneH;
		};
		class image_cannabis : RscShortcutImage
		{
			idc = 1601;
			x = 0.451521 * safezoneW + safezoneX;
			y = 0.39657 * safezoneH + safezoneY;
			w = 0.134092 * safezoneW;
			h = 0.187063 * safezoneH;
		};
		class image_heroine : RscShortcutImage
		{
			idc = 1602;
			x = 0.309174 * safezoneW + safezoneX;
			y = 0.39657 * safezoneH + safezoneY;
			w = 0.134092 * safezoneW;
			h = 0.187063 * safezoneH;
		};
		class image_medicaments : RscShortcutImage
		{
			idc = 1603;
			x = 0.593865 * safezoneW + safezoneX;
			y = 0.396565 * safezoneH + safezoneY;
			w = 0.134092 * safezoneW;
			h = 0.187063 * safezoneH;
		};
	};
};
class Dialogue_Demande_Activation_Loi_Martial
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Dialogue_Demande_Activation_Loi_Martial',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Dialogue_Demande_Activation_Loi_Martial', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.356738 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.176506 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.690235 * safezoneW + safezoneX;
			y = 0.541252 * safezoneH + safezoneY;
			w = 0.069151 * safezoneW;
			h = 0.0302072 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.240317 * safezoneW + safezoneX;
			y = 0.53104 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0318248 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.247911 * safezoneW + safezoneX;
			y = 0.552641 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0252272 * safezoneH;
		};
		class class_titre: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "Choisir le temps en minutes de la loi martial (grade gendarmerie seulement)"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.324733 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper votre temps ...."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.388034 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.0895856 * safezoneH;
		};
		class class_valider: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\gendarmerie\Loi_Martiale\loi_martiale_validation_du_temps.sqf';";

			idc = 1700;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.616551 * safezoneW + safezoneX;
			y = 0.541794 * safezoneH + safezoneY;
			w = 0.069151 * safezoneW;
			h = 0.0302072 * safezoneH;
		};
	};
};
class Menu_Suppression_Gendarmes
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Suppression_Gendarmes',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Suppression_Gendarmes', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.078125 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.84375 * safezoneW;
			h = 0.63 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class combo_list: RscListbox
		{
			idc = 11173;
			onLBDblClick = "[_this] execVM ""divers\gendarmerie\supprimer_chose_inventaire\action_supprimer_chose_inventaire.sqf"";";

			text = "combo"; //--- ToDo: Localize;
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.821875 * safezoneW;
			h = 0.525 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.825 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.08125 * safezoneW + safezoneX;
			y = 0.755 * safezoneH + safezoneY;
			w = 0.078125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1006: RscText
		{
			style = ST_CENTER;
			idc = 11172;

			text = "!!! MENU SUPPRESSION GENDARME By SFP Maxou !!! --- www.sfpteam.fr ---"; //--- ToDo: Localize;
			x = 0.08125 * safezoneW + safezoneX;
			y = 0.095 * safezoneH + safezoneY;
			w = 0.840625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			x = 1.1875 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.265625 * safezoneW;
			h = 0.125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Nom pour la suppression :"; //--- ToDo: Localize;
			x = 0.37789 * safezoneW + safezoneX;
			y = 0.14116 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Edit_numero_de_tel: RscText
		{
			idc = 1009;
			text = "Homme ou vehicule exemple"; //--- ToDo: Localize;
			x = 0.493515 * safezoneW + safezoneX;
			y = 0.14116 * safezoneH + safezoneY;
			w = 0.365625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Double clique sur une ligne pour choisir."; //--- ToDo: Localize;
			x = 0.090625 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.815625 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};
class Dialogue_Menu_Config_Du_Serveur
{
	idd = -1;
	movingenable = true;
	onLoad="uiNamespace setVariable ['Dialogue_Menu_Config_Du_Serveur',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Dialogue_Menu_Config_Du_Serveur', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.140625 * safezoneW + safezoneX;
			y = 0.075 * safezoneH + safezoneY;
			w = 0.734375 * safezoneW;
			h = 0.815 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.796875 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.14375 * safezoneW + safezoneX;
			y = 0.89 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.153125 * safezoneW + safezoneX;
			y = 0.905 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Texte_titre: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Configuration du serveur actuel"; //--- ToDo: Localize;
			x = 0.143125 * safezoneW + safezoneX;
			y = 0.034444 * safezoneH + safezoneY;
			w = 0.728125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 4.8 * GUI_GRID_W + GUI_GRID_X;
			y = 1.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 22.9 * GUI_GRID_W;
			h = 15.7 * GUI_GRID_H;
		};
	};
};
