// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
if (isnil "je_commence_a_gagner_argent_depanneur") then {je_commence_a_gagner_argent_depanneur = 0;};
if (je_commence_a_gagner_argent_depanneur >= 1) exitwith {};
je_commence_a_gagner_argent_depanneur = 1;
argent_gagner_depanneur_en_roulant = 0;
temps_rouler_depanneur = 0;

_veh = _this select 0;

waituntil {sleep 1; player in _veh && speed player >= 1 && alive player};

if (player in _veh && speed player >= 1 && alive player) then {hint "Vous gagnez de l'argent temps que vous êtes dans votre dépanneuse et que vous bougiez ! \n\n 15 Euros par minutes roulé !";};

while {alive player && alive _veh && player in _veh} do
{
	if (speed (vehicle player) >= 1) then 
	{
		argent_gagner_depanneur_en_roulant = argent_gagner_depanneur_en_roulant + 0.09;
		temps_rouler_depanneur = round (temps_rouler_depanneur + 1);
		sleep 1;
	};
};


if (temps_rouler_depanneur > 0) then
{
	player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + argent_gagner_depanneur_en_roulant,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

	hint format['Vous avez gagné %1 euros grace à votre tournée de remorquage qui a durée %2 secondes.',argent_gagner_depanneur_en_roulant,temps_rouler_depanneur];
};

je_commence_a_gagner_argent_depanneur = nil;
