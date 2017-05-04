// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_voiture = _this select 0;
_type = _this select 1;
_type_deux = getText ( configFile >> "CfgVehicles" >> _type >> "displayName");
if (isnil "numero_du_marqueur") then {numero_du_marqueur = 0;};

numero_du_marqueur = numero_du_marqueur + 1;
_nom_du_marqueur = format["marqueur_endroit_voiture_%1", numero_du_marqueur];
createMarkerLocal [_nom_du_marqueur, _position_voiture];
_nom_du_marqueur setMarkerShapeLocal "ICON";
_nom_du_marqueur setMarkerColorLocal "Colorblue";	
_nom_du_marqueur setMarkerSizeLocal [2.5,2.5];
_nom_du_marqueur setMarkerTypeLocal "hd_dot";
_type_du_vehicule = format["Véhicule type %1 !", _type_deux];
_nom_du_marqueur setMarkerTextLocal _type_du_vehicule;
sleep 60;
deletemarkerlocal _nom_du_marqueur;

