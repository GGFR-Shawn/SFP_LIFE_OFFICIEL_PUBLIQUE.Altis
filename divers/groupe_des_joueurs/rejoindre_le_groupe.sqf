// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call compter_personne_dans_mon_groupe; 
if (nombre_de_personne_dans_mon_group > 1) exitwith {player globalchat "Vous êtes déja dans un groupe ...";};

_qui_rejoindre = lbtext [1500, lbcursel 1500];
le_joueur_rejoindre_group = nil;

{
	if (name _x == _qui_rejoindre) then
	{
		le_joueur_rejoindre_group = _x;
	};
} foreach playableUnits;

if (isnil "le_joueur_rejoindre_group") exitwith {hint "Erreur sur le nom recherché !";};

if (le_joueur_rejoindre_group getvariable "etat_verrou_du_groupe_sfp" >= 1) exitwith {player globalchat "Désolé, le joueur à vérrouillé son groupe !";};
if (side player != side le_joueur_rejoindre_group) exitwith {player globalchat "Désolé, vous ne pouvez pas rejoindre ce joueur puisque vous ne faite pas partie de la même class (gendarme ou civil) !";};
if (!isnil {le_joueur_rejoindre_group getvariable "joueur_menotte"}) exitwith {hint "Opération impossible le joueur est menotté !";};
if (!isnil {le_joueur_rejoindre_group getvariable "jai_un_sac_sur_la_tete"}) exitwith {hint "Opération impossible le joueur à un sac sur la tête !";};

[player] joinsilent le_joueur_rejoindre_group;
confirmation_rejoint_groupe = nil;

[] call compter_personne_dans_mon_groupe; 
player globalchat format ["Vous avez rejoint le groupe de %1, vous êtes actuellement %2 dedans ...", _qui_rejoindre, nombre_de_personne_dans_mon_group];


