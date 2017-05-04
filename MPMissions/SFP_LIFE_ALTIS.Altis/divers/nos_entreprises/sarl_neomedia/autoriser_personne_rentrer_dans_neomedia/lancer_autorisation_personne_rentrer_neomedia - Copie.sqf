// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

hint format ["Vous allez autoriser %1 à rentrer dans votre QG pendant 300 secondes. \n\n Une fois ce délais dépassé, une fois sortie du QG il ne pourra plus y re rentrer ...", name cursortarget];

[[[cursortarget],"divers\nos_entreprises\sarl_neomedia\autoriser_personne_rentrer_dans_neomedia\synchroniser_autorisation_personne_rentrer_neomedia.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
