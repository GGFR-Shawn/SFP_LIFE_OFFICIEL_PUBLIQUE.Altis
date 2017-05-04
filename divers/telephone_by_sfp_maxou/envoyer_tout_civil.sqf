// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

envoyeurdumessage = "";
resultat_anonyme = "non anonymement";
if (getPlayerUID player in whitelist_sarl_et_furious) then {envoyeurdumessage = "ALTIS && FURIOUS";};
if (!isnil "jesuis_au_taff_a_la_sarl_autoecole") then {envoyeurdumessage = "AUTO ECOLE";};
if (!isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then {envoyeurdumessage = "CAR SHOP";};
if (!isnil "jesuis_au_taff_a_la_sarl_neomedia") then {envoyeurdumessage = "NEOMEDIA";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then {envoyeurdumessage = "LES POMPIERS";};
if (!isnil "jesuis_au_taff_a_la_sarl_taxis_gsept") then {envoyeurdumessage = "LE TAXI G7";};
if (je_suis_en_service_a_la_sarl_depannage >= 1) then {envoyeurdumessage = "LA DIR";};
if (revive_mon_side == west) then {envoyeurdumessage = "LA GENDARMERIE";};

if (envoyeurdumessage == "") exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, cette fonction à été désactivé depuis le 01/03/2016 suite au sondage sur le forum ! \n\n Elle n'est disponible que pour les entreprises et la gendarmerie. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";}; 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (isnil {player getvariable "je_possede_un_telephone_sfp"}) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 1 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, votre téléphone est eteint ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 2 <= 0) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez plus de SMS ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (blackout_reseau_telecom > 0) exitwith {Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Désolé, un black-out réseau est en cours ! \n\n Réparation estimé : %1 Minutes. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr",round (blackout_reseau_telecom)];};
if (force_du_signal_telephone_by_maxou < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de reseaux ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

if((ctrlText 11175) == "Pas d'insultes, ni de spam !") exitwith {Hint "! SFP TELECOM ! \n ----------------------------\n\n Pas d'insultes, ni de spam, ne peut pas être envoyé à tous les gendarmes ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 11175) == "") exitwith {Hint "! SFP TELECOM ! \n ----------------------------\n\n Tu n'as tapé aucun message ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

if (isnil "securite_envoi_texto") then {securite_envoi_texto = 0;};
if (securite_envoi_texto >= 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Patiente, tu viens déja d'envoyer un message ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
securite_envoi_texto = 1;
[] spawn {sleep 6;securite_envoi_texto = 0;};


if (cbChecked ((uiNamespace getVariable "Menu_tablette_sfp_Tchat_By_Maxou") displayCtrl 2800)) then {ma_position_pour_le_chat = mapGridPosition player;}else {ma_position_pour_le_chat = "Non indiqué ..";};
publicVariable "ma_position_pour_le_chat";
publicVariable 'envoyeurdumessage';
lemessageatoutcivil = (ctrlText 11175);
publicVariable 'lemessageatoutcivil';
closedialog 0;

player setvariable ["je_possede_un_telephone_sfp", [(player getvariable "je_possede_un_telephone_sfp" select 0), (player getvariable "je_possede_un_telephone_sfp" select 1), ((player getvariable "je_possede_un_telephone_sfp" select 2) - 1)], true];

_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------- <br/><br/> <t size='1.25' color='#8789F1'>Votre position :</t><br/><br/> <t size='1' color='#02E632'>%1</t>.<br/><br/> <t size='1.25' color='#8789F1'>Votre message :</t><br/><br/> <t size='1' color='#02E632'>%2</t>  <br/><br/> à bien été envoyé à tous les civils <t size='1' color='#FC1400'>%3</t>. <br/><br/> Il recevront le message comme expéditeur : <t size='1' color='#02E632'>%4</t> !<br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",ma_position_pour_le_chat, lemessageatoutcivil,resultat_anonyme, envoyeurdumessage];
hint _encouleur;


// =======================================================================================================================================================================================
															  // HISTORIQUE SMS //
// =======================================================================================================================================================================================
private "_statut_anonyme";

if (envoyeurdumessage == "Anonyme ...") then {_statut_anonyme = "a été envoyé anonymement ...";}else{_statut_anonyme = "n'as pas été envoyé anonymement.";};
_heure_du_message = format ["%1/%2/%3 à %4H%5Min (Arma : %6) :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_message = format ["%1 (position : %2 et date de naissance : %3) à envoyé à tous les civils le message : ----- %4 ---- Le message %5",name player, mapGridPosition player, player getvariable "ma_date_de_naissance", lemessageatoutcivil, _statut_anonyme];
["Historique chat SMS en jeu", "Historique chat SMS en jeu", _heure_du_message, _detail_du_message] call fn_SaveToServer;