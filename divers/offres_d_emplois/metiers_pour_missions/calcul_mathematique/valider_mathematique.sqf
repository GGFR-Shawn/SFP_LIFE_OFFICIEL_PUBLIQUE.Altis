// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (maximum_de_reponse_mathematique < 1) exitwith {hint "Tu as répondu à tous les calculs pour le moment ! \n\n Reviens plus tard ;)";};
if ((ctrlText 11117) == "") exitwith {hint "Désolé, vous n'avez rien tapé !";};
if (parseNumber (ctrlText 11117) == 0) exitwith {hint "Désolé, 0 n'est pas valide !";};

_ma_reponse = parseNumber (ctrlText 11117);
maximum_de_reponse_mathematique = round (maximum_de_reponse_mathematique - 1);
if (maximum_de_reponse_mathematique < 1) then {execVM 'divers\offres_d_emplois\metiers_pour_missions\calcul_mathematique\securite_mathematique_nombre.sqf';};

if (_ma_reponse != la_reponse_au_calcul) then
{
	_argent_perdu_mathematique = round (random 20);
	player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") - _argent_perdu_mathematique,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! CALCUL MATHEMATIQUE ! \n -------------------------- \n\n  Désolé, la réponse n'était pas %1 mais %2 ! \n\n Vous avez perdu %3 Euros :) \n\n Il vous reste encore %4 réponses à donner pour le moment ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",_ma_reponse, la_reponse_au_calcul, _argent_perdu_mathematique, maximum_de_reponse_mathematique];	

	la_reponse_au_calcul = nil;
	closedialog 0;
}else
{
	_argent_gagne_mathematique = round (random 50);
	player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + _argent_gagne_mathematique,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! CALCUL MATHEMATIQUE ! \n -------------------------- \n\n  Bien joué ! \n\n La réponse était bien %1, tu as donc gagné %2 Euros \n\n Il vous reste encore %3 réponses à donner pour le moment \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",_ma_reponse, _argent_gagne_mathematique, maximum_de_reponse_mathematique];		

	la_reponse_au_calcul = nil;
	closedialog 0;
};

