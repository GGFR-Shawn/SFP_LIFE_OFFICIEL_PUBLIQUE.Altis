//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (!hasInterface) exitwith {};

waituntil {sleep 1;!isnil "argent_recompense_onze";};
waituntil {sleep 0.1;!alive quel_objet_prendre_choisit_un_confirmation_onze;};


if (player distance quel_objet_prendre_choisit_un_confirmation_onze < 130) then
{
	if (vehicle player != player && player distance quel_objet_prendre_choisit_un_confirmation_onze < 5) exitwith {vehicle player setdamage 1;quel_objet_prendre_choisit_un_confirmation_onze = nil;argent_recompense_onze = nil;};

	player globalchat format ["Suite au décés d'un bot terroriste, tu viens de gagner %1 euros !",argent_recompense_onze];
	sleep 1;
	player setVariable ['mon_argent_poche_by_sfp_maxou', (player getvariable "mon_argent_poche_by_sfp_maxou") + argent_recompense_onze,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
};
quel_objet_prendre_choisit_un_confirmation_onze = nil;
argent_recompense_onze = nil;