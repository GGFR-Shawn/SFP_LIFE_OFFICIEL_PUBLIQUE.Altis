// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (isnull cursortarget) exitwith {hint "Désolé, rien n'est pointé !";};

createdialog "Taux_Prix_Pourcentage_SARL_DEPANNAGE";
ctrlSetText[11115,"Définir Prix Par Pourcentage ..."];
while {!isnil "le_taux_choisit_sarl_depannage"} do {le_taux_choisit_sarl_depannage = nil; sleep 0.1;};
waituntil {!isnil "le_taux_choisit_sarl_depannage";};

 
_veh = cursortarget;

hint format ["! SARL DIR ! \n --------------------------------------- \n\n Bonjour %1,\n\n Cet outil, bien pratique ! Te permettra de définir exactement les dégats du véhicule pour un chiffrage après analyse ... \n\n Patiente, tout va se faire seul ... \n\n Pour rappel, tu as choisit comme taux: %2 Euros par pourcentage. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player, le_taux_choisit_sarl_depannage];
sleep 1;

_VR = _veh getHitPointDamage "HitVRotor";
_HR = _veh getHitPointDamage "HitHRotor";
_AV = _veh getHitPointDamage "HitAvionics";
_body = _veh getHitPointDamage "HitHull";

_R1 = _veh getHitPointDamage "HitLBWheel";
_R2 = _veh getHitPointDamage "HitLFWheel";
_R3 = _veh getHitPointDamage "HitRBWheel";
_R4 = _veh getHitPointDamage "HitRFWheel";
_carrosserie = _veh getHitPointDamage "HitBody";
_moteur = _veh getHitPointDamage "HitEngine";
_Fuel = _veh getHitPointDamage "HitFuel";

if (!isnil "_VR") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat carrosserie !</t>",round (_VR * 100)],"textures\icones\vehicles\veh-hunt-hull.paa"]] call bis_fnc_showNotification;
	prix_un_devis = round ((_VR * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_un = format ["Rotor 1: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_VR * 100), prix_un_devis, "%"];
}else
{
	prix_un_devis = 0;
	recapitulatif_un = format ["Rotor 1: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_un_devis];
};
sleep (random 3);

if (!isnil "_HR") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat carrosserie !</t>",round (_HR * 100)],"textures\icones\vehicles\veh-hunt-hull.paa"]] call bis_fnc_showNotification;
	prix_deux_devis = round ((_HR * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_deux = format ["Rotor 2: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_HR * 100), prix_deux_devis, "%"];
}else
{
	prix_deux_devis = 0;
	recapitulatif_deux = format ["Rotor 2: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_deux_devis];
};
sleep (random 3);

if (!isnil "_AV") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat carrosserie !</t>",round (_AV * 100)],"textures\icones\vehicles\veh-hunt-hull.paa"]] call bis_fnc_showNotification;
	prix_trois_devis = round ((_AV * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_trois = format ["AvionIC: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_AV * 100), prix_trois_devis, "%"];
}else
{
	prix_trois_devis = 0;
	recapitulatif_trois = format ["AvionIC: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_trois_devis];	
};
sleep (random 3);

if (!isnil "_body") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat carrosserie !</t>",round (_body * 100)],"textures\icones\vehicles\veh-hunt-hull.paa"]] call bis_fnc_showNotification;
	prix_quatre_devis = round ((_body * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_quatre = format ["Hull: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_body * 100), prix_quatre_devis, "%"];
}else
{
	prix_quatre_devis = 0;
	recapitulatif_quatre = format ["Hull: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_quatre_devis];
};
sleep (random 3);

if (!isnil "_carrosserie") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat carrosserie !</t>",round (_carrosserie * 100)],"textures\icones\vehicles\veh-hunt-hull.paa"]] call bis_fnc_showNotification;
	prix_cinq_devis = round ((_carrosserie * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_cinq = format ["Carrosserie: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_carrosserie * 100), prix_cinq_devis, "%"];
}else
{
	prix_cinq_devis = 0;
	recapitulatif_cinq = format ["Carrosserie: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_cinq_devis];
};
sleep (random 3);

if (!isnil "_moteur") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat moteur !",round (_moteur * 100)],"textures\icones\vehicles\veh-hunt-eng.paa"]] call bis_fnc_showNotification;
	prix_six_devis = round ((_moteur * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_six = format ["Moteur: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_moteur * 100), prix_six_devis, "%"];
}else
{
	prix_six_devis = 0;
	recapitulatif_six = format ["Moteur: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_six_devis];
};
sleep (random 3);

if (!isnil "_fuel") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat fuel !",round (_fuel * 100)],"textures\icones\vehicles\veh-hunt-fuel.paa"]] call bis_fnc_showNotification;
	prix_sept_devis = round ((_fuel * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_sept = format ["Fuel: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_fuel * 100), prix_sept_devis, "%"];
}else
{
	prix_sept_devis = 0;
	recapitulatif_sept = format ["Fuel: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_sept_devis];
};
sleep (random 3);

if (!isnil "_R1") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat roue 1 !",round (_R1 * 100)],"textures\icones\vehicles\veh-hunt-wheels.paa"]] call bis_fnc_showNotification;
	prix_huit_devis = round ((_R1 * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_huit = format ["Roue 1: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_R1 * 100), prix_huit_devis, "%"];
}else
{
	prix_huit_devis = 0;
	recapitulatif_huit = format ["Roue 1: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_huit_devis];
};
sleep (random 3);

if (!isnil "_R2") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat roue 2 !",round (_R2 * 100)],"textures\icones\vehicles\veh-hunt-wheels.paa"]] call bis_fnc_showNotification;
	prix_neuf_devis = round ((_R2 * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_neuf = format ["Roue 2: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_R2 * 100), prix_neuf_devis, "%"];
}else
{
	prix_neuf_devis = 0;
	recapitulatif_neuf = format ["Roue 2: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_neuf_devis];
};
sleep (random 3);

if (!isnil "_R3") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat roue 3 !",round (_R3 * 100)],"textures\icones\vehicles\veh-hunt-wheels.paa"]] call bis_fnc_showNotification;
	prix_dix_devis = round ((_R3 * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_dix = format ["Roue 3: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_R3 * 100), prix_dix_devis, "%"];
}else
{
	prix_dix_devis = 0;
	recapitulatif_dix = format ["Roue 3: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_dix_devis];
};
sleep (random 3);

if (!isnil "_R4") then
{
	["DevisSarlDDE",[format["<t color='#0FC702'> %1 pour cent</t> de dégat roue 4 !",round (_R4 * 100)],"textures\icones\vehicles\veh-hunt-wheels.paa"]] call bis_fnc_showNotification;
	prix_onze_devis = round ((_R4 * 100) * le_taux_choisit_sarl_depannage);
	recapitulatif_onze = format ["Roue 4: <t color='#0FC702'> %1 %3</t> --- <t color='#0FC702'>%2</t> Euros.",round (_R4 * 100), prix_onze_devis, "%"];
}else
{
	prix_onze_devis = 0;
	recapitulatif_onze = format ["Roue 4: <t color='#FD0B04'> INEXISTANT</t> --- <t color='#FD0B04'>%1</t> €.", prix_onze_devis];	
};
sleep (random 3);

prix_total_reparation = round (prix_un_devis + prix_deux_devis + prix_trois_devis + prix_quatre_devis + prix_cinq_devis + prix_six_devis + prix_sept_devis + prix_huit_devis + prix_neuf_devis + prix_dix_devis + prix_onze_devis);

_str = parseText format ["
! DEVIS SARL DIR ! <br/> ------------------------------------ <br/>
Voici le bilan précis du véhicule :<br/><br/>
%1<br/>
%2<br/>
%3<br/>
%4<br/>
%5<br/>
%6<br/>
%7<br/>
%8<br/>
%9<br/>
%10<br/>
%11<br/>
<br/>-----------------------------------------------<br/>
Calcul du prix total : <t color='#FD0B04'>%12</t> Euros sur une base de <t color='#FD0B04'>%13</t> Euros par pourcentage réparé.
<br/>-----------------------------------------------<br/>
<br/>
<t color='#EEEEEE' size='1'>By [SFP] Maxou</t>
<br/>
<t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>
",
recapitulatif_un, //1
recapitulatif_deux, //2
recapitulatif_trois, //3
recapitulatif_quatre, //4
recapitulatif_cinq, //5
recapitulatif_six, //6
recapitulatif_sept, //7
recapitulatif_huit, //8
recapitulatif_neuf, //9
recapitulatif_dix, //10
recapitulatif_onze, //11
prix_total_reparation, //12
le_taux_choisit_sarl_depannage //13
];
hintsilent _str;



