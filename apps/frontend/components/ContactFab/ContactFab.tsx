import { Ionicons } from '@expo/vector-icons';
import * as Haptics from 'expo-haptics';
import React, { useEffect, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';
import {
  Alert,
  Animated,
  Linking,
  Modal,
  Platform,
  Pressable,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { fabStyle } from './ContactFab.styles';

const WHATSAPP_NUMBER = '33746553198';
const SUPPORT_EMAIL = 'support@ilotel.com';

const EXCLUDED_ROUTES = ['/checkout'];

type ContactFabProps = {
  currentRoute?: string;
};

export default function ContactFab({ currentRoute }: ContactFabProps) {
  const [open, setOpen] = useState(false);
  const insets = useSafeAreaInsets();
  const { t } = useTranslation();

  // Animated classique (react-native), même pattern que TutorialModal —
  // évite le bug connu de react-native-reanimated où les zones tactiles
  // des vues entering/exiting restent mortes en build de production sur
  // Android (cf. issues software-mansion/react-native-reanimated).
  const backdropAnim = useRef(new Animated.Value(0)).current;
  const slideAnim = useRef(new Animated.Value(300)).current;

  useEffect(() => {
    if (open) {
      backdropAnim.setValue(0);
      slideAnim.setValue(300);
      Animated.parallel([
        Animated.timing(backdropAnim, { toValue: 1, duration: 200, useNativeDriver: true }),
        Animated.spring(slideAnim, { toValue: 0, damping: 26, stiffness: 260, mass: 0.8, useNativeDriver: true }),
      ]).start();
    } else {
      Animated.parallel([
        Animated.timing(backdropAnim, { toValue: 0, duration: 180, useNativeDriver: true }),
        Animated.timing(slideAnim, { toValue: 300, duration: 180, useNativeDriver: true }),
      ]).start();
    }
  }, [open]);

  if (currentRoute && EXCLUDED_ROUTES.includes(currentRoute)) {
    return null;
  }

  const handleOpen = () => {
    Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light);
    setOpen(true);
  };

  const handleClose = () => setOpen(false);

  const WHATSAPP_STORE_URL = Platform.select({
    ios: 'itms-apps://apps.apple.com/app/whatsapp-messenger/id310633997',
    android: 'market://details?id=com.whatsapp',
    default: 'https://www.whatsapp.com/download',
  });

  const promptInstallWhatsApp = () => {
    Alert.alert(
      t('contactFab.installAlert.title'),
      t('contactFab.installAlert.message'),
      [
        { text: t('contactFab.cancel'), style: 'cancel' },
        {
          text: t('contactFab.installAlert.install'),
          onPress: () => Linking.openURL(WHATSAPP_STORE_URL as string),
        },
      ],
    );
  };

  const openWhatsApp = async () => {
    const url = `whatsapp://send?phone=${WHATSAPP_NUMBER}`;
    const canOpen = await Linking.canOpenURL(url);
    handleClose();
    if (canOpen) {
      await Linking.openURL(url);
    } else {
      // Laisse le temps à la sheet de se fermer avant l'Alert (évite un conflit d'animation)
      setTimeout(promptInstallWhatsApp, 250);
    }
  };

  const openEmail = async () => {
    const subject = encodeURIComponent(t('contactFab.email.subject'));
    await Linking.openURL(`mailto:${SUPPORT_EMAIL}?subject=${subject}`);
    handleClose();
  };

  return (
    <>
      <Pressable
        onPress={handleOpen}
        style={[fabStyle.fab, { bottom: insets.bottom + 16 }]}
        accessibilityRole="button"
        accessibilityLabel={t('contactFab.accessibilityLabel')}
        hitSlop={8}
      >
        <Ionicons name="chatbubble-ellipses" size={24} color="#FFFFFF" />
      </Pressable>

      <Modal visible={open} transparent animationType="none" onRequestClose={handleClose}>
        <Animated.View style={[fabStyle.backdrop, { opacity: backdropAnim }]}>
          <TouchableOpacity style={{ flex: 1 }} activeOpacity={1} onPress={handleClose} />
        </Animated.View>

        <Animated.View
          style={[fabStyle.sheet, { paddingBottom: insets.bottom + 16, transform: [{ translateY: slideAnim }] }]}
          pointerEvents="box-none"
        >
          <View style={fabStyle.handle} />
          <Text style={fabStyle.title}>{t('contactFab.sheetTitle')}</Text>

          <TouchableOpacity style={fabStyle.option} onPress={openWhatsApp} activeOpacity={0.75}>
            <View style={[fabStyle.iconCircle, { backgroundColor: '#25D366' }]}>
              <Ionicons name="logo-whatsapp" size={22} color="#FFFFFF" />
            </View>
            <View style={fabStyle.optionText}>
              <Text style={fabStyle.optionTitle}>{t('contactFab.whatsapp.title')}</Text>
              <Text style={fabStyle.optionSubtitle}>{t('contactFab.whatsapp.subtitle')}</Text>
            </View>
          </TouchableOpacity>

          <TouchableOpacity style={fabStyle.option} onPress={openEmail} activeOpacity={0.75}>
            <View style={[fabStyle.iconCircle, { backgroundColor: '#4A90D9' }]}>
              <Ionicons name="mail" size={20} color="#FFFFFF" />
            </View>
            <View style={fabStyle.optionText}>
              <Text style={fabStyle.optionTitle}>{t('contactFab.email.title')}</Text>
              <Text style={fabStyle.optionSubtitle}>{t('contactFab.email.subtitle')}</Text>
            </View>
          </TouchableOpacity>

          <TouchableOpacity style={fabStyle.cancel} onPress={handleClose} activeOpacity={0.75}>
            <Text style={fabStyle.cancelText}>{t('contactFab.cancel')}</Text>
          </TouchableOpacity>
        </Animated.View>
      </Modal>
    </>
  );
}