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

class Menu_Revive
{
	idd = 1111;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Revive',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Revive', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.700809 * safezoneW + safezoneX;
			y = 0.0648 * safezoneH + safezoneY;
			w = 0.278906 * safezoneW;
			h = 0.238 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class RscText_1007: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = ""; //--- ToDo: Localize;
			x = 0.703985 * safezoneW + safezoneX;
			y = 0.0308 * safezoneH + safezoneY;
			w = 0.272553 * safezoneW;
			h = 0.0238 * safezoneH;
			colorText[] = {0.99,0.04,0.01,1};
		};
		class texte_personnalise: RscText
		{
			style = ST_CENTER;
			idc = 1001;
			text = "texte editable"; //--- ToDo: Localize;
			x = 0.707187 * safezoneW + safezoneX;
			y = 0.075 * safezoneH + safezoneY;
			w = 0.266162 * safezoneW;
			h = 0.0238 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			onLBDblClick = "[_this] call menu_liste_revive;";
			idc = 1500;
			x = 0.711968 * safezoneW + safezoneX;
			y = 0.1158 * safezoneH + safezoneY;
			w = 0.255 * safezoneW;
			h = 0.1734 * safezoneH;
		};
	};
};
class Menu_Revive_Liste_Des_Blesses
{
	idd = 1111;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Revive_Liste_Des_Blesses',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Revive_Liste_Des_Blesses', nil]";
	
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
			text = "LISTE DES BLESSES"; //--- ToDo: Localize;
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
			onButtonClick = "[] call variable_cherche_blesse_menu_revive;";

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

