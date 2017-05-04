// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_vehicule_tuner", "_creation_by_maxou_neon_vehicule","_couleur_actuelle_du_vehicule"];

_le_vehicule_tuner = _this select 0;
if (isnil "_le_vehicule_tuner") exitwith {};

while {!isNull _le_vehicule_tuner && alive _le_vehicule_tuner && _le_vehicule_tuner getvariable "voiture_possede_un_neon" select 1 >= 1} do
{
	if (isnil "_creation_by_maxou_neon_vehicule") then
	{
		_creation_by_maxou_neon_vehicule = "#lightpoint" createVehicleLocal (getPosATL _le_vehicule_tuner);
		_creation_by_maxou_neon_vehicule setLightBrightness 0.03;
		_creation_by_maxou_neon_vehicule setLightAmbient [1,0.28,0.05];
		_creation_by_maxou_neon_vehicule setLightColor (_le_vehicule_tuner getvariable "voiture_possede_un_neon" select 0);
		_creation_by_maxou_neon_vehicule attachTo [_le_vehicule_tuner, [0,0,0]];
		
		[_le_vehicule_tuner, _creation_by_maxou_neon_vehicule] spawn
		{
			_le_vehicule_tuner = _this select 0;
			_creation_by_maxou_neon_vehicule = _this select 1;
			
			while {!isNull _le_vehicule_tuner && alive _le_vehicule_tuner && _le_vehicule_tuner getvariable "voiture_possede_un_neon" select 1 >= 1} do
			{
				sleep 1;
			};
			
			deletevehicle _creation_by_maxou_neon_vehicule;
		};
	};
	
	if (isnil "_couleur_actuelle_du_vehicule") then {_couleur_actuelle_du_vehicule = _le_vehicule_tuner getvariable "voiture_possede_un_neon" select 0;};
	_verifie_la_couleur = [_couleur_actuelle_du_vehicule,_le_vehicule_tuner getvariable "voiture_possede_un_neon" select 0] call BIS_fnc_areEqual;
	if (!_verifie_la_couleur) then
	{
		_couleur_actuelle_du_vehicule = _le_vehicule_tuner getvariable "voiture_possede_un_neon" select 0;
		_creation_by_maxou_neon_vehicule setLightColor (_le_vehicule_tuner getvariable "voiture_possede_un_neon" select 0);
	};

	if (isnil "demande_changement_couleur_neon_vehicule") then
	{
		sleep 1;
	}else
	{
		sleep 0.00001;	
	};
};