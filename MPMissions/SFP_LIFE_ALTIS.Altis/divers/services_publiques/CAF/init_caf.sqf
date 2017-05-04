//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (player getvariable "ma_carte_identite" select 1 == "nom") exitwith {hint "! CAF ! \n -------------------------------------------- \n \n Opération impossible, pour demander une aide, vous devez vous déclarer en mairie ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if ((player getVariable "mes_aides_caf") > 0) exitwith {hint format ["! CAF ! \n -------------------------------------------- \n \n Opération impossible, vous percevez déjà des aides de %1 Euros ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",player getvariable "mes_aides_caf"];};
if ((player getVariable "ma_paye_by_sfp_maxou") > 0) exitwith {hint format ["! CAF ! \n -------------------------------------------- \n \n Désolé, vous ne pouvez pas avoir d'aide actuellement car vous travaillez. \n\n Vous gagnez actuellement %1 Euros ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",player getvariable "ma_paye_by_sfp_maxou"];};

if (isnil "jedemandedesaides") then {jedemandedesaides = 0};
if (isnil "tempsattentedesaides") then {tempsattentedesaides = 0};

if (jedemandedesaides == 0) then
{
	if (tempsattentedesaides == 0) then
	{
		tempsattentedesaides = 1;
		jeviensdefairemademande = 1;
		hint "! CAF ! \n -------------------------------------------- \n \n Bienvenue à la CAF de Altis, \n\n A ce jour vous ne travaillez pas ... ! \n\n Nous allons calculer si oui ou non, grâce à des précédents revenus, si vous pouviez recevoir des aides publiques ! \n\n Vous n'avez rien à faire juste attendre que nous vous calculons vos droits. \n\n Un message vous en avertira une fois la demande traitée. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		sleep (200 + (random 200));
		jeviensdefairemademande = 0;		
		_sijepeuxoupas = ["1","2","3"];
		determinersijepeuxoupas = _sijepeuxoupas select floor random count _sijepeuxoupas;
		if (determinersijepeuxoupas == "1") then
		{
			jedemandedesaides = 1;
			montantduRSA = (70 + (random 900));
			sleep 2;
			hint format ["! CAF ! \n -------------------------------------------- \n \n Pour faire suite à votre demande, nous vous informons que vous pouvez recevoir des aides d'un montant de %1 Euros ! \n\n Votre RSA vous sera directement versé sur votre compte bancaire  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",montantduRSA];
			player setVariable["mes_aides_caf", montantduRSA,false];
		};
		if (determinersijepeuxoupas == "2") then
		{
			jedemandedesaides = 1;
			hint "! CAF ! \n -------------------------------------------- \n \n Pour faire suite à votre demande, nous vous informons que vous ne pourrez pas recevoir d'aides publiques ! \n\n En effet, notre système informatique nous à prévenu qu'il y à quelque temps vous avez essayé de frauder ! \n\n Nous en sommes désolés.  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		};
		if (determinersijepeuxoupas == "3") then
		{
			jedemandedesaides = 1;
			montantdeclare = (4000 + (random 30000));
			hint format ["! CAF ! \n -------------------------------------------- \n \n Pour faire suite à votre demande, nous vous informons que vous ne pourrez pas recevoir d'aides publiques ! \n\n Lors du calcul des chiffres vous concernant, vous avez déclaré %1 Euros l'année dernière ! \n\n Nous en sommes désolés.  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",montantdeclare];
		};
	}else
	{
		hint "! CAF ! \n -------------------------------------------- \n\n Désoler, vous avez déjà fait une demande de RSA et celle-ci est en cours d'analyse. \n\n Patientez le temps qu'elle soit traitée. \n\n Vous serez averti ensuite. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
}else
{
	hint "! CAF ! \n -------------------------------------------- \n \n Désolé, cette opération a déjà était réalisé et une réponse vous a déjà été donné ! \n\n La voici ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	sleep 4;
	if (determinersijepeuxoupas == "1") then {hint format ["! CAF ! \n -------------------------------------------- \n \n Pour faire suite à votre demande, nous vous informons que vous pouvez recevoir des aides d'un montant de %1 Euros ! \n\n Votre RSA vous sera directement versé sur votre compte bancaire  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",montantduRSA];};
	if (determinersijepeuxoupas == "2") then {hint "! CAF ! \n -------------------------------------------- \n \n Pour faire suite à votre demande, nous vous informons que vous ne pourrez pas recevoir d'aides publiques ! \n\n En effet, notre système informatique nous à prévenu qu'il y à quelque temps vous avez essayé de frauder ! \n\n Nous en sommes désolés.  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if (determinersijepeuxoupas == "3") then {hint format ["! CAF ! \n -------------------------------------------- \n \n Pour faire suite à votre demande, nous vous informons que vous ne pourrez pas recevoir d'aides publiques ! \n\n Lors du calcul des chiffres vous concernant, vous avez déclaré %1 Euros l'année dernière ! \n\n Nous en sommes désolés.  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",montantdeclare];};
};
