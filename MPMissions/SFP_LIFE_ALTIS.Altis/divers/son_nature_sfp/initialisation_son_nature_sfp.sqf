// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 20; !isnil "fin_verification_apres_chargement"};

// Chien, chat, etc
[] spawn
{
	while {sfp_config_activer_son_en_jeu} do
	{
		sleep (random 200);
		
		if (round (random 2) == 1) then
		{
			_liste_son_maison_sfp_maxou = ([["son_nature_tagueule_sfp",4, 0],["son_nature_maison_bris_de_verre_sfp",7, 0],["son_nature_maison_moto_ktm_sfp",20, 0],["son_nature_maison_mobylette_passe_sfp",20, 0],["son_nature_maison_scooter_pars_sfp",30, 0],["son_nature_maison_coup_de_marteau_bois",15, 0],["son_nature_maison_pet_sfp",7, 0],["son_nature_maison_toux_sfp",7, 0],["son_nature_maison_cri_femme_sfp",7, 0],["son_nature_maison_rot_sfp",7, 0],["son_nature_maison_pleure_femme_sfp",20, 0],["son_nature_maison_crie_de_joie_bebe_sfp",7, 0],["son_nature_maison_crachat_sfp",7, 0],["son_nature_maison_baillement_sfp",7, 0],["son_nature_maison_vache_sfp",7, 0],["son_nature_maison_marteau_sfp",0.1, round (1 + random 3)],["son_nature_maison_chat_sfp",1.46, 0],["son_nature_maison_chien_un_sfp",2.35, round (1 + random 3)],["son_nature_maison_chien_deux_sfp",1.80, round (1 + random 3)]]) call bis_fnc_selectrandom; // Sons SFP, Temps SFP, Nombres de repete
			_les_maisons_trouve_sfp_maxou = [];
			{
				if (_x distance player > 100) then
				{
					_les_maisons_trouve_sfp_maxou pushback _x;
				};
			} foreach (nearestObjects [position player, ["House"], 600]);
			
			if (count _les_maisons_trouve_sfp_maxou >= 1) then
			{
				for "_i" from 0 to (_liste_son_maison_sfp_maxou select 2) do
				{
					(_les_maisons_trouve_sfp_maxou select 0) say _liste_son_maison_sfp_maxou;
					sleep ((_liste_son_maison_sfp_maxou select 1) + random 20);
				};
			};
		};
	};
};


// Nature
[] spawn
{
	while {sfp_config_activer_son_en_jeu} do
	{
		sleep (random 100);
		
		if (round (random 2) == 1) then
		{
			_liste_son_nature_sfp_maxou = ([["son_nature_nature_rouge_gorge_sfp",10, round (1 + random 6)],["son_nature_nature_rossignol_sfp",10, round (1 + random 6)],["son_nature_nature_corbeau_sfp",10, round (1 + random 6)],["son_nature_nature_faucon_sfp",10, round (1 + random 6)],["son_nature_nature_merle_sfp",10, round (1 + (random 6))],["son_nature_nature_moineau_sfp",10, round (1 + random 6)],["son_nature_nature_pincon_sfp",10, round (1 + random 6)]]) call bis_fnc_selectrandom; // Sons SFP, Temps SFP, Nombres de repete
			_les_maisons_trouve_sfp_maxou = [];
			{
				if (_x distance player > 100) then
				{
					_les_maisons_trouve_sfp_maxou pushback _x;
				};
			} foreach (nearestObjects [position player, ["House","Animal","Landvehicle"], 500]);
			
			if (count _les_maisons_trouve_sfp_maxou >= 1) then
			{
				for "_i" from 0 to (_liste_son_nature_sfp_maxou select 2) do
				{
					(_les_maisons_trouve_sfp_maxou select 0) say _liste_son_nature_sfp_maxou;
					sleep ((_liste_son_nature_sfp_maxou select 1) + random 20);
				};
			};
		};
	};
};
