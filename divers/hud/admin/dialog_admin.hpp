//--- Pannel_Admin_Information_ByMaxou
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_COULEURFOND	52140
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_RSCTEXT_1001	52141
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_SFPTEAM_MAXOU	52142
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_BY_MAXOU		52143
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_PANNEL_TITRE	52144
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_RSCTEXT_1005	52145
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_COMBO_LIST		52640
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_RSCLISTBOX_1501	52641
#define IDC_PANNEL_ADMIN_INFORMATION_BYMAXOU_BOUTTON_ANNULER	52841
#define GUI_GRID_X	(safezoneX)
#define GUI_GRID_Y	(safezoneY)
#define GUI_GRID_W	(safezoneW / 32)
#define GUI_GRID_H	(safezoneH / 20)
#define GUI_GRID_WAbs	(safezoneW)
#define GUI_GRID_HAbs	(safezoneH)

class Menu_Admin_Informations_Joueurs
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Menu_Admin_Informations_Joueurs',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_Admin_Informations_Joueurs', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;
			x = 0.00625001 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.940625 * safezoneW;
			h = 0.695 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class pannel_titre: RscText
		{
			style = ST_CENTER;

			idc = 1004;
			text = "... Pannel Admin Info BY Maxou ..."; //--- ToDo: Localize;
			x = 0.00937502 * safezoneW + safezoneX;
			y = 0.075 * safezoneH + safezoneY;
			w = 0.934375 * safezoneW;
			h = 0.045 * safezoneH;
		};
		class combo_list: RscListbox
		{
			onLBSelChanged = "[_this] execVM ""divers\hud\admin\informations_joueurs\mise_a_jour_informations_joueurs.sqf"";";

			idc = 1500;
			text = "combo"; //--- ToDo: Localize;
			x = 0.7 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.07};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.855625 * safezoneW + safezoneX;
			y = 0.831111 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;
			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.815 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;
			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.01875 * safezoneW + safezoneX;
			y = 0.835 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscListbox_1501: RscListbox
		{
			idc = 1501;
			text = "combo"; //--- ToDo: Localize;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.3 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.07};
		};
		class RscText_1001: RscText
		{
			style = ST_CENTER;

			idc = 1001;
			text = "Joueurs :"; //--- ToDo: Localize;
			x = 0.025 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.259375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class RscText_1005: RscText
		{
			style = ST_CENTER;

			idc = 1005;
			text = "Informations :"; //--- ToDo: Localize;
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.628125 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class bouton_tp_joueur: RscShortcutButton
		{
			onButtonClick = "closedialog 0; [] execVM 'divers\hud\admin\informations_joueurs\tp_sur_le_joueur.sqf';";
			style = ST_CENTER;

			idc = 1700;
			text = "TP sur le joueur"; //--- ToDo: Localize;
			x = 0.77125 * safezoneW + safezoneX;
			y = 0.831111 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class boutton_kick_joueur: RscShortcutButton
		{
			onButtonClick = "closedialog 0; ['1',0,name player] execVM 'divers\hud\admin\informations_joueurs\ban_ou_kick_le_joueur.sqf';";
			style = ST_CENTER;

			idc = 1702;
			text = "Kick le joueur"; //--- ToDo: Localize;
			x = 0.686875 * safezoneW + safezoneX;
			y = 0.831111 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class boutton_ban_le_joueur: RscShortcutButton
		{
			onButtonClick = "closedialog 0; ['2',0,name player] execVM 'divers\hud\admin\informations_joueurs\ban_ou_kick_le_joueur.sqf';";
			style = ST_CENTER;

			idc = 1703;
			text = "BAN le joueur"; //--- ToDo: Localize;
			x = 0.6025 * safezoneW + safezoneX;
			y = 0.831111 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};

class Deban_En_Ligne_Des_Joueurs
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Deban_En_Ligne_Des_Joueurs',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Deban_En_Ligne_Des_Joueurs', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;

			x = 0.273434 * safezoneW + safezoneX;
			y = 0.1249 * safezoneH + safezoneY;
			w = 0.541406 * safezoneW;
			h = 0.6512 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class pannel_titre: RscText
		{
			style = 2;
			idc = 1004;

			text = "... Deban En Ligne Des Joueurs ..."; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.537281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class combo_list: RscListBox
		{
			idc = 1500;

			text = "combo"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.16934 * safezoneH + safezoneY;
			w = 0.489844 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {0,0,0,0.07};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = 2;
			idc = 1701;

			text = "FERMER"; //--- ToDo: Localize;
			x = 0.720584 * safezoneW + safezoneX;
			y = 0.78666 * safezoneH + safezoneY;
			w = 0.0785627 * safezoneW;
			h = 0.0346001 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;

			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;

			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.286531 * safezoneW + safezoneX;
			y = 0.7596 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;

			text = "Liste des ID bannis :"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.488257 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class Boutton_Deban: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\hud\admin\deban_joueur\action_deban_joueur.sqf';";
			style = 2;
			idc = 1701;

			text = "DEBAN"; //--- ToDo: Localize;
			x = 0.632516 * safezoneW + safezoneX;
			y = 0.78688 * safezoneH + safezoneY;
			w = 0.0785627 * safezoneW;
			h = 0.0346001 * safezoneH;
		};
	};
};

class Supprimer_Des_Vehicules_De_Joueurs
{
	idd = -1;
	movingenable = 0;
	onLoad="uiNamespace setVariable ['Supprimer_Des_Vehicules_De_Joueurs',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Supprimer_Des_Vehicules_De_Joueurs', nil]";
	
	class Controls
	{
		class CouleurFond: RscText
		{
			idc = 1000;

			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.1249 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.6512 * safezoneH;
			colorBackground[] = {0,0.07,0.66,0.15};
		};
		class pannel_titre: RscText
		{
			style = 2;
			idc = 1004;

			text = "... Supprimer Des Véhicules De Joueurs ..."; //--- ToDo: Localize;
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class combo_list: RscListBox
		{
			idc = 1500;

			text = "combo"; //--- ToDo: Localize;
			x = 0.0761561 * safezoneW + safezoneX;
			y = 0.1656 * safezoneH + safezoneY;
			w = 0.738384 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {0,0,0,0.07};
		};
		class Boutton_Annuler: RscShortcutButton
		{
			onButtonClick = "closedialog 0;";
			style = 2;
			idc = 1701;

			text = "FERMER"; //--- ToDo: Localize;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0785627 * safezoneW;
			h = 0.0346001 * safezoneH;
		};
		class sfpteam_maxou: RscText
		{
			idc = 1002;

			text = "www.sfpteam.fr"; //--- ToDo: Localize;
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.7376 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class by_maxou: RscText
		{
			idc = 1003;

			text = "By Maxou"; //--- ToDo: Localize;
			x = 0.0699689 * safezoneW + safezoneX;
			y = 0.7552 * safezoneH + safezoneY;
			w = 0.140625 * safezoneW;
			h = 0.0999999 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;

			text = "Liste des véhicules à proximité :"; //--- ToDo: Localize;
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.777562 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class Boutton_Supprimer: RscShortcutButton
		{
			onButtonClick = "[] execVM 'divers\hud\admin\supprimer_vehicules_joueurs\action_supprimer_vehicules_des_joueurs.sqf';";
			style = 2;
			idc = 1701;

			text = "SUPPRIMER"; //--- ToDo: Localize;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0785627 * safezoneW;
			h = 0.0346001 * safezoneH;
		};
	};
};
class Menu_tablette_sfp_menu_admin
{
	idd = -1;
	onLoad="uiNamespace setVariable ['Menu_tablette_sfp_menu_admin',_this select 0]";
	onUnLoad="uiNamespace setVariable ['Menu_tablette_sfp_menu_admin', nil]";
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
			colorText[] = {1,1,1,0.6};
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
		class RscShortcutButton_1703: RscShortcutButton
		{
			onButtonClick =	"execVM 'divers\hud\admin\LxOPS\lxOPS.sqf';closedialog 0;";
			style = 2;
			idc = 1702;

			text = "Création des objets"; //--- ToDo: Localize;
			x = 0.422639 * safezoneW + safezoneX;
			y = 0.343744 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1708: RscShortcutButton
		{
			onButtonClick =	"execVM 'divers\hud\admin\Blackli0nXX.sqf';closedialog 0;";
			style = ST_CENTER;

			idc = 1708;
			text = "Menu Admin 1"; //--- ToDo: Localize;
			x = 0.422639 * safezoneW + safezoneX;
			y = 0.383374 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			onButtonClick =	"execVM 'divers\hud\admin\menu_administration_deux_ouverture.sqf';closedialog 0;";
			style = ST_CENTER;

			idc = 1700;
			text = "Menu Admin 2"; //--- ToDo: Localize;
			x = 0.422639 * safezoneW + safezoneX;
			y = 0.422981 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1701: RscShortcutButton
		{
			onButtonClick =	"execVM 'divers\hud\admin\informations_joueurs\execution_informations_joueurs.sqf';closedialog 0;";
			style = ST_CENTER;

			idc = 1701;
			text = "Informations sur les joueurs en ligne"; //--- ToDo: Localize;
			x = 0.422639 * safezoneW + safezoneX;
			y = 0.462588 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			onButtonClick =	"createdialog 'Banniere_Staff'; lbAdd [4040, '20 Secondes'];lbAdd [4040, '40 Secondes'];lbAdd [4040, '60 Secondes'];lbAdd [4040, '80 Secondes'];lbAdd [4040, '100 Secondes'];lbAdd [4040, '120 Secondes'];lbAdd [4040, '140 Secondes'];lbAdd [4040, '160 Secondes'];";
			style = ST_CENTER;

			idc = 1702;
			text = "Spot Message"; //--- ToDo: Localize;
			x = 0.422639 * safezoneW + safezoneX;
			y = 0.502195 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			onButtonClick =	"execVM 'divers\hud\admin\deban_joueur\menu_deban_joueur.sqf';closedialog 0;";
			style = ST_CENTER;

			idc = 1704;
			text = "Deban Joueur (BAN AUTO)"; //--- ToDo: Localize;
			x = 0.422639 * safezoneW + safezoneX;
			y = 0.541807 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
		class RscShortcutButton_1705: RscShortcutButton
		{
			onButtonClick =	"execVM 'divers\hud\admin\supprimer_vehicules_joueurs\menu_supprimer_vehicules_des_joueurs.sqf';closedialog 0;";
			style = ST_CENTER;

			idc = 1705;
			text = "Supprimer Véhicule Joueur"; //--- ToDo: Localize;
			x = 0.422639 * safezoneW + safezoneX;
			y = 0.581418 * safezoneH + safezoneY;
			w = 0.15168 * safezoneW;
			h = 0.0323964 * safezoneH;
		};
	};
};
