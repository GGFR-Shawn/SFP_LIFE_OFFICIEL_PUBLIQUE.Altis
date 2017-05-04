// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Triger
le_prix_de_larticle = 22;
le_nom_de_larticle = "bonne biere";

// Maison
_verif_maison = ((nearestObjects [getPosATL player, ["house"], 6]) select 0);
if (!isnil "_verif_maison") then 
{
	if (!isnil {_verif_maison getvariable "proprietaire_de_la_maison"}) then
	{
		if ((name player) in (_verif_maison getvariable "proprietaire_de_la_maison")) then
		{
			le_prix_de_larticle = 0;
			le_nom_de_larticle = "bonne biere fait maison";
		};
	};
};
	

if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
{
	if (isnil "jaieteaubar") then {jaieteaubar = 0;};
	if (jaieteaubar < 1) then
	{
		if (patron_des_ressources_du_serveur <= 0) exitwith {hint "! SYSTEME DE VIE SFP ! \n ---------------------------------- \n\n Il est impossible de boire de l'alcool maintenant puisque les ressources disponible de l'île sont de 0 ! \n\n Vends des produits au marché pour augmenter celui ci ! \n ------------------------------------------------ \n www.sfpteam.fr \n By SFP Maxou";};
		patron_des_ressources_du_serveur = round (patron_des_ressources_du_serveur - 2);
		publicvariable "patron_des_ressources_du_serveur";
		if (patron_des_ressources_du_serveur < 0) then {patron_des_ressources_du_serveur = 0; publicvariable "patron_des_ressources_du_serveur";};
		
		player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		jaieteaubar = 1;
		hint "Prépare toi à boire la meilleure bière du monde ... La Altis1664 ! Fabriquée localement, par nos travailleurs acharnés :)";
		sleep 7;
		hint "Tu vas ressentir les effets de l'alcool d'ici peu de temps ... \n\n N'oublie pas de faire pipi après ;)";
		sleep 4;
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		sleep (1 + (random 10));
		if (sfp_config_activer_dormir) then {player setVariable["fautdormir",(player getVariable "fautdormir") + (round (random 50)),false];};
		player setVariable ['jaibu_by_sfp_maxou', (ceil (random 35) * 0.12),true];
		if (sfp_config_activer_soif) then {niveau_de_soif = round (niveau_de_soif - (round (random 15)));};
		if (sfp_config_activer_toilette) then {player setvariable ["toilette_by_sfp_maxou",(player getvariable "toilette_by_sfp_maxou") - 15,false];};
		execVM "divers\alcool.sqf";
		sleep 1800;
		jaieteaubar = 0;
	}else
	{
		hint "Patiente 30 minutes, tu viens déjà de venir au bar ivrogne ! \n\n Sache que plus tu as d'alcool dans le sang, plus l'effet est fort !";
	};
}else 
{
	hint format ["Vous n'avez pas d'argent en poche ! Revenez avec %1 euros.", le_prix_de_larticle];
};