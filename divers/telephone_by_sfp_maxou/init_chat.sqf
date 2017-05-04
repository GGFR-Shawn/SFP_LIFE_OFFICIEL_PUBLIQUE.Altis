// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil {player getvariable "je_possede_un_telephone_sfp"}) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 1 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, votre téléphone est eteint ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 2 <= 0) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez plus de SMS ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (blackout_reseau_telecom > 0) exitwith {Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Désolé, un black-out réseau est en cours ! \n\n Réparation estimé : %1 Minutes. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr",round (blackout_reseau_telecom)];};
if (force_du_signal_telephone_by_maxou < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de reseaux ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
waituntil {!isnil "mon_repertoire_de_telephone"};

private ["_son_travail","_staff_chat","_listes_des_joueurs","_couleur_choisit_affichage_joueur","_side_choisit","_etat_du_telephone"];
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

Hint "! SFP TELECOM ! \n ---------------------------- \n\n Attention, \n Les joueurs sans téléphone ne sont pas affichés ! \n\n Ceux avec le téléphone eteint iront directement dans leur historique ! \n\n Sache également que depuis le 01/03/2016, il faut que la personne vous à donné son numéro pour la voir ici ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";

createdialog "Menu_tablette_sfp_Tchat_By_Maxou";
((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 1009) ctrlSetTextColor [0,0.91,0.07,1];
((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 1009) ctrlSetText format ["%1", player getvariable "mon_numero_de_telephone"];

_listes_des_joueurs = -1;
listes_tableaux_chat = [];
_liste_de_mes_numero = []; {_liste_de_mes_numero pushback (_x select 0);} foreach mon_repertoire_de_telephone;

{
	if (isPlayer _x && _x != player) then 
	{
		if (!isnil {_x getvariable "je_possede_un_telephone_sfp"}) then
		{		
			if (_x getvariable "je_possede_un_telephone_sfp" select 0 >= 1) then
			{
				if (_x getvariable "mon_numero_de_telephone" in _liste_de_mes_numero) then
				{				
					_son_travail = ""; 
					_staff_chat = ""; 
					_side_choisit = "";
					_etat_du_telephone = "(Tel allume)";
					_listes_des_joueurs = round (_listes_des_joueurs + 1);
					_couleur_choisit_affichage_joueur = [1,1,1,1];
					
					if (_x getvariable "ma_date_de_naissance" < 600) then {_couleur_choisit_affichage_joueur = [1,1,1,1];}else{_couleur_choisit_affichage_joueur = [0.01,0.79,0.36,1];};
					if (getplayeruid _x in sfp_config_liste_admin) then {_staff_chat = "(ADMIN)"; _couleur_choisit_affichage_joueur = [0.98,0.05,0,1];};
					if (getplayeruid _x in sfp_config_liste_moderateur) then {_staff_chat = "(MODO)"; _couleur_choisit_affichage_joueur = [0.98,0.05,0,1];};
					
					if (side _x == civilian) then {_side_choisit = "(Civil)";} else {_side_choisit = "(Gendarme)";};
					
					if (!isnil {_x getvariable "sarl_taxis_gsept_en_ligne"}) then {_son_travail = "(Taxi G7)";};
					if (!isnil {_x getvariable "sarl_neomedia_en_ligne"}) then {_son_travail = "(Neomedia)";};
					if (!isnil {_x getvariable "sarl_avocat_en_ligne"}) then {_son_travail = "(Avocat)";};
					if (!isnil {_x getvariable "sarl_autoecole_en_ligne"}) then {_son_travail = "(AutoEcole)";};
					if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {_son_travail = "(Depanneur)";};
					if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then {_son_travail = "(SDIS)";};
					
					if (_x getvariable "je_possede_un_telephone_sfp" select 1 < 1) then {_etat_du_telephone = "(Tel eteint)";};
					
					listes_informations = [name _x] + [_side_choisit] + [_son_travail] + [_staff_chat] + [_etat_du_telephone];
					listes_tableaux_chat = listes_tableaux_chat + [listes_informations];
					
					lbAdd [11173, format ["%1 %2 %3 %4 %5",listes_informations select 0, listes_informations select 1, listes_informations select 2, listes_informations select 3, listes_informations select 4]];
					lbSetColor [11173, _listes_des_joueurs, _couleur_choisit_affichage_joueur];
					((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 11173) lbSetTooltip [_listes_des_joueurs, format['Son temps de jeu est de %1 Heures.', round ((_x getvariable "ma_date_de_naissance") / 60)]];
					lbSort [((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 11173), "ASC"];
				};
			};
		};
	};
}forEach playableUnits;

if (count listes_tableaux_chat < 1) then
{
	lbAdd [11173, "Personne n'est connecté ou votre répertoire est vide ..."];		
	lbSetColor [11173, 0, [0.98,0.05,0,1]];
};

waituntil {!dialog;};
cutText["","BLACK IN"];