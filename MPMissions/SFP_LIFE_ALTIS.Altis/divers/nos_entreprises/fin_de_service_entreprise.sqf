// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = false;

switch true do
{
	case (!isnil "jesuis_au_taff_a_la_sarl_autoecole") :
	{
		jesuis_au_taff_a_la_sarl_autoecole = nil;
		player setVariable["sarl_autoecole_en_ligne", nil, true];
		_condition = true;
		
		systemchat "Fin de service pour la sarl autoécole ...";
		hint "Fin de service pour la sarl autoécole ...";
	};
	
	case (!isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") :
	{
		jesuis_au_taff_a_la_sarl_car_shop_pour_respawn = nil;
		player setVariable["je_suis_au_taff_a_la_sarl_car_shop", nil, true];
		_condition = true;
		
		systemchat "Fin de service pour la sarl CarShop ...";
		hint "Fin de service pour la sarl CarShop ...";
	};
	
	case (!isnil "jesuis_au_taff_a_la_sarl_neomedia") :
	{
		jesuis_au_taff_a_la_sarl_neomedia = nil;
		player setVariable["sarl_neomedia_en_ligne", nil, true];
		_condition = true;
		
		systemchat "Fin de service pour la sarl Néomédia ...";
		hint "Fin de service pour la sarl Néomédia ...";
	};
	
	case (!isnil "jesuis_au_taff_a_la_sarl_pompier") :
	{
		jesuis_au_taff_a_la_sarl_pompier = nil;
		player setVariable["sarl_pompier_en_ligne", nil, true];
		_condition = true;
		
		systemchat "Fin de service pour la sarl Pompier ...";
		hint "Fin de service pour la sarl Pompier ...";
	};
	
	case (!isnil "jesuis_au_taff_a_la_sarl_taxis_gsept") :
	{
		jesuis_au_taff_a_la_sarl_taxis_gsept = nil;
		player setVariable["sarl_taxis_gsept_en_ligne", nil, true];
		_condition = true;
		
		systemchat "Fin de service pour la sarl Taxi G7 ...";
		hint "Fin de service pour la sarl Taxi G7 ...";
	};
	
	case (je_suis_en_service_a_la_sarl_depannage >= 1) :
	{
		je_suis_en_service_a_la_sarl_depannage = 0;
		player setVariable["sarl_depannage_en_ligne", nil, true];
		_condition = true;
		
		systemchat "Fin de service pour la sarl DIR ...";
		hint "Fin de service pour la sarl DIR ...";
	};
	
};

if (!isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then 
{
	player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", nil,true];
};

if (player getvariable "ma_paye_by_sfp_maxou" > 0) then 
{
	player setVariable["ma_paye_by_sfp_maxou", 0,false];
	systemchat "Paye entreprise supprimée ...";
};

if (player getvariable "mes_aides_caf" > 0) then 
{
	player setVariable["mes_aides_caf", 0,false];
	systemchat "Aide Caf entreprise supprimée ...";
};

if (!_condition) then
{
	systemchat "Aucune entreprise affectée actuellement ...";
}else
{
	["1"] execVM "divers\onRespawn_habbit_aleatoire.sqf";
};