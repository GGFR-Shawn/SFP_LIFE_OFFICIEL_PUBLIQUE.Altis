// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_la_sacoche";
if (count (nearestObjects [getPosATL player, ["Land_Suitcase_F"], 2]) < 1) exitwith {hint "Désolé, aucune sacoche de c4 trouvé !";};
_la_sacoche = (nearestObjects [getPosATL player, ["Land_Suitcase_F"], 2]) select 0;
choix_decision_sacoche_c4_explosion = nil;

hint "! SACOCHE C4 ! \n -------------------------------------- \n\n Nouveau depuis le 12/01/2016. \n\n Il faut maintenant couper l'un des trois cables pour la désamorcer et la récuperer ... Bonne chance ! \n\n Sache qu'un brouilleur d'onde est disponible en quincaillerie au cas ou ;) \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";

cutText ["","BLACK FADED"]; 
0 cutFadeOut 9999999;

createdialog "Choix_Couper_Fil_C4";
waituntil {sleep 0.01; !isnil "choix_decision_sacoche_c4_explosion" or !dialog};
if (!dialog or isnil "choix_decision_sacoche_c4_explosion") exitwith {hint "Opération annulée ..."; cutText["","BLACK IN"];	closedialog 0;};

if (choix_decision_sacoche_c4_explosion == 0 or player getvariable "brouilleur_sacoche_c4" > 0) then
{
	player setVariable ['sacoche_de_c4', round ((player getVariable "sacoche_de_c4") + 1),true];
	player setVariable ["usedspace", round ((player getVariable "usedspace") + 1),true];

	if (player getvariable "brouilleur_sacoche_c4" > 0) then
	{
		hint "La sacoche C4 à bien été récupérée sans exploser grace à votre brouilleur !";
	}else
	{
		hint "La sacoche C4 à bien été récupérée !";
	};
}else
{
	hint "BOUMMMMM :)";
	_bombe_sfp = "Bo_Mk82" createVehicle (position player);
};

deletevehicle _la_sacoche;

closedialog 0;

waituntil {!dialog;};
cutText["","BLACK IN"];	