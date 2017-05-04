// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (player getvariable "item_heroine_traite_sfp" < 10) exitwith {hint "Désolé, vous n'avez pas assez d'héroine sur vous !";};
if (!isnil "temps_activation_effet_drogue_heroine") exitwith {hint "Désolé, vous êtes déja sous l'effet de l'héroine !";};

if (isnil "temps_activation_effet_drogue_heroine") then {temps_activation_effet_drogue_heroine = round (2000 + (random 2000));};


hint "! EFFET DES DROGUES ! \n -------------------------------------------- \n\n Bonjour, \n\n Vous venez de prendre de l'héroine ... \n Cette drogue va couper votre envie de manger et de boire ;) \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
player setVariable['item_heroine_traite_sfp',(player getVariable 'item_heroine_traite_sfp') - 10,true];
player setVariable['usedspace',(player getVariable 'usedspace') - 25,true];
player setVariable['j_ai_prit_de_l_heroine',1,true];

while {temps_activation_effet_drogue_heroine > 0} do
{	
	temps_activation_effet_drogue_heroine = temps_activation_effet_drogue_heroine - 2;
	sleep 2;
}; 

temps_activation_effet_drogue_heroine = nil;
player setVariable['j_ai_prit_de_l_heroine',nil,true];
