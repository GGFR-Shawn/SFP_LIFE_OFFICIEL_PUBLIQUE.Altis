// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 6; !isnil "fin_verification_apres_chargement"};

private "_message_aide_bas_sfp";

_message_aide_bas_sfp = [
					   "INFORMATION : Site : www.sfpteam.fr / TS : ts.sfpteam.fr !",
					   "INFORMATION : N'oubliez pas de télécharger le launcher sur notre site www.sfpteam.fr pour accéder à toutes nos fonctionnalités !",
					   "INFORMATION : Beaucoup de PNJ ont étés supprimés, utiliser donc le menu déroulant !",
					   "INFORMATION : Un anti carkill fait maison est sur le serveur, vous serez banni automatiquement après 3 carkill !",
					   "INFORMATION : Des bruits uniques sont sur notre serveur (chien, etc), ne prenez pas peur ;)",
					   "INFORMATION : Une annonce vocale vous informera lors d'un reboot serveur.",
					   "INFORMATION : Notre serveur fait un backup de tous les véhicules toutes les 60 secondes.",
					   "INFORMATION : Il n'y a pas de Zone Safe sur notre serveur.",
					
					   "ASTUCE : Les gendarmes possède un appel d'urgence avec les touches ALT GR + CTRL DROIT !",
					   "ASTUCE : Les informations de votre dernier véhicule se trouve dans mon inventaire personnel !",
					   "ASTUCE : L'ile dispose de quelques jours d'autonomie de nourriture et d'eau ... Vendez du farm pour l'augmenter !",
					   "ASTUCE : Vous souhaitez vous différenciez des autres ? Rendez vous à la boutique TUNING pour poser un néon sous votre voiture !",
					   "ASTUCE : Votre véhicule manque de puissance ? Rendez vous à la boutique TUNING pour poser une puce sur votre moteur ...",
					   "ASTUCE : La peinture de votre véhicule ne vous plait pas ? Rendez vous à la boutique TUNING pour le repeindre ...",
					   "ASTUCE : Les radars vous soulent ? Acheter un detecteur de radar à la boutique TUNING ...",
					   "ASTUCE : Appuyer sur la touche SHIFT GAUCHE + CAPSLOCK pour afficher le dernier texto reçu ...",
					   "ASTUCE : Un tutoriel vidéo est disponible sur notre site : www.sfpteam.fr !",
					   "ASTUCE : Régler vos paramètres d'affichage, fumée, etc avec la touche Y !",
					   "ASTUCE : Consommer du cannabis, il agira sur votre sommeil !",
					   "ASTUCE : Consommer de la cocaïne, elle agira sur votre temps de récolte !",
					   "ASTUCE : Consommer de l'héroïne, elle agira sur votre soif et votre faim !",
					   "ASTUCE : Consommer des médicaments, ils agiront sur votre régénération de vie !",
					   "ASTUCE : Appuyer sur $, pour baisser le son ambiant du jeu !",
					   "ASTUCE : Pour connaitre le prix d'un farm, il suffit de simuler une vente au marché légal ou illégal !",
					   "ASTUCE : Marre du bruit avoisinant ? Appuis sur la touche $ (dollar) pour mettre des bouchons aux oreilles !",
					   "ASTUCE : Les gendarmes possèdent un sifflet avec la touche H !",
					   "ASTUCE : Les gendarmes possèdent un appel d'urgence avec ALT GR + CTRL DROIT !",
					   "ASTUCE : Desactiver ces messages avec le menu Y (trésor, astuces, etc) !",
					   "ASTUCE : L'heure du prochain reboot est affiché en haut de votre écran !",
					   "ASTUCE : Vous pouvez maintenant chasser des lapins sur toute l'ile !",
					   "ASTUCE : Vous trouvez votre véhicule trop lourd ? Alléger le à la boutique TUNING !",
					   "ASTUCE : Vous trouvez votre véhicule trop léger ? Aller l'alourdir à la boutique TUNING !",
					   "ASTUCE : Mettez le chaos sur l'ile en désactivant les antennes relais de téléphonie SFP TELECOM !",
					   "ASTUCE : Pirater les antennes télécom afin d'envoyer des messages anonyme à toute la population !",
					   "ASTUCE : Vous capter mal sur l'ile ? Demander en boutique SFP TELECOM l'implantation de nouveau relais téléphonique ou vous le souhaitez !",
					   "ASTUCE : Les incendies scriptés (non bohémia) vous font ramer ? Désactivés les avec la touche Y ! (Appliquable au prochain incendie)",
					   "ASTUCE : Vous êtes fatigué ? Dormez dans un véhicule !",
					   "ASTUCE : Vous possédez un holdster, n'hésitez pas à vous en servir !",
					   "ASTUCE : Besoin d'argent ? Rendez vous en banque pour obtenir un pret !",
					   "ASTUCE : Envie d'un black-out télécom ? Rendez vous à la boutique Hack Informatique !",
					   "ASTUCE : Vous souhaitez modifier le nombre de permis déja acheté ? Rendez vous à la boutique Hack Informatique !",
					   "ASTUCE : Marre des radars ? Cassez les avec un marteau !",
					   "ASTUCE : Demander à un joueur de mettre les mains sur la tête et frappez le pour lui prendre son argent en poche !",
					   "ASTUCE : Vous souhaitez assurer vos véhicules ? Rendez vous à ASSUR'SFP !",
					   "ASTUCE : Besoin d'argent ? Trouver la statut sur Altis et gagner 500 000 !",
					   "ASTUCE : Vos plantes illégales sont trop lentes à pousser ? Fertiliser les !",
					   "ASTUCE : Envie d'un peu d'argent ? Voler un véhicule et vendez le !",
					   "ASTUCE : Trouver la caisse d'arme sur Altis, et remportez tous ce qu'elle possède !",
					   "ASTUCE : Escalader les murs, grillages etc avec la touche ESPACE !",
					   "ASTUCE : Achever un bléssé à terre avec un poignard !",
					   "ASTUCE : Retrouvé la plaque de votre dernier véhicule acheté dans votre inventaire personnel !",
					   "ASTUCE : Gagner 500 000 € à chaque reboot en trouvant la statut cachée sur Altis !",
					   "ASTUCE : Vous ne courrez pas assez vite ? Entrainez vous au centre sportif !",
					   "ASTUCE : Vous ne pouvez porter assez de chose ? Entrainez vous au centre sportif !",
					   "ASTUCE : Un véhicule volé ? Changer le numéro de série au CarShop !",
					   "ASTUCE : Envie de sensation forte ? Acheter une corde pour descendre en rappel !",
					   
												   
					   "ATTENTION : Le revive ne peut parfois pas vous réanimer ... Attention à votre vie.",
					   "ATTENTION : Les gendarmes possédent des lacrymogènes unique à SFP.",
					   "ATTENTION : La DIR entretient vos routes, prudence quand elles sont en travaux.",
					   "ATTENTION : Attention à votre vie ... Le revive ne fonctionne pas tous le temps ;)",
					   "ATTENTION : Le ALT + F4 peut vous bricker votre sauvegarde (plantage au moment de son écriture) !",
					   "ATTENTION : Après chaque achat de véhicule, veuillez OBLIGATOIREMENT monter dedans sous peine de le voir bugguer !",
					   "ATTENTION : Eviter ABSOLUMENT les noms avec des apostrophes ou autre pour eviter d'énorme soucis de scripts !",
					   "ATTENTION : Les grenades fumigènes provoquent un trouble de la vision ...",
					   "ATTENTION : Des tremblements de terre peuvent survenir à tout moment ...",
					   "ATTENTION : Des météorites peuvent tomber sur Altis à tout moment (vous les verrez de nuit) ...",
					   "ATTENTION : Le serveur redémarre automatiquement toutes les 5 heures (2 heures, 7 heures, etc) ! Un message vous en avertira en bas à gauche !",
					   "ATTENTION : Des caméras de vidéos surveillances sont implantés sur Altis ..."
					];

					
// Ne pas toucher ci dessous !!!
// Ne pas toucher ci dessous !!!
// Ne pas toucher ci dessous !!!
// Ne pas toucher ci dessous !!!

notification_by_maxou = 
{
	 [ format["<t size='0.75' color='#Fffaf0'>%1</t>",_this], 0,1,20,8,2,3] spawn bis_fnc_dynamicText;
};

while {desactiver_message_infos_ecran < 1 && count _message_aide_bas_sfp > 0} do
{
	_selection = _message_aide_bas_sfp call bis_fnc_selectrandom;
	_message_aide_bas_sfp = _message_aide_bas_sfp - [_selection];
		
	_selection call notification_by_maxou;
	
	sleep (60 + (random 60));
	waituntil {sleep 1; isnil "dialogue_tablette_sfp_maxou";};
};