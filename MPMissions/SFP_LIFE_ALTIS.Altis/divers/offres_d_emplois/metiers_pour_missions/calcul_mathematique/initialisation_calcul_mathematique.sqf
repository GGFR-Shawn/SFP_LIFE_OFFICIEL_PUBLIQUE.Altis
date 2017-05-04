// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "je_ferme_les_mathematique") then {je_ferme_les_mathematique = 0;};
if (isnil "securite_calcul_mathematique") then {securite_calcul_mathematique = 0;};
if (isnil "maximum_de_reponse_mathematique") then {maximum_de_reponse_mathematique = 20;};

if (securite_calcul_mathematique >= 1) exitwith {hint format ["Tu viens déja de faire une série de calcul, reviens dans %1 secondes !",securite_calcul_mathematique_temps];};
securite_calcul_mathematique = 1;
execVM 'divers\offres_d_emplois\metiers_pour_missions\calcul_mathematique\securite_mathematique_spam.sqf';

while {je_ferme_les_mathematique < 1} do
{
	createDialog "Emploi_Calcul_Mathematique";
	noesckeydeux_mathematique = (findDisplay 55844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
	
	_choix_calcul_un = ["+", "-", "/", "*"] call BIS_fnc_selectRandom;
	
	if (_choix_calcul_un == "+") then
	{
		_choix_calcul_deux = (round (1 + (random 99999)));
		_choix_calcul_trois = (round (1 + (random 9999)));
		
		le_calcul_mathematique = format ["%1 + %2",_choix_calcul_deux, _choix_calcul_trois];
		la_reponse_au_calcul = round (_choix_calcul_deux + _choix_calcul_trois); 
	};
	if (_choix_calcul_un == "-") then
	{
		_choix_calcul_deux = (round (1 + (random 99999)));
		_choix_calcul_trois = (round (1 + (random 9999)));
		
		le_calcul_mathematique = format ["%1 - %2",_choix_calcul_deux, _choix_calcul_trois];
		la_reponse_au_calcul = round (_choix_calcul_deux - _choix_calcul_trois); 
	};
	if (_choix_calcul_un == "/") then
	{
		_choix_calcul_deux = (round (1 + (random 999)));
		_choix_calcul_trois = (round (1 + (random 9)));
		
		le_calcul_mathematique = format ["%1 / %2",_choix_calcul_deux, _choix_calcul_trois];
		la_reponse_au_calcul = round (_choix_calcul_deux / _choix_calcul_trois); 
	};
	if (_choix_calcul_un == "*") then
	{
		_choix_calcul_deux = (round (1 + (random 999)));
		_choix_calcul_trois = (round (1 + (random 9)));
		
		le_calcul_mathematique = format ["%1 * %2",_choix_calcul_deux, _choix_calcul_trois];
		la_reponse_au_calcul = round (_choix_calcul_deux * _choix_calcul_trois); 
	};

	ctrlSetText[11115,"   ... Calcul Mathématique By Maxou ..."];
	ctrlSetText[11116,format["Répondez à (%1) ...	",le_calcul_mathematique]];
	
	waituntil {!dialog};
};

je_ferme_les_mathematique = nil;
(findDisplay 55844) displayRemoveEventHandler ["KeyDown", noesckeydeux_mathematique];
hint "! CALCUL MATHEMATIQUE ! \n -------------------------- \n\n  A bientôt ;) \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";	
