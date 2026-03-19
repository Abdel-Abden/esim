import React, { useEffect } from 'react';
import { Dimensions, Image, StyleSheet, View } from 'react-native';
import Reanimated, {
  Easing,
  runOnJS,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withSpring,
  withTiming,
} from 'react-native-reanimated';

const { width: W, height: H } = Dimensions.get('window');

interface SplashAnimationProps {
  onFinish: () => void;
}

export default function SplashAnimation({ onFinish }: SplashAnimationProps) {
  const ease = Easing.bezier(0.4, 0, 0.2, 1);

  // Logo icon
  const logoOp  = useSharedValue(0);
  const logoY   = useSharedValue(20);
  const logoScl = useSharedValue(0.82);

  // Wordmark
  const wmOp  = useSharedValue(0);
  const wmY   = useSharedValue(14);

  // Tagline
  const tagOp = useSharedValue(0);
  const tagY  = useSharedValue(8);

  // 5 progress dots
  const d1 = useSharedValue(0);
  const d2 = useSharedValue(0);
  const d3 = useSharedValue(0);
  const d4 = useSharedValue(0);
  const d5 = useSharedValue(0);

  // Overlay exit
  const exitOp = useSharedValue(1);
  const exitY  = useSharedValue(0);

  useEffect(() => {
    // Logo icon — spring bounce
    logoOp.value  = withDelay(200, withTiming(1,  { duration: 500, easing: ease }));
    logoY.value   = withDelay(200, withSpring(0,  { damping: 14, stiffness: 120 }));
    logoScl.value = withDelay(200, withSpring(1,  { damping: 12, stiffness: 100 }));

    // Wordmark
    wmOp.value = withDelay(700, withTiming(1, { duration: 500, easing: ease }));
    wmY.value  = withDelay(700, withTiming(0, { duration: 500, easing: ease }));

    // Tagline
    tagOp.value = withDelay(950, withTiming(1, { duration: 450, easing: ease }));
    tagY.value  = withDelay(950, withTiming(0, { duration: 450, easing: ease }));

    // Progress dots — cascade
    d1.value = withDelay(1200, withTiming(1, { duration: 350 }));
    d2.value = withDelay(1400, withTiming(1, { duration: 350 }));
    d3.value = withDelay(1600, withTiming(1, { duration: 350 }));
    d4.value = withDelay(1800, withTiming(1, { duration: 350 }));
    d5.value = withDelay(2000, withTiming(1, { duration: 350 }));

    // Exit
    exitOp.value = withDelay(2900, withTiming(0, { duration: 650 }, (done) => {
      if (done) runOnJS(onFinish)();
    }));
    exitY.value = withDelay(2900, withTiming(-20, { duration: 650, easing: Easing.in(Easing.ease) }));
  }, []);

  // Animated styles
  const overlayStyle = useAnimatedStyle(() => ({
    opacity:   exitOp.value,
    transform: [{ translateY: exitY.value }],
  }));

  const logoStyle = useAnimatedStyle(() => ({
    opacity:   logoOp.value,
    transform: [
      { translateY: logoY.value },
      { scale:      logoScl.value },
    ],
  }));

  const wordmarkStyle = useAnimatedStyle(() => ({
    opacity:   wmOp.value,
    transform: [{ translateY: wmY.value }],
  }));

  const taglineStyle = useAnimatedStyle(() => ({
    opacity:   tagOp.value,
    transform: [{ translateY: tagY.value }],
  }));

  const dot1Style = useAnimatedStyle(() => ({
    opacity:         d1.value,
    backgroundColor: d1.value > 0.5 ? '#F07A44' : 'rgba(255,255,255,0.25)',
    transform:       [{ scale: d1.value > 0.5 ? 1.25 : 1 }],
  }));
  const dot2Style = useAnimatedStyle(() => ({
    opacity:         d2.value,
    backgroundColor: d2.value > 0.5 ? '#F07A44' : 'rgba(255,255,255,0.25)',
    transform:       [{ scale: d2.value > 0.5 ? 1.25 : 1 }],
  }));
  const dot3Style = useAnimatedStyle(() => ({
    opacity:         d3.value,
    backgroundColor: d3.value > 0.5 ? '#F07A44' : 'rgba(255,255,255,0.25)',
    transform:       [{ scale: d3.value > 0.5 ? 1.25 : 1 }],
  }));
  const dot4Style = useAnimatedStyle(() => ({
    opacity:         d4.value,
    backgroundColor: d4.value > 0.5 ? '#F07A44' : 'rgba(255,255,255,0.25)',
    transform:       [{ scale: d4.value > 0.5 ? 1.25 : 1 }],
  }));
  const dot5Style = useAnimatedStyle(() => ({
    opacity:         d5.value,
    backgroundColor: d5.value > 0.5 ? '#F07A44' : 'rgba(255,255,255,0.25)',
    transform:       [{ scale: d5.value > 0.5 ? 1.25 : 1 }],
  }));

  return (
    <Reanimated.View style={[styles.overlay, overlayStyle]} pointerEvents="none">

      {/* Concentric rings — décor */}
      <View style={styles.ringsWrap}>
        {[120, 210, 320, 440].map((sz, i) => (
          <View
            key={i}
            style={[
              styles.ring,
              { width: sz, height: sz, borderRadius: sz / 2, opacity: 0.12 - i * 0.025 },
            ]}
          />
        ))}
      </View>

      {/* Logo */}
      <Reanimated.Image
        source={require('@/assets/images/logo_only.png')}
        style={[styles.logoImage, logoStyle]}
        resizeMode="stretch"
      />

      {/* Wordmark */}
      <Reanimated.View style={[styles.wordmarkWrap, wordmarkStyle]}>
        <Image
          source={require('@/assets/images/name.png')}
          style={styles.wordmarkImage}
          resizeMode="stretch"
        />
      </Reanimated.View>

      {/* Tagline */}
      <Reanimated.View style={[styles.taglineWrap, taglineStyle]}>
        <Image
          source={require('@/assets/images/tag_line.png')}
          style={styles.taglineImage}
          resizeMode="stretch"
        />
      </Reanimated.View>

      {/* 5 progress dots */}
      <View style={styles.dotsRow}>
        <Reanimated.View style={[styles.dot, dot1Style]} />
        <Reanimated.View style={[styles.dot, dot2Style]} />
        <Reanimated.View style={[styles.dot, dot3Style]} />
        <Reanimated.View style={[styles.dot, dot4Style]} />
        <Reanimated.View style={[styles.dot, dot5Style]} />
      </View>

    </Reanimated.View>
  );
}

