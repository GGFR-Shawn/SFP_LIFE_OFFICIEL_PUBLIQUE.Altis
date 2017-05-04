// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (isnil {player getvariable "licence_bateau_news"}) exitwith {hint "Désolé, vous devez avoir une license de bateau pour faire cette mission !";};
if (isnil "mission_fond_marin_by_maxou") then {mission_fond_marin_by_maxou = 0;};
if (mission_fond_marin_by_maxou >= 1) exitwith {hint "Impossible, tu es déja entrain de faire cette mission !";};
mission_fond_marin_by_maxou = 1;

if (player distance (markerpos "mission_fond_marin_une") < 10) then {carspawn = getMarkerPos "spawn_vehicule_mission_marine_une";};
if (player distance (markerpos "mission_fond_marin_deux") < 10) then {carspawn = getMarkerPos "spawn_vehicule_mission_marine_deux";};
if (player distance (markerpos "mission_fond_marin_trois") < 10) then {carspawn = getMarkerPos "spawn_vehicule_mission_marine_trois";};
if (player distance (markerpos "mission_fond_marin_quatre") < 10) then {carspawn = getMarkerPos "spawn_vehicule_mission_marine_quatre";};


// ====================================================== INITIALISATION ============================================================== //
trouver_un_point_mission_fond_marin = 
{
	while {isnil "mon_point_d_eau_trouve_mission_fond_marin"} do
	{
		sleep 0.01;
		_position_max = 3500;
		_position_une_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_position_deux_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_pos = [(getPosATL player select 0) + (_position_une_random), (getPosATL player select 1) + (_position_deux_random),0];
		if (((player distance _pos) > 800) && (surfaceIsWater _pos)) then
		{
			mon_point_d_eau_trouve_mission_fond_marin = _pos;
		};
	};
};

condition_addaction_missions_fond_marin = 
{
	_condition = false;
	{
		if (!isnil {_x getvariable "je_suis_l_objet_fond_marin"}) then
		{
			_condition = true;
		};
	} foreach (nearestObjects [getPosATL player, [], 10]);
	
	_condition;
};

detruire_objet_fouille_marine =
{
	_temps_attente_avant_destruction = round (4 + (random 6));
	[_temps_attente_avant_destruction] call bar_de_progression_by_maxou;
	
	fin_de_mission_fouille_fond_marin = 1;
	
	{
		if (!isnil {_x getvariable "je_suis_l_objet_fond_marin"}) then
		{
			deletevehicle _x;
		};
	} foreach (nearestObjects [getPosATL player, [], 6]);
};

creer_point_sur_la_carte_mission_fond_marin = 
{
	createMarkerLocal ["marker_mission_fond_marin", (mon_point_d_eau_trouve_mission_fond_marin)];
	"marker_mission_fond_marin" setMarkerShapeLocal "ICON";
	"marker_mission_fond_marin" setMarkerColorLocal "ColorYellow";
	"marker_mission_fond_marin" setMarkerSizeLocal [2,2];
	"marker_mission_fond_marin" setMarkerTypeLocal "hd_dot";
	"marker_mission_fond_marin" setMarkerTextLocal "Fouille marine ici !";
	j_ai_creer_un_point_sur_la_carte_mission_fond_marin = 1;
};

