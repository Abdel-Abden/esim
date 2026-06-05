/**
 * components/ActivationSteps/ActivationSteps.tsx
 *
 * Composant partagé entre TutorialModal et la page details.
 * Affiche les étapes d'activation eSIM pour l'OS détecté.
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
import { useTranslation } from 'react-i18next';
import { activationStepsStyles as styles } from './ActivationSteps.styles';

const IS_IOS = Platform.OS === 'ios';

export function OsTag() {
  const { t } = useTranslation();
  const theme = IS_IOS ? IOS_THEME : ANDROID_THEME;
  const label = IS_IOS
    ? t('activationSteps.osTag.ios')
    : t('activationSteps.osTag.android');

  return (
    <View style={[styles.osTag, { backgroundColor: theme.badgeBg, borderColor: theme.badgeBorder }]}>
      <Text style={[styles.osTagText, { color: theme.badgeText }]}>{label}</Text>
    </View>
  );
}

export function ActivationSteps() {
  const { t } = useTranslation();
  const theme = IS_IOS ? IOS_THEME : ANDROID_THEME;
  const steps = IS_IOS ? IOS_ACTIVATION_STEPS : ANDROID_ACTIVATION_STEPS;
  const label = IS_IOS
    ? t('activationSteps.label.ios')
    : t('activationSteps.label.android');

  return (
    <Card style={styles.card}>
      <View style={[styles.header, { backgroundColor: theme.bg, borderColor: theme.accent }]}>
        <View style={styles.headerLeft}>
          <Text style={[styles.headerTitle, { color: theme.title }]}>{label}</Text>
        </View>
      </View>

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
