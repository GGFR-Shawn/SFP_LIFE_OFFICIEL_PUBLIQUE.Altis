// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_lavictim = cursortarget;

havedmission1inv = format [""]; // Existe plus
arme_holster_pistolet = format [""]; // Existe plus

if (!(_lavictim iskindof "Man")) exitWith {hint "Personne n'est pointé pour être fouillé !"};
if !(isplayer cursortarget) exitwith {hint "Ce n'est pas un joueur !";};
if (side _lavictim == west) exitwith {hint "Tu ne peux pas fouiller un collègue !";};

hint format ["Vous fouillez: %1 ...",name _lavictim];

sleep 3;

_green = "#FFFFFF";
_red = "#FF0000";
_black = "#000000";
_moneygreen =  "#B3FFB8";
_moneyred = "#FFB3B3";
_bankgreen =  "#FFFFFF";
_bankred = "#FF0000";
usedcolorinv = "#FF8F8F";


_spacecolor1 = "#FF8F8F";
_spacecolor2 = "#FFA78F";
_spacecolor3 = "#FFBA8F";
_spacecolor4 = "#FFD08F";
_spacecolor5 = "#FFE18F";
_spacecolor6 = "#FFF28F";
_spacecolor7 = "#F4FF8F";
_spacecolor8 = "#E1FF8F";
_spacecolor9 = "#CEFF8F";
_spacecolor10 = "#B2FF8F";
_spacecolor11 = "#8FFFC3";
_spacecolor12 = "#8FFFEA";
_spacecolor13 = "#8FF8FF";


if ((_lavictim getVariable "usedspace") == 0) then {
gotnothinginv = format ["<t color='#8EC0F8' size='1'>Il n'a rien dans son inventaire. <br/>"];
}
else {
gotnothinginv = format [""];
};

if ((_lavictim getVariable "item_poissons_sfp") > 0) then {
gotfishinv = format ["<t color='#8EC0F8' size='1'>Poissons:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_poissons_sfp")];
}
else {
gotfishinv = format [""];
};

if ((_lavictim getVariable "itemfishpoissonspanes") > 0) then {
gotfishpoissonspanesinv = format ["<t color='#8EC0F8' size='1'>Poissons panés:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "itemfishpoissonspanes")];
}
else {
gotfishpoissonspanesinv = format [""];
};

if ((_lavictim getVariable "item_truffe_sfp") > 0) then {
gottruffleinv = format ["<t color='#8EC0F8' size='1'>Truffes:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_truffe_sfp")];
}
else {
gottruffleinv = format [""];
};

if ((_lavictim getVariable "item_bois_sfp") > 0) then {
gotwoodinv = format ["<t color='#8EC0F8' size='1'>Bois:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_bois_sfp")];
}
else {
gotwoodinv = format [""];
};

if ((_lavictim getVariable "item_lapins_sfp") > 0) then {
gotmeatinv = format ["<t color='#8EC0F8' size='1'>Viande de lapin:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_lapins_sfp")];
}
else {
gotmeatinv = format [""];
};

if ((_lavictim getVariable "serpent_non_transforme") > 0) then {
got_serpent_non_transforme = format ["<t color='#8EC0F8' size='1'>Serpent Non Transformé :</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "serpent_non_transforme")];
}
else {
got_serpent_non_transforme = format [""];
};

if ((_lavictim getVariable "serpent_transforme") > 0) then {
got_serpent_transforme = format ["<t color='#FF8080' size='1'>Venin De Serpent:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "serpent_transforme")];
}
else {
got_serpent_transforme = format [""];
};

if ((_lavictim getVariable "gelule_amphetamines") > 0) then {
gotamphetaminesinv = format ["<t color='#FF8080' size='1'>Amphetamines:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "gelule_amphetamines")];
}
else {
gotamphetaminesinv = format [""];
};

if ((_lavictim getVariable "item_heroine_non_traite_sfp") > 0) then {
gotunpheroininv = format ["<t color='#FF8080' size='1'>Héroïne non transformés:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_heroine_non_traite_sfp")];
}
else {
gotunpheroininv = format [""];
};

if ((_lavictim getVariable "item_cuivre_non_transforme_sfp") > 0) then {
gotcuivreinv = format ["<t color='#8EC0F8' size='1'>Cuivre non transformés:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_cuivre_non_transforme_sfp")];
}
else {
gotcuivreinv = format [""];
};

if ((_lavictim getVariable "item_cuivre_transforme_sfp") > 0) then {
gotcuivretransfoinv = format ["<t color='#8EC0F8' size='1'>Lingots de cuivre:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_cuivre_transforme_sfp")];
}
else {
gotcuivretransfoinv = format [""];
};

