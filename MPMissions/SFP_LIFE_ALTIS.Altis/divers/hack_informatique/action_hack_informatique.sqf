// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_tarif","_valeur_tableau"];
_valeur_tableau = 1500;

if ((lbCurSel _valeur_tableau) == -1) exitwith {hint "! HACK INFORMATIQUE ! \n -------------------------------------- \n\n Désolé, rien n'est selectionné. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou";};
_tarif = prix_de_depart select (lbCurSel _valeur_tableau);
if ((player getvariable "mon_argent_poche_by_sfp_maxou") < _tarif) exitwith {hint format ["! HACK INFORMATIQUE ! \n -------------------------------------- \n\n Opération impossible, vous avez actuellement %2 %1 et il vous en faut %3 %1. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou", "€", round (player getvariable "mon_argent_poche_by_sfp_maxou"), _tarif];};

switch (lbCurSel _valeur_tableau) do
{
	case 0 :
	{
		if (player getvariable "nombre_de_permis" < 1) exitwith {hint "! HACK INFORMATIQUE ! \n -------------------------------------- \n\n Opération impossible, vous êtes à 0 permis. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou";};
		
		player setvariable ["nombre_de_permis", round ((player getvariable "nombre_de_permis") - 1), true];
		player setvariable ["mon_argent_poche_by_sfp_maxou", round ((player getvariable "mon_argent_poche_by_sfp_maxou") - _tarif), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format ["! HACK INFORMATIQUE ! \n -------------------------------------- \n\n Piratage réussi, vous êtes passé de %1 à %2 permis pour la somme de %3 %4. \n\n Pour information, le prochain permis te coutera %5 %4. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou",round ((player getvariable "nombre_de_permis") + 1), round (player getvariable "nombre_de_permis"), _tarif ,"€", round (5000 + ((player getvariable "nombre_de_permis") * 1500))];
	
		closedialog 0;
		sleep 1;
		execvm "divers\hack_informatique\menu_hack_informatique.sqf";
	};
	
	case 1 :
	{
		if (isnil "blackout_reseau_telecom") exitwith {hint "! HACK INFORMATIQUE ! \n -------------------------------------- \n\n Valeur inconnue, contact Maxou. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou";};
		if (blackout_reseau_telecom > 0) exitwith {hint format ["! HACK INFORMATIQUE ! \n -------------------------------------- \n\n Opération impossible, un black-out réseau est déja en cours. \n\n Il reste actuellement %1 minutes de blackout ! \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou", round (blackout_reseau_telecom)];};

		blackout_reseau_telecom = 20;
		publicvariable "blackout_reseau_telecom";
		
		player setvariable ["mon_argent_poche_by_sfp_maxou", round ((player getvariable "mon_argent_poche_by_sfp_maxou") - _tarif), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format ["! HACK INFORMATIQUE ! \n -------------------------------------- \n\n Piratage réussi, un black-out réseau est en cours pour %1 minutes. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou",round (blackout_reseau_telecom)];
	
		closedialog 0;		
	};
};