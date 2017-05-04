//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !


if (isnil "mission_livreur_journaux_by_maxou") then {mission_livreur_journaux_by_maxou = 0;};
if (isnil "sfp_config_liste_moderateur") exitwith {};
if (mission_livreur_journaux_by_maxou >= 1) exitwith {hint "Impossible, tu es déja entrain de faire ce boulot !";};
mission_livreur_journaux_by_maxou = 1;

// ====================================================== INITIALISATION ============================================================== //
action_jeter_journaux = 
{
	if !(cursortarget iskindof "house") exitwith {hint "Impossible, ce n'est pas une maison !";};
	if (cursortarget getvariable "maison_recu_journal_by_sfp_maxou" > 0) exitwith {hint "Impossible, cette maison à déja reçu un journal !";};
	if (player distance cursortarget > 20) exitwith {hint "Impossible, tu es trop loin de cette maison !";};
	[[[player,"AwopPercMstpSgthWrflDnon_End2"],"divers\taper_un_joueur\tapersynchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	cursortarget setvariable ["maison_recu_journal_by_sfp_maxou",1,false];
	player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + argent_gagne_livraison_journaux_by_maxou,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	nombre_de_journaux_by_maxou = nombre_de_journaux_by_maxou - 1;
	player globalchat format ["Encore %1 journaux à livrer !",nombre_de_journaux_by_maxou];
	_object = createVehicle ["Land_File1_F", getPosATL player, [], 0, "CAN_COLLIDE"];
	_object attachto [player,[0,-0.1,0.1],"righthand"];
	_object setVectorDirAndUp [[1,0.5,-2],[-0.5,-0.7,0]];
	sleep 0.1;
	detach _object;
	_jeter_un = round (random 10);
	_jeter_deux = round (random 10);
	_jeter_trois = round (random 10);
	_object setVelocity [(sin getdir player * _jeter_un),(cos getdir player * _jeter_deux),_jeter_trois];
	sleep 20;
	deletevehicle _object;
};
connaitre_temps_restant = 
{
	hintsilent format ["! LIVREUR JOURNAUX ! \n -------------------------------------------- \n \n Il vous reste encore %1 minutes ou %2 journaux à jeter pour terminer vos livraisons ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (temps_livraison_journaux_by_maxou / 60),nombre_de_journaux_by_maxou];
};
demarrer_timer_livraison_journaux_by_maxou = 
{
	while {(temps_livraison_journaux_by_maxou > 0) && (nombre_de_journaux_by_maxou > 0)} do
	{
		temps_livraison_journaux_by_maxou = temps_livraison_journaux_by_maxou - 1;
		sleep 1;
	};
	if (nombre_de_journaux_by_maxou <= 0 or temps_livraison_journaux_by_maxou <= 0) then 
	{
		hint format ["! LIVREUR JOURNAUX ! \n -------------------------------------------- \n\n Fin des livraisons ! \n Merci à toi tu as donc remporté %1 Euros au total ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (nombre_de_journaux_prix_total * argent_gagne_prix_total)];
	};
	if (nombre_de_journaux_by_maxou > 0 && temps_livraison_journaux_by_maxou <= 0) then 
	{
		hint format ["! LIVREUR JOURNAUX ! \n -------------------------------------------- \n\n Fin des livraisons ! \n Tu n'as malheureusement pas réussi à livrer tous les journaux ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",round (nombre_de_journaux_prix_total * argent_gagne_prix_total)];
	};
	player removeaction action_livraison_journaux;
	player removeaction action_temps_restant; 
	connaitre_temps_restant = nil; 
	demarrer_timer_livraison_journaux_by_maxou = nil; 
	temps_livraison_journaux_by_maxou = nil; 
	mission_livreur_journaux_by_maxou = nil;
	argent_gagne_prix_total = nil;
	nombre_de_journaux_prix_total = nil;
	menu_jeter_journaux_by_maxou = nil;
	explication_livreur_journaux_by_maxou = nil;
	argent_gagne_livraison_journaux_by_maxou = nil;
	nombre_de_journaux_by_maxou = nil;
};

// =========================================================== ACTION ============================================================== //
if (isnil "nombre_de_journaux_by_maxou") then {nombre_de_journaux_by_maxou = round (30 + (random 100));nombre_de_journaux_prix_total = nombre_de_journaux_by_maxou;};
if (isnil "argent_gagne_livraison_journaux_by_maxou") then {argent_gagne_livraison_journaux_by_maxou = round (5 + (random 20)); argent_gagne_prix_total = argent_gagne_livraison_journaux_by_maxou;};
if (isnil "temps_livraison_journaux_by_maxou") then {temps_livraison_journaux_by_maxou = round (600 + (random 1000)); action_temps_restant = player addaction ["<t color=""#5366F9"">" + "Temps Restant Mission Journal",connaitre_temps_restant,[],8,false,false,"","nombre_de_journaux_by_maxou > 0 && temps_livraison_journaux_by_maxou > 0"];};
if (isnil "menu_jeter_journaux_by_maxou") then {menu_jeter_journaux_by_maxou = 1; action_livraison_journaux = player addaction ["<t color=""#ff0000"">" + "Jeter Journal",action_jeter_journaux,[],10,false,false,"","nombre_de_journaux_by_maxou > 0 && temps_livraison_journaux_by_maxou > 0"];};
if (isnil "explication_livreur_journaux_by_maxou") then {explication_livreur_journaux_by_maxou = 1; _nombre_de_relance = 3; while {_nombre_de_relance > 0} do {_nombre_de_relance = _nombre_de_relance - 1; hintsilent format ["! LIVREUR JOURNAUX ! \n -------------------------------------------- \n \n Bienvenu en tant que livreur de journaux ;) \n\n Pour cette mission, grace au menu JETER JOURNAL, tu dois livrer : \n\n %1 journaux au total en %4 minutes ! \n\n Attention, il faut à chaque fois une maison différente ! \n\n Egalement chaque maison te rapportera %2 Euros soit au total %3 Euros ! \n\n Bon courage ;) \n\n PS : Sache que j'ai volontairement dévié les trajectoires du lancé pour rajouter du réalisme. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",nombre_de_journaux_by_maxou,argent_gagne_livraison_journaux_by_maxou,round (nombre_de_journaux_prix_total * argent_gagne_prix_total),round (temps_livraison_journaux_by_maxou / 60)]; sleep 2;};};
[] call demarrer_timer_livraison_journaux_by_maxou;
