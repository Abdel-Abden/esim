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
import { activationStepsStyles as styles } from './ActivationSteps.styles';

const IS_IOS = Platform.OS === 'ios';

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
