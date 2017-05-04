// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_temps_choisit = floor parseNumber (ctrlText 1400);
if (isnil "_temps_choisit") exitwith {hint "Temps choisit invalide, recommence ...";};
if (_temps_choisit < 20) exitwith {hint "Temps choisit invalide, minimum 20 minutes ...";};
if (_temps_choisit > 60) exitwith {hint "Temps choisit invalide, maximum 60 minutes ...";};

[[[_temps_choisit],"partie_serveur\divers\loi_martiale_gendarmerie_serveur.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

hint format ["La loi Martiale va être appliquée pour %1 minutes ...", _temps_choisit];

closedialog 0;

