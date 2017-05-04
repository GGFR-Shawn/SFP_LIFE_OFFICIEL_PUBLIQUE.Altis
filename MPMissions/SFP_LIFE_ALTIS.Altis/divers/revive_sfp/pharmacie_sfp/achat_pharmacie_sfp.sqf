// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_espacerestant = (player getVariable "usedspace");
_numero_tableau = -1;
if((lbCurSel 1500) == -1) exitwith {Hint "Désolé, tu n'as rien selectionné !";};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};

_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
		if (!isnil "message_information_diplome_secouriste") exitwith {hint "Désolé, tu es déja entrain d'obtenir ce diplome !";};
		if (isnil "message_information_diplome_secouriste") then {message_information_diplome_secouriste = true;};
		if (player getvariable "mon_niveau_secouriste" >= niveau_max_secouriste_revive) exitwith {hint "Désolé, tu as déja le niveau maximum.";};
		message_information_diplome_secouriste = 1;
		
		_niveau_voulu = round ((player getvariable "mon_niveau_secouriste") + 1);
		_temps_formation = round ((20 + random 100) + (_niveau_voulu * 100));
		if (_niveau_voulu >= 3) then {_temps_formation = round (random 30 + (_niveau_voulu * 100));};

		hint "! SECOURISTE ! \n -------------------------------------------- \n \n Bonjour, \n\n Dans quelques instants tu vas obtenir un niveau supplémentaire de secouriste pour soigner plus rapidement et avec plus de chance les bléssés. \n\n Maintenant, il ne te reste plus qu'à patienter que la formation ce termine. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		
		closedialog 0;
		
		sleep 7;

		6 fadeSound 0;
		6 fadeMusic 0;
		while {alive player && _temps_formation > 0} do
		{
			0 cuttext [format ["! SECOURISTE ! \n --------------------------------------------------------------- \n\n Jean Jacques te forme ... Patiente patiente encore %1 secondes ...", round (_temps_formation - 1)],"BLACK FADED",1];
			if (alive player) then {sleep 1;};
			_temps_formation = round (_temps_formation - 1);
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		if (!alive player) exitwith {hint "Désolé, vous êtes mort ..."; message_information_diplome_secouriste = nil;};

		0 cuttext [format ["! SECOURISTE ! \n --------------------------------------------------------------- \n\n Bien joué jeune infirmier ! \n\n Jean Jacques ta formé au niveau %1 !", _niveau_voulu],"BLACK FADED",1];

		message_information_diplome_secouriste = nil;
		player setVariable["mon_niveau_secouriste", _niveau_voulu, false];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - 5000,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Kit de premiers soins";
	le_prix_de_larticle = 100;

	if !(player canAdd "FirstAidKit") exitwith {hint "Impossible, vous n'avez plus de place !";};
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		player addItem "FirstAidKit";
		sleep (100 + (random 100));
		le_nom_de_larticle = "kit de premiers soins";
		le_prix_de_larticle = 100;
		if ((player getVariable "ma_mutuelle_niveau_10_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 10;};
		if ((player getVariable "ma_mutuelle_niveau_vingt_cinq_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 25;}; 
		if ((player getVariable "ma_mutuelle_niveau_cinquante_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 50;};
		if ((player getVariable "ma_mutuelle_niveau_soixante_quinze_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 75;}; 
		if ((player getVariable "ma_mutuelle_niveau_cent_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle;}; 
		if (!(isnil "taux_de_remboursement_mutuelle")) then {player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + taux_de_remboursement_mutuelle,true]; autorisation_mouvement_argent = true;};
		if (!(isnil "taux_de_remboursement_mutuelle")) then {hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez d'être remboursé de %1 Euros concernant %2 dernièrement. \n\n La mutuelle vous à versée directement cet argent sur votre compte bancaire. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",taux_de_remboursement_mutuelle,displayname];taux_de_remboursement_mutuelle = nil;};	
	}else
	{
		Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	execvm "divers\maladie\achat_antibiotique.sqf";
};
