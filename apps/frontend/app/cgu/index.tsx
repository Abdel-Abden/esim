/**
 * apps/frontend/app/cgu/index.tsx
 * Page Conditions Générales de Vente — conforme au droit européen
 * (Directive 2011/83/UE · Code de la consommation français · RGPD · CPCE)
 */

import { useRouter } from 'expo-router';
import React from 'react';
import {
  ScrollView,
  StatusBar,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import { styles } from './index.styles';


// ─── Composants typographiques locaux ─────────────────────────────────────────
function H1({ children }: { children: React.ReactNode }) {
  return <Text style={styles.h1}>{children}</Text>;
}
function H2({ children }: { children: React.ReactNode }) {
  return <Text style={styles.h2}>{children}</Text>;
}
function Body({ children }: { children: React.ReactNode }) {
  return <Text style={styles.body}>{children}</Text>;
}
function Li({ children }: { children: React.ReactNode }) {
  return (
    <View style={styles.liRow}>
      <Text style={styles.liDot}>•</Text>
      <Text style={styles.liText}>{children}</Text>
    </View>
  );
}
function Divider() {
  return <View style={styles.divider} />;
}

// ─── Page ──────────────────────────────────────────────────────────────────────
export default function CGUScreen() {
  const router = useRouter();

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <View style={styles.container}>
        {/* En-tête */}
        <View style={styles.header}>
          <TouchableOpacity
            onPress={() => router.back()}
            style={styles.backBtn}
            hitSlop={{ top: 12, bottom: 12, left: 12, right: 12 }}
          >
            <Text style={styles.backText}>‹ Retour</Text>
          </TouchableOpacity>
          <Text style={styles.headerTitle}>Conditions Générales de Vente</Text>
        </View>

        <ScrollView
          style={styles.scroll}
          contentContainerStyle={styles.content}
          showsVerticalScrollIndicator={false}
        >
          {/* Identification du vendeur */}
          <H1>Conditions Générales de Vente — ILOTEL eSIM</H1>
          <Body>Version en vigueur au 1er janvier 2025</Body>
          <Divider />

          {/* Article 1 */}
          <H2>Article 1 — Identification du vendeur</H2>
          <Body>
            Le présent site et l'application mobile ILOTEL sont exploités par la société ILOTEL SAS,
            société par actions simplifiée au capital de [X] €, immatriculée au Registre du Commerce
            et des Sociétés sous le numéro [RCS], dont le siège social est situé au [Adresse complète],
            France.{'\n\n'}
            Numéro de TVA intracommunautaire : FR[XXXXXXXX].{'\n'}
            Adresse email : support@ilotel.com{'\n'}
            Téléphone : +33 [X XX XX XX XX] (disponible du lundi au vendredi, 9h–18h)
          </Body>
          <Divider />

          {/* Article 2 */}
          <H2>Article 2 — Objet et champ d'application</H2>
          <Body>
            Les présentes Conditions Générales de Vente (CGV) régissent l'ensemble des ventes
            de cartes eSIM (Embedded Subscriber Identity Module) et de forfaits de données mobiles
            proposés par ILOTEL sur son application mobile et son site internet.{'\n\n'}
            Toute commande implique l'acceptation pleine et entière des présentes CGV. ILOTEL se
            réserve le droit de les modifier à tout moment ; la version applicable est celle en
            vigueur à la date de la commande.
          </Body>
          <Divider />

          {/* Article 3 */}
          <H2>Article 3 — Description des produits et services</H2>
          <Body>
            ILOTEL commercialise des eSIM prépayées donnant accès à des forfaits de données
            mobiles dans les destinations proposées. Chaque forfait est caractérisé par :
          </Body>
          <Li>Un volume de données mobiles exprimé en gigaoctets (Go).</Li>
          <Li>Une durée de validité exprimée en jours calendaires à compter de la première activation.</Li>
          <Li>Une zone géographique de couverture.</Li>
          <Body>
            {'\n'}Les caractéristiques essentielles de chaque produit sont décrites sur la fiche
            produit avant tout achat, conformément à l'article L111-1 du Code de la consommation.
          </Body>
          <Divider />

          {/* Article 4 */}
          <H2>Article 4 — Prix</H2>
          <Body>
            Les prix sont affichés en euros (€) TTC, toutes taxes comprises. ILOTEL se réserve
            le droit de modifier ses prix à tout moment, sans préavis, mais s'engage à facturer
            les commandes au prix en vigueur au moment de la validation.{'\n\n'}
            Des offres promotionnelles peuvent être proposées pour une durée limitée et dans la
            limite des stocks disponibles. En cas d'erreur manifeste de prix, ILOTEL se réserve
            le droit d'annuler la commande après en avoir informé le client.
          </Body>
          <Divider />

          {/* Article 5 */}
          <H2>Article 5 — Processus de commande</H2>
          <Body>
            La commande s'effectue selon les étapes suivantes :{'\n'}
          </Body>
          <Li>Sélection de la destination et de l'offre souhaitée.</Li>
          <Li>Saisie de l'adresse email de confirmation.</Li>
          <Li>Acceptation des présentes CGV.</Li>
          <Li>Choix et validation du moyen de paiement (via Stripe).</Li>
          <Li>Confirmation de commande par email.</Li>
          <Body>
            {'\n'}La commande est définitivement enregistrée au moment de la confirmation du
            paiement par l'établissement bancaire. Un email de confirmation est adressé au client
            dans les instants suivants.
          </Body>
          <Divider />

          {/* Article 6 */}
          <H2>Article 6 — Paiement</H2>
          <Body>
            Le paiement est effectué en ligne par carte bancaire (Visa, Mastercard, American Express),
            Apple Pay ou Google Pay, via la solution sécurisée Stripe (Stripe Payments Europe, Ltd.).{'\n\n'}
            Les coordonnées bancaires du client sont chiffrées selon le protocole TLS et ne sont
            jamais stockées sur les serveurs d'ILOTEL. ILOTEL se réserve le droit de refuser toute
            commande présentant un risque de fraude caractérisé.
          </Body>
          <Divider />

          {/* Article 7 */}
          <H2>Article 7 — Livraison et activation</H2>
          <Body>
            L'eSIM est un contenu numérique fourni immédiatement après confirmation du paiement.
            Le client reçoit par email un QR code d'installation ainsi que les instructions
            d'activation. ILOTEL ne saurait être tenu responsable d'un retard imputable à un
            problème de réception d'email (filtre anti-spam, saturation de la boîte, etc.).{'\n\n'}
            L'activation de l'eSIM est soumise à la compatibilité de l'appareil du client (appareil
            déverrouillé et compatible eSIM). Il appartient au client de vérifier cette compatibilité
            avant tout achat.
          </Body>
          <Divider />

          {/* Article 8 */}
          <H2>Article 8 — Droit de rétractation</H2>
          <Body>
            Conformément à l'article L221-28 12° du Code de la consommation (transposition de
            l'article 16 m) de la Directive 2011/83/UE), le droit de rétractation ne s'applique
            pas aux contrats de fourniture de contenu numérique dont l'exécution a commencé avec
            l'accord préalable et exprès du consommateur.{'\n\n'}
            En validant sa commande, le client reconnaît expressément que la fourniture de l'eSIM
            et du forfait de données débute immédiatement après le paiement et renonce en
            conséquence à son droit de rétractation de 14 jours.{'\n\n'}
            En cas de dysfonctionnement technique imputable à ILOTEL, le client peut bénéficier
            d'un remboursement ou d'un échange selon les conditions de l'article 9.
          </Body>
          <Divider />

          {/* Article 9 */}
          <H2>Article 9 — Garanties légales et réclamations</H2>
          <Body>
            Le client bénéficie des garanties légales suivantes :{'\n'}
          </Body>
          <Li>
            Garantie légale de conformité (articles L217-4 à L217-16 du Code de la consommation)
            pour les contenus numériques.
          </Li>
          <Li>
            Garantie légale contre les vices cachés (articles 1641 à 1649 du Code civil).
          </Li>
          <Body>
            {'\n'}Pour toute réclamation, le client doit contacter le service client par email à
            support@ilotel.com en précisant son numéro de commande. ILOTEL s'engage à accuser
            réception sous 48 heures et à apporter une réponse sous 10 jours ouvrés.
          </Body>
          <Divider />

          {/* Article 10 */}
          <H2>Article 10 — Opérateur de communications électroniques</H2>
          <Body>
            ILOTEL agit en qualité de revendeur de services de roaming data fournis par des
            opérateurs partenaires. En tant que service de communications électroniques au sens
            du Code des postes et des communications électroniques (CPCE), les données de
            connexion peuvent être enregistrées conformément aux obligations légales de conservation
            (article L34-1 du CPCE).{'\n\n'}
            La qualité du service (débit, couverture) dépend des réseaux des opérateurs locaux
            partenaires et ne peut être garantie dans les zones à faible couverture réseau.
          </Body>
          <Divider />

          {/* Article 11 */}
          <H2>Article 11 — Données personnelles (RGPD)</H2>
          <Body>
            ILOTEL collecte et traite les données personnelles du client (adresse email, données
            de connexion) uniquement dans le cadre de l'exécution de la commande, de la
            relation client et des obligations légales.{'\n\n'}
            Conformément au Règlement (UE) 2016/679 (RGPD), le client dispose des droits
            suivants :{'\n'}
          </Body>
          <Li>Droit d'accès à ses données (art. 15 RGPD).</Li>
          <Li>Droit de rectification (art. 16 RGPD).</Li>
          <Li>Droit à l'effacement (art. 17 RGPD).</Li>
          <Li>Droit à la portabilité (art. 20 RGPD).</Li>
          <Li>Droit d'opposition et de limitation du traitement (art. 21 RGPD).</Li>
          <Body>
            {'\n'}Ces droits s'exercent en écrivant à dpo@ilotel.com. Le client peut également
            introduire une réclamation auprès de la CNIL (www.cnil.fr).{'\n\n'}
            Les données ne sont ni vendues ni cédées à des tiers à des fins commerciales.
            La durée de conservation des données de transaction est de 10 ans conformément
            aux obligations comptables.
          </Body>
          <Divider />

          {/* Article 12 */}
          <H2>Article 12 — Propriété intellectuelle</H2>
          <Body>
            L'ensemble des éléments de l'application ILOTEL (logo, marque, code source,
            contenu éditorial) est protégé par le droit de la propriété intellectuelle.
            Toute reproduction, même partielle, est interdite sans autorisation écrite préalable.
          </Body>
          <Divider />

          {/* Article 13 */}
          <H2>Article 13 — Médiation et règlement des litiges</H2>
          <Body>
            Conformément aux articles L611-1 et suivants du Code de la consommation et à la
            Directive 2013/11/UE relative au règlement extrajudiciaire des litiges de
            consommation, le client peut recourir gratuitement à un médiateur de la consommation.{'\n\n'}
            ILOTEL adhère au service de médiation : [Nom du médiateur — à compléter],
            accessible à l'adresse [URL du médiateur].{'\n\n'}
            La plateforme européenne de règlement en ligne des litiges (RLL) est accessible à :
            https://ec.europa.eu/consumers/odr{'\n\n'}
            En cas de litige non résolu par voie amiable, les tribunaux compétents sont ceux du
            ressort du siège social d'ILOTEL, sauf disposition impérative contraire.
          </Body>
          <Divider />

          {/* Article 14 */}
          <H2>Article 14 — Droit applicable</H2>
          <Body>
            Les présentes CGV sont soumises au droit français. Elles ne sauraient priver le
            consommateur de la protection que lui confèrent les dispositions impératives de la
            loi du pays dans lequel il réside habituellement, conformément au Règlement (CE)
            593/2008 (Rome I).
          </Body>
          <Divider />

          {/* Pied de page */}
          <View style={styles.footer}>
            <Text style={styles.footerText}>
              ILOTEL SAS — support@ilotel.com{'\n'}
              Dernière mise à jour : 1er janvier 2025
            </Text>
          </View>
        </ScrollView>
      </View>
    </>
  );
}