// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2;!isnil "fin_verification_apres_chargement"};

while {player getvariable "evade_de_prison" > 0} do
{
	detection_trouver_commercant = nil;
	choix_avertir_aux_joueurs = nil;
	
	_argent_de_poche_prisonnier = round (player getvariable "mon_argent_poche_by_sfp_maxou");
	waituntil {sleep 2;round (player getvariable "mon_argent_poche_by_sfp_maxou") != _argent_de_poche_prisonnier};
	if (player getvariable "evade_de_prison" <= 0) exitwith {};
	
	{if (_x iskindof "man") then {detection_trouver_commercant = 1;};} foreach nearestObjects [player, ["MAN"], 8];
	if (!isnil "detection_trouver_commercant") then {choix_avertir_aux_joueurs = [1,2,3,4] call BIS_fnc_selectRandom;};
	
	if (!isnil "choix_avertir_aux_joueurs") then
	{
		if (choix_avertir_aux_joueurs == 2) then
		{
			titletext ["Attention, un commercant ou un joueur vient de relever ta position à tous les joueurs ainsi qu'aux gendarmes ...","PLAIN DOWN"];
			[[[player],"divers\gendarmerie\prison\systeme_de_prisonnier_quand_evade\creation_markeur_evade_de_prison.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
			choix_avertir_aux_joueurs = nil;
		};
	};
};


