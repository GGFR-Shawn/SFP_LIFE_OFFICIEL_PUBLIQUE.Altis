// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

//--- Achat_Armes
#define IDC_ACHAT_ARMES_COULEURFOND			6656
#define IDC_ACHAT_ARMES_SFPTEAM_MAXOU		6658
#define IDC_ACHAT_ARMES_BY_MAXOU			6659
#define IDC_ACHAT_ARMES_TEXTE_ARGENT_DISPONIBLE	6660
#define IDC_ACHAT_ARMES_ARGENT_EN_COULEUR		6661
#define IDC_ACHAT_ARMES_RSCTEXT_1006		6662
#define IDC_ACHAT_ARMES_RSCTEXT_1007		6663
#define IDC_ACHAT_ARMES_COMBO_LIST			7156
#define IDC_ACHAT_ARMES_BOUTTON_ARMES		7356
#define IDC_ACHAT_ARMES_BOUTTON_ANNULER		7357
#define IDC_ACHAT_ARMES_BOUTTON_PREVISUALISATION	7358
#define IDC_ACHAT_ARMES_BOUTTON_MUNITIONS		7359

#define GUI_GRID_X	(safezoneX)
#define GUI_GRID_Y	(safezoneY)
#define GUI_GRID_W	(safezoneW / 32)
#define GUI_GRID_H	(safezoneH / 20)
#define GUI_GRID_WAbs	(safezoneW)
#define GUI_GRID_HAbs	(safezoneH)

class Menu_Armes_Gangs_SFP
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Armes_Gangs_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Armes_Gangs_SFP', nil]";
	
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
			onButtonClick = "[0] execVM 'divers\achats_armes_nouveau\previsualisation_armes.sqf';";
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
			onButtonClick = "[0] execVM 'divers\achats_armes_nouveau\acheter_armes_sfp.sqf';";
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
			onButtonClick = "[0] execVM 'divers\achats_armes_nouveau\acheter_munitions_sfp.sqf';";
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
class Menu_Choix_Armes_Illegales
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Choix_Armes_Illegales',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Choix_Armes_Illegales', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.265625 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.4875 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_disponible: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Selectionnez le texte"; //--- ToDo: Localize;
			x = 0.26875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.48125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.640625 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.09375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Armes: RscShortcutButton
		{
			onButtonClick = "[0,0,0,[1]] execVM 'divers\achats_armes_nouveau\menu_armes_sfp.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Acheter Pistolets Illégaux"; //--- ToDo: Localize;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.38125 * safezoneW;
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
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "[0,0,0,[2]] execVM 'divers\achats_armes_nouveau\menu_armes_sfp.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Acheter Fusils Illégaux"; //--- ToDo: Localize;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.375 * safezoneH + safezoneY;
			w = 0.38125 * safezoneW;
			h = 0.05 * safezoneH;
		};
	};
};
class Menu_Armes_Pistolets_Illegaux_SFP
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Armes_Pistolets_Illegaux_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Armes_Pistolets_Illegaux_SFP', nil]";
	
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
			onButtonClick = "[1] execVM 'divers\achats_armes_nouveau\previsualisation_armes.sqf';";
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
			onButtonClick = "[1] execVM 'divers\achats_armes_nouveau\acheter_armes_sfp.sqf';";
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
			onButtonClick = "[1] execVM 'divers\achats_armes_nouveau\acheter_munitions_sfp.sqf';";
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
class Menu_Armes_Fusils_Illegaux_SFP
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Armes_Fusils_Illegaux_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Armes_Fusils_Illegaux_SFP', nil]";
	
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
			onButtonClick = "[2] execVM 'divers\achats_armes_nouveau\previsualisation_armes.sqf';";
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
			onButtonClick = "[2] execVM 'divers\achats_armes_nouveau\acheter_armes_sfp.sqf';";
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
			onButtonClick = "[2] execVM 'divers\achats_armes_nouveau\acheter_munitions_sfp.sqf';";
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
class Menu_Armes_Pistolets_Legaux_SFP
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Armes_Pistolets_Legaux_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Armes_Pistolets_Legaux_SFP', nil]";
	
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
			onButtonClick = "[3] execVM 'divers\achats_armes_nouveau\previsualisation_armes.sqf';";
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
			onButtonClick = "[3] execVM 'divers\achats_armes_nouveau\acheter_armes_sfp.sqf';";
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
			onButtonClick = "[3] execVM 'divers\achats_armes_nouveau\acheter_munitions_sfp.sqf';";
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
class Menu_Armes_Fusils_Legaux_SFP
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Armes_Fusils_Legaux_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Armes_Fusils_Legaux_SFP', nil]";
	
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
			onButtonClick = "[4] execVM 'divers\achats_armes_nouveau\previsualisation_armes.sqf';";
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
			onButtonClick = "[4] execVM 'divers\achats_armes_nouveau\acheter_armes_sfp.sqf';";
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
			onButtonClick = "[4] execVM 'divers\achats_armes_nouveau\acheter_munitions_sfp.sqf';";
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
class Menu_Choix_Armes_Legales
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Choix_Armes_Legales',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Choix_Armes_Legales', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.265625 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.4875 * safezoneW;
			h = 0.45 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class texte_argent_disponible: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "Selectionnez le texte"; //--- ToDo: Localize;
			x = 0.26875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.48125 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.640625 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.09375 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Boutton_Armes: RscShortcutButton
		{
			onButtonClick = "[0,0,0,[3]] execVM 'divers\achats_armes_nouveau\menu_armes_sfp.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "Acheter Pistolets Légaux"; //--- ToDo: Localize;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.38125 * safezoneW;
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
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "[0,0,0,[4]] execVM 'divers\achats_armes_nouveau\menu_armes_sfp.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Acheter Fusils Légaux"; //--- ToDo: Localize;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.375 * safezoneH + safezoneY;
			w = 0.38125 * safezoneW;
			h = 0.05 * safezoneH;
		};
	};
};
class Menu_Armes_GIGN_SFP
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Armes_GIGN_SFP',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Armes_GIGN_SFP', nil]";
	
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
			onButtonClick = "[5] execVM 'divers\achats_armes_nouveau\previsualisation_armes.sqf';";
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
			onButtonClick = "[5] execVM 'divers\achats_armes_nouveau\acheter_armes_sfp.sqf';";
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
			onButtonClick = "[5] execVM 'divers\achats_armes_nouveau\acheter_munitions_sfp.sqf';";
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
class Menu_Attachement_Armes
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Attachement_Armes',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Attachement_Armes', nil]";
	
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
			onButtonClick = "[] execVM 'divers\achats_armes_nouveau\acheter_attachement_armes.sqf';";
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