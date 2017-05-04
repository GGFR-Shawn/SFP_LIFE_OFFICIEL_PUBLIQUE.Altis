// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = _this select 3 select 0;
if (isnil "_condition") exitwith {hint "Erreur, condition ... Recommence ...";};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};

switch _condition do
{
	case "0" :
	{
		createdialog "Choix_Menu_Inventaire";
	};
	case "1" :
	{
		closedialog 0;
		
		execvm "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf";
	};
	case "2" :
	{
		closedialog 0;
		
		waituntil {!isnil "fin_verification_apres_chargement"};
		if (revive_mon_side == west) exitwith {[0,0,0,["2"]] execvm "divers\gendarmerie\copinventory.sqf";};
		
		if (player getvariable "usedspace" < 0) then {player setVariable["usedspace",0,true];};

		arme_holster_pistolet = format [""]; // Existe plus

		_vert = "#FFFFFF";
		_rouge = "#FF0000";
		_argent_vert =  "#B3FFB8";
		_argent_rouge = "#FFB3B3";
		_usedcolorinv = "#FF8F8F";
		_couleurnormal = "#b9b9b9";

		_couleur_espace_1 = "#FF8F8F";
		_couleur_espace_2 = "#FFA78F";
		_couleur_espace_3 = "#FFBA8F";
		_couleur_espace_4 = "#FFD08F";
		_couleur_espace_5 = "#FFE18F";
		_couleur_espace_6 = "#FFF28F";
		_couleur_espace_7 = "#F4FF8F";
		_couleur_espace_8 = "#E1FF8F";
		_couleur_espace_9 = "#CEFF8F";
		_couleur_espace_10 = "#B2FF8F";
		_couleur_espace_11 = "#8FFFC3";
		_couleur_espace_12 = "#8FFFEA";
		_couleur_espace_13 = "#8FF8FF";


		if ((player getVariable "usedspace") < 0) then {
		gotnothinginv = format ["<t color='#FF6666' size='1'>Je vois que votre inventaire est buggé, merci de le signaler à Maxou !/ <br/>"];
		} else {
		gotnothinginv = format [""];
		};

		if ((player getVariable "usedspace") <= 0 && player getvariable "gelule_amphetamines" < 1) then {
		gotnothinginv = format ["<t color='#8EC0F8' size='1'>Votre inventaire virtuel est vide. <br/>"];
		}
		else {
		gotnothinginv = format [""];
		};

		if ((player getVariable "item_poissons_sfp") > 0) then {
		gotfishinv = format ["<t color='#8EC0F8' size='1'>Poissons:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_poissons_sfp")];
		}
		else {
		gotfishinv = format [""];
		};

		if ((player getVariable "itemfishpoissonspanes") > 0) then {
		gotfishpoissonspanesinv = format ["<t color='#8EC0F8' size='1'>Poissons panés:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "itemfishpoissonspanes")];
		}
		else {
		gotfishpoissonspanesinv = format [""];
		};

		if ((player getVariable "item_truffe_sfp") > 0) then {
		gottruffleinv = format ["<t color='#8EC0F8' size='1'>Truffes:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_truffe_sfp")];
		}
		else {
		gottruffleinv = format [""];
		};

		if ((player getVariable "item_bois_sfp") > 0) then {
		gotwoodinv = format ["<t color='#8EC0F8' size='1'>Bois:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_bois_sfp")];
		}
		else {
		gotwoodinv = format [""];
		};

		if ((player getVariable "item_lapins_sfp") > 0) then {
		gotmeatinv = format ["<t color='#8EC0F8' size='1'>Viande de lapin:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_lapins_sfp")];
		}
		else {
		gotmeatinv = format [""];
		};

		if ((player getVariable "serpent_non_transforme") > 0) then {
		got_serpent_non_transforme = format ["<t color='#8EC0F8' size='1'>Serpent Non Transformé:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "serpent_non_transforme")];
		}
		else {
		got_serpent_non_transforme = format [""];
		};

		if ((player getVariable "serpent_transforme") > 0) then {
		got_serpent_transforme = format ["<t color='#FF0000' size='1'>Venin De Serpent:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "serpent_transforme")];
		}
		else {
		got_serpent_transforme = format [""];
		};

		if ((player getVariable "gelule_amphetamines") > 0) then {
		gotamphetamineseinv = format ["<t color='#FF0000' size='1'>Amphetamines:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "gelule_amphetamines")];
		}
		else {
		gotamphetamineseinv = format [""];
		};

		if ((player getVariable "item_heroine_non_traite_sfp") > 0) then {
		gotunpheroininv = format ["<t color='#FF0000' size='1'>Héroïne non transformés:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_heroine_non_traite_sfp")];
		}
		else {
		gotunpheroininv = format [""];
		};

		if ((player getVariable "item_cuivre_non_transforme_sfp") > 0) then {
		gotcuivreinv = format ["<t color='#8EC0F8' size='1'>Cuivre non transformés:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_cuivre_non_transforme_sfp")];
		}
		else {
		gotcuivreinv = format [""];
		};

		if ((player getVariable "item_cuivre_transforme_sfp") > 0) then {
		gotcuivretransfoinv = format ["<t color='#8EC0F8' size='1'>Lingots de cuivre:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_cuivre_transforme_sfp")];
		}
		else {
		gotcuivretransfoinv = format [""];
		};

		if ((player getVariable "item_or_transforme_sfp") > 0) then {
		gotortraiteinv = format ["<t color='#8EC0F8' size='1'>Lingots d'or:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_or_transforme_sfp")];
		}
		else {
		gotortraiteinv = format [""];
		};

		if ((player getVariable "item_heroine_traite_sfp") > 0) then {
		gotproheroininv = format ["<t color='#FF0000' size='1'>Héroïne transformés:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_heroine_traite_sfp")];
		}
		else {
		gotproheroininv = format [""];
		};

		if ((player getVariable "item_plante_pour_planter") > 0) then {
		gotplanteaplanter = format ["<t color='#FF0000' size='1'>Plante à planter:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_plante_pour_planter")];
		}
		else {
		gotplanteaplanter = format [""];
		};

		if ((player getVariable "item_plante_fertilisant_rouge") > 0) then {
		gotplanteaplanter_fertilisant_rouge = format ["<t color='#FF0000' size='1'>Fertilisant Rouge:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_plante_fertilisant_rouge")];
		}
		else {
		gotplanteaplanter_fertilisant_rouge = format [""];
		};

		if ((player getVariable "seau_plante_illegal") > 0) then {
		gotseauplanteillegalesinv = format ["<t color='#8EC0F8' size='1'>Seau:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "seau_plante_illegal")];
		}
		else {
		gotseauplanteillegalesinv = format [""];
		};

		if ((player getVariable "item_cannabis_traite_sfp") > 0) then {
		gotcanabistraiteinv = format ["<t color='#FF0000' size='1'>Cannabis transformés:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_cannabis_traite_sfp")];
		}
		else {
		gotcanabistraiteinv = format [""];
		};

		if ((player getVariable "item_baleine_sfp") > 0) then {
		gotwhaleinv = format ["<t color='#FF0000' size='1'>Morceau baleine:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_baleine_sfp")];
		}
		else {
		gotwhaleinv = format [""];
		};

		if ((player getVariable "item_requin_sfp") > 0) then {
		gotrequininv = format ["<t color='#FF0000' size='1'>Morceau Requin:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_requin_sfp")];
		}
		else {
		gotrequininv = format [""];
		};

		if ((player getVariable "item_plante_illegale_prete_a_vendre_sfp") > 0) then {
		got_plante_illegale_prete_a_vendre_inv = format ["<t color='#FF0000' size='1'>Plante Illégale Récoltée:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_plante_illegale_prete_a_vendre_sfp")];
		}
		else {
		got_plante_illegale_prete_a_vendre_inv = format [""];
		};

		if ((player getVariable "item_cocaine_feuille_coca_sfp") > 0) then {
		gotcocaineinv = format ["<t color='#FF0000' size='1'>Feuille De Cocaïne :</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_cocaine_feuille_coca_sfp")];
		}
		else {
		gotcocaineinv = format [""];
		};

		if ((player getVariable "item_cocaine_poudre_sfp") > 0) then {
		gotcocainepoudreinv = format ["<t color='#FF0000' size='1'>Poudre De Cocaïne :</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_cocaine_poudre_sfp")];
		}
		else {
		gotcocainepoudreinv = format [""];
		};

		if ((player getVariable "item_cannabis_non_traite_sfp") > 0) then {
		gotcannabisinv = format ["<t color='#FF0000' size='1'>Cannabis:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_cannabis_non_traite_sfp")];
		}
		else {
		gotcannabisinv = format [""];
		};

		if ((player getVariable "item_medicaments_sfp") > 0) then {
		gotmedicamentsinv = format ["<t color='#FF0000' size='1'>Médicaments:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_medicaments_sfp")];
		}
		else {
		gotmedicamentsinv = format [""];
		};

		if ((player getVariable "item_organes_animaux_sfp") > 0) then {
		gotorganesanimauxinv = format ["<t color='#FF0000' size='1'>Organes:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_organes_animaux_sfp")];
		}
		else {
		gotorganesanimauxinv = format [""];
		};

		if (!isnil {player getvariable "bombe_porte_prison"}) then {
		gotbombe_porte_prisoninv = format ["<t color='#FF0000' size='1'>Bombe Porte De Prison:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", 1];
		}
		else {
		gotbombe_porte_prisoninv = format [""];
		};

		if ((player getVariable "item_pomme_sfp") > 0) then {
		gotpommesinv = format ["<t color='#8EC0F8' size='1'>Pommes:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_pomme_sfp")];
		}
		else {
		gotpommesinv = format [""];
		};

		if ((player getVariable "item_sel_sfp") > 0) then {
		gotselinv = format ["<t color='#8EC0F8' size='1'>Sel:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_sel_sfp")];
		}
		else {
		gotselinv = format [""];
		};

		if ((player getVariable "item_pomme_de_terre_sfp") > 0) then {
		gotpommedeterreinv = format ["<t color='#8EC0F8' size='1'>Pomme De Terre:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_pomme_de_terre_sfp")];
		}
		else {
		gotpommedeterreinv = format [""];
		};

		if ((player getVariable "item_or_non_transforme_sfp") > 0) then {
		gotornontraiteinv = format ["<t color='#8EC0F8' size='1'>Or Non Traite:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_or_non_transforme_sfp")];
		}
		else {
		gotornontraiteinv = format [""];
		};

		if ((player getVariable "item_petrole_non_traite_sfp") > 0) then {
		gotunpoilinv = format ["<t color='#8EC0F8' size='1'>Petrole brut:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_petrole_non_traite_sfp")];
		}
		else {
		gotunpoilinv = format [""];
		};

		if ((player getVariable "item_petrole_traite_sfp") > 0) then {
		gotprooilinv = format ["<t color='#8EC0F8' size='1'>Petrole traité:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "item_petrole_traite_sfp")];
		}
		else {
		gotprooilinv = format [""];
		};

		if (!isnil {player getvariable "permis_de_chasse"}) then {
		havehuntinginv = format ["<t color='#8EC0F8' size='1'>Permis de chasse</t> <br/>"];
		}
		else {
		havehuntinginv = format [""];
		};

		if ((player getVariable "license_permis_de_conduire_by_sfp_maxou") >= 1) then {
		havedriverinv = format ["<t color='#8EC0F8' size='1'>Permis de conduire leger</t> <br/>"];
		}
		else {
		havedriverinv = format [""];
		};

		if ((player getVariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou") == 1) then {
		havedriverpoidlourdinv = format ["<t color='#8EC0F8' size='1'>Permis de conduire poid lourd</t> <br/>"];
		}
		else {
		havedriverpoidlourdinv = format [""];
		};

		if (!isnil {player getvariable "licence_bateau_news"}) then {
		haveboatinv = format ["<t color='#8EC0F8' size='1'>Permis bateaux</t> <br/>"];
		}
		else {
		haveboatinv = format [""];
		};

		if (!isnil {player getvariable "license_pilote_news"}) then {
		haveairinv = format ["<t color='#8EC0F8' size='1'>Licence pilote</t> <br/>"];
		}
		else {
		haveairinv = format [""];
		};

		if (!isnil {player getvariable "permis_port_d_arme"}) then {
		havepistolinv = format ["<t color='#8EC0F8' size='1'>Port d'armes</t> <br/>"]; 
		}
		else {
		havepistolinv = format [""];
		};

		if (!isnil {player getvariable "licence_fusils"}) then {
		haverifleinv = format ["<t color='#8EC0F8' size='1'>Licence fusils</t> <br/>"]; 
		}
		else {
		haverifleinv = format [""];
		};

		if (!isnil {player getvariable "licence_fusils_illegaux"}) then {
		licence_fusils_illegaux_inv = format ["<t color='#8EC0F8' size='1'>Licence Fusils Illegaux</t> <br/>"]; 
		}
		else {
		licence_fusils_illegaux_inv = format [""];
		};

		if (!isnil {player getvariable "licence_petrole"}) then {
		haveoilinv = format ["<t color='#8EC0F8' size='1'>Licence traitement de Petrole</t> <br/>"]; 
		}
		else {
		haveoilinv = format [""];
		};

		if (!isnil {player getvariable "licence_heroine"}) then {
		haveheroininv = format ["<t color='#8EC0F8' size='1'>Licence transformation héroïne</t> <br/>"]; 
		}
		else {
		haveheroininv = format [""];
		};

		if (!isnil {player getvariable "licence_cannabis"}) then {
		havecannabisformationinv = format ["<t color='#8EC0F8' size='1'>Licence transformation de cannabis</t> <br/>"]; 
		}
		else {
		havecannabisformationinv = format [""];
		};

		if (isnil "mission_livraison_colis") then {mission_livraison_colis = 0;};
		if (mission_livraison_colis == 0) then {
		havedmission1inv = format [""];
		}
		else {
		havedmission1inv = format ["Vous avez une mission de livraison ! <br/>"];
		};

		if (!isnil {player getvariable "recherche_pour_braquage"}) then {
		rechercher_pour_braquage = format ["Recherché pour braquage !<br/>"];
		wantedcolorinv = _rouge;
		}
		else {
		rechercher_pour_braquage = format [""];
		wantedcolorinv = _couleurnormal;
		};

		if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {
		iswantedinv = format ["Recherché pour armes illégales !<br/>"];
		wantedcolorinv = _rouge;
		}
		else {
		iswantedinv = format [""];
		wantedcolorinv = _couleurnormal;
		};

		if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {
		isrechercherprcondtsspermisinv = format ["Recherché pour conduite SS permis !<br/>"];
		colorrechercherprcondtsspermisinv = _rouge;
		}
		else {
		isrechercherprcondtsspermisinv = format [""];
		colorrechercherprcondtsspermisinv = _couleurnormal;
		};

		if (!isnil {player getvariable "licence_gang_v2"}) then {
		ganglicenseinv = format ["Vous faites partie d'un gang !<br/>"];
		ganglicensecolorinv = _rouge;
		}
		else {
		ganglicenseinv = format [""];
		ganglicensecolorinv = _couleurnormal;
		};

		if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {
		jaicambriolerunemaison = format ["Recherché pour cambriolage !<br/>"];
		}
		else {
		jaicambriolerunemaison = format [""];
		};

		if (!isnil {player getvariable "sarl_depannage"}) then {
		jetravailpoursarldepannage = format ["Travail : SARL DIR !<br/>"];
		}
		else {
		jetravailpoursarldepannage = format [""];
		};

		if (!isnil {player getvariable "sarl_pompier"}) then {
		jetravailpoursarlpompier = format ["Travail : SARL POMPIER !<br/>"];
		}
		else {
		jetravailpoursarlpompier = format [""];
		};

		if (!isnil {player getvariable "sarl_avocat"}) then {
		jetravailpoursarlavocat = format ["Travail : SARL AVOCAT !<br/>"];
		}
		else {
		jetravailpoursarlavocat = format [""];
		};

		if (!isnil {player getvariable "sarl_taxis_gsept"}) then {
		jetravailpoursarltaxigsept = format ["Travail : SARL TAXI G7 !<br/>"];
		}
		else {
		jetravailpoursarltaxigsept = format [""];
		};

		if (!isnil {player getvariable "sarl_neomedia"}) then {
		jetravailpoursarlneomedia = format ["Travail : SARL NEOMEDIA !<br/>"];
		}
		else {
		jetravailpoursarlneomedia = format [""];
		};

		if (!isnil {player getvariable "sarl_autoecole"}) then {
		jetravailpoursarlautoecole = format ["Travail : SARL AUTOECOLE !<br/>"];
		}
		else {
		jetravailpoursarlautoecole = format [""];
		};

		if ((player getVariable "mon_argent_poche_by_sfp_maxou") == 0) then {
		moneycolorinv = _argent_rouge;
		}
		else {
		moneycolorinv = _argent_vert;
		};

		if ((player getVariable "mon_argent_banque_by_sfp_maxou") == 0) then {
		bankcolorinv = _argent_rouge;
		}
		else {
		bankcolorinv = _argent_vert;
		};

		if ((player getVariable "barredecereale") > 0) then {
		gotcerealinventaireinv = format ["<t color='#8EC0F8' size='1'>Barre Céréale:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "barredecereale")];
		}
		else {
		gotcerealinventaireinv = format [""];
		};

		if ((player getVariable "bouteilledeau") > 0) then {
		gotbouteilledeauinv = format ["<t color='#8EC0F8' size='1'>Bouteille d'eau:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "bouteilledeau")];
		}
		else {
		gotbouteilledeauinv = format [""];
		};

		if ((player getVariable "traceur_vehicule") > 0) then {
		got_traceur_vehicule_inv = format ["<t color='#8EC0F8' size='1'>Traceur Véhicule:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "traceur_vehicule")];
		}
		else {
		got_traceur_vehicule_inv = format [""];
		};

		if ((player getVariable "poignard_item") > 0) then {
		gotpoignardinv = format ["<t color='#8EC0F8' size='1'>Poignard:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "poignard_item")];
		}
		else {
		gotpoignardinv = format [""];
		};

		if ((player getVariable "corde_et_sac") > 0) then {
		got_corde_et_sac_inv = format ["<t color='#8EC0F8' size='1'>Corde Et Sac:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "corde_et_sac")];
		}
		else {
		got_corde_et_sac_inv = format [""];
		};

		if ((player getVariable "cocktail_molotov") > 0) then {
		gotcocktailmolotovinv = format ["<t color='#8EC0F8' size='1'>Cocktail Molotov:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "cocktail_molotov")];
		}
		else {
		gotcocktailmolotovinv = format [""];
		};

		if ((player getVariable "brouilleur_sacoche_c4") > 0) then {
		gotbrouilleur_sacoche_c4inv = format ["<t color='#8EC0F8' size='1'>Brouilleur C4:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "brouilleur_sacoche_c4")];
		}
		else {
		gotbrouilleur_sacoche_c4inv = format [""];
		};

		if ((player getVariable "sacoche_de_c4") > 0) then {
		got_sacoche_c4_inv = format ["<t color='#8EC0F8' size='1'>Sacoche C4:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "sacoche_de_c4")];
		}
		else {
		got_sacoche_c4_inv = format [""];
		};

		if ((player getVariable "redbull") > 0) then {
		gotredbullinv = format ["<t color='#8EC0F8' size='1'>RedBull:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "redbull")];
		}
		else {
		gotredbullinv = format [""];
		};

		if ((player getVariable "hache_pour_coupe_de_bois") > 0) then {
		gothacheboisinv = format ["<t color='#8EC0F8' size='1'>Hache:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "hache_pour_coupe_de_bois")];
		}
		else {
		gothacheboisinv = format [""];
		};

		if (!isnil {player getvariable "boite_allumette"}) then {
		got_boite_allumette = format ["<t color='#8EC0F8' size='1'>Boite Allumette:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", 1];
		}
		else {
		got_boite_allumette = format [""];
		};

		if (!isnil {player getvariable "corde_descente_rappel_sfp"}) then {
		got_corde_descente_rappel_sfp = format ["<t color='#8EC0F8' size='1'>Corde Rappel:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", "Oui."];
		}
		else {
		got_corde_descente_rappel_sfp = format [""];
		};

		if (!isnil {player getvariable "marteau_sfp"}) then {
		got_marteau_sfp = format ["<t color='#8EC0F8' size='1'>Marteau:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", 1];
		}
		else {
		got_marteau_sfp = format [""];
		};

		if ((player getVariable "canne_a_peche") > 0) then {
		gotcanneapecheinv = format ["<t color='#8EC0F8' size='1'>Canne A Peche:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "canne_a_peche")];
		}
		else {
		gotcanneapecheinv = format [""];
		};

		if ((player getVariable "tente_pour_dormir") > 0) then {
		gottenteinv = format ["<t color='#8EC0F8' size='1'>Tente de couchage:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "tente_pour_dormir")];
		}
		else {
		gottenteinv = format [""];
		};

		if ((player getVariable "valise_pour_le_farming") > 0) then {
		gotvaliseinv = format ["<t color='#8EC0F8' size='1'>Valise Farming:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "valise_pour_le_farming")];
		}
		else {
		gotvaliseinv = format [""];
		};

		if ((player getVariable "coffre_fort") == 1) then {
		gotcoffrefortinv = format ["<t color='#8EC0F8' size='1'>Coffre fort:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "coffre_fort")];
		}
		else {
		gotcoffrefortinv = format [""];
		};

		if ((player getVariable "bidon_d_essence") > 0) then {
		gotbidondessenceinv = format ["<t color='#8EC0F8' size='1'>Bidon d'essence:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "bidon_d_essence")];
		}
		else {
		gotbidondessenceinv = format [""];
		};

		if ((player getVariable "gants_pour_petrole") > 0) then {
		gotgantpetroleinv = format ["<t color='#8EC0F8' size='1'>Gants Petrole:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "gants_pour_petrole")];
		}
		else {
		gotgantpetroleinv = format [""];
		};

		if ((player getVariable "pied_de_biche") > 0) then {
		gotpieddebicheinv = format ["<t color='#8EC0F8' size='1'>Pied De Biche:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "pied_de_biche")];
		}
		else {
		gotpieddebicheinv = format [""];
		};

		if ((player getVariable "harpon_pour_la_peche") > 0) then {
		gotharponinv = format ["<t color='#8EC0F8' size='1'>Harpon:</t><t color='#FFFFFF' size='1'> %1</t> <br/>", (player getVariable "harpon_pour_la_peche")];
		}
		else {
		gotharponinv = format [""];
		};

		if !(isnil "duree_de_mon_reservoir") then {
		je_possede_un_extincteur = format ["<t color='#8EC0F8' size='1'>Durée extincteur :</t><t color='#FFFFFF' size='1'> %1.</t> <br/>", duree_de_mon_reservoir];
		}
		else {
		je_possede_un_extincteur = format [""];
		};

		if ((player getVariable "ma_date_de_naissance") > 0) then {
		ma_date_de_naissance = player getvariable "ma_date_de_naissance";
		if (ma_date_de_naissance >= 60) then {ma_date_de_naissance_calcul = ma_date_de_naissance / 60;}else {ma_date_de_naissance_calcul = player getvariable "ma_date_de_naissance";};
		if (ma_date_de_naissance >= 60) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#FFFFFF' size='1'> %1 heures.</t> <br/>", round ma_date_de_naissance_calcul];};
		if (ma_date_de_naissance < 60) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#FFFFFF' size='1'> %1 minutes.</t> <br/>", round ma_date_de_naissance_calcul];};
		if (ma_date_de_naissance >= 999999999999999999) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#FFFFFF' size='1'> Je suis jésus :)</t> <br/>"];};
		}
		else {
		madatedenaissanceinv = format [""];
		};

		if ((player getVariable "nombre_de_permis") > 0) then {
		nombredepermis = format ["<t color='#8EC0F8' size='1'>Nombres Permis achetés: <t color='#FFFFFF' size='1'>%1</t>.</t> <br/>", round (player getVariable "nombre_de_permis")];}
		else{
		nombredepermis = format [""];
		};

		if ((player getVariable "thirstLevel_cafe") > 0) then {
		moncafe = format ["<t color='#8EC0F8' size='1'>Effet Café Restant: <t color='#FFFFFF' size='1'>%1</t>.</t> <br/>", round (player getVariable "thirstLevel_cafe")];}
		else{
		moncafe = format [""];
		};

		if ((player getVariable "evade_de_prison") > 0) then {
		temps_prisonnier_restant = format ["<t color='#8EC0F8' size='1'>Temps Prisonnier: <t color='#FFFFFF' size='1'>%1</t> Minutes.</t> <br/>", round (player getVariable "evade_de_prison")];}
		else{
		temps_prisonnier_restant = format [""];
		};

		if (!isnil "temps_activation_effet_drogue_cocaine") then {
		temps_effet_sur_le_travail_cocaine = format ["<t color='#8EC0F8' size='1'>Cocaine Effet Restant: <t color='#FFFFFF' size='1'>%1</t> Min.</t> <br/>", round ((temps_activation_effet_drogue_cocaine) / 60)];}
		else{
		temps_effet_sur_le_travail_cocaine = format [""];
		};

		if (!isnil "temps_activation_effet_drogue_heroine") then {
		temps_effet_sur_le_travail_heroine = format ["<t color='#8EC0F8' size='1'>Heroine Effet Restant: <t color='#FFFFFF' size='1'>%1</t> Min.</t> <br/>", round ((temps_activation_effet_drogue_heroine) / 60)];}
		else{
		temps_effet_sur_le_travail_heroine = format [""];
		};

		if (!isnil "temps_activation_effet_drogue_cannabis") then {
		temps_effet_sur_le_travail_cannabis = format ["<t color='#8EC0F8' size='1'>Cannabis Effet Restant: <t color='#FFFFFF' size='1'>%1</t> Min.</t> <br/>", round ((temps_activation_effet_drogue_cannabis) / 60)];}
		else{
		temps_effet_sur_le_travail_cannabis = format [""];
		};

		if (!isnil "temps_activation_effet_drogue_medicaments") then {
		temps_effet_sur_le_travail_medicaments = format ["<t color='#8EC0F8' size='1'>Médicaments Effet Restant: <t color='#FFFFFF' size='1'>%1</t> Min.</t> <br/>", round ((temps_activation_effet_drogue_medicaments) / 60)];}
		else{
		temps_effet_sur_le_travail_medicaments = format [""];
		};

		if ((player getVariable "usedspace") > 65) then {
		_usedcolorinv = _rouge;
		}
		else {
		if ((player getVariable "usedspace") > 47) then {
		_usedcolorinv = _couleur_espace_1;
		}
		else {
		if ((player getVariable "usedspace") > 43) then {
		_usedcolorinv = _couleur_espace_2;
		}
		else {
		if ((player getVariable "usedspace") > 40) then {
		_usedcolorinv = _couleur_espace_3;
		}
		else {
		if ((player getVariable "usedspace") > 35) then {
		_usedcolorinv = _couleur_espace_4;
		}
		else {
		if ((player getVariable "usedspace") > 33) then {
		_usedcolorinv = _couleur_espace_5;
		}
		else {
		if ((player getVariable "usedspace") > 28) then {
		_usedcolorinv = _couleur_espace_6;
		}
		else {
		if ((player getVariable "usedspace") > 25) then {
		_usedcolorinv = _couleur_espace_7;
		}
		else {
		if ((player getVariable "usedspace") > 20) then {
		_usedcolorinv = _couleur_espace_8;
		}
		else {
		if ((player getVariable "usedspace") > 15) then {
		_usedcolorinv = _couleur_espace_9;
		}
		else {
		if ((player getVariable "usedspace") > 10) then {
		_usedcolorinv = _couleur_espace_10;
		}
		else {
		if ((player getVariable "usedspace") > 5) then {
		_usedcolorinv = _couleur_espace_11;
		}
		else {
		if ((player getVariable "usedspace") > 1) then {
		_usedcolorinv = _couleur_espace_12;
		}
		else {
		if ((player getVariable "usedspace") == 0) then {
		_usedcolorinv = _couleur_espace_13;
		}
		else {
		if ((player getVariable "usedspace") < 0) then {
		_usedcolorinv = _couleur_espace_1;
		}
		};};};};};};};};};};};};};};

		_str = format ["
		<t color='#D9B398' size='1.2' align='left'>Espace virtuel utilisé: <t color='#FFFFFF' size='1.1'>%2/%3</t></t>
		<br/>
		<t color='#D9B398' size='1.2' align='left'>Compte banquaire: <t color='#FFFFFF' size='1.1'>%23</t></t>
		<br/>
		<t align='center'>-------------------------------------------------</t>
		<t align='center'>-------------------------------------------------</t>
		<br/>
		<t color='#D9B398' size='1.5'>Inventaire :</t>
		<br/>
		%62
		%87
		%74
		%81
		%82
		%83
		%84
		%75
		%97
		%76
		%77
		%73
		%88
		%85
		%95
		%33
		%55
		%70
		%54
		%53
		%52
		%51
		%13
		%98
		%34
		%63
		%68
		%64
		%79
		%71
		%50
		%90
		%49
		%6
		%7
		%32
		%8
		%27
		%36
		%38
		%80
		%44
		%39
		%37
		%96
		%28
		%9
		%25
		%78
		%92
		%46
		%10
		%11
		%12
		%42
		%43
		%66
		%67
		%47
		%48
		%89
		<br/>
		<t color='#D9B398' size='1.5'>Licences :</t>
		<br/>
		%94
		%29
		%14
		%35
		%15
		%16
		%17
		%18
		%19
		<br/>
		<t color='#D9B398' size='1.5'>Autres :</t>
		<br/>
		<t color='#8EC0F8' size='1'>%61</t>
		<t color='#8EC0F8' size='1'>%72</t>
		<t color='#8EC0F8' size='1'>%91</t>
		<t color='#8EC0F8' size='1'>%56</t>
		<t color='#FF0000' size='1'>%57</t>
		<t color='#8EC0F8' size='1'>%58</t>
		<t color='#8EC0F8' size='1'>%60</t>
		<t color='#8EC0F8' size='1'>%65</t>
		<t color='#8EC0F8' size='1'>%69</t>
		<t color='#8EC0F8' size='1'>%86</t>
		<t color='#FF0000' size='1'>%59</t>
		<t color='#8EC0F8' size='1'>%20</t>
		<t color='%30'>%31</t>
		<t color='%21'>%22</t>
		<t color='%41'>%40</t>
		<t color='#8EC0F8' size='1'>%93</t>
		</t><t align='center'>-------------------------------------------------</t><br/>
		<t color='#FFFFFF' size='1'>www.sfpteam.fr, by Maxou.</t>
		",
		_usedcolorinv, //1
		(player getVariable "usedspace"), //2
		(player getVariable "totalspace"), //3
		moneycolorinv, //4
		(player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp, //5
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
		format ["%1 %2",(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp,"€"], //23
		bankcolorinv, //24
		gotproheroininv, //25
		haveheroininv, //26
		gotwoodinv, //27
		gotmeatinv, //28
		havehuntinginv, //29
		ganglicensecolorinv, //30
		ganglicenseinv, //31
		gotfishpoissonspanesinv, //32
		got_sacoche_c4_inv, //33
		got_marteau_sfp, //34
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
		havecannabisformationinv, // 45
		gotcanabistraiteinv, // 46
		gotmedicamentsinv, // 47
		gotorganesanimauxinv, // 48
		gotcerealinventaireinv, // 49
		gotbouteilledeauinv, // 50
		gothacheboisinv, // 51
		gotcanneapecheinv, // 52
		gotharponinv, // 53
		gotgantpetroleinv, // 54
		gotredbullinv, // 55
		jetravailpoursarldepannage, // 56
		rechercher_pour_braquage, // 57
		jetravailpoursarlautoecole, // 58
		jaicambriolerunemaison, // 59
		jetravailpoursarlpompier, // 60
		madatedenaissanceinv, // 61
		je_possede_un_extincteur, // 62
		gotpieddebicheinv, // 63
		gottenteinv, // 64
		jetravailpoursarlavocat, // 65
		gotornontraiteinv, // 66
		gotortraiteinv, // 67
		gotbidondessenceinv, // 68
		jetravailpoursarltaxigsept, // 69
		gotcoffrefortinv, // 70
		gotvaliseinv, // 71
		nombredepermis, // 72
		gotpoignardinv, // 73
		moncafe, // 74
		gotamphetamineseinv, // 75
		gotcocaineinv, // 76
		gotcocainepoudreinv, // 77
		gotplanteaplanter, // 78
		gotseauplanteillegalesinv, // 79
		got_plante_illegale_prete_a_vendre_inv, // 80
		temps_effet_sur_le_travail_cocaine, // 81
		temps_effet_sur_le_travail_heroine, // 82
		temps_effet_sur_le_travail_cannabis, // 83
		temps_effet_sur_le_travail_medicaments, // 84
		gotcocktailmolotovinv, // 85
		jetravailpoursarlneomedia, // 86
		temps_prisonnier_restant, // 87
		got_corde_et_sac_inv, // 88
		gotbombe_porte_prisoninv, // 89
		got_traceur_vehicule_inv, // 90
		arme_holster_pistolet, // 91
		gotplanteaplanter_fertilisant_rouge, // 92
		mon_dernier_vehicule_achete, // 93
		licence_fusils_illegaux_inv, // 94
		gotbrouilleur_sacoche_c4inv, // 95
		got_serpent_non_transforme, // 96
		got_serpent_transforme, // 97
		got_corde_descente_rappel_sfp // 98
		];
		hintsilent parseText _str;
	};
};




