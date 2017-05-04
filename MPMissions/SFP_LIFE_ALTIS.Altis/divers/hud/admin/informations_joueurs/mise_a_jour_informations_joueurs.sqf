// =====================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

_couleur_verte = [0,0.91,0.07,1];
_ligne_du_tableau = 0;
_numero_add = 1500;
_numero_add_deux = 1501;
_joueur_selectionne = lbtext [_numero_add, lbCurSel _numero_add];

le_joueur_selectionne_informations_admin = nil;
{
	if (name _x == _joueur_selectionne) then
	{
		le_joueur_selectionne_informations_admin = _x;
	};
} foreach playableunits;

if (isnil "le_joueur_selectionne_informations_admin") exitwith {hint "Erreur sur la personne recherché !";};

lbClear _numero_add_deux;
// =====================================================================================================================================================================================================================
																  // Envoyer Information
// =====================================================================================================================================================================================================================

lbAdd [_numero_add_deux, format['Nom : %1.', name le_joueur_selectionne_informations_admin]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);

lbAdd [_numero_add_deux, format['Pseudo Utilisé : %1.', le_joueur_selectionne_informations_admin getvariable "mes_pseudos_utilises"]]; 
if (count (le_joueur_selectionne_informations_admin getvariable "mes_pseudos_utilises") < 1) then {lbDelete [_numero_add_deux, _ligne_du_tableau]; lbAdd [_numero_add_deux, 'Pseudo Utilisé : Aucun autre.'];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Date de naissance : %1 Heures.', round ((le_joueur_selectionne_informations_admin getvariable "ma_date_de_naissance") / 60)]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Argent en banque : %1 €.', (le_joueur_selectionne_informations_admin getvariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Argent en poche : %1 €.', (le_joueur_selectionne_informations_admin getvariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Livret A : %1 €.', round (le_joueur_selectionne_informations_admin getvariable "mon_livret_a")]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Nombre de points permis : %1.', round (le_joueur_selectionne_informations_admin getvariable "combien_de_point_by_sfp_maxou")]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Nombre de permis : %1.', round (le_joueur_selectionne_informations_admin getvariable "nombre_de_permis")]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Espace Utilisé : %1/%2.', round (le_joueur_selectionne_informations_admin getvariable "usedspace"), round (le_joueur_selectionne_informations_admin getvariable "totalspace")]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Vie actuelle : %1 %2.', round (100 - ((round ((damage le_joueur_selectionne_informations_admin) * (10 ^ 2)) / (10 ^ 2)) * 100)), "%"]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Vitesse actuel : %1 Km/h.', round (speed le_joueur_selectionne_informations_admin)]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "besoin_d_un_revive_news"}) then {lbAdd [_numero_add_deux, format['Besoin revive : %1.', "Non"]]; }else{lbAdd [_numero_add_deux, format['Besoin revive : %1.', "Oui"]]; };_ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (le_joueur_selectionne_informations_admin getvariable "license_permis_de_conduire_by_sfp_maxou" < 1) then {lbAdd [_numero_add_deux, format['Permis de conduire léger : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Permis de conduire léger : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (le_joueur_selectionne_informations_admin getvariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou" < 1) then {lbAdd [_numero_add_deux, format['Permis de conduire lourd : %1.', "Non"]]; }else{lbAdd [_numero_add_deux, format['Permis de conduire lourd : %1.', "Oui"]];};_ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "licence_bateau_news"}) then {lbAdd [_numero_add_deux, format['Permis bateau : %1.', "Non"]]; }else{lbAdd [_numero_add_deux, format['Permis bateau : %1.', "Oui"]];};_ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "license_pilote_news"}) then {lbAdd [_numero_add_deux, format['License pilote : %1.', "Non"]]; }else{lbAdd [_numero_add_deux, format['License pilote : %1.', "Oui"]];};_ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "permis_port_d_arme"}) then {lbAdd [_numero_add_deux, format['License pistolet : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['License pistolet : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "licence_fusils"}) then {lbAdd [_numero_add_deux, format['License fusil : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['License fusil : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable sfp_config_famille_une_nom_pour_variable}) then {lbAdd [_numero_add_deux, format['%1 : %2.', sfp_config_famille_une_nom, "Non"]];}else{lbAdd [_numero_add_deux, format['%1 : %2.', sfp_config_famille_une_nom, "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable sfp_config_famille_deux_nom_pour_variable}) then {lbAdd [_numero_add_deux, format['%1 : %2.', sfp_config_famille_deux_nom , "Non"]];}else{lbAdd [_numero_add_deux, format['%1 : %1.', sfp_config_famille_deux_nom, "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "sarl_autoecole"}) then {lbAdd [_numero_add_deux, format['Travail auto-école : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Travail auto-école : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "sarl_avocat"}) then {lbAdd [_numero_add_deux, format['Travail avocat : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Travail avocat : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "sarl_car_shop"}) then {lbAdd [_numero_add_deux, format['Travail carshop : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Travail carshop : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "sarl_depannage"}) then {lbAdd [_numero_add_deux, format['Travail dépannage : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Travail dépannage : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "sarl_neomedia"}) then {lbAdd [_numero_add_deux, format['Travail Néomédia : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Travail Néomédia : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "sarl_pompier"}) then {lbAdd [_numero_add_deux, format['Travail pompier : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Travail pompier : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (isnil {le_joueur_selectionne_informations_admin getvariable "sarl_taxis_gsept"}) then {lbAdd [_numero_add_deux, format['Travail taxi : %1.', "Non"]];}else{lbAdd [_numero_add_deux, format['Travail taxi : %1.', "Oui"]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
lbAdd [_numero_add_deux, format['Uniforme : %1 (%2).', uniform le_joueur_selectionne_informations_admin, getText (configFile >> "cfgWeapons" >> (uniform le_joueur_selectionne_informations_admin) >> "displayName")]]; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (vest le_joueur_selectionne_informations_admin == "") then {lbAdd [_numero_add_deux, format['Veste : %1.', "Aucune"]];}else{lbAdd [_numero_add_deux, format['Vest : %1 (%2).', vest le_joueur_selectionne_informations_admin, getText (configFile >> "cfgWeapons" >> (vest le_joueur_selectionne_informations_admin) >> "displayName")]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (headGear le_joueur_selectionne_informations_admin == "") then {lbAdd [_numero_add_deux, format['Chapeau : %1.', "Aucun"]];}else{lbAdd [_numero_add_deux, format['Chapeau : %1 (%2).', headGear le_joueur_selectionne_informations_admin, getText (configFile >> "cfgWeapons" >> (headGear le_joueur_selectionne_informations_admin) >> "displayName")]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (backpack le_joueur_selectionne_informations_admin == "") then {lbAdd [_numero_add_deux, format['Sac a dos : %1.', "Aucun"]];}else{lbAdd [_numero_add_deux, format['Sac a dos : %1 (%2).', backpack le_joueur_selectionne_informations_admin, getText (configFile >> "cfgvehicles" >> (backpack le_joueur_selectionne_informations_admin) >> "displayName")]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (count (backpackItems le_joueur_selectionne_informations_admin) < 1) then {lbAdd [_numero_add_deux, format['Contenance sac a dos : %1.', "Rien"]];}else{lbAdd [_numero_add_deux, format['Contenance sac a dos : %1.', backpackItems le_joueur_selectionne_informations_admin]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);


lbAdd [_numero_add_deux, '']; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (primaryWeapon le_joueur_selectionne_informations_admin == "") then {lbAdd [_numero_add_deux, format['Arme principale : %1.', "Aucune"]];}else{lbAdd [_numero_add_deux, format['Arme principale : %1 (%2).', primaryWeapon le_joueur_selectionne_informations_admin, getText (configFile >> "cfgWeapons" >> (currentWeapon le_joueur_selectionne_informations_admin) >> "displayName")]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);
if (secondaryWeapon le_joueur_selectionne_informations_admin == "") then {lbAdd [_numero_add_deux, format['Arme secondaire : %1.', "Aucune"]];}else{lbAdd [_numero_add_deux, format['Arme secondaire : %1 (%2).', secondaryWeapon le_joueur_selectionne_informations_admin, getText (configFile >> "cfgWeapons" >> (secondaryWeapon le_joueur_selectionne_informations_admin) >> "displayName")]];}; _ligne_du_tableau = round (_ligne_du_tableau + 1);

