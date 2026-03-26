/**
 * TutorialModal — Onboarding tutorial (5 pages)
 * Pages compatibilité et activation adaptées à iOS / Android.
 */
import { OsTag } from '@/components/ActivationSteps/ActivationSteps';
import { Colors } from '@/constants/theme';
import { LinearGradient } from 'expo-linear-gradient';
import React, { useEffect, useRef, useState } from 'react';
import {
  Animated,
  Modal,
  Platform,
  ScrollView,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import Svg, { Circle, Path, Rect } from 'react-native-svg';
import { styles } from './TutorialModal.styles';

const IS_IOS = Platform.OS === 'ios';

/* ─── Illustrations ────────────────────────────────────────────────────────── */

function IlluESIM() {
  return (
    <Svg width={160} height={120} viewBox="0 0 160 120">
      <Rect x={45} y={8} width={70} height={104} rx={14} fill={Colors.surface} stroke={Colors.border} strokeWidth={2} />
      <Rect x={52} y={20} width={56} height={70} rx={6} fill={Colors.primaryLight} />
      <Rect x={62} y={35} width={36} height={26} rx={5} fill={Colors.primary} opacity={0.9} />
      <Rect x={68} y={41} width={8} height={6} rx={1} fill={Colors.white} opacity={0.7} />
      <Rect x={80} y={41} width={12} height={6} rx={1} fill={Colors.white} opacity={0.5} />
      <Rect x={68} y={51} width={24} height={4} rx={1} fill={Colors.white} opacity={0.4} />
      <Path d="M80 80 Q75 75 70 70" stroke={Colors.accent} strokeWidth={2} strokeLinecap="round" fill="none" />
      <Path d="M80 80 Q80 72 80 66" stroke={Colors.accent} strokeWidth={2} strokeLinecap="round" fill="none" />
      <Path d="M80 80 Q85 75 90 70" stroke={Colors.accent} strokeWidth={2} strokeLinecap="round" fill="none" />
      <Circle cx={80} cy={82} r={3} fill={Colors.accent} />
      <Circle cx={80} cy={103} r={5} fill={Colors.border} />
    </Svg>
  );
}

function IlluCompatIOS() {
  return (
    <Svg width={160} height={120} viewBox="0 0 160 120">
      <Rect x={42} y={10} width={76} height={100} rx={14} fill={Colors.surface} stroke={Colors.border} strokeWidth={2} />
      <Rect x={50} y={22} width={60} height={64} rx={6} fill={Colors.primaryLight} />
      <Circle cx={80} cy={100} r={5} fill={Colors.border} />
      <Rect x={65} y={10} width={30} height={8} rx={4} fill={Colors.border} />
      <Rect x={56} y={30} width={48} height={8} rx={3} fill={Colors.white} />
      <Rect x={56} y={42} width={48} height={8} rx={3} fill={Colors.white} />
      <Rect x={56} y={54} width={48} height={8} rx={3} fill={Colors.primary} opacity={0.8} />
      <Rect x={56} y={66} width={48} height={8} rx={3} fill={Colors.white} />
      <Path d="M96 58 L100 58 L98 56 M100 58 L98 60" stroke={Colors.white} strokeWidth={1.5} strokeLinecap="round" strokeLinejoin="round" fill="none" />
      <Circle cx={122} cy={18} r={13} fill={Colors.accent} />
      <Path d="M116 18 L120 22 L129 13" stroke={Colors.white} strokeWidth={2.5} strokeLinecap="round" strokeLinejoin="round" fill="none" />
    </Svg>
  );
}

function IlluCompatAndroid() {
  return (
    <Svg width={160} height={120} viewBox="0 0 160 120">
      <Rect x={42} y={10} width={76} height={100} rx={10} fill={Colors.surface} stroke={Colors.border} strokeWidth={2} />
      <Rect x={50} y={22} width={60} height={64} rx={4} fill={Colors.primaryLight} />
      <Circle cx={80} cy={16} r={3} fill={Colors.border} />
      <Rect x={56} y={97} width={48} height={6} rx={3} fill={Colors.border} />
      <Rect x={55} y={28} width={50} height={7} rx={3} fill={Colors.white} />
      <Rect x={55} y={39} width={50} height={7} rx={3} fill={Colors.white} />
      <Rect x={55} y={50} width={50} height={7} rx={3} fill={Colors.primary} opacity={0.8} />
      <Rect x={55} y={61} width={50} height={7} rx={3} fill={Colors.white} />
      <Rect x={57} y={51} width={8} height={6} rx={1} fill={Colors.white} opacity={0.9} />
      <Circle cx={122} cy={18} r={13} fill={Colors.accent} />
      <Path d="M116 18 L120 22 L129 13" stroke={Colors.white} strokeWidth={2.5} strokeLinecap="round" strokeLinejoin="round" fill="none" />
    </Svg>
  );
}

function IlluDestination() {
  return (
    <Svg width={160} height={120} viewBox="0 0 160 120">
      <Circle cx={80} cy={62} r={44} fill={Colors.accentLight} stroke={Colors.accent} strokeWidth={2} />
      <Path d="M80 18 Q95 40 95 62 Q95 84 80 106" stroke={Colors.accent} strokeWidth={1.5} fill="none" opacity={0.5} />
      <Path d="M80 18 Q65 40 65 62 Q65 84 80 106" stroke={Colors.accent} strokeWidth={1.5} fill="none" opacity={0.5} />
      <Path d="M36 62 Q58 55 80 55 Q102 55 124 62" stroke={Colors.accent} strokeWidth={1.5} fill="none" opacity={0.5} />
      <Path d="M40 42 Q60 38 80 38 Q100 38 120 42" stroke={Colors.accent} strokeWidth={1} fill="none" opacity={0.3} />
      <Path d="M40 82 Q60 86 80 86 Q100 86 120 82" stroke={Colors.accent} strokeWidth={1} fill="none" opacity={0.3} />
      <Path d="M80 28 C74 28 68 33 68 40 C68 50 80 60 80 60 C80 60 92 50 92 40 C92 33 86 28 80 28 Z" fill={Colors.primary} />
      <Circle cx={80} cy={40} r={5} fill={Colors.white} />
      <Circle cx={116} cy={90} r={13} fill="none" stroke={Colors.primary} strokeWidth={3} />
      <Path d="M125 99 L134 108" stroke={Colors.primary} strokeWidth={3} strokeLinecap="round" />
    </Svg>
  );
}

function IlluOffer() {
  return (
    <Svg width={160} height={120} viewBox="0 0 160 120">
      <Rect x={20} y={20} width={120} height={30} rx={10} fill={Colors.white} stroke={Colors.border} strokeWidth={1.5} />
      <Rect x={30} y={29} width={40} height={12} rx={3} fill={Colors.primaryLight} />
      <Rect x={76} y={29} width={20} height={5} rx={2} fill={Colors.surface} />
      <Rect x={120} y={29} width={12} height={12} rx={6} fill={Colors.surface} stroke={Colors.border} strokeWidth={1.5} />
      <Rect x={20} y={58} width={120} height={30} rx={10} fill={Colors.primaryLight} stroke={Colors.primary} strokeWidth={2} />
      <Rect x={30} y={67} width={40} height={12} rx={3} fill={Colors.primary} opacity={0.2} />
      <Rect x={76} y={67} width={20} height={5} rx={2} fill={Colors.primary} opacity={0.4} />
      <Circle cx={126} cy={73} r={6} fill={Colors.primary} />
      <Circle cx={126} cy={73} r={3} fill={Colors.white} />
      <Rect x={30} y={96} width={100} height={18} rx={9} fill={Colors.primary} />
    </Svg>
  );
}

function IlluActivation() {
  return (
    <Svg width={160} height={120} viewBox="0 0 160 120">
      <Rect x={42} y={8} width={76} height={100} rx={14} fill={Colors.surface} stroke={Colors.border} strokeWidth={2} />
      <Rect x={50} y={20} width={60} height={68} rx={6} fill={Colors.primaryLight} />
      <Circle cx={80} cy={100} r={5} fill={Colors.border} />
      <Rect x={56} y={32} width={48} height={8} rx={4} fill={Colors.primary} opacity={0.15} />
      <Rect x={56} y={44} width={48} height={24} rx={4} fill={Colors.white} />
      <Rect x={59} y={48} width={6} height={4} rx={1} fill={Colors.primary} opacity={0.6} />
      <Rect x={67} y={48} width={6} height={4} rx={1} fill={Colors.primary} opacity={0.6} />
      <Rect x={75} y={48} width={6} height={4} rx={1} fill={Colors.primary} opacity={0.6} />
      <Rect x={83} y={48} width={6} height={4} rx={1} fill={Colors.primary} opacity={0.6} />
      <Rect x={91} y={48} width={6} height={4} rx={1} fill={Colors.primary} opacity={0.6} />
      <Rect x={56} y={72} width={48} height={12} rx={6} fill={Colors.primary} />
      <Rect x={65} y={75} width={8} height={6} rx={1} fill={Colors.white} opacity={0.8} />
      <Rect x={75} y={76} width={20} height={4} rx={1} fill={Colors.white} opacity={0.7} />
      <Path d="M122 60 C134 60 136 40 130 30" stroke={Colors.primary} strokeWidth={2} strokeLinecap="round" fill="none" strokeDasharray="4 3" />
      <Path d="M127 28 L130 30 L128 33" stroke={Colors.primary} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round" fill="none" />
      <Circle cx={140} cy={24} r={10} fill={Colors.primaryLight} stroke={Colors.primary} strokeWidth={1.5} />
      <Circle cx={140} cy={24} r={4} fill={Colors.primary} opacity={0.4} />
    </Svg>
  );
}

/* ─── Définition des pages ─────────────────────────────────────────────────── */

interface TutorialPage {
  key: string;
  badge: string;
  title: string;
  subtitle: string;
  bullets: { icon: string; text: string }[];
  osTag?: boolean;
  Illustration: React.FC;
}

function buildPages(): TutorialPage[] {
  return [
    {
      key: 'esim',
      badge: '📡 C\'est quoi ?',
      title: 'L\'eSIM, la SIM\nsans la carte',
      subtitle: 'Une carte SIM numérique, directement intégrée à votre téléphone.',
      bullets: [
        { icon: '💳', text: 'Aucune carte physique à insérer — tout est numérique' },
        { icon: '⚡', text: 'Activez votre forfait en 2 minutes, avant même de partir' },
        { icon: '🌍', text: 'Couverture dans 190+ pays, sans frais d\'itinérance surprises' },
      ],
      Illustration: IlluESIM,
    },
    IS_IOS
      ? {
          key: 'compat',
          badge: '📱 Compatibilité',
          title: 'Votre iPhone\nest-il compatible ?',
          subtitle: 'Les iPhone XS, XR (2018) et versions ultérieures supportent l\'eSIM.',
          osTag: true,
          bullets: [
            { icon: '✅', text: 'iPhone XS/XR, 11, 12, 13, 14, 15 — tous modèles (Pro, Plus, Max)' },
            { icon: '⚙️', text: 'Réglages → Général → Informations → Plan cellulaire disponible' },
            { icon: '🔓', text: 'Vérifiez que votre iPhone n\'est pas verrouillé opérateur' },
          ],
          Illustration: IlluCompatIOS,
        }
      : {
          key: 'compat',
          badge: '📱 Compatibilité',
          title: 'Votre Android\nest-il compatible ?',
          subtitle: 'La majorité des Android haut de gamme depuis 2018 supportent l\'eSIM.',
          osTag: true,
          bullets: [
            { icon: '✅', text: 'Pixel 3+, Samsung Galaxy S20+, Xiaomi 12+, OnePlus 11+…' },
            { icon: '⚙️', text: 'Réseaux et internet → SIM → Ajouter SIM (si l\'option existe)' },
            { icon: '🔓', text: 'Vérifiez que votre appareil n\'est pas verrouillé opérateur' },
          ],
          Illustration: IlluCompatAndroid,
        },
    {
      key: 'destination',
      badge: '🗺️ Destination',
      title: 'Trouvez votre\ndestination',
      subtitle: 'Recherchez un pays ou filtrez par région pour trouver votre eSIM idéale.',
      bullets: [
        { icon: '🔍', text: 'Tapez le nom du pays dans la barre de recherche' },
        { icon: '🗂️', text: 'Filtrez par région : Europe, Asie, Amériques, Afrique…' },
        { icon: '🔥', text: 'Consultez l\'onglet Promos pour les meilleures offres du moment' },
      ],
      Illustration: IlluDestination,
    },
    {
      key: 'offer',
      badge: '🛒 Offre',
      title: 'Choisissez\nvotre forfait',
      subtitle: 'Chaque destination propose plusieurs forfaits selon vos besoins.',
      bullets: [
        { icon: '📶', text: 'Sélectionnez la quantité de data (Go) et la durée (jours)' },
        { icon: '💰', text: 'Les offres en promo sont mises en avant en orange' },
        { icon: '✅', text: 'Appuyez sur Commander → et payez en toute sécurité via Stripe' },
      ],
      Illustration: IlluOffer,
    },
    IS_IOS
      ? {
          key: 'activate',
          badge: '🔑 Activation',
          title: 'Activer votre eSIM\nsur iPhone',
          subtitle: 'Après commande, vous recevez un code d\'activation par email et dans l\'app.',
          osTag: true,
          bullets: [
            { icon: '📸', text: 'Faites une capture d\'écran ou copiez le code d\'activation affiché' },
            { icon: '📲', text: 'Réglages → Données cellulaires → Ajouter un forfait → Entrer les infos manuellement' },
            { icon: '✈️', text: 'Votre eSIM s\'active automatiquement à l\'arrivée dans le pays — bon voyage !' },
          ],
          Illustration: IlluActivation,
        }
      : {
          key: 'activate',
          badge: '🔑 Activation',
          title: 'Activer votre eSIM\nsur Android',
          subtitle: 'Après commande, vous recevez un code d\'activation par email et dans l\'app.',
          osTag: true,
          bullets: [
            { icon: '📸', text: 'Faites une capture d\'écran ou copiez le code d\'activation affiché' },
            { icon: '📲', text: 'Réseaux et internet → SIM → Ajouter SIM → Entrer un code d\'activation' },
            { icon: '✈️', text: 'Votre eSIM s\'active automatiquement à l\'arrivée dans le pays — bon voyage !' },
          ],
          Illustration: IlluActivation,
        },
  ];
}

/* ─── Composant ────────────────────────────────────────────────────────────── */

interface TutorialModalProps {
  visible: boolean;
  onClose: () => void;
}

export default function TutorialModal({ visible, onClose }: TutorialModalProps) {
  const pages = buildPages();
  const [pageIdx, setPageIdx] = useState(0);
  const slideAnim = useRef(new Animated.Value(300)).current;
  const backdropAnim = useRef(new Animated.Value(0)).current;
  const pageAnim = useRef(new Animated.Value(0)).current;

  const isLast = pageIdx === pages.length - 1;

  useEffect(() => {
    if (visible) {
      setPageIdx(0);
      pageAnim.setValue(0);
      backdropAnim.setValue(0);
      slideAnim.setValue(300);
      Animated.parallel([
        Animated.timing(backdropAnim, { toValue: 1, duration: 250, useNativeDriver: true }),
        Animated.spring(slideAnim, { toValue: 0, damping: 26, stiffness: 260, mass: 0.8, useNativeDriver: true }),
      ]).start();
    } else {
      Animated.parallel([
        Animated.timing(backdropAnim, { toValue: 0, duration: 200, useNativeDriver: true }),
        Animated.timing(slideAnim, { toValue: 300, duration: 200, useNativeDriver: true }),
      ]).start();
    }
  }, [visible]);

  const goTo = (next: number) => {
    Animated.sequence([
      Animated.timing(pageAnim, { toValue: -30, duration: 120, useNativeDriver: true }),
      Animated.timing(pageAnim, { toValue: 0, duration: 0, useNativeDriver: true }),
    ]).start(() => {
      setPageIdx(next);
      Animated.timing(pageAnim, { toValue: 0, duration: 180, useNativeDriver: true }).start();
    });
  };

  const handleNext = () => { if (isLast) { onClose(); return; } goTo(pageIdx + 1); };
  const handlePrev = () => { if (pageIdx > 0) goTo(pageIdx - 1); };

  const page = pages[pageIdx];
  const { Illustration } = page;

  return (
    <Modal visible={visible} transparent animationType="none" onRequestClose={onClose} statusBarTranslucent>
      <Animated.View style={[styles.backdrop, { opacity: backdropAnim }]}>
        <TouchableOpacity style={{ flex: 1 }} activeOpacity={1} onPress={onClose} />
      </Animated.View>

      <Animated.View style={[styles.card, { transform: [{ translateY: slideAnim }] }]} pointerEvents="box-none">
        {/* Header */}
        <LinearGradient
          colors={[Colors.primary, Colors.primaryMid]}
          start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }}
          style={styles.cardHeader}
        >
          <TouchableOpacity style={styles.closeBtn} onPress={onClose} activeOpacity={0.75}>
            <Text style={styles.closeTxt}>✕</Text>
          </TouchableOpacity>
          <View style={styles.illuWrap}><Illustration /></View>
          <Svg width="110%" height={28} viewBox="0 0 400 28" preserveAspectRatio="none" style={styles.headerWave}>
            <Path d="M0 28 Q100 0 200 18 Q300 36 400 10 L400 28 Z" fill={Colors.white} />
          </Svg>
        </LinearGradient>

        {/* Body */}
        <ScrollView style={styles.body} contentContainerStyle={styles.bodyContent} showsVerticalScrollIndicator={false} scrollEnabled={false}>
          <Animated.View style={[styles.pageContent, {
            opacity: pageAnim.interpolate({ inputRange: [-30, 0], outputRange: [0, 1] }),
            transform: [{ translateX: pageAnim }],
          }]}>
            <View style={styles.badge}>
              <Text style={styles.badgeText}>{page.badge}</Text>
            </View>

            <Text style={styles.title}>{page.title}</Text>
            <Text style={styles.subtitle}>{page.subtitle}</Text>

            {page.osTag && <OsTag />}

            <View style={styles.bullets}>
              {page.bullets.map((b, i) => (
                <View key={i} style={styles.bulletRow}>
                  <View style={styles.bulletIcon}>
                    <Text style={styles.bulletIconText}>{b.icon}</Text>
                  </View>
                  <Text style={styles.bulletText}>{b.text}</Text>
                </View>
              ))}
            </View>
          </Animated.View>
        </ScrollView>

        {/* Footer */}
        <View style={styles.footer}>
          <View style={styles.dots}>
            {pages.map((_, i) => (
              <TouchableOpacity key={i} onPress={() => i !== pageIdx && goTo(i)} activeOpacity={0.7}>
                <View style={[styles.dot, i === pageIdx && styles.dotActive]} />
              </TouchableOpacity>
            ))}
          </View>

          <View style={styles.navRow}>
            {pageIdx > 0 ? (
              <TouchableOpacity style={styles.prevBtn} onPress={handlePrev} activeOpacity={0.75}>
                <Text style={styles.prevBtnText}>← Retour</Text>
              </TouchableOpacity>
            ) : (
              <TouchableOpacity style={styles.skipBtn} onPress={onClose} activeOpacity={0.75}>
                <Text style={styles.skipBtnText}>Passer</Text>
              </TouchableOpacity>
            )}

            <TouchableOpacity onPress={handleNext} activeOpacity={0.85}>
              <LinearGradient
                colors={isLast ? [Colors.accent, '#0E7A6C'] : [Colors.primary, Colors.primaryMid]}
                start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }}
                style={styles.nextBtn}
              >
                <Text style={styles.nextBtnText}>
                  {isLast ? '🚀 C\'est parti !' : 'Suivant →'}
                </Text>
              </LinearGradient>
            </TouchableOpacity>
          </View>
        </View>
      </Animated.View>
    </Modal>
  );
}