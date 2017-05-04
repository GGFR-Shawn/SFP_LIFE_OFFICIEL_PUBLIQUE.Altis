//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if(floor parseNumber (ctrlText 22228) == -1) exitwith {Hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Il faut obligatoirement définir un mot de passe ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if(floor parseNumber (ctrlText 22228) > 999999) exitwith {Hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé tu ne peux pas mettre de mot de passe au dessus de 999999 ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if(floor parseNumber (ctrlText 22228) == 0) exitwith {Hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, 0 n'est pas valable ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if((ctrlText 22228) == "") exitwith {Hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Il faut obligatoirement définir un mot de passe ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 


(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeydeux];
mot_de_passe_du_coffre_fort = (floor parseNumber (ctrlText 22228));
hint format["! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Très bien ! Ton code secret est le : %1 ! \n\n N'oublie pas de le noter ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",mot_de_passe_du_coffre_fort];
sleep 0.045;
cursortarget setvariable ["mot_de_passe_du_coffre_fort",mot_de_passe_du_coffre_fort,true];
closeDialog 0;