creer_un_objet_fond_sous_marin =
{
	_choix_objet_fond_marin = ["Land_BucketNavy_F","Land_DrillAku_F","Land_Portable_generator_F","Land_HumanSkull_F","Land_HumanSkeleton_F","Land_Sleeping_bag_folded_F","Land_Pillow_F","Land_Ground_sheet_folded_blue_F","Land_Ground_sheet_folded_OPFOR_F","Land_Ground_sheet_folded_F"] call bis_fnc_selectrandom;
	_position_proximite = [(mon_point_d_eau_trouve_mission_fond_marin select 0) + (random 20),(mon_point_d_eau_trouve_mission_fond_marin select 1) + (random 20),0];
	
	objet_mission_fond_marine = createVehicle [_choix_objet_fond_marin, _position_proximite, [], 0, 'CAN_COLLIDE'];
	objet_mission_fond_marine setvariable ["je_suis_l_objet_fond_marin",1,false];
	
	sleep 1;
	if (isnil "objet_mission_fond_marine") exitwith {[] call creer_un_objet_fond_sous_marin;};
	
	waitUntil {sleep 2; speed objet_mission_fond_marine <= 0.01};
	objet_mission_fond_marine_deux = createVehicle ["Sign_Arrow_Large_Yellow_F", _position_proximite, [], 0, "CAN_COLLIDE"];	
	objet_mission_fond_marine_deux setvariable ["je_suis_l_objet_fond_marin",1,false];
	objet_mission_fond_marine_deux setPosATL [(getPosATL objet_mission_fond_marine_deux select 0),(getPosATL objet_mission_fond_marine_deux select 1),(getPosATL objet_mission_fond_marine_deux select 2) + 2];
	sleep 1;
	objet_mission_fond_marine_trois = createVehicle ["Sign_Arrow_Large_Yellow_F", _position_proximite, [], 0, "CAN_COLLIDE"];	
	objet_mission_fond_marine_trois setvariable ["je_suis_l_objet_fond_marin",1,false];
	objet_mission_fond_marine_trois setPosATL [(getPosATL objet_mission_fond_marine_trois select 0),(getPosATL objet_mission_fond_marine_trois select 1),(getPosATL objet_mission_fond_marine_trois select 2) + 4];
	sleep 1;
	objet_mission_fond_marine_quatre = createVehicle ["Sign_Arrow_Large_Yellow_F", _position_proximite, [], 0, "CAN_COLLIDE"];	
	objet_mission_fond_marine_quatre setvariable ["je_suis_l_objet_fond_marin",1,false];
	objet_mission_fond_marine_quatre setPosATL [(getPosATL objet_mission_fond_marine_quatre select 0),(getPosATL objet_mission_fond_marine_quatre select 1),(getPosATL objet_mission_fond_marine_quatre select 2) + 6];
		
	j_ai_creer_un_objet_fond_sous_marin = 1;
};

