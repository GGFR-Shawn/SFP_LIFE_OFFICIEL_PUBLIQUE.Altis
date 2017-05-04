// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

class RscXSlider_tablette_sfp_slider
{
	style = 1024;
	type = 43;
	shadow = 2;
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.400000;
	color[] = {1, 1, 1, 0.7};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.500000};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};
class RscButton_tablette_sfp_en_bas
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0,0,0,0};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	idc = -1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};
class Rsc_texte_tablette_sfp_en_bas
{
	deletable = 0;
	fade = 0;
	type = 11;
	x = 0.1;
	y = 0.1;
    colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.7};
	colorBackground[] = {-1,-1,-1,-1};
	colorText[] = {1,1,1,0.7};
    color[] = {1,1,1,0.7};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	class Attributes
	{
		font = "RobotoCondensedBold";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	textSecondary = "";
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "RobotoCondensedBold";
	font = "RobotoCondensedBold";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class AttributesImage
	{
		// font = "RobotoCondensed";
		font = "RobotoCondensedBold";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscText_tablette_sfp_titre
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0,0,0,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 0;
	colorShadow[] = {1,0,0,0.5};
	font = "RobotoCondensedBold";
	// SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	SizeEx = 0.040;
	linespacing = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscText_tablette_sfp_texte 
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 11;
	idc = -1;
    colorActive[] = {0.13,0.14,0.91,1};
	colorDisabled[] = {0,0,0,0.4};
	colorBackground[] = {-1,-1,-1,-1};
	colorText[] = {-1,-1,-1,-1};
    color[] = {-1,-1,-1,-1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = {-1,-1,-1,-1};
	font = "PuristaMedium";
	// SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	SizeEx = 0.04;
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
	soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
	action = "";
};

// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================
// =======================================================================================================================================================================================

class Menu_tablette_sfp_accueil
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_accueil',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_accueil', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_qualite_herbe: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "HERBE :"; //--- ToDo: Localize;
			x = 0.542295 * safezoneW + safezoneX;
			y = 0.295356 * safezoneH + safezoneY;
			w = 0.065032 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_fumee_incendie_oui: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "FUMEE INCENDIE :"; //--- ToDo: Localize;
			x = 0.563956 * safezoneW + safezoneX;
			y = 0.326163 * safezoneH + safezoneY;
			w = 0.206296 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_effet_de_balle: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "EFFET BALLE :"; //--- ToDo: Localize;
			x = 0.570147 * safezoneW + safezoneX;
			y = 0.35917 * safezoneH + safezoneY;
			w = 0.206296 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_slider_a_pied: RscXSlider_tablette_sfp_slider
		{
			idc = 2901;
			onSliderPosChanged = "[0,_this select 1] execvm 'divers\tablette_sfp\distance_de_vue_tablette.sqf';";

			text = "curseur a piedddddddddddddddddddddddddddddddddddddddddddddd"; //--- ToDo: Localize;
			x = 0.566013 * safezoneW + safezoneX;
			y = 0.585819 * safezoneH + safezoneY;
			w = 0.119652 * safezoneW;
			h = 0.0176037 * safezoneH;
			tooltip = "Distance de vue a pied."; //--- ToDo: Localize;
		};
		class tablette_sfp_slider_valeur_a_pied: RscText_tablette_sfp_texte
		{
			idc = 2902;

			text = "valeur a pieddddddddddddddddddddddddddddddddddddddddddddddd"; //--- ToDo: Localize;
			x = 0.689786 * safezoneW + safezoneX;
			y = 0.579217 * safezoneH + safezoneY;
			w = 0.105211 * safezoneW;
			h = 0.0220047 * safezoneH;
		};
		class tablette_sfp_slider_en_voiture: RscXSlider_tablette_sfp_slider
		{
			idc = 2911;
			onSliderPosChanged = "[1,_this select 1] execvm 'divers\tablette_sfp\distance_de_vue_tablette.sqf';";

			text = "curseur en voitureeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"; //--- ToDo: Localize;
			x = 0.566013 * safezoneW + safezoneX;
			y = 0.616625 * safezoneH + safezoneY;
			w = 0.119652 * safezoneW;
			h = 0.0176037 * safezoneH;
			tooltip = "Distance de vue en voiture."; //--- ToDo: Localize;
		};
		class tablette_sfp_slider_valeur_en_voiture: RscText_tablette_sfp_texte
		{
			idc = 2912;

			text = "valeur en voitureeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"; //--- ToDo: Localize;
			x = 0.689786 * safezoneW + safezoneX;
			y = 0.612224 * safezoneH + safezoneY;
			w = 0.0876758 * safezoneW;
			h = 0.0220047 * safezoneH;
		};
		class tablette_sfp_slider_en_air: RscXSlider_tablette_sfp_slider
		{
			idc = 2921;
			onSliderPosChanged = "[2,_this select 1] execvm 'divers\tablette_sfp\distance_de_vue_tablette.sqf';";

			text = "curseur_dans_les_airssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"; //--- ToDo: Localize;
			x = 0.566013 * safezoneW + safezoneX;
			y = 0.649632 * safezoneH + safezoneY;
			w = 0.119652 * safezoneW;
			h = 0.0176037 * safezoneH;
			tooltip = "Distance de vue dans les airs."; //--- ToDo: Localize;
		};
		class tablette_sfp_slider_valeur_en_air: RscText_tablette_sfp_texte
		{
			idc = 2922;

			text = "valeur dans le cielllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll"; //--- ToDo: Localize;
			x = 0.689786 * safezoneW + safezoneX;
			y = 0.645231 * safezoneH + safezoneY;
			w = 0.0732351 * safezoneW;
			h = 0.0220047 * safezoneH;
		};
		class tablette_sfp_qualite_herbe_non: RscText_tablette_sfp_texte
		{
			action = "['none'] execvm 'divers\tablette_sfp\qualite_herbe_tablette_sfp.sqf';";
			idc = 1020;

			text = "Rien"; //--- ToDo: Localize;
			x = 0.573229 * safezoneW + safezoneX;
			y = 0.295356 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_qualite_herbe_faible: RscText_tablette_sfp_texte
		{
			action = "['low'] execvm 'divers\tablette_sfp\qualite_herbe_tablette_sfp.sqf';";
			idc = 1021;

			text = "Faible"; //--- ToDo: Localize;
			x = 0.595923 * safezoneW + safezoneX;
			y = 0.295356 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_qualite_herbe_normal: RscText_tablette_sfp_texte
		{
			action = "['norm'] execvm 'divers\tablette_sfp\qualite_herbe_tablette_sfp.sqf';";
			idc = 1022;

			text = "Normale"; //--- ToDo: Localize;
			x = 0.622736 * safezoneW + safezoneX;
			y = 0.295356 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_qualite_herbe_eleve: RscText_tablette_sfp_texte
		{
			action = "['high'] execvm 'divers\tablette_sfp\qualite_herbe_tablette_sfp.sqf';";
			idc = 1023;

			text = "Dense"; //--- ToDo: Localize;
			x = 0.660905 * safezoneW + safezoneX;
			y = 0.295356 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_fumee_incendie_oui_action: RscText_tablette_sfp_texte
		{
			action = "je_desactive_les_incendies = 0;hint 'Les fumees des incendies ont bien etees activees ! Sache qu''elles le sont automatiquement a chaque reconnection.';";
			idc = 1024;

			text = "Oui"; //--- ToDo: Localize;
			x = 0.631002 * safezoneW + safezoneX;
			y = 0.326163 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Active la fumée des incendies scriptés."; //--- ToDo: Localize;
		};
		class tablette_sfp_fumee_incendie_non: RscText_tablette_sfp_texte
		{
			action = "je_desactive_les_incendies = 1;hint 'Les fumees des incendies ont bien etees desactivees ! Cette option prendra effet sur le prochain incendie.';";
			idc = 1025;

			text = "Non"; //--- ToDo: Localize;
			x = 0.649567 * safezoneW + safezoneX;
			y = 0.326163 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Désactive la fumée des incendies scriptés."; //--- ToDo: Localize;
		};
		class tablette_sfp_ajouter_effet_balle: RscText_tablette_sfp_texte
		{
			onButtonClick = "execvm 'divers\effet_de_balle\ajout_arme_effet_de_balle.sqf';";
			idc = 1033;

			text = "Oui"; //--- ToDo: Localize;
			x = 0.623773 * safezoneW + safezoneX;
			y = 0.35917 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Pour ajouter un effet lors d un tir sur l arme actuel !"; //--- ToDo: Localize;
		};
		class tablette_sfp_enlever_effet_balle: RscText_tablette_sfp_texte
		{
			onButtonClick = "execvm 'divers\effet_de_balle\supprimer_arme_effet_de_balle.sqf';";
			idc = 1034;

			text = "Non"; //--- ToDo: Localize;
			x = 0.640275 * safezoneW + safezoneX;
			y = 0.35917 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Pour enlever l effet de balle sur l arme actuel !"; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_admin: Rsc_texte_tablette_sfp_en_bas
		{
			onButtonClick = "execvm 'divers\hud\admin\dialog_admin_ouverture.sqf';closeDialog 0;";
			idc = 1035;

			text = "Admin"; //--- ToDo: Localize;
			x = 0.295794 * safezoneW + safezoneX;
			y = 0.781661 * safezoneH + safezoneY;
			w = 0.0443557 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.1};
			tooltip = "Accessible que par le STAFF."; //--- ToDo: Localize;
		};
		class tablette_sfp_texte_intro_serveur: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "INTRO SERVEUR :"; //--- ToDo: Localize;
			x = 0.561881 * safezoneW + safezoneX;
			y = 0.389974 * safezoneH + safezoneY;
			w = 0.206296 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class tablette_sfp_boutton_voir_mes_maisons: RscText_tablette_sfp_texte
		{
			onButtonClick = "execvm 'divers\achat_de_maison\mes_maisons\voir_mes_maisons.sqf';";
			idc = 1038;

			text = "Activer"; //--- ToDo: Localize;
			x = 0.399941 * safezoneW + safezoneX;
			y = 0.387777 * safezoneH + safezoneY;
			w = 0.115526 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Voir sur la carte vos maisons."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_desactiver_astuces_ecran: RscText_tablette_sfp_titre
		{
			idc = 1041;

			text = "ASTUCES ECRAN :"; //--- ToDo: Localize;
			x = 0.561886 * safezoneW + safezoneX;
			y = 0.420781 * safezoneH + safezoneY;
			w = 0.206296 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_boutton_activer_astuces_ecran: RscText_tablette_sfp_texte
		{
			action = "desactiver_message_infos_ecran = 0; hint 'Les astuces ont bien etes actives. (Une deco reco est obligatoire pour revoir certains messages.)';";
			idc = 1025;

			text = "Oui"; //--- ToDo: Localize;
			x = 0.630989 * safezoneW + safezoneX;
			y = 0.420781 * safezoneH + safezoneY;
			w = 0.0350703 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Cette fonction active les messages d informations qui s affichent au milieu de votre ecran."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_desactiver_astuces_ecran_ok: RscText_tablette_sfp_texte
		{
			action = "desactiver_message_infos_ecran = 1;hint 'Les astuces ont bien eté desactivées.';";
			idc = 1024;

			text = "Non"; //--- ToDo: Localize;
			x = 0.648535 * safezoneW + safezoneX;
			y = 0.420784 * safezoneH + safezoneY;
			w = 0.0381648 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Cette fonction désactive les messages d informations qui s affichent au milieu de votre écran."; //--- ToDo: Localize;
		};
		class tablette_sfp_ombrage: RscXSlider_tablette_sfp_slider
		{
			idc = 3922;
			onSliderPosChanged = "[3,_this select 1] execvm 'divers\tablette_sfp\distance_de_vue_tablette.sqf';";

			text = "curseur globalllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll"; //--- ToDo: Localize;
			x = 0.566013 * safezoneW + safezoneX;
			y = 0.682638 * safezoneH + safezoneY;
			w = 0.119652 * safezoneW;
			h = 0.0176037 * safezoneH;
		};
		class tablette_sfp_reglage_distance_tous_ombre: RscText_tablette_sfp_texte
		{
			idc = 3902;

			text = "valeur globallllllllllllllllllllllllllllllllllllllllllllllllllllll"; //--- ToDo: Localize;
			x = 0.689786 * safezoneW + safezoneX;
			y = 0.678237 * safezoneH + safezoneY;
			w = 0.105211 * safezoneW;
			h = 0.0220047 * safezoneH;
		};
		class tablette_sfp_boutton_voir_ma_carte: RscText_tablette_sfp_texte
		{
			onButtonClick = "execvm 'divers\services_publiques\declaration_mairie_et_carte_identite\voir_ma_carte_identite.sqf'; closedialog 0;";
			idc = 1045;

			text = "Voir /"; //--- ToDo: Localize;
			x = 0.365905 * safezoneW + safezoneX;
			y = 0.290956 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Regarder votre carte d identité."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_refaire_ma_carte: RscText_tablette_sfp_texte
		{
			onButtonClick = "execvm 'divers\services_publiques\declaration_mairie_et_carte_identite\refaire_ma_carte_identite.sqf';";
			idc = 1046;

			text = "Refaire Ma Carte"; //--- ToDo: Localize;
			x = 0.388599 * safezoneW + safezoneX;
			y = 0.293156 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Refaire votre carte d identité."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_menu_groupe: Rsc_texte_tablette_sfp_en_bas
		{
			onButtonClick = "execvm 'divers\groupe_des_joueurs\creation_menu.sqf';";
			idc = 1048;

			text = "Groupe"; //--- ToDo: Localize;
			x = 0.334976 * safezoneW + safezoneX;
			y = 0.781661 * safezoneH + safezoneY;
			w = 0.0464187 * safezoneW;
			h = 0.0220047 * safezoneH;
			tooltip = "Pour vous grouper entre joueurs."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_izik: Rsc_texte_tablette_sfp_en_bas
		{
			onButtonClick = "closedialog 0; execvm 'divers\izik\initialisation_izik.sqf';";
			idc = 1049;

			text = "Izik"; //--- ToDo: Localize;
			x = 0.375187 * safezoneW + safezoneX;
			y = 0.781661 * safezoneH + safezoneY;
			w = 0.0608597 * safezoneW;
			h = 0.0220047 * safezoneH;
			tooltip = "Jouer de la musique tout en jouant."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_joueur_animation: RscText_tablette_sfp_texte
		{
			onButtonClick = "execvm 'divers\faire_les_animations\initialisation_animation.sqf';";
			idc = 1051;

			text = "Activer"; //--- ToDo: Localize;
			x = 0.406128 * safezoneW + safezoneX;
			y = 0.326163 * safezoneH + safezoneY;
			w = 0.0783951 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Jouer une animation sur votre personnage."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_placer_objets: RscText_tablette_sfp_texte
		{
			onButtonClick = "execvm 'divers\poser_objets\dialog_creation_objet.sqf';";
			idc = 1052;

			text = "Activer"; //--- ToDo: Localize;
			x = 0.387559 * safezoneW + safezoneX;
			y = 0.35697 * safezoneH + safezoneY;
			w = 0.0660172 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Poser un objet au sol."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_casier_judiciaire: RscText_tablette_sfp_texte
		{
			onButtonClick = "[0,0,0,[0]] execvm 'divers\gendarmerie\wanted_liste\check_wanted_liste_nouveau.sqf';";
			idc = 1050;

			text = "Lire"; //--- ToDo: Localize;
			x = 0.388585 * safezoneW + safezoneX;
			y = 0.475788 * safezoneH + safezoneY;
			w = 0.0753006 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "AccÃ¨s à votre casier judiciaire."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_auto_fps: Rsc_texte_tablette_sfp_en_bas
		{
			onButtonClick = "execvm 'divers\hud\admin\auto_fps_maxou_sfp\menu_auto_fps.sqf';";
			idc = 1035;

			text = "FPS"; //--- ToDo: Localize;
			x = 0.264865 * safezoneW + safezoneX;
			y = 0.781661 * safezoneH + safezoneY;
			w = 0.0381667 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.1};
			tooltip = "Réglage automatique de vos FPS."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_center_sur_la_carte: RscText_tablette_sfp_titre
		{
			idc = 1041;

			text = "CENTRER CARTE/POSITION :"; //--- ToDo: Localize;
			x = 0.542283 * safezoneW + safezoneX;
			y = 0.449388 * safezoneH + safezoneY;
			w = 0.206296 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_boutton_center_sur_la_carte_oui: RscText_tablette_sfp_texte
		{
			action = "['centrage_carte', true] call uid_sauvegarde_ecrire_local_joueur_sfp; hint 'La valeur du centrage automatique de votre position sur votre carte a bien été sauvegardée.';";
			idc = 1025;

			text = " Oui"; //--- ToDo: Localize;
			x = 0.646466 * safezoneW + safezoneX;
			y = 0.449388 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "A l ouverture de votre map, celle ci sera centrée automatiquement sur vous."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_center_sur_la_carte_non: RscText_tablette_sfp_texte
		{
			action = "['centrage_carte', false] call uid_sauvegarde_ecrire_local_joueur_sfp; hint 'La valeur du centrage automatique de votre position sur votre carte a bien été sauvegardée.';";
			idc = 1025;

			text = " Non"; //--- ToDo: Localize;
			x = 0.663999 * safezoneW + safezoneX;
			y = 0.449388 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "A l ouverture de votre map, celle ci ne sera plus centrée automatiquement sur vous."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_carte_hud: RscText_tablette_sfp_titre
		{
			idc = 1041;

			text = "MINI CARTE HUD :"; //--- ToDo: Localize;
			x = 0.561886 * safezoneW + safezoneX;
			y = 0.480188 * safezoneH + safezoneY;
			w = 0.206296 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_boutton_oui_carte_hud: RscText_tablette_sfp_texte
		{
			action = "['mini_carte_hud', true] call uid_sauvegarde_ecrire_local_joueur_sfp; hint 'La mini carte sera affichée à votre prochaine connexion.';";

			idc = 1065;
			text = " Oui"; //--- ToDo: Localize;
			x = 0.630989 * safezoneW + safezoneX;
			y = 0.480188 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Affiche la mini carte sur le hud (reconnexion au serveur requise pour prise effet)"; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_non_carte_hud: RscText_tablette_sfp_texte
		{
			action = "['mini_carte_hud', false] call uid_sauvegarde_ecrire_local_joueur_sfp; hint 'La mini carte ne sera pas affichée à votre prochaine connexion.';";

			idc = 1066;
			text = " Non"; //--- ToDo: Localize;
			x = 0.648522 * safezoneW + safezoneX;
			y = 0.480188 * safezoneH + safezoneY;
			w = 0.113463 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Desactive affichage de la mini carte sur le hud (reconnexion au serveur requise pour prise effet)"; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_intro_serveur_oui: RscText_tablette_sfp_texte
		{
			action = "['intro_serveur', true] call uid_sauvegarde_ecrire_local_joueur_sfp; hint 'La musique et le message d''intro ont étés désactivés.';";
			idc = 1024;

			text = "Non"; //--- ToDo: Localize;
			x = 0.646472 * safezoneW + safezoneX;
			y = 0.389977 * safezoneH + safezoneY;
			w = 0.0381648 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Cette fonction désactive la musique d intro du serveur."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_intro_serveur_non: RscText_tablette_sfp_texte
		{
			action = "['intro_serveur', false] call uid_sauvegarde_ecrire_local_joueur_sfp; hint 'La musique et le message d''intro ont étés activés.';";
			idc = 1025;

			text = "Oui"; //--- ToDo: Localize;
			x = 0.629957 * safezoneW + safezoneX;
			y = 0.389977 * safezoneH + safezoneY;
			w = 0.0350703 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Cette fonction active la musique d intro du serveur."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_tenue_entreprise: RscText_tablette_sfp_texte
		{
			onButtonClick = "['2'] execvm 'divers\onRespawn_habbit_aleatoire.sqf';";
			idc = 1065;

			text = "Enfiler"; //--- ToDo: Localize;
			x = 0.397875 * safezoneW + safezoneX;
			y = 0.418584 * safezoneH + safezoneY;
			w = 0.0876783 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Remet votre tenue entreprise ou gendarme."; //--- ToDo: Localize;
		};
		class tablette_sfp_texte_carte_identite: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "CARTE IDENTITE :"; //--- ToDo: Localize;
			x = 0.301612 * safezoneW + safezoneX;
			y = 0.294384 * safezoneH + safezoneY;
			w = 0.065032 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_texte_jouer_animation: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "JOUER UN MOUVEMENT :"; //--- ToDo: Localize;
			x = 0.312291 * safezoneW + safezoneX;
			y = 0.325626 * safezoneH + safezoneY;
			w = 0.106289 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_texte_poser_objets: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "POSER OBJETS :"; //--- ToDo: Localize;
			x = 0.325668 * safezoneW + safezoneX;
			y = 0.356967 * safezoneH + safezoneY;
			w = 0.106289 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_texte_voir_mes_logements: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "VOIR MES LOGEMENTS :"; //--- ToDo: Localize;
			x = 0.311232 * safezoneW + safezoneX;
			y = 0.387774 * safezoneH + safezoneY;
			w = 0.106289 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_texte_tenue_entreprise: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "TENUE ENTREPRISE :"; //--- ToDo: Localize;
			x = 0.319481 * safezoneW + safezoneX;
			y = 0.418581 * safezoneH + safezoneY;
			w = 0.106289 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_boutton_mon_casier: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "MON CASIER :"; //--- ToDo: Localize;
			x = 0.335978 * safezoneW + safezoneX;
			y = 0.475788 * safezoneH + safezoneY;
			w = 0.106289 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_logo_sms: RscPicture
		{
			idc = 1201;
			text = "textures\tablette_sfp\SMS.paa";
			x = 0.277188 * safezoneW + safezoneX;
			y = 0.621026 * safezoneH + safezoneY;
			w = 0.0309444 * safezoneW;
			h = 0.0528112 * safezoneH;
		};
		class tablette_sfp_logo_amis: RscPicture
		{
			idc = 1202;
			text = "textures\tablette_sfp\amis.paa";
			x = 0.309151 * safezoneW + safezoneX;
			y = 0.621026 * safezoneH + safezoneY;
			w = 0.0309444 * safezoneW;
			h = 0.0528112 * safezoneH;
		};
		class tablette_sfp_logo_reglage: RscPicture
		{
			idc = 1203;
			text = "textures\tablette_sfp\reglage.paa";
			x = 0.341113 * safezoneW + safezoneX;
			y = 0.621026 * safezoneH + safezoneY;
			w = 0.0309444 * safezoneW;
			h = 0.0528112 * safezoneH;
		};
		class tablette_sfp_logo_jeter: RscPicture
		{
			idc = 1204;
			text = "textures\tablette_sfp\jeter.paa";
			x = 0.372044 * safezoneW + safezoneX;
			y = 0.621026 * safezoneH + safezoneY;
			w = 0.0309444 * safezoneW;
			h = 0.0528112 * safezoneH;
		};
		class tablette_sfp_logo_astuces: RscPicture
		{
			idc = 1205;
			text = "textures\tablette_sfp\astuces.paa";
			x = 0.405039 * safezoneW + safezoneX;
			y = 0.621026 * safezoneH + safezoneY;
			w = 0.0309444 * safezoneW;
			h = 0.0528112 * safezoneH;
		};
		class tablette_sfp_logo_park: RscPicture
		{
			idc = 1206;
			text = "textures\tablette_sfp\park.paa";
			x = 0.437009 * safezoneW + safezoneX;
			y = 0.621026 * safezoneH + safezoneY;
			w = 0.0309444 * safezoneW;
			h = 0.0528112 * safezoneH;
		};
		class tablette_sfp_boutton_sms: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "execvm 'divers\tablette_sfp\menu_telephone_tablette_sfp.sqf';";

			idc = 1012;
			x = 0.282343 * safezoneW + safezoneX;
			y = 0.629827 * safezoneH + safezoneY;
			w = 0.0216609 * safezoneW;
			h = 0.0374077 * safezoneH;
			tooltip = "Le menu de votre téléphone portable."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_astuces: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "hint 'Rien pour le moment ...';";

			idc = 1032;
			x = 0.41026 * safezoneW + safezoneX;
			y = 0.627626 * safezoneH + safezoneY;
			w = 0.0216609 * safezoneW;
			h = 0.0418087 * safezoneH;
			tooltip = "Aucuns réglages pour le moment."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_park: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "createdialog 'Menu_tablette_sfp_dialogue_vehicule'; ((uiNamespace getVariable 'Menu_tablette_sfp_dialogue_vehicule') displayCtrl 1100) ctrlSetStructuredText parseText '<t align=''center'' color=''#fe0728'' size=''1''>-------------------------------------------------------------------------------------------------------------------- <br/> ! ATTENTION ! <br/> --------------------------------------------------------------------------------------------------------------------<br/><br/> Seul le farming légal est sauvegardable ici (lapins, or, etc) ! <br/><br/>	Donc pas de redbull, farming illégal etc ici ou vous allez vous retrouver avec l''espace utilisé beuggué de votre véhicule !<t' "; 

			idc = 1038;
			x = 0.442235 * safezoneW + safezoneX;
			y = 0.629827 * safezoneH + safezoneY;
			w = 0.0216609 * safezoneW;
			h = 0.0374077 * safezoneH;
			tooltip = "Le menu pour gérer vos véhicules."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_reglage: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "execvm 'menu\configuration_du_serveur.sqf';";

			idc = 1039;
			x = 0.346308 * safezoneW + safezoneX;
			y = 0.627626 * safezoneH + safezoneY;
			w = 0.0216609 * safezoneW;
			h = 0.0396082 * safezoneH;
			tooltip = "Les réglages du serveur"; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_jeter: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "[0,0,0,['1']] execVM 'divers\inventory.sqf';";

			idc = 1042;
			x = 0.377254 * safezoneW + safezoneX;
			y = 0.629829 * safezoneH + safezoneY;
			w = 0.0216609 * safezoneW;
			h = 0.0374077 * safezoneH;
			tooltip = "Votre inventaire personnel."; //--- ToDo: Localize;
		};
		class tablette_sfp_boutton_amis: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "execvm 'divers\telephone_by_sfp_maxou\mon_repertoire_telephonique.sqf';";

			idc = 1045;
			x = 0.314335 * safezoneW + safezoneX;
			y = 0.629829 * safezoneH + safezoneY;
			w = 0.0206294 * safezoneW;
			h = 0.0374077 * safezoneH;
			tooltip = "La liste de vos amis sur l ile."; //--- ToDo: Localize;
		};
		class tablette_sfp_texte_fin_service: RscText_tablette_sfp_titre
		{
			idc = -1;

			text = "FIN SERVICE :"; //--- ToDo: Localize;
			x = 0.331854 * safezoneW + safezoneX;
			y = 0.447181 * safezoneH + safezoneY;
			w = 0.106289 * safezoneW;
			h = 0.0264056 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_boutton_fin_de_service: RscText_tablette_sfp_texte
		{
			onButtonClick = "[] execvm 'divers\nos_entreprises\fin_de_service_entreprise.sqf';";

			idc = 1008;
			text = "Activer"; //--- ToDo: Localize;
			x = 0.385826 * safezoneW + safezoneX;
			y = 0.447637 * safezoneH + safezoneY;
			w = 0.0876783 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "Terminer votre prise de service au sein de la DIR/POMPIER/AVOCAT/ECT ...."; //--- ToDo: Localize;
		};
	};
};

class Menu_tablette_sfp_Jouer_Animation
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Jouer_Animation',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Jouer_Animation', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class Titre: RscText
		{
			style = 2;
			idc = 1004;

			text = "Liste des animations"; //--- ToDo: Localize;
			x = 0.283905 * safezoneW + safezoneX;
			y = 0.26411 * safezoneH + safezoneY;
			w = 0.431073 * safezoneW;
			h = 0.0325788 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class combo_list: RscListBox
		{
			idc = 1500;

			text = "combo"; //--- ToDo: Localize;
			x = 0.309898 * safezoneW + safezoneX;
			y = 0.307899 * safezoneH + safezoneY;
			w = 0.373358 * safezoneW;
			h = 0.396209 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class Boutton_Jouer: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\faire_les_animations\jouer_lanimation.sqf';";
			style = 2;
			idc = 1700;

			text = "Jouer !"; //--- ToDo: Localize;
			x = 0.525787 * safezoneW + safezoneX;
			y = 0.713445 * safezoneH + safezoneY;
			w = 0.0825948 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\faire_les_animations\arreter_l_animation_quand_bug.sqf';";
			style = 2;
			idc = 1702;

			text = "Arreter !"; //--- ToDo: Localize;
			x = 0.612431 * safezoneW + safezoneX;
			y = 0.713445 * safezoneH + safezoneY;
			w = 0.0825948 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Poser_Objets
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Poser_Objets',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Poser_Objets', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class combo_list: RscListBox
		{
			onLBDblClick = "[_this] execVM 'divers\poser_objets\achats_objets.sqf';";
			idc = 1500;

			text = "combo"; //--- ToDo: Localize;
			x = 0.298861 * safezoneW + safezoneX;
			y = 0.31296 * safezoneH + safezoneY;
			w = 0.401208 * safezoneW;
			h = 0.427016 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class Texte_titre: RscText
		{
			style = 2;
			idc = 1004;

			text = "Poser Objets"; //--- ToDo: Localize;
			x = 0.283905 * safezoneW + safezoneX;
			y = 0.26411 * safezoneH + safezoneY;
			w = 0.431073 * safezoneW;
			h = 0.0325788 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Choix_Telephone
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Choix_Telephone',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Choix_Telephone', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class Boutton_Chat_SMS: RscShortcutButton
		{
			onButtonClick = "execvm 'divers\telephone_by_sfp_maxou\init_chat.sqf';";
			style = 2;
			idc = 1702;

			text = "Envoyer SMS ..."; //--- ToDo: Localize;
			x = 0.350445 * safezoneW + safezoneX;
			y = 0.532974 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class Boutton_Jeter_Telephone: RscShortcutButton
		{
			onButtonClick = "[1] execvm 'divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_action_par_menu.sqf';";
			style = 2;
			idc = 1702;

			text = "Jeter Votre Telephone ..."; //--- ToDo: Localize;
			x = 0.505117 * safezoneW + safezoneX;
			y = 0.455971 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class Boutton_Allumer_Eteindre_Telephone: RscShortcutButton
		{
			onButtonClick = "[2] execvm 'divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_action_par_menu.sqf';";
			style = 2;
			idc = 1702;

			text = "Allumer/Eteindre Telephone ..."; //--- ToDo: Localize;
			x = 0.35045 * safezoneW + safezoneX;
			y = 0.455967 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class message_explication: RscText
		{
			size = 0.040;
			type = CT_STRUCTURED_TEXT;

			idc = 1005;
			text = "Message explication"; //--- ToDo: Localize;
			x = 0.291182 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.418591 * safezoneW;
			h = 0.1756 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			onButtonClick = "['0'] execVM 'divers\telephone_by_sfp_maxou\donner_ou_changer_numero_de_tel.sqf';";
			style = ST_CENTER;

			idc = 1704;
			text = "Donner Mon Numero"; //--- ToDo: Localize;
			x = 0.505117 * safezoneW + safezoneX;
			y = 0.495571 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1708: RscShortcutButton
		{
			onButtonClick = "['1'] execVM 'divers\telephone_by_sfp_maxou\donner_ou_changer_numero_de_tel.sqf';";
			style = ST_CENTER;

			idc = 1708;
			text = "Changer Mon Numero"; //--- ToDo: Localize;
			x = 0.35045 * safezoneW + safezoneX;
			y = 0.495571 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1709: RscShortcutButton
		{
			onButtonClick = "['1'] execVM 'divers\telephone_by_sfp_maxou\mon_repertoire_telephonique.sqf';";
			style = ST_CENTER;

			idc = 1709;
			text = "Mon Repertoire"; //--- ToDo: Localize;
			x = 0.350445 * safezoneW + safezoneX;
			y = 0.570376 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class Boutton_Historique_Messages: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\nouveau_historique\init_historique.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Historiques"; //--- ToDo: Localize;
			x = 0.350445 * safezoneW + safezoneX;
			y = 0.607785 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Tchat_By_Maxou
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Tchat_By_Maxou',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Tchat_By_Maxou', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class combo_list: RscListbox
		{
			idc = 11173;
			onLBDblClick = "[_this] execVM ""divers\telephone_by_sfp_maxou\envoyer_un_joueur.sqf"";";

			text = "combo"; //--- ToDo: Localize;
			x = 0.291053 * safezoneW + safezoneX;
			y = 0.269874 * safezoneH + safezoneY;
			w = 0.416304 * safezoneW;
			h = 0.238847 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.1};
		};
		class RscEdit_1400: RscEdit
		{
			idc = 11175;

			text = "Pas d'insultes, ni de spam !"; //--- ToDo: Localize;
			x = 0.289174 * safezoneW + safezoneX;
			y = 0.522653 * safezoneH + safezoneY;
			w = 0.421434 * safezoneW;
			h = 0.0448176 * safezoneH;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\envoyer_mon_repertoire.sqf';";
			style = ST_CENTER;
			idc = 11178;

			text = "A Mon Repertoire"; //--- ToDo: Localize;
			x = 0.435733 * safezoneW + safezoneX;
			y = 0.714014 * safezoneH + safezoneY;
			w = 0.122259 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\envoyer_tout_civil.sqf';";
			style = ST_CENTER;
			idc = 11177;

			text = "A Tous Les Civils"; //--- ToDo: Localize;
			x = 0.563631 * safezoneW + safezoneX;
			y = 0.674408 * safezoneH + safezoneY;
			w = 0.122259 * safezoneW;
			h = 0.035 * safezoneH;
			tooltip = "Cette fonction a ete desactive depuis le 01/03/2016 suite sondage forum ... DISPO seulement pour entreprise ..."; //--- ToDo: Localize;
		};
		class RscShortcutButton_1705: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\envoyer_sarl_pompier.sqf';";
			style = ST_CENTER;
			idc = 11180;

			text = "Aux Pompiers"; //--- ToDo: Localize;
			x = 0.435733 * safezoneW + safezoneX;
			y = 0.674408 * safezoneH + safezoneY;
			w = 0.122259 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscShortcutButton_1706: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\envoyer_taxi_g_sept.sqf';";
			style = ST_CENTER;
			idc = 11182;

			text = "Au Taxi G7"; //--- ToDo: Localize;
			x = 0.309937 * safezoneW + safezoneX;
			y = 0.674408 * safezoneH + safezoneY;
			w = 0.122259 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscShortcutButton_1707: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\envoyer_depanneur.sqf';";
			style = ST_CENTER;
			idc = 11181;

			text = "Aux Depanneurs"; //--- ToDo: Localize;
			x = 0.435733 * safezoneW + safezoneX;
			y = 0.637003 * safezoneH + safezoneY;
			w = 0.122259 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			x = 1.1875 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.265625 * safezoneW;
			h = 0.125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class check_boxe: RscCheckbox
		{
			idc = 2800;
			x = 0.414434 * safezoneW + safezoneX;
			y = 0.581404 * safezoneH + safezoneY;
			w = 0.0429675 * safezoneW;
			h = 0.0389975 * safezoneH;
		};
		class texte_inclure_position: RscText
		{
			style = ST_CENTER;

			idc = 1005;
			text = "Inclure votre position :"; //--- ToDo: Localize;
			x = 0.300486 * safezoneW + safezoneX;
			y = 0.584802 * safezoneH + safezoneY;
			w = 0.109983 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "En cochant la case, votre position sera automatiquement envoyé !"; //--- ToDo: Localize;
		};
		class texte_message_anonyme: RscText
		{
			style = ST_CENTER;

			idc = 1007;
			text = "Message anonyme (4000 Euros) :"; //--- ToDo: Localize;
			x = 0.496099 * safezoneW + safezoneX;
			y = 0.584802 * safezoneH + safezoneY;
			w = 0.157953 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0,0,1};
			tooltip = "En cochant la case, votre position sera automatiquement envoyé !"; //--- ToDo: Localize;
		};
		class case_message_anonyme: RscCheckbox
		{
			idc = 2801;
			x = 0.657031 * safezoneW + safezoneX;
			y = 0.581403 * safezoneH + safezoneY;
			w = 0.0429675 * safezoneW;
			h = 0.0389975 * safezoneH;
		};
		class Edit_numero_de_tel: RscText
		{
			idc = 1009;
			text = "0612345678"; //--- ToDo: Localize;
			x = 0.502654 * safezoneW + safezoneX;
			y = 0.212296 * safezoneH + safezoneY;
			w = 0.365625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Mon numero de telephone :"; //--- ToDo: Localize;
			x = 0.38626 * safezoneW + safezoneX;
			y = 0.21126 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscShortcutButton_1710: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\envoyer_tout_flic.sqf';";
			style = ST_CENTER;
			idc = 11178;

			text = "Aux gendarmes"; //--- ToDo: Localize;
			x = 0.309937 * safezoneW + safezoneX;
			y = 0.634803 * safezoneH + safezoneY;
			w = 0.122259 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class RscShortcutButton_1711: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\envoyer_neomedia.sqf';";
			style = ST_CENTER;
			idc = 11181;

			text = "A Neomedia"; //--- ToDo: Localize;
			x = 0.563631 * safezoneW + safezoneX;
			y = 0.634803 * safezoneH + safezoneY;
			w = 0.122259 * safezoneW;
			h = 0.035 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Donner_Numero_De_Telephone
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Donner_Numero_De_Telephone',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Donner_Numero_De_Telephone', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class combo_list: RscListbox
		{
			idc = 11173;
			onLBDblClick = "['2',_this] execVM ""divers\telephone_by_sfp_maxou\donner_ou_changer_numero_de_tel.sqf"";";

			text = "combo"; //--- ToDo: Localize;
			x = 0.295767 * safezoneW + safezoneX;
			y = 0.304156 * safezoneH + safezoneY;
			w = 0.408468 * safezoneW;
			h = 0.444498 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			x = 1.1875 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.265625 * safezoneW;
			h = 0.125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Mon numero de telephone :"; //--- ToDo: Localize;
			x = 0.394388 * safezoneW + safezoneX;
			y = 0.20716 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Edit_numero_de_tel: RscText
		{
			idc = 1009;
			text = "0612345678"; //--- ToDo: Localize;
			x = 0.511048 * safezoneW + safezoneX;
			y = 0.20716 * safezoneH + safezoneY;
			w = 0.365625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Double clique sur un joueur pour donner ton numéro."; //--- ToDo: Localize;
			x = 0.286486 * safezoneW + safezoneX;
			y = 0.262349 * safezoneH + safezoneY;
			w = 0.407435 * safezoneW;
			h = 0.033007 * safezoneH;
			colorText[] = {0,0,0,1};
		};
	};
};
class Menu_tablette_sfp_mon_repertoire_telephonique_dialogue
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_mon_repertoire_telephonique_dialogue',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_mon_repertoire_telephonique_dialogue', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class combo_list: RscListbox
		{
			idc = 11173;

			text = "combo"; //--- ToDo: Localize;
			x = 0.298861 * safezoneW + safezoneX;
			y = 0.288753 * safezoneH + safezoneY;
			w = 0.402277 * safezoneW;
			h = 0.4269 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			x = 1.1875 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.265625 * safezoneW;
			h = 0.125 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "Mon numero de telephone :"; //--- ToDo: Localize;
			x = 0.37789 * safezoneW + safezoneX;
			y = 0.21156 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Edit_numero_de_tel: RscText
		{
			idc = 1009;
			text = "0612345678"; //--- ToDo: Localize;
			x = 0.492481 * safezoneW + safezoneX;
			y = 0.21156 * safezoneH + safezoneY;
			w = 0.365625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class Boutton_vider_repertoire: RscShortcutButton
		{
			onButtonClick = "['4'] execVM 'divers\telephone_by_sfp_maxou\donner_ou_changer_numero_de_tel.sqf';";
			style = 2;
			idc = 1703;

			text = "Supprimer mon repertoire"; //--- ToDo: Localize;
			x = 0.521463 * safezoneW + safezoneX;
			y = 0.725105 * safezoneH + safezoneY;
			w = 0.173302 * safezoneW;
			h = 0.033007 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Voici votre repertoire telephonique."; //--- ToDo: Localize;
			x = 0.288547 * safezoneW + safezoneX;
			y = 0.255749 * safezoneH + safezoneY;
			w = 0.41775 * safezoneW;
			h = 0.0264057 * safezoneH;
			colorText[] = {0,0,0,1};
		};
	};
};
class Menu_tablette_sfp_historique_message_sms
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_historique_message_sms',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_historique_message_sms', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class combo_list: RscListBox
		{
			onLBSelChanged = "[_this] execVM ""divers\telephone_by_sfp_maxou\nouveau_historique\rafraichir_conversation_par_utilisateur.sqf"";";
			idc = 1500;

			text = "combo"; //--- ToDo: Localize;
			x = 0.293704 * safezoneW + safezoneX;
			y = 0.257949 * safezoneH + safezoneY;
			w = 0.130998 * safezoneW;
			h = 0.42469 * safezoneH;
			colorBackground[] = {0,0,0,0.07};
		};
		class Boutton_Repondre: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\nouveau_historique\repondre_au_message_dialogue.sqf';";
			style = 2;
			idc = 1700;

			text = "Repondre directement au joueur"; //--- ToDo: Localize;
			x = 0.405927 * safezoneW + safezoneX;
			y = 0.729509 * safezoneH + safezoneY;
			w = 0.201139 * safezoneW;
			h = 0.033007 * safezoneH;
		};
		class RscListbox_1501: RscListBox
		{
			onLBSelChanged = "[_this] execVM ""divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_dire.sqf"";";
			idc = 1501;

			text = "combo"; //--- ToDo: Localize;
			x = 0.432954 * safezoneW + safezoneX;
			y = 0.257949 * safezoneH + safezoneY;
			w = 0.278209 * safezoneW;
			h = 0.424999 * safezoneH;
			colorBackground[] = {0,0,0,0.07};
		};
		class RscText_1001: RscText
		{
			style = 2;
			idc = 1001;

			text = "Expediteurs :"; //--- ToDo: Localize;
			x = 0.293716 * safezoneW + safezoneX;
			y = 0.213939 * safezoneH + safezoneY;
			w = 0.13925 * safezoneW;
			h = 0.033007 * safezoneH;
		};
		class RscText_1005: RscText
		{
			style = 2;
			idc = 1005;

			text = "Messages :"; //--- ToDo: Localize;
			x = 0.482456 * safezoneW + safezoneX;
			y = 0.213939 * safezoneH + safezoneY;
			w = 0.128935 * safezoneW;
			h = 0.033007 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\nouveau_historique\supprimer_la_conversation.sqf';";
			style = 2;
			idc = 1703;

			text = "Supprimer Conversation"; //--- ToDo: Localize;
			x = 0.503922 * safezoneW + safezoneX;
			y = 0.692101 * safezoneH + safezoneY;
			w = 0.201139 * safezoneW;
			h = 0.033007 * safezoneH;
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\telephone_by_sfp_maxou\nouveau_historique\supprimer_le_message.sqf';";
			style = 2;
			idc = 1704;

			text = "Supprimer Message"; //--- ToDo: Localize;
			x = 0.296592 * safezoneW + safezoneX;
			y = 0.692101 * safezoneH + safezoneY;
			w = 0.201139 * safezoneW;
			h = 0.033007 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_dialogue_vehicule
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_dialogue_vehicule',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_dialogue_vehicule', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class Boutton_Charger_Vehicule: RscShortcutButton
		{
			onButtonClick = "execvm 'persistence\voitures\choix_du_vehicule\choix_chargement_du_vehicule.sqf';";
			style = 2;
			idc = 1702;

			text = "Charger Votre Vehicule"; //--- ToDo: Localize;
			x = 0.505117 * safezoneW + safezoneX;
			y = 0.455971 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class Boutton_Sauvegarde: RscShortcutButton
		{
			onButtonClick = "execvm 'persistence\voitures\choix_du_vehicule\choix_sauvegarde_du_vehicule.sqf';";
			style = 2;
			idc = 1702;

			text = "Sauvegarder Votre Vehicule"; //--- ToDo: Localize;
			x = 0.35045 * safezoneW + safezoneX;
			y = 0.455967 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class Bouton_Reprendre_Cle_Vehicules: RscShortcutButton
		{
			onButtonClick = "execvm 'divers\clefs_voitures\initialisation_reprendre_mes_clefs.sqf';";
			style = ST_CENTER;

			idc = 1704;
			text = "Reprendre Cles Vehicules"; //--- ToDo: Localize;
			x = 0.505117 * safezoneW + safezoneX;
			y = 0.495571 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class Bouton_Preter_Clef: RscShortcutButton
		{
			onButtonClick = "execvm 'divers\clefs_voitures\initialisation_preter_mes_clefs.sqf';";
			style = ST_CENTER;

			idc = 1708;
			text = "Preter Cles Vehicules"; //--- ToDo: Localize;
			x = 0.35045 * safezoneW + safezoneX;
			y = 0.495571 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class classe_texte: RscStructuredText
		{
			type = CT_STRUCTURED_TEXT;
			size = 0.040; 

			idc = 1100;
			x = 0.300924 * safezoneW + safezoneX;
			y = 0.552811 * safezoneH + safezoneY;
			w = 0.39712 * safezoneW;
			h = 0.198042 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Choix_Vehicule_A_Sauvegarder
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Choix_Vehicule_A_Sauvegarder',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Choix_Vehicule_A_Sauvegarder', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class class_titre_choix_vehicule: RscText
		{
			style = st_left;
			idc = 1004;

			text = "Choix du vehicule à charger ..."; //--- ToDo: Localize;
			x = 0.284375 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class combo_list: RscListBox
		{
							 
			canDrag = 1; 
			idc = 1500;
			onLBDblClick = "[_this] execVM ""persistence\voitures\choix_du_vehicule\sauvegarder_le_vehicule.sqf"";";
			onLBDrag = "[_this] execVM ""persistence\voitures\choix_du_vehicule\obtenir_carte_endroit_du_vehicule.sqf"";";

			text = "combo"; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.40625 * safezoneW;
			h = 0.435 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1001: RscText
		{
			style = 2;
			idc = 1001;

			text = "Double cliquez pour charger le vehicule ..."; //--- ToDo: Localize;
			x = 0.521875 * safezoneW + safezoneX;
			y = 0.73 * safezoneH + safezoneY;
			w = 0.19375 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0.75,0.15,1};
		};
		class RscText_1006: RscText
		{
			style = ST_RIGHT;

			idc = 1006;
			text = "Limite des vehicules : 7 / 15."; //--- ToDo: Localize;
			x = 0.478125 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.23125 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Choix_Vehicule_A_Charger
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Choix_Vehicule_A_Charger',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Choix_Vehicule_A_Charger', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class class_titre_choix_vehicule: RscText
		{
			style = st_left;
			idc = 1004;

			text = "Choix du vehicule a charger ..."; //--- ToDo: Localize;
			x = 0.28125 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.2125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class combo_list: RscListBox
		{
			onLBDblClick = "[_this] execVM 'persistence\voitures\choix_du_vehicule\charger_le_vehicule.sqf';";
			idc = 1500;

			text = "combo"; //--- ToDo: Localize;
			x = 0.296875 * safezoneW + safezoneX;
			y = 0.285 * safezoneH + safezoneY;
			w = 0.403125 * safezoneW;
			h = 0.435 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1001: RscText
		{
			style = 2;
			idc = 1001;

			text = "Double cliquez pour charger le vehicule ..."; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.73 * safezoneH + safezoneY;
			w = 0.184375 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {0,0.75,0.15,1};
		};
		class RscText_1006: RscText
		{
			style = ST_RIGHT;

			idc = 1006;
			text = "Limite des vehicules : 7 / 15."; //--- ToDo: Localize;
			x = 0.53125 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.16875 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Vehicule_Preter_Cle
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Vehicule_Preter_Cle',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Vehicule_Preter_Cle', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class texte_argent_disponible: RscText
		{
			idc = 1004;
			style = ST_LEFT;

			text = "Choix du joueur :"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.16875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class combo_list_joueurs: RscListBox
		{
			idc = 1500;

			text = "combo joueurs"; //--- ToDo: Localize;
			x = 0.290625 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.43 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\clefs_voitures\preter_mes_clefs.sqf';";
			idc = 1700;

			text = "Preter"; //--- ToDo: Localize;
			x = 0.61875 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.0300001 * safezoneH;
		};
		class combo_list_vehicules: RscListBox
		{
			idc = 1501;

			text = "combo_vehicules"; //--- ToDo: Localize;
			x = 0.471875 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.2375 * safezoneW;
			h = 0.43 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			style = ST_LEFT;

			text = "Choix du vehicule :"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.23125 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Vehicule_Reprendre_Cle
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Vehicule_Reprendre_Cle',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Vehicule_Reprendre_Cle', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class texte_argent_disponible: RscText
		{
			idc = 1004;
			style = ST_LEFT;

			text = "Choix du joueur :"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.16875 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class combo_list_joueurs: RscListBox
		{
			idc = 1500;

			text = "combo joueurs"; //--- ToDo: Localize;
			x = 0.290625 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.43 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class Boutton_Envoyer: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\clefs_voitures\reprendre_mes_clefs.sqf';";
			idc = 1700;

			text = "Reprendre"; //--- ToDo: Localize;
			x = 0.61875 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.0300001 * safezoneH;
		};
		class Boutton_Connaitre_Proprio: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\clefs_voitures\connaitre_les_proprietaires.sqf';";
			idc = 1800;

			text = "Connaitre Proprio"; //--- ToDo: Localize;
			x = 0.521875 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.09375 * safezoneW;
			h = 0.0300001 * safezoneH;
		};
		class combo_list_vehicules: RscListBox
		{
			idc = 1501;

			text = "combo_vehicules"; //--- ToDo: Localize;
			x = 0.471875 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.2375 * safezoneW;
			h = 0.43 * safezoneH;
			colorBackground[] = {0,0,0,0.05};
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			style = ST_LEFT;

			text = "Choix du vehicule :"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.23125 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Menu_Groupe
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Menu_Groupe',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Menu_Groupe', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class class_rejoindre_le_groupe: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\rejoindre_le_groupe.sqf';";
			idc = 1705;

			text = "Rejoindre Le Groupe"; //--- ToDo: Localize;
			x = 0.365892 * safezoneW + safezoneX;
			y = 0.632026 * safezoneH + safezoneY;
			w = 0.130811 * safezoneW;
			h = 0.0339975 * safezoneH;
		};
		class class_titre: RscText
		{
			style = ST_CENTER;
			idc = 1001;

			text = "Choisis et selectionne un joueur ..."; //--- ToDo: Localize;
			x = 0.298861 * safezoneW + safezoneX;
			y = 0.258941 * safezoneH + safezoneY;
			w = 0.412592 * safezoneW;
			h = 0.0220047 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;

			x = 0.295767 * safezoneW + safezoneX;
			y = 0.290956 * safezoneH + safezoneY;
			w = 0.407435 * safezoneW;
			h = 0.325665 * safezoneH;
		};
		class class_leader: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\leader_du_groupe.sqf';";
			idc = 1700;

			text = "Leader Du Groupe"; //--- ToDo: Localize;
			x = 0.505153 * safezoneW + safezoneX;
			y = 0.632026 * safezoneH + safezoneY;
			w = 0.130811 * safezoneW;
			h = 0.0339975 * safezoneH;
		};
		class class_quitter_groupe: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\quitter_le_groupe.sqf';";
			idc = 1702;

			text = "Quitter Mon Groupe Groupe"; //--- ToDo: Localize;
			x = 0.573236 * safezoneW + safezoneX;
			y = 0.715645 * safezoneH + safezoneY;
			w = 0.130811 * safezoneW;
			h = 0.0339975 * safezoneH;
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\quitter_leader.sqf';";
			idc = 1703;

			text = "Quitter Leader"; //--- ToDo: Localize;
			x = 0.433986 * safezoneW + safezoneX;
			y = 0.717845 * safezoneH + safezoneY;
			w = 0.130811 * safezoneW;
			h = 0.0339975 * safezoneH;
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\verrouiller_mon_groupe.sqf';";
			idc = 1704;

			text = "Verrouiller Mon Groupe"; //--- ToDo: Localize;
			x = 0.294735 * safezoneW + safezoneX;
			y = 0.717845 * safezoneH + safezoneY;
			w = 0.130811 * safezoneW;
			h = 0.0339975 * safezoneH;
		};
		class class_kicker: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\kicker_joueur_de_mon_groupe\menu_kicker_le_joueur.sqf';";
			idc = 1706;

			text = "Kicker Un Joueur !"; //--- ToDo: Localize;
			x = 0.365883 * safezoneW + safezoneX;
			y = 0.676037 * safezoneH + safezoneY;
			w = 0.130811 * safezoneW;
			h = 0.0339975 * safezoneH;
		};
		class RscShortcutButton_1707: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\creation_menu_go_pro.sqf';";
			idc = 1707;

			text = "Allumee GOPRO !"; //--- ToDo: Localize;
			x = 0.505157 * safezoneW + safezoneX;
			y = 0.676037 * safezoneH + safezoneY;
			w = 0.123778 * safezoneW;
			h = 0.033007 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Menu_Groupe_Go_Pro
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Menu_Groupe_Go_Pro',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Menu_Groupe_Go_Pro', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class class_titre: RscText
		{
			style = ST_CENTER;
			idc = 1001;

			text = "Choisis et selectionne le joueur a allumee la gopro ..."; //--- ToDo: Localize;
			x = 0.296798 * safezoneW + safezoneX;
			y = 0.255744 * safezoneH + safezoneY;
			w = 0.407435 * safezoneW;
			h = 0.0264055 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;

			x = 0.298861 * safezoneW + safezoneX;
			y = 0.286553 * safezoneH + safezoneY;
			w = 0.402277 * safezoneW;
			h = 0.431293 * safezoneH;
		};
		class class_kicker: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\creer_gopro_personne_groupe.sqf';";
			idc = 1706;

			text = "LETS GO !"; //--- ToDo: Localize;
			x = 0.612552 * safezoneW + safezoneX;
			y = 0.729521 * safezoneH + safezoneY;
			w = 0.092046 * safezoneW;
			h = 0.0301959 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_Menu_Groupe_Nouveau_Kicker
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_Menu_Groupe_Nouveau_Kicker',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_Menu_Groupe_Nouveau_Kicker', nil]";
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class tablette_sfp_vide_fond: RscPicture
		{
			idc = 1200;
			text = "textures\tablette_sfp\tablette_sfp_vide.paa";
			x = 0.224593 * safezoneW + safezoneX;
			y = -0.06552 * safezoneH + safezoneY;
			w = 0.549747 * safezoneW;
			h = 1.11783 * safezoneH;
			// colorText[] = {1,1,1,0.6};
		};
		class tablette_sfp_boutton_fermer: RscButton_tablette_sfp_en_bas
		{
			onButtonClick = "closeDialog 0;";

			idc = 1031;
			x = 0.481434 * safezoneW + safezoneX;
			y = 0.836673 * safezoneH + safezoneY;
			w = 0.0361011 * safezoneW;
			h = 0.0242051 * safezoneH;
		};
		class class_titre: RscText
		{
			style = ST_CENTER;
			idc = 1001;

			text = "Choisis et selectionne le joueur a kicker ..."; //--- ToDo: Localize;
			x = 0.288547 * safezoneW + safezoneX;
			y = 0.257949 * safezoneH + safezoneY;
			w = 0.41775 * safezoneW;
			h = 0.028606 * safezoneH;
			colorText[] = {0,0.91,0.07,1};
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;

			x = 0.298861 * safezoneW + safezoneX;
			y = 0.293151 * safezoneH + safezoneY;
			w = 0.402277 * safezoneW;
			h = 0.415896 * safezoneH;
		};
		class class_kicker: RscShortcutButton
		{
			onButtonClick = "execVM 'divers\groupe_des_joueurs\kicker_joueur_de_mon_groupe\kicker_le_joueur_action_non_MP.sqf';";
			idc = 1706;

			text = "Kicker !"; //--- ToDo: Localize;
			x = 0.628932 * safezoneW + safezoneX;
			y = 0.720047 * safezoneH + safezoneY;
			w = 0.071416 * safezoneW;
			h = 0.0323961 * safezoneH;
		};
	};
};

