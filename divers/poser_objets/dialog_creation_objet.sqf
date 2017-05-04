//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (isnil "avertissementgeneralobjetpose") then {avertissementgeneralobjetpose = 0; hint "Attention, sachez que vous ne pourrez intéragir avec les objets SEULEMENT si vous en avez posé !";};

createDialog "Menu_tablette_sfp_Poser_Objets";
ctrlSetText[11120,format["        Création d'objet By SFP Maxou - www.sfpteam.fr"]];

if (revive_mon_side == west) then
{
	lbAdd[1500,"Mat Halogène : Gratuit"];
	lbAdd[1500,"Barrières pour barrage : Gratuit"]; 
	lbAdd[1500,"Cone Orange : Gratuit"];
	lbAdd[1500,"Herse : Gratuit"];
	lbAdd[1500,"Panneau Halte Gendarmerie : Gratuit"];
	lbAdd[1500,"Coffre Fort : quincaillerie"];
	
	for "_i" from 0 to 5 do	{((uiNamespace getVariable "Menu_tablette_sfp_Poser_Objets") displayCtrl 1500) lbSetTooltip [_i, "Double cliquez pour poser l'objet."];};	
};

if (revive_mon_side == civilian) then
{
	lbAdd[1500,"Tente de couchage : quincaillerie"];
	lbAdd[1500,"Mat Halogène : DDE/POMPIERS"];
	lbAdd[1500,"Cone de circulation : DDE/POMPIERS"];
	lbAdd[1500,"Barriere De Chantier : DDE"];
	lbAdd[1500,"Barriere De Chantier Orange : DDE/POMPIERS"];
	lbAdd[1500,"Panneau Danger : DDE/POMPIERS"];
	lbAdd[1500,"Coffre Fort : quincaillerie"];
	lbAdd[1500,"Valise Farming : quincaillerie"];
	lbAdd[1500,"Plantes Illégales : Pépinière"];

	for "_i" from 0 to 7 do	{((uiNamespace getVariable "Menu_tablette_sfp_Poser_Objets") displayCtrl 1500) lbSetTooltip [_i, "Double cliquez pour poser l'objet."];};	
};
