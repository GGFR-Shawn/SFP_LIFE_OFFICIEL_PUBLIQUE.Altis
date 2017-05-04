//script by SFP MAXOU

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";

// Triger
le_prix_de_larticle = 14;
le_nom_de_larticle = "volvic";

// Maison
_verif_maison = ((nearestObjects [getPosATL player, ["house"], 6]) select 0);
if (!isnil "_verif_maison") then 
{
	if (!isnil {_verif_maison getvariable "proprietaire_de_la_maison"}) then
	{
		if ((name player) in (_verif_maison getvariable "proprietaire_de_la_maison")) then
		{
			le_prix_de_larticle = 0; le_nom_de_larticle = "volvic";
		};
	};
};
	
if(sfp_config_activer_soif) then
{
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		if (niveau_de_soif < 100) then
		{
			if (patron_des_ressources_du_serveur <= 0) exitwith {hint "! SYSTEME DE VIE SFP ! \n ---------------------------------- \n\n Il est impossible de boire de l'eau maintenant puisque les ressources disponible de l'île sont de 0 ! \n\n Vends des produits au marché pour augmenter celui ci ! \n ------------------------------------------------ \n www.sfpteam.fr \n By SFP Maxou";};
			patron_des_ressources_du_serveur = round (patron_des_ressources_du_serveur - 2);
			publicvariable "patron_des_ressources_du_serveur";
			if (patron_des_ressources_du_serveur < 0) then {patron_des_ressources_du_serveur = 0; publicvariable "patron_des_ressources_du_serveur";};

			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint "Une bonne volvic rien de mieux lol, je te prépare ca ! Patiente.";
			sleep 6;
			niveau_de_soif = 100;
			if (sfp_config_activer_toilette) then {player setvariable ["toilette_by_sfp_maxou",(player getvariable "toilette_by_sfp_maxou") - 15,false];};
			hint "Tu es de nouveau bien hydraté !\n\n N'oublie pas de faire pipi ;)";
			sleep 6;
			hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		} 
		else 
		{
			hint "Vous n'avez pas soif ...";
		};
	}else 
	{
		hint "Vous n'avez pas d'argent en banque ! Revenez avec 10 euros.";
	};
}else 
{
	hint "Cette fonction n'est pas activée sur ce serveur.";
};