if ((_lavictim getVariable "item_or_transforme_sfp") > 0) then {
gotortraiteinv = format ["<t color='#8EC0F8' size='1'>Lingots d'or:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_or_transforme_sfp")];
}
else {
gotortraiteinv = format [""];
};

if ((_lavictim getVariable "item_heroine_traite_sfp") > 0) then {
gotproheroininv = format ["<t color='#FF8080' size='1'>Traitement héroine:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_heroine_traite_sfp")];
}
else {
gotproheroininv = format [""];
};

if ((_lavictim getVariable "item_plante_pour_planter") > 0) then {
gotplanteaplanterinv = format ["<t color='#FF8080' size='1'>Plante à planter:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_plante_pour_planter")];
}
else {
gotplanteaplanterinv = format [""];
};

if ((_lavictim getVariable "item_plante_fertilisant_rouge") > 0) then {
gotplanteaplanterinv_fertilisant_rouge = format ["<t color='#FF8080' size='1'>Fertilisant Rouge:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_plante_fertilisant_rouge")];
}
else {
gotplanteaplanterinv_fertilisant_rouge = format [""];
};

if ((_lavictim getVariable "item_cannabis_traite_sfp") > 0) then {
gotcannabistraiteinv = format ["<t color='#FF8080' size='1'>Traitement canabis:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_cannabis_traite_sfp")];
}
else {
gotcannabistraiteinv = format [""];
};

if ((_lavictim getVariable "item_baleine_sfp") > 0) then {
gotwhaleinv = format ["<t color='#FF8080' size='1'>Morceau Baleine:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_baleine_sfp")];
}
else {
gotwhaleinv = format [""];
};

if ((_lavictim getVariable "item_requin_sfp") > 0) then {
gotrequininv = format ["<t color='#FF0000' size='1'>Morceau Requin:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_requin_sfp")];
}
else {
gotrequininv = format [""];
};

if ((_lavictim getVariable "item_plante_illegale_prete_a_vendre_sfp") > 0) then {
got_plante_illegale_prete_a_vendre_inv = format ["<t color='#FF0000' size='1'>Plante Illégale Récoltée:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_plante_illegale_prete_a_vendre_sfp")];
}
else {
got_plante_illegale_prete_a_vendre_inv = format [""];
};

if (!isnil {_lavictim getVariable "j_ai_prit_de_l_heroine"}) then {
il_prend_de_l_heroine = format ["<t color='#FF0000' size='1'>Sous L'Emprise D'Héroine</t><br/>"];
}
else {
il_prend_de_l_heroine = format [""];
};

if (!isnil {_lavictim getVariable "j_ai_prit_de_la_cocaine"}) then {
il_prend_de_la_cocaine = format ["<t color='#FF0000' size='1'>Sous L'Emprise De Cocaine</t><br/>"];
}
else {
il_prend_de_la_cocaine = format [""];
};

if (!isnil {_lavictim getVariable "j_ai_prit_des_medicaments"}) then {
il_prend_des_medicaments = format ["<t color='#FF0000' size='1'>Sous L'Emprise De Médicaments</t><br/>"];
}
else {
il_prend_des_medicaments = format [""];
};

