// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (player getvariable "item_cannabis_traite_sfp" < 1) exitwith {hint "Désolé, vous n'avez pas assez de cannabis sur vous !";};
if (!isnil "temps_activation_effet_drogue_cannabis") exitwith {hint "Désolé, vous êtes déja sous l'effet du cannabis !";};

if (isnil "temps_activation_effet_drogue_cannabis") then {temps_activation_effet_drogue_cannabis = round (600 + (random 800));};


hint "! EFFET DES DROGUES ! \n -------------------------------------------- \n\n Bonjour, \n\n Vous venez de prendre du cannabis ... \n Cette drogue va agir sur votre capacité d'éveil ! \n\n Votre temps de sommeil ne diminuera donc pas ;) \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
player setVariable['item_cannabis_traite_sfp',(player getVariable 'item_cannabis_traite_sfp') - 1,true];
player setVariable['usedspace',(player getVariable 'usedspace') - 25,true];
player setVariable['j_ai_prit_du_cannabis',1,true];

while {temps_activation_effet_drogue_cannabis > 0} do
{	
	temps_activation_effet_drogue_cannabis = temps_activation_effet_drogue_cannabis - 2;
	sleep 2;
}; 

temps_activation_effet_drogue_cannabis = nil;
player setVariable['j_ai_prit_du_cannabis',nil,true];