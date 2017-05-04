// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (player getvariable "item_medicaments_sfp" < 1) exitwith {hint "Désolé, vous n'avez pas assez de médicaments sur vous !";};
if (!isnil "temps_activation_effet_drogue_medicaments") exitwith {hint "Désolé, vous êtes déja sous l'effet des médicaments !";};

if (isnil "temps_activation_effet_drogue_medicaments") then {temps_activation_effet_drogue_medicaments = round (1000 + (random 800));};


hint "! EFFET DES DROGUES ! \n -------------------------------------------- \n\n Bonjour, \n\n Vous venez de prendre des médicaments ... \n Cette drogue va agir sur votre capacité de regénération de votre vie ! \n\n Votre taux de regénération passe de 75 Pourcent à 35 Pourcent ;) \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
player setVariable['item_medicaments_sfp',(player getVariable 'item_medicaments_sfp') - 35,true];
player setVariable['usedspace',(player getVariable 'usedspace') - 35,true];
player setVariable['j_ai_prit_des_medicaments',1,true];

while {temps_activation_effet_drogue_medicaments > 0} do
{	
	temps_activation_effet_drogue_medicaments = temps_activation_effet_drogue_medicaments - 2;
	sleep 2;
}; 

temps_activation_effet_drogue_medicaments = nil;
player setVariable['j_ai_prit_des_medicaments',nil,true];