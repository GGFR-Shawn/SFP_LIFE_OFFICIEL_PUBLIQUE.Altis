// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (player getvariable "item_cocaine_poudre_sfp" < 10) exitwith {hint "Désolé, vous n'avez pas assez de cocaine sur vous !";};
if (!isnil "temps_activation_effet_drogue_cocaine") exitwith {hint "Désolé, vous êtes déja sous l'effet de la cocaine !";};

if (isnil "temps_activation_effet_drogue_cocaine") then {temps_activation_effet_drogue_cocaine = round (600 + (random 800));};


hint "! EFFET DES DROGUES ! \n -------------------------------------------- \n\n Bonjour, \n\n Vous venez de prendre de la cocaine ... \n Cette drogue va agir sur votre capacité à travailler ! \n\n Votre temps de farming sera donc plus rapide ;) \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
player setVariable['item_cocaine_poudre_sfp',(player getVariable 'item_cocaine_poudre_sfp') - 10,true];
player setVariable['usedspace',(player getVariable 'usedspace') - 10,true];
player setVariable['j_ai_prit_de_la_cocaine',1,true];

while {temps_activation_effet_drogue_cocaine > 0} do
{	
	temps_activation_effet_drogue_cocaine = temps_activation_effet_drogue_cocaine - 2;
	sleep 2;
}; 

temps_activation_effet_drogue_cocaine = nil;
player setVariable['j_ai_prit_de_la_cocaine',nil,true];