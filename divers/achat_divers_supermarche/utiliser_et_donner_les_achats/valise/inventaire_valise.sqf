// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !(cursortarget iskindof "Land_Suitcase_F") exitwith {hint "Impossible ce n'est pas une valise de farming !";};
if (cursortarget getvariable "valiser_de_farming" < 1) exitwith {hint "Impossible ce n'est pas une valise de farming !";};
if (isnil {cursortarget getvariable "usedspace"}) exitwith {hint "Il n'y à rien encore dans la valise !";};

la_valise = cursortarget;

if (la_valise getvariable "usedspace" > 0) then {
info_une = format ["<t color='#0FC702' size='1'>Espace utilisé : %1 / %2<br/>",la_valise getvariable "usedspace",la_valise getvariable "totalspace"];
}else {
info_une = format ["<t color='#0FC702' size='1'>Il n'y à rien encore dans la valise !<br/>",la_valise getvariable "usedspace"];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "mon_argent_banque_by_sfp_maxou" > 0) then {
info_deux = format ["<t color='#0FC702' size='1'>Argent : %1 Euros<br/>",la_valise getvariable "mon_argent_banque_by_sfp_maxou"];
}else {
info_deux = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_baleine_sfp" > 0) then {
info_trois = format ["<t color='#0FC702' size='1'>Baleines : %1.<br/>",la_valise getvariable "item_baleine_sfp"];
}else {
info_trois = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_requin_sfp" > 0) then {
info_quatre = format ["<t color='#0FC702' size='1'>Requins : %1.<br/>",la_valise getvariable "item_requin_sfp"];
}else {
info_quatre = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_medicaments_sfp" > 0) then {
info_cinq = format ["<t color='#0FC702' size='1'>Médicaments : %1.<br/>",la_valise getvariable "item_medicaments_sfp"];
}else {
info_cinq = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_organes_animaux_sfp" > 0) then {
info_six = format ["<t color='#0FC702' size='1'>Organes D'Animaux : %1.<br/>",la_valise getvariable "item_organes_animaux_sfp"];
}else {
info_six = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_pomme_sfp" > 0) then {
info_sept = format ["<t color='#0FC702' size='1'>Pommes : %1.<br/>",la_valise getvariable "item_pomme_sfp"];
}else {
info_sept = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_pomme_de_terre_sfp" > 0) then {
info_huit = format ["<t color='#0FC702' size='1'>Pommes De Terre : %1.<br/>",la_valise getvariable "item_pomme_de_terre_sfp"];
}else {
info_huit = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_or_transforme_sfp" > 0) then {
info_neuf = format ["<t color='#0FC702' size='1'>Lingot D'or : %1.<br/>",la_valise getvariable "item_or_transforme_sfp"];
}else {
info_neuf = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_or_non_transforme_sfp" > 0) then {
info_dix = format ["<t color='#0FC702' size='1'>Or : %1.<br/>",la_valise getvariable "item_or_non_transforme_sfp"];
}else {
info_dix = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_sel_sfp" > 0) then {
info_onze = format ["<t color='#0FC702' size='1'>Sel : %1.<br/>",la_valise getvariable "item_sel_sfp"];
}else {
info_onze = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_heroine_non_traite_sfp" > 0) then {
info_douze = format ["<t color='#0FC702' size='1'>Héroine Non Transformé : %1.<br/>",la_valise getvariable "item_heroine_non_traite_sfp"];
}else {
info_douze = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_cuivre_non_transforme_sfp" > 0) then {
info_treize = format ["<t color='#0FC702' size='1'>Cuivre Non Transformé : %1.<br/>",la_valise getvariable "item_cuivre_non_transforme_sfp"];
}else {
info_treize = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_cuivre_transforme_sfp" > 0) then {
info_quatorze = format ["<t color='#0FC702' size='1'>Cuivre Transformé : %1.<br/>",la_valise getvariable "item_cuivre_transforme_sfp"];
}else {
info_quatorze = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_heroine_traite_sfp" > 0) then {
info_quinze = format ["<t color='#0FC702' size='1'>Héroine Transformé : %1.<br/>",la_valise getvariable "item_heroine_traite_sfp"];
}else {
info_quinze = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_cannabis_traite_sfp" > 0) then {
info_seize = format ["<t color='#0FC702' size='1'>Cannabis Transformé : %1.<br/>",la_valise getvariable "item_cannabis_traite_sfp"];
}else {
info_seize = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_truffe_sfp" > 0) then {
info_dix_sept = format ["<t color='#0FC702' size='1'>Truffe : %1.<br/>",la_valise getvariable "item_truffe_sfp"];
}else {
info_dix_sept = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_poissons_sfp" > 0) then {
info_dix_huit = format ["<t color='#0FC702' size='1'>Poissons : %1.<br/>",la_valise getvariable "item_poissons_sfp"];
}else {
info_dix_huit = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "itemfishpoissonspanes" > 0) then {
info_dix_neuf = format ["<t color='#0FC702' size='1'>Poissons Pané : %1.<br/>",la_valise getvariable "itemfishpoissonspanes"];
}else {
info_dix_neuf = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_petrole_non_traite_sfp" > 0) then {
info_vingt = format ["<t color='#0FC702' size='1'>Petrole Brut : %1.<br/>",la_valise getvariable "item_petrole_non_traite_sfp"];
}else {
info_vingt = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_petrole_traite_sfp" > 0) then {
info_vingt_et_un = format ["<t color='#0FC702' size='1'>Petrole : %1.<br/>",la_valise getvariable "item_petrole_traite_sfp"];
}else {
info_vingt_et_un = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_bois_sfp" > 0) then {
info_vingt_deux = format ["<t color='#0FC702' size='1'>Bois : %1.<br/>",la_valise getvariable "item_bois_sfp"];
}else {
info_vingt_deux = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_lapins_sfp" > 0) then {
info_vingt_trois = format ["<t color='#0FC702' size='1'>Lappin : %1.<br/>",la_valise getvariable "item_lapins_sfp"];
}else {
info_vingt_trois = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "gelule_amphetamines" > 0) then {
info_vingt_quatre = format ["<t color='#0FC702' size='1'>Amphétamines : %1.<br/>",la_valise getvariable "gelule_amphetamines"];
}else {
info_vingt_quatre = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_cocaine_feuille_coca_sfp" > 0) then {
info_vingt_cinq = format ["<t color='#0FC702' size='1'>Feuille Cocaine : %1.<br/>",la_valise getvariable "item_cocaine_feuille_coca_sfp"];
}else {
info_vingt_cinq = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_cocaine_poudre_sfp" > 0) then {
info_vingt_six = format ["<t color='#0FC702' size='1'>Poudre Cocaine : %1.<br/>",la_valise getvariable "item_cocaine_poudre_sfp"];
}else {
info_vingt_six = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_plante_pour_planter" > 0) then {
info_vingt_sept = format ["<t color='#0FC702' size='1'>Plante à planter : %1.<br/>",la_valise getvariable "item_plante_pour_planter"];
}else {
info_vingt_sept = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_plante_illegale_prete_a_vendre_sfp" > 0) then {
info_vingt_huit = format ["<t color='#0FC702' size='1'>Plante Illégale Récoltée : %1.<br/>",la_valise getvariable "item_plante_illegale_prete_a_vendre_sfp"];
}else {
info_vingt_huit = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "item_plante_fertilisant_rouge" > 0) then {
info_vingt_neuf = format ["<t color='#0FC702' size='1'>Fertilisant Rouge : %1.<br/>",la_valise getvariable "item_plante_fertilisant_rouge"];
}else {
info_vingt_neuf = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "serpent_non_transforme" > 0) then {
info_trente = format ["<t color='#0FC702' size='1'>Serpent Non Transformé : %1.<br/>",la_valise getvariable "serpent_non_transforme"];
}else {
info_trente = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
if (la_valise getvariable "serpent_transforme" > 0) then {
info_trente_et_un = format ["<t color='#0FC702' size='1'>Venin De Serpent : %1.<br/>",la_valise getvariable "serpent_transforme"];
}else {
info_trente_et_un = format [""];};

//----------------------------------------------------------------------------------------------------------------------------------
_str = parseText format ["
! VALISE FARMING ! <br/> ------------------------------------ <br/>
Voici l'apercu de la valise :<br/><br/>
%1
%3
%4
%5
%6
%7
%8
%9
%10
%11
%12
%13
%14
%15
%16
%17
%18
%19
%20
%21
%22
%23
%24
%25
%26
%27
%28
%29
%30
%31
<br/>
<t color='#EEEEEE' size='1'>-----------</t>
<br/>
<t color='#EEEEEE' size='1'>By [SFP] Maxou</t>
<br/>
<t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>
",
info_une, //1
// info_deux, //2
info_trois, //3
info_quatre, //4
info_cinq, //5
info_six, //6
info_sept, //7
info_huit, //8
info_neuf, //9
info_dix, //10
info_onze, //11
info_douze, //12
info_treize, //13
info_quatorze, //14
info_quinze, //15
info_seize, //16
info_dix_sept, //17
info_dix_huit, //18
info_dix_neuf, //19
info_vingt, //20
info_vingt_et_un, //21
info_vingt_deux, //22
info_vingt_trois, //23
info_vingt_quatre, //24
info_vingt_cinq, //25
info_vingt_six, //26
info_vingt_sept, //27
info_vingt_huit, //28
info_vingt_neuf, //29
info_trente, //30
info_trente_et_un //31
];
hintsilent _str;

