// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {alive player};

uid_unique_pour_la_sauvegarde = getPlayerUID player;
uid_unique_et_side_pour_la_sauvegarde = format ["%1%2",getPlayerUID player, side player];
uid_pour_mettre_amende = format ["amende_hors_ligne_pour_%1",getPlayerUID player];
uid_pour_remboursement = format ["remboursement_pour_%1",getPlayerUID player];
uid_sav_voiture_fichier_listes_des_vehicules = format["%1_%2_listes_des_vehicules", getPlayerUID player,str(side player)];	

uid_whitelist_gendarme = "Whitelist Gendarmes";
uid_whitelist_gendarme_stagiaire = "Whitelist Stagiaires Gendarmerie";
uid_whitelist_psig = "Whitelist PSIG";
uid_whitelist_GIGN = "Whitelist GIGN";
uid_whitelist_maire_de_la_ville = "Whitelist Maire";

uid_sauvegarde_ecrire_local_joueur_sfp =
{
	profileNamespace setVariable [format ["%1_%2", serveur_id_sauvegarde, (_this select 0)], (_this select 1)]
};

uid_sauvegarde_lire_local_joueur_sfp =
{
	profileNamespace getVariable (format ["%1_%2", serveur_id_sauvegarde, (_this select 0)])
};

applyPlayerDBValues =
{
	private ["_varName","_varValue","_i","_in","_exe","_backpack","_LoadToServer","_uid","_uid_sav_voiture_un","_uid_sav_voiture_deux","_uid_sav_voiture_trois","_uid_sav_voiture_quatre","_uid_sav_voiture_cinq","_uid_sav_voiture_six","_uid_sav_voiture_sept","_uid_sav_voiture_huit","_uid_sav_voiture_neuf","_uid_sav_voiture_dix","_uid_sav_voiture_onze","_uid_sav_voiture_douze","_uid_sav_voiture_treize","_uid_sav_voiture_quatorze","_uid_sav_voiture_quinze","_uid_sav_voiture_seize","_uid_sav_voiture_dix_sept","_uid_sav_voiture_dix_huit","_uid_sav_voiture_dix_neuf","_uid_sav_voiture_vingt"];

	_uid = _this select 0;
	_varName = _this select 2;
	
	if (count _this >= 3) then {_varValue = _this select 3;};
	if (isNil '_varValue') exitWith {};
	
	if (uid_sav_voiture_fichier_listes_des_vehicules == _uid) then 
	{
		if(_varName == 'Nombre De Vehicules Total') then {sauvegarde_vehicules_nombre_de_vehicules_total = _varValue;};
		if(_varName == 'Ordre De Rangement Vehicules') then {sauvegarde_vehicules_ordre_de_rangement = _varValue;};

		if(_varName == 'Type') then {sauvegarde_vehicule_Type = _varValue;};
		if(_varName == 'Position') then {sauvegarde_vehicule_Position = _varValue;};
		if(_varName == 'Direction') then {sauvegarde_vehicule_Direction = _varValue;};
		if(_varName == 'Armes') then {sauvegarde_vehicule_Armes = _varValue;};
		if(_varName == 'Munitions') then {sauvegarde_vehicule_Munitions = _varValue;};
		if(_varName == 'Items') then {sauvegarde_vehicule_Items = _varValue;};
		if(_varName == 'backpack') then {sauvegarde_vehicule_backpack = _varValue;};
		if(_varName == 'Gasoil') then {sauvegarde_vehicule_Gasoil = _varValue;};
		
		if(_varName == 'Proprietaire') then {sauvegarde_vehicule_proprietaire = _varValue;};
		if(_varName == 'plaque_immatriculation_news') then {sauvegarde_vehicule_numero_plaque_immatriculation = _varValue;};
		if(_varName == 'prix_du_vehicule_neuf') then {sauvegarde_vehicule_prix_du_vehicule_neuf = _varValue;};
		if(_varName == 'voiture_possede_une_assurance') then {sauvegarde_vehicule_voiture_possede_une_assurance = _varValue;};
		if(_varName == 'Couleur du vehicule') then {sauvegarde_vehicule_Couleur_Vehicule = _varValue;};
		if(_varName == 'voiture_possede_un_klaxon') then {sauvegarde_vehicule_Klaxon_Perso = _varValue;};
		if(_varName == 'voiture_possede_une_puce') then {sauvegarde_vehicule_Puce = _varValue;};
		if(_varName == 'voiture_possede_un_neon') then {sauvegarde_vehicule_Neon = _varValue;};
		if(_varName == 'voiture_possede_un_radar_de_recul') then {sauvegarde_vehicule_Radar_De_Recul = _varValue;};
		if(_varName == 'voiture_possede_un_detecteur_de_radar') then {sauvegarde_vehicule_detecteur_De_Radar = _varValue;};
		if(_varName == 'voiture_possede_un_nouveau_poids') then {sauvegarde_vehicule_nouveau_poids = _varValue;};
		if(_varName == 'reservoir_d_eau_pour_pompier') then {sauvegarde_vehicule_reservoir_d_eau_pour_pompier = _varValue;};
		
		if(_varName == 'Espace utilise') then {sauvegarde_vehicule_Espace_utilise = _varValue;};
		if(_varName == 'Espace total') then {sauvegarde_vehicule_Espace_total = _varValue;};
		
		if(_varName == 'Item_baleines') then {sauvegarde_vehicule_Item_baleines = _varValue;};
		if(_varName == 'Item_requins') then {sauvegarde_vehicule_Item_requins = _varValue;};
		if(_varName == 'item_cocaine_feuille_coca_sfp') then {sauvegarde_vehicule_item_cocaine_feuille_coca = _varValue;};
		if(_varName == 'item_cocaine_poudre_sfp') then {sauvegarde_vehicule_item_cocaine_poudre = _varValue;};
		if(_varName == 'item_medicaments_sfp') then {sauvegarde_vehicule_Item_medicaments = _varValue;};
		if(_varName == 'Item_Animaux') then {sauvegarde_vehicule_Item_Animaux = _varValue;};
		if(_varName == 'Item_pommes') then {sauvegarde_vehicule_Item_pommes = _varValue;};
		if(_varName == 'Item_pommes_de_terre') then {sauvegarde_vehicule_Item_pommes_de_terre = _varValue;};
		if(_varName == 'Item_sel') then {sauvegarde_vehicule_Item_sel = _varValue;};
		if(_varName == 'Item_heroine') then {sauvegarde_vehicule_Item_heroine = _varValue;};
		if(_varName == 'Item_heroine_transforme') then {sauvegarde_vehicule_Item_heroine_transforme = _varValue;};
		if(_varName == 'Item_cuivre') then {sauvegarde_vehicule_Item_cuivre = _varValue;};
		if(_varName == 'Item_cuivre_transfo') then {sauvegarde_vehicule_Item_cuivre_transfo = _varValue;};
		if(_varName == 'Item_cannabis_traite') then {sauvegarde_vehicule_Item_cannabis_traite = _varValue;};
		if(_varName == 'Item_cannabis_non_traite') then {sauvegarde_vehicule_Item_cannabis_non_traite = _varValue;};
		if(_varName == 'Item_truffle') then {sauvegarde_vehicule_Item_truffle = _varValue;};
		if(_varName == 'Item_poissons') then {sauvegarde_vehicule_Item_poissons = _varValue;};
		if(_varName == 'Item_poissons_panes') then {sauvegarde_vehicule_Item_poissons_panes = _varValue;};
		if(_varName == 'Item_unpoil') then {sauvegarde_vehicule_Item_unpoil = _varValue;};
		if(_varName == 'Item_prooil') then {sauvegarde_vehicule_Item_prooil = _varValue;};
		if(_varName == 'Item_bois') then {sauvegarde_vehicule_Item_bois = _varValue;};
		if(_varName == 'item_lapins_sfp') then {sauvegarde_vehicule_Item_lappins = _varValue;};
		if(_varName == 'serpent_non_transforme') then {sauvegarde_vehicule_Item_serpent_non_transforme = _varValue;};
		if(_varName == 'serpent_transforme') then {sauvegarde_vehicule_Item_serpent_transforme = _varValue;};
		if(_varName == 'item_or_non_transforme_sfp') then {sauvegarde_vehicule_Item_or_non_traite = _varValue;};
		if(_varName == 'item_or_transforme_sfp') then {sauvegarde_vehicule_Item_or_traite = _varValue;};
		if(_varName == 'item_plante_illegale_prete_a_vendre_sfp') then {sauvegarde_vehicule_item_plante_illegale_prete_a_vendre = _varValue;};
		
		if(_varName == 'dommage_roue_un') then {sauvegarde_vehicule_dommage_roue_un = _varValue;};
		if(_varName == 'dommage_roue_deux') then {sauvegarde_vehicule_dommage_roue_deux = _varValue;};
		if(_varName == 'dommage_roue_trois') then {sauvegarde_vehicule_dommage_roue_trois = _varValue;};
		if(_varName == 'dommage_roue_quatre') then {sauvegarde_vehicule_dommage_roue_quatre = _varValue;};
		if(_varName == 'body') then {sauvegarde_vehicule_body = _varValue;};
		if(_varName == 'Degat_general') then {sauvegarde_vehicule_degat_general = _varValue;};
		if(_varName == 'Degat_reservoir_gasoil') then {sauvegarde_vehicule_Degat_reservoir_gasoil = _varValue;};
		if(_varName == 'Degat_moteur_un') then {sauvegarde_vehicule_Degat_moteur_un = _varValue;};
		if(_varName == 'Degat_moteur_deux') then {sauvegarde_vehicule_Degat_moteur_deux = _varValue;};
		if(_varName == 'Degat_moteur_trois') then {sauvegarde_vehicule_Degat_moteur_trois = _varValue;};
		if(_varName == 'Degat_rotor') then {sauvegarde_vehicule_Degat_rotor = _varValue;};
		if(_varName == 'Degat_rotor_deux') then {sauvegarde_vehicule_Degat_rotor_deux = _varValue;};
		if(_varName == 'Degat_batterie') then {sauvegarde_vehicule_Degat_batterie = _varValue;};
		if(_varName == 'degat_lumiere') then {sauvegarde_vehicule_degat_lumiere = _varValue;};
		if(_varName == 'degat_hydraulique') then {sauvegarde_vehicule_degat_hydraulique = _varValue;};
		if(_varName == 'degat_transmissions') then {sauvegarde_vehicule_degat_transmissions = _varValue;};
		if(_varName == 'degat_train_atterrisage') then {sauvegarde_vehicule_degat_train_atterrisage = _varValue;};
		if(_varName == 'degat_stabilisateur') then {sauvegarde_vehicule_degat_stabilisateur = _varValue;};
		if(_varName == 'degat_stabilisateur_deux') then {sauvegarde_vehicule_degat_stabilisateur_deux = _varValue;};
		if(_varName == 'degat_stabilisateur_trois') then {sauvegarde_vehicule_degat_stabilisateur_trois = _varValue;};
		if(_varName == 'degat_hit_trail') then {sauvegarde_vehicule_degat_hit_trail = _varValue;};
		if(_varName == 'degat_hit_pitot') then {sauvegarde_vehicule_degat_hit_pitot = _varValue;};
		if(_varName == 'degat_static_port') then {sauvegarde_vehicule_degat_static_port = _varValue;};
		if(_varName == 'degat_hit_strarter_un') then {sauvegarde_vehicule_degat_hit_strarter_un = _varValue;};
		if(_varName == 'degat_hit_strarter_deux') then {sauvegarde_vehicule_degat_hit_strarter_deux = _varValue;};
		if(_varName == 'degat_hit_strarter_trois') then {sauvegarde_vehicule_degat_hit_strarter_trois = _varValue;};
		if(_varName == 'degat_hit_avionics') then {sauvegarde_vehicule_degat_hit_avionics = _varValue;};
		if(_varName == 'degat_hit_hull') then {sauvegarde_vehicule_degat_hit_hull = _varValue;};
		if(_varName == 'degat_hit_missiles') then {sauvegarde_vehicule_degat_hit_missiles = _varValue;};
		if(_varName == 'degat_rg_glasse_un') then {sauvegarde_vehicule_degat_rg_glasse_un = _varValue;};
		if(_varName == 'degat_rg_glasse_deux') then {sauvegarde_vehicule_degat_rg_glasse_deux = _varValue;};
		if(_varName == 'degat_glasse_une') then {sauvegarde_vehicule_degat_glasse_une = _varValue;};
		if(_varName == 'degat_glasse_deux') then {sauvegarde_vehicule_degat_glasse_deux = _varValue;};
		if(_varName == 'degat_glasse_trois') then {sauvegarde_vehicule_degat_glasse_trois = _varValue;};
		if(_varName == 'degat_glasse_quatre') then {sauvegarde_vehicule_degat_glasse_quatre = _varValue;};
		if(_varName == 'degat_glasse_cinq') then {sauvegarde_vehicule_degat_glasse_cinq = _varValue;};
		if(_varName == 'degat_glasse_six') then {sauvegarde_vehicule_degat_glasse_six = _varValue;};
	};
	
	if (uid_unique_pour_la_sauvegarde == _uid) then 
	{
		// Temps d'attente le temps de charger le reste
		if (_varName == 'Argent Poche' or _varName == 'Argent Banque' or _varName == 'Livret A') then
		{
			[_varName, _varValue] spawn	
			{
				_varName = _this select 0; _varValue = _this select 1; 
				waituntil {!isnil "fin_verification_apres_chargement"}; // Attente que la date de naissance soit charge
				
				if(_varName == 'Argent Poche') then {if (player getvariable "ma_date_de_naissance" >= 2) then {player setVariable ["mon_argent_poche_by_sfp_maxou", _varValue, true]; autorisation_mouvement_argent = true;};};
				if(_varName == 'Argent Banque') then {if (player getvariable "ma_date_de_naissance" >= 2 && _varValue != 0) then {player setVariable ["mon_argent_banque_by_sfp_maxou", _varValue, true]; autorisation_mouvement_argent = true;};};
				if(_varName == 'Livret A') then {if (player getvariable "ma_date_de_naissance" >= 2) then {player setVariable ["mon_livret_a", _varValue, false];};};
			};
		};
		
		if(_varName == 'mes_pseudos_utilises') then {player setVariable ["mes_pseudos_utilises", _varValue, true];};
		if(_varName == 'ma_date_de_naissance') then {player setVariable ["ma_date_de_naissance", _varValue, true]; ma_date_de_naissance_confirme = true;};
		if(_varName == 'dernier_speudo_utiliser_news') then {relire_toute_ma_sauvegarde_confirme = true; if (_varValue != name player) then {relire_toute_ma_sauvegarde = "oui"; [uid_unique_pour_la_sauvegarde, uid_unique_pour_la_sauvegarde, "dernier_speudo_utiliser_news", name player] call fn_SaveToServer;};};
	};
	
	if (uid_unique_et_side_pour_la_sauvegarde == _uid) then 
	{		
		if(_varName == 'integralite_items') then {if (count _varValue > 0) then {[player, [_varValue]] call BIS_fnc_loadInventory;};};
		
		if(_varName == 'Joueur Menotte') then {if (_varValue) then {player setVariable ["joueur_menotte", _varValue, true];};};
		if(_varName == 'Revive_news') then {if (_varValue) then {player setVariable ["besoin_d_un_revive_news", _varValue, true]; execVM "divers\revive_sfp\protection_respawn.sqf";};};
		if(_varName == 'nombre_de_permis') then {if (_varValue != 0) then {player setVariable ["nombre_de_permis", _varValue, true];};};
		if(_varName == 'evade_de_prison') then {player setVariable ["evade_de_prison", _varValue, false];};
		if(_varName == 'arrested') then {if (_varValue) then {player setVariable ["joueur_arreter", _varValue, true];};};
		if(_varName == 'liste_de_mes_maisons') then {liste_de_mes_maisons = _varValue;};
		
		if(_varName == 'Point permis de conduire') then {if (_varValue != 0) then {player setVariable ["combien_de_point_by_sfp_maxou", _varValue, true];};};
		if(_varName == 'License permis de conduire') then {player setVariable ["license_permis_de_conduire_by_sfp_maxou", _varValue, true];};
		if(_varName == 'License permis lourd') then {player setVariable ["license_permis_de_conduire_poids_lourd_by_sfp_maxou", _varValue, true];};
		if(_varName == 'licence_bateau_news') then {if (_varValue) then {player setVariable ["licence_bateau_news", _varValue, true];};};
		if(_varName == 'license_pilote_news') then {if (_varValue) then {player setVariable ["license_pilote_news", _varValue, true];};};
		if(_varName == 'permis_de_chasse') then {if (_varValue) then {player setVariable ["permis_de_chasse", _varValue, true];};};
		if(_varName == 'licence_petrole') then {if (_varValue) then {player setVariable ["licence_petrole", _varValue, true];};};
		if(_varName == 'licence_fusils') then {if (_varValue) then {player setVariable ["licence_fusils", _varValue, true];};};
		if(_varName == 'licence_fusils_illegaux') then {if (_varValue) then {player setVariable ["licence_fusils_illegaux", _varValue, false];};};
		if(_varName == 'permis_port_d_arme') then {if (_varValue) then {player setVariable ["permis_port_d_arme", _varValue, true];};};
		if(_varName == 'licence_heroine') then {if (_varValue) then {player setVariable ["licence_heroine", _varValue, true];};};
		if(_varName == 'licence_cannabis') then {if (_varValue) then {player setVariable ["licence_cannabis", _varValue, true];};};
		if(_varName == 'licence_gang_v2') then {if (_varValue) then {player setVariable ["licence_gang_v2", _varValue, true];};};
		if(_varName == 'Experience Cocaine') then {if (_varValue != 0) then {player setVariable ["experience_transformation_cocaine", _varValue, false];};};
		
		if(_varName == 'jai_fait_un_cambriolage_news') then {if (_varValue) then {player setVariable ["jai_fait_un_cambriolage_news", _varValue, true];};};
		if(_varName == 'recherche_pour_armes_illegales') then {if (_varValue) then {player setVariable ["recherche_pour_armes_illegales", _varValue, true];};};
		if(_varName == 'recherche_pour_braquage') then {if (_varValue) then {player setVariable ["recherche_pour_braquage", _varValue, true];};};
		if(_varName == 'recherche_pour_conduite_sans_permis') then {if (_varValue) then {player setVariable ["recherche_pour_conduite_sans_permis", _varValue, true];};};
		if(_varName == 'je_suis_malade_a_la_sauvegarde') then {if (_varValue) then {player setVariable ["je_suis_malade_a_la_sauvegarde", _varValue, true]; execvm "divers\maladie\init_maladie_si_sauvegarde_affirmatif.sqf";};};
		if(_varName == 'infraction_wanted_liste') then {if (count _varValue > 0) then {player setVariable ["infraction_wanted_liste", _varValue, true];};};
		if(_varName == 'credit_sfp_sauvegarde') then {if (count _varValue > 0) then {credit_sfp_sauvegarde = _varValue;};};
		
		if(_varName == 'usedspace') then {if (_varValue != 0) then {player setVariable ["usedspace", _varValue, true];};};
		if(_varName == 'totalspace') then {if (_varValue != 0) then {player setVariable ["totalspace", _varValue, true];};};
		if(_varName == 'item_poissons_sfp') then {if (_varValue != 0) then {player setVariable ["item_poissons_sfp", _varValue, true];};};
		if(_varName == 'itemfishpoissonspanes') then {if (_varValue != 0) then {player setVariable ["itemfishpoissonspanes", _varValue, true];};};
		if(_varName == 'item_truffe_sfp') then {if (_varValue != 0) then {player setVariable ["item_truffe_sfp", _varValue, true];};};
		if(_varName == 'item_bois_sfp') then {if (_varValue != 0) then {player setVariable ["item_bois_sfp", _varValue, true];};};
		if(_varName == 'item_lapins_sfp') then {if (_varValue != 0) then {player setVariable ["item_lapins_sfp", _varValue, true];};};
		if(_varName == 'serpent_non_transforme') then {if (_varValue != 0) then {player setVariable ["serpent_non_transforme", _varValue, true];};};
		if(_varName == 'item_heroine_non_traite_sfp') then {if (_varValue != 0) then {player setVariable ["item_heroine_non_traite_sfp", _varValue, true];};};
		if(_varName == 'item_cuivre_non_transforme_sfp') then {if (_varValue != 0) then {player setVariable ["item_cuivre_non_transforme_sfp", _varValue, true];};};
		if(_varName == 'item_cuivre_transforme_sfp') then {if (_varValue != 0) then {player setVariable ["item_cuivre_transforme_sfp", _varValue, true];};};
		if(_varName == 'item_heroine_traite_sfp') then {if (_varValue != 0) then {player setVariable ["item_heroine_traite_sfp", _varValue, true];};};
		if(_varName == 'item_plante_pour_planter') then {if (_varValue != 0) then {player setVariable ["item_plante_pour_planter", _varValue, true];};};
		if(_varName == 'item_plante_fertilisant_rouge') then {if (_varValue != 0) then {player setVariable ["item_plante_fertilisant_rouge", _varValue, true];};};
		if(_varName == 'item_baleine_sfp') then {if (_varValue != 0) then {player setVariable ["item_baleine_sfp", _varValue, true];};};
		if(_varName == 'item_requin_sfp') then {if (_varValue != 0) then {player setVariable ["item_requin_sfp", _varValue, true];};};
		if(_varName == 'item_plante_illegale_prete_a_vendre_sfp') then {if (_varValue != 0) then {player setVariable ["item_plante_illegale_prete_a_vendre_sfp", _varValue, true];};};
		if(_varName == 'item_cocaine_feuille_coca_sfp') then {if (_varValue != 0) then {player setVariable ["item_cocaine_feuille_coca_sfp", _varValue, true];};};
		if(_varName == 'item_cocaine_poudre_sfp') then {if (_varValue != 0) then {player setVariable ["item_cocaine_poudre_sfp", _varValue, true];};};
		if(_varName == 'item_cannabis_non_traite_sfp') then {if (_varValue != 0) then {player setVariable ["item_cannabis_non_traite_sfp", _varValue, true];};};
		if(_varName == 'item_cannabis_traite_sfp') then {if (_varValue != 0) then {player setVariable ["item_cannabis_traite_sfp", _varValue, true];};};
		if(_varName == 'item_medicaments_sfp') then {if (_varValue != 0) then {player setVariable ["item_medicaments_sfp", _varValue, true];};};
		if(_varName == 'item_organes_animaux_sfp') then {if (_varValue != 0) then {player setVariable ["item_organes_animaux_sfp", _varValue, true];};};
		if(_varName == 'item_pomme_sfp') then {if (_varValue != 0) then {player setVariable ["item_pomme_sfp", _varValue, true];};};
		if(_varName == 'item_sel_sfp') then {if (_varValue != 0) then {player setVariable ["item_sel_sfp", _varValue, true];};};
		if(_varName == 'item_pomme_de_terre_sfp') then {if (_varValue != 0) then {player setVariable ["item_pomme_de_terre_sfp", _varValue, true];};};
		if(_varName == 'item_or_transforme_sfp') then {if (_varValue != 0) then {player setVariable ["item_or_transforme_sfp", _varValue, true];};};
		if(_varName == 'item_or_non_transforme_sfp') then {if (_varValue != 0) then {player setVariable ["item_or_non_transforme_sfp", _varValue, true];};};
		if(_varName == 'item_petrole_non_traite_sfp') then {if (_varValue != 0) then {player setVariable ["item_petrole_non_traite_sfp", _varValue, true];};};
		if(_varName == 'item_petrole_traite_sfp') then {if (_varValue != 0) then {player setVariable ["item_petrole_traite_sfp", _varValue, true];};};
		
		if(_varName == 'corde_descente_rappel_sfp') then {if (_varValue) then {player setVariable ["corde_descente_rappel_sfp", _varValue, true];};};
		if(_varName == 'boite_allumette') then {if (_varValue) then {player setVariable ["boite_allumette", _varValue, true];};};
		if(_varName == 'marteau_sfp') then {if (_varValue) then {player setVariable ["marteau_sfp", _varValue, true];};};
		if(_varName == 'barredecereale') then {if (_varValue != 0) then {player setVariable ["barredecereale", _varValue, true];};};
		if(_varName == 'bouteilledeau') then {if (_varValue != 0) then {player setVariable ["bouteilledeau", _varValue, true];};};
		if(_varName == 'traceur_vehicule') then {if (_varValue != 0) then {player setVariable ["traceur_vehicule", _varValue, true];};};
		if(_varName == 'corde_et_sac') then {if (_varValue != 0) then {player setVariable ["corde_et_sac", _varValue, true];};};
		if(_varName == 'poignard_item') then {if (_varValue != 0) then {player setVariable ["poignard_item", _varValue, true];};};
		if(_varName == 'cocktail_molotov') then {if (_varValue != 0) then {player setVariable ["cocktail_molotov", _varValue, true];};};
		if(_varName == 'brouilleur_sacoche_c4') then {if (_varValue != 0) then {player setVariable ["brouilleur_sacoche_c4", _varValue, true];};};
		if(_varName == 'sacoche_de_c4') then {if (_varValue != 0) then {player setVariable ["sacoche_de_c4", _varValue, true];};};
		if(_varName == 'redbull') then {if (_varValue != 0) then {player setVariable ["redbull", _varValue, true];};};
		if(_varName == 'canne_a_peche') then {if (_varValue != 0) then {player setVariable ["canne_a_peche", _varValue, true];};};
		if(_varName == 'tente_pour_dormir') then {if (_varValue != 0) then {player setVariable ["tente_pour_dormir", _varValue, true];};};
		if(_varName == 'seau_plante_illegal') then {if (_varValue != 0) then {player setVariable ["seau_plante_illegal", _varValue, true];};};
		if(_varName == 'valise_pour_le_farming') then {if (_varValue != 0) then {player setVariable ["valise_pour_le_farming", _varValue, true];};};
		if(_varName == 'coffre_fort') then {if (_varValue != 0) then {player setVariable ["coffre_fort", _varValue, true];};};
		if(_varName == 'bidon_d_essence') then {if (_varValue != 0) then {player setVariable ["bidon_d_essence", _varValue, true];};};
		if(_varName == 'gants_pour_petrole') then {if (_varValue != 0) then {player setVariable ["gants_pour_petrole", _varValue, true];};};
		if(_varName == 'pied_de_biche') then {if (_varValue != 0) then {player setVariable ["pied_de_biche", _varValue, true];};};
		if(_varName == 'hache_pour_coupe_de_bois') then {if (_varValue != 0) then {player setVariable ["hache_pour_coupe_de_bois", _varValue, true];};};
		if(_varName == 'harpon_pour_la_peche') then {if (_varValue != 0) then {player setVariable ["harpon_pour_la_peche", _varValue, true];};};
		if(_varName == 'gelule_amphetamines') then {if (_varValue != 0) then {player setVariable ["gelule_amphetamines", _varValue, true];};};
		
		if(_varName == 'temps_fatigue_niveau_1') then {player setVariable ["temps_fatigue_niveau_1", _varValue, false];};
		if(_varName == 'temps_fatigue_niveau_2') then {player setVariable ["temps_fatigue_niveau_2", _varValue, false];};
		if(_varName == 'temps_fatigue_niveau_3') then {player setVariable ["temps_fatigue_niveau_3", _varValue, false];};
		if(_varName == 'temps_fatigue_niveau_4') then {player setVariable ["temps_fatigue_niveau_4", _varValue, false];};
		if(_varName == 'temps_fatigue_niveau_5') then {player setVariable ["temps_fatigue_niveau_5", _varValue, false];};
		
		if(_varName == 'niveau_force') then {player setVariable ["niveau_force", _varValue, false];};
		
		if(_varName == 'license_BAC_PRO') then {player setVariable ["license_BAC_PRO", _varValue, false];};
		if(_varName == 'license_BTS') then {player setVariable ["license_BTS", _varValue, false];};
		if(_varName == 'license_BEPC') then {player setVariable ["license_BEPC", _varValue, false];};
		if(_varName == 'license_BAC_GENERAL') then {player setVariable ["license_BAC_GENERAL", _varValue, false];};
		if(_varName == 'license_DEUG') then {player setVariable ["license_DEUG", _varValue, false];};
		if(_varName == 'license_BEP_Mecanique') then {player setVariable ["license_BEP_Mecanique", _varValue, false];};
		
		if(_varName == 'sarl_car_shop') then {if (_varValue) then {player setVariable ["sarl_car_shop", _varValue, true];};};
		if(_varName == 'sarl_depannage') then {if (_varValue) then {player setVariable ["sarl_depannage", _varValue, true];};};
		if(_varName == 'sarl_pompier') then {if (_varValue) then {player setVariable ["sarl_pompier", _varValue, true];};};
		if(_varName == 'sarl_autoecole') then {if (_varValue) then {player setVariable ["sarl_autoecole", _varValue, true];};};
		if(_varName == 'sarl_avocat') then {if (_varValue) then {player setVariable ["sarl_avocat", _varValue, true];};};
		if(_varName == 'sarl_taxis_gsept') then {if (_varValue) then {player setVariable ["sarl_taxis_gsept", _varValue, true];};};
		if(_varName == 'sarl_neomedia') then {if (_varValue) then {player setVariable ["sarl_neomedia", _varValue, true];};};
		
		if(_varName == sfp_config_famille_une_nom_pour_variable) then {if (_varValue) then {player setVariable [sfp_config_famille_une_nom_pour_variable, _varValue, true];};};
		if(_varName == sfp_config_famille_deux_nom_pour_variable) then {if (_varValue) then {player setVariable [sfp_config_famille_deux_nom_pour_variable, _varValue, true];};};
		
		if(_varName == 'ma_carte_identite') then {if (count _varValue > 0) then {player setVariable ["ma_carte_identite", _varValue, true];};};
		
		if(_varName == 'je_possede_un_telephone_sfp') then {if (count _varValue > 0) then {player setVariable ["je_possede_un_telephone_sfp", _varValue, true];};};
		
		if(_varName == 'ma_mutuelle_niveau_10_pour_cent') then {player setVariable ["ma_mutuelle_niveau_10_pour_cent", _varValue, false];};
		if(_varName == 'ma_mutuelle_niveau_vingt_cinq_pour_cent') then {player setVariable ["ma_mutuelle_niveau_vingt_cinq_pour_cent", _varValue, false];};
		if(_varName == 'ma_mutuelle_niveau_cinquante_pour_cent') then {player setVariable ["ma_mutuelle_niveau_cinquante_pour_cent", _varValue, false];};
		if(_varName == 'ma_mutuelle_niveau_soixante_quinze_pour_cent') then {player setVariable ["ma_mutuelle_niveau_soixante_quinze_pour_cent", _varValue, false];};
		if(_varName == 'ma_mutuelle_niveau_cent_pour_cent') then {player setVariable ["ma_mutuelle_niveau_cent_pour_cent", _varValue, false];};
	};

	if (uid_pour_mettre_amende == _uid) then 
	{
		if(_varName == 'Montant de l amende') then {player setVariable ["montant_de_l_amende", _varValue, false];};		
		if(_varName == 'Message amende') then {player setVariable ["message_amende", _varValue, false];};		
		if(_varName == 'Historique nombre amende') then {player setVariable ["historique_nombre_amende", _varValue, false];};		
	};
	
	if (uid_pour_remboursement == _uid) then 
	{
		if(_varName == 'Montant du remboursement') then {player setVariable ["montant_du_remboursement", _varValue, false];};		
		if(_varName == 'Message remboursement') then {player setVariable ["message_du_remboursement", _varValue, false];};		
		if(_varName == 'Historique nombre remboursement') then {player setVariable ["historique_nombre_remboursement", _varValue, false];};		
	};
	
	if (uid_whitelist_gendarme == _uid) then {if (_varName == uid_unique_pour_la_sauvegarde) then {if (count _varValue > 0) then {if (name player in _varValue) then {je_suis_whiteliste_gendarme = 1;} else {player globalchat "ATTENTION, vous êtes bien whitelisté GENDARME mais vous n'utilisez pas le bon pseudo !";};};};};	
	if (uid_whitelist_gendarme_stagiaire == _uid) then {if (_varName == uid_unique_pour_la_sauvegarde) then {if (count _varValue > 0) then {if (name player in _varValue) then {je_suis_whiteliste_gendarme_stagiaire = true;} else {player globalchat "ATTENTION, vous êtes bien whitelisté GENDARME STAGIAIRE mais vous n'utilisez pas le bon pseudo !";};};};};	
	if (uid_whitelist_psig == _uid) then {if (_varName == uid_unique_pour_la_sauvegarde) then {if (count _varValue > 0) then {if (name player in _varValue) then {je_suis_whiteliste_psig = 1;} else {player globalchat "ATTENTION, vous êtes bien whitelisté PSIG mais vous n'utilisez pas le bon pseudo !";};};};};
	if (uid_whitelist_GIGN == _uid) then {if (_varName == uid_unique_pour_la_sauvegarde) then {if (count _varValue > 0) then {if (name player in _varValue) then {je_suis_whiteliste_GIGN = 1;} else {player globalchat "ATTENTION, vous êtes bien whitelisté GIGN mais vous n'utilisez pas le bon pseudo !";};};};};
	if (uid_whitelist_maire_de_la_ville == _uid) then {if (_varName == uid_unique_pour_la_sauvegarde) then {if (count _varValue > 0) then {if (name player in _varValue) then {je_suis_whiteliste_mairie_de_la_ville = 1;} else {player globalchat "ATTENTION, vous êtes bien whitelisté maire de la ville mais vous n'utilisez pas le bon pseudo !";};};};};
};

//===========================================================================
private ["_save","_save_voitures","_delete_base_voitures","_delete_section_base_voitures","_sendToServer_chargement_voitures"];

_delete_section_base_voitures =
"
	accountToServer_delete_section = _this;
	publicvariable 'accountToServer_delete_section';
";
fn_delete_section = compile _delete_section_base_voitures;
// ------------------------------------------------------ //

_LoadToServer =
"
	accountToServerLoad = _this;
	publicvariable 'accountToServerLoad';
";
LoadToServer = compile _LoadToServer;
// ------------------------------------------------------ //

_save =
"
	accountToServerSave = _this;
	publicvariable 'accountToServerSave';
";
fn_SaveToServer = compile _save;

//===========================================================================
"accountToClient" addPublicVariableEventHandler 
{
	(_this select 1) spawn applyPlayerDBValues;
};


fonction_de_la_sauvegarde_initialise = 1;

