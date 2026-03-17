/**
 * SkeletonCard — carte fantôme calquée sur CountryCard (masonry)
 *
 * Structure miroir de CountryCard :
 *   flag (32px carré)
 *   name (14px, 60% de largeur)
 *   footer : [dès + prix] [badge promo]
 */
import { LinearGradient } from 'expo-linear-gradient';
import React, { useEffect, useRef } from 'react';
import { Animated, StyleSheet, View } from 'react-native';
import { skeletonStyles as s } from './SkeletonCard.styles';

// ─── Bloc shimmer générique ───────────────────────────────────────────────────
interface ShimmerProps {
  width: number | `${number}%`;
  height: number;
  radius?: number;
  anim: Animated.Value;
  style?: object;
}

function Shimmer({ width, height, radius, anim, style }: ShimmerProps) {
  return (
    <View style={[s.shimmerBase, { width, height, borderRadius: radius ?? height / 2 }, style]}>
      <Animated.View style={[StyleSheet.absoluteFill, { transform: [{ translateX: anim }] }]}>
        <LinearGradient
          colors={['#EEF0F4', '#F8F9FC', '#EEF0F4']}
          start={{ x: 0, y: 0 }}
          end={{ x: 1, y: 0 }}
          style={{ flex: 1 }}
        />
      </Animated.View>
    </View>
  );
}

// ─── Carte fantôme (miroir exact de CountryCard) ──────────────────────────────
export default function SkeletonCard({ delay = 0 }: { delay?: number }) {
  const anim = useRef(new Animated.Value(-200)).current;

  useEffect(() => {
    const t = setTimeout(() => {
      Animated.loop(
        Animated.sequence([
          Animated.timing(anim, { toValue: 200, duration: 1000, useNativeDriver: true }),
          Animated.timing(anim, { toValue: -200, duration: 0, useNativeDriver: true }),
        ])
      ).start();
    }, delay);
    return () => clearTimeout(t);
  }, [delay]);

  return (
    <View style={s.card}>
      {/* Flag — carré 32px comme CountryCard */}
      <Shimmer width={32} height={32} radius={8} anim={anim} style={{ marginBottom: 8 }} />

      {/* Nom du pays */}
      <Shimmer width="65%" height={12} anim={anim} style={{ marginBottom: 14 }} />

      {/* Footer : prix à gauche, badge promo à droite */}
      <View style={s.footer}>
        <View>
          {/* "dès" */}
          <Shimmer width={20} height={8} anim={anim} style={{ marginBottom: 4 }} />
          {/* prix */}
          <Shimmer width={48} height={16} anim={anim} />
        </View>
        {/* badge promo (présent sur ~1 carte sur 3) */}
        <Shimmer width={38} height={18} radius={6} anim={anim} />
      </View>
    </View>
  );
}

// ─── Grille masonry 2 colonnes (miroir exact de l'index.tsx) ─────────────────
export function SkeletonList({ count = 6 }: { count?: number }) {
  const col1 = Array.from({ length: Math.ceil(count / 2) }, (_, i) => i * 2);
  const col2 = Array.from({ length: Math.floor(count / 2) }, (_, i) => i * 2 + 1);

  return (
    <View style={s.masonryRow}>
      <View style={s.masonryCol}>
        {col1.map((i) => <SkeletonCard key={i} delay={i * 60} />)}
      </View>
      <View style={s.masonryCol}>
        {col2.map((i) => <SkeletonCard key={i} delay={i * 60} />)}
      </View>
    </View>
  );
}
