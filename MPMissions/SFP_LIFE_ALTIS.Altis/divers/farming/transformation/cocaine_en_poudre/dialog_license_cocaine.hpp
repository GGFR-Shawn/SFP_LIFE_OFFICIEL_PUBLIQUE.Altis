//--- Transformer_Cocaine
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)


class Formation_Laboratoire_Dialogue
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Formation_Laboratoire_Dialogue',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Formation_Laboratoire_Dialogue', nil]";
	
	class Controls
	{
		class Title: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "Formation Cocaine"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 4.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class InfoT: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "Acquis"; //--- ToDo: Localize;
			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 4.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class CostT: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "Prix"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 4.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class formation_cocaine_niveau_un: BaseRscButton
		{
			idc = -1;
			action = "if ((player getVariable 'experience_transformation_cocaine') >= 0) then{['Warning',['Déja en possession !']] call bis_fnc_showNotification;};closeDialog 0;execVM 'divers\farming\transformation\cocaine_en_poudre\action_license_cocaine.sqf';";

			text = "expérience de niveau 0"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 6.88 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.3};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info1: BaseRscSingleText
		{
			idc = 11157;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 6.88 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost1: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "0 €"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 6.88 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class formation_cocaine_niveau_deux: BaseRscButton
		{
			idc = -1;
			action = "if (player getvariable 'mon_argent_poche_by_sfp_maxou' < 5000) exitwith {hint 'Opération impossible, vous n''avez pas assez d''argent !';}; if (player getVariable 'experience_transformation_cocaine' >= 1) then{['Warning',['DÃ©jÃ  en possession !']] call bis_fnc_showNotification;} else {if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= 5000) then {['Ok_achat',['Formation obtenue !']] call bis_fnc_showNotification; player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - 5000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['experience_transformation_cocaine',1,false];};}; closeDialog 0;execVM 'divers\farming\transformation\cocaine_en_poudre\action_license_cocaine.sqf';";

			text = "expérience de niveau 1"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 8.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.3};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info2: BaseRscSingleText
		{
			idc = 11165;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 8.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost2: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "5 000 €"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 8.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class formation_cocaine_niveau_trois: BaseRscButton
		{
			idc = -1;
			action = "if (player getvariable 'experience_transformation_cocaine' < 1) exitwith {hint 'Opération impossible, il vous faut d''abord l''expérience de niveau 1 !';}; if (player getvariable 'mon_argent_poche_by_sfp_maxou' < 9000) exitwith {hint 'Opération impossible, vous n''avez pas assez d''argent !';}; if (player getVariable 'experience_transformation_cocaine' >= 2) then{['Warning',['DÃ©jÃ  en possession !']] call bis_fnc_showNotification;} else {if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= 9000) then {['Ok_achat',['Formation obtenue !']] call bis_fnc_showNotification; player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - 9000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['experience_transformation_cocaine',2,false];};}; closeDialog 0;execVM 'divers\farming\transformation\cocaine_en_poudre\action_license_cocaine.sqf';";

			text = "expérience de niveau 2"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 10.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.3};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info3: BaseRscSingleText
		{
			idc = 11158;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 10.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost3: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "9 000 €"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 10.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class formation_cocaine_niveau_quatre: BaseRscButton
		{
			idc = -1;
			action = "if (player getvariable 'experience_transformation_cocaine' < 2) exitwith {hint 'Opération impossible, il vous faut d''abord l''expérience de niveau 2 !';}; if (player getvariable 'mon_argent_poche_by_sfp_maxou' < 25000) exitwith {hint 'Opération impossible, vous n''avez pas assez d''argent !';}; if (player getVariable 'experience_transformation_cocaine' >= 3) then{['Warning',['DÃ©jÃ  en possession !']] call bis_fnc_showNotification;} else {if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= 25000) then {['Ok_achat',['Formation obtenue !']] call bis_fnc_showNotification; player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - 25000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['experience_transformation_cocaine',3,false];};}; closeDialog 0;execVM 'divers\farming\transformation\cocaine_en_poudre\action_license_cocaine.sqf';";

			text = "expérience de niveau 3"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.3};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info4: BaseRscSingleText
		{
			idc = 11159;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost4: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "25 000 €"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class formation_cocaine_niveau_cinq: BaseRscButton
		{
			idc = -1;
			action = "if (player getvariable 'experience_transformation_cocaine' < 3) exitwith {hint 'Opération impossible, il vous faut d''abord l''expérience de niveau 3 !';}; if (player getvariable 'mon_argent_poche_by_sfp_maxou' < 35000) exitwith {hint 'Opération impossible, vous n''avez pas assez d''argent !';}; if (player getVariable 'experience_transformation_cocaine' >= 4) then{['Warning',['DÃ©jÃ  en possession !']] call bis_fnc_showNotification;} else {if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= 35000) then {['Ok_achat',['Formation obtenue !']] call bis_fnc_showNotification; player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - 35000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['experience_transformation_cocaine',4,false];};}; closeDialog 0;execVM 'divers\farming\transformation\cocaine_en_poudre\action_license_cocaine.sqf';";

			text = "expérience de niveau 4"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 14.35 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.3};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info5: BaseRscSingleText
		{
			idc = 11160;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 14.31 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost5: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "35 000 €"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 14.31 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class formation_cocaine_niveau_six: BaseRscButton
		{
			idc = -1;
			action = "if (player getvariable 'experience_transformation_cocaine' < 4) exitwith {hint 'Opération impossible, il vous faut d''abord l''expérience de niveau 4 !';}; if (player getvariable 'mon_argent_poche_by_sfp_maxou' < 50000) exitwith {hint 'Opération impossible, vous n''avez pas assez d''argent !';}; if (player getVariable 'experience_transformation_cocaine' >= 5) then{['Warning',['DÃ©jÃ  en possession !']] call bis_fnc_showNotification;} else {if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= 50000) then {['Ok_achat',['Formation obtenue !']] call bis_fnc_showNotification; player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - 50000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['experience_transformation_cocaine',5,false];};}; closeDialog 0;execVM 'divers\farming\transformation\cocaine_en_poudre\action_license_cocaine.sqf';";

			text = "expérience de niveau 5"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 16.22 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.3};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info6: BaseRscSingleText
		{
			idc = 11162;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 16.18 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost6: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "50 000 €"; //--- ToDo: Localize;
			x = 45.96 * GUI_GRID_W + GUI_GRID_X;
			y = 16.18 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Close: BaseRscButton
		{
			idc = -1;
			action = "closeDialog 0";

			text = "  Fermer le menu"; //--- ToDo: Localize;
			x = 35 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
	};
};