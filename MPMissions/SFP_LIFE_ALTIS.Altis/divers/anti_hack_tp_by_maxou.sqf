// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnull player};
waituntil {player == player};
waituntil {alive player};
waitUntil {!isNil "fin_verification_apres_chargement"};

avertir_que_je_me_suis_tp = {[{hint format ["! PROTECTION HACK TP ! \n ------------------------------ \n\n Attention, un joueur : \n\n Nom : %1 \n Temps de jeu : %2 Minutes  \n\n Vient de ce TELEPORTER SANS AUTORISATION SERVEUR ! \n\n Il à été ban automatiquement ;) \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",son_nom_hackeur,sa_date_hackeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;};

if (isServer or !hasInterface) exitWith {systemChat "Anti-Hack TP V2 : Initialisation terminé car vous êtes le serveur !"};
[] spawn {sleep (10 + (random 10)); systemChat "Anti-Hack TP V2.1 : Initialisation terminée.";};
if (getPlayerUID player in sfp_config_liste_moderateur) exitWith {sleep 7; systemChat "Anti-Hack TP : Off car STAFF !"};

while {true} do 
{
	waitUntil {sleep 0.1; alive player};
	waituntil {sleep 0.1; vehicle player == player};
	
	_ma_position_avant_tp = getPosATL player;
	_pos1 = getPosATL player;
	sleep 1;
	_pos2 = getPosATL player;
	_difference_position = _pos1 distance _pos2; 

	if (isnil "jai_le_droit_de_me_tp") then
	{
		if (_difference_position > 150) then
		{
			if (speed player < 100) then
			{
				_nombre_de_personne_a_detecte = 3;
				_distance_de_la_zone_de_personne = 50;
				
				if ({isPlayer _x} count (nearestObjects [getPosATL player, ["MAN"], _distance_de_la_zone_de_personne]) >= _nombre_de_personne_a_detecte) then 
				{
					if (!isnil "_ma_position_avant_tp") then 
					{
						player setPosATL _ma_position_avant_tp;
						
						_temps_avant_redetection_tp = 500;
						while {_temps_avant_redetection_tp > 0} do
						{
							if (getPosATL player distance _ma_position_avant_tp > 20 && {isPlayer _x} count (nearestObjects [getPosATL player, ["MAN"], _distance_de_la_zone_de_personne]) >= _nombre_de_personne_a_detecte) then
							{
								player setPosATL _ma_position_avant_tp;
							};
							sleep 0.05;
							_temps_avant_redetection_tp = _temps_avant_redetection_tp - 1;
							if (isnil "avertir_protection_message_tp") then {avertir_protection_message_tp = true; titletext ["Protection distance hack TP activé pour 10 secondes ....","PLAIN DOWN"];};
						};
						avertir_protection_message_tp = nil;
					};
				}else
				{
					son_nom_hackeur = name player;
					publicvariable "son_nom_hackeur";
					sa_date_hackeur = player getvariable "ma_date_de_naissance";
					publicvariable "sa_date_hackeur";
					[] call avertir_que_je_me_suis_tp;
					
					mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
				
					_detail_du_hack = format ["Le joueur %1 avec l'id %2 c'est TP avec %3 minutes de jeu. Position depart : %4 Position final : %5 Distance : %6 mètres.",name player, getplayeruid player, player getvariable "ma_date_de_naissance", _ma_position_avant_tp, getPosATL player, _difference_position];
					_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
					["Hack Tp", "Les hacks de teleportation", _heure_du_hack, _detail_du_hack] call fn_SaveToServer;
					sleep 1;
					["Hackeur_tp",false,true] call BIS_fnc_endMission;
				};
			};
		};
	}else
	{
		_position_actuelle_pour_securite_tp = getPosATL player; 
		sleep 0.5;
		waituntil {sleep 0.5; player distance _position_actuelle_pour_securite_tp > 10};
		jai_le_droit_de_me_tp = nil;
	};
};