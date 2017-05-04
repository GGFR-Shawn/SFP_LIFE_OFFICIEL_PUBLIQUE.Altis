// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (player getvariable "license_permis_de_conduire_by_sfp_maxou" < 1) exitwith {hint "! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Désolé, \n\n vous devez avoir un permis pour faire cette mission ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (player getvariable "usedspace" > 0) exitwith {hint "! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Désolé, \n\n vous devez avoir votre espace utilisé vide pour eviter aux joueurs de ce servir des véhicules pour farmer !! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil "mission_livreur_marchandise_by_maxou") then {mission_livreur_marchandise_by_maxou = 0;};
if (mission_livreur_marchandise_by_maxou >= 1) exitwith {hint "! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Impossible, \n\n tu es déja entrain de faire ce boulot ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
mission_livreur_marchandise_by_maxou = 1;

if (player distance (getmarkerpos "livraison_marchandise_un") < 100) then {carspawn = getMarkerPos "livraison_marchandise_un";};
if (player distance (getmarkerpos "livraison_marchandise_deux") < 100) then {carspawn = getMarkerPos "livraison_marchandise_deux";};
if (player distance (getmarkerpos "livraison_marchandise_trois") < 100) then {carspawn = getMarkerPos "livraison_marchandise_trois";};
if (player distance (getmarkerpos "livraison_marchandise_quatre") < 100) then {carspawn = getMarkerPos "livraison_marchandise_quatre";};


// ====================================================== INITIALISATION ============================================================== //
reinitialiser_variable_marchandises =
{
	waituntil {alive player};
	waituntil {isnil {player getvariable "besoin_d_un_revive_news"}};

	if (alive vehicule_de_marchandises) then {deletevehicle vehicule_de_marchandises;};
	if (alive objet_a_charger) then {deletevehicle objet_a_charger;};
	if (alive pointeur_objet_a_charger) then {deletevehicle pointeur_objet_a_charger;};
	deletemarkerlocal "marker_mission_livraison_marchandise_usine";
	deletemarkerlocal "marker_mission_livraison_marchandise_depot";
	
	[player,["0","1"]] spawn supprimer_inventaire_farming_etc;
	
	sleep 5;
	demarrer_timer_et_mission_by_maxou_marchandises = nil; 
	temps_livraison_marchandises_by_maxou = nil; 
	mission_livreur_marchandise_by_maxou = nil;
	argent_gagne_dechargement_marchandises_by_maxou = nil;
	achat_du_vehicule_marchandises = nil;
	revenir_sur_ma_position_apres_termine = nil;
	trouver_une_usine_marchandise_sfp = nil;
	trouver_un_depot_marchandises_sfp = nil;
	j_ai_trouver_une_usine = nil;
	j_ai_trouver_un_depot = nil;
	j_ai_creer_objet_a_charger = nil;
	vehicule_de_marchandises = nil;
	creer_point_sur_la_carte_usine_marchandises = nil;
	creer_point_sur_la_carte_depot_marchandises = nil;
	j_ai_creer_un_point_sur_la_carte_usine = nil;
	j_ai_creer_un_point_sur_la_carte_depot = nil;
	vehicule_marchandise_creer = nil;
	objet_a_livrer_marchandises_by_maxou = nil;
	calcul_distance = nil;
	objet_a_charger = nil;
	position_attacher = nil;
	pointeur_objet_a_charger = nil;
	direction_de_l_objet_a_charger = nil;
	menu_charger_objet = nil;
	information_finit_de_charger = nil;
	je_demarre_la_mission_niveau = nil;
	temps_dechargement_marchandises_by_maxou = nil;
	marker_mission_livraison_marchandise_depot = nil;
	marker_mission_livraison_marchandise_usine = nil;
};

trouver_une_usine_marchandise_sfp = 
{
	while {isnil "j_ai_trouver_une_usine"} do
	{
		sleep 0.01;
		_position_max = 40000;
		_position_une_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_position_deux_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_pos = [_position_une_random,_position_deux_random,0];
		_chercher = nearestObjects [_pos, ["Land_i_Shed_Ind_F"], 3000];
		j_ai_trouver_une_usine = _chercher select 0;
	};
};

trouver_un_depot_marchandises_sfp = 
{
	while {isnil "j_ai_trouver_un_depot"} do
	{
		sleep 0.01;
		_position_max = 40000;
		_position_une_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_position_deux_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_pos = [_position_une_random,_position_deux_random,0];
		_chercher = nearestObjects [_pos, ["Land_dp_smallFactory_F","Land_i_Shed_Ind_F"], 3000];
		if (!isnil "_chercher") then
		{
			if ((_chercher select 0) distance j_ai_trouver_une_usine > 1100) then
			{
				j_ai_trouver_un_depot = _chercher select 0;
			};
		};
	};
};

creer_objet_a_charger_marchandises = 
{
	_random_max_autour_de_l_usine = 60;
	_position_random_objet = [(getPosATL j_ai_trouver_une_usine select 0) + (random _random_max_autour_de_l_usine), (getPosATL j_ai_trouver_une_usine select 1) + (random _random_max_autour_de_l_usine),0];
	_check_rien_autour = nearestObjects [_position_random_objet, [], 2];
	_check_rien_autour_deux = _check_rien_autour select 0;
	
	while {!isnil "_check_rien_autour_deux"} do
	{
		0.01;
		_position_random_objet = [(getPosATL j_ai_trouver_une_usine select 0) + (random _random_max_autour_de_l_usine), (getPosATL j_ai_trouver_une_usine select 1) + (random _random_max_autour_de_l_usine),0];
		_check_rien_autour = nearestObjects [_position_random_objet, [], 2];
		_check_rien_autour_deux = _check_rien_autour select 0;
	};
	
	objet_a_charger = createVehicle [objet_a_livrer_marchandises_by_maxou, _position_random_objet, [], 0, "NONE"];
	objet_a_charger setvariable ["objet_pour_charger_camion_marchandise",1,false];
	j_ai_creer_objet_a_charger = 1;
	
	pointeur_objet_a_charger = createVehicle ["Sign_Arrow_Large_Yellow_F", getPosATL objet_a_charger, [], 0, "CAN_COLLIDE"];	
	pointeur_objet_a_charger setPosATL [(getPosATL pointeur_objet_a_charger select 0),(getPosATL pointeur_objet_a_charger select 1),(getPosATL pointeur_objet_a_charger select 2) + 2];
	pointeur_objet_a_charger attachTo [objet_a_charger,[0,0,2]]; 
};

creer_point_sur_la_carte_usine_marchandises = 
{
	createMarkerLocal ["marker_mission_livraison_marchandise_usine", (getPosATL objet_a_charger)];
	"marker_mission_livraison_marchandise_usine" setMarkerShapeLocal "ICON";
	"marker_mission_livraison_marchandise_usine" setMarkerColorLocal "ColorYellow";
	"marker_mission_livraison_marchandise_usine" setMarkerSizeLocal [2,2];
	"marker_mission_livraison_marchandise_usine" setMarkerTypeLocal "hd_dot";
	"marker_mission_livraison_marchandise_usine" setMarkerTextLocal "Chercher La Marchandise ICI !";
	j_ai_creer_un_point_sur_la_carte_usine = 1;
};

creer_point_sur_la_carte_depot_marchandises = 
{
	createMarkerLocal ["marker_mission_livraison_marchandise_depot", (getPosATL j_ai_trouver_un_depot)];
	"marker_mission_livraison_marchandise_depot" setMarkerShapeLocal "ICON";
	"marker_mission_livraison_marchandise_depot" setMarkerColorLocal "ColorYellow";
	"marker_mission_livraison_marchandise_depot" setMarkerSizeLocal [2,2];
	"marker_mission_livraison_marchandise_depot" setMarkerTypeLocal "hd_dot";
	"marker_mission_livraison_marchandise_depot" setMarkerTextLocal "Livrer La Marchandise ICI !";
	j_ai_creer_un_point_sur_la_carte_depot = 1;
};

charger_objet_dans_vehicule_marchandises =
{
	if !(alive vehicule_de_marchandises) exitwith {hint "Opération impossible, le véhicule est HS !";};

	while {cursortarget getvariable "vehicule_info_parvariable" select 0 != "Vehicule de marchandise"} do
	{
		titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Pointe maintenant ta souris sur le véhicule ou charger l'objet (%1).", getText ( configFile >> "CfgVehicles" >> objet_a_livrer_marchandises_by_maxou >> "displayName")],"PLAIN",1];
		sleep 1;
	};
	
	while {isnil "position_attacher"} do
	{
		direction_de_l_objet_a_charger = (getdir vehicule_de_marchandises);
		if (objet_a_livrer_marchandises_by_maxou == "Land_Coil_F") then {position_attacher = [0,-2,0.9];};
		if (objet_a_livrer_marchandises_by_maxou == "Land_WoodenBox_F") then {position_attacher = [0,-2,-0.62]; direction_de_l_objet_a_charger = direction_de_l_objet_a_charger - 90;};
		if (objet_a_livrer_marchandises_by_maxou == "Land_Water_source_F") then {position_attacher = [0,-2,0.9]; direction_de_l_objet_a_charger = direction_de_l_objet_a_charger - 90;};
		if (objet_a_livrer_marchandises_by_maxou == "Land_ConcretePipe_F") then {position_attacher = [0,-1.85,0.5];};
		sleep 0.01;
	};
	
	objet_a_charger attachTo [vehicule_de_marchandises, position_attacher];
	sleep 1;	
	objet_a_charger setdir direction_de_l_objet_a_charger;
	if (!isnil "pointeur_objet_a_charger") then {deletevehicle pointeur_objet_a_charger;};
	
	je_demarre_la_mission_niveau = 1;
	
	player removeaction menu_charger_objet;
};

achat_du_vehicule_marchandises = 
{
	while {count (nearestObjects [carspawn, ["Car","Ship","Air"], 5]) > 0} do
	{
		sleep 2;
		titletext ["\n\n\n\n\n Spawn impossible, un véhicule est dans la zone du spawn !","PLAIN",1];
	};
	vehicule_de_marchandises = createVehicle ["C_Van_01_transport_F", carspawn, [], 0, "NONE"];
	
	_le_vehicule = vehicule_de_marchandises;
	le_vehicule_a_surveiller_pour_supprimer = vehicule_de_marchandises; sleep 0.45; publicvariable "le_vehicule_a_surveiller_pour_supprimer";
	[_le_vehicule,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
	
	_numero_de_plaque = [] call compil_plaque_immatriculation;
	[vehicule_de_marchandises,["Vehicule de marchandise"],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
	vehicule_marchandise_creer = 1;
	hint "! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Une usine à bien été trouvée ! \n\n Un véhicule à spawn derrière toi ainsi qu'un point de chargement/déchargement à été créé sur ta carte ! \n\n L'objet à charger est indiqué par une flèche jaune à l'usine. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	menu_charger_objet = player addaction ["<t color=""#ff0000"">" + "Charger l'objet sur le véhicule",charger_objet_dans_vehicule_marchandises,[],12,true,true,"","player distance cursortarget < 5 && !isnil {cursortarget getvariable 'objet_pour_charger_camion_marchandise'}"];
	
	sleep 2;
	vehicule_de_marchandises lock false;
};

demarrer_timer_et_mission_by_maxou_marchandises = 
{
	revenir_sur_ma_position_apres_termine = getPosATL player;
	
	je_demarre_la_mission_niveau = 0;
	
	while {temps_dechargement_marchandises_by_maxou > 0 && temps_livraison_marchandises_by_maxou > 0 && alive player && alive vehicule_de_marchandises && alive objet_a_charger} do
	{
		temps_livraison_marchandises_by_maxou = round (temps_livraison_marchandises_by_maxou - 2);
		sleep 2;
		
		if (je_demarre_la_mission_niveau == 0) then
		{
			if (player distance objet_a_charger > 5 && vehicle player != player && speed (vehicle player) > 1) then
			{
				if (player distance objet_a_charger > 1000) then 
				{
					calcul_distance = (round ((player distance objet_a_charger) / 1000));
					titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à l'usine : %2 Kms. \n Objet à charger : %3.",round (temps_livraison_marchandises_by_maxou / 60),calcul_distance, getText ( configFile >> "CfgVehicles" >> objet_a_livrer_marchandises_by_maxou >> "displayName")],"PLAIN",1];
				}else
				{
					calcul_distance = (round (player distance objet_a_charger));
					titletext [format ["\n\n\n\n\n\n\n Charge maintenant l'objet dans le véhicule en pointant ta souris dessus ... \n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à l'usine : %2 Mètres. \n Objet à charger : %3.",round (temps_livraison_marchandises_by_maxou / 60),calcul_distance, getText ( configFile >> "CfgVehicles" >> objet_a_livrer_marchandises_by_maxou >> "displayName")],"PLAIN",1];
				};
			};
		};
		
		if (je_demarre_la_mission_niveau == 1) then
		{
			if (isnil "information_finit_de_charger") then 
			{
				information_finit_de_charger = 1;
				titletext ["\n\n\n\n\n\n\n Chargement terminé ! \n Rends toi maintenant à l'entrepot","PLAIN",1];
				sleep 2;
			};
			
			if (player distance j_ai_trouver_un_depot > 30 && vehicle player != player && speed (vehicle player) > 1) then
			{
				if (player distance j_ai_trouver_un_depot > 1000) then 
				{
					calcul_distance = (round ((player distance j_ai_trouver_un_depot) / 1000));
					titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à l'entrepot : %2 Kms. \n Objet à décharger : %3.",round (temps_livraison_marchandises_by_maxou / 60),calcul_distance, getText ( configFile >> "CfgVehicles" >> objet_a_livrer_marchandises_by_maxou >> "displayName")],"PLAIN",1];
				}else
				{
					if (player distance j_ai_trouver_un_depot > 30) then
					{
						calcul_distance = (round (player distance j_ai_trouver_un_depot));
						titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à l'entrepot : %2 Mètres. \n Objet à décharger : %3.",round (temps_livraison_marchandises_by_maxou / 60),calcul_distance, getText ( configFile >> "CfgVehicles" >> objet_a_livrer_marchandises_by_maxou >> "displayName")],"PLAIN",1];
					};
				};
			};
			
			if (player distance j_ai_trouver_un_depot <= 30) then
			{
				je_demarre_la_mission_niveau = 2;
			};
		};
		
		if (je_demarre_la_mission_niveau == 2) then
		{
			hint format ["! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Tu es bien arrivé au bon endroit ! \n\n La marchandise va être déchargé automatiquement après un délai de %1 secondes ! \n\n Ne bouge plus avec le véhicule ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",temps_dechargement_marchandises_by_maxou];
			
			_random_choix_cafe = [1,2] call BIS_fnc_selectRandom;
			_temps_attente_cafe = round (6 + (random 20));
			
			while {temps_dechargement_marchandises_by_maxou > 0 && temps_livraison_marchandises_by_maxou > 0 && alive player && alive vehicule_de_marchandises} do
			{
				if (_random_choix_cafe >= 2) then
				{
					while {_temps_attente_cafe > 0 && alive player && alive vehicule_de_marchandises} do
					{
						_temps_attente_cafe = round (_temps_attente_cafe - 1);
						titletext ["\n\n\n\n ! LIVREUR MARCHANDISE ! \n --------------------------------------------------------------- \n\n L'employé qui s'occupe du déchargement boit le café ... \n Il arrive d'ici peu !","PLAIN",1];
					};
				};
					
				sleep 1;
				if (vehicle player != player) then
				{
					if (speed (vehicle player) < 0.5) then
					{
						if (player distance j_ai_trouver_un_depot < 20) then
						{
							if (typeof (vehicle player) == "C_Van_01_transport_F") then
							{					
								temps_dechargement_marchandises_by_maxou = round (temps_dechargement_marchandises_by_maxou - 1);
								temps_livraison_marchandises_by_maxou = round (temps_livraison_marchandises_by_maxou - 1);
								if (temps_dechargement_marchandises_by_maxou <= 0 or temps_livraison_marchandises_by_maxou <= 0) then
								{
									temps_livraison_marchandises_by_maxou = 0;
									temps_dechargement_marchandises_by_maxou = 0;
									if (alive objet_a_charger) then {deletevehicle objet_a_charger;};
								};
								titletext [format ["\n\n\n\n ! LIVREUR MARCHANDISE ! \n --------------------------------------------------------------- \n\n Encore %1 secondes pour finir de décharger la marchandise !",temps_dechargement_marchandises_by_maxou],"PLAIN",1];
							}else
							{
								titletext ["\n\n\n\n ! LIVREUR MARCHANDISE ! \n --------------------------------------------------------------- \n\n Désolé, tu n'es pas dans ton véhicule de marchandise !","PLAIN",1];
							};
						}else
						{
							titletext ["\n\n\n\n ! LIVREUR MARCHANDISE ! \n --------------------------------------------------------------- \n\n Tu es trop loin de l'entrepot, rapproche toi en !","PLAIN",1];
						};
					}else
					{
						titletext ["\n\n\n\n ! LIVREUR MARCHANDISE ! \n --------------------------------------------------------------- \n\n Le véhicule doit être à l'arret pour décharger la marchandise !","PLAIN",1];
					};
				}else
				{
					titletext ["\n\n\n\n ! LIVREUR MARCHANDISE ! \n --------------------------------------------------------------- \n\n Remonte dans le véhicule pour decharger la marchandise !","PLAIN",1];
				};
			};
		};
	};
	
	if (!alive player) exitwith 
	{
		if (alive vehicule_de_marchandises) then {deletevehicle vehicule_de_marchandises;};
		waituntil {alive player};
		waituntil {isnil {player getvariable "besoin_d_un_revive_news"}};
		sleep 3;
		hint "! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Fin de la livraison de marchandise ! \n\n Tu n'as malheureusement pas réussi à livrer la marchandise car tu es mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		[] call reinitialiser_variable_marchandises;	
	};
	if (!alive vehicule_de_marchandises) then
	{
		jai_le_droit_de_me_tp = 1;
		player setPosATL revenir_sur_ma_position_apres_termine;
		hint "! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Fin de la livraison de marchandise ! \n\n Tu n'as malheureusement pas réussi à livrer la marchandise car le véhicule de livraison est HS ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		[] call reinitialiser_variable_marchandises;	
	};
	if (temps_dechargement_marchandises_by_maxou > 0 && alive player && alive vehicule_de_marchandises) then 
	{
		jai_le_droit_de_me_tp = 1;
		player setPosATL revenir_sur_ma_position_apres_termine;
		hint "! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Fin de la livraison de marchandise ! \n\n Tu n'as malheureusement pas réussi à livrer la marchandise dans le temps imparti ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";		
		[] call reinitialiser_variable_marchandises;	
	};
	if (temps_dechargement_marchandises_by_maxou < 1 && alive player && alive vehicule_de_marchandises) then 
	{
		hint format ["! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Fin de la livraison de marchandise ! \n\n Merci à toi tu as donc remporté %1 Euros ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (argent_gagne_dechargement_marchandises_by_maxou)];
		player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + argent_gagne_dechargement_marchandises_by_maxou,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		jai_le_droit_de_me_tp = 1;
		player setPosATL revenir_sur_ma_position_apres_termine;
		sleep 1;
		[] call reinitialiser_variable_marchandises;	
	};
};

temps_dechargement_marchandises_by_maxou = round (20 + (random 30));
argent_gagne_dechargement_marchandises_by_maxou = round (100 + (random 300));
temps_livraison_marchandises_by_maxou = round (1000 + (random 900)); 
objet_a_livrer_marchandises_by_maxou = ["Land_Water_source_F", "Land_Coil_F", "Land_ConcretePipe_F", "Land_WoodenBox_F"] call BIS_fnc_selectRandom;
// =========================================================== ACTION ============================================================== //

_nombre_de_relance = 5; 
while {_nombre_de_relance > 0} do 
{
	_nombre_de_relance = _nombre_de_relance - 1; 
	hintsilent format ["! LIVREUR DE MARCHANDISE ! \n -------------------------------------------- \n \n Bienvenu en tant que livreur de MARCHANDISE ;) \n\n Pour cette mission, grace au véhicule de transport (qui va spawn derrière toi), tu devras aller chercher la marchandise à l'usine indiquée sur la carte grace au point jaune et d'aller le livrer à l'endroit livraison indiquée en jaune également. \n\n Tu as %1 minutes pour terminer cette livraison ! \n\n Ce petit boulot te fera gagner %2 Euros pour la livraison de type %3 ! \n\n Bon courage ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (temps_livraison_marchandises_by_maxou / 60),round (argent_gagne_dechargement_marchandises_by_maxou), getText ( configFile >> "CfgVehicles" >> objet_a_livrer_marchandises_by_maxou >> "displayName")]; 
	sleep 2;
};

for [{_i = 10},{_i >= 0},{_i= _i - 1}] do
{
	hintsilent format ["! LIVREUR MARCHANDISE ! \n -------------------------------------------- \n\n Nous avons bien prit en compte votre demande. \n\n Nous allons intérroger les usines qui demandent un transport ! \n\n Patiente, cela peut être très rapide comme un peu plus long ;) \n\n Démarrage de la recherche dans %1 Secondes ... \n\n ! ATTENTION ! Sache que ton farming sera reinitialisé à la fin de la livraison ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", _i];	
	sleep 1;
};

[] call trouver_une_usine_marchandise_sfp;
waituntil {!isnil "j_ai_trouver_une_usine"};
[] call trouver_un_depot_marchandises_sfp;
waituntil {!isnil "j_ai_trouver_un_depot"};
[] call creer_objet_a_charger_marchandises;
waituntil {!isnil "j_ai_creer_objet_a_charger"};
[] call creer_point_sur_la_carte_usine_marchandises;
waituntil {!isnil "j_ai_creer_un_point_sur_la_carte_usine"};
[] call creer_point_sur_la_carte_depot_marchandises;
waituntil {!isnil "j_ai_creer_un_point_sur_la_carte_depot"};
[] call achat_du_vehicule_marchandises;
waituntil {!isnil "vehicule_marchandise_creer"};
[] call demarrer_timer_et_mission_by_maxou_marchandises;
