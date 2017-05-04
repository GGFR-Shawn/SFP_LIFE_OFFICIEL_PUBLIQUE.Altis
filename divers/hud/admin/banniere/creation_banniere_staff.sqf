// =======================================================================================================================================================================================
														// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
														  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
if (isnil "_this") exitwith {hint "Erreur sur la valeur de diffusion du message !";};
if((ctrlText 1234) == "") exitwith {Hint "! BANNIERE STAFF ! \n ---------------------------- \n\n Tu n'as tapé aucun titre pour le message du STAFF ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 1234) == "                  Taper ici le titre de modération ...") exitwith {Hint "! BANNIERE STAFF ! \n ---------------------------- \n\n Taper ici le titre de modération ..., ne peut pas être envoyé dans le message du STAFF ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 1235) == "") exitwith {Hint "! BANNIERE STAFF ! \n ---------------------------- \n\n Tu n'as tapé aucun message pour le message du STAFF ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 1235) == "                      Taper ici le message de modération ...") exitwith {Hint "! BANNIERE STAFF ! \n ---------------------------- \n\n Taper ici message de modération ..., ne peut pas être envoyé dans le message du STAFF ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((lbCurSel 4040) == -1) exitwith {Hint "! BANNIERE STAFF ! \n ---------------------------- \n\n Désolé, tu n'as pas selectionné de temps ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (isnil "securite_timming_envoi_des_messages_staff") then {securite_timming_envoi_des_messages_staff = 0;};
if (securite_timming_envoi_des_messages_staff >= 1) exitwith {Hint "! BANNIERE STAFF ! \n ---------------------------- \n\n Patiente, tu viens déja d'envoyer un message du STAFF ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
cache_hud_dialogue_BIS_AAN = true;

_temps_effacement = (20 + ((lbCurSel 4040) * 20));
_le_titre_du_message_staff_by_maxou = format ["<t size='1.6' color='#F9E4EB'>     ! Information STAFF Serveur SFP ! (UNIQUE)</t><br /> <t color='#0DCC00'>%1</t>",ctrlText 1234];
_le_titre_du_message_staff_by_maxou_formate = parsetext _le_titre_du_message_staff_by_maxou;
_le_message_staff_by_maxou = parsetext (format ["                                                                                                                        (Suppression dans %1 Secondes.) %2",_temps_effacement, ctrlText 1235]);

if (isnil "_temps_effacement") exitwith {hint "Erreur sur le temps !";};

if (_this select 0 == "1") then
{
	_annonce_staff = [_le_titre_du_message_staff_by_maxou_formate,_le_message_staff_by_maxou] spawn BIS_fnc_AAN;
	sleep _temps_effacement;
	(uinamespace getvariable "BIS_AAN") closeDisplay 3003;
	cache_hud_dialogue_BIS_AAN = nil;
}else
{
	[[[_le_titre_du_message_staff_by_maxou_formate, _le_message_staff_by_maxou, _temps_effacement],"divers\nos_entreprises\sarl_neomedia\banniere_neomedia\envoie_banniere_aux_clients.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	securite_timming_envoi_des_messages_staff = 1;
	sleep 60;
	securite_timming_envoi_des_messages_staff = nil;
};