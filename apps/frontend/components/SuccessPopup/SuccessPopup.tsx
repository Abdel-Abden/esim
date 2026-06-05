import React, { useEffect, useRef } from 'react';
import { Animated, Text } from 'react-native';
import { useTranslation } from 'react-i18next';
import { styles } from './SuccessPopup.styles';

interface SuccessPopupProps {
  visible: boolean;
  message?: string;
}

export default function SuccessPopup({ visible, message }: SuccessPopupProps) {
  const { t } = useTranslation();
  const translateY = useRef(new Animated.Value(-80)).current;
  const opacity = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    if (visible) {
      Animated.parallel([
        Animated.timing(translateY, { toValue: 0, duration: 350, useNativeDriver: true }),
        Animated.timing(opacity, { toValue: 1, duration: 250, useNativeDriver: true }),
      ]).start();
    } else {
      Animated.parallel([
        Animated.timing(translateY, { toValue: -80, duration: 300, useNativeDriver: true }),
        Animated.timing(opacity, { toValue: 0, duration: 200, useNativeDriver: true }),
      ]).start();
    }
  }, [visible]);

  return (
    <Animated.View style={[styles.container, { transform: [{ translateY }], opacity }]}>
      <Text style={styles.text}>{message ?? t('success.message')}</Text>
    </Animated.View>
  );
}
