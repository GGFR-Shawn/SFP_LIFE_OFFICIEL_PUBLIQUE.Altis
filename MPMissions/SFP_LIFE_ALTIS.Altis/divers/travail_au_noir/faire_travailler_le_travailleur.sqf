// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_travailleur = _this select 0;
if (isnil "_le_travailleur") exitwith {hint "Erreur recherche travailleur au noir ...";};

_temps_attente_travailleur_avant_mise_a_jour_script = 3;
_temps_initialisation_pour_argent_travailleur = 0;
_temps_avant_remporte_argent_travailleur = (200 + (random 600));
_temps_securite_max_travailleur = 2700; // 45 minutes

if ((round (random 2)) == 1) then
{
	[[[position _le_travailleur],"divers\travail_au_noir\avertir_gendarme_travailleur_au_noir.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
};


while {alive _le_travailleur && _le_travailleur getvariable "je_peux_travailler" >= 1} do
{
	sleep _temps_attente_travailleur_avant_mise_a_jour_script;
	
	_temps_initialisation_pour_argent_travailleur = round (_temps_initialisation_pour_argent_travailleur + _temps_attente_travailleur_avant_mise_a_jour_script);
	_temps_securite_max_travailleur = round (_temps_securite_max_travailleur - _temps_attente_travailleur_avant_mise_a_jour_script);
	
	if (_temps_initialisation_pour_argent_travailleur >= _temps_avant_remporte_argent_travailleur) then
	{
		_temps_initialisation_pour_argent_travailleur = 0;
		_argent_gagner_par_mon_travailleur = round (200 + random 600);
		player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + _argent_gagner_par_mon_travailleur,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player globalchat format ["Vous avez gagné %1 Euros grace à %2, votre travailleur au noir ...",_argent_gagner_par_mon_travailleur, name _le_travailleur];
	};
	
	if (_temps_securite_max_travailleur <= 0) then
	{
		_le_travailleur setvariable ["je_peux_travailler",0,true];
		player globalchat format ["Votre travailleur %1 vient d'arreter de travailler ... Il est épuisé !", name _le_travailleur];
		player globalchat format ["Votre travailleur %1 vient d'arreter de travailler ... Il est épuisé !", name _le_travailleur];
		player globalchat format ["Votre travailleur %1 vient d'arreter de travailler ... Il est épuisé !", name _le_travailleur];
		player globalchat format ["Votre travailleur %1 vient d'arreter de travailler ... Il est épuisé !", name _le_travailleur];
	};
	
	if (!alive _le_travailleur) then
	{
		_check_joueur_autour_travailleur = ((nearestObjects [player, ["Man"], 7]) select 0);
		
		if (side _check_joueur_autour_travailleur == west) then
		{
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Le gendarme %2 vient de le découvrir !", name _le_travailleur, name _check_joueur_autour_travailleur];	
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Le gendarme %2 vient de le découvrir !", name _le_travailleur, name _check_joueur_autour_travailleur];	
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Le gendarme %2 vient de le découvrir !", name _le_travailleur, name _check_joueur_autour_travailleur];	
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Le gendarme %2 vient de le découvrir !", name _le_travailleur, name _check_joueur_autour_travailleur];	
		}else
		{
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Aucun gendarme ne la découvert !", name _le_travailleur];			
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Aucun gendarme ne la découvert !", name _le_travailleur];			
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Aucun gendarme ne la découvert !", name _le_travailleur];			
			player globalchat format ["Votre travailleur %1 vient de mourrir ! Aucun gendarme ne la découvert !", name _le_travailleur];			
		};
	};
};
