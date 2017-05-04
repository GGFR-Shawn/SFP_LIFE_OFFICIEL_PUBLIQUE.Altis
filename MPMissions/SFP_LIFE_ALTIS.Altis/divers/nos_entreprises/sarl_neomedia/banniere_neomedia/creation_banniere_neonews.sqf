// =======================================================================================================================================================================================
														// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
														  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
if (isnil "_this") exitwith {hint "Erreur sur la valeur de diffusion du message !";};
if((ctrlText 1234) == "") exitwith {Hint "! BANNIERE NEOMEDIA ! \n ---------------------------- \n\n Tu n'as tapé aucun titre pour le spot ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 1234) == "                  Taper ici le titre de la news ...") exitwith {Hint "! BANNIERE NEOMEDIA ! \n ---------------------------- \n\n Taper ici le titre de la news ..., ne peut pas être envoyé dans le spot ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 1235) == "") exitwith {Hint "! BANNIERE NEOMEDIA ! \n ---------------------------- \n\n Tu n'as tapé aucun message pour le spot ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 1235) == "                      Taper ici la news ...") exitwith {Hint "! BANNIERE NEOMEDIA ! \n ---------------------------- \n\n Taper ici la news ..., ne peut pas être envoyé dans le spot ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((lbCurSel 4040) == -1) exitwith {Hint "! BANNIERE NEOMEDIA ! \n ---------------------------- \n\n Désolé, tu n'as pas selectionné de temps ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (isnil "securite_timming_envoi_des_messages_neonews") then {securite_timming_envoi_des_messages_neonews = 0;};
if (securite_timming_envoi_des_messages_neonews >= 1) exitwith {Hint "! BANNIERE NEOMEDIA ! \n ---------------------------- \n\n Patiente, tu viens déja d'envoyer un spot ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
cache_hud_dialogue_BIS_AAN = true;

_le_titre_de_la_news_by_maxou = format ["<t size='1.6' color='#F9E4EB'>     ! Information NEOMEDIA Serveur SFP ! (UNIQUE)</t><br /> <t color='#0DCC00'>%1</t>",ctrlText 1234];
_le_titre_de_la_news_by_maxou_formate = parsetext _le_titre_de_la_news_by_maxou;
_le_message_de_la_news_by_maxou = parsetext (format ["                                                                                                                        %1",ctrlText 1235]);
_temps_effacement = (5 + ((lbCurSel 4040) * 5));

if (isnil "_temps_effacement") exitwith {hint "Erreur sur le temps !";};

if (_this select 0 == "1") then
{
	_annonce_neomedia = [_le_titre_de_la_news_by_maxou_formate,_le_message_de_la_news_by_maxou] spawn BIS_fnc_AAN;
	sleep _temps_effacement;
	(uinamespace getvariable "BIS_AAN") closeDisplay 3003;
	cache_hud_dialogue_BIS_AAN = nil;
}else
{
	[[[_le_titre_de_la_news_by_maxou_formate, _le_message_de_la_news_by_maxou, _temps_effacement],"divers\nos_entreprises\sarl_neomedia\banniere_neomedia\envoie_banniere_aux_clients.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	securite_timming_envoi_des_messages_neonews = 1;
	sleep 30;
	securite_timming_envoi_des_messages_neonews = nil;
};