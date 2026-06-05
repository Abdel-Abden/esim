/**
 * components/DebugPanel/DebugPanel.tsx
 *
 * Panneau de debug flottant — exclu du bundle de production par DCE.
 */
import { DEBUG_ORDER_ID, IS_LOCAL } from '@/constants/env';
import { useCartStore } from '@/store/useCartStore';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { useTranslation } from 'react-i18next';
import { styles } from './DebugPanel.styles';

const DEBUG_SHORTCUTS = [
  {
    id: 'details',
    labelKey: 'debug.shortcuts.details.label',
    descriptionKey: 'debug.shortcuts.details.description',
    route: '/details' as const,
    setup: (setOrderId: (id: string) => void) => setOrderId(DEBUG_ORDER_ID),
  },
] as const;

export default function DebugPanel() {
  const router = useRouter();
  const { setOrderId } = useCartStore();
  const { t } = useTranslation();
  const [expanded, setExpanded] = useState(false);

  if (!IS_LOCAL) return null;

  const handleShortcut = (shortcut: typeof DEBUG_SHORTCUTS[number]) => {
    shortcut.setup(setOrderId);
    setExpanded(false);
    router.push(shortcut.route);
  };

  return (
    <View style={styles.container} pointerEvents="box-none">
      {expanded && (
        <View style={styles.panel}>
          <View style={styles.panelHeader}>
            <Text style={styles.panelTitle}>{t('debug.panelTitle')}</Text>
            <Text style={styles.panelSubtitle}>{t('debug.panelSubtitle')}</Text>
          </View>

          {DEBUG_SHORTCUTS.map((s) => (
            <TouchableOpacity
              key={s.id}
              style={styles.shortcutBtn}
              onPress={() => handleShortcut(s)}
              activeOpacity={0.75}
            >
              <Text style={styles.shortcutLabel}>{t(s.labelKey)}</Text>
              <Text style={styles.shortcutDesc}>{t(s.descriptionKey)}</Text>
            </TouchableOpacity>
          ))}
        </View>
      )}

      <TouchableOpacity
        style={[styles.fab, expanded && styles.fabActive]}
        onPress={() => setExpanded((v) => !v)}
        activeOpacity={0.85}
      >
        <Text style={styles.fabText}>{expanded ? '✕' : t('debug.fabTitle')}</Text>
      </TouchableOpacity>
    </View>
  );
}
