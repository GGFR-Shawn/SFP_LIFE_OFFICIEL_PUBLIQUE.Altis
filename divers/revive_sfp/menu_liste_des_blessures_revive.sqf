// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
// Configuration des ID dialogues sfp maxou
// =======================================================================================================================================================================================
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_sur_qui_scanner = _this select 0;
if (isnil "_sur_qui_scanner") exitwith {hint "Erreur sur le bléssé, recommence ...";};

_nom_du_menu = "Menu_blessures_sfp";
_titre_add_id = 1001;
_revive_image_tete = 1201;
_revive_image_buste = 1203;
_revive_image_estomac = 1204;
_revive_image_bras_droit = 1200;
_revive_image_bras_gauche = 1202;
_revive_image_cuisse_gauche = 1205;
_revive_image_cuisse_droite = 1206;
_revive_image_tibia_droit = 1207;
_revive_image_tibia_gauche = 1208;
_revive_image_pied_droit = 1209;
_revive_image_pied_gauche = 1210;
_texte_degat_pied_droit = 9999;
_texte_degat_pied_gauche = 1007;
_texte_degat_tibia_droit = 1005;
_texte_degat_tibia_gauche = 1008;
_texte_degat_cuisse_droite = 1006;
_texte_degat_cuisse_gauche = 1009;
_texte_degat_bras_droit = 1010;
_texte_degat_bras_gauche = 1011;
_texte_degat_tete = 1012;
_texte_revive_message_explication = 1100;
_texte_sante_global = 1101;
_texte_niveau_secouriste = 1102;

_bouton_tete_revive = 1701;
_bouton_buste_revive = 1702;
_bouton_bras_droit_revive = 1703;
_bouton_bras_gauche_revive = 1704;
_bouton_estomac_revive = 1705;
_bouton_cuisse_droite_revive = 1706;
_bouton_cuisse_gauche_revive = 1707;
_bouton_tibia_droit_revive = 1708;
_bouton_tibia_gauche_revive = 1709;
_bouton_pied_droit_revive = 1710;
_bouton_pied_gauche_revive = 1711;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_couleur_blanche = [1,1,1,1]; 

// =======================================================================================================================================================================================
// Calcul des dommages du joueur
// =======================================================================================================================================================================================
if (!isnil {_sur_qui_scanner getvariable "besoin_d_un_revive_news"}) then
{
	_detection_si_joueur_soigner_entierement = true;
	{
		if (_x > 0) then
		{
			_detection_si_joueur_soigner_entierement = false;
		};
	} foreach (_sur_qui_scanner getvariable "mes_blessures_revive_sfp");

	if (_detection_si_joueur_soigner_entierement) then 
	{
		_valeur = [0,0,0,0,0,0.2,0.4,0.6,0.8];
		_sur_qui_scanner setVariable ["mes_blessures_revive_sfp", [_valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom, _valeur call bis_fnc_selectrandom],true];
	};
};

// =======================================================================================================================================================================================
// Calcul des dommages du joueur
// =======================================================================================================================================================================================
_calcul_degat_tete = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 0) * 100);
_calcul_degat_buste = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 1) * 100);
_calcul_degat_estomac = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 2) * 100);
_calcul_degat_bras_droit = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 3) * 100);
_calcul_degat_bras_gauche = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 4) * 100);
_calcul_degat_cuisse_droite = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 5) * 100);
_calcul_degat_cuisse_gauche = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 6) * 100);
_calcul_degat_tibia_droit = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 7) * 100);
_calcul_degat_tibia_gauche = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 8) * 100);
_calcul_degat_pied_droit = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 9) * 100);
_calcul_degat_pied_gauche = ((_sur_qui_scanner getvariable "mes_blessures_revive_sfp" select 10) * 100);
_calcul_sante_global = ((_calcul_degat_tete + _calcul_degat_buste + _calcul_degat_estomac + _calcul_degat_bras_droit + _calcul_degat_bras_gauche + _calcul_degat_cuisse_droite + _calcul_degat_cuisse_gauche + _calcul_degat_tibia_droit + _calcul_degat_tibia_gauche + _calcul_degat_pied_droit + _calcul_degat_pied_gauche) / 11);

