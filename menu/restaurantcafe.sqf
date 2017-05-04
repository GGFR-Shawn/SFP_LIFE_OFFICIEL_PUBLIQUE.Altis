// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Triger
le_prix_de_larticle = 21;

// Maison
_verif_maison = ((nearestObjects [getPosATL player, ["house"], 6]) select 0);
if (!isnil "_verif_maison") then 
{
	if (!isnil {_verif_maison getvariable "proprietaire_de_la_maison"}) then
	{
		if ((name player) in (_verif_maison getvariable "proprietaire_de_la_maison")) then
		{
			le_prix_de_larticle = 0; le_nom_de_larticle = "cafe";
		};
	};
};
	

if (player getvariable "thirstLevel_cafe" > 0) exitwith {hint "Désolé, tu as déja prit un café !";};
	
if ((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
{
	if (patron_des_ressources_du_serveur <= 0) exitwith {hint "! SYSTEME DE VIE SFP ! \n ---------------------------------- \n\n Il est impossible de boire un café maintenant puisque les ressources disponible de l'île sont de 0 ! \n\n Vends des produits au marché pour augmenter celui ci ! \n ------------------------------------------------ \n www.sfpteam.fr \n By SFP Maxou";};
	patron_des_ressources_du_serveur = round (patron_des_ressources_du_serveur - 2);
	publicvariable "patron_des_ressources_du_serveur";
	if (patron_des_ressources_du_serveur < 0) then {patron_des_ressources_du_serveur = 0; publicvariable "patron_des_ressources_du_serveur";};
			
	player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable "mon_argent_banque_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	if (sfp_config_activer_dormir) then {player setVariable["fautdormir",(player getvariable "fautdormir") + 9,false]; if (player getvariable "fautdormir" > 100) then {player setvariable ["fautdormir",100,false];};};
	if (sfp_config_activer_soif) then {niveau_de_soif = round (niveau_de_soif + 7);if (niveau_de_soif > 100) then {niveau_de_soif = 100;};};
	player setVariable["thirstLevel_cafe",100,false];
	if (sfp_config_activer_toilette) then {player setvariable ["toilette_by_sfp_maxou",(player getvariable "toilette_by_sfp_maxou") - 6,false];};
	hint "Tu viens de prendre un bon café made in Altis ! Ton temps de fatigue descendra moins rapidement jusqu'à la fin de l'effet !";
	hint format['Tu viens de prendre un bon café made in Altis ! Ton temps de fatigue descendra moins rapidement ! \n\n Ce café vous à coutez %1 Euros ! Il vous reste donc %2 Euros !',le_prix_de_larticle, (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];
}else 
{
	hint "Vous n'avez pas d'argent en poche ! Revenez avec 21 euros.";
};