// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";
_numero_tableau = -1;

if(revive_mon_side == west) then
{
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Combinaison";
		le_prix_de_larticle = 100;
		argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			if (player canAddItemToBackpack "U_B_Wetsuit") then
			{
				player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
            
				removeUniform player;
				player forceAddUniform "U_B_Wetsuit";
			}else
			{
				hint "Désolé, vous n'avez pas de sac à dos ou il n'a plus de place !";
			};
		}else{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "bouteille";
		le_prix_de_larticle = 850;
		argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

            player addVest "V_RebreatherB";
		}
		else{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "lunettes";
		le_prix_de_larticle = 20;
		argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
            
            player addItem "G_Diving";
            player assignitem "G_Diving";
		}
		else{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
};

if(revive_mon_side == civilian) then
{
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Combinaison";
		le_prix_de_larticle = 100;
		argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			if (player canAddItemToBackpack "U_B_Wetsuit") then
			{
				player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
           
				player addItem "U_B_Wetsuit";
			}else
			{
				hint "Désolé, vous n'avez pas de sac à dos ou il n'a plus de place !";
			};
		}
		else
		{
		Hint format ["Vous avez %1 Euros et il vous faut %2 Euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "bouteille";
		le_prix_de_larticle = 850;
		argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
            

            player addVest "V_RebreatherB";
		}else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Lunettes";
		le_prix_de_larticle = 20;
		argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
            
            player addItem "G_Diving";
            player assignitem "G_Diving";
		}else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
};