achat_du_vehicule_mission_fond_marin = 
{
	while {count (nearestObjects [carspawn, ["Car","Ship","Air"], 5]) > 0} do
	{
		sleep 2;
		titletext ["\n\n\n\n\n Spawn impossible, un véhicule est dans la zone du spawn !","PLAIN",1];
	};
	vehicule_fond_marin = createVehicle ["C_Rubberboat", carspawn, [], 0, "NONE"];
	vehicule_fond_marin setdir 160;
	
	_le_vehicule = vehicule_fond_marin;
	le_vehicule_a_surveiller_pour_supprimer = vehicule_fond_marin; sleep 0.45; publicvariable "le_vehicule_a_surveiller_pour_supprimer";
	[_le_vehicule,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

	_numero_de_plaque = [] call compil_plaque_immatriculation;
	[vehicule_fond_marin,["Bateau mission marine"],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
	hint "! MISSION FOND MARIN ! \n -------------------------------------------- \n\n Le point de fouille à bien été trouvée ! \n Un bateau à spawn derrière toi ainsi qu'un point de recherche (pour les fouilles) à été créé sur ta carte ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	vehicule_mission_fond_marin_creer = 1;
	sleep 2;
	vehicule_fond_marin lock false;
};

demarrer_timer_et_mission_fond_marin_by_maxou = 
{
	revenir_sur_ma_position_apres_termine = getPosATL player;
	
	while {temps_fouille_fond_marin_by_maxou > 0 && alive player && alive vehicule_fond_marin && isnil "fin_de_mission_fouille_fond_marin"} do
	{		
		while {vehicle player == player && alive player && alive vehicule_fond_marin && player distance mon_point_d_eau_trouve_mission_fond_marin > 100} do 
		{
			titletext ["Monte dans le bateau qui à spawn pour faire la mission.","PLAIN"];
			sleep 2;
		};
		
		// Quand pas sur place
		if (player distance mon_point_d_eau_trouve_mission_fond_marin > 30 && vehicle player != player && speed (vehicle player) > 1) then
		{
			if (player distance mon_point_d_eau_trouve_mission_fond_marin > 1000) then 
			{
				calcul_distance = (round ((player distance mon_point_d_eau_trouve_mission_fond_marin) / 1000));
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante fouille : %1 Minutes \n Distance jusqu'àu point de fouille : %2 Kms.",round (temps_fouille_fond_marin_by_maxou / 60),calcul_distance],"PLAIN",1];
			}else
			{
				calcul_distance = (round (player distance mon_point_d_eau_trouve_mission_fond_marin));
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante fouille : %1 Minutes \n Distance jusqu'àu point de fouille : %2 Mètres.",round (temps_fouille_fond_marin_by_maxou / 60),calcul_distance],"PLAIN",1];
			};
		};
		
		// Quand arrivé sur place
		if (player distance mon_point_d_eau_trouve_mission_fond_marin < 30) then
		{
			if (isnil "information_arrive_sur_place_mission_fond_marin") then {information_arrive_sur_place_mission_fond_marin = 1; hint "! MISSION FOND MARIN ! \n -------------------------------------------- \n\n Tu es bien arrivé au bon endroit ! \n\n Plonge maintenant pour rechercher l'objet recherché ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
			titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante fouille : %1 Minutes.",round (temps_fouille_fond_marin_by_maxou / 60)],"PLAIN",1];
		};
		
		temps_fouille_fond_marin_by_maxou = temps_fouille_fond_marin_by_maxou - 2;
		sleep 2;
	};
	
	deletemarkerlocal "marker_mission_fond_marin";
	if (!isnil "objet_mission_fond_marine") then {deletevehicle objet_mission_fond_marine;};
	if (!isnil "objet_mission_fond_marine_deux") then {deletevehicle objet_mission_fond_marine_deux;};
	if (!isnil "objet_mission_fond_marine_trois") then {deletevehicle objet_mission_fond_marine_trois;};
	if (!isnil "objet_mission_fond_marine_quatre") then {deletevehicle objet_mission_fond_marine_quatre;};

	if (!alive player) then 
	{
		if (alive vehicule_fond_marin) then {deletevehicle vehicule_fond_marin;};
		waituntil {alive player};
		hint "! MISSION FOND MARIN ! \n -------------------------------------------- \n\n Fin de la fouille marine ! \n\n Tu n'as malheureusement pas réussi à trouver l'objet recherché car tu es mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
	if (!alive vehicule_fond_marin) then
	{
		hint "! MISSION FOND MARIN ! \n -------------------------------------------- \n\n Fin de la fouille marine ! \n\n Tu n'as malheureusement pas réussi à trouver l'objet recherché car le bateau est HS ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
	if (temps_fouille_fond_marin_by_maxou <= 0 && alive player && alive vehicule_fond_marin) then 
	{
		hint "! MISSION FOND MARIN ! \n -------------------------------------------- \n\n Fin de la fouille marine ! \n\n Tu n'as malheureusement pas réussi à trouver l'objet recherché dans le temps imparti ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";		
		jai_le_droit_de_me_tp = 1;
		player setPosATL revenir_sur_ma_position_apres_termine;
		if (alive vehicule_fond_marin) then {deletevehicle vehicule_fond_marin;};
	};
	if (!isnil "fin_de_mission_fouille_fond_marin" && alive player && alive vehicule_fond_marin) then 
	{
		hint format ["! MISSION FOND MARIN ! \n -------------------------------------------- \n\n Fin de la fouille marine ! \n\n Merci à toi tu as donc remporté %1 Euros ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (argent_gagne_mission_fond_marin_by_maxou)];
		player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + argent_gagne_mission_fond_marin_by_maxou,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		jai_le_droit_de_me_tp = 1;
		player setPosATL revenir_sur_ma_position_apres_termine;
		if (alive vehicule_fond_marin) then {deletevehicle vehicule_fond_marin;};
	};
		
	waituntil {alive player};
	waituntil {isnil {player getvariable "besoin_d_un_revive_news"}};
	sleep 3;
	
	connaitre_temps_restant = nil; 
	demarrer_timer_et_mission_fond_marin_by_maxou = nil; 
	temps_fouille_fond_marin_by_maxou = nil; 
	argent_gagne_mission_fond_marin_by_maxou = nil;
	achat_du_vehicule_mission_fond_marin = nil;
	revenir_sur_ma_position_apres_termine = nil;
	trouver_un_point_mission_fond_marin = nil;
	nom_secteur_mission_gasoil_by_maxou = nil;
	mon_point_d_eau_trouve_mission_fond_marin = nil;
	j_ai_creer_un_objet_fond_sous_marin = nil;
	vehicule_fond_marin = nil;
	creer_point_sur_la_carte_mission_fond_marin = nil;
	j_ai_creer_un_point_sur_la_carte_mission_fond_marin = nil;
	vehicule_mission_fond_marin_creer = nil;
	calcul_distance = nil;
	information_arrive_sur_place_mission_fond_marin = nil;
	condition_addaction_missions_fond_marin = nil;
	fin_de_mission_fouille_fond_marin = nil;
	player removeaction addaction_mission_fouille_marine;
	mission_fond_marin_by_maxou = nil;
};

argent_gagne_mission_fond_marin_by_maxou = round (700 + (random 500));
temps_fouille_fond_marin_by_maxou = round (600 + (random 600)); 
// =========================================================== ACTION ============================================================== //

_nombre_de_relance = 5; 
while {_nombre_de_relance > 0} do 
{
	_nombre_de_relance = _nombre_de_relance - 1; 
	hintsilent format ["! MISSION FOND MARIN ! \n -------------------------------------------- \n \n Bienvenu à la mission de fouille marine ;) \n\n Pour cette mission, grace au bateau (qui va spawn derrière toi), tu devras aller rechercher un objet indiqué par une flèche jaune au fond de la mer indiqué également en jaune sur ta carte. \n\n Tu as %1 minutes pour terminer cette fouille ! \n\n Ce petit boulot te fera gagner %2 Euros ! \n\n Bon courage ;) \n\n PS : Il est préférable d'avoir une tenue de plongée ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (temps_fouille_fond_marin_by_maxou / 60),round (argent_gagne_mission_fond_marin_by_maxou)]; 
	sleep 3;
};

hint "! MISSION FOND MARIN ! \n -------------------------------------------- \n\n Nous avons bien prit en compte votre demande. \n\n Nous recherchons un endroit pour executer des fouilles sous marine ! \n\n Patiente, cela peut être très rapide comme un peu plus long ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";	
sleep 3;

[] call trouver_un_point_mission_fond_marin;
waituntil {!isnil "mon_point_d_eau_trouve_mission_fond_marin"};
[] call creer_point_sur_la_carte_mission_fond_marin;
waituntil {!isnil "j_ai_creer_un_point_sur_la_carte_mission_fond_marin"};
[] call creer_un_objet_fond_sous_marin;
waituntil {!isnil "j_ai_creer_un_objet_fond_sous_marin"};
[] call achat_du_vehicule_mission_fond_marin;
waituntil {!isnil "vehicule_mission_fond_marin_creer"};
addaction_mission_fouille_marine = player addaction ["<t color=""#ff0000"">" + "Prendre l'objet fouille marine", detruire_objet_fouille_marine, [], 20, true, true, "", "[] call condition_addaction_missions_fond_marin"];
[] call demarrer_timer_et_mission_fond_marin_by_maxou;
