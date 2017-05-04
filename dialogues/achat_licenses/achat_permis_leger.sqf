// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_condition";
if (player distance pnj_auto_ecole < 10) then {{if (!isnil {_x getvariable "sarl_autoecole_en_ligne"}) then {_condition = true;};} foreach allunits;};
if (!isnil "_condition") exitwith {hint "Désolé, ce PNJ est désactivé puisque des employés de l'auto école sont connecté ... \n\n Demande leurs de te faire passer le permis ;)";};

if (player getVariable 'license_permis_de_conduire_by_sfp_maxou' >= 1) exitwith {['Warning',['Déjà en possession !']] call bis_fnc_showNotification;};
if (isnil "prix_permis_leger_sfp") exitwith {hint "Erreur prix du permis !";};
if (isnil "jesuisavertitpourlepermisleger") then {jesuisavertitpourlepermisleger = 1;};
if (isnil "jesuisavertitpourlepermislegermessage") then {jesuisavertitpourlepermislegermessage = 1;};

if (player getvariable "mon_argent_banque_by_sfp_maxou" < prix_permis_leger_sfp) exitwith {hint "Désolé, tu n'as pas assez d'argent !";};
if (jesuisavertitpourlepermislegermessage == 2) exitwith {hint "Patiente jusqu'a la disparition de ce message !";};
jesuisavertitpourlepermislegermessage = 2;

if (jesuisavertitpourlepermisleger == 1 && player getvariable "nombre_de_permis" >= 1) exitwith 
{
	jesuisavertitpourlepermisleger = 2;
	hint format ["! PERMIS LEGER ! \n -------------------------------------------- \n \n Attention !!! \n\n Le permis de conduire LEGER va te couter cette fois ci %1 euros car tu as déja acheté %2 permis sur Altis ! \n\n Si tu veux l'avoir moins cher passe par la SARL AUTO ECOLE ou roules moins vite !!! ;) \n\n Si tu souhaites l'acheter quand meme, re clique sur le permis ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",prix_permis_leger_sfp,player getvariable "nombre_de_permis"];
	sleep 2;
	hint format ["! PERMIS LEGER ! \n -------------------------------------------- \n \n Attention !!! \n\n Le permis de conduire LEGER va te couter cette fois ci %1 euros car tu as déja acheté %2 permis sur Altis ! \n\n Si tu veux l'avoir moins cher passe par la SARL AUTO ECOLE ou roules moins vite !!! ;) \n\n Si tu souhaites l'acheter quand meme, re clique sur le permis ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",prix_permis_leger_sfp,player getvariable "nombre_de_permis"];
	sleep 2;
	hint format ["! PERMIS LEGER ! \n -------------------------------------------- \n \n Attention !!! \n\n Le permis de conduire LEGER va te couter cette fois ci %1 euros car tu as déja acheté %2 permis sur Altis ! \n\n Si tu veux l'avoir moins cher passe par la SARL AUTO ECOLE ou roules moins vite !!! ;) \n\n Si tu souhaites l'acheter quand meme, re clique sur le permis ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",prix_permis_leger_sfp,player getvariable "nombre_de_permis"];

	player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - prix_permis_leger_sfp),true];  autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	player setVariable['nombre_de_permis',((player getVariable 'nombre_de_permis') + 1),true];
	player setVariable['license_permis_de_conduire_by_sfp_maxou',1,true];
	player setVariable['combien_de_point_by_sfp_maxou',12,true]; 
	if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable['recherche_pour_conduite_sans_permis',nil,true];};
	jesuisavertitpourlepermisleger = nil;
	jesuisavertitpourlepermislegermessage = nil;

	closeDialog 0; 
	execVM 'menu\licensemenu.sqf';

	hint "Le permis de véhicule LEGER à bien été acheté !";	
};

if (jesuisavertitpourlepermisleger == 1 && player getvariable "nombre_de_permis" < 1) exitwith 
{
	jesuisavertitpourlepermisleger = 2;
	hint format ["! PERMIS LEGER ! \n -------------------------------------------- \n \n Attention !!! \n\n Le permis de conduire LEGER va te couter cette fois ci %1 euros car c'est la première fois que tu l'achètes ! \n\n Plus tu perdras ton permis, plus celui ci te reviendra plus cher !!! ;) \n\n Si tu souhaites l'acheter quand meme, re clique sur le permis ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",prix_permis_leger_sfp,player getvariable "nombre_de_permis"];
	sleep 2;
	hint format ["! PERMIS LEGER ! \n -------------------------------------------- \n \n Attention !!! \n\n Le permis de conduire LEGER va te couter cette fois ci %1 euros car c'est la première fois que tu l'achètes ! \n\n Plus tu perdras ton permis, plus celui ci te reviendra plus cher !!! ;) \n\n Si tu souhaites l'acheter quand meme, re clique sur le permis ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",prix_permis_leger_sfp,player getvariable "nombre_de_permis"];
	sleep 2;
	hint format ["! PERMIS LEGER ! \n -------------------------------------------- \n \n Attention !!! \n\n Le permis de conduire LEGER va te couter cette fois ci %1 euros car c'est la première fois que tu l'achètes ! \n\n Plus tu perdras ton permis, plus celui ci te reviendra plus cher !!! ;) \n\n Si tu souhaites l'acheter quand meme, re clique sur le permis ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",prix_permis_leger_sfp,player getvariable "nombre_de_permis"];

	player setVariable['mon_argent_banque_by_sfp_maxou',((player getVariable 'mon_argent_banque_by_sfp_maxou') - prix_permis_leger_sfp),true];  autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	player setVariable['nombre_de_permis',((player getVariable 'nombre_de_permis') + 1),true];
	player setVariable['license_permis_de_conduire_by_sfp_maxou',1,true];
	player setVariable['combien_de_point_by_sfp_maxou',12,true]; 
	if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable['recherche_pour_conduite_sans_permis',nil,true];};
	jesuisavertitpourlepermisleger = nil;
	jesuisavertitpourlepermislegermessage = nil;

	closeDialog 0; 
	execVM 'menu\licensemenu.sqf';

	hint "Le permis de véhicule LEGER à bien été acheté !";
};