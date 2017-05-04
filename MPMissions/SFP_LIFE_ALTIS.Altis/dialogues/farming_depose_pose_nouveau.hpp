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

class Nouveau_Menu_Inventaire_Farming
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Nouveau_Menu_Inventaire_Farming',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Nouveau_Menu_Inventaire_Farming', nil]";
	
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
			onLBDblClick = "[_this] execVM ""divers\inventaire_des_vehicules\nouveau_inventaire_farming\prendre_le_farming.sqf"";"; 

			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 16.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.6 * GUI_GRID_W;
			h = 7.9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.07};
		};
		class class_combo_liste_joueur: RscListbox
		{
			onLBDblClick = "[_this] execVM ""divers\inventaire_des_vehicules\nouveau_inventaire_farming\deposer_le_farming.sqf"";"; 

			idc = 1501;
			text = "combo"; //--- ToDo: Localize;
			x = 7.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.8 * GUI_GRID_W;
			h = 7.9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.07};
		};
		class class_espace_total_objet: RscText
		{
			style = ST_RIGHT;

			idc = 1001;
			text = "Espace restant : x/100"; //--- ToDo: Localize;
			x = 0.565927 * safezoneW + safezoneX;
			y = 0.201129 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class class_titre_objet: RscText
		{
			idc = 1004;
			text = "titre de l objet"; //--- ToDo: Localize;
			x = 0.21875 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.334375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			x = 0.504487 * safezoneW + safezoneX;
			y = 0.353104 * safezoneH + safezoneY;
			w = 0.003125 * safezoneW;
			h = 0.25 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class titre_votre_inventaire: RscText
		{
			style = ST_CENTER;

			idc = 1006;
			text = "... Votre Inventaire ..."; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.234375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class titre_inventaire_en_face: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "... Inventaire En Face ..."; //--- ToDo: Localize;
			x = 0.521985 * safezoneW + safezoneX;
			y = 0.669918 * safezoneH + safezoneY;
			w = 0.271875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class class_espace_total_joueur: RscText
		{
			style = ST_RIGHT;

			idc = 1008;
			text = "Espace restant : x/100"; //--- ToDo: Localize;
			x = 0.565927 * safezoneW + safezoneX;
			y = 0.221129 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class class_titre_joueur: RscText
		{
			idc = 1009;
			text = "titre de l objet"; //--- ToDo: Localize;
			x = 0.21875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.334375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\inventaire_des_vehicules\nouveau_inventaire_farming\jeter_le_farming.sqf';"; 

			idc = 1700;
			text = "Jeter Objet Colone Gauche"; //--- ToDo: Localize;
			x = 0.519287 * safezoneW + safezoneX;
			y = 0.716434 * safezoneH + safezoneY;
			w = 0.134375 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Utiliser_Objet: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\inventaire_des_vehicules\nouveau_inventaire_farming\utiliser_le_farming.sqf';"; 

			idc = 1701;
			text = "Utiliser Objet"; //--- ToDo: Localize;
			x = 0.659912 * safezoneW + safezoneX;
			y = 0.716434 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Nouveau_Menu_Vendre_Farming
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Nouveau_Menu_Vendre_Farming',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Nouveau_Menu_Vendre_Farming', nil]";
	
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
		class class_combo_liste_prix_farming: RscListbox
		{
			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 16.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.6 * GUI_GRID_W;
			h = 7.9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.07};
		};
		class class_combo_liste_joueur: RscListbox
		{
			onLBDblClick = "[_this] execVM ""menu\nouveau_menu_vendre_au_marche\vendre_le_farming_marche.sqf"";"; 

			idc = 1501;
			text = "combo"; //--- ToDo: Localize;
			x = 7.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.8 * GUI_GRID_W;
			h = 7.9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.07};
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			x = 0.504487 * safezoneW + safezoneX;
			y = 0.353104 * safezoneH + safezoneY;
			w = 0.003125 * safezoneW;
			h = 0.25 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class titre_votre_inventaire: RscText
		{
			style = ST_CENTER;

			idc = 1006;
			text = "... Votre Inventaire ..."; //--- ToDo: Localize;
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.234375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class titre_prix_du_farming: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "... Prix Du Farming ..."; //--- ToDo: Localize;
			x = 0.521985 * safezoneW + safezoneX;
			y = 0.669918 * safezoneH + safezoneY;
			w = 0.271875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class class_espace_total_joueur: RscText
		{
			style = ST_RIGHT;

			idc = 1008;
			text = "Espace restant : x/100"; //--- ToDo: Localize;
			x = 0.565927 * safezoneW + safezoneX;
			y = 0.221129 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class class_titre_joueur: RscText
		{
			idc = 1009;
			text = "titre de l objet"; //--- ToDo: Localize;
			x = 0.21875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.334375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class class_jeter_farming: RscShortcutButton
		{
			onButtonClick = "[] execVM 'menu\nouveau_menu_vendre_au_marche\jeter_le_farming_du_marche.sqf';"; 

			idc = 1700;
			text = "Jeter farming"; //--- ToDo: Localize;
			x = 0.669287 * safezoneW + safezoneX;
			y = 0.716434 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Menu_Choix_Montant_Farming
{
	idd = 125896;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Choix_Montant_Farming',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Choix_Montant_Farming', nil]";
	
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
			text = "Taper le montant souhaite"; //--- ToDo: Localize;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.324733 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.025 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class edit_montant: RscEdit
		{
			idc = 1400;
			text = "   Taper le montant que vous souhaitez ..."; //--- ToDo: Localize;
			x = 0.243125 * safezoneW + safezoneX;
			y = 0.388034 * safezoneH + safezoneY;
			w = 0.5125 * safezoneW;
			h = 0.0895856 * safezoneH;
		};
		class class_valider: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\inventaire_des_vehicules\nouveau_inventaire_farming\choix_montant_menu_farming.sqf';";

			idc = 1700;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.616551 * safezoneW + safezoneX;
			y = 0.541794 * safezoneH + safezoneY;
			w = 0.069151 * safezoneW;
			h = 0.0302072 * safezoneH;
		};
	};
};
