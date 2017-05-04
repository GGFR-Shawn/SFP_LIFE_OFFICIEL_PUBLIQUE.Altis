// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

le_vehicule_a_tunner_by_maxou = cursortarget;
if (isnil "le_vehicule_a_tunner_by_maxou") exitwith {hint "Erreur, recommence ...";};
if (revive_mon_side != civilian) exitwith {hint "Opération impossible, il n'y à que les civils qui y sont autorisés ...";};
if (isnil {le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable"}) exitwith {hint "Opération impossible, ce n'est pas ton véhicule ...";};
if (le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "Opération impossible, ce n'est pas ton véhicule ...";};
if (count crew le_vehicule_a_tunner_by_maxou > 0) exitwith {hint "Opération impossible, des joueurs sont dans le véhicule ...";};

vehicule_tuning_j_ai_appliquer_la_valeur_sfp = nil;
tuning_calcul_du_poid_pour_appliquer = nil;
tuning_poids_origine_du_vehicule = getMass le_vehicule_a_tunner_by_maxou;
if (!isnil {le_vehicule_a_tunner_by_maxou getvariable "voiture_possede_un_nouveau_poids"}) then
{
	if (count (le_vehicule_a_tunner_by_maxou getvariable "voiture_possede_un_nouveau_poids") >= 2) then
	{
		tuning_poids_origine_du_vehicule = le_vehicule_a_tunner_by_maxou getvariable "voiture_possede_un_nouveau_poids" select 0;
	};
};


cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

closedialog 0;

_nom_du_menu = "Menu_Voitures_Tuning_Poid_Du_Vehicule";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_numero_add = 1011;

{sliderSetSpeed [_x, 10, 10];} foreach [1900];
sliderSetPosition [1900, 0];
sliderSetRange  [1900, -500, 500];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetText format ["Personnalisation du poids de votre %1.", getText ( configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "displayName")];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetTextColor _couleur_rouge;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1010) ctrlSetTextColor _couleur_verte;

// Informations du véhicule
_proprietaire = le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable" select 0;
if (_proprietaire == "") then {_proprietaire = "Inconnu";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format["Propriétaire du véhicule : %1.", _proprietaire];

_vitesse = getnumber (configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "maxSpeed"); 
if (_vitesse < 1) then {_vitesse = "??";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format["Vitesse max du véhicule : %1 Km/h.", _vitesse];

_place = (1 + getnumber (configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "transportSoldier")); 
if (_place < 2) then {_place = "??";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format["Place du véhicule : %1.", _place];

_latence_boite = (getnumber (configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "latency") * 10) / 2; 
if (_latence_boite < 1) then {_latence_boite = "??";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format["Latence boite du véhicule : %1.", _latence_boite];

_resistance_feu = getnumber (configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "armor"); 
if (_resistance_feu < 1) then {_resistance_feu = "??";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format["Resistance au feu du véhicule : %1.", _resistance_feu];

_niveau_frein = round (getnumber (configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "Wheels" >> "LF" >> "maxBrakeTorque") / 100); 
if (_niveau_frein < 1) then {_niveau_frein = "??";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format ["Frein du véhicule : %1.", _niveau_frein];

_gasoil_actuel = fuel le_vehicule_a_tunner_by_maxou;
if (isnil "_gasoil_actuel") then {_gasoil_actuel = 1;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format ["Gasoil du véhicule : %1 %2.", _gasoil_actuel * 100, "%"];

_degat_actuel = damage le_vehicule_a_tunner_by_maxou;
if (isnil "_degat_actuel") then {_degat_actuel = 1;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format ["Dégat du véhicule : %1 %2.", _degat_actuel * 100, "%"];

_poid_origine = tuning_poids_origine_du_vehicule;
if (_poid_origine < 1) then {_poid_origine = "??";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format ["Poids original du véhicule : %1 KiloSFP.", _poid_origine];

_poid_actuel = getMass le_vehicule_a_tunner_by_maxou;
if (_poid_actuel < 1) then {_poid_actuel = "??";};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) lbAdd format ["Poids actuel du véhicule : %1 KiloSFP.", _poid_actuel];

waituntil {!dialog;};
cutText["","BLACK IN"];	

if (isnil "tuning_calcul_du_poid_pour_appliquer") exitwith {hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Votre véhicule %1 n'a pas subit de modification puisque le curseur n'a pas bougé. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "displayName")];			};
if (isnil "vehicule_tuning_j_ai_appliquer_la_valeur_sfp") exitwith {hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Votre véhicule %1 n'a pas subit de modification. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "displayName")];		};

_prix_a_payer = abs (round (tuning_calcul_poid_a_changer * 11));

hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Votre véhicule %1 à maintenant un poids de %2 KiloSFP. \n\n Vous avez payé %3 %4. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "displayName"), tuning_calcul_du_poid_pour_appliquer, _prix_a_payer, "€"];	

player setvariable ["mon_argent_banque_by_sfp_maxou",((player getvariable "mon_argent_banque_by_sfp_maxou") - (_prix_a_payer)),true];
