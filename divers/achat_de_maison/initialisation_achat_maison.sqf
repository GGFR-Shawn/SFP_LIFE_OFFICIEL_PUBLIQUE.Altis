// =======================================================================================================================================================================================
											// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
											  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {alive player};

// -------------------------------------------------------------------- Initialisation --------------------------------------------------------------------- //
valeur_prix_de_la_maison =
{
	private "_valeur";
	_valeur = 101231;
	{
		if (typeof cursorTarget == (_x select 0)) then
		{
			_valeur = _x select 1;
		};
	}
	foreach sfp_config_listes_des_maisons_achetable;
	
	if (_valeur == 101231) then {hint "Attention, pas de prix défini !!! \n\n Valeur par default 101231 Euros.";};
	_valeur;
};

possibilite_interraction_maison =
{
	private "_la_maison";
	_la_maison = false;
	{
		if (typeof cursorTarget == (_x select 0)) then
		{
			_la_maison = true;
		};
	}
	foreach sfp_config_listes_des_maisons_achetable;
	_la_maison;
};

fermer_a_clef_la_maison =
{
	if (isnil {cursortarget getvariable "proprietaire_de_la_maison" select 0}) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, cette maison n'appartient à personne ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 	
	if (!((name player) in (cursorTarget getvariable "proprietaire_de_la_maison"))) exitwith {hint format ["Désolé, cette maison appartient à %1 !",cursortarget getvariable "proprietaire_de_la_maison" select 0];}; 	
	
	if (isnil {cursortarget getvariable "maison_verrouiller_a_clef"}) then {cursortarget setvariable ["maison_verrouiller_a_clef",1,true];};
	
	if (cursortarget getvariable "maison_verrouiller_a_clef" >= 1) exitwith 
	{
		cursortarget setVariable ['bis_disabled_Door_1',0,true];
		cursortarget setVariable ['bis_disabled_Door_2',0,true];
		cursortarget setVariable ['bis_disabled_Door_3',0,true];
		cursortarget setvariable ["maison_verrouiller_a_clef",0,true];
		
		[] spawn {re_scanner_la_maison = cursorTarget; sleep 1; publicvariable "re_scanner_la_maison";};
		
		_listes_personnes_qui_ont_les_clefs = "";
		for "_i" from 1 to (count (cursorTarget getvariable "proprietaire_de_la_maison") - 1) do
		{
			_listes_personnes_qui_ont_les_clefs = _listes_personnes_qui_ont_les_clefs + (format ["<br/> %1",cursorTarget getvariable "proprietaire_de_la_maison" select _i]);
		};
		if (count (cursorTarget getvariable "proprietaire_de_la_maison") < 2) then {_listes_personnes_qui_ont_les_clefs = "<br/> Aucun pret de clefs";};
		
		_str = parseText format ["! MAISON DEVERROUILLE ! <br/> ------------------------------------ <br/><t color='#07FE62' size='1'>Propriétaire : </t><br/><br/>%1<br/><br/><t color='#07FE62' size='1'>Liste Prêt Clefs : </t><br/>%2<br/><t color='#EEEEEE' size='1'><br/>-----------<br/>By [SFP] Maxou<br/>L'unique vrai mod by SFP!</t>",(cursorTarget getvariable "proprietaire_de_la_maison" select 0), _listes_personnes_qui_ont_les_clefs];hintsilent _str;
	};
	
	if (cursortarget getvariable "maison_verrouiller_a_clef" < 1) exitwith 
	{
		cursortarget setVariable ['bis_disabled_Door_1',1,true];
		cursortarget setVariable ['bis_disabled_Door_2',1,true];
		cursortarget setVariable ['bis_disabled_Door_3',1,true];
		cursortarget setvariable ["maison_verrouiller_a_clef",1,true];

		[] spawn {re_scanner_la_maison = cursorTarget; sleep 1; publicvariable "re_scanner_la_maison";};

		_listes_personnes_qui_ont_les_clefs = "";
		for "_i" from 1 to (count (cursorTarget getvariable "proprietaire_de_la_maison") - 1) do
		{
			_listes_personnes_qui_ont_les_clefs = _listes_personnes_qui_ont_les_clefs + (format ["<br/> %1",cursorTarget getvariable "proprietaire_de_la_maison" select _i]);
		};
		if (count (cursorTarget getvariable "proprietaire_de_la_maison") < 2) then {_listes_personnes_qui_ont_les_clefs = "<br/> Aucun pret de clefs";};
		
		_str = parseText format ["! MAISON VERROUILLE ! <br/> ------------------------------------ <br/><t color='#07FE62' size='1'>Propriétaire : </t><br/><br/>%1<br/><br/><t color='#07FE62' size='1'>Liste Prêt Clefs : </t><br/>%2<br/><t color='#EEEEEE' size='1'><br/>-----------<br/>By [SFP] Maxou<br/>L'unique vrai mod by SFP!</t>",(cursorTarget getvariable "proprietaire_de_la_maison" select 0), _listes_personnes_qui_ont_les_clefs];hintsilent _str;
	};
};

