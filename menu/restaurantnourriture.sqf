//script by SFP MAXOU

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";

// Trigger
le_prix_de_larticle = 35;
le_nom_de_larticle = "Kebab";

// Maison
_verif_maison = ((nearestObjects [getPosATL player, ["house"], 6]) select 0);
if (!isnil "_verif_maison") then 
{
	if (!isnil {_verif_maison getvariable "proprietaire_de_la_maison"}) then
	{
		if ((name player) in (_verif_maison getvariable "proprietaire_de_la_maison")) then
		{
			le_prix_de_larticle = 0; le_nom_de_larticle = "menu gastronomique";
		};
	};
};


if(sfp_config_activer_faim) then
{
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		if (player getVariable "niveau_de_faim" < 100) then
		{
			if (patron_des_ressources_du_serveur <= 0) exitwith {hint "! SYSTEME DE VIE SFP ! \n ---------------------------------- \n\n Il est impossible de manger maintenant puisque les ressources disponible de l'île sont de 0 ! \n\n Vends des produits au marché pour augmenter celui ci ! \n ------------------------------------------------ \n www.sfpteam.fr \n By SFP Maxou";};
			patron_des_ressources_du_serveur = round (patron_des_ressources_du_serveur - 2);
			publicvariable "patron_des_ressources_du_serveur";
			if (patron_des_ressources_du_serveur < 0) then {patron_des_ressources_du_serveur = 0; publicvariable "patron_des_ressources_du_serveur";};

			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format ["Un bon %1 ... Je te prépare ca! Patiente.",le_nom_de_larticle];
			sleep 6;
			player setVariable["niveau_de_faim",100,false];
			if (sfp_config_activer_toilette) then {player setvariable ["toilette_by_sfp_maxou",(player getvariable "toilette_by_sfp_maxou") - 15,false];};
			sleep 6;
			hint format['Vous avez acheté un %1 pour %2 Euros! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		}else
		{
			hint "Vous n'avez pas faim ...";
		};
	}else 
	{
		hint "Vous n'avez pas d'argent en poche ! Revenez avec 35 euros.";
	};
}else 
{
	hint "Désolé cette fonction n'est pas activée sur ce serveur.";
};