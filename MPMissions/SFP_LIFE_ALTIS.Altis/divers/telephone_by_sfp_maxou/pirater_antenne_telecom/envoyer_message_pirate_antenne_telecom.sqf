// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if((ctrlText 11175) == "Pas d'insultes, ni de spam !") exitwith {Hint "! SFP TELECOM ! \n ----------------------------\n\n Pas d'insultes, ni de spam, ne peut pas être envoyé au peuple de Altis ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((ctrlText 11175) == "") exitwith {Hint "! SFP TELECOM ! \n ----------------------------\n\n Tu n'as tapé aucun message ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (!isnil "securite_envoi_texto_antenne_piratee") exitwith {Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Patiente, encore %1 secondes avant d'envoyer de nouveau un message ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", securite_envoi_texto_antenne_piratee];};

[] spawn 
{
	for "_i" from 0 to 600 do
	{
		securite_envoi_texto_antenne_piratee = round (600 - _i);
		sleep 1;
	};
	securite_envoi_texto_antenne_piratee = nil;
	systemchat "Vous pouvez de nouveau envoyer un message piraté sur les antennes SFP Télécom ...";
};

[[[(ctrlText 11175)],"divers\telephone_by_sfp_maxou\pirater_antenne_telecom\synchronisation_envoyer_message_pirate_antenne_telecom.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

closedialog 0;

sleep 3;

_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------- <br/><br/> <t size='1.25' color='#8789F1'>Votre position :</t><br/><br/> <t size='1' color='#02E632'>Non indiquée</t>.<br/><br/> <t size='1.25' color='#8789F1'>Votre message :</t><br/><br/> <t size='1' color='#02E632'>%1</t>  <br/><br/> à bien été envoyé au peuple de Altis anonymement par cette antenne piratée. <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr", (ctrlText 11175)];
hint _encouleur;

// =======================================================================================================================================================================================
															  // HISTORIQUE SMS //
// =======================================================================================================================================================================================
_heure_du_message = format ["%1/%2/%3 à %4H%5Min (Arma : %6) :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_message = format ["%1 à envoyé par antenne piraté : ----- %1.",name player, (ctrlText 11175)];
["Historique chat SMS Antenne pirate", "Historique chat SMS Antenne pirate", _heure_du_message, _detail_du_message] call fn_SaveToServer;