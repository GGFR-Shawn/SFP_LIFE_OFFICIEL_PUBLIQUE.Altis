// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";
_numero_tableau = -1;

if(revive_mon_side == civilian) then
{
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade fumigène blanche";
		le_prix_de_larticle = 200;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addMagazine "SmokeShell";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade fumigène rouge";
		le_prix_de_larticle = 200;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addMagazine "SmokeShellRed";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade fumigène verte";
		le_prix_de_larticle = 200;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addMagazine "SmokeShellGreen";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade fumigène jaune";
		le_prix_de_larticle = 200;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addMagazine "SmokeShellYellow";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade fumigène violet";
		le_prix_de_larticle = 200;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addMagazine "SmokeShellPurple";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade fumigène bleu";
		le_prix_de_larticle = 200;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addMagazine "SmokeShellBlue";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade fumigène orange";
		le_prix_de_larticle = 200;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addMagazine "SmokeShellOrange";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "chemlight vert";
		le_prix_de_larticle = 500;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player additem "Chemlight_green";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "chemlight rouge";
		le_prix_de_larticle = 500;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player additem "Chemlight_red";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "chemlight jaune";
		le_prix_de_larticle = 500;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player additem "Chemlight_yellow";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "chemlight bleu";
		le_prix_de_larticle = 500;

		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player additem "Chemlight_blue";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
};
