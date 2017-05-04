// =======================================================================================================================================================================================
					// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
					  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = _this select 0;
if (isnil "_condition") exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Erreur sur le choix recommence ... \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (!hasInterface) exitwith {};

switch _condition do
{
	case "0" : // Donner Numéro Initialisation tableau
	{
		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
		Hint "! SFP TELECOM ! \n ---------------------------- \n\n Attention, \n Les joueurs sans téléphone ne sont pas affichés ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";
		
		createdialog "Menu_tablette_sfp_Donner_Numero_De_Telephone";
		((uiNamespace getVariable "Menu_tablette_sfp_Donner_Numero_De_Telephone") displayCtrl 1009) ctrlSetTextColor [0,0.91,0.07,1];
		((uiNamespace getVariable "Menu_tablette_sfp_Donner_Numero_De_Telephone") displayCtrl 1009) ctrlSetText format ["%1", player getvariable "mon_numero_de_telephone"];

		_listes_des_joueurs = -1;
		{
			if (isPlayer _x && _x != player) then 
			{
				if (!isnil {_x getvariable "je_possede_un_telephone_sfp"}) then
				{		
					if (_x getvariable "je_possede_un_telephone_sfp" select 0 >= 1) then
					{
						_listes_des_joueurs = round (_listes_des_joueurs + 1);
						
						lbAdd [11173, format ["%1",name _x]];
						((uiNamespace getVariable "Menu_tablette_sfp_Donner_Numero_De_Telephone") displayCtrl 11173) lbSetTooltip [_listes_des_joueurs, "Double clique pour lui donner ton numéro !"];
						lbSetColor [11173, _listes_des_joueurs, [0,0.91,0.07,1]];
						lbSort [((uiNamespace getVariable "Menu_tablette_sfp_Donner_Numero_De_Telephone") displayCtrl 11173), "ASC"];
					};
				};
			};
		}forEach playableUnits;

		if (_listes_des_joueurs < 0) then
		{
			lbAdd [11173, "Aucune personne avec un téléphone de trouvé ..."];		
			lbSetColor [11173, 0, [0.98,0.05,0,1]];
		};
	};
	case "1" : // Changer Numéro
	{
		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		if (!isnil "protection_spam_numero") exitwith {hint "Vous avez déja changé votre numéro, vous pourrez de nouveau le faire à votre prochaine connexion.";};
		protection_spam_numero = true;
		
		_cree_nouveau_numero = format ['06%1%2%3%4%5%6%7%8', round (random 9),round (random 9),round (random 9),round (random 9),round (random 9),round (random 9),round (random 9),round (random 9)]; 
		mon_repertoire_de_telephone = [];
		mon_repertoire_de_telephone set [0,[_cree_nouveau_numero, name player]];
		player setvariable ["mon_numero_de_telephone", _cree_nouveau_numero, true];
		
		['mon_repertoire_de_telephone', mon_repertoire_de_telephone] call uid_sauvegarde_ecrire_local_joueur_sfp;
		['mon_numero_de_telephone', _cree_nouveau_numero] call uid_sauvegarde_ecrire_local_joueur_sfp;

		((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 1009) ctrlSetTextColor [0,0.91,0.07,1];
		((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 1009) ctrlSetText format ["%1", player getvariable "mon_numero_de_telephone"];
		
		Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Bonjour, votre nouveau numéro de téléphone est %1. \n\n Toute personne possédant votre ancien numéro ne pourra plus vous contacter ... \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", player getvariable "mon_numero_de_telephone"];
	
		closedialog 0;
		execvm 'divers\tablette_sfp\menu_telephone_tablette_sfp.sqf';
	};
	case "2" : // Donner Numéro Initialisation action
	{
		_a_qui_donner_numero = lbText [11173, _this select 1 select 1];
		_mon_numero_de_tel = player getvariable "mon_numero_de_telephone";
		
		if((lbCurSel 11173) == -1) exitwith {Hint "! SFP TELECOM ! \n\n Tu dois selectionné un joueur pour cette option ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		if((_a_qui_donner_numero) == "Aucune personne avec un téléphone de trouvé ...") exitwith {Hint "! SFP TELECOM ! \n\n Opération impossible ! Personne n'a été trouvé ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
		closedialog 0;
	
		Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Bonjour, votre numéro de téléphone %1 à bien été donné à %2 ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", _mon_numero_de_tel, _a_qui_donner_numero];
		
		[[["3", _a_qui_donner_numero, _mon_numero_de_tel, name player],"divers\telephone_by_sfp_maxou\donner_ou_changer_numero_de_tel.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;		
	};
	case "3" : // Synchro sur client pour lui ajouter mon numero
	{
		_le_joueur_qui_recoit_le_numero = _this select 1;
		_le_numero_de_telephone = _this select 2;
		_qui_la_donne = _this select 3;
		_liste_de_mes_numero = []; {_liste_de_mes_numero pushback (_x select 0);} foreach mon_repertoire_de_telephone;
		if (isnil "_le_joueur_qui_recoit_le_numero" or isnil "_le_numero_de_telephone" or isnil "_qui_la_donne") exitwith {hint "Erreur reception d'un numéro de téléphone ...";};
		if (name player != _le_joueur_qui_recoit_le_numero) exitwith {};
		if (_le_numero_de_telephone in _liste_de_mes_numero) exitwith {Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Bonjour, \n\n %1 vous à donné son numéro de téléphone %2. \n\n Celui ci etait déja dans votre répertoire. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", _qui_la_donne, _le_numero_de_telephone];};

		mon_repertoire_de_telephone pushback [_le_numero_de_telephone, _qui_la_donne];
		['mon_repertoire_de_telephone', mon_repertoire_de_telephone] call uid_sauvegarde_ecrire_local_joueur_sfp;

		Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Bonjour, \n\n %1 vous à donné son numéro de téléphone %2. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", _qui_la_donne, _le_numero_de_telephone];
	};
	case "4" : // Supprimer Mon Repertoire Téléphonique
	{
		if (!isnil "mon_repertoire_de_telephone_vide") exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Bonjour, \n\n Votre répertoire téléphonique à déja été vidé ... \n\n Attendez le prochain reboot ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		mon_repertoire_de_telephone_vide = true;
		
		_mon_numero_de_base = mon_repertoire_de_telephone select 0;
		mon_repertoire_de_telephone = [];
		mon_repertoire_de_telephone pushback _mon_numero_de_base;
		['mon_repertoire_de_telephone', mon_repertoire_de_telephone] call uid_sauvegarde_ecrire_local_joueur_sfp;
		
		Hint "! SFP TELECOM ! \n ---------------------------- \n\n Bonjour, \n\n Votre répertoire téléphonique à bien été vidé. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";
	
		closedialog 0;
		execvm "divers\telephone_by_sfp_maxou\mon_repertoire_telephonique.sqf";
	};
};