// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {alive player};
// sleep 2;

if (revive_mon_side == west) then
{
	if (isnil {player getvariable "gendarme_de_connecte"}) then {player setVariable["gendarme_de_connecte",1,true];};
	if (isnil {player getvariable "license_permis_de_conduire_by_sfp_maxou"}) then {player setVariable["license_permis_de_conduire_by_sfp_maxou",1,true];};
	if (isnil {player getvariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou"}) then {player setVariable["license_permis_de_conduire_poids_lourd_by_sfp_maxou",1,true];};
	if (isnil {player getvariable "permis_port_d_arme"}) then {player setVariable["permis_port_d_arme",true,true];};
	if (isnil {player getvariable "licence_fusils"}) then {player setVariable["licence_fusils",true,true];};

	if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp",[1,1,3],true];}; // Valeur 1 = Possede ou non, Valeur 2 = eteint ou allumé et valeur 3 = nombre de crédit
	
	if (isnil {player getvariable "totalspace"}) then {player setVariable["totalspace",70,true];};
	
	if (isnil {player getvariable "item_baleine_sfp"}) then {player setvariable["item_baleine_sfp",0,false];};
	if (isnil {player getvariable "item_requin_sfp"}) then {player setvariable["item_requin_sfp",0,false];};
	if (isnil {player getvariable "item_plante_illegale_prete_a_vendre_sfp"}) then {player setvariable["item_plante_illegale_prete_a_vendre_sfp",0,false];};
	if (isnil {player getvariable "item_cocaine_feuille_coca_sfp"}) then {player setvariable["item_cocaine_feuille_coca_sfp",0,false];};
	if (isnil {player getvariable "item_cocaine_poudre_sfp"}) then {player setvariable["item_cocaine_poudre_sfp",0,false];};
	if (isnil {player getvariable "item_cannabis_non_traite_sfp"}) then {player setvariable["item_cannabis_non_traite_sfp",0,false];};
	if (isnil {player getvariable "item_medicaments_sfp"}) then {player setvariable["item_medicaments_sfp",0,false];};
	if (isnil {player getvariable "item_organes_animaux_sfp"}) then {player setvariable["item_organes_animaux_sfp",0,false];};
	if (isnil {player getvariable "item_pomme_sfp"}) then {player setvariable["item_pomme_sfp",0,false];};
	if (isnil {player getvariable "item_pomme_de_terre_sfp"}) then {player setvariable["item_pomme_de_terre_sfp",0,false];};
	if (isnil {player getvariable "item_or_transforme_sfp"}) then {player setvariable["item_or_transforme_sfp",0,false];};
	if (isnil {player getvariable "item_or_non_transforme_sfp"}) then {player setvariable["item_or_non_transforme_sfp",0,false];};
	if (isnil {player getvariable "item_sel_sfp"}) then {player setvariable["item_sel_sfp",0,false];};
	if (isnil {player getvariable "item_heroine_non_traite_sfp"}) then {player setvariable["item_heroine_non_traite_sfp",0,false];};
	if (isnil {player getvariable "item_cuivre_non_transforme_sfp"}) then {player setvariable["item_cuivre_non_transforme_sfp",0,false];};
	if (isnil {player getvariable "item_cuivre_transforme_sfp"}) then {player setvariable["item_cuivre_transforme_sfp",0,false];};
	if (isnil {player getvariable "item_heroine_traite_sfp"}) then {player setvariable["item_heroine_traite_sfp",0,false];};
	if (isnil {player getvariable "item_plante_pour_planter"}) then {player setvariable["item_plante_pour_planter",0,false];};
	if (isnil {player getvariable "item_plante_fertilisant_rouge"}) then {player setvariable["item_plante_fertilisant_rouge",0,false];};
	if (isnil {player getvariable "item_cannabis_traite_sfp"}) then {player setvariable["item_cannabis_traite_sfp",0,false];};
	if (isnil {player getvariable "item_truffe_sfp"}) then {player setvariable["item_truffe_sfp",0,false];};
	if (isnil {player getvariable "item_poissons_sfp"}) then {player setvariable["item_poissons_sfp",0,false];};
	if (isnil {player getvariable "itemfishpoissonspanes"}) then {player setvariable["itemfishpoissonspanes",0,false];};
	if (isnil {player getvariable "item_petrole_non_traite_sfp"}) then {player setvariable["item_petrole_non_traite_sfp",0,false];};
	if (isnil {player getvariable "item_petrole_traite_sfp"}) then {player setvariable["item_petrole_traite_sfp",0,false];};
	if (isnil {player getvariable "item_bois_sfp"}) then {player setvariable["item_bois_sfp",0,false];};
	if (isnil {player getvariable "item_lapins_sfp"}) then {player setvariable["item_lapins_sfp",0,false];};
	if (isnil {player getvariable "serpent_non_transforme"}) then {player setvariable["serpent_non_transforme",0,false];};
	if (isnil {player getvariable "serpent_transforme"}) then {player setvariable["serpent_transforme",0,false];};
};

if (revive_mon_side == civilian) then
{
	if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp",[1,1,3],true];}; // Valeur 1 = Possede ou non, Valeur 2 = eteint ou allumé et valeur 3 = nombre de crédit
	
	if (isnil {player getvariable "item_baleine_sfp"}) then {player setvariable["item_baleine_sfp",0,true];};
	if (isnil {player getvariable "item_requin_sfp"}) then {player setvariable["item_requin_sfp",0,true];};
	if (isnil {player getvariable "item_plante_illegale_prete_a_vendre_sfp"}) then {player setvariable["item_plante_illegale_prete_a_vendre_sfp",0,true];};
	if (isnil {player getvariable "item_cocaine_feuille_coca_sfp"}) then {player setvariable["item_cocaine_feuille_coca_sfp",0,true];};
	if (isnil {player getvariable "item_cocaine_poudre_sfp"}) then {player setvariable["item_cocaine_poudre_sfp",0,true];};
	if (isnil {player getvariable "item_cannabis_non_traite_sfp"}) then {player setvariable["item_cannabis_non_traite_sfp",0,true];};
	if (isnil {player getvariable "item_medicaments_sfp"}) then {player setvariable["item_medicaments_sfp",0,true];};
	if (isnil {player getvariable "item_organes_animaux_sfp"}) then {player setvariable["item_organes_animaux_sfp",0,true];};
	if (isnil {player getvariable "item_pomme_sfp"}) then {player setvariable["item_pomme_sfp",0,true];};
	if (isnil {player getvariable "item_pomme_de_terre_sfp"}) then {player setvariable["item_pomme_de_terre_sfp",0,true];};
	if (isnil {player getvariable "item_or_transforme_sfp"}) then {player setvariable["item_or_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_or_non_transforme_sfp"}) then {player setvariable["item_or_non_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_sel_sfp"}) then {player setvariable["item_sel_sfp",0,true];};
	if (isnil {player getvariable "item_heroine_non_traite_sfp"}) then {player setvariable["item_heroine_non_traite_sfp",0,true];};
	if (isnil {player getvariable "item_cuivre_non_transforme_sfp"}) then {player setvariable["item_cuivre_non_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_cuivre_transforme_sfp"}) then {player setvariable["item_cuivre_transforme_sfp",0,true];};
	if (isnil {player getvariable "item_heroine_traite_sfp"}) then {player setvariable["item_heroine_traite_sfp",0,true];};
	if (isnil {player getvariable "item_plante_pour_planter"}) then {player setvariable["item_plante_pour_planter",0,true];};
	if (isnil {player getvariable "item_plante_fertilisant_rouge"}) then {player setvariable["item_plante_fertilisant_rouge",0,true];};
	if (isnil {player getvariable "item_cannabis_traite_sfp"}) then {player setvariable["item_cannabis_traite_sfp",0,true];};
	if (isnil {player getvariable "item_truffe_sfp"}) then {player setvariable["item_truffe_sfp",0,true];};
	if (isnil {player getvariable "item_poissons_sfp"}) then {player setvariable["item_poissons_sfp",0,true];};
	if (isnil {player getvariable "itemfishpoissonspanes"}) then {player setvariable["itemfishpoissonspanes",0,true];};
	if (isnil {player getvariable "item_petrole_non_traite_sfp"}) then {player setvariable["item_petrole_non_traite_sfp",0,true];};
	if (isnil {player getvariable "item_petrole_traite_sfp"}) then {player setvariable["item_petrole_traite_sfp",0,true];};
	if (isnil {player getvariable "item_bois_sfp"}) then {player setvariable["item_bois_sfp",0,true];};
	if (isnil {player getvariable "item_lapins_sfp"}) then {player setvariable["item_lapins_sfp",0,true];};
	if (isnil {player getvariable "totalspace"}) then {player setvariable["totalspace",50,true];};
	if (isnil {player getvariable "serpent_non_transforme"}) then {player setvariable["serpent_non_transforme",0,true];};
	if (isnil {player getvariable "serpent_transforme"}) then {player setvariable["serpent_transforme",0,true];};
};

if (isnil {player getvariable "ma_date_de_naissance"}) then {player setVariable ["ma_date_de_naissance",0, true];};
if (isnil {player getvariable "nombre_de_permis"}) then {player setVariable ["nombre_de_permis",0, true];};
if (isnil {player getvariable "mon_argent_banque_by_sfp_maxou"}) then {player setVariable ["mon_argent_banque_by_sfp_maxou",sfp_config_montant_de_depart_banque, true];};
if (isnil {player getvariable "mon_argent_poche_by_sfp_maxou"}) then {player setVariable ["mon_argent_poche_by_sfp_maxou",sfp_config_montant_de_depart_poche, true];};
if (isnil {player getvariable "combien_de_point_by_sfp_maxou"}) then {player setVariable ["combien_de_point_by_sfp_maxou",0, true];};
if (isnil {player getvariable "license_permis_de_conduire_by_sfp_maxou"}) then {player setVariable ["license_permis_de_conduire_by_sfp_maxou",0, true];};
if (isnil {player getvariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou"}) then {player setVariable ["license_permis_de_conduire_poids_lourd_by_sfp_maxou",0, true];};

if (isnil {player getvariable "ma_carte_identite"}) then {player setVariable ["ma_carte_identite",[0,"nom","prenom","masculin","altis","1m78"], true];};
if (isnil {player getvariable "infraction_wanted_liste"}) then {player setvariable ["infraction_wanted_liste",[],true];};

if (isnil {player getvariable "usedspace"}) then {player setvariable["usedspace",0,true];};

if (isnil {player getvariable "barredecereale"}) then {player setvariable["barredecereale",0,true];};
if (isnil {player getvariable "bouteilledeau"}) then {player setvariable["bouteilledeau",0,true];};
if (isnil {player getvariable "poignard_item"}) then {player setvariable["poignard_item",0,true];};
if (isnil {player getvariable "traceur_vehicule"}) then {player setvariable["traceur_vehicule",0,true];};
if (isnil {player getvariable "corde_et_sac"}) then {player setvariable["corde_et_sac",0,true];};
if (isnil {player getvariable "sacoche_de_c4"}) then {player setvariable["sacoche_de_c4",0,true];};
if (isnil {player getvariable "cocktail_molotov"}) then {player setvariable["cocktail_molotov",0,true];};
if (isnil {player getvariable "brouilleur_sacoche_c4"}) then {player setvariable["brouilleur_sacoche_c4",0,true];};
if (isnil {player getvariable "redbull"}) then {player setvariable["redbull",0,true];};
if (isnil {player getvariable "hache_pour_coupe_de_bois"}) then {player setvariable["hache_pour_coupe_de_bois",0,true];};
if (isnil {player getvariable "canne_a_peche"}) then {player setvariable["canne_a_peche",0,true];};
if (isnil {player getvariable "tente_pour_dormir"}) then {player setvariable["tente_pour_dormir",0,true];};
if (isnil {player getvariable "seau_plante_illegal"}) then {player setvariable["seau_plante_illegal",0,true];};
if (isnil {player getvariable "valise_pour_le_farming"}) then {player setvariable["valise_pour_le_farming",0,true];};
if (isnil {player getvariable "coffre_fort"}) then {player setvariable["coffre_fort",0,true];};
if (isnil {player getvariable "bidon_d_essence"}) then {player setvariable["bidon_d_essence",0,true];};

if (isnil {player getvariable "gants_pour_petrole"}) then {player setvariable["gants_pour_petrole",0,true];};
if (isnil {player getvariable "harpon_pour_la_peche"}) then {player setvariable["harpon_pour_la_peche",0,true];};
if (isnil {player getvariable "pied_de_biche"}) then {player setvariable["pied_de_biche",0,true];};
if (isnil {player getvariable "gelule_amphetamines"}) then {player setvariable["gelule_amphetamines",0,true];};
if (isnil {player getvariable "j_ai_un_antibiotique"}) then {player setvariable ["j_ai_un_antibiotique",false,false];};

if (isnil {player getvariable "mes_pseudos_utilises"}) then {player setvariable["mes_pseudos_utilises",[],true];};

if (isnil {player getvariable "mes_blessures_revive_sfp"}) then {player setvariable ["mes_blessures_revive_sfp",[0,0,0,0,0,0,0,0,0,0,0],true];};

if (isnil "distance_de_vue_pied") then {distance_de_vue_pied = 500; setTerrainGrid 50;};
if (isnil "distance_de_vue_air") then {distance_de_vue_air = 500;};
if (isnil "distance_de_vue_voiture") then {distance_de_vue_voiture = 500;};
if (isnil "distance_de_vue_ombrage") then {distance_de_vue_ombrage = 500;};

fin_verification_apres_chargement = true;
fin_verification_apres_chargement_pour_revive = true;