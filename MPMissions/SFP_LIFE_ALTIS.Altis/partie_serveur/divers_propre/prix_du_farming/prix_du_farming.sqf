// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_lancement_initilisation_tarif = [] execvm "config\config_prix_du_farming.sqf";
waitUntil {scriptDone _lancement_initilisation_tarif;};

// ====================================================================================================================================================================================
												// PRIX LEGAUX
// ====================================================================================================================================================================================

prixdelatruffes_original = prixdelatruffes;
prixdubois_original = prixdubois;
prixserpentnontransforme_original = prixserpentnontransforme;
prixducuivre_original = prixducuivre;
prixdulapins_original = prixdulapins;
prixdelor_original = prixdelor;
prixdupetrole_original = prixdupetrole;
prixdupoisson_original = prixdupoisson;
prixdupoissonspanes_original = prixdupoissonspanes;
prixdespommes_original = prixdespommes;
prixdespommesdeterre_original = prixdespommesdeterre;
prixdusel_original = prixdusel;

// ====================================================================================================================================================================================
									// PRIX ILLEGAUX
// ====================================================================================================================================================================================
prixdelabaleine_original = prixdelabaleine;
prixducannabis_original = prixducannabis;
prixdelacocaine_original = prixdelacocaine;
prixdelheroine_original = prixdelheroine;
prixdesorganesanimaux_original = prixdesorganesanimaux;
prixdelaplante_original = prixdelaplante;
prixdesmedicaments_original = prixdesmedicaments;
prixdurequins_original = prixdurequins;
prixserpenttransforme_original = prixserpenttransforme;

// ====================================================================================================================================================================================
									// MAJ DES PRIX SUIVANT LA VENTE AU MARCHE
// ====================================================================================================================================================================================
execvm "partie_serveur\divers_propre\prix_du_farming\multiplicateur_gendarmes_prix_du_farming.sqf";

