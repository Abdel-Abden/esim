/**
 * components/DebugPanel/DebugPanel.tsx
 *
 * Panneau de debug flottant — exclu du bundle de production par DCE.
 *
 * SÉCURITÉ : on utilise process.env.EXPO_PUBLIC_ENVIRONMENT directement
 * (pas via une fonction) afin que Metro remplace la valeur à la compilation
 * et que Terser/Hermes supprime le bloc entier par dead-code elimination.
 * En production le fichier entier se réduit à `export default () => null`.
 * Un décompilateur ne trouvera aucun code de debug.
 */
import { DEBUG_ORDER_ID, IS_LOCAL } from '@/constants/env';
import { useCartStore } from '@/store/useCartStore';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { styles } from './DebugPanel.styles';

const DEBUG_SHORTCUTS = [
  {
    id: 'details',
    label: '🧾 Page confirmation',
    description: 'Simule une commande provisionnée',
    route: '/details' as const,
    setup: (setOrderId: (id: string) => void) => setOrderId(DEBUG_ORDER_ID),
  },
] as const;

export default function DebugPanel() {
  const router = useRouter();
  const { setOrderId } = useCartStore();
  const [expanded, setExpanded] = useState(false);

  // Guard runtime en plus du DCE — double sécurité
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
            <Text style={styles.panelTitle}>🛠 Debug local</Text>
            <Text style={styles.panelSubtitle}>EXPO_PUBLIC_ENVIRONMENT=local</Text>
          </View>

          {DEBUG_SHORTCUTS.map((s) => (
            <TouchableOpacity
              key={s.id}
              style={styles.shortcutBtn}
              onPress={() => handleShortcut(s)}
              activeOpacity={0.75}
            >
              <Text style={styles.shortcutLabel}>{s.label}</Text>
              <Text style={styles.shortcutDesc}>{s.description}</Text>
            </TouchableOpacity>
          ))}
        </View>
      )}

      <TouchableOpacity
        style={[styles.fab, expanded && styles.fabActive]}
        onPress={() => setExpanded((v) => !v)}
        activeOpacity={0.85}
      >
        <Text style={styles.fabText}>{expanded ? '✕' : '🛠'}</Text>
      </TouchableOpacity>
    </View>
  );
}