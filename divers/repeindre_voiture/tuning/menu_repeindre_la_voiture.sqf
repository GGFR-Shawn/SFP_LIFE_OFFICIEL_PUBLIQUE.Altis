// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] spawn
{
	hint "! PEINTURE BOMBE ! \n -------------------------------------------- \n \n Bienvenu dans la salle de peinture ! \n Le fonctionnement : \n\n 1) Choisit ta couleur en faisant glisser les curseurs. \n 2) Une fois la couleur choisit, il te suffit de fermer le dialogue ! \n\n Bonne peinture ;).  \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	sleep 4;
};

if (isnil "le_vehicule_a_tunner_by_maxou") exitwith {hint "! PEINTURE BOMBE ! \n -------------------------------------------- \n \n Erreur sur la selection du véhicule ... Recommence. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil {le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable"}) exitwith {hint "! PEINTURE BOMBE ! \n -------------------------------------------- \n \n Désolé, ce n'est pas le véhicule d'un joueur ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! PEINTURE BOMBE ! \n -------------------------------------------- \n \n Désolé, ce n'est pas ton véhicule ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

closedialog 0;

createDialog "Menu_Repeindre_La_Voiture";

{sliderSetSpeed [_x, 0.2, 0.2];} foreach [1900,1901,1902,1903];

couleur_modifie_peinture_slider_un_by_maxou = 0;
couleur_modifie_peinture_slider_deux_by_maxou = 0;
couleur_modifie_peinture_slider_trois_by_maxou = 0;
couleur_modifie_peinture_slider_quatre_by_maxou = 1;
appliquer_couleur = "#(rgb,8,8,3)color(0,0,0,0)";

waituntil {sleep 0.045;!dialog};

le_prix_de_larticle = 340;
hint "! PEINTURE BOMBE ! \n -------------------------------------------- \n \n Ta voiture à bien été repeinte ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

le_vehicule_a_tunner_by_maxou setObjectTextureGlobal [0,appliquer_couleur];
le_vehicule_a_tunner_by_maxou setvariable ["peinture_a_la_bombe_resultat",1,true];
le_vehicule_a_tunner_by_maxou setvariable ["peinture_a_la_bombe",appliquer_couleur,true];

player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - 340,true];

le_vehicule_a_tunner_by_maxou = nil;
appliquer_couleur = nil;
couleur_modifie_peinture_slider_un_by_maxou = nil;
couleur_modifie_peinture_slider_deux_by_maxou = nil;
couleur_modifie_peinture_slider_trois_by_maxou = nil;
couleur_modifie_peinture_slider_quatre_by_maxou = nil;