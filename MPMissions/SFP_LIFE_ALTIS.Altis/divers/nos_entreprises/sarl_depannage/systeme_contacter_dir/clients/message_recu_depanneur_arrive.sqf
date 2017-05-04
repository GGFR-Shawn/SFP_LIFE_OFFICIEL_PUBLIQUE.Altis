// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nom_du_depanneur = _this select 0;
_le_proprietaire = _this select 1;
_le_vehicule_en_panne = _this select 2;
if (isnil "_nom_du_depanneur" or isnil "_le_proprietaire" or isnil "_le_vehicule_en_panne") exitwith {};	
if (name player != _le_proprietaire) exitwith {};	

hint format ["! REPARATION DIR! \n -------------------------------- \n\n Bonjour %1, \n\n Le depanneur %2 a prit votre demande pour votre %3 et va arriver d ici peu ... \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr", name player, _nom_du_depanneur, getText ( configFile >> "CfgVehicles" >> typeOf (_le_vehicule_en_panne) >> "displayName")];

for [{_i = 8}, {_i > 0}, {_i = _i - 1}] do
{
	player globalchat format ["Bonjour %1, le depanneur %2 a prit votre demande pour votre %3 et va arriver d ici peu ...", name player, _nom_du_depanneur, getText ( configFile >> "CfgVehicles" >> typeOf (_le_vehicule_en_panne) >> "displayName")];
	sleep 1;
};
