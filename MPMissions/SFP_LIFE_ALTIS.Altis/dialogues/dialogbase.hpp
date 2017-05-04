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
#define CT_SHORTCUT_BUTTON  16
   
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
#define CT_List_N_Box       102
   
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176
 
#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define FontM             "PuristaMedium"

class BaseRscSingleText
{
	access = 0;
	type =  CT_STATIC ;
	style = ST_LEFT; 
	colorText[] = { 1, 1, 1, 1 };
	colorBackground[] = { 1, 1, 1, 0.8 };
	font = FontM;
	sizeEx = 0.023;
	w = 0.3; h = 0.075;
	text = "";
};
class BaseRscPicture : baseRscSingleText
{
	access = 0;
	style = ST_PICTURE;
	w = 0.3; h = 0.075;
	text = "\map_stratis\data\ui_stratis.paa";
};
class BaseRscBox : baseRscSingleText
{
	access = 0;
	w = 0; h = 0;
	colorBackground[] = { 1, 1, 1, 0.8 };
	text = "";
};

class BaseRscButton 
{ 
	access = 0; 
	type = CT_BUTTON; 
	style = ST_CENTER; 
	w = 0.3; h = 0.075; 
	text = ""; 
	font = PuristaMedium; 
	sizeEx = 0.03; 
	colorBackground[] = {0,0.07,0.66,1 }; 
    colorBackground2[] = {0.34,0.49,0.97,1};
    colorBackgroundFocused[] = {0.21,0.35,0.98,1};
	colorBackgroundDisabled[] = { 0, 0, 0, 0.8 }; 
	colorBackgroundActive[] = { 0,0.07,0.66, 0.6 }; 
    color[] = {1,1,1,1};
    color2[] = {1,1,1,1};
	colorShadow[] = { 0, 0, 0, 0.4 }; 
	colorText[] = { 1,1,1,1 }; 
	colorFocused[] = { 1, 1, 1, 0.5 }; 
	colorDisabled[] = { 0, 0, 0, 0.8 }; 
	colorBorder[] = {1, 0, 0, 1}; 
	offsetX = 0; 
	offsetY = 0; 
	offsetPressedX = 0; 
	offsetPressedY = 0; 
	shadow = 1; 
	borderSize = 0; 
	soundEnter[] = {"\A3\ui_f\data\sound\ReadOut\readoutClick",0.5,1}; 
	soundPush[] = {"\A3\ui_f\data\sound\CfgIngameUI\hintCollapse",1,1}; 
	soundClick[] = {"",0.1,1}; 
	soundEscape[] = {"",0.1,1}; 
};

class BaseRscTextBox
{
	access = 0;
	type = CT_EDIT;
	style = ST_LEFT;
	w = 0.3; h = 0.075;
	sizeEx = 0.02;
	font = FontM;
	text = "";
	colorText[] = { 1, 1, 1, 1 };
	colorBackground[] = { 1, 1, 1, 0.8 };
	colorSelection[] = { 1, 1, 1, 0.5 };
	colordisabled[] =  { 1, 1, 1, 0.8 };
	colorborder[] = { 0, 0, 0, 1 };
	border = 1;
	autocomplete = false;
};

class BaseRscComboBox 
{
	type = CT_COMBO;
	style = CT_BUTTON;
	w = 0.3; h = 0.035;
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorText[] = { 0, 0, 0, 1 };
	colorBackground[] = { 0,0.07,0.66,1 };
	colorSelectBackground[] = { 0.7, 0.4, 0.4, 0.8 };
	colorScrollbar[] = {0.5, 0.5, 0.5, 1};
	arrowFull = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
	arrowEmpty = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
	wholeHeight = 0.725;
	color[] = {0, 0, 0, 0.6};
	colorActive[] = {0, 0, 0, 1};
	colorDisabled[] = {0, 0, 0, 0.3};
	font = FontM;
	sizeEx = 0.03;
	soundSelect[] = {"\a3\ui_f\data\Sound\NEW1", 0.09, 1};
	soundExpand[] = {"\a3\ui_f\data\Sound\NEW1", 0.09, 1};
	soundCollapse[] = {"\a3\ui_f\data\Sound\NEW1", 0.09, 1};
	maxHistoryDelay = 1.0;
	
