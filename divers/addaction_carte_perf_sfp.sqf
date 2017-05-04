// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isnil "fin_verification_apres_chargement" && !isnil "fin_trigger_des_collectes" && !isnil "fin_marker_des_transformations"};
private ["_distance_pour_rescan_addaction", "_creer_addaction_sfp", "_condition","_choix_dans_le_tableau"];

_creer_addaction_sfp =
{
	_position_de_depart = _this select 0;
	_distance_pour_rescan_addaction = _this select 1;
	_sur_qui_mettre_addaction = _this select 2;
	_le_nom = _this select 3;
	_le_script = _this select 4;
	_les_valeurs_a_envoyer = _this select 5;
	_la_priorite = _this select 6;
	_la_condition = _this select 7;
	if (isnil "_position_de_depart" or isnil "_distance_pour_rescan_addaction" or isnil "_sur_qui_mettre_addaction" or isnil "_le_nom" or isnil "_le_script" or isnil "_les_valeurs_a_envoyer" or isnil "_la_priorite" or isnil "_la_priorite" or isnil "_la_condition") exitwith {hint "Erreur addaction ...";};
	
	_nom_addaction = _sur_qui_mettre_addaction addAction [_le_nom, _le_script, [_les_valeurs_a_envoyer], _la_priorite, true, true, "", _la_condition];
	waituntil {sleep 0.1; (vehicle player) distance _position_de_depart > (_distance_pour_rescan_addaction - 0.3) or !alive player}; 
	player removeaction _nom_addaction;
};

listes_des_marqueurs_sur_la_carte_sfp = [];
_liste_des_marqueurs_son_nom_autorise_sfp = ["hd_warning","b_maint","n_maint","loc_Hospital","o_maint","c_car","c_air","c_plane","loc_Transmitter"];
{if (markerText _x != "" or getmarkertype _x in _liste_des_marqueurs_son_nom_autorise_sfp) then {listes_des_marqueurs_sur_la_carte_sfp pushback _x;};} forEach allMapMarkers;

