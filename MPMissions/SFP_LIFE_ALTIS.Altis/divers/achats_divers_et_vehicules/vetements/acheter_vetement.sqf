// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_selection = _this select 0 select 1;
_ignore_protection = ["Supprimer Habit","Supprimer Lunette","Supprimer Casque","Supprimer Veste","Supprimer Sacs A Dos"];
if (isnil "_selection") exitwith {systemchat "Erreur selection ...";};

_la_classe = liste_boutique_habit_a_afficher select _selection select 0;
_son_prix = liste_boutique_habit_a_afficher select _selection select 1;
_son_nom = liste_boutique_habit_a_afficher select _selection select 2;

switch choix_selection_boutique_habit do
{
	case "habits" :
	{
		if (!isClass (configFile >> "cfgWeapons" >> _la_classe) && !(_la_classe in _ignore_protection)) exitwith {systemchat "Désolé, vous n'avez pas le launcher pour acheter cet habit ! \n\n Télécharger le sur www.sfpteam.fr ...";};

		if (_la_classe == "Supprimer Habit") then
		{
			removeuniform player;
		}else
		{
			player forceadduniform _la_classe;
		};
		
		if (!isnil {liste_boutique_habit_a_afficher select _selection select 3}) then
		{
			sleep 0.1;
			player setobjecttextureglobal (liste_boutique_habit_a_afficher select _selection select 3);
		};
		
		thisprice_uniform = _son_prix;
	};
	
	case "lunettes" :
	{
		if (!isClass (configFile >> "CfgGlasses" >> _la_classe) && !(_la_classe in _ignore_protection)) exitwith {systemchat "Désolé, vous n'avez pas le launcher pour acheter cette paire de lunette ! \n\n Télécharger le sur www.sfpteam.fr ...";};
		if (!(player canAdd _la_classe) && !(_la_classe in _ignore_protection)) exitwith {systemchat "Vous n'avez pas assez de place pour ajouter ces lunettes ...";};

		if (_la_classe == "Supprimer Lunette") then
		{
			removeGoggles player;
		}else
		{
			player addItem _la_classe;
			player assignitem _la_classe;
		};
	};
	
	case "casques" :
	{
		if (!isClass (configFile >> "cfgWeapons" >> _la_classe) && !(_la_classe in _ignore_protection)) exitwith {systemchat "Désolé, vous n'avez pas le launcher pour acheter ce casque ! \n\n Télécharger le sur www.sfpteam.fr ...";};

		if (_la_classe == "Supprimer Casque") then
		{
			removeheadgear player;
		}else
		{
			player addheadgear _la_classe;
		};
		thisprice_bandana = _son_prix;
	};

	case "vestes" :
	{
		if (!isClass (configFile >> "cfgWeapons" >> _la_classe) && !(_la_classe in _ignore_protection)) exitwith {systemchat "Désolé, vous n'avez pas le launcher pour acheter cet veste ! \n\n Télécharger le sur www.sfpteam.fr ...";};

		if (_la_classe == "Supprimer Veste") then
		{
			removevest player;
		}else
		{
			player addvest _la_classe;
		};
		thisprice_vest = _son_prix;
	};
	
	case "sacs à dos" :
	{
		if (!isClass (configFile >> "cfgVehicles" >> _la_classe) && !(_la_classe in _ignore_protection)) exitwith {systemchat "Désolé, vous n'avez pas le launcher pour acheter cet veste ! \n\n Télécharger le sur www.sfpteam.fr ...";};

		if (_la_classe == "Supprimer Sacs A Dos") then
		{
			removebackpack player;
		}else
		{
			removebackpack player;
			
			player addbackpack _la_classe;
		};
		thisprice_sacs_a_dos = _son_prix;
	};
};