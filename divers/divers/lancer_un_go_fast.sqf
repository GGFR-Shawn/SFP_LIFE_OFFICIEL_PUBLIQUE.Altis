//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


// =========================================================== SECURITE ============================================================== //
if (!sfp_config_activer_go_fast) exitwith {hint "Désolé, les GoFast sont désactivés sur ce serveur ...";};
if !(isnil "temps_de_dechargement_go_fast_by_maxou") exitwith {hint "Patiente, reinitialisation des variables en cours ...";};
if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
if (revive_mon_side != civilian) exitwith {hint "Impossible, seul les civils peuvent faire cette action !";};

_nombredeflic = 0;
{if (side _x == west && alive _x) then {_nombredeflic = _nombredeflic + 1;};} foreach playableUnits;
if (_nombredeflic < 3) exitwith {hint "Désolé, il n'y a pas assez de flic sur le serveur pour creer un GoFast, il en faut au moins 3 !";}; 

_check_autour = nearestObjects [player, ["Car","Ship","Air"], 20];
if (count _check_autour < 1) exitwith {titletext ["\n\n\n\n\n Vous ne pouvez pas déclencher un GoFast puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};
if ((_check_autour select 0) getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {titletext ["\n\n\n\n\n Vous ne pouvez pas déclencher un GoFast puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};

if (isnil "je_peux_demarre_un_go_fast") then {je_peux_demarre_un_go_fast = 0;};
if (je_peux_demarre_un_go_fast >= 1) exitwith {hintsilent "! GO FAST ! \n -------------------------------------------- \n \n Opération impossible ! \n Un GoFast est déja en cours ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

je_peux_demarre_un_go_fast = 1;
publicvariable "je_peux_demarre_un_go_fast";
publicvariable "je_peux_demarre_un_go_fast_headless";

// ========================================================= INITILISATION ============================================================== //
reinitialiser_variable_go_fast =
{
	waituntil {alive player};
	waituntil {isnil {player getvariable "besoin_d_un_revive_news"}};
	
	[] spawn {sleep 10; temps_de_dechargement_go_fast_by_maxou = nil;};
	
	deletemarkerlocal "marker_mission_livraison_drogue";
	marker_mission_livraison_drogue = nil;
	trouver_un_endroit_de_livraison_go_fast = nil;
	creer_point_sur_la_carte_drogue_go_fast = nil;
	demarrer_timer_et_mission_by_maxou_go_fast = nil;
	temps_livraison_go_fast_by_maxou = nil;
	argent_gagne_go_fast_by_maxou = nil;
	quantite_a_livrer_go_fast_by_maxou = nil;
	j_ai_trouver_un_endroit_de_livraison = nil;
	j_ai_creer_un_point_sur_la_carte_drogue_go_fast = nil;
	creer_marker_suivi_go_fast = nil;
	
	[] call supprimer_marker_suivi_go_fast;
	sleep 1;
	supprimer_marker_suivi_go_fast = nil;
};

creer_marker_suivi_go_fast = 
{
	createMarker ["marker_mission_livraison_drogue_position_go_fast", (getPosATL player)];
	"marker_mission_livraison_drogue_position_go_fast" setMarkerShape "ICON";
	"marker_mission_livraison_drogue_position_go_fast" setMarkerColor "ColorRed";
	"marker_mission_livraison_drogue_position_go_fast" setMarkerSize [3,3];
	"marker_mission_livraison_drogue_position_go_fast" setMarkerType "hd_dot";
	"marker_mission_livraison_drogue_position_go_fast" setMarkerText "Position GoFast !";
	
	while {isnil {player getvariable "joueur_menotte"} && temps_de_dechargement_go_fast_by_maxou > 0 && temps_livraison_go_fast_by_maxou > 0 && alive player && player distance j_ai_trouver_un_endroit_de_livraison > 30} do
	{
		sleep (10 + (random 10));
		"marker_mission_livraison_drogue_position_go_fast" setMarkerPos (getPosATL player);
	};
	
	deletemarker "marker_mission_livraison_drogue_position_go_fast";
};

supprimer_marker_suivi_go_fast = 
{
	deletemarker "marker_mission_livraison_drogue_position_go_fast";
};

trouver_un_endroit_de_livraison_go_fast = 
{
	while {isnil "j_ai_trouver_un_endroit_de_livraison"} do
	{
		sleep 0.01;
		_position_max = 40000;
		_position_une_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_position_deux_random = [(random _position_max), (random -_position_max)] call BIS_fnc_selectRandom;
		_pos = [_position_une_random,_position_deux_random,0];
		_chercher = nearestObjects [_pos, ["House"], 500];
		if (!isnil "_chercher") then
		{
			if ((_chercher select 0) distance player > 5000) then
			{
				j_ai_trouver_un_endroit_de_livraison = _chercher select 0;
			};
		};
	};
};

creer_point_sur_la_carte_drogue_go_fast = 
{
	createMarkerLocal ["marker_mission_livraison_drogue", (getPosATL j_ai_trouver_un_endroit_de_livraison)];
	"marker_mission_livraison_drogue" setMarkerShapeLocal "ICON";
	"marker_mission_livraison_drogue" setMarkerColorLocal "ColorYellow";
	"marker_mission_livraison_drogue" setMarkerSizeLocal [2,2];
	"marker_mission_livraison_drogue" setMarkerTypeLocal "hd_dot";
	"marker_mission_livraison_drogue" setMarkerTextLocal "Livrer la drogue ICI !";
	j_ai_creer_un_point_sur_la_carte_drogue_go_fast = 1;
};

demarrer_timer_et_mission_by_maxou_go_fast = 
{
	hintsilent "! GO FAST ! \n -------------------------------------------- \n \n Tout à été initialisé. \n\n Prend maintenant la route jusqu'au point jaune sans te faire attraper ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	[{titletext ["! GO FAST ! \n --------------------------------------------------------------- \n Attention !! \n\n Un GoFast est en cours !!! \n\n Consultez la carte pour trouver la position !","PLAIN",1];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;
	
	[] spawn creer_marker_suivi_go_fast;
	
	while {isnil {player getvariable "joueur_menotte"} && temps_de_dechargement_go_fast_by_maxou > 0 && temps_livraison_go_fast_by_maxou > 0 && alive player && player distance j_ai_trouver_un_endroit_de_livraison > 30} do
	{
		sleep 2;
		
		temps_livraison_go_fast_by_maxou = round (temps_livraison_go_fast_by_maxou - 2);
		
		if (player distance j_ai_trouver_un_endroit_de_livraison > 30 && vehicle player != player && speed (vehicle player) > 1) then
		{
			if (player distance j_ai_trouver_un_endroit_de_livraison > 1000) then 
			{
				calcul_distance = (round ((player distance j_ai_trouver_un_endroit_de_livraison) / 1000));
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à la livraison : %2 Kms. \n Quantités de drogue : %3 Kgs.",round (temps_livraison_go_fast_by_maxou / 60),calcul_distance, quantite_a_livrer_go_fast_by_maxou],"PLAIN",1];
			}else
			{
				calcul_distance = (round (player distance j_ai_trouver_un_endroit_de_livraison));
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Durée restante livraison : %1 Minutes \n Distance jusqu'à la livraison : %2 Mètres. \n Quantités de drogue : %3 Kgs.",round (temps_livraison_go_fast_by_maxou / 60),calcul_distance, quantite_a_livrer_go_fast_by_maxou],"PLAIN",1];
			};
		};
		
		if (player distance j_ai_trouver_un_endroit_de_livraison < 30) then
		{		
			while {isnil {player getvariable "joueur_menotte"} && temps_de_dechargement_go_fast_by_maxou > 0 && temps_livraison_go_fast_by_maxou > 0 && alive player} do
			{					
				sleep 1;
				if (vehicle player != player) then
				{
					if (speed (vehicle player) < 0.5) then
					{
						if (player distance j_ai_trouver_un_endroit_de_livraison < 15) then
						{
							temps_de_dechargement_go_fast_by_maxou = round (temps_de_dechargement_go_fast_by_maxou - 1);
							temps_livraison_go_fast_by_maxou = round (temps_livraison_go_fast_by_maxou - 1);
							if (temps_de_dechargement_go_fast_by_maxou <= 0 or temps_livraison_go_fast_by_maxou <= 0) then
							{
								temps_livraison_go_fast_by_maxou = 0;
								temps_de_dechargement_go_fast_by_maxou = 0;
							};
							titletext [format ["\n\n\n\n ! GO FAST ! \n --------------------------------------------------------------- \n\n Encore %1 secondes pour finir de décharger la drogue !",temps_de_dechargement_go_fast_by_maxou],"PLAIN",1];
						}else
						{
							titletext ["\n\n\n\n ! GO FAST ! \n --------------------------------------------------------------- \n\n Tu es trop loin de la maison ou décharger la drogue !","PLAIN",1];
						};
					}else
					{
						titletext ["\n\n\n\n ! GO FAST ! \n --------------------------------------------------------------- \n\n Le véhicule doit être à l'arret pour décharger la drogue !","PLAIN",1];
					};
				}else
				{
					titletext ["\n\n\n\n ! GO FAST ! \n --------------------------------------------------------------- \n\n Remonte dans le véhicule pour decharger la drogue !","PLAIN",1];
				};
			};
		};
	};
	
	if (!alive player) exitwith 
	{
		[] call reinitialiser_variable_go_fast;	
		waituntil {alive player};
		waituntil {isnil {player getvariable "besoin_d_un_revive_news"}};
		sleep 12;
		hint "! GO FAST ! \n -------------------------------------------- \n\n Fin de la livraison de drogue ! \n\n Tu n'as malheureusement pas réussi à livrer la drogue car tu es mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
	if (!isnil {player getvariable "joueur_menotte"}) exitwith 
	{
		[] call reinitialiser_variable_go_fast;	
		waituntil {alive player};
		sleep 12;
		hint "! GO FAST ! \n -------------------------------------------- \n\n Fin de la livraison de drogue ! \n\n Tu n'as malheureusement pas réussi à livrer la drogue car tu à été arreté ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
	if (temps_de_dechargement_go_fast_by_maxou > 0 && alive player) then 
	{
		hint "! GO FAST ! \n -------------------------------------------- \n\n Fin de la livraison de drogue ! \n\n Tu n'as malheureusement pas réussi à livrer la drogue dans le temps imparti ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";		
		[] call reinitialiser_variable_go_fast;	
	};
	if (temps_de_dechargement_go_fast_by_maxou < 1 && alive player) then 
	{
		hint format ["! GO FAST ! \n -------------------------------------------- \n\n Fin de la livraison de drogue ! \n\n Tu as donc remporté %1 Euros ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (argent_gagne_go_fast_by_maxou)];
		player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + argent_gagne_go_fast_by_maxou,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		sleep 1;
		[] call reinitialiser_variable_go_fast;	
	};
};

temps_livraison_go_fast_by_maxou = round (500 + (random 800)); 
temps_de_dechargement_go_fast_by_maxou = round (10 + (random 30)); 
argent_gagne_go_fast_by_maxou = round (20000 + (random 12000));
quantite_a_livrer_go_fast_by_maxou = round (200 + (random 800));
// =========================================================== ACTION ============================================================== //

_nombre_de_relance = 5; 
while {_nombre_de_relance > 0} do 
{
	_nombre_de_relance = _nombre_de_relance - 1; 
	hintsilent format ["! GO FAST ! \n -------------------------------------------- \n \n Bienvenu sur les livraisons GO FAST ;) \n\n Pour cette mission, grace à ton véhicule, tu devras livrer la drogue indiquée sur la carte grace au point jaune. \n\n Tu as %1 minutes pour terminer cette livraison ! \n\n Ce petit boulot te fera gagner %2 Euros pour %3 Kgs de drogue livrés ! \n\n Attention, les gendarmes ont étés avertis	, et savent ta position ! \n Ta position ne sera plus connue une fois que tu seras arrivé au point de livraison ! \n\n Bon courage ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (temps_livraison_go_fast_by_maxou / 60),round (argent_gagne_go_fast_by_maxou),round (quantite_a_livrer_go_fast_by_maxou)]; 
	sleep 2;
};


hint "! GO FAST ! \n -------------------------------------------- \n\n Le GO FAST est en cours d'initilisation ... \n\n Nous allons chercher un endroit de livraison ! \n\n Patiente, cela peut être très rapide comme un peu plus long ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";	
sleep 3;
[] call trouver_un_endroit_de_livraison_go_fast;
waituntil {!isnil "j_ai_trouver_un_endroit_de_livraison"};
[] call creer_point_sur_la_carte_drogue_go_fast;
waituntil {!isnil "j_ai_creer_un_point_sur_la_carte_drogue_go_fast"};
[] call demarrer_timer_et_mission_by_maxou_go_fast;
