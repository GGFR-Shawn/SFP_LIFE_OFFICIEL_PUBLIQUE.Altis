// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_condition","_description","_couleur_valeur","_resultat"];
createDialog 'Menu_tablette_sfp_Choix_Telephone';

if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {_condition = "0";};
if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1) then {_condition = "1";};
if (player getvariable "je_possede_un_telephone_sfp" select 0 > 0) then {_condition = "2";};
if (isnil {player getvariable "mon_numero_de_telephone"}) then {hint "Aucun numéro de téléphone défini ... Patientez quelques secondes ..."; _time = time; waituntil {closedialog 0; time - _time > 3;}; ['1'] execVM 'divers\telephone_by_sfp_maxou\donner_ou_changer_numero_de_tel.sqf';};

switch _condition do
{
	case "0" :
	{
		_description = "
							<br/>
							<br/>
							Désolé, vous n'avez pas de téléphone !
							<br/>
							<br/>
							Allez directement à SFP Télécom pour en acheter un ;)
							<br/>
							<br/>
							Bon achat !
						";
		
		_couleur_valeur = [0,0,0,1];
	};

	case "1" :
	{
		_description = "
							<br/>
							<br/>
							Désolé, vous n'avez pas de téléphone !
							<br/>
							<br/>
							Allez directement à SFP Télécom pour en acheter un ;)
							<br/>
							<br/>
							Bon achat !
						";

		_couleur_valeur = [0,0.91,0.07,1];
	};
	
	case "2" :
	{
		if (player getvariable "je_possede_un_telephone_sfp" select 1 < 1) then
		{
			_resultat = "Votre téléphone est eteint.";
		}else
		{
			_resultat = "Votre téléphone est allumé.";
		};
		
		_description = format 
					[
						"
						<br/>
						Bonjour,
						<br/>
						<br/>
						Il vous reste actuellement %1 texto(s).
						<br/>
						<br/>
						%2
						<br/>
						<br/>
						Votre numéro est le %3.
						",
						player getvariable 'je_possede_un_telephone_sfp' select 2,
						_resultat,
						player getvariable "mon_numero_de_telephone"
					]
						;

		_couleur_valeur = [0,0,0,1];
	};
};

((uiNamespace getVariable "Menu_tablette_sfp_Choix_Telephone") displayCtrl 1005) ctrlSetStructuredText parseText _description;
((uiNamespace getVariable "Menu_tablette_sfp_Choix_Telephone") displayCtrl 1005) ctrlSetTextColor _couleur_valeur;
