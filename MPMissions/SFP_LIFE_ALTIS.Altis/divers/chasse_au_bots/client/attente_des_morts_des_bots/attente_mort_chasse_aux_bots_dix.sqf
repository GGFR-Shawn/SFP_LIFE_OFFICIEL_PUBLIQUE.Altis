//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (!hasInterface) exitwith {};

waituntil {sleep 1;!isnil "argent_recompense_dix";};
waituntil {sleep 0.1;!alive quel_objet_prendre_choisit_un_confirmation_dix;};


if (player distance quel_objet_prendre_choisit_un_confirmation_dix < 130) then
{
	if (vehicle player != player && player distance quel_objet_prendre_choisit_un_confirmation_dix < 5) exitwith {quel_objet_prendre_choisit_un_confirmation_dix = nil;argent_recompense_dix = nil;vehicle player setdamage 1;};

	player globalchat format ["Suite au décés d'un bot terroriste, tu viens de gagner %1 euros !",argent_recompense_dix];
	sleep 1;
	player setVariable ['mon_argent_poche_by_sfp_maxou', (player getvariable "mon_argent_poche_by_sfp_maxou") + argent_recompense_dix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
};
quel_objet_prendre_choisit_un_confirmation_dix = nil;
argent_recompense_dix = nil;