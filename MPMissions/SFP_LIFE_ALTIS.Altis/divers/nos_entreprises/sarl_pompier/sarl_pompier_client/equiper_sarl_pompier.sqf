// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = _this select 0;
if (isnil "_condition") exitwith {hint "Erreur, contact maxou.";};
if (isnil {player getvariable "sarl_pompier"}) exitwith {hint "! SARL POMPIER ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de matériels ici puisque vous ne faite pas partie de notre entreprise.\n\n Cordialement.";};
if((player getVariable "mon_argent_banque_by_sfp_maxou") < 420) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,420];};

switch (_condition) do
{
	case 1 :
	{
		hint format ["! SARL POMPIER ! \n --------------------------------------- \n\n Bonjour %1,\n\n Pour te faire gagner du temps, j'ai créé un pack du pompier qui comprend : \n\n - Un sac à dos. \n - Un gps. \n - Quatre kits de soin. \n - Un extincteur. \n - Un casque.  \n\n Amuse toi bien :)",name player];

		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - 420,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		player addBackpack "B_Kitbag_cbr_Pompier";

		player addItem "itemgps";
		player assignitem "itemgps";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";

		duree_de_mon_reservoir = round ( 900 + (random 10));
	};
	
	case 2 :
	{
		player addItem "itemgps";
		player assignitem "itemgps";
		
		duree_de_mon_reservoir = round ( 900 + (random 10));	
		
		hint "! SARL POMPIER ! \n --------------------------------------- \n\n Votre GPS ainsi que votre extincteur ont bien étés achetés.";
	};
};