"maj_prix_du_marche" addPublicVariableEventHandler 
{
	private ["_prix_a_ne_pas_descendre","_prix_a_ne_pas_depasser"];
	if (isnil "maj_prix_du_marche") exitwith {};
	_le_farming_vendu = maj_prix_du_marche select 0; // Le nom
	_le_nombre_vendu = maj_prix_du_marche select 1; // Le nombre vendu
	_prix_a_abbaisser_ou_augmenter = maj_prix_du_marche select 2; // "+" ou "-"
	maj_prix_du_marche = nil;
	
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	_detail_du_log = format ["Le farming vendu : %1 - Le nombre : %2 - Augmenter ou baisser : %3.", _le_farming_vendu, _le_nombre_vendu, _prix_a_abbaisser_ou_augmenter];
	["Historique Prix Du Farming", "Historique Prix Du Farming", _heure_du_log, _detail_du_log] call saveToDB;		
	"DIAG SFP : Prix du farming : Modification des prix par les ventes." spawn historique_creation_log_sfp;
	
	switch _le_farming_vendu do
	{
		case "prixdelatruffes" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdelatruffes_original - bourse_marge_max_a_ne_pas_descendre_truffe);
				_prix_a_ne_pas_depasser = round (prixdelatruffes_original + bourse_marge_max_a_ne_pas_depasser_truffe);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelatruffes - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdelatruffes = round (prixdelatruffes - 1);
						};
						publicvariable "prixdelatruffes";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelatruffes + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdelatruffes = round (prixdelatruffes + 1);
						};
						publicvariable "prixdelatruffes";
					};	
				};
			};
		};
		
		case "prixdubois" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdubois_original - bourse_marge_max_a_ne_pas_descendre_bois);
				_prix_a_ne_pas_depasser = round (prixdubois_original + bourse_marge_max_a_ne_pas_depasser_bois);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdubois - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdubois = round (prixdubois - 1);
						};
						publicvariable "prixdubois";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdubois + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdubois = round (prixdubois + 1);
						};
						publicvariable "prixdubois";
					};	
				};
			};
		};
		
		case "prixserpentnontransforme" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixserpentnontransforme_original - bourse_marge_max_a_ne_pas_descendre_serpent_non_tranfo);
				_prix_a_ne_pas_depasser = round (prixserpentnontransforme_original + bourse_marge_max_a_ne_pas_depasser_serpent_non_tranfo);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixserpentnontransforme - 1) > _prix_a_ne_pas_descendre) then
						{
							prixserpentnontransforme = round (prixdubois - 1);
						};
						publicvariable "prixserpentnontransforme";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixserpentnontransforme + 1) < _prix_a_ne_pas_depasser) then
						{
							prixserpentnontransforme = round (prixserpentnontransforme + 1);
						};
						publicvariable "prixserpentnontransforme";
					};	
				};
			};
		};
		
		case "prixducuivre" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixducuivre_original - bourse_marge_max_a_ne_pas_descendre_cuivre);
				_prix_a_ne_pas_depasser = round (prixducuivre_original + bourse_marge_max_a_ne_pas_depasser_cuivre);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixducuivre - 1) > _prix_a_ne_pas_descendre) then
						{
							prixducuivre = round (prixducuivre - 1);
						};
						publicvariable "prixducuivre";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixducuivre + 1) < _prix_a_ne_pas_depasser) then
						{
							prixducuivre = round (prixducuivre + 1);
						};
						publicvariable "prixducuivre";
					};	
				};
			};
		};
		
		case "prixdulapins" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdulapins_original - bourse_marge_max_a_ne_pas_descendre_lapins);
				_prix_a_ne_pas_depasser = round (prixdulapins_original + bourse_marge_max_a_ne_pas_depasser_lapins);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdulapins - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdulapins = round (prixdulapins - 1);
						};
						publicvariable "prixdulapins";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdulapins + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdulapins = round (prixdulapins + 1);
						};
						publicvariable "prixdulapins";
					};	
				};
			};
		};
		
		case "prixdelor" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdelor_original - bourse_marge_max_a_ne_pas_descendre_or);
				_prix_a_ne_pas_depasser = round (prixdelor_original + bourse_marge_max_a_ne_pas_depasser_or);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelor - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdelor = round (prixdelor - 1);
						};
						publicvariable "prixdelor";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelor + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdelor = round (prixdelor + 1);
						};
						publicvariable "prixdelor";
					};	
				};
			};
		};
		
		case "prixdupetrole" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdupetrole_original - bourse_marge_max_a_ne_pas_descendre_petrole);
				_prix_a_ne_pas_depasser = round (prixdupetrole_original + bourse_marge_max_a_ne_pas_depasser_petrole);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdupetrole - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdupetrole = round (prixdupetrole - 1);
						};
						publicvariable "prixdupetrole";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdupetrole + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdupetrole = round (prixdupetrole + 1);
						};
						publicvariable "prixdupetrole";
					};	
				};
			};
		};
		
		case "prixdupoisson" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdupoisson_original - bourse_marge_max_a_ne_pas_descendre_poissons);
				_prix_a_ne_pas_depasser = round (prixdupoisson_original + bourse_marge_max_a_ne_pas_depasser_poissons);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdupoisson - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdupoisson = round (prixdupoisson - 1);
						};
						publicvariable "prixdupoisson";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdupoisson + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdupoisson = round (prixdupoisson + 1);
						};
						publicvariable "prixdupoisson";
					};	
				};
			};
		};
		
		case "prixdupoissonspanes" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdupoissonspanes_original - bourse_marge_max_a_ne_pas_descendre_poissons_panes);
				_prix_a_ne_pas_depasser = round (prixdupoissonspanes_original + bourse_marge_max_a_ne_pas_depasser_poissons_panes);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdupoissonspanes - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdupoissonspanes = round (prixdupoissonspanes - 1);
						};
						publicvariable "prixdupoissonspanes";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdupoissonspanes + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdupoissonspanes = round (prixdupoissonspanes + 1);
						};
						publicvariable "prixdupoissonspanes";
					};	
				};
			};
		};
		
		case "prixdespommes" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdespommes_original - bourse_marge_max_a_ne_pas_descendre_pommes);
				_prix_a_ne_pas_depasser = round (prixdespommes_original + bourse_marge_max_a_ne_pas_depasser_pommes);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdespommes - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdespommes = round (prixdespommes - 1);
						};
						publicvariable "prixdespommes";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdespommes + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdespommes = round (prixdespommes + 1);
						};
						publicvariable "prixdespommes";
					};	
				};
			};
		};
		
		case "prixdespommesdeterre" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdespommesdeterre_original - bourse_marge_max_a_ne_pas_descendre_pommes_de_terre);
				_prix_a_ne_pas_depasser = round (prixdespommesdeterre_original + bourse_marge_max_a_ne_pas_depasser_pommes_de_terre);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdespommesdeterre - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdespommesdeterre = round (prixdespommesdeterre - 1);
						};
						publicvariable "prixdespommesdeterre";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdespommesdeterre + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdespommesdeterre = round (prixdespommesdeterre + 1);
						};
						publicvariable "prixdespommesdeterre";
					};	
				};
			};
		};
		
		case "prixdusel" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdusel_original - bourse_marge_max_a_ne_pas_descendre_sel);
				_prix_a_ne_pas_depasser = round (prixdusel_original + bourse_marge_max_a_ne_pas_depasser_sel);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdusel - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdusel = round (prixdusel - 1);
						};
						publicvariable "prixdusel";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdusel + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdusel = round (prixdusel + 1);
						};
						publicvariable "prixdusel";
					};	
				};
			};
		};
		
		case "prixdelabaleine" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdelabaleine_original - bourse_marge_max_a_ne_pas_descendre_baleine);
				_prix_a_ne_pas_depasser = round (prixdelabaleine_original + bourse_marge_max_a_ne_pas_depasser_baleine);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelabaleine - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdelabaleine = round (prixdelabaleine - 1);
						};
						publicvariable "prixdelabaleine";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelabaleine + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdelabaleine = round (prixdelabaleine + 1);
						};
						publicvariable "prixdelabaleine";
					};	
				};
			};
		};
		
		case "prixducannabis" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixducannabis_original - bourse_marge_max_a_ne_pas_descendre_cannabis);
				_prix_a_ne_pas_depasser = round (prixducannabis_original + bourse_marge_max_a_ne_pas_depasser_cannabis);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixducannabis - 1) > _prix_a_ne_pas_descendre) then
						{
							prixducannabis = round (prixducannabis - 1);
						};
						publicvariable "prixducannabis";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixducannabis + 1) < _prix_a_ne_pas_depasser) then
						{
							prixducannabis = round (prixducannabis + 1);
						};
						publicvariable "prixducannabis";
					};	
				};
			};
		};
		
		case "prixdelacocaine" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdelacocaine_original - bourse_marge_max_a_ne_pas_descendre_cocaine);
				_prix_a_ne_pas_depasser = round (prixdelacocaine_original + bourse_marge_max_a_ne_pas_depasser_cocaine);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelacocaine - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdelacocaine = round (prixdelacocaine - 1);
						};
						publicvariable "prixdelacocaine";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelacocaine + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdelacocaine = round (prixdelacocaine + 1);
						};
						publicvariable "prixdelacocaine";
					};	
				};
			};
		};
		
		case "prixdelheroine" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdelheroine_original - bourse_marge_max_a_ne_pas_descendre_heroine);
				_prix_a_ne_pas_depasser = round (prixdelheroine_original + bourse_marge_max_a_ne_pas_depasser_heroine);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelheroine - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdelheroine = round (prixdelheroine - 1);
						};
						publicvariable "prixdelheroine";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelheroine + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdelheroine = round (prixdelheroine + 1);
						};
						publicvariable "prixdelheroine";
					};	
				};
			};
		};
		
		case "prixdesorganesanimaux" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdesorganesanimaux_original - bourse_marge_max_a_ne_pas_descendre_organes_animaux);
				_prix_a_ne_pas_depasser = round (prixdesorganesanimaux_original + bourse_marge_max_a_ne_pas_depasser_organes_animaux);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdesorganesanimaux - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdesorganesanimaux = round (prixdesorganesanimaux - 1);
						};
						publicvariable "prixdesorganesanimaux";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdesorganesanimaux + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdesorganesanimaux = round (prixdesorganesanimaux + 1);
						};
						publicvariable "prixdesorganesanimaux";
					};	
				};
			};
		};
		
		case "prixdelaplante" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdelaplante_original - bourse_marge_max_a_ne_pas_descendre_plante);
				_prix_a_ne_pas_depasser = round (prixdelaplante_original + bourse_marge_max_a_ne_pas_depasser_plante);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelaplante - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdelaplante = round (prixdelaplante - 1);
						};
						publicvariable "prixdelaplante";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdelaplante + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdelaplante = round (prixdelaplante + 1);
						};
						publicvariable "prixdelaplante";
					};	
				};
			};
		};
		
		case "prixdesmedicaments" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdesmedicaments_original - bourse_marge_max_a_ne_pas_descendre_medicaments);
				_prix_a_ne_pas_depasser = round (prixdesmedicaments_original + bourse_marge_max_a_ne_pas_depasser_medicaments);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdesmedicaments - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdesmedicaments = round (prixdesmedicaments - 1);
						};
						publicvariable "prixdesmedicaments";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdesmedicaments + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdesmedicaments = round (prixdesmedicaments + 1);
						};
						publicvariable "prixdesmedicaments";
					};	
				};
			};
		};
		
		case "prixdurequins" :
		{
			switch _prix_a_abbaisser_ou_augmenter do
			{
				_prix_a_ne_pas_descendre = round (prixdurequins_original - bourse_marge_max_a_ne_pas_descendre_requins);
				_prix_a_ne_pas_depasser = round (prixdurequins_original + bourse_marge_max_a_ne_pas_depasser_requins);
				
				case "-" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdurequins - 1) > _prix_a_ne_pas_descendre) then
						{
							prixdurequins = round (prixdurequins - 1);
						};
						publicvariable "prixdurequins";
					};	
				};
				case "+" :
				{
					for "_i" from 0 to _le_nombre_vendu do
					{
						if (round (prixdurequins + 1) < _prix_a_ne_pas_depasser) then
						{
							prixdurequins = round (prixdurequins + 1);
						};
						publicvariable "prixdurequins";
					};	
				};
			};
		};
	};
};

