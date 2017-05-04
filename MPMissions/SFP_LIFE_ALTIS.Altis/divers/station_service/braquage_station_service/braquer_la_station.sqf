// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_nombre_minimum_de_gendarme_de_co";
_nombre_minimum_de_gendarme_de_co = 4;
if (!sfp_config_activer_braquage_station_service) exitwith {hint "Les braquages ne sont pas autorisé sur ce serveur.";};
if (revive_mon_side != civilian) exitwith {hint "Vous devez être un civil pour pouvoir braquer une station service.";};
if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitWith {hint "Opération impossible ! Le serveur va redémarrer dans moins de 20 minutes !";};
if (player distance getPos Neochori > 4000) exitwith {hint format ["Impossible, les stations ne peuvent être braqué qu'à moins de 4000 mètres de Neochori ! \n\n Actuellement %1 Mètres.", round (player distance position Neochori)];};
if (count (nearestObjects [getPosATL player, ["Land_fs_roof_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 80]) < 1) exitwith {hint "La station service n'à pas été trouvé !";};
if (currentWeapon player == "") exitwith {hint "Vous avez besoin d'une arme pour braquer cette station !";}; 
{if (side _x == west) then{_nombre_minimum_de_gendarme_de_co = round (_nombre_minimum_de_gendarme_de_co - 1);};} foreach playableunits;
if (_nombre_minimum_de_gendarme_de_co > 0) exitwith {hint "Désolé, il n'y a pas assez de gendarmes sur le serveur pour braquer la station !";}; 
if (!isnil "station_service_en_cours_de_braquage") exitwith {hint "Opération impossible, un braquage est déja en cours sur l'ile ...";};
station_service_en_cours_de_braquage = 1; sleep 0.045; publicvariable "station_service_en_cours_de_braquage";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Condition Detection Visage Gendarmerie
private "_detection";
_liste_des_choses_pour_cacher_visages = ["H_ShemagOpen_tan","H_Shemag_olive","H_Shemag_olive_hs","gign_Balaclava","H_ShemagOpen_khk","TRYK_Kio_Balaclava","T_HoodACUBLK","T_HoodBDUBLK","T_HoodBlkBLK","T_HoodMDBLK","T_HoodODBLK","T_HoodTanBlk","T_HoodMWBLK","T_HoodACUCLR","T_HoodBDUCLR","T_HoodBlkCLR","T_HoodMDCLR","T_HoodODCLR","T_HoodTanCLR","T_HoodMWCLR","Shemagh_FaceGry","Shemagh_FaceOD","Shemagh_FaceRed","Shemagh_FaceTan","Shemagh_Face","T_HoodACUO","T_HoodBDUO","T_HoodBlkO","T_HoodMDO","T_HoodODO","T_HoodTanOG","T_HoodMWO","PU_shemagh_OD","PU_shemagh_Tan","PU_shemagh_White","PU_shemagh_GryBLK","PU_shemagh_ODBLK","PU_shemagh_TanBLK","PU_shemagh_WhiteBLK","PU_shemagh_GryCLR","PU_shemagh_ODCLR","PU_shemagh_TanCLR","PU_shemagh_WhiteCLR","PU_shemagh_GryO","PU_shemagh_ODO","PU_shemagh_TanO","PU_shemagh_WhiteO","SAS_shemagh_OD","SAS_shemagh_Tan","SAS_shemagh_White","T_HoodACU","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_blk","G_Balaclava_oli","Balaclava_Black","Balaclava_GRY","Balaclava_OD","Balaclava_Blk_humour","Balaclava_Blk_Plain","Balaclava_Blk_Warthog","G_Bandanna_aviator","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_khk","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","T_HoodBDU","T_HoodBlk","T_HoodMD","T_HoodOD","T_HoodTan","TRYK_kio_balaclava_BLK","TRYK_kio_balaclavas","TRYK_kio_balaclava_WH","TRYK_kio_balaclava_BLK_ear","TRYK_kio_balaclava_ear","TRYK_kio_balaclava_ESS","T_HoodMW"];
_detection = true;
if (headgear player in _liste_des_choses_pour_cacher_visages) then {_detection = false;}; 
if (Goggles player in _liste_des_choses_pour_cacher_visages) then {_detection = false;}; 

[[[position player],"divers\station_service\braquage_station_service\braquer_la_station_avertir_gendarme_et_position.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

if (_detection) then
{
	if (isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",true,true];};
	execVM "divers\station_service\braquage_station_service\enlever_alerte_braquage_station_service_apres_temps.sqf";
	
	player globalchat "Tu n'as pas caché ton visage, tu vas donc être recherché par la gendarmerie !";

	hint "! BRAQUAGE DE STATION ! \n\n Attention, la gendarmerie vient d'être informée du braquage par un client qui vous à aperçu ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";	
}else
{
	player globalchat "Tu as caché ton visage, tu ne seras donc pas recherché par la gendarmerie !";
};

_argent_a_gagner = round (8000 + (random 5000));
_timer_braquage = round (400 + (random 200));
_position_de_depart = position player;
while {alive player && _timer_braquage > 0 && player distance _position_de_depart < 30} do
{
	_timer_braquage = round (_timer_braquage - 1);
	sleep 1;
	titletext [format ["Temps restant avant la validation du braquage : %1 secondes. \n Distance à ne pas quitter : %2/30 Mètres. !\n ------------------------------------ \n By SFP Maxou \n www.sfpteam.fr",_timer_braquage, round (player distance _position_de_depart)],"PLAIN"];
};
if (player distance _position_de_depart > 30) exitwith {hint "Tu n'es plus dans la station ! \n Braquage annulé !";};				

hint format ["Tu as braqué la station !! Le montant s'èlève à %1 Euros !", _argent_a_gagner];
player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _argent_a_gagner,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