// =======================================================================================================================================================================================
// Lancement du menu avec configuration automatique sfp maxou
// =======================================================================================================================================================================================
createDialog _nom_du_menu;
disableSerialization;


// Titre
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Menu Revive Liste Des Blessures SFP";
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_verte;


// Message explication
_description = format
["
	Bienvenue sur le nouveau revive SFP !
	<br/>
	<br/>
	Pour soigner un joueur, il te suffit simplement de cliquer sur la partie bleue à soigner.
	<br/>
	<br/>
	Pour information, voici la liste des dégats :
	<br/>
	<br/>
	Blessure Tête = %2 %1. <br/>
	Blessure Buste = %3 %1. <br/>
	Blessure Estomac = %4 %1. <br/>
	Blessure Bras Et Main Droite = %5 %1. <br/>
	Blessure Bras Et Main gauche = %6 %1. <br/>
	Blessure Cuisse Droite = %7 %1. <br/>
	Blessure Cuisse Gauche = %8 %1. <br/>
	Blessure Tibia Gauche = %9 %1. <br/>
	Blessure Tibia Droit = %10 %1. <br/>
	Blessure Pied Droit = %11 %1. <br/>
	Blessure Pied Gauche = %12 %1. <br/>
	<br/>
	<br/>
	Bon courage ;)
",
	"%",
	_calcul_degat_tete,
	_calcul_degat_buste,
	_calcul_degat_estomac,
	_calcul_degat_bras_droit,
	_calcul_degat_bras_gauche,
	_calcul_degat_cuisse_droite,
	_calcul_degat_cuisse_gauche,
	_calcul_degat_tibia_gauche,
	_calcul_degat_tibia_droit,
	_calcul_degat_pied_droit,
	_calcul_degat_pied_gauche
];				

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_revive_message_explication) ctrlSetStructuredText parseText _description;


// Choix couleur des images
if (_calcul_degat_tete > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_tete) ctrlSetText "textures\revive_sfp\tete_rouge_sfp.paa";};
if (_calcul_degat_buste > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_buste) ctrlSetText "textures\revive_sfp\buste_rouge_sfp.paa";};
if (_calcul_degat_estomac > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_estomac) ctrlSetText "textures\revive_sfp\estomac_rouge_sfp.paa";};
if (_calcul_degat_bras_droit > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_bras_droit) ctrlSetText "textures\revive_sfp\bras_et_main_droite_rouge.paa";};
if (_calcul_degat_bras_gauche > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_bras_gauche) ctrlSetText "textures\revive_sfp\bras_et_main_gauche_rouge.paa";};
if (_calcul_degat_cuisse_droite > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_cuisse_droite) ctrlSetText "textures\revive_sfp\cuisse_droite_rouge.paa";};
if (_calcul_degat_cuisse_gauche > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_cuisse_gauche) ctrlSetText "textures\revive_sfp\cuisse_gauche_rouge.paa";};
if (_calcul_degat_tibia_gauche > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_tibia_gauche) ctrlSetText "textures\revive_sfp\tibia_gauche_rouge.paa";};
if (_calcul_degat_tibia_droit > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_tibia_droit) ctrlSetText "textures\revive_sfp\tibia_droite_rouge.paa";};
if (_calcul_degat_pied_droit > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_pied_droit) ctrlSetText "textures\revive_sfp\pied_droit_rouge.paa";};
if (_calcul_degat_pied_gauche > 0) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _revive_image_pied_gauche) ctrlSetText "textures\revive_sfp\pied_gauche_rouge.paa";};