while {true} do
{
	_position_de_depart = position player;
	_distance_pour_rescan_addaction = 3.5; // Relancer scan pour addaction une fois cette distance dépassée
	_condition = false;
	
// =======================================================================================================================================================================================
// Par nearestObjects
// =======================================================================================================================================================================================
	// Station Service Braquage
	{
		if (alive _x) then
		{
			_condition = true;
		};
	} foreach (nearestObjects [player, ["Land_CarService_F"], 5]); 
	if (_condition) then {_condition = false; [_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "Braque La Station", "divers\station_service\braquage_station_service\braquer_la_station.sqf", 1, 20, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Acheter Redbull (6 Euros)", "divers\station_service\achat_divers_station_service\acheter_redbull_station_sercice.sqf", 1, 20, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Acheter Barre De Céréale (2 Euros)", "divers\station_service\achat_divers_station_service\acheter_cereales_station_service.sqf", 1, 20, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Acheter Bouteille D'Eau (1 Euros)", "divers\station_service\achat_divers_station_service\acheter_bouteille_eau_station_service.sqf", 1, 20, ""] spawn _creer_addaction_sfp;};

	// Station Service
	{
		_x setfuelcargo 0;
		titleText ["Les pompes sont desactivés, utilise le menu déroulant REMETTRE DE L'ESSENCE ...","PLAIN DOWN"];
		_condition = true;
	} foreach (nearestObjects [player, ["Land_fs_feed_F","Land_fs_roof_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 12]); 
	if (_condition) then {_condition = false; [_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "REMETTRE DE L'ESSENCE", "divers\reparation_des_vehicules\Refuel.sqf", 1, 20, ""] spawn _creer_addaction_sfp;};
	
	// Barriere Automatique
	{
		if (driver assignedVehicle player == player) then
		{
			_condition = true;
		};
	} foreach (nearestObjects [player, ["Land_BarGate_F"], 8.5]); 
	if (_condition) then 
	{
		_condition = false;
		[] spawn
		{
			_la_barriere = ((nearestObjects [position (vehicle player), ["Land_BarGate_F"], 12]) select 0);
			_la_barriere animate ["Door_1_rot", 1];
			waituntil {sleep 0.1; player distance _la_barriere > 8;};
			if (count (nearestObjects [position _la_barriere, ["CAR","MAN"], 8.5]) < 1) then {_la_barriere animate ["Door_1_rot", 0];};
		};
	};

// =======================================================================================================================================================================================
// Par Marker
// =======================================================================================================================================================================================
	{
		if (player distance (getmarkerpos _x) < (_distance_pour_rescan_addaction + 4)) then
		{
			_son_nom = markerText _x;
			_son_type = getmarkertype _x;
			_sa_couleur = markerColor _x;

			if (_son_type == "hd_warning") then // Rouge 50 et Jaune 130
			{
				switch _sa_couleur do
				{
					case "ColorRed" :
					{
						if ((speed vehicle player) > 50 && getpos (vehicle player) select 2 < 1 && (driver vehicle player == player) && (isnil "sirene_du_vehicule_active") && (vehicle player) animationPhase "ani_siren" < 0.2) then
						{
							[] execvm "divers\radar\radar_fixe_flash_cinquante.sqf";
						};
					};
					case "ColorYellow" :		
					{
						if ((speed vehicle player) > 130 && getpos (vehicle player) select 2 < 1 && (driver vehicle player == player) && (isnil "sirene_du_vehicule_active") && (vehicle player) animationPhase "ani_siren" < 0.2) then
						{
							[] execvm "divers\radar\radar_fixe_flash_cent_trente.sqf";
						};
					};
				};
			};

			if (_son_type == "loc_Bunker") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Réarmer Véhicule (10 000 Euros)", "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf", vehicle player, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_type == "n_maint") then {[_position_de_depart, 6, player, "Réparer Hélicoptère", "divers\reparation_des_vehicules\helirepair.sqf", 0, 10, ""] spawn _creer_addaction_sfp; [_position_de_depart, 6, player, "Remettre Du Kerosene", "divers\reparation_des_vehicules\Refuel.sqf", 1, 10, ""] spawn _creer_addaction_sfp; _position_de_base = position (vehicle player); waitUntil {(vehicle player) distance _position_de_base > 3};};
			if (_son_type == "o_maint") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Réparer Bateau", "divers\reparation_des_vehicules\bateaurepair.sqf", 0, 10, "driver assignedVehicle player == player"] spawn _creer_addaction_sfp;};
			if (_son_type == "b_maint") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Réparer Véhicule", "divers\reparation_des_vehicules\CarRepair.sqf", 0, 10, "driver assignedVehicle player == player"] spawn _creer_addaction_sfp;};
			if (_son_type == "loc_Hospital") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Consultation Medecin", "menu\medecin.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_type == "c_car" && _sa_couleur == "ColorOrange") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Vendre Ma Voiture", "divers\vendre_sa_voiture\init_menu_vendre_sa_voiture.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_type == "c_air") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Boutique Hélicoptères", "menu\vehicules\helicoptere_non_gang.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_type == "c_plane") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Boutique Avions", "menu\vehicules\avions.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_type == "loc_Transmitter") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "Réparer L'Antenne Relais SFP TELECOM", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_detruire_ou_reparer_une_antenne.sqf", 0, 10, "!isnil {cursorTarget getvariable 'antenne_sfp_telecom_desactive'} or !isnil {cursorTarget getvariable 'antenne_telecom_pirater'}"] spawn _creer_addaction_sfp; [_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "Detruire L'Antenne Relais SFP TELECOM", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_detruire_ou_reparer_une_antenne.sqf", 0, 10, "isnil {cursorTarget getvariable 'antenne_sfp_telecom_desactive'}"] spawn _creer_addaction_sfp; [_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "Pirater/Envoyer SMS Anonyme Antenne Relais SFP TELECOM", "divers\telephone_by_sfp_maxou\pirater_antenne_telecom\initilisation_pirater_antenne_telecom.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};

			if (_son_nom == " Ferry !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Menu Ferry !", "divers\ferry_sfp\menu_ferry_sfp.sqf", 0, 10, "isnil 'ferry_sfp_trajet_en_cours'"] spawn _creer_addaction_sfp;};
			if (_son_nom == " Pharmarcie !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Menu Pharmacie !", "divers\revive_sfp\pharmacie_sfp\menu_pharmacie_sfp.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Restaurant !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Boire Un Cafe", "menu\restaurantcafe.sqf", 0, 10, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Boire une boisson", "menu\restauranteau.sqf", 0, 10, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Prendre un repas", "menu\restaurantnourriture.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Go Fast") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "Declencher Un Go Fast", "divers\divers\lancer_un_go_fast.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Livrer Gasoil") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "Livrer Du Carburant", "divers\offres_d_emplois\metiers_pour_missions\livreur_de_gasoil\mission_livraison_de_gasoil.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Colis") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "<t color=""#ff0000"">" + "Livrer Un Colis", "divers\mission_de_livraison\obtenir_mission_courrier.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Bar !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Boire Un Demi", "menu\restaurantalcool.sqf", 0, 10, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Ressource Nourriture Disponible De L ile", {hint format ["! SYSTEME DE VIE SFP ! \n ---------------------------------- \n\n L'île dispose actuellement de %1 jours de réserve de nourriture suivant le nombre de joueur présent ! \n\n Vends des produits au marché pour augmenter celui ci ! \n ------------------------------------------------ \n www.sfp-team.fr.nf \n By SFP Maxou", patron_des_ressources_du_serveur]}, 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Anpe") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "ANPE (Trouver Du Travail)", "divers\offres_d_emplois\initialisation_trouver_un_travail.sqf", 0, 10, ""] spawn _creer_addaction_sfp; [_position_de_depart, _distance_pour_rescan_addaction, player, "ANPE (Connaitre Travail Actuel)", "divers\offres_d_emplois\dire_quelle_est_mon_emploi_actuel.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Ecole") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Obtenir Un Diplome (Pour Travailler, etc)", "divers\offres_d_emplois\ecole\initialisation_ecole.sqf", 0, 10, ""] spawn _creer_addaction_sfp; [_position_de_depart, _distance_pour_rescan_addaction, player, "Connaitre Mes Diplomes", "divers\offres_d_emplois\ecole\connaitre_mes_diplomes.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Mutuelle") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Demande Mutuelle", "divers\services_publiques\mutuelle\init_mutuelle.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "CAF") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Demande de RSA", "divers\services_publiques\CAF\init_caf.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Fr Des Jeux !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "La Francaise Des Jeux", "divers\francaise_des_jeux\menu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Boutique Plongee") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Boutique Plongée", "divers\achats_divers_et_vehicules\shop_divers\menu_boutique_plongee.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Journaux") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Livrer Les Journaux", "divers\offres_d_emplois\metiers_pour_missions\livreur_journaux\mission_livraison_journaux_by_maxou.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " SFP Telecom !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Achats Forfait SFP Télécom", "divers\telephone_by_sfp_maxou\sfp_telecom\boutique_sfp_telecom\menu_boutique_sfp_telecom.sqf", 0, 10, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Demander l'implantation de nouveau relais SFP Télécom", "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_demander_de_nouvelle_antenne.sqf", 0, 10, ""] spawn _creer_addaction_sfp;[_position_de_depart, _distance_pour_rescan_addaction, player, "Radio SFP Télécom", "divers\telephone_by_sfp_maxou\sfp_telecom\boutique_sfp_telecom\menu_taskforce_sfp_telecom.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Vetements") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Boutique Habits", "divers\achats_divers_et_vehicules\vetements\menu_vetement.sqf", [0,0,0,['0']], 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Livrer Marchandise") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Livrer De La Marchandise", "divers\offres_d_emplois\metiers_pour_missions\livreur_de_marchandise\mission_livraison_de_marchandise.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Travailleur Au noir") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Employer Un Travailleur Au Noir (1 000 €)", "divers\travail_au_noir\acheter_travailleur_au_noir.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Hopital !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Soigner maladie contagieuse", "divers\maladie\soigner.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Location Vehicules !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Louer une voiture de location sans permis", "divers\locations_de_vehicules\menu.sqf", 0, 10, ""] spawn _creer_addaction_sfp; [_position_de_depart, _distance_pour_rescan_addaction, player, "Rendre une voiture de location sans permis", "divers\locations_de_vehicules\rendre_le_vehicule.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Quincaillerie !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Achats Divers Quincaillerie", "divers\achat_divers_supermarche\menu_achats_de_materiels.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Mairie !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Me déclarer à la mairie ou refaire carte d'identité", "divers\services_publiques\declaration_mairie_et_carte_identite\me_declarer_a_la_mairie_creation.sqf", 0, 10, "player getvariable 'ma_carte_identite' select 1 == 'nom'"] spawn _creer_addaction_sfp; if (player getvariable 'ma_carte_identite' select 1 == 'nom') then {hint "Utilise le menu roulette pour te déclarer sur le serveur.";};};
			if (_son_nom == " Tuning !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Tunner le véhicule !", "divers\repeindre_voiture\tuning\menu_tuning.sqf", 0, 10, "!isnil {cursorTarget getvariable 'vehicule_info_parvariable'} && player distance cursorTarget < 4"] spawn _creer_addaction_sfp;};
			if (_son_nom == " Voitures Voles !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Vendre La Voiture Vole !", "divers\vendre_sa_voiture\init_menu_vendre_sa_voiture_vole.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Amphetamines") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Acheter Amphétamines !", "divers\centre_sportif\fatigue\achat_amphetamines.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Transf Cannabis") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Processus cannabis", "menu\cannabispromenu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Pepiniere") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Acheter Une Plante (3 000 Euros)", "divers\systeme_plantation\achat_plantes\achat_plantes_aleatoire.sqf", 0, 10, ""] spawn _creer_addaction_sfp; [_position_de_depart, _distance_pour_rescan_addaction, player, "Acheter Fertilisant Rouge (800 Euros - 50% de chance de recolter deux plantes)", "divers\systeme_plantation\achat_plantes\fertilisant_rouge\fertilisant_rouge.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Laboratoire (Drogue)") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Transformer Cocaine", "divers\farming\transformation\cocaine_en_poudre\action_transformer_cocaine.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Transformation Cuivre") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Transformer Cuivre", "menu\cuivremenu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Transf Heroine") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Processus Héroine", "menu\heroinpromenu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Transf Serpent") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Transformer Serpent", "divers\farming\transformation\serpent_en_venin\menu_transformer_serpent_en_venin.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Transformation Or") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Transformation Or", "menu\ormenu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Mission Marine") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Obtenir Une Mission Marine", "divers\offres_d_emplois\metiers_pour_missions\mission_fond_marin\mission_fond_marin.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Assurance Vehicule") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Assurer Mon Véhicule", "divers\assurance_des_vehicules\menu_assurance_des_vehicules.sqf", 0, 10, "driver assignedVehicle player == player"] spawn _creer_addaction_sfp; if (driver assignedVehicle player == player) then  {titleText ["Tu peux assurer ton véhicule avec le menu déroulant","PLAIN"];};};
			if (_son_nom == " Hack Informatique") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Hack Informatique", "divers\hack_informatique\menu_hack_informatique.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Vendre Petrole") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Vendre Petrole", "menu\oilmenu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Carrosserie !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Menu Carrosserie", "divers\repeindre_voiture\carrossier\menu_repeindre_la_voiture_carrossier.sqf", 0, 10, "(cursortarget isKindOf 'landvehicle' or cursorTarget isKindOf 'air') && player distance cursorTarget < 6"] spawn _creer_addaction_sfp;};
			if (_son_nom == " Formation Laboratoire") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Formation Pour Le Laboratoire", "divers\farming\transformation\cocaine_en_poudre\action_license_cocaine.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Calcul !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Faire Des Mathématiques", "divers\offres_d_emplois\metiers_pour_missions\calcul_mathematique\initialisation_calcul_mathematique.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Marche") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Vendre Au Marché", "menu\nouveau_menu_vendre_au_marche\menu_marche_farming.sqf", "1", 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Saut Parachute") then {[_position_de_depart, _distance_pour_rescan_addaction, player, (format ["Sauter En Parachute (%1 Euros)", sfp_config_prix_saut_parachute]), "divers\saut_parachute\atm_airdrop.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Transf Poissons Pane") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Transformer Poissons Pané", "menu\transformationpoissonsmenu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == "Karting") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Menu Karting", "menu\karting_menu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Fond Gendarmerie") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Fond Gendarmerie", "divers\gendarmerie\compte_de_la_gendarmerie\menu_argent_gendarmerie.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Gendarmerie !") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Menu Stagiaire Gendarmerie", "divers\gendarmerie\menu_stagiaire\menu_stagiaire_gendarmerie.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Transf petrole") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Transformation du Petrole", "menu\oilpromenu.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			if (_son_nom == " Licences Drogues") then {[_position_de_depart, _distance_pour_rescan_addaction, player, "Formation Drogue", "menu\dialogtransformationdrogue.sqf", 0, 10, ""] spawn _creer_addaction_sfp;};
			
			// Farming
			_liste_des_farming = [" Poissons Chalutier"," Cocaine"," Truffes"," Organes Animaux"," Medicaments"," Cannabis"," Pommes De Terre"," Sel"," Pommes"," Requin"," Cuivre"," Heroine"," Baleine"," Bois"," Petrole"," Poissons"," Or"];
			if (_son_nom in _liste_des_farming) then 
			{
				_choix_dans_le_tableau = nil;			
				if (_son_nom == " Or") then {_choix_dans_le_tableau = 15;};
				if (_son_nom == " Truffes") then {_choix_dans_le_tableau = 23;};
				if (_son_nom == " Poissons") then {_choix_dans_le_tableau = 19;};
				if (_son_nom == " Petrole") then {_choix_dans_le_tableau = 17;};
				if (_son_nom == " Bois") then {_choix_dans_le_tableau = 11;};
				if (_son_nom == " Baleine") then {_choix_dans_le_tableau = 0;};
				if (_son_nom == " Heroine") then {_choix_dans_le_tableau = 5;};
				if (_son_nom == " Cuivre") then {_choix_dans_le_tableau = 12;};
				if (_son_nom == " Requin") then {_choix_dans_le_tableau = 10;};
				if (_son_nom == " Pommes") then {_choix_dans_le_tableau = 21;};
				if (_son_nom == " Sel") then {_choix_dans_le_tableau = 22;};
				if (_son_nom == " Pommes De Terre") then {_choix_dans_le_tableau = 20;};
				if (_son_nom == " Cannabis") then {_choix_dans_le_tableau = 1;};
				if (_son_nom == " Medicaments") then {_choix_dans_le_tableau = 7;};
				if (_son_nom == " Organes Animaux") then {_choix_dans_le_tableau = 8;};
				if (_son_nom == " Cocaine") then {_choix_dans_le_tableau = 3;};
				if (_son_nom == " Poissons Chalutier") then {_choix_dans_le_tableau = 45;};
				
				if (!isnil "_choix_dans_le_tableau") then
				{
					_nom_farming = listes_des_farming_avec_parametre select _choix_dans_le_tableau select 0;
					_nom_variable = listes_des_farming_avec_parametre select _choix_dans_le_tableau select 1;
					_place_dans_l_inventaire = listes_des_farming_avec_parametre select _choix_dans_le_tableau select 2;
					_combien_on_en_recolte = listes_des_farming_avec_parametre select _choix_dans_le_tableau select 3;
					_temps_farming = listes_des_farming_avec_parametre select _choix_dans_le_tableau select 4;
					_params = []; {_params pushback _x;} foreach [_temps_farming , _place_dans_l_inventaire, _combien_on_en_recolte, format ["Vous allez collecter %1 %2 ...", _combien_on_en_recolte, _nom_farming], format["Vous avez collecté %1 %2.",_combien_on_en_recolte, _nom_farming], _nom_variable];
					
					[_position_de_depart, _distance_pour_rescan_addaction, player, format ["<t color=""#ff0000"">" + "Collecter %1 %2 ...", _combien_on_en_recolte, _nom_farming], "divers\farming\commencer_collecte.sqf", _params, 10, "isnil {player getvariable 'je_collecte'}"] spawn _creer_addaction_sfp;
				};
			};
		};			
	} foreach listes_des_marqueurs_sur_la_carte_sfp;
	
	waituntil {sleep 0.02; (vehicle player) distance _position_de_depart > _distance_pour_rescan_addaction};
	waituntil {sleep 0.02; alive player;};	
};

