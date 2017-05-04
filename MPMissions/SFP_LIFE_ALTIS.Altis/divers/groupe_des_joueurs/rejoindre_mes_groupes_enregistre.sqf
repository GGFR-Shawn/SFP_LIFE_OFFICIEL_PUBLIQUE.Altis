// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (isnil "personne_dans_mon_groupe") then {personne_dans_mon_groupe = [];};
// personne_trouve_pour_rejoindre_groupe = nil;
// securite_side_groupement_automatique = nil;

// if (count personne_dans_mon_groupe >= 1) then
// {
	// {
		// if (name _x in personne_dans_mon_groupe && name _x != name player) then
		// {
			// if (side player == side _x) then
			// {
				// personne_trouve_pour_rejoindre_groupe = _x;
			// };
		// };
	// } foreach playableunits;
// };

// if (!isnil "personne_trouve_pour_rejoindre_groupe") then
// {
	// [player] joinsilent personne_trouve_pour_rejoindre_groupe;
// };

fin_check_joueur_dans_mon_groupe = 1;