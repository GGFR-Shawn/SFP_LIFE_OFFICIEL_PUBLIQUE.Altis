// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_famille_une") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "En tant que pompier en service, vous pouvez rentrer dans les HQ pour soigner les joueurs ...";};

_personneautoriserdoffice = whitelist_famille_une;
if (getPlayerUID player in  _personneautoriserdoffice) then {player setvariable [sfp_config_famille_une_nom_pour_variable,true,true];};
if (debug_mission_pour_dev) then {player setvariable [sfp_config_famille_une_nom_pour_variable,true,true];};

if (!(isnil ("actionpourrecruter"))) then {player removeaction actionpourrecruter;};
if (!(isnil ("actionpourdemissionner"))) then {player removeaction actionpourdemissionner;};
if (!(isnil ("achat_vehicule_perso_un_famille_une"))) then {player removeaction achat_vehicule_perso_un_famille_une;};
if (!(isnil ("actionpourmequiper"))) then {player removeaction actionpourmequiper;};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"};cursortarget setvariable [sfp_config_famille_une_nom_pour_variable,true,true];hint format ["%1 fait désormais partie de %2 ! \n\n N'oublie pas, pas de tir gratuit ! ;)",name cursortarget, sfp_config_famille_une_nom];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable [sfp_config_famille_une_nom_pour_variable,nil,true];hint format ["%1 à bien été viré de %2 ;)",name cursortarget, sfp_config_famille_une_nom];};

if (player in list trigger_famille_une) then
{
	if (isnil {player getvariable sfp_config_famille_une_nom_pour_variable}) exitwith {jai_le_droit_de_me_tp = 1; player setpos (getmarkerpos "position_famille_une_respawn"); player setdir 178.759; hint format ["! %1 ! \n --------------------------------------- \n\n Si tu reviens ici sans ma permission ... \n Il ne restera plus rien de toi ! \n\n Le message est clair ? :)", sfp_config_famille_une_nom];};

	if (!isnil {player getvariable sfp_config_famille_une_nom_pour_variable}) then 
	{
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter le mafieux",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 20 && isnil {cursorTarget getvariable sfp_config_famille_une_nom_pour_variable}'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Virer le mafieux",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 20 && !isnil {cursorTarget getvariable sfp_config_famille_une_nom_pour_variable}'];
		};

		achat_vehicule_perso_un_famille_une = player addAction ["<t color=""#ff0000"">" + "Acheter OffRoad" + format ["(%1 Euros)", sfp_config_famille_une_classe_du_vehicule_perso_un select 1],"divers\nos_familles\Famille_une\acheter_offroad_famille_une.sqf",[],1,false,false,'',''];
		
		actionpourmequiper = player addAction ["<t color=""#ff0000"">" + "M'Equiper En Gang (100 Euros)","divers\nos_familles\Famille_une\equiper_famille_une.sqf",[],15,true,true,'','player in list trigger_famille_une'];

		je_suis_en_famille_une = 1;
		hint format ["! %1 ! \n --------------------------------------- \n\n Bienvenue à la maison %2 !",sfp_config_famille_une_nom ,name player];};
};	

waituntil {!(player in list trigger_famille_une)};
if (!(isnil ("actionpourrecruter"))) then {player removeaction actionpourrecruter;};
if (!(isnil ("actionpourdemissionner"))) then {player removeaction actionpourdemissionner;};
if (!(isnil ("achat_vehicule_perso_un_famille_une"))) then {player removeaction achat_vehicule_perso_un_famille_une;};
if (!(isnil ("actionpourmequiper"))) then {player removeaction actionpourmequiper;};
if (debug_mission_pour_dev) then {player setvariable [sfp_config_famille_une_nom_pour_variable,nil,true];};


