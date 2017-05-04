// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

/*
	Nom du farming
	Variable
	Place dans l'inventaire pour 1 farming
	Prix Par Unite
*/

//Attention a laisser absolument dans cet ordre !!!! //
listes_des_farming_du_marche_legal =
[
	["Bois","item_bois_sfp",listes_des_farming_avec_parametre select 11 select 2,prixdubois, listes_des_farming_avec_parametre select 11 select 6], // 1
	["Cuivre Transforme","item_cuivre_transforme_sfp",listes_des_farming_avec_parametre select 13 select 2,prixducuivre, listes_des_farming_avec_parametre select 13 select 6], // 2
	["Lapins","item_lapins_sfp",listes_des_farming_avec_parametre select 14 select 2,prixdulapins, listes_des_farming_avec_parametre select 14 select 6], // 3
	["Or","item_or_transforme_sfp",listes_des_farming_avec_parametre select 16 select 2,prixdelor, listes_des_farming_avec_parametre select 16 select 6], // 4
	["Petrole","item_petrole_traite_sfp",listes_des_farming_avec_parametre select 18 select 2,prixdupetrole, listes_des_farming_avec_parametre select 18 select 6], // 5
	["Poissons","item_poissons_sfp",listes_des_farming_avec_parametre select 19 select 2,prixdupoisson, listes_des_farming_avec_parametre select 19 select 6], // 6
	["Poissons Panes","itemfishpoissonspanes",listes_des_farming_avec_parametre select 45 select 2,prixdupoissonspanes, listes_des_farming_avec_parametre select 45 select 6], // 7
	["Pomme De Terre","item_pomme_de_terre_sfp",listes_des_farming_avec_parametre select 20 select 2,prixdespommesdeterre, listes_des_farming_avec_parametre select 20 select 6], // 8
	["Pomme","item_pomme_sfp",listes_des_farming_avec_parametre select 21 select 2,prixdespommes, listes_des_farming_avec_parametre select 21 select 6], // 9
	["Sel","item_sel_sfp",listes_des_farming_avec_parametre select 22 select 2,prixdusel, listes_des_farming_avec_parametre select 22 select 6], // 10
	["Truffe","item_truffe_sfp",listes_des_farming_avec_parametre select 23 select 2,prixdelatruffes, listes_des_farming_avec_parametre select 23 select 6], // 11
	["Serpent Non Transforme","serpent_non_transforme",listes_des_farming_avec_parametre select 46 select 2,prixserpentnontransforme, listes_des_farming_avec_parametre select 46 select 6] // 12
];

listes_des_farming_du_marche_illegal =
[
	["Baleine","item_baleine_sfp",listes_des_farming_avec_parametre select 0 select 2,prixdelabaleine, listes_des_farming_avec_parametre select 0 select 6], // 1
	["Canabis Traite","item_cannabis_traite_sfp",listes_des_farming_avec_parametre select 2 select 2,prixducannabis, listes_des_farming_avec_parametre select 2 select 6], // 2
	["Cocaine En Poudre","item_cocaine_poudre_sfp",listes_des_farming_avec_parametre select 4 select 2,prixdelacocaine, listes_des_farming_avec_parametre select 4 select 6], // 3
	["Heroine","item_heroine_traite_sfp",listes_des_farming_avec_parametre select 6 select 2,prixdelheroine, listes_des_farming_avec_parametre select 6 select 6], // 4
	["Médicaments","item_medicaments_sfp",listes_des_farming_avec_parametre select 7 select 2,prixdesmedicaments, listes_des_farming_avec_parametre select 7 select 6], // 5
	["Organes Animaux","item_organes_animaux_sfp",listes_des_farming_avec_parametre select 8 select 2,prixdesorganesanimaux, listes_des_farming_avec_parametre select 8 select 6], // 6
	["Plante Illégal","item_plante_illegale_prete_a_vendre_sfp",listes_des_farming_avec_parametre select 9 select 2,prixdelaplante, listes_des_farming_avec_parametre select 9 select 6], // 7
	["Requin","item_requin_sfp",listes_des_farming_avec_parametre select 10 select 2,prixdurequins, listes_des_farming_avec_parametre select 10 select 6], // 8
	["Venin De Serpent","serpent_transforme",listes_des_farming_avec_parametre select 47 select 2,prixserpenttransforme, listes_des_farming_avec_parametre select 47 select 6] // 9
];
