/**
 * components/ActivationSteps/ActivationSteps.tsx
 *
 * Composant partagé entre TutorialModal et la page details.
 * Affiche les étapes d'activation eSIM pour l'OS détecté,
 * avec les vrais logos Apple et Google/Android en SVG.
 */
import Card from '@/components/Card/Card';
import {
  ANDROID_ACTIVATION_STEPS,
  ANDROID_THEME,
  IOS_ACTIVATION_STEPS,
  IOS_THEME,
} from '@/constants/esimActivation';
import React from 'react';
import { Platform, Text, View } from 'react-native';
import Svg, { Path } from 'react-native-svg';
import { activationStepsStyles as styles } from './ActivationSteps.styles';

const IS_IOS = Platform.OS === 'ios';

/* ─── Logos officiels en SVG ────────────────────────────────────────────────── */

/**
 * Logo Apple — forme "pomme avec morsure" officielle
 * Source : path normalisé depuis les guidelines Apple, viewBox 0 0 24 24
 */
function AppleLogo({ size = 16, color = '#1D1D1F' }: { size?: number; color?: string }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24">
      <Path
        fill={color}
        d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.8-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"
      />
    </Svg>
  );
}

/**
 * Logo Android (robot Google officiel)
 * Source : Material Design Icons — android, viewBox 0 0 24 24
 */
function AndroidLogo({ size = 16, color = '#3DDC84' }: { size?: number; color?: string }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24">
      <Path
        fill={color}
        d="M6 18c0 .55.45 1 1 1h1v3.5c0 .83.67 1.5 1.5 1.5S11 23.33 11 22.5V19h2v3.5c0 .83.67 1.5 1.5 1.5s1.5-.67 1.5-1.5V19h1c.55 0 1-.45 1-1V8H6v10zM3.5 8C2.67 8 2 8.67 2 9.5v7c0 .83.67 1.5 1.5 1.5S5 17.33 5 16.5v-7C5 8.67 4.33 8 3.5 8zm17 0c-.83 0-1.5.67-1.5 1.5v7c0 .83.67 1.5 1.5 1.5s1.5-.67 1.5-1.5v-7c0-.83-.67-1.5-1.5-1.5zm-4.97-5.84l1.3-1.3c.2-.2.2-.51 0-.71-.2-.2-.51-.2-.71 0l-1.48 1.48A5.84 5.84 0 0 0 12 1c-.96 0-1.86.23-2.66.63L7.85.15c-.2-.2-.51-.2-.71 0-.2.2-.2.51 0 .71l1.31 1.31A5.983 5.983 0 0 0 6 7h12c0-1.99-.97-3.75-2.47-4.84zM10 5H9V4h1v1zm5 0h-1V4h1v1z"
      />
    </Svg>
  );
}

/* ─── OsTag — petit badge inline utilisé dans TutorialModal ────────────────── */

/**
 * Badge coloré indiquant que la page est spécifique à l'OS de l'utilisateur.
 * Utilisé dans TutorialModal pour les pages "compatibilité" et "activation".
 */
export function OsTag() {
  const theme = IS_IOS ? IOS_THEME : ANDROID_THEME;
  const label = IS_IOS ? 'Spécifique iPhone (iOS)' : 'Spécifique Android';

  return (
    <View style={[
      styles.osTag,
      { backgroundColor: theme.badgeBg, borderColor: theme.badgeBorder },
    ]}>
      {IS_IOS
        ? <AppleLogo size={13} color={theme.badgeText} />
        : <AndroidLogo size={13} color={theme.accent} />
      }
      <Text style={[styles.osTagText, { color: theme.badgeText }]}>{label}</Text>
    </View>
  );
}

/* ─── ActivationSteps — carte complète avec les étapes ─────────────────────── */

/**
 * Carte d'activation à utiliser dans la page details.
 * Affiche automatiquement les étapes pour l'OS de l'utilisateur.
 */
export function ActivationSteps() {
  const theme = IS_IOS ? IOS_THEME : ANDROID_THEME;
  const steps = IS_IOS ? IOS_ACTIVATION_STEPS : ANDROID_ACTIVATION_STEPS;
  const label = IS_IOS ? 'Activation sur iPhone (iOS)' : 'Activation sur Android';

  return (
    <Card style={styles.card}>
      {/* En-tête coloré */}
      <View style={[styles.header, { backgroundColor: theme.bg, borderColor: theme.accent }]}>
        <View style={styles.headerLeft}>
          {IS_IOS
            ? <AppleLogo size={16} color={theme.title} />
            : <AndroidLogo size={16} color={theme.accent} />
          }
          <Text style={[styles.headerTitle, { color: theme.title }]}>{label}</Text>
        </View>
      </View>

      {/* Étapes */}
      {steps.map((step) => (
        <View key={step.n} style={styles.stepRow}>
          <View style={[styles.stepBadge, { backgroundColor: theme.accent }]}>
            <Text style={styles.stepBadgeText}>{step.n}</Text>
          </View>
          <Text style={[styles.stepText, { color: theme.text }]}>{step.text}</Text>
        </View>
      ))}
    </Card>
  );
}
