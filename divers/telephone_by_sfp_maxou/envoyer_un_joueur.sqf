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

if((lbCurSel 11173) == -1) exitwith {Hint "! SFP TELECOM ! \n\n Tu dois selectionné un joueur pour cette option ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 11175) == "") exitwith {Hint "! SFP TELECOM ! \n\n Tu n'as tapé aucun message ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 11175) == "Pas d'insultes, ni de spam !") exitwith {Hint "! SFP TELECOM ! \n\n Pas d'insultes, ni de spam, ne peut pas être envoyé à un joueur ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

if (isnil "securite_envoi_texto") then {securite_envoi_texto = 0;};
if (securite_envoi_texto >= 1) exitwith {Hint "! SFP TELECOM ! \n\n Patiente, tu viens déja d'envoyer un message ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
securite_envoi_texto = 1;
[] spawn {sleep 6; securite_envoi_texto = 0;};


if (cbChecked ((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 2801)) then {envoyeurdumessage = "Anonyme ..."; resultat_anonyme = "anonymement (frais de 4000 euros)"; player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - 4000,true]; autorisation_mouvement_argent = true;} else {envoyeurdumessage = name player; resultat_anonyme = "non anonymement";};
affichage_nom_chat = lbtext [11173, lbCurSel 11173];
lemessage = (ctrlText 11175);
if (cbChecked ((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 2800)) then {ma_position_pour_le_chat = mapGridPosition player;}else {ma_position_pour_le_chat = "Non indiqué ..";};

for "_i" from 0 to (count listes_tableaux_chat - 1) do
{
	trouver_personne_du_chat = format ["%1 %2 %3 %4 %5",listes_tableaux_chat select _i select 0, listes_tableaux_chat select _i select 1, listes_tableaux_chat select _i select 2, listes_tableaux_chat select _i select 3, listes_tableaux_chat select _i select 4];
	if (affichage_nom_chat == trouver_personne_du_chat) then {nomdujoueur = listes_tableaux_chat select _i select 0;};
};

publicVariable "ma_position_pour_le_chat";
publicVariable "envoyeurdumessage";
publicVariable "nomdujoueur";
publicVariable "lemessage";

player setvariable ["je_possede_un_telephone_sfp", [(player getvariable "je_possede_un_telephone_sfp" select 0), (player getvariable "je_possede_un_telephone_sfp" select 1), ((player getvariable "je_possede_un_telephone_sfp" select 2) - 1)], true];

_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------- <br/><br/> <t size='1.25' color='#8789F1'>Votre position :</t><br/><br/> <t size='1' color='#02E632'>%1</t>.<br/><br/> <t size='1.25' color='#8789F1'>Votre message :</t><br/><br/> <t size='1' color='#02E632'>%2</t>  <br/><br/> à bien été envoyé à %3, <t size='1' color='#FC1400'>%4</t> !<br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",ma_position_pour_le_chat, lemessage, nomdujoueur, resultat_anonyme];
hint _encouleur;


// =======================================================================================================================================================================================
															  // HISTORIQUE SMS //
// =======================================================================================================================================================================================
private "_statut_anonyme";

if (envoyeurdumessage == "Anonyme ...") then {_statut_anonyme = "a été envoyé anonymement ...";}else{_statut_anonyme = "n'as pas été envoyé anonymement.";};
_heure_du_message = format ["%1/%2/%3 à %4H%5Min (Arma : %6) :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_message = format ["%1 (position : %2 et date de naissance : %3) à envoyé à %4 : ----- %5 ---- Le message %6",name player, mapGridPosition player, player getvariable "ma_date_de_naissance", nomdujoueur, lemessage, _statut_anonyme];
["Historique chat SMS en jeu", "Historique chat SMS en jeu", _heure_du_message, _detail_du_message] call fn_SaveToServer;