const styles = StyleSheet.create({
  overlay: {
    position:        'absolute',
    width:           W,
    height:          H,
    zIndex:          999,
    backgroundColor: '#1A0D04',   // légèrement plus sombre que l'ancien #2A1508
    alignItems:      'center',
    justifyContent:  'center',
    overflow:        'hidden',
  },
  ringsWrap: {
    position:       'absolute',
    width:          W,
    height:         H,
    alignItems:     'center',
    justifyContent: 'center',
  },
  ring: {
    position:    'absolute',
    borderWidth: 1,
    borderColor: 'rgba(240,122,68,0.25)',
  },
  logoImage: {
    width:        300,
    height:       300,
    marginBottom: -80,   // mange le padding bas (37%)
  },
  wordmarkWrap: {
    width:        170,
    height:       38,
    overflow:     'hidden',
    marginBottom: 10,
  },
  wordmarkImage: {
    width:        213,
    height:       213,
    marginTop:    -98,   // saute le padding haut (46%)
    marginLeft:   -28,
  },

  taglineWrap: {
    width:        220,
    height:       14,
    overflow:     'hidden',
    marginBottom: 36,
  },
  taglineImage: {
    width:        259,
    height:       259,
    marginTop:    -138,  // saute le padding haut (53%)
    marginLeft:   -22,
    tintColor:    'rgba(255,255,255,0.6)',  // texte noir → blanc
  },
  dotsRow: {
    flexDirection: 'row',
    gap:           8,
  },
  dot: {
    width:        7,
    height:       7,
    borderRadius: 3.5,
  },
});
