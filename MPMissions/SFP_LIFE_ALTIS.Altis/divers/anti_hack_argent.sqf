// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnull player};
waituntil {player == player};
waituntil {alive player};
waitUntil {sleep 5; !isNil "fin_verification_apres_chargement"};

if (!hasInterface) exitWith {systemChat "Anti-Hack Argent V2 : Initialisation terminé car vous êtes le serveur !"};

private ["_calcul_argent_poche","_calcul_argent_banque"];

avertir_que_j_ai_fait_un_hack_argent = {[{hint format ["! PROTECTION HACK ARGENT ! \n ------------------------------ \n\n Le joueur : \n\n Nom : %1 \n Temps de jeu : %2 Minutes \n\n Vient de faire un hack argent ! (système en cours de calibrage). \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",son_nom_hackeur,sa_date_hackeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;};
[] spawn {sleep (10 + (random 20));systemChat "Anti-Hack Argent V2 : Initialisation terminée.";};

while {true} do 
{
	waitUntil {sleep 0.01; alive player};	
	
	_argent_banque_un = player getvariable "mon_argent_banque_by_sfp_maxou";
	_argent_poche_un = player getvariable "mon_argent_poche_by_sfp_maxou";
	sleep 3;
	_argent_banque_deux = player getvariable "mon_argent_banque_by_sfp_maxou";
	_argent_poche_deux = player getvariable "mon_argent_poche_by_sfp_maxou";
	
	_calcul_argent_banque = round (_argent_banque_deux - _argent_banque_un);
	_calcul_argent_poche = round (_argent_poche_un - _argent_poche_deux);
	
	if ((_calcul_argent_banque > 10000 or _calcul_argent_poche > 10000) && isnil "autorisation_mouvement_argent") then
	{
		sleep 1;
		if (isnil "autorisation_mouvement_argent") then
		{
			son_nom_hackeur = name player;
			publicvariable "son_nom_hackeur";
			sa_date_hackeur = player getvariable "ma_date_de_naissance";
			publicvariable "sa_date_hackeur";
			[] call avertir_que_j_ai_fait_un_hack_argent;
			
			titletext ["Hack argent detecté (système en cours de calibrage).","PLAIN DOWN"];
			mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
		
			_detail_du_hack = format ["Le joueur %1 avec l'id %2 avec %3 minutes de jeu. Position : %4. Différence argent poche : %5 Euros , Différence argent bancaire : %6 Euros.",name player, getplayeruid player, player getvariable "ma_date_de_naissance", getPosATL player, _calcul_argent_poche, _calcul_argent_banque];
			_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
			["Hack Argent", "Les hacks d argent", _heure_du_hack, _detail_du_hack] call fn_SaveToServer;
			sleep 1;
			["Hackeur_Argent_SFP",false,true] call BIS_fnc_endMission;
		}else
		{
			autorisation_mouvement_argent = nil;
		};
	}else
	{
		if (!isnil "autorisation_mouvement_argent") then
		{
			sleep 1;
			autorisation_mouvement_argent = nil;
		};
	};
};