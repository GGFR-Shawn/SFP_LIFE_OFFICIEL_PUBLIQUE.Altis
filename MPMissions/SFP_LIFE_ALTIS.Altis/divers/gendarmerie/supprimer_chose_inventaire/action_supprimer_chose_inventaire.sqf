// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_choix_choisit = _this select 0 select 1;
_sur_quoi = sur_quoi_supprimer_gendarme;
if (isnil "_choix_choisit" or isnil "_sur_quoi") exitwith {hint "Erreur sur le choix, recommence ...";};

hint str _choix_choisit;

switch _choix_choisit do
{
	// Farming Légal
	case 0 :
	{
		[_sur_quoi,["0"]] spawn supprimer_inventaire_farming_etc;
	};
	
	// Farming Illégal
	case 1 :
	{
		[_sur_quoi,["1"]] spawn supprimer_inventaire_farming_etc;		
	};
	
	// Farming Légal + Illégal
	case 2 :
	{
		[_sur_quoi,["0","1"]] spawn supprimer_inventaire_farming_etc;
		systemchat format ["Inventaire légal et illégal de %1 vidés ...", typeof _sur_quoi];
	};
	
	// Puce Véhicule
	case 3 :
	{
		if (!isnil {_sur_quoi getvariable "voiture_possede_une_puce"}) then 
		{
			_sur_quoi setvariable ["voiture_possede_une_puce", nil,true];
			
			systemchat format ["Puce de %1 supprimée ...", typeof _sur_quoi];
			titletext [format["Puce de %1 supprimée ...", typeof _sur_quoi], "PLAIN"];
		}else
		{
			systemchat format ["Pas de puce sur %1 ...", typeof _sur_quoi];
			titletext [format["Pas de puce sur %1 ...", typeof _sur_quoi], "PLAIN"];			
		};
	};
	
	// Détecteur de radar
	case 4 :
	{
		if (!isnil {_sur_quoi getvariable "voiture_possede_un_detecteur_de_radar"}) then 
		{
			_sur_quoi setvariable ["voiture_possede_un_detecteur_de_radar", nil,true];

			systemchat format ["Détecteur de radar de %1 supprimée ...", typeof _sur_quoi];
			titletext [format["Détecteur de radar de %1 supprimée ...", typeof _sur_quoi], "PLAIN"];
		}else
		{
			systemchat format ["Pas de détecteur de radar sur %1 ...", typeof _sur_quoi];
			titletext [format["Pas de détecteur de radar sur %1 ...", typeof _sur_quoi], "PLAIN"];			
		};
	};
	
	// Used Space et totalspace
	case 5 :
	{
		_lancement_initilisation_inventaire = [_sur_quoi] execvm "config\tailles_des_inventaires_des_vehicules.sqf";
		waitUntil {scriptDone _lancement_initilisation_inventaire;};

		if (valeur_de_l_inventaire_vehicule_a_appliquer != 0) then
		{
			if (_sur_quoi getvariable "usedspace" > 0) then
			{
				_type = typeOf _sur_quoi; 
				_prime_inventaire_gendarme = round (random 10000); 
				
				hint format ["! MENU SUPPRESSION GENDARMES ! \n ---------------------- \n\n Le véhicule à bien été vidé de son inventaire. Une prime de %1 %2 vous à été octroyé ! \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou", _prime_inventaire_gendarme,"€"]; 
				
				player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + _prime_inventaire_gendarme,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				
				_sur_quoi setVariable["usedspace",0,true];
				_sur_quoi setVariable["totalspace",valeur_de_l_inventaire_vehicule_a_appliquer,true];
			}else
			{
				hint "! MENU SUPPRESSION GENDARMES ! \n ---------------------- \n\n Désolé, \n Il n'y à rien dans le véhicule ! \n\n ---------------------- \n www.sfpteam.fr \n By SFP Maxou"; 
			};
		}else
		{
			systemchat format ["Pas d'inventaire sur %1 ...", typeof _sur_quoi];
			titletext [format["Pas d'inventaire sur %1 ...", typeof _sur_quoi], "PLAIN"];			
		};
	};
};

