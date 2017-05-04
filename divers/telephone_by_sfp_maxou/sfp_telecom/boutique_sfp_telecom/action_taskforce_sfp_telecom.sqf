// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_action_telecom_option_maxou_choisit = _this select 0 select 1;
_choix_selection_de_l_option = listes_taskforce_sfp_telecom select _action_telecom_option_maxou_choisit;
_son_nom_sfp_telecom = _choix_selection_de_l_option select 0;
_sa_classe_sfp_telecom = _choix_selection_de_l_option select 1;
_son_prix_sfp_telecom = _choix_selection_de_l_option select 2;
_la_configuration = _choix_selection_de_l_option select 3;
if (isnil "_action_telecom_option_maxou_choisit") exitwith {hint "Erreur, recommence ...";};
if !(isnull (unitBackpack player)) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Bonjour, \n\n Vous avez déja un sac à dos, veuillez l'enlever pour acheter une radio. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (!isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Bonjour, \n\n Vous ne pouvez pas acheter cette radio car vous n'avez pas taskforce ... \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (!(player canAdd _sa_classe_sfp_telecom) && _sa_classe_sfp_telecom != "tf_anarc210" && _sa_classe_sfp_telecom != "tf_rt1523g") exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Bonjour, \n\n Vous ne pouvez pas acheter cette radio car vous n'avez pas assez de place sur vous ! \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};

hint format ["! SFP TELECOM !\n ------------------------------------- \n Bonjour, \n\n SFP TELECOM est heureux de vous avoir vendu %1 pour %2 %3. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> _sa_classe_sfp_telecom >> "displayName"), (_son_prix_sfp_telecom) call retour_formatage_chiffre_sfp, "€"];

player setVariable ['mon_argent_banque_by_sfp_maxou', (player getvariable "mon_argent_banque_by_sfp_maxou") - _son_prix_sfp_telecom,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

if (_la_configuration < 2) then
{
	player addbackpack _sa_classe_sfp_telecom;
}else
{
	player unassignItem "itemradio";
	player removeItem "itemradio";
	
	player addItem _sa_classe_sfp_telecom;
};

closedialog 0;