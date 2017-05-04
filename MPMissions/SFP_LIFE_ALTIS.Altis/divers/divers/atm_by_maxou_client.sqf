// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "sfp_config_liste_position_des_atm_affiches";};

addaction_atm_menu =
{
	player addAction ['Guichet Banque', 'divers\banque\menu_banque.sqf',[],10,true,true,"","!(player in list zone_capture_de_gang) && player distance cursorObject < 3.5 && getModelInfo cursorObject select 0 == 'Atm_01_F.p3d' or getModelInfo cursorObject select 0 == 'atm_02_f.p3d'"];
};

_liste_atm_indique = sfp_config_liste_position_des_atm_affiches;
for "_i" from 0 to (count _liste_atm_indique - 1) do
{	
	_nom_du_marqueur = format ["_marqueur_atm_numero_%1", _i];
	_le_marqueur = createMarkerlocal [_nom_du_marqueur, _liste_atm_indique select _i];
	_le_marqueur setMarkerShapelocal "ICON";
	_le_marqueur setMarkerColorlocal "ColorBlue";
	_le_marqueur setMarkerSizelocal [1.3,1.3];
	_le_marqueur setMarkerTypelocal "loc_ViewTower";
	_le_marqueur setMarkerTextlocal "ATM";
};

