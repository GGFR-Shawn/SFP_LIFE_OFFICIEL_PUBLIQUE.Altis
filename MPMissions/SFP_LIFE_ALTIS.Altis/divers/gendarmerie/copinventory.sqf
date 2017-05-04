// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = _this select 3 select 0;
if (isnil "_condition") exitwith {hint "Erreur, condition ... Recommence ...";};

switch _condition do
{
	case "0" :
	{
		createdialog "Choix_Menu_Inventaire";
	};
	case "1" :
	{
		closedialog 0;
		
		execvm "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf";
	};
	case "2" :
	{
		closedialog 0;
		
		waituntil {!isnil "fin_verification_apres_chargement"};

		_argent_vert =  "#B3FFB8";
		_argent_rouge = "#FFB3B3";


		if ((player getVariable "license_permis_de_conduire_by_sfp_maxou") == 1) then {
		havedriverinv = format ["<t color='#8EC0F8' size='1'>Permis de conduire leger</t> <br/>"];
		}
		else {
		havedriverinv = format [""];
		};

		if ((player getVariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou") == 1) then {
		havedriverpoidlourdinv = format ["<t color='#8EC0F8' size='1'>Permis de conduire poid lourd</t> <br/>"];
		}
		else {
		havedriverpoidlourdinv = format [""];
		};

		if (!isnil {player getvariable "licence_bateau_news"}) then {
		haveboatinv = format ["<t color='#8EC0F8' size='1'>Permis bateaux</t> <br/>"];
		}
		else {
		haveboatinv = format [""];
		};

		if (!isnil {player getvariable "license_pilote_news"}) then {
		haveairinv = format ["<t color='#8EC0F8' size='1'>License de pilote</t> <br/>"];
		}
		else {
		haveairinv = format [""];
		};

		if (!isnil {player getvariable "permis_port_d_arme"}) then {
		havepistolinv = format ["<t color='#8EC0F8' size='1'>Port d'armes</t> <br/>"]; 
		}
		else {
		havepistolinv = format [""];
		};

		if (!isnil {player getvariable "licence_fusils"}) then {
		haverifleinv = format ["<t color='#8EC0F8' size='1'>License fusils</t> <br/>"]; 
		}
		else {
		haverifleinv = format [""];
		};

		if ((player getVariable "mon_argent_poche_by_sfp_maxou") == 0) then {
		moneycolorinv = _argent_rouge;
		}
		else {
		moneycolorinv = _argent_vert;
		};

		if ((player getVariable "ma_date_de_naissance") > 0) then {
		ma_date_de_naissance = player getvariable "ma_date_de_naissance";
		if (ma_date_de_naissance >= 60) then {ma_date_de_naissance_calcul = ma_date_de_naissance / 60;}else {ma_date_de_naissance_calcul = player getvariable "ma_date_de_naissance";};
		if (ma_date_de_naissance >= 60) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#FFFFFF' size='1'> %1 heures.</t> <br/>", round ma_date_de_naissance_calcul];};
		if (ma_date_de_naissance < 60) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#FFFFFF' size='1'> %1 minutes.</t> <br/>", round ma_date_de_naissance_calcul];};
		if (ma_date_de_naissance >= 999999999999999999) then {madatedenaissanceinv = format ["<t color='#8EC0F8' size='1'>Naissance :</t><t color='#FFFFFF' size='1'> Je suis jésus :)</t> <br/>"];};
		}
		else {
		madatedenaissanceinv = format [""];
		};

		if (player getVariable "thirstLevel_cafe" > 0) then {
		moncafe = format ["<t color='#8EC0F8' size='1'>Effet Café Restant: <t color='#FFFFFF'>%1.</t></t> <br/>", round (player getVariable "thirstLevel_cafe")];}
		else{
		moncafe = format [""];
		};

		if (isnil "patrolmission") then {patrolmission = 0;};
		if (patrolmission == 0) then {
		havepatrolinv = parseText format ["Aucune patrouille en cours"];
		};
		if (patrolmission == 1) then {
		havepatrolinv = parseText format ["Patrouiller au point patrouille 1"];
		};
		if (patrolmission == 2) then {
		havepatrolinv = parseText format ["Patrouiller au point patrouille 2"];
		};
		if (patrolmission == 3) then {
		havepatrolinv = parseText format ["Patrouiller au point patrouille 3"];
		};
		if (patrolmission == 4) then {
		havepatrolinv = parseText format ["Patrouiller au point patrouille 4"];
		};
		if (patrolmission == 5) then {
		havepatrolinv = parseText format ["Patrouiller au point patrouille 5"];
		};
		if (patrolmission == 6) then {
		havepatrolinv = parseText format ["Patrouiller au point patrouille 6"];
		};
		if (patrolmission == 7) then {
		havepatrolinv = parseText format ["Patrouiller au point patrouille 7"];
		};
		if (patrolmission > 7) then {
		havepatrolinv = parseText format ["Il y à un bug"];
		};

		if ((player getVariable "mon_argent_banque_by_sfp_maxou") == 1) then {
		bankcolorinv = _argent_rouge;
		}
		else {
		bankcolorinv = _argent_vert;
		};

		_str = parseText format ["

		<t color='#D9B398' size='1.2' align='left'>Argent poche : <t color='#FFFFFF' size='1.1'>%2</t></t>
		<br/>
		<t color='#D9B398' size='1.2' align='left'>Argent banquaire : <t color='#FFFFFF' size='1.1'>%4</t></t>
		<br/>
		<t align='center'>-------------------------------------------------</t>
		<t align='center'>-------------------------------------------------</t>
		<br/>
		<t color='#D9B398' size='1.5'>Licences :</t>
		<br/>
		%5
		%11
		%6
		%8
		%9
		%7
		<br/>
		<t color='#D9B398' size='1.5'>Divers :</t>
		<br/>
		%13
		%12
		<br/>
		<t color='#D9B398' size='1.5'>Missions en cours :</t>
		<br/>
		<t color='#8EC0F8' size='1'>%10</t>
		<br/>
		<br/>
		<br/>
		<t align='center'>-------------------------------------------------</t><br/>
		<t color='#FFFFFF' size='1'>www.sfpteam.fr, by Maxou.</t>
		",
		moneycolorinv, //1
		format ["%1 %2",(player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp,"€"], //2
		bankcolorinv, //3
		format ["%1 %2",(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp,"€"], //4
		havedriverinv, //5
		haveboatinv, //6
		haveairinv, //7
		havepistolinv, //8
		haverifleinv, //9
		havepatrolinv, //10
		havedriverpoidlourdinv, //11
		madatedenaissanceinv, //12
		moncafe //13
		];
		hint _str;
	};
};