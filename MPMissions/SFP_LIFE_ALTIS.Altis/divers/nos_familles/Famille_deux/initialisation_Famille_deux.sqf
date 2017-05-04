// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_famille_deux") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "En tant que pompier en service, vous pouvez rentrer dans les HQ pour soigner les joueurs ...";};

_personneautoriserdoffice = whitelist_famille_deux;
if (getPlayerUID player in  _personneautoriserdoffice) then {player setvariable [sfp_config_famille_deux_nom_pour_variable,true,true];};
if (debug_mission_pour_dev) then {player setvariable [sfp_config_famille_deux_nom_pour_variable,true,true];};

if (!(isnil ("actionpourrecruter"))) then {player removeaction actionpourrecruter;};
if (!(isnil ("actionpourdemissionner"))) then {player removeaction actionpourdemissionner;};
if (!(isnil ("achat_offroad_famille_deux"))) then {player removeaction achat_offroad_famille_deux;};
if (!(isnil ("actionpourmequiper"))) then {player removeaction actionpourmequiper;};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"};cursortarget setvariable [sfp_config_famille_deux_nom_pour_variable,true,true];hint format ["%1 fait désormais partie de %2 ! \n\n N'oublie pas, pas de tir gratuit ! ;)",name cursortarget, sfp_config_famille_deux_nom];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable [sfp_config_famille_deux_nom_pour_variable,nil,true];hint format ["%1 à bien été viré de %2 ;)", name cursortarget, sfp_config_famille_deux_nom];};

if (player in list trigger_famille_deux) then
{
	if (!isnil {player getvariable sfp_config_famille_deux_nom_pour_variable}) then 
	{
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter le mafieux",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 20 && isnil {cursorTarget getvariable sfp_config_famille_deux_nom_pour_variable}'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Virer le mafieux",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 20 && !isnil {cursorTarget getvariable sfp_config_famille_deux_nom_pour_variable}'];
		};

		achat_offroad_famille_deux = player addAction ["<t color=""#ff0000"">" + "Acheter OffRoad (1 100 Euros)","divers\nos_familles\famille_deux\acheter_offroad_famille_deux.sqf",[],1,false,false,'',''];
		
		actionpourmequiper = player addAction ["<t color=""#ff0000"">" + "M'Equiper En Gang (100 Euros)","divers\nos_familles\famille_deux\equiper_famille_deux.sqf",[],15,true,true,'','player in list trigger_famille_deux'];

		je_suis_en_famille_deux = 1;
		hint format ["! %1 ! \n --------------------------------------- \n\n Bienvenue à la maison %2 !", sfp_config_famille_deux_nom, name player];};
};	

waituntil {!(player in list trigger_famille_deux)};
if (!(isnil ("actionpourrecruter"))) then {player removeaction actionpourrecruter;};
if (!(isnil ("actionpourdemissionner"))) then {player removeaction actionpourdemissionner;};
if (!(isnil ("achat_offroad_famille_deux"))) then {player removeaction achat_offroad_famille_deux;};
if (!(isnil ("actionpourmequiper"))) then {player removeaction actionpourmequiper;};
if (debug_mission_pour_dev) then {player setvariable [sfp_config_famille_deux_nom_pour_variable,nil,true];};