	class ComboScrollBar 
	{
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\a3\ui_f\data\gui\cfg\Scrollbar\Scrollbar_thumb_ca.paa";
		arrowFull = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
		arrowEmpty = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
		border = "\a3\ui_f\data\gui\cfg\Scrollbar\border_ca.paa";
	};
};

class FrancaiseDesJeux
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {mon_argent_poche_by_sfp_maxou,Lejeu,Indication,Valeurdujeu,Jouer,Close};

	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.620;
	};
	class mon_argent_poche_by_sfp_maxou : BaseRscSingleText
	{
		idc = 11172;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class Lejeu : BaseRscComboBox
	{
		idc = 11173;
		moving = 1;
		colorSelectBackground[] = { 0.7,0.03,0,1 };
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Indication : BaseRscButton
	{
		idc = -1;
		text = "Taper votre mise ci dessous";
		action = "closeDialog 0";
		x = 0.65; y = 0.5;
		w = 0.5;
	};
	class Valeurdujeu : BaseRscTextBox
	{
		idc = 11175;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.575;
		w = 0.5;
	};
	class Jouer : BaseRscButton
	{
		idc = 11176;
		text = "Jouer ...";
		action = "execVM 'divers\francaise_des_jeux\jouer.sqf'";
		x = 0.65; y = 0.650;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.725;
		w = 0.5;
	};
};
class LocationDeVehicules
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {mon_argent_poche_by_sfp_maxou,LaVoitureParSFPMaxou,IndicationParSFPMaxou,ValeurLocationParSFPMAxou,LouerParSFPMaxou,Close};

	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.620;
	};
	class mon_argent_poche_by_sfp_maxou : BaseRscSingleText
	{
		idc = 11172;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class LaVoitureParSFPMaxou : BaseRscComboBox
	{
		idc = 11173;
		moving = 1;
		colorSelectBackground[] = { 0.7,0.03,0,1 };
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class IndicationParSFPMaxou : BaseRscButton
	{
		idc = -1;
		text = "Durée de la location (en minutes)";
		action = "";
		x = 0.65; y = 0.5;
		w = 0.5;
	};
	class ValeurLocationParSFPMAxou : BaseRscTextBox
	{
		idc = 11175;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.575;
		w = 0.5;
	};
	class LouerParSFPMaxou : BaseRscButton
	{
		idc = 11176;
		text = "Louer !";
		action = "execVM 'divers\locations_de_vehicules\louer.sqf'";
		x = 0.65; y = 0.650;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.725;
		w = 0.5;
	};
};
class TrouverUnTravail
{
	idd = -1;
	movingEnable = false;
	enableSimulation = true;
	controlsBackground[] = {fondjournal};
	objects[] = {};
	controls[] = {MessageByMaxouANPEUn,MessageByMaxouANPEDeux,MessageByMaxouANPETrois,MessageByMaxouANPEQuatre,MessageByMaxouANPECinq,MessageByMaxouANPESix,MessageByMaxouANPESept,MessageByMaxouANPEHuit,MessageByMaxouANPENeuf,Close,OffreSuivante,AccepterOffre,ConnaitreMesDiplomes};

	class fondjournal
	{
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		type = 0;
		idc = -1;
		style = 48;
		colorBackground[] = {0, 0, 0, 0};
		colorText[] = {1, 1, 1, 1};
		font = BitStream;
		sizeEx = 0;
		lineSpacing = 0;
		access = ReadAndWrite;
		text = "textures\icones\anpe_by_maxou.paa";
	};
	class MessageByMaxouANPEUn : BaseRscSingleText
	{
		idc = 11172;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.035;
		x = 0.050; y = 0.100;
		w = 0.15; h = 0.028;
	};
	class MessageByMaxouANPEDeux : BaseRscSingleText
	{
		idc = 11173;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.080; y = 0.160;
		w = 0.840; h = 0.045;
	};
	class MessageByMaxouANPETrois : BaseRscSingleText
	{
		idc = 11174;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.080; y = 0.2035;
		w = 0.840; h = 0.045;
	};
	class MessageByMaxouANPEQuatre : BaseRscSingleText
	{
		idc = 11175;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.280; h = 0.045;
		w = 0.580; y = 0.322;
	};
	class MessageByMaxouANPECinq : BaseRscSingleText
	{
		idc = 11176;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.283; h = 0.045;
		w = 0.580; y = 0.396;
	};
	class MessageByMaxouANPESix : BaseRscSingleText
	{
		idc = 11177;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.232; h = 0.045;
		w = 0.632; y = 0.466;
	};
	class MessageByMaxouANPESept : BaseRscSingleText
	{
		idc = 11178;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.432; h = 0.045;
		w = 0.434; y = 0.534;
	};
	class MessageByMaxouANPEHuit : BaseRscSingleText
	{
		idc = 11179;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.258; h = 0.045;
		w = 0.612; y = 0.604;
	};
	class MessageByMaxouANPENeuf : BaseRscSingleText
	{
		idc = 11180;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.030;
		x = 0.770; h = 0.045;
		w = 0.140; y = 0.685;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "         Fermer";
		action = "closeDialog 0";
		x = 0.752; y = 0.850;
		w = 0.220;
	};
	class OffreSuivante : BaseRscButton
	{
		idc = -1;
		text = "     Offre Suivante";
		action = "closeDialog 0, execvm 'divers\offres_d_emplois\initialisation_trouver_un_travail.sqf'";
		x = 0.495; y = 0.850;
		w = 0.220;
	};
	class AccepterOffre : BaseRscButton
	{
		idc = -1;
		text = "     Accepter Offre";
		action = "closeDialog 0, execvm 'divers\offres_d_emplois\offre_choisit.sqf'";
		x = 0.238; y = 0.850;
		w = 0.220;
	};
	class ConnaitreMesDiplomes : BaseRscButton
	{
		idc = -1;
		text = "   Mes Diplomes";
		action = "execvm 'divers\offres_d_emplois\ecole\connaitre_mes_diplomes.sqf'";
		x = 0.030; y = 0.850;
		w = 0.175;
	};
};
class Ipod_SFPMAXOU_SFP_TEAM
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {fondipod,fondipod_deux};
	objects[] = {};
	controls[] = {Fermer_Izik,Son_plus_fort_SFP_Maxou,Son_plus_faible_SFP_Maxou,Play_Pause_SFP_Maxou,Liste_de_musique_by_sfp_maxou};

	class fondipod: BaseRscPicture
	{
		idc = -1;
		text = "textures\icones\mp3_player_sfp_maxou.paa";
		type = CT_STATIC;
		shadow = 0;
		fixedWidth = 0;
		x = 0;
		w = 0.8;
		y = 0;
		h = 0.9;
		colorBackground[] = {0, 0, 0, 0};
		colorText[] = {1, 1, 1, 1};
		sizeEx = 0;
		size = 0;
		font = "PuristaMedium";
	};
	class fondipod_deux: BaseRscPicture
	{
		idc = -1;
		text = "textures\icones\mp3_player_sfp_maxou_bouton_eteindre.paa";
		type = CT_STATIC;
		shadow = 0;
		fixedWidth = 0;
		x = 0.55;
		w = 0.02;
		y = 0.54;
		h = 0.02;
		colorBackground[] = {0, 0, 0, 0};
		colorText[] = {1, 1, 1, 1};
		sizeEx = 0;
		size = 0;
		font = "PuristaMedium";
	};
	class Fermer_Izik : BaseRscButton
	{
		idc = -1;
		text = "";
		action = "closeDialog 0";
		x = 0.55;
		w = 0.02;
		y = 0.54;
		h = 0.02;
		font = FontM; 
		sizeEx = 0.03; 
		colorText[] = { 0, 0, 0, 1 }; 
		colorDisabled[] = { 0, 0, 0, 0.8 }; 
		colorBackground[] = { 0, 0, 0, 0 }; 
		colorBackgroundDisabled[] = { 0, 0, 0, 0 }; 
		colorBackgroundActive[] = { 0, 0, 0, 0 }; 
		colorFocused[] = { 0, 0, 0, 0 }; 
		colorShadow[] = { 0, 0, 0, 0 }; 
	};
	class Son_plus_fort_SFP_Maxou : BaseRscButton
	{
		idc = -1;
		text = "";
		action = "if (isnil 'son_du_izik') then {son_du_izik = 0.3;};son_du_izik = son_du_izik + 0.1;if (son_du_izik >= 1) then {son_du_izik = 1};1 fadeMusic son_du_izik;hint format ['Le son du Izik est de %1 pour cent.',(son_du_izik) * 100];";
		x = 0.44; 
		w = 0.04; 
		y = 0.626;
		h = 0.04; 
		font = FontM; 
		sizeEx = 0.03; 
		colorText[] = { 0, 0, 0, 1 }; 
		colorDisabled[] = { 0, 0, 0, 0.8 }; 
		colorBackground[] = { 0, 0, 0, 0 }; 
		colorBackgroundDisabled[] = { 0, 0, 0, 0 }; 
		colorBackgroundActive[] = { 0, 0, 0, 0 }; 
		colorFocused[] = { 0, 0, 0, 0 }; 
		colorShadow[] = { 0, 0, 0, 0 }; 
	};
	class Son_plus_faible_SFP_Maxou : BaseRscButton
	{
		idc = -1;
		text = "";
		action = "if (isnil 'son_du_izik') then {son_du_izik = 0.3;};son_du_izik = son_du_izik - 0.1;if (son_du_izik <= 0) then {son_du_izik = 0};1 fadeMusic son_du_izik;if (son_du_izik == 9.999999) then {son_du_izik = 0.1};hint format ['Le son du Izik est de %1 pour cent.',(son_du_izik) * 100];";
		x = 0.44; 
		w = 0.04; 
		y = 0.68;
		h = 0.04; 
		font = FontM; 
		sizeEx = 0.03; 
		colorText[] = { 0, 0, 0, 1 }; 
		colorDisabled[] = { 0, 0, 0, 0.8 }; 
		colorBackground[] = { 0, 0, 0, 0 }; 
		colorBackgroundDisabled[] = { 0, 0, 0, 0 }; 
		colorBackgroundActive[] = { 0, 0, 0, 0 }; 
		// colorBackgroundActive[] = { 0.51,0.77,0.09,0.8 }; 
		colorFocused[] = { 0, 0, 0, 0 }; 
		colorShadow[] = { 0, 0, 0, 0 }; 
	};
	class Play_Pause_SFP_Maxou : BaseRscButton
	{
		idc = -1;
		text = "";
		action = "execvm 'divers\izik\lire_musique_izik_by_sfp_maxou.sqf';";
		x = 0.32; 
		w = 0.08; 
		y = 0.62;
		h = 0.10; 
		font = FontM; 
		sizeEx = 0.03; 
		colorText[] = { 0, 0, 0, 1 }; 
		colorDisabled[] = { 0, 0, 0, 0.8 }; 
		colorBackground[] = { 0, 0, 0, 0 }; 
		colorBackgroundDisabled[] = { 0, 0, 0, 0 }; 
		colorBackgroundActive[] = { 0, 0, 0, 0 }; 
		colorFocused[] = { 0, 0, 0, 0 }; 
		colorShadow[] = { 0, 0, 0, 0 }; 
	};
	class Liste_de_musique_by_sfp_maxou : BaseRscComboBox
	{
		idc = 11173;
		moving = 1;
		colorSelectBackground[] = { 0.32,0.34,0.36,0.7 };
		colorBackground[] = { 0.32,0.34,0.36,1 };
		sizeEx = 0.04;
		x = 0.24; y = 0.124;
		w = 0.315;
	};
};

