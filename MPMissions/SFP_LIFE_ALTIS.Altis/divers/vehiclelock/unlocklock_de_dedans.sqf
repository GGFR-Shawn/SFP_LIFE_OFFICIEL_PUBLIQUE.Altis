// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_des_pompiers_sont_en_jeu";
_veh = vehicle player;
if (isNil {_veh getVariable "vehicule_info_parvariable"}) exitwith {hint "Aucune information concernant ce véhicule !";};
if (!(name player in (_veh getVariable "vehicule_info_parvariable"))) exitwith {hint "Ce n'est pas ton véhicule !";};
if (!isnil {_veh getvariable "sabot_roue_vehicule"}) exitwith {hint "Désolé, ce véhicule à un sabot sur la roue !";};

// Pompiers desincarceration
{if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then {_des_pompiers_sont_en_jeu = 1;};} foreach allunits;
if (isnil "autorisation_declenchement_desincarceration") then {autorisation_declenchement_desincarceration = 0; publicvariable "autorisation_declenchement_desincarceration";};	
if (autorisation_declenchement_desincarceration < 1) then
{
	if (!isnil "_des_pompiers_sont_en_jeu" && isnil {_veh getVariable "attente_pompier_desincarceration"} && damage _veh >= 0.75) then
	{
		if !(_veh iskindof "air") then
		{
			_veh setvariable ["attente_pompier_desincarceration",1,true];
			autorisation_declenchement_desincarceration = 1;
			publicvariable "autorisation_declenchement_desincarceration";
			
			// Creer marker pompier
			{
				if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then 
				{
					_ma_position_incarcere = getPosATL player;
					[[[_veh,_ma_position_incarcere],"divers\nos_entreprises\sarl_pompier\sarl_pompier_client\desincarcerer_victime_accident_de_la_route\creer_marker_desincarceration.sqf"],"BIS_fnc_execVM",_x,false] spawn BIS_fnc_MP;
				};
			} foreach allunits;
		};
	};
};

if (!isnil {_veh getvariable "attente_pompier_desincarceration"} && !isnil "_des_pompiers_sont_en_jeu") exitwith 
{
	hint "Désolé, vous êtes incarcéré dans votre véhicule suite à votre accident ! \n\n Les pompiers ont étés prévenus et devront arriver d'ici peu !";
	_veh setfuel 0;
	sleep 3;
	if (!isnil "ma_position_incarcere") then {ma_position_incarcere = nil;};
};
// Fin Pompier Desincarceration


if (locked _veh == 2) then 
{
	hint "Véhicule déverrouillé !";
	[[[_veh],"divers\vehiclelock\son_ouverture.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	[[[_veh,0],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
}else 
{
	hint "Véhicule verrouillé !";
	[[[_veh],"divers\vehiclelock\son_fermeture.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	[[[_veh,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
};