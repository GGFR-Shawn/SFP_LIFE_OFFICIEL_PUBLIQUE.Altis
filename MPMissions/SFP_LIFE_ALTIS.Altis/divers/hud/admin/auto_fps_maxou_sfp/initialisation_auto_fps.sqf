// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_valeur_du_switch = _this select 0;
_valeur_a_modifier = _this select 1 select 1;
if (!(auto_fps_valeur_activation) && _valeur_du_switch != 3) exitwith {hint "! AUTO FPS SFP ! \n ------------------------------------- \n\n Opération impossible ! \n\n Activer avant l'auto FPS en bas à droite. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (isnil "_valeur_du_switch" or isnil "_valeur_a_modifier" && _valeur_du_switch != 3) exitwith {hint "Erreur, recommence ...";};

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

switch _valeur_du_switch do
{
	case 1 :
	{
		auto_fps_valeur_fps_souhaite = _valeur_a_modifier;
		hintSilent parseText format ["! AUTO FPS SFP ! <br/> ------------------------------------- <br/><br/> Voici les valeurs que vous avez choisit : <br/><br/> Valeur FPS : <t color='#00D611'>%1</t>. <br/> Valeur distance : <t color='#00D611'>%2</t> M. <br/><br/> Maj automatique dans quelques secondes ... <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", round auto_fps_valeur_fps_souhaite, round auto_fps_valeur_distance_mini];
	};
	case 2 :
	{
		auto_fps_valeur_distance_mini = _valeur_a_modifier;
		hintSilent parseText format ["! AUTO FPS SFP ! <br/> ------------------------------------- <br/><br/> Voici les valeurs que vous avez choisit : <br/><br/> Valeur FPS : <t color='#00D611'>%1</t>. <br/> Valeur distance : <t color='#00D611'>%2</t> M. <br/><br/> Maj automatique dans quelques secondes ... <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", round auto_fps_valeur_fps_souhaite, round auto_fps_valeur_distance_mini];
	};
	case 3 :
	{
		if (isnil "autorisation_mouvement_auto_fps_activation") then {autorisation_mouvement_auto_fps_activation = true;};
		if !(autorisation_mouvement_auto_fps_activation) exitwith {hint "Patiente quelques secondes que le vieux script ce termine ...";};
		autorisation_mouvement_auto_fps_activation = false;
				
		if (auto_fps_valeur_activation) then
		{
			auto_fps_valeur_activation = false;
			hint "! AUTO FPS SFP ! \n ------------------------------------- \n\n L'auto FPS à bien été désactivé ... \n\n Re-règle la distance d'affichage avec la touche Y si tu le souhaites.  \n\n PS : Sache qu'il est enregistré dans ta sauvegarde pour ton pseudo actuellement ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";	
			
			((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1008) ctrlSetText "Actuellement éteint !";
			((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1008) ctrlSetTextColor _couleur_rouge;
		}else
		{
			auto_fps_valeur_activation = true;
			hint "! AUTO FPS SFP ! \n ------------------------------------- \n\n L'auto FPS à bien été activé ... \n\n Patiente quelques secondes, le script va se mettre a jour. \n\n PS : Sache qu'il est enregistré dans ta sauvegarde pour ton pseudo actuellement ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";	

			((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1008) ctrlSetText "Actuellement allumé !";
			((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1008) ctrlSetTextColor _couleur_verte;
		};
		['auto_fps_valeur_activation', auto_fps_valeur_activation] call uid_sauvegarde_ecrire_local_joueur_sfp;
		sleep 10;
		autorisation_mouvement_auto_fps_activation = nil;
	};
	
};

((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1009) ctrlSetText format ["%1", round auto_fps_valeur_fps_souhaite];
((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1009) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1010) ctrlSetText format ["%1", round auto_fps_valeur_distance_mini];
((uiNamespace getVariable "Menu_Auto_FPS_Maxou") displayCtrl 1010) ctrlSetTextColor _couleur_verte;
