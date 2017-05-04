// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_joueur_declencher_braquage = _this select 0;
_nombre_de_personne_qui_braque_la_banque = _this select 1;

if (isnil "_joueur_declencher_braquage") exitwith {systemchat "Erreur declenchement valeur banque ...";};
if (isnil "_nombre_de_personne_qui_braque_la_banque") exitwith {systemchat "Erreur declenchement valeur banque ...";};

action_ramasser_billet_de_banque = 
{
	le_tas_d_argent = (nearestObjects [player, ["Land_Money_F"], 5]) select 0;
	
	if (je_commence_a_ramasser_l_argent >= 1) exitwith {hint "Désolé, tu es déja entrain de ramasser de l'argent !";};
	je_commence_a_ramasser_l_argent = 1;
	if (!isnil {le_tas_d_argent getvariable "argent_entrain_d_etre_ramasser"}) exitwith {hint "Désolé, cet argent est déja entrain d'etre ramassé !";};
	
	le_tas_d_argent setvariable ["argent_entrain_d_etre_ramasser",1,true];
	
	montant_argent_ramasser = round (montant_argent_ramasser + (le_tas_d_argent getvariable "montant_tas_billet"));
	
	_temps_avant_de_finir_de_ramasser = 9;
	_temps_avant_de_finir_de_ramasser spawn {[_this] call bar_de_progression_by_maxou;};
	
	while {alive player && _temps_avant_de_finir_de_ramasser > 0} do
	{
		player playActionNow "medicstartup";
		sleep 1;
		_temps_avant_de_finir_de_ramasser = round (_temps_avant_de_finir_de_ramasser - 1);
		titleText [format["Encore %1 secondes avant de recuperer cet argent !", _temps_avant_de_finir_de_ramasser], "PLAIN"];
	};
	
	sleep 5; 
	player switchmove "";
	
	if (!alive player) exitwith {je_commence_a_ramasser_l_argent = 0;};
	
	deletevehicle le_tas_d_argent;
	titleText [format["Argent total recuperé %1 Euros !", montant_argent_ramasser], "PLAIN"];
	je_commence_a_ramasser_l_argent = 0;
};

bar_de_progression_by_maxou_reinitialisation = true;

// Condition Detection Visage Gendarmerie
private "_detection";
_liste_des_choses_pour_cacher_visages = ["H_ShemagOpen_tan","H_Shemag_olive","H_Shemag_olive_hs","gign_Balaclava","H_ShemagOpen_khk","TRYK_Kio_Balaclava","T_HoodACUBLK","T_HoodBDUBLK","T_HoodBlkBLK","T_HoodMDBLK","T_HoodODBLK","T_HoodTanBlk","T_HoodMWBLK","T_HoodACUCLR","T_HoodBDUCLR","T_HoodBlkCLR","T_HoodMDCLR","T_HoodODCLR","T_HoodTanCLR","T_HoodMWCLR","Shemagh_FaceGry","Shemagh_FaceOD","Shemagh_FaceRed","Shemagh_FaceTan","Shemagh_Face","T_HoodACUO","T_HoodBDUO","T_HoodBlkO","T_HoodMDO","T_HoodODO","T_HoodTanOG","T_HoodMWO","PU_shemagh_OD","PU_shemagh_Tan","PU_shemagh_White","PU_shemagh_GryBLK","PU_shemagh_ODBLK","PU_shemagh_TanBLK","PU_shemagh_WhiteBLK","PU_shemagh_GryCLR","PU_shemagh_ODCLR","PU_shemagh_TanCLR","PU_shemagh_WhiteCLR","PU_shemagh_GryO","PU_shemagh_ODO","PU_shemagh_TanO","PU_shemagh_WhiteO","SAS_shemagh_OD","SAS_shemagh_Tan","SAS_shemagh_White","T_HoodACU","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_blk","G_Balaclava_oli","Balaclava_Black","Balaclava_GRY","Balaclava_OD","Balaclava_Blk_humour","Balaclava_Blk_Plain","Balaclava_Blk_Warthog","G_Bandanna_aviator","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_khk","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","T_HoodBDU","T_HoodBlk","T_HoodMD","T_HoodOD","T_HoodTan","TRYK_kio_balaclava_BLK","TRYK_kio_balaclavas","TRYK_kio_balaclava_WH","TRYK_kio_balaclava_BLK_ear","TRYK_kio_balaclava_ear","TRYK_kio_balaclava_ESS","T_HoodMW"];
_detection = true;
if (headgear player in _liste_des_choses_pour_cacher_visages) then {_detection = false;}; 
if (Goggles player in _liste_des_choses_pour_cacher_visages) then {_detection = false;}; 

