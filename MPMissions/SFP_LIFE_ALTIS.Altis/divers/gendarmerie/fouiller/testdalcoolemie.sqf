// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

lavictim = cursortarget;

if (side cursortarget == west) exitwith {hint "Tu ne peux pas faire de test à un collègue ...";};
if (!(lavictim iskindof "Man")) exitWith {hint "Personne n'est pointé pour proceder à un test d'alcoolémie !"};

hint format ["%1 est soumit au test d'alcoolémie",(name lavictim)];
sleep 3;

_green = "#4CCF00";
_red = "#FF0000";

if (!isnil {player getvariable "jaibu_by_sfp_maxou"}) then 
{
	if ((lavictim getVariable "jaibu_by_sfp_maxou") >= 3) then {
		alcooldanslesanginv = parseText format ["- Le jeune homme est positif avec plus de trois grammes dans le sang !"];
		alcooldanslesangcolor = _red;
	};

	if (((lavictim getVariable "jaibu_by_sfp_maxou") >= 2) && ((lavictim getVariable "jaibu_by_sfp_maxou") < 3)) then {
		alcooldanslesanginv = parseText format ["- Le jeune homme est positif avec plus de deux grammes dans le sang !"];
		alcooldanslesangcolor = _red;
	};

	if (((lavictim getVariable "jaibu_by_sfp_maxou") >= 0.99) && ((lavictim getVariable "jaibu_by_sfp_maxou") < 2)) then {
		alcooldanslesanginv = parseText format ["- Le jeune homme est positif avec plus d'un gramme dans le sang !"];
		alcooldanslesangcolor = _red;
	};

	if (((lavictim getVariable "jaibu_by_sfp_maxou") >= 0.01) && ((lavictim getVariable "jaibu_by_sfp_maxou") < 0.99)) then {
		alcooldanslesanginv = parseText format ["- Le jeune homme est positif avec pas moins d'un gramme dans le sang !"];
		alcooldanslesangcolor = _red;
	};

	if ((lavictim getVariable "jaibu_by_sfp_maxou") <= 0) then {
		alcooldanslesanginv = parseText format ["- Un jeune civil sérieux ! Il n'a pas d'alcool dans le sang"];
		alcooldanslesangcolor = _green;
	};
}else
{
	alcooldanslesanginv = parseText format ["- Un jeune civil sérieux ! Il n'a pas d'alcool dans le sang"];
	alcooldanslesangcolor = _green;
};


_str = parseText format 
[
"
	<t align='left'><img image='textures\icones\drapeaufr.jpg'/><t align='right'><img image='textures\icones\drapeaufr.jpg'/>
	<br/>
	<t color='#ffffff'><t size='2'><t align='center'>Résultat Alcoolémie<br/>
	<br/>
	<t color='#ffffff'><t align='center'><t size='1'>Limite autorisé :<t color='#E80400'> 0.5 !
	<br/>
	<br/>
	<t color='%2' size='1.0'>%1</t>
	<br/>
	<br/>
	<br/>
	<t color='#ffffff'><t align='center'><t size='1'>http://www.sfpteam.fr/
",
	alcooldanslesanginv, // 1
	alcooldanslesangcolor // 2
];
hintsilent _str;