// Choix pourcentage du texte
((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_tete) ctrlSetText format ["%1 %2", round _calcul_degat_tete, "%"];
if (_calcul_degat_tete < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_tete) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_bras_droit) ctrlSetText format ["%1 %2", round _calcul_degat_bras_droit, "%"];
if (_calcul_degat_bras_droit < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_bras_droit) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_bras_gauche) ctrlSetText format ["%1 %2", round _calcul_degat_bras_gauche, "%"];
if (_calcul_degat_bras_gauche < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_bras_gauche) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_cuisse_droite) ctrlSetText format ["%1 %2", round _calcul_degat_cuisse_droite, "%"];
if (_calcul_degat_cuisse_droite < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_cuisse_droite) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_cuisse_gauche) ctrlSetText format ["%1 %2", round _calcul_degat_cuisse_gauche, "%"];
if (_calcul_degat_cuisse_gauche < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_cuisse_gauche) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_tibia_droit) ctrlSetText format ["%1 %2", round _calcul_degat_tibia_droit, "%"];
if (_calcul_degat_tibia_droit < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_tibia_droit) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_tibia_gauche) ctrlSetText format ["%1 %2", round _calcul_degat_tibia_gauche, "%"];
if (_calcul_degat_tibia_gauche < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_tibia_gauche) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_pied_droit) ctrlSetText format ["%1 %2", round _calcul_degat_pied_droit, "%"];
if (_calcul_degat_pied_droit < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_pied_droit) ctrlSetTextColor _couleur_verte;};

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_pied_gauche) ctrlSetText format ["%1 %2", _calcul_degat_pied_gauche, "%"];
if (_calcul_degat_pied_gauche < 1) then {((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_degat_pied_gauche) ctrlSetTextColor _couleur_verte;};


// Activation ou non de l'autorisation de soigner cette partie
if (_calcul_degat_tete == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_tete_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats à la tête ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_tete_revive) ctrlAddEventHandler ["ButtonClick", {[0] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_buste == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_buste_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats au buste ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_buste_revive) ctrlAddEventHandler ["ButtonClick", {[1] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_estomac == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_estomac_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats à l'estomac ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_estomac_revive) ctrlAddEventHandler ["ButtonClick", {[2] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_bras_droit == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_bras_droit_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur le bras droit ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_bras_droit_revive) ctrlAddEventHandler ["ButtonClick", {[3] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_bras_gauche == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_bras_gauche_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur le bras gauche ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_bras_gauche_revive) ctrlAddEventHandler ["ButtonClick", {[4] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_cuisse_droite == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_cuisse_droite_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur la cuisse droite ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_cuisse_droite_revive) ctrlAddEventHandler ["ButtonClick", {[5] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_cuisse_gauche == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_cuisse_gauche_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur la cuisse gauche ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_cuisse_gauche_revive) ctrlAddEventHandler ["ButtonClick", {[6] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_tibia_droit == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_tibia_droit_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur le tibia droit ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_tibia_droit_revive) ctrlAddEventHandler ["ButtonClick", {[7] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_tibia_gauche == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_tibia_gauche_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur le tibia gauche ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_tibia_gauche_revive) ctrlAddEventHandler ["ButtonClick", {[8] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_pied_droit == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_pied_droit_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur le pied droit ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_pied_droit_revive) ctrlAddEventHandler ["ButtonClick", {[9] spawn variable_action_soigner_joueur_revive;}];
};

if (_calcul_degat_pied_gauche == 0) then 
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_pied_gauche_revive) ctrlAddEventHandler ["ButtonClick", {hint "Il n'y à aucuns dégats sur le pied gauche ..."; systemchat "Il n'y à aucuns dégats ...";}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _bouton_pied_gauche_revive) ctrlAddEventHandler ["ButtonClick", {[10] spawn variable_action_soigner_joueur_revive;}];
};


// Santé global du joueur
((uiNameSpace getVariable _nom_du_menu) displayCtrl _texte_sante_global) ctrlSetStructuredText parseText format ["<t align='center'><t size='1.1'>Santé globale du joueur : <t color='#0DCC00'>%1</t> %2</t></t>", _calcul_sante_global, "%"];

// Niveau secouriste
((uiNameSpace getVariable _nom_du_menu) displayCtrl _texte_niveau_secouriste) ctrlSetStructuredText parseText format ["<t align='center'><t size='1.1'>Mon niveau de secouriste : <t color='#0DCC00'>%1</t> sur %2. %3%4 de chance de réussir à soigner les blessures graves (+ de 50%4) !</t></t>", player getvariable "mon_niveau_secouriste", niveau_max_secouriste_revive, round (10 * (player getvariable "mon_niveau_secouriste")),"%"];

waituntil {!dialog;};
cutText["","BLACK IN"];
