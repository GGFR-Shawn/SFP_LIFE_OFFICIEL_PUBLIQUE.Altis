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

class Menu_voitures
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_voitures',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_voitures', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\voitures\previsualisation_voitures.sqf';";

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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\voitures\Carbuy.sqf';";

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
class Menu_voitures_gang
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_voitures_gang',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_voitures_gang', nil]";
	
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
			onButtonClick = "execVM 'divers\licence_gang_et_territoire_gang\licence_gang\vehicules\previsualisation_voitures.sqf';";

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
			onButtonClick = "execVM 'divers\licence_gang_et_territoire_gang\licence_gang\vehicules\carbuy.sqf';";

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
class Menu_voitures_Altis_And_Furious
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_voitures_Altis_And_Furious',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_voitures_Altis_And_Furious', nil]";
	
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
			onButtonClick = "hint 'Aucune previsualisation ici.'";

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
			onButtonClick = "execVM 'divers\nos_entreprises\sarl_altis_et_furious\achat_vehicules_sarl_altis_et_furious.sqf';";

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
class Menu_helicoptere
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_helicoptere',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_helicoptere', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\helicopteres\previsualisation_helicoptere.sqf';";

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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\helicopteres\helibuy.sqf';";

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
class Menu_helicoptere_gang
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_helicoptere_gang',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_helicoptere_gang', nil]";
	
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
			onButtonClick = "execVM 'divers\licence_gang_et_territoire_gang\licence_gang\helicopteres\previsualisation_helicoptere_gang.sqf';";

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
			onButtonClick = "execVM 'divers\licence_gang_et_territoire_gang\licence_gang\helicopteres\helibuy.sqf';";

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
class Menu_bateaux
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_bateaux',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_bateaux', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\bateaux\previsualisation_bateaux.sqf';";

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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\bateaux\boatbuy.sqf';";

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
class Menu_avions
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_avions',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_avions', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\avions\previsualisation_avions.sqf';";

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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\avions\avionsbuy.sqf';";

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
class Menu_Karting
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Karting',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Karting', nil]";
	
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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\karting\previsualisation_karting.sqf';";

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
			onButtonClick = "execVM 'divers\achats_divers_et_vehicules\karting\karting_buy.sqf';";

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
class Menu_Voitures_Tuning
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Voitures_Tuning',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Voitures_Tuning', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
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
		class combo_list_tuning: RscListbox
		{
			onLBDblClick = "if ((_this select 1) == 0) then {[] call creation_neon_vehicule_by_maxou;}; if ((_this select 1) == 1) then {[] call achat_radar_de_recul_vehicule_by_maxou;}; if ((_this select 1) == 2) then {[] execvm 'divers\repeindre_voiture\tuning\menu_repeindre_la_voiture.sqf';}; if ((_this select 1) == 3) then {[] execvm 'divers\repeindre_voiture\tuning\menu_changer_klaxon.sqf';}; if ((_this select 1) == 4) then {[] call achat_detecteur_de_radar_by_maxou;}; if ((_this select 1) == 5) then {[] execvm 'divers\repeindre_voiture\tuning\menu_changer_poid_du_vehicule.sqf';};"; 

			idc = 1500;
			text = "combo_tuning"; //--- ToDo: Localize;
			x = 7.9 * GUI_GRID_W + GUI_GRID_X;
			y = 5.33 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 3.7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.648307 * safezoneW + safezoneX;
			y = 0.740839 * safezoneH + safezoneY;
			w = 0.115625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.24375 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscSlider_1900: RscSlider
		{
			onSliderPosChanged = "[1, _this] call changement_couleur_neon_vehicule;"; 

			idc = 1900;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.215625 * safezoneW;
			h = 0.025 * safezoneH;
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
		class choix_menu_un: RscText
		{
			idc = 1005;
			text = "Option tunning :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.30625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscSlider_1901: RscSlider
		{
			onSliderPosChanged = "[2, _this] call changement_couleur_neon_vehicule;"; 

			idc = 1901;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.515556 * safezoneH + safezoneY;
			w = 0.215625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscSlider_1902: RscSlider
		{
			onSliderPosChanged = "[3, _this] call changement_couleur_neon_vehicule;"; 

			idc = 1902;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.565 * safezoneH + safezoneY;
			w = 0.215625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "Couleur R :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.6 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "Couleur G :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.505 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.6 * GUI_GRID_H;
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Couleur B :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.554444 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.6 * GUI_GRID_H;
		};
		class RscText_1009: RscText
		{
			idc = 1009;
			text = "Option moteur :"; //--- ToDo: Localize;
			x = 0.57375 * safezoneW + safezoneX;
			y = 0.220556 * safezoneH + safezoneY;
			w = 0.178125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class combo_moteur: RscListbox
		{
			onLBDblClick = "[_this] call puce_moteur_vehicule;"; 

			idc = 1501;
			text = "combo_moteur"; //--- ToDo: Localize;
			x = 18.28 * GUI_GRID_W + GUI_GRID_X;
			y = 5.33 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.9 * GUI_GRID_W;
			h = 3.7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1010: RscText
		{
			idc = 1010;
			text = "Double cliquer pour valider ..."; //--- ToDo: Localize;
			x = 0.53625 * safezoneW + safezoneX;
			y = 0.613333 * safezoneH + safezoneY;
			w = 0.221875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			onButtonClick = "[2] call supprimer_options_vehicule;";

			idc = 1700;
			text = "Supprimer Klaxon"; //--- ToDo: Localize;
			x = 0.6475 * safezoneW + safezoneX;
			y = 0.668889 * safezoneH + safezoneY;
			w = 0.115625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "[1] call supprimer_options_vehicule;";

			idc = 1702;
			text = "Supprimer Puce"; //--- ToDo: Localize;
			x = 0.52875 * safezoneW + safezoneX;
			y = 0.668889 * safezoneH + safezoneY;
			w = 0.115625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "[0] call supprimer_options_vehicule;";

			idc = 1703;
			text = "Supprime Neon"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.668889 * safezoneH + safezoneY;
			w = 0.115625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			onButtonClick = "[4] call supprimer_options_vehicule;";

			idc = 1704;
			text = "Supprimer Radar Recul"; //--- ToDo: Localize;
			x = 0.648307 * safezoneW + safezoneX;
			y = 0.700839 * safezoneH + safezoneY;
			w = 0.115625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscShortcutButton_1705: RscShortcutButton
		{
			onButtonClick = "[3] call supprimer_options_vehicule;";

			idc = 1705;
			text = "Supprimer Detecteur"; //--- ToDo: Localize;
			x = 0.529557 * safezoneW + safezoneX;
			y = 0.700839 * safezoneH + safezoneY;
			w = 0.115625 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Menu_Voitures_Tuning_Klaxon
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Voitures_Tuning_Klaxon',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Voitures_Tuning_Klaxon', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Titre_modifiable: RscText
		{
			idc = 1004;
			style = ST_CENTER;
			text = "Titre a modifier"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class combo_list_tuning: RscListbox
		{
			onLBDblClick = "[_this] call previsualiser_son_klaxon_sfp;";
			
			idc = 1500;
			text = "combo_tuning"; //--- ToDo: Localize;
			x = 7.9 * GUI_GRID_W + GUI_GRID_X;
			y = 5.33 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.3 * GUI_GRID_W;
			h = 6.8 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "    Fermer"; //--- ToDo: Localize;
			x = 0.5975 * safezoneW + safezoneX;
			y = 0.673889 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
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
		class choix_menu_un: RscText
		{
			idc = 1005;
			text = "Option Klaxon :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.503125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1010;
			text = "Double cliquer pour ecouter ..."; //--- ToDo: Localize;
			x = 0.53625 * safezoneW + safezoneX;
			y = 0.613333 * safezoneH + safezoneY;
			w = 0.221875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "Vous possedez actuellement le :"; //--- ToDo: Localize;
			x = 0.4375 * safezoneW + safezoneX;
			y = 0.757778 * safezoneH + safezoneY;
			w = 0.421875 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			onButtonClick = "[] call creation_klaxon_vehicule_by_maxou;";

			idc = 1700;
			text = "    Acheter"; //--- ToDo: Localize;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.673889 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.05 * safezoneH;
		};
	};
};
class Menu_Repeindre_La_Voiture
{
	idd = -1;
	movingenable = true;
	onLoad="uiNamespace setVariable ['Menu_Repeindre_La_Voiture',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Repeindre_La_Voiture', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.53125 * safezoneW;
			h = 0.305 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Titre_modifiable: RscText
		{
			idc = 1004;
			text = "Titre a modifier"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "    Fermer"; //--- ToDo: Localize;
			x = 0.60625 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscSlider_1900: RscSlider
		{
			onSliderPosChanged = "[1, _this] execVM 'divers\repeindre_voiture\tuning\action_repeindre_la_voiture.sqf';";

			idc = 1900;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.025 * safezoneH;
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
		class RscSlider_1901: RscSlider
		{
			onSliderPosChanged = "[2, _this] execVM 'divers\repeindre_voiture\tuning\action_repeindre_la_voiture.sqf';";

			idc = 1901;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.415556 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscSlider_1902: RscSlider
		{
			onSliderPosChanged = "[3, _this] execVM 'divers\repeindre_voiture\tuning\action_repeindre_la_voiture.sqf';";

			idc = 1902;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "Couleur R :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "Couleur G :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.405 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Couleur B :"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.439444 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscText_1009: RscText
		{
			idc = 1009;
			text = "Faite glisser les curseurs ci dessous pour choisir une couleur."; //--- ToDo: Localize;
			x = 0.240625 * safezoneW + safezoneX;
			y = 0.31 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = "Luminosité"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.475 * safezoneH + safezoneY;
			w = 0.071875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class RscSlider_1903: RscSlider
		{
			onSliderPosChanged = "[4, _this] execVM 'divers\repeindre_voiture\tuning\action_repeindre_la_voiture.sqf';";

			idc = 1903;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.485 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1010;
			text = ":"; //--- ToDo: Localize;
			x = 0.319375 * safezoneW + safezoneX;
			y = 0.474445 * safezoneH + safezoneY;
			w = 0.071875 * safezoneW;
			h = 0.035 * safezoneH;
			sizeEx = 0.5 * GUI_GRID_H;
		};
	};
};
class Menu_Peinture_Carrossier
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Peinture_Carrossier',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Peinture_Carrossier', nil]";
	
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
			onLBDblClick = "[_this] execvm ""divers\repeindre_voiture\carrossier\action_repeindre_carrosserie_carrossier.sqf"";";

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
			text = "Choix de la peinture :"; //--- ToDo: Localize;
			x = 0.250025 * safezoneW + safezoneX;
			y = 0.21994 * safezoneH + safezoneY;
			w = 0.30625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1012;
			text = "Double cliquer pour visualiser ..."; //--- ToDo: Localize;
			x = 0.573416 * safezoneW + safezoneX;
			y = 0.6133 * safezoneH + safezoneY;
			w = 0.186821 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class Boutton_Valider_Peinture: RscShortcutButton
		{
			onButtonClick = "closedialog 0; valider_peinture_carrossier = true;";

			idc = 1701;
			text = "Valider Peinture"; //--- ToDo: Localize;
			x = 0.550883 * safezoneW + safezoneX;
			y = 0.674185 * safezoneH + safezoneY;
			w = 0.094313 * safezoneW;
			h = 0.0324001 * safezoneH;
		};
		class Boutton_reparer_carrosserie: RscShortcutButton
		{
			onButtonClick = "execvm 'divers\repeindre_voiture\carrossier\action_reparer_carrosserie_carrossier.sqf';";

			idc = 1702;
			text = "Reparer carrosserie : 10000 euros."; //--- ToDo: Localize;
			x = 0.567005 * safezoneW + safezoneX;
			y = 0.7112 * safezoneH + safezoneY;
			w = 0.165454 * safezoneW;
			h = 0.0324001 * safezoneH;
		};
	};
};
class Menu_Voitures_Tuning_Poid_Du_Vehicule
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Voitures_Tuning_Poid_Du_Vehicule',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Voitures_Tuning_Poid_Du_Vehicule', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.26875 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.496875 * safezoneW;
			h = 0.43 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class Titre_modifiable: RscText
		{
			idc = 1001;
			text = "Titre a modifier"; //--- ToDo: Localize;
			x = 0.271354 * safezoneW + safezoneX;
			y = 0.173518 * safezoneH + safezoneY;
			w = 0.492188 * safezoneW;
			h = 0.0277778 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1700;
			text = "    Fermer"; //--- ToDo: Localize;
			x = 0.669375 * safezoneW + safezoneX;
			y = 0.653889 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1003;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.278125 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1004;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscText_1001: RscText
		{
			style = 2;
			idc = 1001;

			text = "Titre a modifier"; //--- ToDo: Localize;
			x = 7.9 * safezoneW + safezoneX;
			y = 0.281667 * safezoneH + safezoneY;
			w = 0.30625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscSlider_1900: RscSlider
		{
			onSliderPosChanged = "[1, _this] call visualiser_changement_poid_du_vehicule;";

			idc = 1900;
			x = 0.350521 * safezoneW + safezoneX;
			y = 0.564815 * safezoneH + safezoneY;
			w = 0.396875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1006: RscText
		{
			idc = 1007;
			text = "Gestion poids :"; //--- ToDo: Localize;
			x = 0.279688 * safezoneW + safezoneX;
			y = 0.552778 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class information_du_vehicule: RscText
		{
			idc = 1010;
			text = "Information du vehicule :"; //--- ToDo: Localize;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.178125 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class combo_information_du_vehicule: RscListBox
		{
			idc = 1011;
			text = "combo_information_du_vehicule"; //--- ToDo: Localize;
			x = 0.28125 * safezoneW + safezoneX;
			y = 0.275 * safezoneH + safezoneY;
			w = 0.46875 * safezoneW;
			h = 0.25 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1010: RscText
		{
			idc = 1012;
			text = "Regler le poids de votre vehicule pour de meilleures sensations ..."; //--- ToDo: Localize;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.598333 * safezoneH + safezoneY;
			w = 0.278125 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class boutton_appliquer: RscShortcutButton
		{
			onButtonClick = "if (player getvariable 'mon_argent_banque_by_sfp_maxou' < 0) exitwith {hint 'Operation impossible, vous n avez pas assez d argent !'} ; closedialog 0; [] call appliquer_changement_poid_du_vehicule; vehicule_tuning_j_ai_appliquer_la_valeur_sfp = true;";

			idc = 1701;
			text = "   Appliquer"; //--- ToDo: Localize;
			x = 0.576042 * safezoneW + safezoneX;
			y = 0.654074 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Fermer_Previsualisation_Du_Vehicule
{
	idd = 9874;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Fermer_Previsualisation_Du_Vehicule',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Fermer_Previsualisation_Du_Vehicule', nil]";
	
	class Controls
	{
		class Boutton_Fermer_Previsualisation: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1701;
			text = "Fermer La Previsualisation Du Vehicule"; //--- ToDo: Localize;
			x = 0.375625 * safezoneW + safezoneX;
			y = 0.958889 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
