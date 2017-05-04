// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

#define IDC_SSS_RSCTEXT_1000	1345
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class Bar_De_Progression
{
	movingEnable = true;
	idd = 144000;
	fadein = 0;
	fadeout = 0;
	duration = 30000;
	onLoad = "uiNamespace setVariable ['Bar_De_Progression', (_this select 0)];";
	onUnLoad = "uiNamespace setVariable ['Bar_De_Progression', nil];";
	class Controls
	{
		class Bar: RscProgressBar
		{
			idc = 5000;
			text = "Temps restant";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class Bar_Text: RscText
		{
			idc = 5001;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes 
			{
				align = "center";
			};
		};
	};
};
class Temps_de_jeu
{
	movingEnable = false;
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 30000;
	onLoad = "uiNamespace setVariable ['Temps_de_jeu', (_this select 0)];";
	onUnLoad = "uiNamespace setVariable ['Temps_de_jeu', nil];";
	class Controls
	{
		class RscText_20000: RscText
		{
			idc = 20000;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			text = "ici test"; //--- ToDo: Localize;
			x = safezoneX + 0.01 * safezoneW;
			y = safezoneY + 0.01 * safezoneH;
			w = 0.8;
			h = 0.3;
			colorText[] = {1,1,1,1};
			lineSpacing = 0;
			colorBackground[] = {0,0,0,0};
			shadow = 0;
			class Attributes 
			{
				align = "left";
			};
		};
	};
};
class Dialogue_Nombre_De_Personnes_Connectees
{
	movingEnable = false;
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 30000;
	onLoad = "uiNamespace setVariable ['Dialogue_Nombre_De_Personnes_Connectees', (_this select 0)];";
	onUnLoad = "uiNamespace setVariable ['Dialogue_Nombre_De_Personnes_Connectees', nil];";
	class Controls
	{
		class RscText_1000: RscText
		{
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			colorText[] = {1,1,1,1};
			lineSpacing = 0;
			shadow = 0;
			class Attributes {align = "left";};

			idc = 1000;
			text = "Ici texte"; //--- ToDo: Localize;
			x = safezoneX + 0.01 * safezoneW;
			y = 0.0312607 * safezoneH + safezoneY;
			w = 0.478189 * safezoneW;
			h = 0.0220065 * safezoneH;
		};
	};
};
class Tutoriel_Decorateur_Interieur
{
	movingEnable = false;
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 30000;
	onLoad = "uiNamespace setVariable ['Tutoriel_Decorateur_Interieur', (_this select 0)];";
	onUnLoad = "uiNamespace setVariable ['Tutoriel_Decorateur_Interieur', nil];";
	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "! TUTO RAPIDE !"; //--- ToDo: Localize;
			x = -9.51 * GUI_GRID_W + GUI_GRID_X;
			y = -1.99 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			x = -6.98 * GUI_GRID_W + GUI_GRID_X;
			y = -0.38 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "CTRL + Z : Monter objet."; //--- ToDo: Localize;
			x = -11 * GUI_GRID_W + GUI_GRID_X;
			y = -1 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "CTRL + W : Descendre objet."; //--- ToDo: Localize;
			x = -11 * GUI_GRID_W + GUI_GRID_X;
			y = -0.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			text = "CTRL + Q : Tourner objet."; //--- ToDo: Localize;
			x = -11 * GUI_GRID_W + GUI_GRID_X;
			y = 0.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = "CTRL + D : Tourner objet."; //--- ToDo: Localize;
			x = -11 * GUI_GRID_W + GUI_GRID_X;
			y = 1.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "By Maxou."; //--- ToDo: Localize;
			x = -5.68 * GUI_GRID_W + GUI_GRID_X;
			y = 1.92 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 0.5 * GUI_GRID_H;
		};
	};
};
class HUD_Menu_SFP
{
	movingEnable = false;
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 30000;
	onLoad = "uiNamespace setVariable ['HUD_Menu_SFP', (_this select 0)];";
	onUnLoad = "uiNamespace setVariable ['HUD_Menu_SFP', nil];";
	class Controls
	{
		class barre_de_fond: RscPicture
		{
			idc = 1211;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.092571 * safezoneW + safezoneX;
			y = 0.959894 * safezoneH + safezoneY;
			w = 0.699341 * safezoneW;
			h = 0.0418087 * safezoneH;
			colorText[] = {0,0,0,0.3};
		};
		class Picture_Map: RscMapControl_HUD_SFP
		{
			idc = 1210;
			x = 0.836262 * safezoneW + safezoneX;
			y = 0.819068 * safezoneH + safezoneY;
			w = 0.131038 * safezoneW;
			h = 0.134244 * safezoneH;
		};
		class Picture_Montre: RscPicture
		{
			idc = 1208;
			text = "textures\montre_android_sfp.paa";
			x = 0.822877 * safezoneW + safezoneX;
			y = 0.770663 * safezoneH + safezoneY;
			w = 0.158875 * safezoneW;
			h = 0.231044 * safezoneH;
		};
		class Texte_Argent_Poche: RscText
		{
			style = ST_LEFT;

