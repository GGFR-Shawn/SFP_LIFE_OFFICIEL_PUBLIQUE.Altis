// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (count (nearestObjects [getPosATL player, ["Land_Suitcase_F"], 2]) < 1) exitwith {hint "Désolé, aucune sacoche de c4 trouvé !";};
if (((nearestObjects [getPosATL player, ["Land_Suitcase_F"], 2]) select 0) getvariable 'proprietaire_sacoche_c4' != name player) exitwith {hint "Désolé, ce n'est pas une sacoche de c4 à votre nom !";};

sacoche_c4_en_cours_d_accroche = true;

_la_sacoche_c4 = (nearestObjects [getPosATL player, ["Land_Suitcase_F"], 2]) select 0;
_la_sacoche_c4 attachto [player,[-0.044,-0.06,-0.1],"righthand"];
_la_sacoche_c4 setVectorDirAndUp [[0.5,0,0],[0,0,0.5]];

_addaction_decrocher_sacoche = player addaction ["<t color=""#ff0000"">" + "Détacher Sacoche C4", {if (speed player > 0) exitwith {hint "Désolé, il faut être à l'arret pour eviter de mourrir betement !";}; sacoche_c4_en_cours_d_accroche = nil;}, [], 20, false, true, "", ""];

waituntil {sleep 0.045; hintsilent format ["! SACOCHE C4 ! \n -------------------------------------- \n\n Manipule la doucement ou elle explosera ! \n\n Vitesse max : %1/15 Km ... \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou",round speed player]; isnil "sacoche_c4_en_cours_d_accroche" or !alive player or speed player > 15}; 

detach _la_sacoche_c4; 
sacoche_c4_en_cours_d_accroche = nil;
player removeaction _addaction_decrocher_sacoche;

if (speed player > 15) then
{
	if (player getvariable "brouilleur_sacoche_c4" > 0) then
	{
		hint "Votre brouilleur à eviter l'explosition de la bombe ...";
	}else
	{
		_bombe_sfp = "Bo_Mk82" createVehicle (position player);
		deletevehicle _la_sacoche_c4;
	};
};
