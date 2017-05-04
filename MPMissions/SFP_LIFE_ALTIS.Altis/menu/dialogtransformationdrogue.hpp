class dialogtransformationdrogue
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {Title,InfoT,CostT,Heroinelicense,Info1,Cost1,CannabisLicense,Info2,Cost2,Close};
	
class Title : BaseRscSingleText
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		text = "Formation";
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
		class Heroinelicense : BaseRscButton
	{
		idc = -1;
		text = "Formation traitement heroine";
		action = "if (!isnil {player getvariable 'licence_heroine'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= 12000) then{player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - 12000),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_heroine',true,true];}else {['Warning',['Pas assez d''argent !']] call bis_fnc_showNotification;};}; closedialog 0; execVM 'menu\dialogtransformationdrogue.sqf'; ";
		x = 0.65; y = 0.275;
		w = 0.4;
	};
	class Info1: BaseRscSingleText
	{
		idc = 77777;
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
		text = "12 000$";
		x = 1.15; y = 0.275;
		w = 0.15;
	};
		class CannabisLicense : BaseRscButton
	{
		idc = -1;
		text = "Formation traitement cannabis";
		action = "if (!isnil {player getvariable 'licence_cannabis'}) then{['Warning',['Déjà en possession !']] call bis_fnc_showNotification;}else{if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= 14200) then{player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - 14200),true]; autorisation_mouvement_argent = true; playSound 'son_mouvement_argent_sfp'; player setVariable['licence_cannabis',true,true];}else {['Warning',['Pas assez d''argent !']] call bis_fnc_showNotification;};}; closedialog 0; execVM 'menu\dialogtransformationdrogue.sqf'; ";
		x = 0.65; y = 0.350;
		w = 0.4;
	};
	class Info2: BaseRscSingleText
	{
		idc = 77778;
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
		text = "14 200$";
		x = 1.15; y = 0.350;
		w = 0.15;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.445;
		w = 0.65;
	};
};

