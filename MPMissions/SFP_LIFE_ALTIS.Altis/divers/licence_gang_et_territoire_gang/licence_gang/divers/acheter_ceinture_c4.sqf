//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

le_prix_de_larticle = 17000;
le_nom_de_larticle = "une ceinture de c4";

if (isnil {player getvariable "licence_gang_v2"}) exitwith {hint "Vous devez faire partie d'un gang pour acheter cette ceinture !";};
if (player getVariable "mon_argent_poche_by_sfp_maxou" < le_prix_de_larticle) exitwith {hint "Vous n'avez pas d'argent en poche ! Revenez avec 145000 euros.";};
if (vest player == "SFP_Vest_Suicide") exitwith {hint "Vous avez déja une ceinture c4 !";};
if (vest player != "") exitwith {hint "Vous avez une veste sur vous, enlevez la !";};

player addvest "SFP_Vest_Suicide";

player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint "Du c4 vient d'être fixé sur toi, un menu FAIT PETER LE C4 vient d'apparaitre dans les options du menu.";
sleep 6;
hint format['Vous avez acheté %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
