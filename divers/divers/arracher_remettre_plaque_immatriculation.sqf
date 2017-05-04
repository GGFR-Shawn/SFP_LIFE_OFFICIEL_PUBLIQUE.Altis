// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = cursortarget;
if (isnil "_le_vehicule") exitwith {hint "Erreur, recommence ...";};
if (isEngineon _le_vehicule) exitwith {hint "Eteint ton véhicule avant ..";};

_plaque_actuelle = _le_vehicule getvariable "plaque_immatriculation_news";

if (_le_vehicule getvariable "plaque_immatriculation_news" select 0 == "Plaque arrachée") then
{
	cuttext ["! PLAQUE IMMAT SFP ! \n ---------------------------------- \n Remise de ta plaque d'immatriculation en cours ... \n\n Patiente ... \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", "BLACK OUT",1]; 
	sleep 15;
	cuttext ["! PLAQUE IMMAT SFP ! \n ---------------------------------- \n Ta plaque à bien été refixée ;) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", "BLACK IN",15]; 
	
	_le_vehicule setvariable ["plaque_immatriculation_news", [_plaque_actuelle select 1, _plaque_actuelle select 1], true];
}else
{
	cuttext ["! PLAQUE IMMAT SFP ! \n ---------------------------------- \n Arrachage de ta plaque d'immatriculation en cours ... \n\n Patiente ... \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", "BLACK OUT",1]; 
	sleep 15;
	cuttext ["! PLAQUE IMMAT SFP ! \n ---------------------------------- \n Ta plaque à bien été arrachée !!! \n\n Attention aux gendarmes. \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", "BLACK IN",15]; 

	_le_vehicule setvariable ["plaque_immatriculation_news", [sfp_config_listes_des_plaques_non_flashables select 1, _plaque_actuelle select 1], true];
};