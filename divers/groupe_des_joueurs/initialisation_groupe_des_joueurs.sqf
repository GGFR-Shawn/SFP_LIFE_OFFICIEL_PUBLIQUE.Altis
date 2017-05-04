// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNil "fin_verification_apres_chargement"};

if (isnil "le_joueur_rejoindre_group") then {le_joueur_rejoindre_group = name player;};
if (isnil {player getvariable "etat_verrou_du_groupe_sfp"}) then {player setvariable ["etat_verrou_du_groupe_sfp",0,true];};

compter_personne_dans_mon_groupe =
{
	nombre_de_personne_dans_mon_group = 0;
	personne_actuellement_dans_mon_groupe = [];
	{
		if (group _x == group player) then
		{
			nombre_de_personne_dans_mon_group = round (nombre_de_personne_dans_mon_group + 1);
			if !(_x in personne_actuellement_dans_mon_groupe) then {personne_actuellement_dans_mon_groupe = personne_actuellement_dans_mon_groupe + [_x];};
		};
	} foreach playableUnits;
};

sleep 6;

execvm "divers\groupe_des_joueurs\rejoindre_mes_groupes_enregistre.sqf";
waituntil {!isnil "fin_check_joueur_dans_mon_groupe"};
execvm "divers\groupe_des_joueurs\icones_pour_leader_de_mon_groupe.sqf";