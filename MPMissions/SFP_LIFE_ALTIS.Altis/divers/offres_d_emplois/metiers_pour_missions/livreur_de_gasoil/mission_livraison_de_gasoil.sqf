// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (player getvariable "license_permis_de_conduire_by_sfp_maxou" < 1) exitwith {hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Désolé, \n\n vous devez avoir un permis pour faire cette mission ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (player getvariable "usedspace" > 0) exitwith {hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Désolé, \n\n vous devez avoir votre espace utilisé vide pour eviter aux joueurs de ce servir des véhicules pour farmer !! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil "mission_livreur_gasoil_by_maxou") then {mission_livreur_gasoil_by_maxou = 0;};
if (mission_livreur_gasoil_by_maxou >= 1) exitwith {hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Impossible, \n\n tu es déja entrain de faire ce boulot ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
mission_livreur_gasoil_by_maxou = 1;

if (player distance (getmarkerpos "spawnvehiculedegasoil_un") < 50) then {carspawn = getMarkerPos "spawnvehiculedegasoil_un";};
if (player distance (getmarkerpos "spawnvehiculedegasoil_deux") < 50) then {carspawn = getMarkerPos "spawnvehiculedegasoil_deux";};


// ====================================================== INITIALISATION ============================================================== //

trouver_une_station_gasoil = 
{
	while {isnil "j_ai_trouver_une_station"} do
	{
		sleep 0.01;
		_position_max = 40000;
		_position_une_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_position_deux_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_pos = [_position_une_random,_position_deux_random,0];
		_chercher = nearestObjects [_pos, ["Land_fs_roof_F","Land_FuelStation_02_pump_F","Land_FuelStation_01_pump_F","Land_fs_feed_F"], 3000];
		j_ai_trouver_une_station = _chercher select 0;
	};
};

creer_point_sur_la_carte_gasoil = 
{
	createMarkerLocal ["marker_mission_livraison_gasoil", (getPosATL j_ai_trouver_une_station)];
	"marker_mission_livraison_gasoil" setMarkerShapeLocal "ICON";
	"marker_mission_livraison_gasoil" setMarkerColorLocal "ColorYellow";
	"marker_mission_livraison_gasoil" setMarkerSizeLocal [2,2];
	"marker_mission_livraison_gasoil" setMarkerTypeLocal "hd_dot";
	"marker_mission_livraison_gasoil" setMarkerTextLocal "Livrer le gasoil ici !";
	j_ai_creer_un_point_sur_la_carte = 1;
};

achat_du_vehicule_gasoil = 
{
	while {count (nearestObjects [carspawn, ["Car","Ship","Air"], 5]) > 0} do
	{
		sleep 2;
		titletext ["\n\n\n\n\n Spawn impossible, un véhicule est dans la zone du spawn !","PLAIN",1];
	};
	vehicule_de_livraison = createVehicle ["C_Van_01_fuel_F", carspawn, [], 0, "NONE"];
	
	_le_vehicule = vehicule_de_livraison;
	le_vehicule_a_surveiller_pour_supprimer = vehicule_de_livraison; sleep 0.45; publicvariable "le_vehicule_a_surveiller_pour_supprimer";
	[_le_vehicule,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

	_numero_de_plaque = [] call compil_plaque_immatriculation;
	[vehicule_de_livraison,["Vehicule de refuel"],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
	hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n La station à bien été trouvé ! \n\n Un véhicule à spawn derrière toi ainsi qu'un point de livraison à été créé sur ta carte ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	vehicule_gasoil_creer = 1;
	sleep 2;
	vehicule_de_livraison lock false;
};

demarrer_timer_et_mission_by_maxou_gasoil = 
{
	revenir_sur_ma_position_apres_termine = getPosATL player;
	
	while {temps_livraison_gasoil_by_maxou > 0 && alive player && alive vehicule_de_livraison} do
	{
		temps_livraison_gasoil_by_maxou = temps_livraison_gasoil_by_maxou - 2;
		sleep 2;
		
		// Quand pas sur place
		if (player distance j_ai_trouver_une_station > 5 && vehicle player != player && speed (vehicle player) > 1) then
		{
			if (player distance j_ai_trouver_une_station > 1000) then 
			{
				calcul_distance = (round ((player distance j_ai_trouver_une_station) / 1000));
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à la pompe : %2 Kms. \n Quantité à livrer : %3 Litres.",round (temps_livraison_gasoil_by_maxou / 60),calcul_distance,round (litre_a_livrer_gasoil_by_maxou)],"PLAIN",1];
			}else
			{
				calcul_distance = (round (player distance j_ai_trouver_une_station));
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à la pompe : %2 Mètres. \n Quantité à livrer : %3 Litres.",round (temps_livraison_gasoil_by_maxou / 60),calcul_distance,round (litre_a_livrer_gasoil_by_maxou)],"PLAIN",1];
			};
		};
		
		// Quand arrivé sur place
		if (player distance j_ai_trouver_une_station < 10) then
		{
			hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Tu es bien arrivé au bon endroit ! \n\n Le gasoil va maintenant être déversé dans la cuve automatiquement ! \n\n Ne bouge plus avec le véhicule ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
			while {litre_a_livrer_gasoil_by_maxou > 0 && alive player && alive vehicule_de_livraison} do
			{
				sleep 1;
				if (vehicle player != player) then
				{
					if (speed (vehicle player) < 0.5) then
					{
						if (player distance j_ai_trouver_une_station < 5) then
						{
							if (typeof (vehicle player) == "C_Van_01_fuel_F") then
							{							
								litre_a_livrer_gasoil_by_maxou = round (litre_a_livrer_gasoil_by_maxou - 28);
								if (litre_a_livrer_gasoil_by_maxou <= 0) then
								{
									// pour finir script
									temps_livraison_gasoil_by_maxou = 0;
									litre_a_livrer_gasoil_by_maxou = 0;
								};
								titletext [format ["\n\n\n\n ! LIVREUR GASOIL ! \n --------------------------------------------------------------- \n\n Encore %1 litres à verser dans la cuve !",litre_a_livrer_gasoil_by_maxou],"PLAIN",1];
							}else
							{
								titletext ["\n\n\n\n ! LIVREUR GASOIL ! \n --------------------------------------------------------------- \n\n Désolé, tu n'es pas dans ton véhicule de livraison !","PLAIN",1];
							};
						}else
						{
							titletext ["\n\n\n\n ! LIVREUR GASOIL ! \n --------------------------------------------------------------- \n\n Tu es trop loin de la cuve, rapproche toi en !","PLAIN",1];
						};
					}else
					{
						titletext ["\n\n\n\n ! LIVREUR GASOIL ! \n --------------------------------------------------------------- \n\n Le véhicule doit être à l'arret pour remplir la cuve !","PLAIN",1];
					};
				}else
				{
					titletext ["\n\n\n\n ! LIVREUR GASOIL ! \n --------------------------------------------------------------- \n\n Remonte dans le véhicule pour remplir la cuve !","PLAIN",1];
				};
			};
		};
	};
	
	deletemarkerlocal "marker_mission_livraison_gasoil";

	if (!alive player) then 
	{
		if (alive vehicule_de_livraison) then {deletevehicle vehicule_de_livraison;};
		waituntil {alive player};
		hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Fin de la livraison de carburant ! \n\n Tu n'as malheureusement pas réussi à livrer le carburant car tu es mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
	if (!alive vehicule_de_livraison) then
	{
		hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Fin de la livraison de carburant ! \n\n Tu n'as malheureusement pas réussi à livrer le carburant car le véhicule de livraison est HS ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
	if (litre_a_livrer_gasoil_by_maxou > 0 && temps_livraison_gasoil_by_maxou <= 0 && alive player && alive vehicule_de_livraison) then 
	{
		hint "! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Fin de la livraison de carburant ! \n\n Tu n'as malheureusement pas réussi à livrer le carburant dans le temps imparti ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";		
		jai_le_droit_de_me_tp = 1;
		player setPosATL revenir_sur_ma_position_apres_termine;
		if (alive vehicule_de_livraison) then {deletevehicle vehicule_de_livraison;};
	};
	if (litre_a_livrer_gasoil_by_maxou < 1 && temps_livraison_gasoil_by_maxou <= 0 && alive player && alive vehicule_de_livraison) then 
	{
		hint format ["! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Fin de la livraison de carburant ! \n\n Merci à toi tu as donc remporté %1 Euros ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (argent_gagne_livraison_gasoil_by_maxou)];
		player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + argent_gagne_livraison_gasoil_by_maxou,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		jai_le_droit_de_me_tp = 1;
		player setPosATL revenir_sur_ma_position_apres_termine;
		if (alive vehicule_de_livraison) then {deletevehicle vehicule_de_livraison;};
	};
	
	[player,["0","1"]] spawn supprimer_inventaire_farming_etc;
	
	waituntil {alive player};
	waituntil {isnil {player getvariable "besoin_d_un_revive_news"}};
	sleep 3;
	
	connaitre_temps_restant = nil; 
	demarrer_timer_et_mission_by_maxou_gasoil = nil; 
	temps_livraison_gasoil_by_maxou = nil; 
	mission_livreur_gasoil_by_maxou = nil;
	nombre_de_journaux_prix_total = nil;
	explication_livreur_by_maxou = nil;
	argent_gagne_livraison_gasoil_by_maxou = nil;
	achat_du_vehicule_gasoil = nil;
	revenir_sur_ma_position_apres_termine = nil;
	trouver_une_station_gasoil = nil;
	nom_secteur_mission_gasoil_by_maxou = nil;
	nom_secteur_mission_gasoil_pour_marker_by_maxou = nil;
	j_ai_trouver_une_station = nil;
	vehicule_de_livraison = nil;
	creer_point_sur_la_carte_gasoil = nil;
	j_ai_creer_un_point_sur_la_carte = nil;
	vehicule_gasoil_creer = nil;
	litre_a_livrer_gasoil_by_maxou = nil;
	calcul_distance = nil;
};

argent_gagne_livraison_gasoil_by_maxou = round (400 + (random 200));
temps_livraison_gasoil_by_maxou = round (900 + (random 900)); 
litre_a_livrer_gasoil_by_maxou = (1600 + (random 4000));
// =========================================================== ACTION ============================================================== //

_nombre_de_relance = 5; 
while {_nombre_de_relance > 0} do 
{
	_nombre_de_relance = _nombre_de_relance - 1; 
	hintsilent format ["! LIVREUR DE GASOIL ! \n -------------------------------------------- \n \n Bienvenu en tant que livreur de GASOIL ;) \n\n Pour cette mission, grace au véhicule de fioul (qui va spawn derrière toi), tu devras livrer la station service indiquée sur la carte grace au point jaune. \n\n Tu as %1 minutes pour terminer cette livraison ! \n\n Ce petit boulot te fera gagner %2 Euros pour %3 litres livrés ! \n\n Bon courage ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (temps_livraison_gasoil_by_maxou / 60),round (argent_gagne_livraison_gasoil_by_maxou),round (litre_a_livrer_gasoil_by_maxou)]; 
	sleep 2;
};

for [{_i = 20},{_i >= 0},{_i= _i - 1}] do
{
	hintsilent format ["! LIVREUR GASOIL ! \n -------------------------------------------- \n\n Nous avons bien prit en compte votre demande. \n\n Nous allons intérroger les stations demandant du gasoil ! \n\n Patiente, cela peut être très rapide comme un peu plus long ;) \n\n Démarrage de la recherche dans %1 Secondes ... \n\n ! ATTENTION ! Sache que ton farming sera reinitialisé à la fin de la livraison ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", _i];	
	sleep 1;
};

sleep 3;
[] call trouver_une_station_gasoil;
waituntil {!isnil "j_ai_trouver_une_station"};
[] call creer_point_sur_la_carte_gasoil;
waituntil {!isnil "j_ai_creer_un_point_sur_la_carte"};
[] call achat_du_vehicule_gasoil;
waituntil {!isnil "vehicule_gasoil_creer"};
[] call demarrer_timer_et_mission_by_maxou_gasoil;
