// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================



// ==================================== FUSILS ET PISTOLET ==================================
class Pistolet_Radar_Gendarmerie_SFP_Dialogue
{
	onLoad="uiNamespace setVariable ['Pistolet_Radar_Gendarmerie_SFP_Dialogue',_this select 0]"; onUnLoad="uiNamespace setVariable ['Pistolet_Radar_Gendarmerie_SFP_Dialogue', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3L_radargun\radargun.p3d";
		idc = -1; type = 82;	scale = 0.85;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class P_07_SFP
{
	onLoad="uiNamespace setVariable ['P_07_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['P_07_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\weapons_F\Pistols\P07\p07_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class Katiba_SFP
{
	onLoad="uiNamespace setVariable ['Katiba_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['Katiba_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F\Rifles\Khaybar\Khaybar_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class SDAR_SFP
{
	onLoad="uiNamespace setVariable ['SDAR_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['SDAR_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\weapons_f\Rifles\SDAR\SDAR_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class TRG_20_21_SFP
{
	onLoad="uiNamespace setVariable ['TRG_20_21_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['TRG_20_21_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\weapons_f\Rifles\TRG20\TRG20_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class RPG_32_SFP
{
	onLoad="uiNamespace setVariable ['RPG_32_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['RPG_32_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\weapons_f\launchers\RPG32\rpg32_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class ACP_C2_SFP
{
	onLoad="uiNamespace setVariable ['ACP_C2_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['ACP_C2_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Beta\Pistols\ACPC2\ACPC2_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class Titan_Model_SFP
{
	onLoad="uiNamespace setVariable ['Titan_Model_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['Titan_Model_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Beta\Launchers\Titan\Titan_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class EBR_SFP
{
	onLoad="uiNamespace setVariable ['EBR_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['EBR_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\weapons_F\LongRangeRifles\EBR\EBR_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class HK_417_S_SFP
{
	onLoad="uiNamespace setVariable ['EBR_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['EBR_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\hk417S_HG.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class HK_417_M_SFP
{
	onLoad="uiNamespace setVariable ['EBR_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['EBR_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\hk417M_HG.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class MK_200_SFP
{
	onLoad="uiNamespace setVariable ['MK_200_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['MK_200_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\weapons_f\Machineguns\M200\M200_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class MX_SFP
{
	onLoad="uiNamespace setVariable ['MX_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['MX_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F\Rifles\MX\MX_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class MXC_SFP
{
	onLoad="uiNamespace setVariable ['MXC_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['MXC_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F\Rifles\MX\MXC_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class MK_20_SFP
{
	onLoad="uiNamespace setVariable ['MK_20_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['MK_20_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_beta\Rifles\mk20\mk20_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class QUATRE_FIVE_SFP
{
	onLoad="uiNamespace setVariable ['QUATRE_FIVE_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['QUATRE_FIVE_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_EPA\Pistols\Pistol_heavy_01\Pistol_heavy_01_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class Z_UBR_SFP
{
	onLoad="uiNamespace setVariable ['Z_UBR_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['Z_UBR_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_EPA\Pistols\Pistol_heavy_02\Pistol_heavy_02_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class Pistolet_Lacrymo_Dialogue
{
	onLoad="uiNamespace setVariable ['Pistolet_Lacrymo_Dialogue',_this select 0]"; onUnLoad="uiNamespace setVariable ['Pistolet_Lacrymo_Dialogue', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "DDOPP_taserPack\taser_x3\DDOPP_x3_b";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class ROOK_SFP
{
	onLoad="uiNamespace setVariable ['ROOK_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['ROOK_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\weapons_F\Pistols\Rook40\Rook40_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class PDW_2000_SFP
{
	onLoad="uiNamespace setVariable ['PDW_2000_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['PDW_2000_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_gamma\Smgs\pdw2000\pdw2000_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class RAHIM_SFP
{
	onLoad="uiNamespace setVariable ['RAHIM_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['RAHIM_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_EPA\LongRangeRifles\DMR_01\DMR_01_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class STING_SFP
{
	onLoad="uiNamespace setVariable ['STING_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['STING_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_beta\Smgs\SMG_02\SMG_02_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class VERMIN_SFP
{
	onLoad="uiNamespace setVariable ['VERMIN_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['VERMIN_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_beta\Smgs\SMG_01\SMG_01_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class LRR_SFP
{
	onLoad="uiNamespace setVariable ['LRR_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['LRR_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F\LongRangeRifles\M320\M320_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class GM6_SFP
{
	onLoad="uiNamespace setVariable ['GM6_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['GM6_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F\LongRangeRifles\GM6\GM6_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\famas_F1.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_G2_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_G2_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_G2_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\Famas_G2.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_SURB_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_SURB_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_SURB_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\famas_surb.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_FELIN_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_FELIN_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_FELIN_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\Famas_felin.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class BOUCLIER_GIGN_SFP
{
	onLoad="uiNamespace setVariable ['BOUCLIER_GIGN_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['BOUCLIER_GIGN_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\shield\bouclier";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_FRF2_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_FRF2_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_FRF2_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\FRF2.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_PGM_DEUX_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_PGM_DEUX_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_PGM_DEUX_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\PGM_Hecate_II.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_M107_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_M107_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_M107_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\M107.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_MINIMI_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_MINIMI_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_MINIMI_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\Minimi.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class hk416M_HG_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_MINIMI_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_MINIMI_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\hk416M_HG.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_HK_417_L_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_HK_417_L_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_HK_417_L_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\hk417M.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_HK_416_M_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_HK_416_M_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_HK_416_M_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\hk416M.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_MP5_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_MP5_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_MP5_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\MP5SD.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_PAMAS_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_PAMAS_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_PAMAS_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\pamas.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class FAMAS_M4S90_SFP
{
	onLoad="uiNamespace setVariable ['FAMAS_M4S90_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['FAMAS_M4S90_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\M4S90.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class R3F_AT4CS_SFP
{
	onLoad="uiNamespace setVariable ['R3F_AT4CS_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['R3F_AT4CS_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\AT4CS_vide.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class R3F_FRF2_DES_SFP
{
	onLoad="uiNamespace setVariable ['R3F_FRF2_DES_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['R3F_FRF2_DES_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\FRF2_DES.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class R3F_HK417S_HG_DES_SFP
{
	onLoad="uiNamespace setVariable ['R3F_HK417S_HG_DES_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['R3F_HK417S_HG_DES_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\hk417S_HG.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class R3F_HK417M_HG_DES_SFP
{
	onLoad="uiNamespace setVariable ['R3F_HK417M_HG_DES_SFP',_this select 0]"; onUnLoad="uiNamespace setVariable ['R3F_HK417M_HG_DES_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\r3f_armes\hk417M_HG.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class arifle_AK12_F_SFP
{
	onLoad="uiNamespace setVariable ['arifle_AK12_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['arifle_AK12_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Rifles\AK12\AK12_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class arifle_AKM_F_SFP
{
	onLoad="uiNamespace setVariable ['arifle_AKM_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['arifle_AKM_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Rifles\AKM\AKM_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class arifle_AKS_F_SFP
{
	onLoad="uiNamespace setVariable ['arifle_AKS_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['arifle_AKS_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Rifles\AKS\AKS_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class arifle_CTAR_ghex_F_SFP
{
	onLoad="uiNamespace setVariable ['arifle_CTAR_ghex_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['arifle_CTAR_ghex_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Rifles\CTAR\CTAR_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class srifle_DMR_07_ghex_F_SFP
{
	onLoad="uiNamespace setVariable ['srifle_DMR_07_ghex_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['srifle_DMR_07_ghex_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\LongRangeRifles\DMR_07\DMR_07_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class LMG_03_F_SFP
{
	onLoad="uiNamespace setVariable ['LMG_03_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['LMG_03_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Machineguns\LMG_03\LMG_03_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class srifle_DMR_03_woodland_F_SFP
{
	onLoad="uiNamespace setVariable ['srifle_DMR_03_woodland_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['srifle_DMR_03_woodland_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Mark\LongRangeRifles\DMR_03\DMR_03_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class srifle_DMR_06_camo_F_SFP
{
	onLoad="uiNamespace setVariable ['srifle_DMR_06_camo_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['srifle_DMR_06_camo_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Mark\LongRangeRifles\DMR_06\DMR_06_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class arifle_SPAR_01_snd_F_SFP
{
	onLoad="uiNamespace setVariable ['arifle_SPAR_01_snd_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['arifle_SPAR_01_snd_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Rifles\SPAR_01\SPAR_01_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class arifle_SPAR_03_snd_F_SFP
{
	onLoad="uiNamespace setVariable ['arifle_SPAR_03_snd_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['arifle_SPAR_03_snd_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Rifles\SPAR_03\SPAR_03_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class launch_RPG7_F_SFP
{
	onLoad="uiNamespace setVariable ['launch_RPG7_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['launch_RPG7_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Launchers\RPG7\rpg7_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class SMG_05_F_SFP
{
	onLoad="uiNamespace setVariable ['SMG_05_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['SMG_05_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\SMGs\SMG_05\SMG_05_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class arifle_ARX_blk_F_SFP
{
	onLoad="uiNamespace setVariable ['arifle_ARX_blk_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['arifle_ARX_blk_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Rifles\ARX\ARX_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
class hgun_Pistol_01_F_SFP
{
	onLoad="uiNamespace setVariable ['hgun_Pistol_01_F_SFP',_this select 0]"; 
	onUnLoad="uiNamespace setVariable ['hgun_Pistol_01_F_SFP', nil]";
	idd = -1;movingEnable = 1;enableSimulation = 1;controlsBackground[] ={};objects[] =	{lobjet};controls[] ={Message_un, Message_deux};	
	class lobjet
	{
		model = "\A3\Weapons_F_Exp\Pistols\Pistol_01\Pistol_01_F.p3d";
		idc = -1; type = 82;	scale = 0.65;direction[] = {0.25, 0.04, 0.1};up[] = {1, 1, 0};position[] = {0, -0.043, 0.25};positionBack[] = {0, 0, 0.55};inBack = 1;enableZoom = 1;zoomDuration = 2;
	};
	class Message_un : BaseRscSingleText{idc = 11172;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.850;w = 0.700; h = 0.062;};
	class Message_deux : BaseRscSingleText{idc = 11173;moving = 1;colorBackground[] = { 0,0,0,0 };colorText[] = {1,1,1,1};sizeEx = 0.07; x = 0.440; y = 0.785;w = 0.700; h = 0.062;};
};
