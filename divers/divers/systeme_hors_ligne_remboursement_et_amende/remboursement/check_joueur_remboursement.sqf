//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


waitUntil {alive player};
waituntil {!isnil "fin_verification_apres_chargement"};
waituntil {sleep 1; isnil {player getvariable "besoin_d_un_revive_news"}};
sleep 40;

_check_si_remboursement = player getvariable "montant_du_remboursement";
_check_si_remboursement_deux = player getvariable "message_du_remboursement";
_check_si_remboursement_trois = player getvariable "historique_nombre_remboursement";

if (_check_si_remboursement >= 1) then
{
	j_ai_recu_un_remboursement_protection_hack = 1;
	
	titletext ["Vous avez recu un remboursement ! \n Consultez le message en haut à droite !","PLAIN DOWN"];
	
	player setvariable ["montant_du_remboursement",0,false];
	player setvariable ["message_du_remboursement","aucun",false];
	player setvariable ["historique_nombre_remboursement",(player getvariable "historique_nombre_remboursement") + 1,false];
	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + _check_si_remboursement,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	
	[uid_pour_remboursement, uid_pour_remboursement, "Montant du remboursement", 0] call fn_SaveToServer;
	[uid_pour_remboursement, uid_pour_remboursement, "Message remboursement", "aucun"] call fn_SaveToServer;
	[uid_pour_remboursement, uid_pour_remboursement, "Historique nombre remboursement", player getvariable ["historique_nombre_remboursement", 0]] call fn_SaveToServer;

	if (_check_si_remboursement_deux == "aucun") then 
	{
		hint format ["Bonjour, \n Vous venez d'être remboursé de %1 Euros lorsque vous etiez indisponible ! Vous comptabilisez au total %2 remboursement !\n\n Pour plus d'information, www.sfpteam.fr !",_check_si_remboursement, round (_check_si_remboursement_trois + 1)];
		sleep 1;
		hint format ["Bonjour, \n Vous venez d'être remboursé de %1 Euros lorsque vous etiez indisponible ! Vous comptabilisez au total %2 remboursement !\n\n Pour plus d'information, www.sfpteam.fr !",_check_si_remboursement, round (_check_si_remboursement_trois + 1)];
		sleep 3;
		hint format ["Bonjour, \n Vous venez d'être remboursé de %1 Euros lorsque vous etiez indisponible ! Vous comptabilisez au total %2 remboursement !\n\n Pour plus d'information, www.sfpteam.fr !",_check_si_remboursement, round (_check_si_remboursement_trois + 1)];
	};
	if (_check_si_remboursement_deux != "aucun") then 
	{
		hint format ["Bonjour, \n\n Vous venez d'être remboursé de %1 Euros lorsque vous etiez indisponible ! \n\n Voici le message du staff : \n\n %2 \n\n Vous comptabilisez au total %3 remboursement ! \n -------------------------------------- \n Pour plus d'information, www.sfpteam.fr !",_check_si_remboursement,_check_si_remboursement_deux, round (_check_si_remboursement_trois + 1)];	
		sleep 3;
		hint format ["Bonjour, \n\n Vous venez d'être remboursé de %1 Euros lorsque vous etiez indisponible ! \n\n Voici le message du staff : \n\n %2 \n\n Vous comptabilisez au total %3 remboursement ! \n -------------------------------------- \n Pour plus d'information, www.sfpteam.fr !",_check_si_remboursement,_check_si_remboursement_deux, round (_check_si_remboursement_trois + 1)];	
		sleep 3;
		hint format ["Bonjour, \n\n Vous venez d'être remboursé de %1 Euros lorsque vous etiez indisponible ! \n\n Voici le message du staff : \n\n %2 \n\n Vous comptabilisez au total %3 remboursement ! \n -------------------------------------- \n Pour plus d'information, www.sfpteam.fr !",_check_si_remboursement,_check_si_remboursement_deux, round (_check_si_remboursement_trois + 1)];	
	};

	// Que pour staff
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min %6:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
	_detail_log = format ["Remboursement de %1 Euros. il en est à son : %2 ieme remboursement ! Le message : %3",_check_si_remboursement, _check_si_remboursement_trois, _check_si_remboursement_deux];
	["Historique remboursement fait", "Listes Des remboursement", _heure_du_log, _detail_log] call fn_SaveToServer;
};