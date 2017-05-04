// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNil "bis_fnc_init"};
waitUntil {alive player};

private ["_habbitauhasard","_tenue_trouve"];
_condition = _this select 0;
_tenue_trouve = false;
if (isnil "_condition") exitwith {hint "Erreur condition habits ...";};

switch _condition do
{
	case "1" :
	{
		// =========================================================================================================================================================================================
		if (!isnil "je_suis_whiteliste_psig" or revive_mon_side == civilian) then 
		{
			_habbitauhasard = ["U_C_Poor_2","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_C_Commoner_shorts","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2","U_C_Poor_1","U_O_OfficerUniform_ocamo","U_BG_Guerrilla_6_1","U_C_Driver_1_black","U_BG_Guerilla1_1","U_I_G_Story_Protagonist_F","U_BG_leader"];

			if (isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then
			{
				if (isnil "compil_habits_civil") then {execvm "config\compilation_habits.sqf"; waitUntil {!isnil "compil_habits_civil"};};
				for "_i" from 0 to (count compil_habits_civil - 1) do
				{
					[_habbitauhasard, (compil_habits_civil select _i select 0)] call BIS_fnc_arrayPush;				
				};
				_habbitauhasard = _habbitauhasard - ["Supprimer Habit"];
			};
			
			switch (round (random 1)) do
			{
				removeUniform player;
				
				// Normal
				case 0 :
				{
					_appliquer_habbit = _habbitauhasard call BIS_fnc_selectRandom;
					player forceAddUniform _appliquer_habbit;
				};
				// Avec Skins
				case 1 :
				{
					switch (round (random 1)) do
					{
						case 0 :
						{
							removeUniform player;
							sleep 0.1;
							player forceAddUniform "U_Rangemaster";
							sleep 1;
							_texture = ["textures\habit_carreaux_sfp.jpg","textures\habit_noire_sfp.jpg","textures\habbit_rouge.jpg","textures\habbit_vert.jpg","textures\habbit_blanc.jpg","textures\C_Polo_Dalton.jpg"] call bis_fnc_selectrandom;
							player setObjectTexture [0, _texture];
						};
						
						case 1 :
						{
							removeUniform player;
							sleep 0.1;
							player forceAddUniform "U_C_Poloshirt_redwhite";
							sleep 1;
							_texture = ["textures\habit_chat.jpg","textures\habit_loup.jpg","textures\habit_nuage.jpg","textures\habit_ourse.jpg","textures\habit_pikachu.jpg","textures\habit_tigre.jpg","textures\habit_main.jpg"] call bis_fnc_selectrandom;
							player setObjectTexture [0, _texture];
						};
					};
				};
			};
		};
	};
};
		
if (!isnil "fin_check_respawn_habit_aleatoire") then
{
	// PSIG
	if (!isnil "je_suis_whiteliste_psig") then 
	{
		Systemchat "Tenue PSIG appliquée."; 
		player removeWeapon "NVGoggles";
		player addHeadGear "Casquette_Gendarmerie_SFP";
		player forceAddUniform "TRYK_U_B_BLKBLK_R_CombatUniform";
		_tenue_trouve = true;
	};
	// Gendarmes
	if (!isnil "je_suis_whiteliste_gendarme") then 
	{
		Systemchat "Tenue gendarme appliquée."; 
		player removeWeapon "NVGoggles";
		player addHeadGear "Casquette_Gendarmerie_SFP"; sleep 0.045; 
		player forceAddUniform "U_B_CTRG_3"; sleep 1; 
		player setObjectTextureGlobal [0, "textures\habit_gendarme_polaire.jpg"];
		_tenue_trouve = true;
	};
	// GIGN
	if (!isnil "je_suis_whiteliste_GIGN") then 
	{
		Systemchat "Tenue GIGN appliquée."; 
		player removeWeapon "NVGoggles"; 
		player addHeadGear "H_HelmetB_GIGN"; 
		player forceAddUniform "U_B_CTRG_1"; sleep 1; 
		player setObjectTextureGlobal [0,"textures\tenue_gign.jpg"]; 
		_tenue_trouve = true;
		
		if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then 
		{
			player addVest "V_TacVest_blk_POLICE";
		}else
		{
			player addVest "V_TacVest_GIGN_SFP";
		};
	};
	// SARL Depannage
	if (je_suis_en_service_a_la_sarl_depannage >= 1) then 
	{
		Systemchat "Tenue DIR appliquée."; 
		player forceAddUniform "U_Rangemaster";sleep 1;
		player setObjectTextureGlobal [0, "textures\habbit_dde.jpg"];
		_tenue_trouve = true;
	};
 	// Car Shop
	if (!isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then 
	{
		Systemchat "Tenue CAR SHOP appliquée."; 
		player forceAddUniform "U_Rangemaster";sleep 1;
		player setObjectTextureGlobal [0, "textures\habit_car_shop.jpg"];
		_tenue_trouve = true;
	};
	// Pompiers
	if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then 
	{
		Systemchat "Tenue POMPIER appliquée."; 
		player forceAddUniform "U_BG_Guerilla2_3";sleep 1;
		player setObjectTextureGlobal [0, "textures\habbit_pompier.jpg"];
		_tenue_trouve = true;
	};
	
	if (_condition == "2") then
	{
		if !(_tenue_trouve) then
		{
			Systemchat "Aucune tenue trouvée à vous appliquer ..."; 
		};
	};
};

fin_check_respawn_habit_aleatoire = 1;