// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "fin_verification_apres_chargement"};
waituntil {sleep 1; alive player};

_amende = 1500;
_time = 300;

sleep 2;

if (!isnil {player getvariable "joueur_menotte"}) then 
{
	hint format ["Lors de ta déconnection tu été menotté ... \n\n Tu viens donc d'être remenotté avec en prime une amende de %1 Euros ! \n\n La prochaine fois évite de tricher ;)",_amende];
	player setVariable ["mon_argent_banque_by_sfp_maxou", (player getVariable "mon_argent_banque_by_sfp_maxou") - _amende,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

	while {(!isnil {player getvariable "joueur_menotte"}) && (_time > 1)} do
	{
		_time = _time - 1;
		sleep 1;
		if (_time > 0) then {titleText [format ["Encore %1 secondes pour être demenotté automatiquement ... \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr",_time],"PLAIN",1];};
		if (_time <= 0) then {hint "Tu es maintenant demenotté !\n\n Appuis maintenant sur V ! \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr";};
		if (!(alive player)) exitwith {execvm "divers\gendarmerie\menotter\remenotter_apres_deco_reco_message.sqf";};
	};
				
	if (!isnil "noesckey") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};

	if (!isnil {player getvariable "joueur_menotte"}) then {player setVariable["joueur_menotte",nil,true];};
	sleep 1;
	titleText ["Vous avez été démenotté automatiquement après le temps de sanction suite à votre déco !","PLAIN"];
};

