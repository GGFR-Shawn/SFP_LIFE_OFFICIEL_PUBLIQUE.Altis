//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


waitUntil {alive player};
waituntil {!isnil "fin_verification_apres_chargement"};
waituntil {sleep 1; isnil {player getvariable "besoin_d_un_revive_news"}};
sleep 60;

_check_si_amende = player getvariable "montant_de_l_amende";
_check_si_amende_deux = player getvariable "message_amende";
_check_si_amende_trois = player getvariable "historique_nombre_amende";

if (_check_si_amende >= 1) then
{
	titletext ["Vous avez recu une amende ! \n Consultez le message en haut à droite !","PLAIN DOWN"];
	
	player setvariable ["montant_de_l_amende",0,false];
	player setvariable ["message_amende","aucun",false];
	player setvariable ["historique_nombre_amende",(player getvariable "historique_nombre_amende") + 1,false];
	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - _check_si_amende,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	
	[uid_pour_mettre_amende, uid_pour_mettre_amende, "Montant de l amende", 0] call fn_SaveToServer;
	[uid_pour_mettre_amende, uid_pour_mettre_amende, "Message amende", "aucun"] call fn_SaveToServer;
	[uid_pour_mettre_amende, uid_pour_mettre_amende, "Historique nombre amende", player getvariable ["historique_nombre_amende", 0]] call fn_SaveToServer;

	if (_check_si_amende_deux == "aucun") then 
	{
		hint format ["Bonjour, \n Vous vous êtes prit une amende de %1 Euros lorsque vous etiez indisponible ! Vous comptabilisez au total %2 amendes !\n\n Pour plus d'information, www.sfpteam.fr !",_check_si_amende,round (_check_si_amende_trois + 1)];
		sleep 1;
		hint format ["Bonjour, \n Vous vous êtes prit une amende de %1 Euros lorsque vous etiez indisponible ! Vous comptabilisez au total %2 amendes !\n\n Pour plus d'information, www.sfpteam.fr !",_check_si_amende,round (_check_si_amende_trois + 1)];
		sleep 3;
		hint format ["Bonjour, \n Vous vous êtes prit une amende de %1 Euros lorsque vous etiez indisponible ! Vous comptabilisez au total %2 amendes !\n\n Pour plus d'information, www.sfpteam.fr !",_check_si_amende,round (_check_si_amende_trois + 1)];
	};
	if (_check_si_amende_deux != "aucun") then 
	{
		hint format ["Bonjour, \n\n Vous vous êtes prit une amende de %1 Euros lorsque vous etiez indisponible ! \n\n Voici la raison : \n\n %2 \n\n Vous comptabilisez au total %3 amendes ! \n -------------------------------------- \n Pour plus d'information, www.sfpteam.fr !",_check_si_amende,_check_si_amende_deux,round (_check_si_amende_trois + 1)];	
		sleep 3;
		hint format ["Bonjour, \n\n Vous vous êtes prit une amende de %1 Euros lorsque vous etiez indisponible ! \n\n Voici la raison : \n\n %2 \n\n Vous comptabilisez au total %3 amendes ! \n -------------------------------------- \n Pour plus d'information, www.sfpteam.fr !",_check_si_amende,_check_si_amende_deux,round (_check_si_amende_trois + 1)];	
		sleep 3;
		hint format ["Bonjour, \n\n Vous vous êtes prit une amende de %1 Euros lorsque vous etiez indisponible ! \n\n Voici la raison : \n\n %2 \n\n Vous comptabilisez au total %3 amendes ! \n -------------------------------------- \n Pour plus d'information, www.sfpteam.fr !",_check_si_amende,_check_si_amende_deux,round (_check_si_amende_trois + 1)];	
	};

	
	// Que pour staff
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min %6:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
	_detail_log = format ["à prit une amende de %1 Euros, il en est à sa %2 ieme amende ! Le message %3",_check_si_amende, _check_si_amende_deux, _check_si_amende_trois];
	["Historique Amende mit", "Listes Des Amendes", _heure_du_log, _detail_log] call fn_SaveToServer;
};

fin_message_amende_valide = 1;