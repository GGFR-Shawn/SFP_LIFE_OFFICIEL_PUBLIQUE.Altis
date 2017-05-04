// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "nom_carte_identite" or isnil "prenom_carte_identite" or isnil "sexe_carte_identite" or isnil "lieu_de_naissance_carte_identite" or isnil "taille_carte_identite") exitwith {titletext ["Erreur, arma ... Recommence.","PLAIN DOWN"];};

closedialog 0; sleep 0.05; closedialog 0; waituntil {!dialog};

player setVariable ["ma_carte_identite",[choix_avatar_carte_identite, nom_carte_identite, prenom_carte_identite, sexe_carte_identite, lieu_de_naissance_carte_identite, taille_carte_identite], true];

['ma_carte_identite', player getvariable 'ma_carte_identite'] call uid_sauvegarde_ecrire_local_joueur_sfp; [uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "ma_carte_identite", player getvariable ["ma_carte_identite", 0]] call fn_SaveToServer;

systemchat "Carte validée émise en préfecture ...";

0 cuttext [format ["! DECLARATION MAIRIE ! \n --------------------------------------------------------------- \n\n Félicitation %1 %2, tu viens d'obtenir tes papiers officiels ... \n\n Ils te permettent maintenant d'acceder aux aides publiques etc !", player getvariable "ma_carte_identite" select 1, player getvariable "ma_carte_identite" select 2],"BLACK OUT", 0];
sleep 6; 
0 cuttext [format ["! DECLARATION MAIRIE ! \n --------------------------------------------------------------- \n\n Félicitation %1 %2, tu viens d'obtenir tes papiers officiels ... \n\n Ils te permettent maintenant d'acceder aux aides publiques etc !", player getvariable "ma_carte_identite" select 1, player getvariable "ma_carte_identite" select 2],"BLACK IN", 6];

sleep 2;
numero_carte_identite_un = nil;
numero_carte_identite_deux = nil;
numero_carte_identite_trois = nil;
numero_carte_identite_quatre = nil;
numero_carte_identite_cinq = nil;
numero_carte_identite_six = nil;
nom_carte_identite = nil;
prenom_carte_identite = nil;
sexe_carte_identite = nil;
lieu_de_naissance_carte_identite = nil;
taille_carte_identite = nil;
