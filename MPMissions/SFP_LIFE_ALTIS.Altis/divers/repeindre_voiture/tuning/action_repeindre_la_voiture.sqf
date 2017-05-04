// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


_this spawn
{
	if (_this select 0 == 1) then 
	{
		couleur_modifie_peinture_slider_un_by_maxou = ((_this select 1 select 1) / 10);
	};

	if (_this select 0 == 2) then 
	{
		couleur_modifie_peinture_slider_deux_by_maxou = ((_this select 1 select 1) / 10);
	};
		
	if (_this select 0 == 3) then 
	{
		couleur_modifie_peinture_slider_trois_by_maxou = ((_this select 1 select 1) / 10);
	};

	if (_this select 0 == 4) then 
	{
		couleur_modifie_peinture_slider_quatre_by_maxou = ((_this select 1 select 1) / 10);
	};

	if (!isnil "couleur_modifie_peinture_slider_un_by_maxou" && !isnil "couleur_modifie_peinture_slider_deux_by_maxou" && !isnil "couleur_modifie_peinture_slider_trois_by_maxou" && !isnil "couleur_modifie_peinture_slider_quatre_by_maxou") then
	{
		appliquer_couleur = format["#(rgb,8,8,3)color(%1,%2,%3,%4)",couleur_modifie_peinture_slider_un_by_maxou, couleur_modifie_peinture_slider_deux_by_maxou, couleur_modifie_peinture_slider_trois_by_maxou, couleur_modifie_peinture_slider_quatre_by_maxou];
	
		le_vehicule_a_tunner_by_maxou setObjectTexture [0, appliquer_couleur];
	};
};