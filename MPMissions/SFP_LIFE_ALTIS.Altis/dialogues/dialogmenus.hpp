// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

class InventoryMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {mon_argent_poche_by_sfp_maxou,InfoMyLicences,InfoMyInventory,InfoWanted,Close};
	
	class mon_argent_poche_by_sfp_maxou : BaseRscSingleText
	{
		idc = 11111;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class InfoMyLicences : BaseRscSingleText
	{
		idc = 11112;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class InfoMyInventory : BaseRscSingleText
	{
		idc = 11113;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.350;
		w = 0.5;
	};
	class InfoWanted : BaseRscSingleText
	{
		idc = 11114;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.425;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.5;
		w = 0.5;
	};
};

class BankAmende
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {TarifDesAmendes1,TarifDesAmendes2,TarifDesAmendes3,TarifDesAmendes4,TarifDesAmendes5,TarifDesAmendes6,TarifDesAmendes7,TarifDesAmendes8,TarifDesAmendes9,mon_argent_poche_by_sfp_maxou,InfoMyBank,TextEdit,Withdraw,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.420;
	};
	class TarifDesAmendes1 : BaseRscSingleText
	{
		idc = 99999;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.0;
		w = 0.5; 
	};
	class TarifDesAmendes2 : BaseRscSingleText
	{
		idc = 99998;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.1;
		w = 0.5;
	};
	class TarifDesAmendes3 : BaseRscSingleText
	{
		idc = 99997;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.2;
		w = 0.5;
	};
	class TarifDesAmendes4 : BaseRscSingleText
	{
		idc = 99996;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.3;
		w = 0.5;
	};
	class TarifDesAmendes5 : BaseRscSingleText
	{
		idc = 99995;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.4;
		w = 0.5;
	};
	class TarifDesAmendes6 : BaseRscSingleText
	{
		idc = 99994;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.5;
		w = 0.5;
	};
	class TarifDesAmendes7 : BaseRscSingleText
	{
		idc = 99993;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.6;
		w = 0.5;
	};
	class TarifDesAmendes8 : BaseRscSingleText
	{
		idc = 99992;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.7;
		w = 0.5;
	};
	class TarifDesAmendes9 : BaseRscSingleText
	{
		idc = 99991;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 1 };
		colorText[]={0.8,0.9,0.9,0.7};
		sizeEx = 0.04;
		x = 0; y = 0.8;
		w = 0.5;
	};
	class mon_argent_poche_by_sfp_maxou : BaseRscSingleText
	{
		idc = 11115;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class InfoMyBank : BaseRscSingleText
	{
		idc = 11116;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 22228;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.350;
		w = 0.5;
	};
	class Withdraw : BaseRscButton
	{
		idc = 11118;
		text = "Lui faire payer (N'abuse pas ou tu seras banni !)";
		action = "execVM 'divers\gendarmerie\amendes\luifairepayerok.sqf'";
		x = 0.65; y = 0.425;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.520;
		w = 0.5;
	};
};
class Dialogue_banque_amende_sur_joueur
{
	idd = 4844;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {mon_argent_poche_by_sfp_maxou,InfoMyBank,Accepter,Refuser};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.340;
	};
	class mon_argent_poche_by_sfp_maxou : BaseRscSingleText
	{
		idc = 11115;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class InfoMyBank : BaseRscSingleText
	{
		idc = 11116;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Accepter : BaseRscButton
	{
		idc = -1;
		text = "Accepter l'amende !";
		action = "execVM 'divers\gendarmerie\amendes\choix_joueur_accepter_ou_pas\accepter_prix_amende.sqf'";
		x = 0.65; y = 0.365;
		w = 0.5;
	};
	class Refuser : BaseRscButton
	{
		idc = -1;
		text = "Refuser l'amende !";
		action = "execVM 'divers\gendarmerie\amendes\choix_joueur_accepter_ou_pas\refuser_prix_amende.sqf'";
		x = 0.65; y = 0.440;
		w = 0.5;
	};
};
class CoffreFortDefinirMotDePasse
{
	idd = 4844;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {appartenance_du_coffre,TextEdit,ValiderLeCode};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.245;
	};
	class appartenance_du_coffre : BaseRscSingleText
	{
		idc = 11115;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 22228;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class ValiderLeCode : BaseRscButton
	{
		idc = -1;
		text = "Définir mot de passe";
		action = "execVM 'divers\poser_objets\civil\coffre_fort\definir_mot_de_passe.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
};
class CoffreFortRentrerMotDePasseNonProprio
{
	idd = 4844;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {appartenance_du_coffre,TextEdit,ValiderLeCode};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.245;
	};
	class appartenance_du_coffre : BaseRscSingleText
	{
		idc = 11115;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 22228;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class ValiderLeCode : BaseRscButton
	{
		idc = -1;
		text = "Valider Le Mot De Passe";
		action = "execVM 'divers\poser_objets\civil\coffre_fort\valider_le_mot_de_passe.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
};
class TempsDePrison
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {Information,TextEdit,Withdraw,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.320;
	};
	class Information : BaseRscSingleText
	{
		idc = 11115;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.200;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11116;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Withdraw : BaseRscButton
	{
		idc = 11117;
		text = "Envoyer en prison";
		action = "execVM 'divers\gendarmerie\prison\envoyer_en_prison_temps.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.425;
		w = 0.5;
	};
};
class MutuelleBySFPMaxou
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {mon_argent_en_banque,listes_mutuelles,cotisation_mutuelle,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.040; y = 0.19;
		w = 0.67; h = 0.470;
	};
	class mon_argent_en_banque : BaseRscSingleText
	{
		idc = 11120;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.05; y = 0.2;
		w = 0.65;
	};
	class listes_mutuelles : BaseRscComboBox 
	{
		idc = 11121;
		moving = 1;
		colorSelectBackground[] = { 0.7,0.03,0,1 };
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		wholeHeight = 0.725;
		x = 0.05; y = 0.275;
		w = 0.65;
	};
	class cotisation_mutuelle : BaseRscButton
	{
		idc = 11122;
		text = "Prendre mutuelle";
		action = "execVM 'divers\services_publiques\mutuelle\prendre_la_mutuelle.sqf'";
		x = 0.05; y = 0.5;
		w = 0.65;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.05; y = 0.575;
		w = 0.65;
	};
};
class HeroinProMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {MyHeroin,TextEdit,Process,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.650; y = 0.19;
		w = 0.520; h = 0.325;
	};
	class MyHeroin : BaseRscSingleText
	{
		idc = 11132;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.660; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11133;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.660; y = 0.275;
		w = 0.5;
	};
	class Process : BaseRscButton
	{
		idc = 11134;
		text = "Traiter l'heroine";
		action = "execVM 'divers\farming\transformation_heroine.sqf'";
		x = 0.660; y = 0.350;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.660; y = 0.425;
		w = 0.5;
	};
};
class CannabisProMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {MonCannabis,TextEdit,Process,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.650; y = 0.19;
		w = 0.520; h = 0.325;
	};
	class MonCannabis : BaseRscSingleText
	{
		idc = 11132;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.660; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11133;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.660; y = 0.275;
		w = 0.5;
	};
	class Process : BaseRscButton
	{
		idc = 11134;
		text = "Traiter le cannabis";
		action = "execVM 'divers\farming\processus_cannabis.sqf'";
		x = 0.660; y = 0.350;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.660; y = 0.425;
		w = 0.5;
	};
};
class CuivreMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {MonCuivre,TextEdit,Process,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.320;
	};
	class MonCuivre : BaseRscSingleText
	{
		idc = 11132;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11133;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Process : BaseRscButton
	{
		idc = 11134;
		text = "Traiter le cuivre";
		action = "execVM 'vendre\marche\cuivre\transformation.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.425;
		w = 0.5;
	};
};
class OrMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {MonOr,TextEdit,Process,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.320;
	};
	class MonOr : BaseRscSingleText
	{
		idc = 11132;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11133;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Process : BaseRscButton
	{
		idc = 11134;
		text = "Traiter l'or";
		action = "execVM 'vendre\marche\or\transformation.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.425;
		w = 0.5;
	};
};
class FishSellTransformationMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {MyFish,TextEdit,Sell,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.320;
	};
	class MyFish : BaseRscSingleText
	{
		idc = 11138;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11139;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Sell : BaseRscButton
	{
		idc = 11140;
		text = "Transformer Poissons";
		action = "execVM 'vendre\marche\poissons_panes\fishtransformationpoissons.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.425;
		w = 0.5;
	};
};
class OilSellMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {MyOil,TextEdit,Sell,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.320;
	};
	class MyOil : BaseRscSingleText
	{
		idc = 11144;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11145;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Sell : BaseRscButton
	{
		idc = 11146;
		text = "Vendre Pétrole";
		action = "execVM 'vendre\marche\petrole\ventepetrole.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.425;
		w = 0.5;
	};
};
class OilProMenu
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {MyOil,TextEdit,Process,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.320;
	};
	class MyOil : BaseRscSingleText
	{
		idc = 11147;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.505;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11148;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.505;
	};
	class Process : BaseRscButton
	{
		idc = 11149;
		text = "Traitement du Petrole";
		action = "execVM 'divers\farming\transformation_petrole.sqf'";
		x = 0.65; y = 0.350;
		w = 0.505;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.425;
		w = 0.505;
	};
};
class TransformationPoissons
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {Title,TransfaPoissons,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.250;
	};
	class Title : BaseRscSingleText
	{
		idc = 11150;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class TransfaPoissons : BaseRscButton
	{
		idc = 11151;
		text = "Transformer poissons en poissons panés";
		action = "execVM 'menu\transformationpoissons.sqf'";
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
};
class JoueurEnGendarmerieBySFPMaxou
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {Informations,PlayerList,Sortir,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.545;
	};
	class Informations : BaseRscSingleText
	{
		idc = -1;
		text = "Listes des joueurs en garde à vue";
		action = "closeDialog 0";
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class PlayerList : BaseRscComboBox 
	{
		idc = 11165;
		moving = 1;
		colorSelectBackground[] = { 0.7,0.03,0,1 };
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Sortir : BaseRscButton
	{
		idc = 11167;
		text = "Sortir de garde à vue";
		action = "execVM 'divers\gendarmerie\garde_a_vue\sortir_joueur_de_la_garde_a_vue.sqf'";
		x = 0.65; y = 0.575;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.650;
		w = 0.5;
	};
};
class FaireDesEtudes
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {mon_argent_en_banque,listes_diplomes,acheter_diplomes,Close};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.470;
	};
	class mon_argent_en_banque : BaseRscSingleText
	{
		idc = 11120;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class listes_diplomes : BaseRscComboBox 
	{
		idc = 11121;
		moving = 1;
		colorSelectBackground[] = { 0.7,0.03,0,1 };
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		wholeHeight = 0.725;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class acheter_diplomes : BaseRscButton
	{
		idc = 11122;
		text = "Acheter";
		action = "execVM 'divers\offres_d_emplois\ecole\acheter.sqf'";
		x = 0.65; y = 0.5;
		w = 0.5;
	};
	class Close : BaseRscButton
	{
		idc = -1;
		text = "Fermer";
		action = "closeDialog 0";
		x = 0.65; y = 0.575;
		w = 0.5;
	};
};
class Emploi_Calcul_Mathematique
{
	idd = 55844;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {Titre,Question,TextEdit,Repondre,Fermer};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.415;
	};
	class Titre : BaseRscSingleText
	{
		idc = 11115;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class Question : BaseRscSingleText
	{
		idc = 11116;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class TextEdit : BaseRscTextBox
	{
		idc = 11117;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.365;
		w = 0.5;
	};
	class Repondre : BaseRscButton
	{
		idc = -1;
		text = "Valider Calcul !";
		action = "execVM 'divers\offres_d_emplois\metiers_pour_missions\calcul_mathematique\valider_mathematique.sqf'";
		x = 0.65; y = 0.440;
		w = 0.5;
	};
	class Fermer : BaseRscButton
	{
		idc = -1;
		text = "Arreter Les Calculs";
		action = "closeDialog 0;je_ferme_les_mathematique = 1;";
		x = 0.65; y = 0.515;
		w = 0.5;
	};
};
class Taux_Prix_Pourcentage_SARL_DEPANNAGE
{
	idd = 4844;
	movingEnable = true;
	enableSimulation = true;
	controlsBackground[] = {Background};
	objects[] = {};
	controls[] = {message_information,Valeur_taux_pourcentage,Valider_taux};
	
	class Background : BaseRscBox
	{
		idc = -1;
		moving = 1;
		colorBackground[] = { 0, 0, 0, 0.8 };
		x = 0.640; y = 0.19;
		w = 0.520; h = 0.245;
	};
	class message_information : BaseRscSingleText
	{
		idc = 11115;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.2;
		w = 0.5;
	};
	class Valeur_taux_pourcentage : BaseRscTextBox
	{
		idc = 22228;
		moving = 1;
		colorBackground[] = { 0,0.07,0.66,1 };
		sizeEx = 0.04;
		x = 0.65; y = 0.275;
		w = 0.5;
	};
	class Valider_taux : BaseRscButton
	{
		idc = -1;
		text = "Valider Le Taux";
		action = "execVM 'divers\nos_entreprises\sarl_depannage\devis_reparation\choisir_taux_horaires.sqf'";
		x = 0.65; y = 0.350;
		w = 0.5;
	};
};

