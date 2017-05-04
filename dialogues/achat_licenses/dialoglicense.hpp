#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class CivLicenseMenu
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['CivLicenseMenu',_this select 0]";
	onUnLoad="uiNamespace setVariable ['CivLicenseMenu', nil]";
	
	class Controls
	{
		class Title: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = "Licences"; //--- ToDo: Localize;
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
		class license_permis_de_conduire_by_sfp_maxou: BaseRscButton
		{
			idc = -1;
			action = "execVM 'dialogues\achat_licenses\achat_permis_leger.sqf'";

			text = "Acheter permis leger"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 6.88 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
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
			idc = 31157;
			moving = 1;

			text = "VARIE"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 6.88 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class license_permis_de_conduire_poids_lourd_by_sfp_maxou: BaseRscButton
		{
			idc = -1;
			action = "execVM 'dialogues\achat_licenses\achat_permis_lourd.sqf'";

			text = "Acheter permis poid lourd"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 8.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
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
			idc = 21165;
			moving = 1;

			text = "VARIE"; //--- ToDo: Localize;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 8.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class HuntingLicense: BaseRscButton
		{
			idc = -1;
			action = "if (!isnil {player getvariable 'permis_de_chasse'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 3000) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 3000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['permis_de_chasse',true,true]; }};closeDialog 0;execVM 'menu\licensemenu.sqf'; ";

			text = "Acheter permis de chasse"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 10.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
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

			text = $3000;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 10.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class license_pilote_by_sfp_maxou: BaseRscButton
		{
			idc = -1;
			action = "if (!isnil {player getvariable 'license_pilote_news'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 25000) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 25000),true];  autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['license_pilote_news',true,true];}};closeDialog 0; execVM 'menu\licensemenu.sqf'; ";

			text = "Acheter licence pilote"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
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

			text = $25000;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class license_bateau_by_sfp_maxou: BaseRscButton
		{
			idc = -1;
			action = "if (!isnil {player getvariable 'licence_bateau_news'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 2125) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 2125),true];  autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_bateau_news',true,true];}};closeDialog 0; execVM 'menu\licensemenu.sqf'; ";

			text = "Acheter permis de bateaux"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 14.35 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info5: BaseRscSingleText
		{
			idc = 11160;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 14.35 * GUI_GRID_H + GUI_GRID_Y;
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

			text = $2125;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 14.35 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class OilprocessLicense: BaseRscButton
		{
			idc = -1;
			action = "if (!isnil {player getvariable 'licence_petrole'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 2000) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 2000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_petrole',true,true];}};closeDialog 0; execVM 'menu\licensemenu.sqf'; ";

			text = "Acheter license petrole"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 16.21 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info6: BaseRscSingleText
		{
			idc = 11162;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 16.22 * GUI_GRID_H + GUI_GRID_Y;
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

			text = $2000;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 16.22 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class licence_fusils: BaseRscButton
		{
			idc = -1;
			action = "if (isnil {player getvariable 'permis_port_d_arme'}) exitwith {['Warning',['Licence port d''arme obligatoire avant !']] call bis_fnc_showNotification;} ;if(!isnil {player getvariable 'licence_fusils'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 5425) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 5425),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_fusils',true,true];}};closeDialog 0; execVM 'menu\licensemenu.sqf'; ";

			text = "Acheter licence fusils"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 18.07 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info7: BaseRscSingleText
		{
			idc = 11163;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 18.06 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost7: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = $5425;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 18.06 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class permis_port_d_arme: BaseRscButton
		{
			idc = -1;
			action = "if(!isnil {player getvariable 'permis_port_d_arme'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 12633) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 12633),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['permis_port_d_arme',true,true];}};closeDialog 0; execVM 'menu\licensemenu.sqf'; ";

			text = "Acheter port d armes"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 19.94 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.2};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Info8: BaseRscSingleText
		{
			idc = 11164;
			moving = 1;

			x = 42 * GUI_GRID_W + GUI_GRID_X;
			y = 19.93 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.875 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class cost8: BaseRscSingleText
		{
			idc = -1;
			moving = 1;

			text = $12633;
			x = 46 * GUI_GRID_W + GUI_GRID_X;
			y = 19.93 * GUI_GRID_H + GUI_GRID_Y;
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
			x = 34.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.07,0.66,0.9};
			sizeEx = 1 * GUI_GRID_H;
		};
	};
};

class dialogue_licence_fusil_illegal
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['dialogue_licence_fusil_illegal',_this select 0]";
	onUnLoad="uiNamespace setVariable ['dialogue_licence_fusil_illegal', nil]";
	
	class Controls
	{
		class Title: RscText
		{
			idc = -1;
			moving = 1;

			text = "Licences"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.3306 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.04125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,1};
		};
		class InfoT: RscText
		{
			idc = -1;
			moving = 1;

			text = "Acquis"; //--- ToDo: Localize;
			x = 0.726875 * safezoneW + safezoneX;
			y = 0.3306 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.04125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,1};
		};
		class CostT: RscText
		{
			idc = -1;
			moving = 1;

			text = "Prix"; //--- ToDo: Localize;
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.3306 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.04125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,1};
		};
		class licence_fusils_illegaux: BaseRscButton
		{
			idc = -1;
			action = "if (!isnil {player getvariable 'licence_fusils_illegaux'}) then{['Warning',['Déja en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= 21450) then{player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - 21450),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_fusils_illegaux',true,true]; }};closeDialog 0;execVM 'menu\licensemenu_fusils_illegaux.sqf'; "; 

			text = "Acheter Licence Fusils Illegaux"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.37636 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.04125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.2};
		};
		class Info1: RscText
		{
			idc = 11157;
			moving = 1;

			x = 0.726875 * safezoneW + safezoneX;
			y = 0.37636 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.04125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,1};
		};
		class cost1: RscText
		{
			idc = 31157;
			moving = 1;

			text = "21450"; //--- ToDo: Localize;
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.37636 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.04125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,1};
		};
		class Close: BaseRscButton
		{
			idc = -1;
			action = "closeDialog 0";

			text = "  Fermer le menu"; //--- ToDo: Localize;
			x = 0.653655 * safezoneW + safezoneX;
			y = 0.4296 * safezoneH + safezoneY;
			w = 0.0928133 * safezoneW;
			h = 0.0264 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.9};
		};
	};
};