connaitre_le_prix =
{
	if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};
	if (cursortarget getvariable "proprietaire_de_la_maison" select 0 == name player) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Euuuu ... La maison t'appartient déja ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
	if (!isnil {cursortarget getvariable "proprietaire_de_la_maison" select 0}) exitwith {hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, cette maison appartient à %1, elle n'est pas à vendre ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",cursortarget getvariable "proprietaire_de_la_maison" select 0];}; 	
	if (isnil {cursortarget getvariable "le_prix_de_la_maison"}) then 
	{
		le_prix_de_la_maison = [] call valeur_prix_de_la_maison;
		cursortarget setvariable ["le_prix_de_la_maison",le_prix_de_la_maison,true];
	};
	hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Le prix de vente de cette maison est de %1 Euros. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(cursortarget getvariable "le_prix_de_la_maison") call retour_formatage_chiffre_sfp];
};

acheter_la_maison = 
{
	if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};
	
	_nombre_de_pnj = 0;	{if (!isplayer _x) then {_nombre_de_pnj = round (_nombre_de_pnj + 1);};} foreach (nearestObjects [getPosATL player, ["MAN"], 10]);
	if (_nombre_de_pnj >= 1) exitwith 
	{
		hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Impossible d'acheter cette maison car un PNJ est dedans ou à proximité ! \n\n Une flèche à été créée pour vous montrer le PNJ en question !\n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		
		if (isnil "pointeur_detecte_pnj") then
		{
			_position_pnj = (nearestObjects [getPosATL player, ["MAN"], 10]) select 1;
			pointeur_detecte_pnj = createVehicle ["Sign_Arrow_Large_Yellow_F", getPosATL _position_pnj, [], 0, "CAN_COLLIDE"];	
			pointeur_detecte_pnj setPosATL [(getPosATL pointeur_detecte_pnj select 0),(getPosATL pointeur_detecte_pnj select 1),(getPosATL pointeur_detecte_pnj select 2) + 3];
			pointeur_detecte_pnj attachTo [_position_pnj,[0,0,3]]; 
			sleep 30;
			deletevehicle pointeur_detecte_pnj;
			pointeur_detecte_pnj = nil;
		};
	};
	
	la_maison_que_je_veux_acheter = nil;
	le_prix_de_la_maison = nil;
	
	if (player getvariable "je_suis_entrain_dacheter_une_maison" > 0) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Impossible d'acheter de nouveau une maison car tu es déjà sur une affaire ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if (player getvariable "ma_carte_identite" select 1 == "nom") exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, il faut d'abord être déclaré en mairie pour pouvoir acheter une maison sur l'ile ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if (cursortarget getvariable "en_attente_d_achat" > 0) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Impossible, puisque la maison est en cours d'achat par un joueur ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if (cursortarget getvariable "proprietaire_de_la_maison" select 0 == name player) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Euuuu ... La maison t'appartient déja ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
	if (!isnil {cursortarget getvariable "proprietaire_de_la_maison" select 0}) exitwith {hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, tu ne peux pas acheter cette maison puisqu'elle appartient à %1 ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",cursortarget getvariable "proprietaire_de_la_maison" select 0];}; 
	if (isnil {cursortarget getvariable "le_prix_de_la_maison"}) then {le_prix_de_la_maison = [] call valeur_prix_de_la_maison; cursortarget setvariable ["le_prix_de_la_maison",le_prix_de_la_maison,true];};
	le_prix_de_la_maison = cursortarget getvariable "le_prix_de_la_maison";
	if (player getvariable "mon_argent_banque_by_sfp_maxou" < le_prix_de_la_maison) exitwith {hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, tu n'as pas assez d'argent ! Il te faut %1 Euros. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(le_prix_de_la_maison) call retour_formatage_chiffre_sfp];};
	
	player setvariable ["je_suis_entrain_dacheter_une_maison",1,false];
	hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n La demande d'achat de maison à bien été prise en compte ... \n\n Une demande d'autorisation à la mairie vient d'être faite ! \n\n Reste connecté le temps que la finalisation à bien lieu, cela prend quelques minutes ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	la_maison_que_je_veux_acheter = cursortarget;
	la_maison_que_je_veux_acheter setvariable ["en_attente_d_achat",1,true];
	
	_heure_du_beug = format ["%1/%2/%3 à %4H%5Min %6 1):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
	detail_maison = format ["Etat : Début Achat , Nom Joueur : %1 , GUID : %2 , Position : %3 , Prix Achat : %4 , ID Maison : %5",name player, getplayeruid player, getPosATL player, le_prix_de_la_maison, la_maison_que_je_veux_acheter];
	["Historique Achat Maison", "Listes des achats de maisons", _heure_du_beug, detail_maison] call fn_SaveToServer;
	
	sleep (200 + (random 300));
	
	if (isnil "le_prix_de_la_maison") exitwith {player setvariable ["je_suis_entrain_dacheter_une_maison",0,false]; titletext ["Erreur sur le prix d'achat de ta maison, recommence ...","PLAIN DOWN"];};
	if (isnil "la_maison_que_je_veux_acheter") exitwith {player setvariable ["je_suis_entrain_dacheter_une_maison",0,false]; titletext ["Erreur sur la maison choisit pour l'achat, recommence ...","PLAIN DOWN"];};
	
	_heure_du_beug = format ["%1/%2/%3 à %4H%5Min %6 2):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
	detail_maison = format ["Etat : Achat Terminé , Nom Joueur : %1 , GUID : %2 , Position : %3 , Prix Achat : %4 , ID Maison : %5",name player, getplayeruid player, getPosATL player, le_prix_de_la_maison, la_maison_que_je_veux_acheter],
	["Historique Achat Maison", "Listes des achats de maisons", _heure_du_beug, detail_maison] call fn_SaveToServer;
		
	nouvel_achat_maison = la_maison_que_je_veux_acheter; sleep 1; publicvariable "nouvel_achat_maison"; // Envoi sauvegarde sur le serveur

	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - le_prix_de_la_maison,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	player setvariable ["je_suis_entrain_dacheter_une_maison",0,false];
	la_maison_que_je_veux_acheter setvariable ["proprietaire_de_la_maison",[name player],true];
	la_maison_que_je_veux_acheter setvariable ["en_attente_d_achat",0,true];
	la_maison_que_je_veux_acheter setvariable ["maison_verrouiller_a_clef",0,true];
	la_maison_que_je_veux_acheter setvariable ["maison_ne_peux_pas_etre_vendu",1,true];
	
	[la_maison_que_je_veux_acheter] call ajouter_a_la_liste_de_mes_emplacements_maisons;

	hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n La demande d'achat de maison à bien été accordé ... \n\n Elle t'appartient désormais ! \n Tu peux maintenant y stocker des armes, objets, ect etc \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	sleep 2;
	hintsilent "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n La demande d'achat de maison à bien été accordé ... \n\n Elle t'appartient désormais ! \n Tu peux maintenant y stocker des armes, objets, ect etc \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	sleep 2;
	hintsilent "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n La demande d'achat de maison à bien été accordé ... \n\n Elle t'appartient désormais ! \n Tu peux maintenant y stocker des armes, objets, ect etc \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
};

connaitre_le_prix_de_vente_script = 
{
	if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};
	
	if (isnil {cursortarget getvariable "proprietaire_de_la_maison" select 0}) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, cette maison n'appartient à personne ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
	if (cursortarget getvariable "proprietaire_de_la_maison" select 0 != name player) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, ce n'est pas votre maison ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
	if (isnil {cursortarget getvariable "le_prix_de_la_maison_revente"}) then {le_prix_de_la_maison_revente = (round (100000 + (random 150000)));  cursortarget setvariable ["le_prix_de_la_maison_revente",le_prix_de_la_maison_revente,true];};

	connaitre_le_prix_de_vente = 1;
	
	la_maison_que_je_veux_vendre = cursortarget;
			
	hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Si vous souhaitez revendre votre maison, celle ci à été estimée à %1 Euros ! \n\n Si tu trouves cette offre trop peu cher, re test à la prochaine reconnexion elle aura surement changée ...\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(round (la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente")) call retour_formatage_chiffre_sfp];
	sleep 2;
	hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Si vous souhaitez revendre votre maison, celle ci à été estimée à %1 Euros ! \n\n Si tu trouves cette offre trop peu cher, re test à la prochaine reconnexion elle aura surement changée ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(round (la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente")) call retour_formatage_chiffre_sfp];
	sleep 2;
	hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Si vous souhaitez revendre votre maison, celle ci à été estimée à %1 Euros ! \n\n Si tu trouves cette offre trop peu cher, re test à la prochaine reconnexion elle aura surement changée ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(round (la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente")) call retour_formatage_chiffre_sfp];
};

revendre_ma_maison = 
{
	la_maison_que_je_veux_vendre = cursortarget;
	
	if (isnil "la_maison_que_je_veux_vendre") exitwith {hint "Erreur sur la maison, recommence ...";};
	if (isnil {la_maison_que_je_veux_vendre getvariable "numero_de_la_maison"}) exitwith {hint "Cette maison ne pourra être vendue qu'au prochain redémarrage ...";};
	if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};
	if (!isnil {la_maison_que_je_veux_vendre getvariable"maison_ne_peux_pas_etre_vendu"}) exitwith {hint "Cette maison à été achetée il y à peu, elle ne peut donc pas être vendue actuellement !";};
	
	if (isnil {la_maison_que_je_veux_vendre getvariable "proprietaire_de_la_maison" select 0}) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, cette maison n'appartient à personne ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
	if (la_maison_que_je_veux_vendre getvariable "proprietaire_de_la_maison" select 0 != name player) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, ce n'est pas votre maison ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
	if (isnil {la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente"}) then {le_prix_de_la_maison_revente = (round (0 + (random 150000)));  la_maison_que_je_veux_vendre setvariable ["le_prix_de_la_maison_revente",le_prix_de_la_maison_revente,true];};

	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + le_prix_de_la_maison_revente,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	
	la_maison_que_je_veux_vendre setvariable ["proprietaire_de_la_maison",nil,true];
	la_maison_que_je_veux_vendre setvariable ["en_attente_d_achat",nil,true];
	la_maison_que_je_veux_vendre setvariable ["maison_verrouiller_a_clef",nil,true];
	
	[la_maison_que_je_veux_vendre] call retirer_a_la_liste_de_mes_emplacements_maisons;
	
	revente_maison_joueur = la_maison_que_je_veux_vendre getvariable "numero_de_la_maison"; sleep 0.5; publicvariable "revente_maison_joueur";
	
	son_nom_vendeur = name player;
	publicvariable "son_nom_vendeur";
	montant_vente_vendeur = (la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente") call retour_formatage_chiffre_sfp;
	publicvariable "montant_vente_vendeur";
	sleep 0.1;
	_null = [{player globalchat format ["%1 vient de revendre sa maison pour %2 Euros ...",son_nom_vendeur, montant_vente_vendeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;

	// Suppression des objets décorateur
	{
		if (!isnil {_x getvariable "object_decoration_interieur"}) then
		{
			deletevehicle _x;
		};
	} foreach (nearestObjects [getPosATL player, [], 15]);
	
	hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n La vente de votre maison à bien été faite ... \n\n Celle ci à donc été vendu pour %1 Euros. \n\n Elle ne t'appartient donc plus ! \n La sauvegarde à été mise à jour ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(round (la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente")) call retour_formatage_chiffre_sfp];
	sleep 2;
	hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n La vente de votre maison à bien été faite ... \n\n Celle ci à donc été vendu pour %1 Euros. \n\n Elle ne t'appartient donc plus ! \n La sauvegarde à été mise à jour ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(round (la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente")) call retour_formatage_chiffre_sfp];
	sleep 2;
	hint format ["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n La vente de votre maison à bien été faite ... \n\n Celle ci à donc été vendu pour %1 Euros. \n\n Elle ne t'appartient donc plus ! \n La sauvegarde à été mise à jour ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",(round (la_maison_que_je_veux_vendre getvariable "le_prix_de_la_maison_revente")) call retour_formatage_chiffre_sfp];
};

initialisation_clefs_des_maisons = 
{
	if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};

	if (isnil {cursortarget getvariable "proprietaire_de_la_maison" select 0}) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, cette maison n'appartient à personne ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 	
	if (cursortarget getvariable "proprietaire_de_la_maison" select 0 != name player) exitwith {hint format ["Désolé, cette maison appartient à %1 !",cursortarget getvariable "proprietaire_de_la_maison" select 0];}; 	

	la_maison_pour_pret_des_clefs = cursortarget;

	createdialog "Menu_Choix_Clefs_Maison";
};

ajouter_a_la_liste_de_mes_emplacements_maisons = 
{
	private ["_rescan_liste_maison","_nombre_de_detection"];
	_la_maison = _this select 0;
	_position_la_maison = getPosATL _la_maison;

	if (isnil "liste_de_mes_maisons") then {liste_de_mes_maisons = [];};
	if (isnil "_la_maison" or isnil "_position_la_maison") exitwith {};
	
	_rescan_liste_maison = false;
	_nombre_de_detection = 0;
	for "_i" from 0 to (count liste_de_mes_maisons - 1) do 
	{
		if (round (liste_de_mes_maisons select _i select 0) == round (_position_la_maison select 0)) then 
		{
			_nombre_de_detection = round (_nombre_de_detection + 1);
			if (_nombre_de_detection > 1) then
			{
				_rescan_liste_maison = true;
				liste_de_mes_maisons set [_i,-1];
			};
		};
	};
	
	if (_nombre_de_detection < 1) then {liste_de_mes_maisons pushBack _position_la_maison; _rescan_liste_maison = true;};
	if (_rescan_liste_maison) then {liste_de_mes_maisons = liste_de_mes_maisons - [-1]; [uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "liste_de_mes_maisons", liste_de_mes_maisons] call fn_SaveToServer;};
};

retirer_a_la_liste_de_mes_emplacements_maisons = 
{
	_la_maison = _this select 0;
	_position_la_maison = getPosATL _la_maison;

	if (isnil "liste_de_mes_maisons") then {liste_de_mes_maisons = [];};
	if (isnil "_la_maison" or isnil "_position_la_maison") exitwith {};
	
	for "_i" from 0 to (count liste_de_mes_maisons - 1) do 
	{
		if (round (liste_de_mes_maisons select _i select 0) == round (_position_la_maison select 0)) then 
		{
			liste_de_mes_maisons set [_i,-1];
		};
	};
	
	liste_de_mes_maisons = liste_de_mes_maisons - [-1];
	[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "liste_de_mes_maisons", liste_de_mes_maisons] call fn_SaveToServer;
};

menu_addaction_achat_maison =
{
	player removeaction menu_liste_deroulante_maison;
	
	player addaction ["<t color=""#ff0000"">" + "Acheter cette maison", acheter_la_maison, [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursortarget getvariable 'proprietaire_de_la_maison'}"
	];

	player addaction ["<t color=""#ff0000"">" + "Revendre Ma Maison", revendre_ma_maison, [], 1, false, true, "", 
	"!isnil 'connaitre_le_prix_de_vente' && [] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8 && cursortarget getvariable 'proprietaire_de_la_maison' select 0 == name player"
	];

	player addaction ["<t color=""#ff0000"">" + "Connaitre Le Prix De ReVente", connaitre_le_prix_de_vente_script, [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8 && cursortarget getvariable 'proprietaire_de_la_maison' select 0 == name player"
	];

	player addaction ["<t color=""#ff0000"">" + "Maison deja acheté", acheter_la_maison, [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8 && cursortarget getvariable 'proprietaire_de_la_maison' select 0 != name player"
	];

	player addaction ["<t color=""#ff0000"">" + "Connaitre le prix d'achat", connaitre_le_prix, [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursortarget getvariable 'proprietaire_de_la_maison'}"
	];

	player addaction ["<t color=""#ff0000"">" + "Décorer ma maison", "divers\achat_de_maison\decorateur_interieur\menu_decoration_interieur_by_maxou.sqf", [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 6 && cursorTarget getvariable 'proprietaire_de_la_maison' select 0 == name player && sfp_config_autoriser_pose_objets_decoration"
	];

	player addaction ["<t color=""#ff0000"">" + "Supprimer objet decoration", {deletevehicle cursorTarget}, [], 1, false, true, "", 
	"player distance cursortarget < 5 && !isnil {cursortarget getvariable 'object_decoration_interieur'}"
	];

	player addaction ["<t color=""#ff0000"">" + "Fermer/Ouvrir à clef la maison", fermer_a_clef_la_maison, [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8 && !isnil {cursortarget getvariable 'proprietaire_de_la_maison'}"
	];

	player addaction ["<t color=""#ff0000"">" + "Preter clefs de la maison", initialisation_clefs_des_maisons, [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8 && cursortarget getvariable 'proprietaire_de_la_maison' select 0 == name player"
	];

	if (sfp_config_activer_dormir) then
	{
		player addaction ["<t color=""#ff0000"">" + "Dormir A La Maison", "menu\hotel.sqf", [], 1, false, true, "", 
		"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 3 && ((name player) in (cursortarget getvariable 'proprietaire_de_la_maison')) && player getvariable 'fautdormir' < 90"
		];
	};

	if (sfp_config_activer_faim) then
	{	
		player addaction ["<t color=""#ff0000"">" + "Manger Un Morceau", "menu\restaurantnourriture.sqf", [], 1, false, true, "", 
		"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 3 && ((name player) in (cursortarget getvariable 'proprietaire_de_la_maison')) && player getvariable 'niveau_de_faim' < 50"
		];
	};
	
	if (sfp_config_activer_soif) then
	{
		player addaction ["<t color=""#ff0000"">" + "Boire Un Verre D'eau", "menu\restauranteau.sqf", [], 1, false, true, "", 
		"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 3 && ((name player) in (cursortarget getvariable 'proprietaire_de_la_maison')) && niveau_de_soif < 50"
		];
	};
	
	player addaction ["<t color=""#ff0000"">" + "Boire Un Café", "menu\restaurantcafe.sqf", [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 3 && ((name player) in (cursortarget getvariable 'proprietaire_de_la_maison')) && player getvariable 'thirstLevel_cafe' < 1"
	];

	player addaction ["<t color=""#ff0000"">" + "Boire Un Demi", "menu\restaurantalcool.sqf", [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 3 && ((name player) in (cursortarget getvariable 'proprietaire_de_la_maison')) && isnil {player getvariable 'jaibu_by_sfp_maxou'}"
	];

	player addAction ["<t color=""#ED2744"">" + "Attacher object decoration !", "divers\achat_de_maison\decorateur_interieur\action_decorateur_interieur.sqf", [1], 11, false, false, "", 
	"player distance cursortarget < 5 && !isnil {cursortarget getvariable 'object_decoration_interieur'} && isnil 'objet_architecte_attache'"
	];
	
	player addAction ["<t color=""#ED2744"">" + "Detacher object decoration !", "divers\achat_de_maison\decorateur_interieur\action_decorateur_interieur.sqf", [2], 11, false, false, "",
	"!isnil 'objet_architecte_attache'"
	];	
};

addaction_achat_de_maison_initialisation =
{
	menu_liste_deroulante_maison = 	player addaction ["<t color=""#ff0000"">" + "Ouvrir Menu Des Maisons", menu_addaction_achat_maison, [], 1, false, true, "", 
	"[] call possibilite_interraction_maison && alive cursorTarget && cursorTarget distance player < 8"
	];
};