if (!isnil {_lavictim getVariable "j_ai_prit_du_cannabis"}) then {
il_prend_du_cannabis = format ["<t color='#FF0000' size='1'>Sous L'Emprise De Cannabis</t><br/>"];
}
else {
il_prend_du_cannabis = format [""];
};

if ((_lavictim getVariable "item_cocaine_feuille_coca_sfp") > 0) then {
gotcocainefeuille = format ["<t color='#FF0000' size='1'>Feuille De Cocaine:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_cocaine_feuille_coca_sfp")];
}
else {
gotcocainefeuille = format [""];
};

if ((_lavictim getVariable "item_cocaine_poudre_sfp") > 0) then {
gotcocainepoudre = format ["<t color='#FF0000' size='1'>Poudre De Cocaine:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_cocaine_poudre_sfp")];
}
else {
gotcocainepoudre = format [""];
};

if ((_lavictim getVariable "item_cannabis_non_traite_sfp") > 0) then {
gotcannabisinv = format ["<t color='#FF0000' size='1'>Cannabis:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_cannabis_non_traite_sfp")];
}
else {
gotcannabisinv = format [""];
};

if ((_lavictim getVariable "item_medicaments_sfp") > 0) then {
gotmedicamentsinv = format ["<t color='#FF0000' size='1'>Médicaments:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_medicaments_sfp")];
}
else {
gotmedicamentsinv = format [""];
};

if ((_lavictim getVariable "item_organes_animaux_sfp") > 0) then {
gotorganesanimauxinv = format ["<t color='#FF0000' size='1'>Organes:</t><t color='#FF0000' size='1'> %1</t> <br/>", (_lavictim getVariable "item_organes_animaux_sfp")];
}
else {
gotorganesanimauxinv = format [""];
};

if (!isnil {_lavictim getvariable "bombe_porte_prison"}) then {
got_bombe_porte_prison_inv = format ["<t color='#FF0000' size='1'>Bombe Porte De Prison:</t><t color='#FF0000' size='1'> %1</t> <br/>", 1];
}
else {
got_bombe_porte_prison_inv = format [""];
};

if ((_lavictim getVariable "item_sel_sfp") > 0) then {
gotselinv = format ["<t color='#8EC0F8' size='1'>Sel:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_sel_sfp")];
}
else {
gotselinv = format [""];
};

if ((_lavictim getVariable "item_pomme_de_terre_sfp") > 0) then {
gotpommedeterreinv = format ["<t color='#8EC0F8' size='1'>Pomme De Terre:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_pomme_de_terre_sfp")];
}
else {
gotpommedeterreinv = format [""];
};

if ((_lavictim getVariable "item_or_non_transforme_sfp") > 0) then {
gotornontraiteinv = format ["<t color='#8EC0F8' size='1'>Or Non Traite:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_or_non_transforme_sfp")];
}
else {
gotornontraiteinv = format [""];
};

if ((_lavictim getVariable "item_pomme_sfp") > 0) then {
gotpommesinv = format ["<t color='#8EC0F8' size='1'>Pommes:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_pomme_sfp")];
}
else {
gotpommesinv = format [""];
};

if ((_lavictim getVariable "item_petrole_non_traite_sfp") > 0) then {
gotunpoilinv = format ["<t color='#8EC0F8' size='1'>Petrole brut:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_petrole_non_traite_sfp")];
}
else {
gotunpoilinv = format [""];
};

