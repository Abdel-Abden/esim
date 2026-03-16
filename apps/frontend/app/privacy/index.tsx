/**
 * apps/frontend/app/privacy/index.tsx
 * Politique de confidentialité — conforme au RGPD (UE) 2016/679
 */

import { useRouter } from 'expo-router';
import React from 'react';
import {
  Linking,
  ScrollView,
  StatusBar,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import { styles } from './index.styles';

// ─── Composants typographiques locaux ────────────────────────────────────────
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
function TableRow({
  purpose,
  data,
  basis,
  retention,
}: {
  purpose: string;
  data: string;
  basis: string;
  retention: string;
}) {
  return (
    <View style={styles.tableRow}>
      <Text style={[styles.tableCell, { flex: 1.2 }]}>{purpose}</Text>
      <Text style={styles.tableCell}>{data}</Text>
      <Text style={styles.tableCell}>{basis}</Text>
      <Text style={styles.tableCell}>{retention}</Text>
    </View>
  );
}

// ─── Page ─────────────────────────────────────────────────────────────────────
export default function PrivacyScreen() {
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
          <Text style={styles.headerTitle}>Politique de confidentialité</Text>
        </View>

        <ScrollView
          style={styles.scroll}
          contentContainerStyle={styles.content}
          showsVerticalScrollIndicator={false}
        >
          <H1>Politique de confidentialité — ILOTEL eSIM</H1>
          <Body>Version en vigueur au 1er janvier 2025</Body>

          <View style={styles.highlightBox}>
            <Text style={styles.highlightText}>
              Chez ILOTEL, vos données sont utilisées uniquement pour vous fournir le service.
              Nous ne les vendons jamais. Cette politique explique précisément ce que nous
              collectons, pourquoi, et comment vous exercez vos droits.
            </Text>
          </View>

          <Divider />

          {/* 1 — Responsable du traitement */}
          <H2>1. Responsable du traitement</H2>
          <Body>
            ILOTEL SAS, [adresse complète], France.{'\n'}
            Délégué à la Protection des Données (DPO) : dpo@ilotel.com{'\n\n'}
            Vous pouvez contacter notre DPO pour toute question relative à la protection de
            vos données personnelles.
          </Body>
          <Divider />

          {/* 2 — Données collectées & finalités */}
          <H2>2. Données collectées, finalités et bases légales</H2>
          <Body>Le tableau ci-dessous résume l'ensemble de nos traitements :{'\n'}</Body>

          <View style={styles.tableHeader}>
            <Text style={[styles.tableHeaderCell, { flex: 1.2 }]}>Finalité</Text>
            <Text style={styles.tableHeaderCell}>Données</Text>
            <Text style={styles.tableHeaderCell}>Base légale</Text>
            <Text style={styles.tableHeaderCell}>Durée</Text>
          </View>

          <TableRow
            purpose="Exécution de la commande"
            data="Email, offre achetée"
            basis="Contrat (art. 6.1.b RGPD)"
            retention="10 ans (comptabilité)"
          />
          <TableRow
            purpose="Envoi de l'eSIM"
            data="Email, QR code"
            basis="Contrat (art. 6.1.b)"
            retention="3 ans"
          />
          <TableRow
            purpose="Service client"
            data="Email, historique"
            basis="Intérêt légitime (art. 6.1.f)"
            retention="3 ans après clôture"
          />
          <TableRow
            purpose="Obligations légales (CPCE)"
            data="Données de connexion"
            basis="Obligation légale (art. 6.1.c)"
            retention="1 an (art. L34-1 CPCE)"
          />
          <TableRow
            purpose="Lutte anti-fraude"
            data="Données de paiement (Stripe)"
            basis="Intérêt légitime (art. 6.1.f)"
            retention="13 mois"
          />
          <TableRow
            purpose="Amélioration du service"
            data="Données anonymisées"
            basis="Intérêt légitime (art. 6.1.f)"
            retention="Durée indéterminée"
          />

          <Divider />

          {/* 3 — Destinataires */}
          <H2>3. Destinataires des données</H2>
          <Body>Vos données sont transmises uniquement aux sous-traitants strictement nécessaires :</Body>
          <Li>
            <Text style={{ fontWeight: '600' }}>Stripe Payments Europe, Ltd.</Text>
            {' '}(traitement des paiements) — basé en Irlande, encadré par des Clauses
            Contractuelles Types pour tout transfert hors UE.
          </Li>
          <Li>
            <Text style={{ fontWeight: '600' }}>Opérateurs télécoms partenaires</Text>
            {' '}— uniquement les données techniques nécessaires à l'activation de l'eSIM.
          </Li>
          <Li>
            <Text style={{ fontWeight: '600' }}>Hébergeur</Text>
            {' '}— serveurs situés dans l'Union Européenne.
          </Li>
          <Body>
            {'\n'}Aucune donnée n'est vendue ni louée à des tiers à des fins commerciales ou
            publicitaires.
          </Body>
          <Divider />

          {/* 4 — Transferts hors UE */}
          <H2>4. Transferts hors Union Européenne</H2>
          <Body>
            Certains opérateurs partenaires peuvent être situés hors de l'UE. Dans ce cas,
            les transferts sont encadrés par des Clauses Contractuelles Types (CCT) approuvées
            par la Commission européenne (Décision 2021/914), garantissant un niveau de
            protection équivalent à celui du RGPD.
          </Body>
          <Divider />

          {/* 5 — Sécurité */}
          <H2>5. Sécurité des données</H2>
          <Body>
            ILOTEL met en œuvre des mesures techniques et organisationnelles adaptées afin
            d'assurer la sécurité de vos données :
          </Body>
          <Li>Chiffrement des données en transit (TLS 1.2 minimum).</Li>
          <Li>Chiffrement des données au repos sur nos serveurs.</Li>
          <Li>Accès aux données restreint aux seuls employés habilités.</Li>
          <Li>Aucune donnée de carte bancaire stockée sur nos systèmes (délégué à Stripe).</Li>
          <Li>Journalisation des accès et revue régulière des droits d'accès.</Li>
          <Divider />

          {/* 6 — Cookies & traceurs */}
          <H2>6. Cookies et traceurs</H2>
          <Body>
            L'application mobile ILOTEL n'utilise pas de cookies au sens strict. Des identifiants
            techniques anonymes peuvent être générés à des fins de stabilité de l'application
            (gestion de session). Aucun traceur publicitaire ou de profilage n'est déployé.
          </Body>
          <Divider />

          {/* 7 — Droits */}
          <H2>7. Vos droits (RGPD)</H2>
          <Body>
            Conformément au Règlement (UE) 2016/679, vous disposez des droits suivants sur
            vos données personnelles :
          </Body>
          <Li>
            <Text style={{ fontWeight: '600' }}>Droit d'accès</Text>
            {' '}(art. 15) — obtenir une copie de vos données.
          </Li>
          <Li>
            <Text style={{ fontWeight: '600' }}>Droit de rectification</Text>
            {' '}(art. 16) — corriger des données inexactes.
          </Li>
          <Li>
            <Text style={{ fontWeight: '600' }}>Droit à l'effacement</Text>
            {' '}(art. 17) — suppression sous réserve des obligations légales de conservation.
          </Li>
          <Li>
            <Text style={{ fontWeight: '600' }}>Droit à la limitation</Text>
            {' '}(art. 18) — restreindre temporairement un traitement.
          </Li>
          <Li>
            <Text style={{ fontWeight: '600' }}>Droit à la portabilité</Text>
            {' '}(art. 20) — recevoir vos données dans un format structuré et lisible.
          </Li>
          <Li>
            <Text style={{ fontWeight: '600' }}>Droit d'opposition</Text>
            {' '}(art. 21) — s'opposer aux traitements fondés sur l'intérêt légitime.
          </Li>
          <Body>
            {'\n'}Pour exercer ces droits, contactez-nous à{' '}
            <Text
              style={{ color: '#0066FF', textDecorationLine: 'underline' }}
              onPress={() => Linking.openURL('mailto:dpo@ilotel.com')}
            >
              dpo@ilotel.com
            </Text>
            {' '}en joignant une copie de votre pièce d'identité. Nous vous répondrons sous
            30 jours calendaires.{'\n\n'}
            Vous avez également le droit d'introduire une réclamation auprès de la{' '}
            <Text
              style={{ color: '#0066FF', textDecorationLine: 'underline' }}
              onPress={() => Linking.openURL('https://www.cnil.fr')}
            >
              CNIL
            </Text>
            {' '}(Commission Nationale de l'Informatique et des Libertés).
          </Body>
          <Divider />

          {/* 8 — Mineurs */}
          <H2>8. Mineurs</H2>
          <Body>
            Le service ILOTEL est destiné à des personnes majeures (18 ans ou plus). Nous ne
            collectons pas sciemment de données relatives à des mineurs. Si vous pensez qu'un
            mineur nous a fourni des données, contactez-nous à dpo@ilotel.com pour suppression
            immédiate.
          </Body>
          <Divider />

          {/* 9 — Modifications */}
          <H2>9. Modifications de la présente politique</H2>
          <Body>
            ILOTEL peut mettre à jour cette politique à tout moment. En cas de modification
            substantielle, vous en serez informé par notification dans l'application ou par
            email. La version en vigueur est toujours accessible dans l'application via le
            menu "Politique de confidentialité".
          </Body>
          <Divider />

          {/* Pied de page */}
          <View style={styles.footer}>
            <Text style={styles.footerText}>
              ILOTEL SAS — dpo@ilotel.com{'\n'}
              Dernière mise à jour : 1er janvier 2025
            </Text>
          </View>
        </ScrollView>
      </View>
    </>
  );
}
