// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private ["_condition_trouve","_vente_marche_noir","_vente_accordee_marche_noir"];
_condition_trouve = false;
_vente_marche_noir = false;
_vente_accordee_marche_noir = true;
ligne_colone_du_farming_gauche = lbcursel 1501;
choix_montant_du_menu_farming = nil;
if (lbtext ([1501,0]) == "Rien dans l'inventaire.") exitwith {hint "Vous n'avez aucun farming ...";};

createdialog "Menu_Choix_Montant_Farming";
waituntil {sleep 0.01; !isnil "choix_montant_du_menu_farming" or isnull (findDisplay 125896)};
if (isnil "choix_montant_du_menu_farming") exitwith {hint "Opération annulée";};

_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 
_prix_d_une_ressource = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 3; 
_temps_pour_jeter_un_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 4; 

if (isnil {player getvariable _nom_de_la_variable_du_farming}) exitWith {hint "Variable inconnu ... Contact Maxou";};
if (isnil "_nom_de_la_variable_du_farming" or isnil "_nombre_de_place_de_la_variable" or isnil "_nom_du_produit_de_farming" or isnil "_prix_d_une_ressource" or isnil "_temps_pour_jeter_un_farming") exitwith {hint "Erreur, recommence ...";};
if (player getvariable _nom_de_la_variable_du_farming < choix_montant_du_menu_farming) exitwith {hint format ["Opération impossible, %1 %2 maximum ...", player getvariable _nom_de_la_variable_du_farming, _nom_du_produit_de_farming];};

switch _nom_de_la_variable_du_farming do
{
	case "item_bois_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdubois",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupetrole",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_cuivre_transforme_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixducuivre",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdusel",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_lapins_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdulapins",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoisson",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoissonspanes",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "serpent_non_transforme" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdulapins",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoisson",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoissonspanes",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixserpentnontransforme",_this,"-"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "serpent_transforme" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdulapins",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoisson",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoissonspanes",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixserpentnontransforme",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixserpenttransforme",_this,"-"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_or_transforme_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdelor",_this,"-"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_petrole_traite_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdupetrole",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdubois",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_poissons_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdupoisson",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoissonspanes",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdulapins",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_poissons_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdupoisson",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoissonspanes",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdulapins",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "itemfishpoissonspanes" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdupoissonspanes",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdupoisson",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdulapins",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_pomme_de_terre_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdespommesdeterre",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdespommes",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdelatruffes",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_pomme_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdespommes",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdespommesdeterre",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdelatruffes",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_sel_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdusel",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixducuivre",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_truffe_sfp" :
	{
		_condition_trouve = true;

		[] spawn
		{
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdelatruffes",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdespommes",_this,"+"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdespommesdeterre",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_baleine_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdelabaleine",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdurequins",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_cannabis_traite_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixducannabis",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdesorganesanimaux",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_cocaine_poudre_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdelacocaine",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdelheroine",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_heroine_traite_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdelheroine",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdelacocaine",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_medicaments_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdesmedicaments",_this,"-"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_organes_animaux_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdesorganesanimaux",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixducannabis",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_plante_illegale_prete_a_vendre_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdelaplante",_this,"-"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
	case "item_requin_sfp" :
	{
		_condition_trouve = true;
		_vente_marche_noir = true;
		
		[] spawn
		{			
			choix_montant_du_menu_farming spawn 
			{
				maj_prix_du_marche = ["prixdurequins",_this,"-"]; publicvariable "maj_prix_du_marche";
				sleep 0.5;
				maj_prix_du_marche = ["prixdelabaleine",_this,"+"]; publicvariable "maj_prix_du_marche";
			};
		};
	};
	
};

if (_vente_marche_noir) then
{
	je_vends_au_marche_noir_protection = 1;
	
	closeDialog 0;
	
	_temps_de_la_vente = (_temps_pour_jeter_un_farming * choix_montant_du_menu_farming);
	for "_i" from 0 to _temps_de_la_vente do
	{
		if (alive player && player distance marche_noir_creation < 10) then
		{
			0 cuttext [format ["! VENTE ILLEGALE ! \n --------------------------------------------------------------- \n\n Encore %1 secondes afin de finir ta transaction ! \n\n Attention, si tu t'écarte de plus de 10 mètres du PNJ, la vente sera annulée !",round (_temps_de_la_vente - _i)],"PLAIN DOWN",1];
			sleep 1;
		};
	};
	if !(alive player) exitwith {_vente_accordee_marche_noir = false; je_vends_au_marche_noir_protection = 0; 0 cutText ["", "BLACK IN",3];};
	if (player distance marche_noir_creation > 10) exitwith {_vente_accordee_marche_noir = false; je_vends_au_marche_noir_protection = 0; cutText ["\n\n\n\n\n Vente annulée ! \n tu est partit trop loin du PNJ !","BLACK IN",3];};
	je_vends_au_marche_noir_protection = 0;
};
if (!_vente_accordee_marche_noir) exitwith {};

if (!_condition_trouve) then 
{
	hint "Désolé, aucun farming a vendre de trouvé sur le marché !";
}else
{
	patron_des_ressources_du_serveur = patron_des_ressources_du_serveur + choix_montant_du_menu_farming;
	publicvariable "patron_des_ressources_du_serveur";
	
	player setVariable ['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') + (_prix_d_une_ressource * choix_montant_du_menu_farming),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - choix_montant_du_menu_farming, true];
	player setvariable ["usedspace", (player getvariable "usedspace") - (choix_montant_du_menu_farming * _nombre_de_place_de_la_variable), true];
	
	hint format ["! MARCHE SFP ! \n -------------------------------------------- \n \n Vous avez vendu %1 %2 pour un montant de %3 %4. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", choix_montant_du_menu_farming, _nom_du_produit_de_farming, (_prix_d_une_ressource * choix_montant_du_menu_farming) call retour_formatage_chiffre_sfp,"€"];
};

_execution_mise_a_jour = execvm "menu\nouveau_menu_vendre_au_marche\configuration_du_farming_pour_vendre.sqf";
waitUntil {scriptDone _execution_mise_a_jour;};
execvm "menu\nouveau_menu_vendre_au_marche\mise_a_jour_informations_farming_marche.sqf";