			idc = 1001;
			text = "Argent Poche"; //--- ToDo: Localize;
			x = 0.117314 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Permis_Conduire: RscText
		{
			style = ST_LEFT;

			idc = 1003;
			text = "Permis De Conduire"; //--- ToDo: Localize;
			x = 0.656807 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Dommage_Joueur: RscText
		{
			style = ST_LEFT;

			idc = 1000;
			text = "Dommage Joueur"; //--- ToDo: Localize;
			x = 0.193608 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Fatigue_Joueur: RscText
		{
			style = ST_LEFT;

			idc = 1002;
			text = "Fatigue Joueur"; //--- ToDo: Localize;
			x = 0.269939 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Toilette: RscText
		{
			style = ST_LEFT;

			idc = 1004;
			text = "Toilette"; //--- ToDo: Localize;
			x = 0.578407 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Soif: RscText
		{
			style = ST_LEFT;

			idc = 1005;
			text = "Soif"; //--- ToDo: Localize;
			x = 0.423633 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Faim: RscText
		{
			style = ST_LEFT;

			idc = 1006;
			text = "Faim"; //--- ToDo: Localize;
			x = 0.34628 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Sommeil: RscText
		{
			style = ST_LEFT;

			idc = 1007;
			text = "Sommeil"; //--- ToDo: Localize;
			x = 0.501007 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Texte_Telecom: RscText
		{
			style = ST_LEFT;

			idc = 1019;
			text = "Puissance Telecom"; //--- ToDo: Localize;
			x = 0.735197 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class texte_position_mapgrid: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;
			class Attributes {align = "center";};

			idc = 1016;
			text = "mapgrid position"; //--- ToDo: Localize;
			x = 0.824911 * safezoneW + safezoneX;
			y = 0.79046 * safezoneH + safezoneY;
			w = 0.153693 * safezoneW;
			h = 0.030806 * safezoneH;
		};
		class Bar_Faim: RscProgressBar_Hud
		{
			idc = 1011;
			text = "Faim"; //--- ToDo: Localize;
			x = 0.346278 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Argent_Poche: RscProgressBar_Hud
		{
			idc = 1014;
			text = "Argent Poche"; //--- ToDo: Localize;
			x = 0.117314 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Toilette: RscProgressBar_Hud
		{
			idc = 1013;
			text = "Toilette"; //--- ToDo: Localize;
			x = 0.578407 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Soif: RscProgressBar_Hud
		{
			idc = 1012;
			text = "Soif"; //--- ToDo: Localize;
			x = 0.423663 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Fatigue_Joueur: RscProgressBar_Hud
		{
			idc = 1010;
			text = "Fatigue Joueur"; //--- ToDo: Localize;
			x = 0.269939 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Sommeil: RscProgressBar_Hud
		{
			idc = 1008;
			text = "Sommeil"; //--- ToDo: Localize;
			x = 0.501007 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Telecom: RscProgressBar_Hud
		{
			idc = 1018;
			text = "Puissance Telecom"; //--- ToDo: Localize;
			x = 0.735197 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Permis: RscProgressBar_Hud
		{
			idc = 1015;
			text = "Permis De Conduire"; //--- ToDo: Localize;
			x = 0.656807 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Bar_Dommage_Joueur: RscProgressBar_Hud
		{
			idc = 1009;
			text = "Dommage Joueur"; //--- ToDo: Localize;
			x = 0.193608 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.12};
		};
		class Picture_Argent: RscPicture
		{
			idc = 1200;
			text = "textures\icones\money.paa";
			x = 0.0956615 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Vie: RscPicture
		{
			idc = 1201;
			text = "textures\icones\vie.paa";
			x = 0.171956 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Fatigue: RscPicture
		{
			idc = 1202;
			text = "textures\icones\courrir.paa";
			x = 0.24828 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Faim: RscPicture
		{
			idc = 1203;
			text = "textures\icones\food.paa";
			x = 0.324615 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Soif: RscPicture
		{
			idc = 1204;
			text = "textures\icones\water.paa";
			x = 0.401974 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Sommeil: RscPicture
		{
			idc = 1205;
			text = "textures\icones\fairedodo.paa";
			x = 0.479347 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Toilette: RscPicture
		{
			idc = 1206;
			text = "textures\icones\toilette.paa";
			x = 0.556741 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Permis: RscPicture
		{
			idc = 1207;
			text = "textures\icones\permis.paa";
			x = 0.635141 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Picture_Telecom: RscPicture
		{
			idc = 1209;
			text = "textures\icones\sfp_telecom.paa";
			x = 0.713534 * safezoneW + safezoneX;
			y = 0.964299 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class Classe_Affichage_Joueurs_Vehicule: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;
			class Attributes {align = "left";};

			idc = 1017;
			text = "Joueur dans vÃ©hicule"; //--- ToDo: Localize;
			x = 0.00288543 * safezoneW + safezoneX;
			y = 0.743049 * safezoneH + safezoneY;
			w = 0.377603 * safezoneW;
			h = 0.211302 * safezoneH;
		};
		class picture_sfp_team: RscPicture
		{
			idc = 1212;
			text = "textures\logodebutcarte.paa";
			x = 0.90949 * safezoneW + safezoneX;
			y = 0.911491 * safezoneH + safezoneY;
			w = 0.0804559 * safezoneW;
			h = 0.0770167 * safezoneH;
		};
	};
};
class Point_Rouge_Sur_L_Ecran_SFP
{
	movingEnable = false;
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 30000;
	onLoad = "uiNamespace setVariable ['Point_Rouge_Sur_L_Ecran_SFP', (_this select 0)];";
	onUnLoad = "uiNamespace setVariable ['Point_Rouge_Sur_L_Ecran_SFP', nil];";
	class Controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.497937 * safezoneW + safezoneX;
			y = 0.49824 * safezoneH + safezoneY;
			w = 0.00309375 * safezoneW;
			h = 0.0066 * safezoneH;
			colorBackground[] = {1,0,0,1};
		};
	};
};