class Menu_blessures_sfp
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_blessures_sfp',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_blessures_sfp', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;

			x = 0.138982 * safezoneW + safezoneX;
			y = 0.136878 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		class pannel_titre: RscText
		{
			style = ST_CENTER; 

			idc = 1001;
			text = "... Blessures Revive SFP ..."; //--- ToDo: Localize;
			x = 0.051405 * safezoneW + safezoneX;
			y = 0.0775988 * safezoneH + safezoneY;
			w = 0.73113 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";

			idc = 1700;
			text = "FERMER"; //--- ToDo: Localize;
			x = 0.702151 * safezoneW + safezoneX;
			y = 0.783877 * safezoneH + safezoneY;
			w = 0.0785627 * safezoneW;
			h = 0.0301987 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;

			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.772816 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0383803 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;

			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.0699689 * safezoneW + safezoneX;
			y = 0.790416 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0339789 * safezoneH;
		};
		class revive_image_tete: RscPicture
		{
			idc = 1201;
			text = "textures\revive_sfp\tete_blanche_sfp.paa";
			x = 0.620691 * safezoneW + safezoneX;
			y = 0.154486 * safezoneH + safezoneY;
			w = 0.0598256 * safezoneW;
			h = 0.116637 * safezoneH;
		};
		class revive_image_buste: RscPicture
		{
			idc = 1203;
			text = "textures\revive_sfp\buste_blanc_sfp.paa";
			x = 0.626881 * safezoneW + safezoneX;
			y = 0.268922 * safezoneH + safezoneY;
			w = 0.0464161 * safezoneW;
			h = 0.132044 * safezoneH;
		};
		class revive_image_estomac: RscPicture
		{
			idc = 1204;
			text = "textures\revive_sfp\estomac_blanc_sfp.paa";
			x = 0.624819 * safezoneW + safezoneX;
			y = 0.401125 * safezoneH + safezoneY;
			w = 0.0526051 * safezoneW;
			h = 0.0506139 * safezoneH;
		};
		class revive_image_bras_droit: RscPicture
		{
			idc = 1200;
			text = "textures\revive_sfp\bras_et_main_droite_blanc.paa";
			x = 0.598988 * safezoneW + safezoneX;
			y = 0.270094 * safezoneH + safezoneY;
			w = 0.0278491 * safezoneW;
			h = 0.132044 * safezoneH;
		};
		class revive_image_bras_gauche: RscPicture
		{
			idc = 1202;
			text = "textures\revive_sfp\bras_et_main_gauche_blanc.paa";
			x = 0.672719 * safezoneW + safezoneX;
			y = 0.270094 * safezoneH + safezoneY;
			w = 0.0278491 * safezoneW;
			h = 0.132044 * safezoneH;
		};
		class revive_image_cuisse_gauche: RscPicture
		{
			idc = 1205;
			text = "textures\revive_sfp\cuisse_gauche_blanc.paa";
			x = 0.648005 * safezoneW + safezoneX;
			y = 0.448209 * safezoneH + safezoneY;
			w = 0.0299121 * safezoneW;
			h = 0.0704202 * safezoneH;
		};
		class revive_image_cuisse_droite: RscPicture
		{
			idc = 1206;
			text = "textures\revive_sfp\cuisse_droite_blanc.paa";
			x = 0.62197 * safezoneW + safezoneX;
			y = 0.448408 * safezoneH + safezoneY;
			w = 0.0299121 * safezoneW;
			h = 0.0704202 * safezoneH;
		};
		class revive_image_tibia_droit: RscPicture
		{
			idc = 1207;
			text = "textures\revive_sfp\tibia_droite_blanc.paa";
			x = 0.6305 * safezoneW + safezoneX;
			y = 0.517746 * safezoneH + safezoneY;
			w = 0.0165026 * safezoneW;
			h = 0.0616174 * safezoneH;
		};
		class revive_image_tibia_gauche: RscPicture
		{
			idc = 1208;
			text = "textures\revive_sfp\tibia_gauche_blanc.paa";
			x = 0.653163 * safezoneW + safezoneX;
			y = 0.517933 * safezoneH + safezoneY;
			w = 0.0154711 * safezoneW;
			h = 0.0616174 * safezoneH;
		};
		class revive_image_pied_droit: RscPicture
		{
			idc = 1209;
			text = "textures\revive_sfp\pied_droit_blanc.paa";
			x = 0.629472 * safezoneW + safezoneX;
			y = 0.579163 * safezoneH + safezoneY;
			w = 0.0175341 * safezoneW;
			h = 0.0198041 * safezoneH;
		};
		class revive_image_pied_gauche: RscPicture
		{
			idc = 1210;
			text = "textures\revive_sfp\pied_gauche_blanc.paa";
			x = 0.651693 * safezoneW + safezoneX;
			y = 0.577502 * safezoneH + safezoneY;
			w = 0.0165026 * safezoneW;
			h = 0.0220048 * safezoneH;
		};
		class texte_degat_pied_droit: RscText
		{
			idc = 9999;

			text = "100 %"; //--- ToDo: Localize;
			x = 0.591018 * safezoneW + safezoneX;
			y = 0.570221 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_pied_gauche: RscText
		{
			idc = 1007;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.678716 * safezoneW + safezoneX;
			y = 0.570221 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_tibia_droit: RscText
		{
			idc = 1005;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.591018 * safezoneW + safezoneX;
			y = 0.517397 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_tibia_gauche: RscText
		{
			idc = 1008;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.678716 * safezoneW + safezoneX;
			y = 0.517397 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_cuisse_droite: RscText
		{
			idc = 1006;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.591018 * safezoneW + safezoneX;
			y = 0.464573 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_cuisse_gauche: RscText
		{
			idc = 1009;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.678716 * safezoneW + safezoneX;
			y = 0.464573 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_bras_droit: RscText
		{
			idc = 1010;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.572271 * safezoneW + safezoneX;
			y = 0.324032 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_bras_gauche: RscText
		{
			idc = 1011;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.704336 * safezoneW + safezoneX;
			y = 0.324032 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_degat_tete: RscText
		{
			idc = 1012;
			text = "100 %"; //--- ToDo: Localize;
			x = 0.637197 * safezoneW + safezoneX;
			y = 0.121472 * safezoneH + safezoneY;
			w = 0.040589 * safezoneW;
			h = 0.0427817 * safezoneH;
			colorText[] = {0.98,0.07,0,1};
		};
		class texte_revive_message_explication: RscStructuredText
		{
			type = CT_STRUCTURED_TEXT;
			size = 0.040;

			idc = 1100;
			x = 0.0626524 * safezoneW + safezoneX;
			y = 0.14568 * safezoneH + safezoneY;
			w = 0.459009 * safezoneW;
			h = 0.525968 * safezoneH;
		};
		class texte_sante_global: RscStructuredText
		{
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			style = ST_CENTER; 

			idc = 1101;
			text = "Sante global : 100 %"; //--- ToDo: Localize;
			x = 0.0719356 * safezoneW + safezoneX;
			y = 0.682649 * safezoneH + safezoneY;
			w = 0.680777 * safezoneW;
			h = 0.0352118 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class bouton_tete_revive : RscShortcutImage
		{
			idc = 1701;
			x = 0.621715 * safezoneW + safezoneX;
			y = 0.154479 * safezoneH + safezoneY;
			w = 0.0587947 * safezoneW;
			h = 0.114439 * safezoneH;
		};
		class bouton_buste_revive : RscShortcutImage
		{
			idc = 1702;
			x = 0.626873 * safezoneW + safezoneX;
			y = 0.273324 * safezoneH + safezoneY;
			w = 0.047448 * safezoneW;
			h = 0.125445 * safezoneH;
		};
		class bouton_bras_droit_revive : RscShortcutImage
		{
			idc = 1703;
			x = 0.601732 * safezoneW + safezoneX;
			y = 0.272363 * safezoneH + safezoneY;
			w = 0.0257865 * safezoneW;
			h = 0.125445 * safezoneH;
		};
		class bouton_bras_gauche_revive : RscShortcutImage
		{
			idc = 1704;
			x = 0.674321 * safezoneW + safezoneX;
			y = 0.271123 * safezoneH + safezoneY;
			w = 0.0257865 * safezoneW;
			h = 0.127646 * safezoneH;
		};
		class bouton_estomac_revive : RscShortcutImage
		{
			idc = 1705;
			x = 0.625839 * safezoneW + safezoneX;
			y = 0.394365 * safezoneH + safezoneY;
			w = 0.0495111 * safezoneW;
			h = 0.0572192 * safezoneH;
		};
		class bouton_cuisse_droite_revive : RscShortcutImage
		{
			idc = 1706;
			x = 0.629964 * safezoneW + safezoneX;
			y = 0.449384 * safezoneH + safezoneY;
			w = 0.0185661 * safezoneW;
			h = 0.0704234 * safezoneH;
		};
		class bouton_cuisse_gauche_revive : RscShortcutImage
		{
			idc = 1707;
			x = 0.651626 * safezoneW + safezoneX;
			y = 0.451583 * safezoneH + safezoneY;
			w = 0.0195976 * safezoneW;
			h = 0.0682227 * safezoneH;
		};
		class bouton_tibia_droit_revive : RscShortcutImage
		{
			idc = 1708;
			x = 0.629966 * safezoneW + safezoneX;
			y = 0.517605 * safezoneH + safezoneY;
			w = 0.0165031 * safezoneW;
			h = 0.0616206 * safezoneH;
		};
		class bouton_tibia_gauche_revive : RscShortcutImage
		{
			idc = 1709;
			x = 0.652658 * safezoneW + safezoneX;
			y = 0.517605 * safezoneH + safezoneY;
			w = 0.0165031 * safezoneW;
			h = 0.0616206 * safezoneH;
		};
		class bouton_pied_droit_revive : RscShortcutImage
		{
			idc = 1710;
			x = 0.630996 * safezoneW + safezoneX;
			y = 0.579227 * safezoneH + safezoneY;
			w = 0.0144401 * safezoneW;
			h = 0.0198073 * safezoneH;
		};
		class bouton_pied_gauche_revive : RscShortcutImage
		{
			idc = 1711;
			x = 0.654721 * safezoneW + safezoneX;
			y = 0.579226 * safezoneH + safezoneY;
			w = 0.0144401 * safezoneW;
			h = 0.0198073 * safezoneH;
		};
		class texte_mon_niveau_secouriste: RscStructuredText
		{
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			style = ST_CENTER; 

			idc = 1102;
			text = "Niveau secouriste : 1/10"; //--- ToDo: Localize;
			x = 0.071844 * safezoneW + safezoneX;
			y = 0.717783 * safezoneH + safezoneY;
			w = 0.680777 * safezoneW;
			h = 0.0352118 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};
};
class Dialogue_Menu_Pharmacie_SFP
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Dialogue_Menu_Pharmacie_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Dialogue_Menu_Pharmacie_SFP', nil]";
	
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
			x = 0.246875 * safezoneW + safezoneX;
			y = 0.2815 * safezoneH + safezoneY;
			w = 0.50625 * safezoneW;
			h = 0.35 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.69375 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Boutton_Acheter: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\revive_sfp\pharmacie_sfp\achat_pharmacie_sfp.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Acheter Objet"; //--- ToDo: Localize;
			x = 0.59375 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.096875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.234375 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.240625 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.03 * safezoneH;
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