if (_detection) then
{
	if (isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",true,true];};
	execVM "divers\banque\action_braquage_banque\enlever_alerte_banque_apres_temps.sqf";
	
	if (player == _joueur_declencher_braquage) then
	{
		player globalchat "Tu n'as pas caché ton visage, tu vas donc être recherché par la gendarmerie !";
	}else
	{
		player globalchat "Ayant été a proximité du braquage et n'ayant pas caché ton visage, tu vas donc être recherché par la gendarmerie !";		
	};
}else
{
	if (player == _joueur_declencher_braquage) then
	{
		player globalchat "Tu as caché ton visage, tu ne seras donc pas recherché par la gendarmerie !";
	}else
	{
		player globalchat "Ayant été a proximité du braquage et ayant caché ton visage, tu ne seras donc pas recherché par la gendarmerie !";				
	};
};

// Condition Attente force Coffre
_timerdebanque = 700;
while {alive player && _timerdebanque > 0 && player in list trigger_banque} do
{
	_timerdebanque = _timerdebanque - 1;
	sleep 1;
	titletext [format ["Temps restant avant l'ouverture du coffre : %1 secondes. \n Ne quitte pas la banque ou le braquage sera annulé !\n ------------------------------------ \n By SFP Maxou \n www.sfpteam.fr",_timerdebanque],"PLAIN"];
};
if (!(player in list trigger_banque)) exitwith {hint "Tu n'es plus dans la banque ! \n Ouverture du coffre echoué !";};				

titletext ["... Mise en place des explosives ... Ne bouge plus !","PLAIN"];
sleep 6;
if (!(alive player)) exitwith {};

_temps_avant_explosion = 4;
for "_i" from 0 to round (_temps_avant_explosion - 1) do
{
	if (!(alive player)) exitwith {};
	titletext [format ["... ATTENTION ... \n Explosion dans %1 secondes !",round (_temps_avant_explosion - _i)],"PLAIN"];
	sleep 1;
};

if (player == _joueur_declencher_braquage) then
{
	_fumigene1 = "SmokeShell" createVehicle (MarkerPos "fumigene1");
	_fumigene2 = "SmokeShell" createVehicle (MarkerPos "fumigene2");
	_fumigene3 = "SmokeShell" createVehicle (MarkerPos "fumigene3");
	_fumigene4 = "SmokeShell" createVehicle (MarkerPos "fumigene4");
	_fumigene5 = "SmokeShell" createVehicle (MarkerPos "fumigene5");
	_fumigene6 = "SmokeShell" createVehicle (MarkerPos "fumigene6");
	_bomb = "Bo_Mk82" createVehicle (MarkerPos "bomb1");
	player setdamage 0.2;			
	[[[],"divers\banque\action_braquage_banque\derober_la_banque_sirene.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	sleep 1;
	if (!(alive player)) exitwith {};
	_bomb = "Bo_Mk82" createVehicle (MarkerPos "bomb2");player setdamage 0.25;sleep 1;_bomb = "Bo_Mk82" createVehicle (MarkerPos "bomb3");player setdamage 0.35;sleep 0.2;player setdamage 0.4;sleep 1;
	if (!(alive player)) exitwith {};
	hint "Tu as braqué le coffre fort !!! Ramasse les billets et sauve toi !!! \n\n Reste en vie 5 minutes pour terminer le braquage !";
}else
{
	sleep 3;
	hint "Tu as réussi à aider le braquage du coffre fort !!! Ramasse les billets et sauve toi !!! \n\n Reste en vie 5 minutes pour terminer le braquage !";
};		

supprimer_sac_d_argent = 0;
_sac_d_argent = createVehicle ["Land_Suitcase_F", getPosATL player, [], 0, "CAN_COLLIDE"];
_sac_d_argent attachto [player,[-0.044,-0.06,-0.1],"righthand"];
_sac_d_argent setVectorDirAndUp [[0.5,0,0],[0,0,0.5]];

[_sac_d_argent] execVM "divers\banque\action_braquage_banque\supprime_sac_argent.sqf";

_nombre_creation_billet = round ( 1 + (random 5));
while {_nombre_creation_billet > 0} do
{
	_nombre_creation_billet = round (_nombre_creation_billet - 1);
	_random_un = [2,-2] call bis_fnc_selectrandom;
	_random_deux = [2,-2] call bis_fnc_selectrandom;
	_creation_billet = createVehicle ["Land_Money_F", [(getPosATL player select 0) + _random_un, (getPosATL player select 1) + _random_deux, 1.5], [], 0, "CAN_COLLIDE"];

	_creation_billet setvariable ["montant_tas_billet",(60000 + (random 20000)),true];
	sleep 1;
};

je_commence_a_ramasser_l_argent = 0;
montant_argent_ramasser = 0;

condition_detection_argent =
{
	_cond_argent_un = false;
	{
		if (!isnil {_x getvariable "montant_tas_billet"}) then
		{
			_cond_argent_un = true;
		};
	} foreach (nearestObjects [player, ["Land_Money_F"], 3]);
	_cond_argent_un
};
addaction_ramasser_billet_de_banque = player addAction ["<t color=""#ff0000"">" + "Ramasser Billet De Banque",action_ramasser_billet_de_banque,[],7,true,true,'','[] call condition_detection_argent'];

tempsdattenteaubraquage = 300;
while {alive player && tempsdattenteaubraquage > 0} do
{
	sleep 2;
	tempsdattenteaubraquage = tempsdattenteaubraquage - 2;
	player globalchat format ["Reste encore en vie %1 secondes ...",tempsdattenteaubraquage];
};
if (!alive player) exitwith {deletevehicle _sac_d_argent; waituntil {alive player;}; sleep 10; hint "Tu es mort pendant le temps, tu n'as donc pas réussi à braquer la banque !";};


[[[],"divers\banque\action_braquage_banque\message_argent_du_coffre_aux_joueurs.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

hint format ["Tu as braqué le coffre fort de la banque !! A toi seul, le montant s'èlève à %1 Euros ! \n\n Vous etiez %2 à braquer le coffre !", montant_argent_ramasser, _nombre_de_personne_qui_braque_la_banque];
player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + montant_argent_ramasser,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

supprimer_sac_d_argent = 1;

if (!isnil "addaction_ramasser_billet_de_banque") then {player removeaction addaction_ramasser_billet_de_banque;};
