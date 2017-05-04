// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "auto_fps_valeur_activation"};

private["_mode","_valeur"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_valeur = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _valeur == -1) exitWith {};
if (auto_fps_valeur_activation) exitwith {hint "Opération impossible, l'auto FPS est activé ... \n\n Désactive le.";};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		ctrlSetText[2902,format["%1",round(_valeur)]];
		distance_de_vue_pied = round(_valeur);
		['distance_de_vue_pied', distance_de_vue_pied] call uid_sauvegarde_ecrire_local_joueur_sfp;
	};
	
	case 1:
	{
		distance_de_vue_voiture = round(_valeur);
		ctrlSetText[2912,format["%1",round(_valeur)]];
		['distance_de_vue_voiture', distance_de_vue_voiture] call uid_sauvegarde_ecrire_local_joueur_sfp;
	};
	
	case 2:
	{
		distance_de_vue_air = round(_valeur);
		ctrlSetText[2922,format["%1",round(_valeur)]];
		['distance_de_vue_air', distance_de_vue_air] call uid_sauvegarde_ecrire_local_joueur_sfp;
	};
	case 3:
	{
		distance_de_vue_ombrage = round(_valeur);
		ctrlSetText[3902,format["%1",round(_valeur)]];
		setObjectViewDistance [distance_de_vue_ombrage,distance_de_vue_ombrage];
		['distance_de_vue_ombrage', distance_de_vue_ombrage] call uid_sauvegarde_ecrire_local_joueur_sfp;
	};
};

switch (true) do
{
	case ((vehicle player) isKindOf "Man"): 
	{
		if !(auto_fps_valeur_activation) then {setViewDistance distance_de_vue_pied;};
	};
	case ((vehicle player) isKindOf "LandVehicle"): 
	{
		if !(auto_fps_valeur_activation) then {setViewDistance distance_de_vue_voiture;};
	};
	case ((vehicle player) isKindOf "Air"): 
	{
		if !(auto_fps_valeur_activation) then {setViewDistance distance_de_vue_air;};
	};
};

