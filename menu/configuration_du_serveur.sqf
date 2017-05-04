// =======================================================================================================================================================================================
											// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
											  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_description_config_sfp";

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Dialogue_Menu_Config_Du_Serveur";

createDialog _nom_du_menu;
disableSerialization;

_heure_redemarrage_calcul =
{
	private "_virgule";
	_heure_redemarrage = "";
	_virgule = "";
	_nombre_de_redemarrage = (count sfp_config_choix_heure_redemarrage - 1);
	for "_i" from 0 to (count sfp_config_choix_heure_redemarrage - 1) do 
	{
		if (_i != _nombre_de_redemarrage) then
		{
			_virgule = " , ";
		}else
		{
			_virgule = "";
		};
		_heure_redemarrage = _heure_redemarrage + (format ["%1 heures%2", sfp_config_choix_heure_redemarrage select _i, _virgule]);
	};
	_heure_redemarrage
};

_description_config_sfp = 
[
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	" ADMINISTRATEUR/MODERATEUR/MJ",
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	format ["Debug serveur = %1.", debug_mission_pour_dev],
	"",
	
	format ["Nombre d'admins = %1.", count sfp_config_liste_admin],
	format ["Nombre de modérateurs = %1.", count sfp_config_liste_moderateur],
	format ["Nombre de maitre du jeu = %1.", count sfp_config_liste_des_mj],
	"",
	
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	" CREDIT SFP ET PROGRAMMATION ARGENT",
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	format ["Nombre minutes de jeu minimum pour obtenir un crédit = %1 minutes.", sfp_config_credit_autorisation_minutes_de_jeu],
	format ["Montant maximum d'emprunt = %1 Euros.", (sfp_config_reglage_credit_sfp select 0) call retour_formatage_chiffre_sfp],
	format ["Temps d'attente entre les prélévements = %1 Secondes.", sfp_config_reglage_credit_sfp select 1],
	format ["Nombre de mensualités maximum = %1.", sfp_config_reglage_credit_sfp select 2],
	"",
	
	format ["Etat de l'impot sur salaire = %1.", sfp_config_activer_impots select 0],
	format ["Pourcentage du montant sur salaire = %1.", sfp_config_activer_impots select 1],
	format ["Temps d'attente entre les prélévements = %1 secondes.", sfp_config_activer_impots select 2],
	"",
	
	format ["Argent de départ en banque = %1 €.", (sfp_config_montant_de_depart_banque) call retour_formatage_chiffre_sfp],
	format ["Argent de départ en poche = %1 €.", (sfp_config_montant_de_depart_poche) call retour_formatage_chiffre_sfp],
	"",
	
	format ["Montant max du livret A = %1 €.", (sfp_config_montant_max_livret_A) call retour_formatage_chiffre_sfp],
	format ["Interet du livret A = %1 pourcents.", sfp_config_montant_interet_livret_A],
	"",
	
	format ["Salaire SARL Auto Ecole = %1 €.", (sfp_config_salaire_sarl_auto_ecole) call retour_formatage_chiffre_sfp],
	format ["Salaire SARL Avocat = %1 €.", (sfp_config_salaire_sarl_avocat) call retour_formatage_chiffre_sfp],
	format ["Salaire SARL Car Shop = %1 €.", (sfp_config_salaire_sarl_car_shop) call retour_formatage_chiffre_sfp],
	format ["Salaire SARL Depannage = %1 €.", (sfp_config_salaire_sarl_depannage) call retour_formatage_chiffre_sfp],
	format ["Salaire SARL NeoMédia = %1 €.", (sfp_config_salaire_sarl_neomedia) call retour_formatage_chiffre_sfp],
	format ["Salaire SARL Pompiers = %1 €.", (sfp_config_salaire_sarl_pompier) call retour_formatage_chiffre_sfp],
	format ["Salaire SARL Taxi G7 = %1 €.", (sfp_config_salaire_sarl_taxi_g7) call retour_formatage_chiffre_sfp],
	"",
	
	format ["Pourcentage des amendes envoyées au coffre fort de la gendarmerie = %1 pourcents.", sfp_config_pourcentage_amende_coffre_gendarmerie],
	format ["Pourcentage des amendes envoyées aux gendarmes = %1 pourcents.", sfp_config_pourcentage_envoye_aux_gendarmer],
	"",
	
	format ["Montant max du gain au loto = %1 €.", (sfp_config_montant_recompense_max_loto) call retour_formatage_chiffre_sfp],
	format ["Montant max du gain a l'euromillion = %1 €.", (sfp_config_montant_recompense_max_euromillion) call retour_formatage_chiffre_sfp],
	format ["Montant max du gain de la statue trouvés = %1 €.", (sfp_config_montant_recompense_statut_a_trouver) call retour_formatage_chiffre_sfp],
	"",

	format ["Montant gain max du trésor = %1 €.", (sfp_config_tresor_montant_argent_gagne) call retour_formatage_chiffre_sfp],
	format ["Temps MAX entre chaque recherche de trésor = %1 minutes.", round (sfp_config_tresor_temps / 60)],
	format ["Type de trésor à rechercher = %1.", getText ( configFile >> "cfgVehicles" >> sfp_config_tresor_type >> "displayName")],
	"",

	format ["Tarif de la transformation de l'héroine = %1 €.", (sfp_config_prix_transformation_heroine) call retour_formatage_chiffre_sfp],
	format ["Tarif de la transformation du pétrole = %1 €.", (sfp_config_prix_transformation_petrole) call retour_formatage_chiffre_sfp],
	format ["Tarif de la transformation du cannabis = %1 €.", (sfp_config_prix_transformation_cannabis) call retour_formatage_chiffre_sfp],
	"",
	
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	" CONFIGURATION EXTRA VEHICULES",
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	format ["Liste des véhicules interdit de plaques = %1.", count sfp_config_listes_des_vehicules_interdit_de_plaques],
	"",
	format ["Nombre de véhicules max sur la carte pour les civils = %1.", sfp_config_nombre_de_vehicule_max_par_joueur_sorties_civil],
	format ["Nombre de véhicules max sur la carte pour la SARL Altis && Furious = %1.", sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_altis_and_furious],
	format ["Nombre de véhicules max sur la carte pour la SARL Car Shop = %1.", sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_carshop],
	format ["Nombre de véhicules max sur la carte pour la SARL Neomedia = %1.", sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_neomedia],
	"",
	format ["Pourcentage max du remboursement des véhicules par l'assurance = %1 pourcent.", sfp_config_pourcentage_remboursement_max_assurance_sfp],
	format ["Base de calcul pour le prix de l'assurance des véhicules = %1 pourcents.", sfp_config_pourcentage_pour_calcul_prix_assurance_sfp],
	"",
	format ["Base de calcul pour le tarif du ferry = %1 pourcents.", sfp_config_prix_du_ferry],
	format ["Base de calcul pour le temps de traverse du ferry = %1.", sfp_config_temps_traverse_du_ferry],
	format ["Nombre de destinations pour le ferry = %1.", count sfp_config_position_du_ferry_sfp],
	"",
	
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	" CONFIGURATION DES MAISONS",
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	format ["Nombre d'objets décorations des maisons = %1.", count sfp_config_listes_objects_decorateurs],
	format ["Nombre de types de maisons achetables = %1.", count sfp_config_listes_des_maisons_achetable],
	format ["Nombre de types de maisons cambriolables = %1.", count sfp_config_listes_des_maisons_cambriolables],
	"",
	format ["Activation d'achats des maisons = %1.", sfp_config_autoriser_achat_maison],
	format ["Activation des décorations des maisons = %1.", sfp_config_autoriser_pose_objets_decoration],
	format ["Activation des cambriolages des maisons = %1.", sfp_config_autoriser_cambriolages_maisons],
	"",
	
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	" CONFIGURATION DU REVIVE",
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	format ["Activation du revive = %1.", sfp_config_revive_activation],
	format ["Activation achever blesse = %1.", sfp_config_revive_acheve_joueur],
	format ["Activation trainer blesse = %1.", sfp_config_revive_trainer_blesse],
	format ["Activation tas de billet lors d'une mort = %1.", sfp_config_revive_tas_billet],
	format ["Nombres de chances sur cette valeur de ne pas pouvoir revive = %1.", sfp_config_revive_pas_de_chance],
	format ["Nombres de soins pour un kit de soins = %1.", sfp_config_nombre_de_soins_par_kit_de_soins],
	"",
	format ["Secondes pour pouvoir revive après avoir contacter les secours = %1.", revive_temps_respawn_autoriser_apres_contact_urgence],
	format ["Nombres max de medecins sur l'ile pour revive entre joueurs = %1.", revive_nombre_max_de_medecin_pour_revive_entre_joueur],
	"",
	format ["Temps minimum avant de pouvoir respawn = %1.", revive_temps_minimum_respawn],
	format ["Temps maximum du revive avant respawn forcé = %1.", revive_temps_maximum_respawn],
	"",
	format ["Distance de vue de l'icone revive sur l'environnement 3D = %1.", revive_icone_max_vu_distance],
	format ["Taille de l'icone 3D sur l'environnement 3D = %1.", revive_icone_taille],
	"",
	format ["Argent perdu lorsque vous repartez sur une nouvelle vie = %1.", tarif_menu_revive select 0],
	format ["Argent gagné lorsque vous appelez les pompiers = %1.", tarif_menu_revive select 1],
	"",
	
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	" CONFIGURATION DIVERS",
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	format ["Langue du jeu autorisée à ce connecter = %1.", sfp_config_language_du_jeu_autorise],
	format ["Choix du mode de redémarrage = %1.", sfp_config_choix_redemarrage],
	format ["heure des redémarrage = %1.", [] call _heure_redemarrage_calcul],
	"",
	format ["Regénération de votre santé = %1.", sfp_config_activer_regeneration_de_sante],
	format ["Protection des sacs à dos = %1.", sfp_config_activer_protection_sac_a_dos],
	format ["Possibilité de revente des voitures volés = %1.", sfp_config_activer_revente_voitures_voles],
	format ["Possibilité de retaper les numéros de séries des voitures volés = %1.", sfp_config_activer_retaper_numero_de_serie],
	format ["Travailleurs aux noirs achetables = %1.", sfp_config_activer_travailleur_au_noir],
	format ["Etat de la soif = %1.", sfp_config_activer_soif],
	format ["Etat de la faim = %1.", sfp_config_activer_faim],
	format ["Etat du besoin de dormir = %1.", sfp_config_activer_dormir],
	format ["Etat du besoin d'aller au toilette = %1.", sfp_config_activer_toilette],
	format ["Script client pour optimisation = %1.", sfp_config_activer_optimisation_client],
	format ["Etat des GoFasts = %1.", sfp_config_activer_go_fast],
	format ["Flaque de sang lors de tir = %1.", sfp_config_activer_sang_lors_de_tir],
	format ["Effet des grenades fumigènes = %1.", sfp_config_activer_effet_grenade_fumigene],
	format ["Afficher le nom des joueurs au dessus de la tête = %1.", sfp_config_activer_nom_des_joueurs_en_jeu],
	format ["Afficher le nom des joueurs dans les véhicules = %1.", sfp_config_afficher_nom_joueurs_dans_vehicules],
	format ["Achat des coffres forts = %1.", sfp_config_activer_achat_coffre_fort],
	format ["Marqueurs des gendarmes entres eux = %1.", sfp_config_activer_marqueur_gendarmes],
	format ["Sons dynamiques nature etc en jeu = %1.", sfp_config_activer_son_en_jeu],
	format ["Activation des braquages de stations services = %1.", sfp_config_activer_braquage_station_service],
	format ["Minutes de jeu minimum pour pouvoir taper un joueur = %1.", sfp_config_minutes_de_jeu_pour_taper],
	format ["Nombre de carkill max autorisé = %1.", sfp_config_nombre_carkill_autorise],
	"",
	format ["Nombre max d'antenne SFP Télécom = %1.", sfp_config_nombre_max_antennes_telecom],
	format ["Nombre de forfait SFP Télécom = %1.", count sfp_config_liste_des_forfaits_telecoms],
	"",
	format ["Vitesse de base du personnage = %1.", sfp_config_vitesse_du_personnage],
	format ["Vitesse de stabilisé du viseur = %1.", sfp_config_vitesse_stabilite_du_viseur],
	format ["Nombre de niveau de force centre de sport = %1.", count sfp_config_choix_niveau_de_force],
	"",
	format ["Nombre d'ATM affichés = %1.", count sfp_config_liste_position_des_atm_affiches],
	"",
	format ["Nombre de choix de spawn civils = %1.", count sfp_config_choix_position_civils],
	format ["Nombre de choix de spawn gendarmes = %1.", count sfp_config_choix_position_gendarmes],
	"",
	format ["Nombre d'armes d'autorisation d'effet de balle (caméra) = %1.", count sfp_config_armes_autorisation_effet],
	"",
	format ["Nombre d'animation possible à jouer = %1.", count sfp_config_listes_des_animations_sfp],
	"",
	
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	" CONFIGURATION SCRIPTS SERVEUR",
	"----------------------------------------------------------------------------------------------------------------------------------------------------------",
	format ["Activation des météorites = %1.", sfp_config_activer_meteorite],
	format ["Activation patrouille de france = %1.", sfp_config_activer_patrouille_de_france],
	format ["Activation tremblement de terre = %1.", sfp_config_activer_tremblement_de_terre],
	format ["Activation simulation de grue de chantier = %1.", sfp_config_activer_simulation_grue_maison_construction],
	format ["Activation objet récompense = %1.", sfp_config_activer_objet_recompense],
	format ["Activation véhicules de vie = %1.", sfp_config_activer_vehicules_de_vie],
	format ["Activation véhicules offerts = %1.", sfp_config_activer_vehicules_offert],
	format ["Activation étoiles filantes = %1.", sfp_config_activer_etoiles_filantes],
	format ["Activation feux d'artifices = %1.", sfp_config_activer_feux_artifices],
	format ["Activation des trésors = %1.", sfp_config_activer_les_tresors],
	format ["Activation des coffres d'armes = %1.", sfp_config_activer_coffre_armes]
];

_ecriture_de_la_config = "";
_valeur_en_vert = [" CONFIGURATION SCRIPTS SERVEUR", " CONFIGURATION DIVERS"," CONFIGURATION DU REVIVE"," CONFIGURATION DES MAISONS"," ADMINISTRATEUR/MODERATEUR/MJ"," CREDIT SFP ET PROGRAMMATION ARGENT"," CONFIGURATION EXTRA VEHICULES","----------------------------------------------------------------------------------------------------------------------------------------------------------"];
for "_i" from 0 to (count _description_config_sfp - 1) do
{
	lbAdd [1500, format ["%1",_description_config_sfp select _i]];
	
	if (_description_config_sfp select _i in _valeur_en_vert) then
	{
		lbSetColor [1500, _i, [0,0.91,0.07,1]];	
	};	
};

waituntil {!dialog;};
cutText["","BLACK IN"];