// ====================================================================================================================================================================================
													// DROPBOX PRIX DU FARMING
// ====================================================================================================================================================================================
waitUntil {!isnil "heure_serveur"};

execvm "config\compilation_farming.sqf"; 
waitUntil {hint "Attente des parametres de la liste de farming ..."; !isnil "listes_des_farming_avec_parametre"}; hintsilent "";

while {true} do
{
	["Prix du farming", "Actualisé toutes les 10 minutes.", "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", ""] call saveToDB; sleep 0.3;
	_ligne_parametre = 11; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Bois :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdubois, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "une hache"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 13; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Cuivre :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixducuivre, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 14; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Lapins :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdulapins, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 16; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Or :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdelor, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 18; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Petrole :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdupetrole, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "des gants"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 19; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Poisson :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdupoisson, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "une canne a peche"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 19; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Poisson Pane :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdupoissonspanes, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "un chalutier"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 21; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Pommes :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdespommes, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 20; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Pommes de terre :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdespommesdeterre, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 22; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Sel :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdusel, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 46; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Serpent Non Transforme :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixserpentnontransforme, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 23; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Truffes :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdelatruffes, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;

	["Prix du farming", "Actualisé toutes les 10 minutes.", "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", ""] call saveToDB; sleep 0.3;
	_ligne_parametre = 0; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Baleine :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdelabaleine, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "un harpon"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 2; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Cannabis :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixducannabis, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 4; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Cocaine :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdelacocaine, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 6; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Heroine :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdelheroine, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 7; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Medicaments :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdesmedicaments, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 8; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Organes :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdesorganesanimaux, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 9; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Plantes :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdelaplante, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 10; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Requin :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixdurequins, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "un harpon"]] call saveToDB; sleep 0.3;
	_ligne_parametre = 47; ["Prix du farming", "Actualisé toutes les 10 minutes.", "Venin De Serpent :", format ["%1 %2 (prends %3 places pour %4 unités (%5 secondes de récolte)), il faut %6 pour le collecter.",prixserpenttransforme, "€", listes_des_farming_avec_parametre select _ligne_parametre select 2, listes_des_farming_avec_parametre select _ligne_parametre select 3, listes_des_farming_avec_parametre select _ligne_parametre select 4, "rien de spécial"]] call saveToDB; sleep 0.3;
		
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique Prix Du Farming", "Historique Prix Du Farming", _heure_du_log, "Ecriture des tarifs pour le forum."] call saveToDB;		
	"DIAG SFP : Prix du farming : Ecriture tarif forum." spawn historique_creation_log_sfp;

	sleep 600;
};
