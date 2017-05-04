//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (player getvariable "ma_carte_identite" select 1 == "nom") exitwith {hint "! MUTUELLE ! \n -------------------------------------------- \n \n Opération impossible, pour demander une aide, vous devez vous déclarer en mairie ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

hint "! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Bienvenue à la mutuelle de Altis. \n\n Cette mutuelle vous rembourse vos frais de santé à hauteur de celle que vous avez souscrit. \n\n Une fois un soins fait, patientez que la mutuelle traite celle ci. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

createDialog "MutuelleBySFPMaxou";
ctrlSetText[11120,format["Argent En Banque : %1 Euros",(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp]];

lbAdd[11121,"Remboursement frais à 10 % : 100 Euros"];
lbAdd[11121,"Remboursement frais à 25 % : 200 Euros"];
lbAdd[11121,"Remboursement frais à 50 % : 300 Euros"];
lbAdd[11121,"Remboursement frais à 75 % : 400 Euros"];
lbAdd[11121,"Remboursement frais à 100 % : 500 Euros"];
lbAdd[11121,"Annuler l'adhesion"];