if ((_lavictim getVariable "item_petrole_traite_sfp") > 0) then {
gotprooilinv = format ["<t color='#8EC0F8' size='1'>Petrole traité:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "item_petrole_traite_sfp")];
}
else {
gotprooilinv = format [""];
};

if ((_lavictim getVariable "barredecereale") > 0) then {
gotcerealinventaireinv = format ["<t color='#4D57F4' size='1'>Barre Céréale:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "barredecereale")];
}
else {
gotcerealinventaireinv = format [""];
};

if ((_lavictim getVariable "bouteilledeau") > 0) then {
gotbouteilledeauinv = format ["<t color='#4D57F4' size='1'>Bouteille D'Eau:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "bouteilledeau")];
}
else {
gotbouteilledeauinv = format [""];
};

if ((_lavictim getVariable "traceur_vehicule") > 0) then {
got_traceur_vehicule_inv = format ["<t color='#4D57F4' size='1'>Traceur Véhicule:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "traceur_vehicule")];
}
else {
got_traceur_vehicule_inv = format [""];
};

if ((_lavictim getVariable "poignard_item") > 0) then {
gotpoignardinv = format ["<t color='#4D57F4' size='1'>Poignard:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "poignard_item")];
}
else {
gotpoignardinv = format [""];
};

if ((_lavictim getVariable "corde_et_sac") > 0) then {
got_corde_et_sac_inv = format ["<t color='#4D57F4' size='1'>Corde Et Sac:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "corde_et_sac")];
}
else {
got_corde_et_sac_inv = format [""];
};

if ((_lavictim getVariable "cocktail_molotov") > 0) then {
gotcocktailmolotov_inv = format ["<t color='#4D57F4' size='1'>Cocktail Molotov:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "cocktail_molotov")];
}
else {
gotcocktailmolotov_inv = format [""];
};

if ((_lavictim getVariable "brouilleur_sacoche_c4") > 0) then {
got_brouilleur_sacoche_c4_inv = format ["<t color='#4D57F4' size='1'>Brouilleur Sacoche C4:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "brouilleur_sacoche_c4")];
}
else {
got_brouilleur_sacoche_c4_inv = format [""];
};

if ((_lavictim getVariable "sacoche_de_c4") > 0) then {
got_sacoche_c4_inv = format ["<t color='#4D57F4' size='1'>Sacoche C4:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "sacoche_de_c4")];
}
else {
got_sacoche_c4_inv = format [""];
};

if ((_lavictim getVariable "redbull") > 0) then {
gotredbullinv = format ["<t color='#4D57F4' size='1'>RedBull:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "redbull")];
}
else {
gotredbullinv = format [""];
};

if ((_lavictim getVariable "hache_pour_coupe_de_bois") > 0) then {
gothachepourleboisinv = format ["<t color='#4D57F4' size='1'>Hache:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "hache_pour_coupe_de_bois")];
}
else {
gothachepourleboisinv = format [""];
};

if (!isnil {_lavictim getVariable "boite_allumette"}) then {
got_boite_allumette = format ["<t color='#4D57F4' size='1'>Boite allumette:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", 1];
}
else {
got_boite_allumette = format [""];
};

if (!isnil {_lavictim getVariable "corde_descente_rappel_sfp"}) then {
got_corde_descente_rappel_sfp = format ["<t color='#4D57F4' size='1'>Corde Rappel:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", "Oui."];
}
else {
got_corde_descente_rappel_sfp = format [""];
};

if (!isnil {_lavictim getVariable "marteau_sfp"}) then {
got_marteau_sfp = format ["<t color='#4D57F4' size='1'>Marteau:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", 1];
}
else {
got_marteau_sfp = format [""];
};

if ((_lavictim getVariable "canne_a_peche") > 0) then {
gotcanneapecheinv = format ["<t color='#4D57F4' size='1'>Canne A Peche:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "canne_a_peche")];
}
else {
gotcanneapecheinv = format [""];
};

if ((_lavictim getVariable "tente_pour_dormir") > 0) then {
gottenteinv = format ["<t color='#4D57F4' size='1'>Tente de couchage:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "tente_pour_dormir")];
}
else {
gottenteinv = format [""];
};

if ((_lavictim getVariable "seau_plante_illegal") > 0) then {
gotseauplanteillegalesinv = format ["<t color='#4D57F4' size='1'>Seau:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "seau_plante_illegal")];
}
else {
gotseauplanteillegalesinv = format [""];
};

if ((_lavictim getVariable "valise_pour_le_farming") > 0) then {
gotvaliseinv = format ["<t color='#4D57F4' size='1'>Valise Farming:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "valise_pour_le_farming")];
}
else {
gotvaliseinv = format [""];
};

if ((_lavictim getVariable "coffre_fort") > 0) then {
gotcoffrefortinv = format ["<t color='#4D57F4' size='1'>Coffre fort:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "coffre_fort")];
}
else {
gotcoffrefortinv = format [""];
};

if ((_lavictim getVariable "bidon_d_essence") > 0) then {
gotbidondessence = format ["<t color='#4D57F4' size='1'>Bidon D'Essence:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "bidon_d_essence")];
}
else {
gotbidondessence = format [""];
};

if ((_lavictim getVariable "gants_pour_petrole") > 0) then {
gotgantpetroleinv = format ["<t color='#4D57F4' size='1'>Gant Petrole:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "gants_pour_petrole")];
}
else {
gotgantpetroleinv = format [""];
};

if ((_lavictim getVariable "pied_de_biche") > 0) then {
gotpieddebicheinv = format ["<t color='#4D57F4' size='1'>Pied De Biche:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "pied_de_biche")];
}
else {
gotpieddebicheinv = format [""];
};

if ((_lavictim getVariable "harpon_pour_la_peche") > 0) then {
gotharponinv = format ["<t color='#4D57F4' size='1'>Harpon:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (_lavictim getVariable "harpon_pour_la_peche")];
}
else {
gotharponinv = format [""];
};

if (!isnil {_lavictim getvariable "permis_de_chasse"}) then {
havehuntinginv = format ["<t color='#D0BAFF' size='1'>Permis de chasse</t> <br/>"];
}
else {
havehuntinginv = format [""];
};

if ((_lavictim getVariable "license_permis_de_conduire_by_sfp_maxou") >= 1) then {
havedriverinv = format ["<t color='#D0BAFF' size='1'>Permis de conduire</t> <br/>"];
}
else {
havedriverinv = format [""];
};

if ((_lavictim getVariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou") == 1) then {
havedriverpoidlourdinv = format ["<t color='#D0BAFF' size='1'>Permis de conduire poid lourd</t> <br/>"];
}
else {
havedriverpoidlourdinv = format [""];
};

if (!isnil {player getvariable "licence_bateau_news"}) then {
haveboatinv = format ["<t color='#D0BAFF' size='1'>Permis bateaux</t> <br/>"];
}
else {
haveboatinv = format [""];
};

if (!isnil {_lavictim getvariable "license_pilote_news"}) then {
haveairinv = format ["<t color='#D0BAFF' size='1'>Licence pilote</t> <br/>"];
}
else {
haveairinv = format [""];
};

if (!isnil {_lavictim getvariable "permis_port_d_arme"}) then {
havepistolinv = format ["<t color='#D0BAFF' size='1'>Port d'armes</t> <br/>"]; 
}
else {
havepistolinv = format [""];
};

if (!isnil {_lavictim getvariable "licence_fusils"}) then {
haverifleinv = format ["<t color='#D0BAFF' size='1'>Licence fusils</t> <br/>"]; 
}
else {
haverifleinv = format [""];
};

if (!isnil {_lavictim getvariable "licence_petrole"}) then {
haveoilinv = format ["<t color='#D0BAFF' size='1'>Licence traitement Petrole</t> <br/>"]; 
}
else {
haveoilinv = format [""];
};

if (!isnil {_lavictim getvariable "licence_heroine"}) then {
haveheroininv = format ["<t color='#D0BAFF' size='1'>Licence traitement héroïne</t> <br/>"]; 
}
else {
haveheroininv = format [""];
};

if ((_lavictim getVariable "nombre_de_permis") >= 0) then {
nombredepermis = format ["<t color='#8EC0F8' size='1'>Nombres Permis achetés: %1.</t> <br/>", round (_lavictim getVariable "nombre_de_permis")];}
else {
nombredepermis = format [""];
};

if ((_lavictim getVariable "ma_date_de_naissance") > 0) then {
ma_date_de_naissance = _lavictim getvariable "ma_date_de_naissance";
if (ma_date_de_naissance >= 60) then {ma_date_de_naissance_calcul = ma_date_de_naissance / 60;}else {ma_date_de_naissance_calcul = _lavictim getvariable "ma_date_de_naissance";};
if (ma_date_de_naissance >= 60) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#8EC0F8' size='1'> %1 heures.</t> <br/>", round ma_date_de_naissance_calcul];};
if (ma_date_de_naissance < 60) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#8EC0F8' size='1'> %1 minutes.</t> <br/>", round ma_date_de_naissance_calcul];};
if (ma_date_de_naissance >= 999999999999999999) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#8EC0F8' size='1'> C'est jésus :)</t> <br/>"];};
}
else {
madatedenaissanceinv = format [""];
};

if (!isnil {_lavictim getvariable "recherche_pour_armes_illegales"}) then {
iswantedinv = parseText format ["Il est recherché pour armes illégales !<br/>"];
wantedcolorinv = _red;
}
else {
iswantedinv = parseText format [""];
wantedcolorinv = "#8EC0F8";
};

if (!isnil {_lavictim getvariable "recherche_pour_braquage"}) then {
iswantedbraquagebanqinv = parseText format ["Il est recherché pour braquage ! <br/>"];
wantedcolorbraquageinv = _red;
}
else {
iswantedbraquagebanqinv = parseText format [""];
wantedcolorbraquageinv = _green;
};

if (!isnil {_lavictim getvariable "recherche_pour_conduite_sans_permis"}) then {
isrechercherprcondtsspermisinv = parseText format ["Il est recherché pour conduite SS permis ! <br/>"];
colorrechercherprcondtsspermisinv = _red;
}
else {
isrechercherprcondtsspermisinv = parseText format [""];
colorrechercherprcondtsspermisinv = _green;
};


if (!isnil {_lavictim getvariable "licence_gang_v2"}) then {
ganglicenseinv = parseText format ["Il fait partie d'un gang ! <br/>"];
ganglicensecolorinv = _red;
}
else {
ganglicenseinv = parseText format [""];
ganglicensecolorinv = _green;
};

if (!isnil {_lavictim getvariable "sarl_depannage"}) then {
jetravailpoursarldepannage = format ["Travail : SARL DIR !<br/>"];
}
else {
jetravailpoursarldepannage = format [""];
};

if (!isnil {_lavictim getvariable "sarl_pompier"}) then {
jetravailpoursarlpompier = format ["Travail : SARL POMPIER !<br/>"];
}
else {
jetravailpoursarlpompier = format [""];
};

if (!isnil {_lavictim getvariable "jai_fait_un_cambriolage_news"}) then {
jaicambriolerunemaison = format ["Il est recherché pour cambriolage !<br/>"];
}
else {
jaicambriolerunemaison = format [""];
};

if (!isnil {_lavictim getvariable "sarl_avocat"}) then {
jetravailpoursarlavocat = format ["Travail : SARL AVOCAT !<br/>"];
}
else {
jetravailpoursarlavocat = format [""];
};

if (!isnil {_lavictim getvariable "sarl_taxis_gsept"}) then {
jetravailpoursarltaxigsept = format ["Travail : SARL TAXIS G7 !<br/>"];
}
else {
jetravailpoursarltaxigsept = format [""];
};

if (!isnil {_lavictim getvariable "sarl_neomedia"}) then {
jetravailpoursarlneomedia = format ["Travail : SARL NEOMEDIA !<br/>"];
}
else {
jetravailpoursarlneomedia = format [""];
};

if (!isnil {_lavictim getvariable "sarl_autoecole"}) then {
jetravailpoursarlautoecole = format ["Travail : SARL AUTOECOLE !<br/>"];
}
else {
jetravailpoursarlautoecole = format [""];
};

if ((_lavictim getVariable "mon_argent_poche_by_sfp_maxou") == 0) then {
moneycolorinv = _moneyred;
}
else {
moneycolorinv = _moneygreen;
};

if ((_lavictim getVariable "mon_argent_banque_by_sfp_maxou") == 1) then {
bankcolorinv = _bankred;
}
else {
bankcolorinv = _bankgreen;
};

if ((_lavictim getVariable "mon_argent_banque_by_sfp_maxou") >= 200000) then {
argentdelavictime = format ["> 200000"];
}
else {
argentdelavictime = format ["%1 %2",_lavictim getVariable "mon_argent_banque_by_sfp_maxou","€"];
};

if ((_lavictim getVariable "usedspace") > 65) then {
usedcolorinv = _black;
}
else {
if ((_lavictim getVariable "usedspace") > 47) then {
usedcolorinv = _spacecolor1;
}
else {
if ((_lavictim getVariable "usedspace") > 43) then {
usedcolorinv = _spacecolor2;
}
else {
if ((_lavictim getVariable "usedspace") > 40) then {
usedcolorinv = _spacecolor3;
}
else {
if ((_lavictim getVariable "usedspace") > 35) then {
usedcolorinv = _spacecolor4;
}
else {
if ((_lavictim getVariable "usedspace") > 33) then {
usedcolorinv = _spacecolor5;
}
else {
if ((_lavictim getVariable "usedspace") > 28) then {
usedcolorinv = _spacecolor6;
}
else {
if ((_lavictim getVariable "usedspace") > 25) then {
usedcolorinv = _spacecolor7;
}
else {
if ((_lavictim getVariable "usedspace") > 20) then {
usedcolorinv = _spacecolor8;
}
else {
if ((_lavictim getVariable "usedspace") > 15) then {
usedcolorinv = _spacecolor9;
}
else {
if ((_lavictim getVariable "usedspace") > 10) then {
usedcolorinv = _spacecolor10;
}
else {
if ((_lavictim getVariable "usedspace") > 5) then {
usedcolorinv = _spacecolor11;
}
else {
if ((_lavictim getVariable "usedspace") > 1) then {
usedcolorinv = _spacecolor12;
}
else {
if ((_lavictim getVariable "usedspace") == 0) then {
usedcolorinv = _spacecolor13;
}
else {
if ((_lavictim getVariable "usedspace") < 0) then {
usedcolorinv = _spacecolor1;
}
};};};};};};};};};};};};};};

_str = parseText format ["
<t color='#D9B398' size='1.2' align='left'>Son espace utilisé: <t color='#FFFFFF' size='1.1'>%2/%3</t></t>
<br/>
<t color='#D9B398' size='1.2' align='left'>Son argent en poche: <t color='#FFFFFF' size='1.1'>%5</t></t>
<br/>
<t color='#D9B398' size='1.2' align='left'>Son compte banquaire: <t color='#FFFFFF' size='1.1'>%23</t></t>
<br/>
<t align='center'>------------------------------------------</t>
<br/>
<t align='center'>------------------------------------------</t>
<br/>
<t color='#D9B398' size='1.5'>Son Inventaire</t>
<br/>
%93
%81
%80
%79
%78
%77
%74
%73
%72
%92
%54
%53
%52
%51
%62
%76
%61
%69
%66
%50
%13
%88
%49
%86
%71
%84
%90
%82
%48
%6
%7
%32
%8
%27
%91
%28
%9
%36
%38
%44
%45
%37
%25
%75
%89
%10
%11
%12
%42
%43
%64
%65
%68
%46
%47
%85
<br/>
<t color='#D9B398' size='1.5'>Ses Licences</t>
<br/>
%29
%14
%35
%15
%16
%17
%18
%19
<br/>
<t color='#D9B398' size='1.5'>Autres infos</t>
<br/>
%87
%60
%70
<t color='#8EC0F8' size='1'>%61</t>
<t color='#8EC0F8' size='1'>%55</t>
<t color='#8EC0F8' size='1'>%56</t>
<t color='#8EC0F8' size='1'>%63</t>
<t color='#8EC0F8' size='1'>%67</t>
<t color='#8EC0F8' size='1'>%83</t>
<t color='#8EC0F8' size='1'>%57</t>
<t color='#FF0000' size='1'>%58</t>
<t color='#FF0000' size='1'>%59</t>

<br/>
<t color='%21'>%22</t>
<t color='%30'>%31</t>
<t color='%34'>%33</t>
<t color='%41'>%40</t>
</t><t align='center'>------------------------------------------</t><br/>
<t color='#FFFFFF' size='1'>www.sfpteam.fr <br/> by Maxou.</t>
",
usedcolorinv, //1
(_lavictim getVariable "usedspace"), //2
(_lavictim getVariable "totalspace"), //3
moneycolorinv, //4
format ["%1 %2",(_lavictim getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp,"€"], //5
gotnothinginv, //6
gotfishinv, //7
gottruffleinv, //8
gotunpheroininv, //9
gotwhaleinv, //10
gotunpoilinv, //11
gotprooilinv, //12
got_boite_allumette, //13
havedriverinv, //14
haveboatinv, //15
haveairinv, //16
havepistolinv, //17
haverifleinv, //18
haveoilinv, //19
havedmission1inv, //20
wantedcolorinv, //21
iswantedinv, //22
argentdelavictime, //23
bankcolorinv, //24
gotproheroininv, //25
haveheroininv, //26
gotwoodinv, //27
gotmeatinv, //28
havehuntinginv, //29
ganglicensecolorinv, //30
ganglicenseinv, //31
gotfishpoissonspanesinv, //32
iswantedbraquagebanqinv, //33
wantedcolorbraquageinv, //34
havedriverpoidlourdinv, //35
gotcuivreinv, //36
gotcuivretransfoinv, //37
gotrequininv, //38
gotpommesinv, //39
isrechercherprcondtsspermisinv, //40
colorrechercherprcondtsspermisinv, //41
gotselinv, //42
gotpommedeterreinv, //43
gotcannabisinv, // 44
gotcannabistraiteinv, //45
gotmedicamentsinv, // 46
gotorganesanimauxinv, // 47
gotcerealinventaireinv, // 48
gotbouteilledeauinv, // 49
gothachepourleboisinv, // 50
gotcanneapecheinv, // 51
gotharponinv, // 52
gotgantpetroleinv, // 53
gotredbullinv, // 54
jetravailpoursarldepannage, // 55
got_sacoche_c4_inv, // 56
jetravailpoursarlautoecole, // 57
jaicambriolerunemaison, // 58
jetravailpoursarlpompier, // 59
madatedenaissanceinv, // 60
gotpieddebicheinv, // 61
gottenteinv, // 62
jetravailpoursarlavocat, // 63
gotornontraiteinv, // 64
gotortraiteinv, // 65
gotbidondessence, // 66
jetravailpoursarltaxigsept, // 67
gotcoffrefortinv, // 68
gotvaliseinv, // 69
nombredepermis, // 70
gotpoignardinv, // 71
gotamphetaminesinv, // 72
gotcocainefeuille, // 73
gotcocainepoudre, // 74
gotplanteaplanterinv, // 75
gotseauplanteillegalesinv, // 76
got_plante_illegale_prete_a_vendre_inv, // 77
il_prend_de_l_heroine, // 78
il_prend_de_la_cocaine, // 79
il_prend_des_medicaments, // 80
il_prend_du_cannabis, // 81
gotcocktailmolotov_inv, // 82
jetravailpoursarlneomedia, // 83
got_corde_et_sac_inv, // 84
got_bombe_porte_prison_inv, // 85
got_traceur_vehicule_inv, // 86
arme_holster_pistolet, // 87
got_marteau_sfp, // 88
gotplanteaplanterinv_fertilisant_rouge, // 89
got_brouilleur_sacoche_c4_inv, // 90
got_serpent_non_transforme, // 91
got_serpent_transforme, // 92
got_corde_descente_rappel_sfp // 93
];
hintsilent _str;