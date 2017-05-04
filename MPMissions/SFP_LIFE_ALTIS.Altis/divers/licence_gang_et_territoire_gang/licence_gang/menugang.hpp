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

class menugang
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {};
	controls[] = {Title,InfoT,CostT,GangLicense,Info1,Cost1,Redevenircitoyen,Info2,Cost2,Close};
	objects[] = {};
	
	class Title : BaseRscSingleText
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		text = "Menu Gang";
		x = 0.65; y = 0.2;
		w = 0.4;
	};
	class InfoT: BaseRscSingleText
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		text = "Acquis";
		x = 1.05; y = 0.2;
		w = 0.1;
	};
	class CostT: BaseRscSingleText
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		text = "Prix";
		x = 1.15; y = 0.2;
		w = 0.15;
	};
	class GangLicense : BaseRscButton
	{
		idc = -1;
		text = "Créer un gang avec vos amis !";
		action = "if (!isnil {player getvariable 'licence_gang_v2'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 6000000) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 6000000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_gang_v2',true,true];}};closeDialog 0; execVM 'divers\licence_gang_et_territoire_gang\licence_gang\menugang.sqf'; ";
		x = 0.65; y = 0.275;
		w = 0.4;
	};
	class Info1: BaseRscSingleText
	{
		idc = 11157;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 1.05; y = 0.275;
		w = 0.1;
	};
	class cost1: BaseRscSingleText
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		text = "- 6 000 000 €";
		x = 1.15; y = 0.275;
		w = 0.15;
	};
	class Redevenircitoyen : BaseRscButton
	{
		idc = -1;
		text = "Redevenir un modèle de la société !";
		action = "if (!isnil {player getvariable 'licence_gang_v2'}) then {if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 0) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') + 100000),true];  autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_gang_v2',nil,true];}}else{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;};closeDialog 0; execVM 'divers\licence_gang_et_territoire_gang\licence_gang\menugang.sqf'; ";
		x = 0.65; y = 0.350;
		w = 0.4;
	};
	class Info2: BaseRscSingleText
	{
		idc = 11158;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 1.05; y = 0.350;
		w = 0.1;
	};
	class cost2: BaseRscSingleText
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		text = "+ 100000 €";
		x = 1.15; y = 0.350;
		w = 0.15;
	};	
		class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.425;
		w = 0.65;
	};
};

class Menu_Faire_Peter_Sacoche_c4
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Faire_Peter_Sacoche_c4',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Faire_Peter_Sacoche_c4', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;

			x = 5.8 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.4 * GUI_GRID_W;
			h = 10.4 * GUI_GRID_H;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class class_titre: RscText
		{
			style = st_left;
			idc = 1004;

			text = "Selection de la sacoche de c4 ..."; //--- ToDo: Localize;
			x = 5.9 * GUI_GRID_W + GUI_GRID_X;
			y = 3.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.9 * GUI_GRID_W;
			h = 0.6 * GUI_GRID_H;
		};
		class combo_list: RscListBox
		{
							 
			idc = 1500;
			onLBDblClick = "[0,0,0,[1]] execVM ""divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\faire_peter_la_sacoche_c4.sqf"";";

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
			idc = 1701;

			text = " Fermer"; //--- ToDo: Localize;
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.2 * GUI_GRID_W;
			h = 0.6 * GUI_GRID_H;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;

			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 13.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class by_maxou: RscText
		{
			idc = 1003;

			text = "By Maxou"; //--- ToDo: Localize;
			x = 6.2 * GUI_GRID_W + GUI_GRID_X;
			y = 14.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			style = 2;
			idc = 1001;

			text = "Double cliquez pour faire peter ..."; //--- ToDo: Localize;
			x = 19.6 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.2 * GUI_GRID_W;
			h = 0.6 * GUI_GRID_H;
			colorText[] = {0,0.75,0.15,1};
		};
	};
};
