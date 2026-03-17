import React, { useEffect } from 'react';
import { Dimensions, StyleSheet, View } from 'react-native';
import Reanimated, {
  Easing,
  runOnJS,
  useAnimatedProps,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withTiming,
} from 'react-native-reanimated';
import { Circle, G, Path, Svg } from 'react-native-svg';

const { width: W, height: H } = Dimensions.get('window');

const AnimatedPath = Reanimated.createAnimatedComponent(Path);
const AnimatedCircle = Reanimated.createAnimatedComponent(Circle);

// Stroke lengths for the 4 orbit arcs
const O1 = 200, O2 = 240, O3 = 160, O4 = 120;

interface SplashAnimationProps {
  onFinish: () => void;
}

export default function SplashAnimation({ onFinish }: SplashAnimationProps) {
  const ease = Easing.bezier(0.4, 0, 0.2, 1);

  // SVG orbit draws
  const o1 = useSharedValue(O1);
  const o2 = useSharedValue(O2);
  const o3 = useSharedValue(O3);
  const o4 = useSharedValue(O4);
  const dotR = useSharedValue(0);
  const globeOp = useSharedValue(0);

  // Text
  const wmOp = useSharedValue(0);
  const wmY = useSharedValue(12);
  const tagOp = useSharedValue(0);
  const dotsOp = useSharedValue(0);

  // 5 dots fill
  const d1 = useSharedValue(0);
  const d2 = useSharedValue(0);
  const d3 = useSharedValue(0);
  const d4 = useSharedValue(0);
  const d5 = useSharedValue(0);

  // Overlay exit
  const exitOp = useSharedValue(1);
  const exitY  = useSharedValue(0);

  useEffect(() => {
    globeOp.value = withDelay(100,  withTiming(1, { duration: 500, easing: ease }));
    o1.value      = withDelay(200,  withTiming(0, { duration: 1200, easing: ease }));
    o2.value      = withDelay(500,  withTiming(0, { duration: 1200, easing: ease }));
    o3.value      = withDelay(900,  withTiming(0, { duration: 900,  easing: ease }));
    o4.value      = withDelay(1100, withTiming(0, { duration: 700,  easing: ease }));
    dotR.value    = withDelay(1200, withTiming(5, { duration: 400,  easing: ease }));

    wmOp.value  = withDelay(1000, withTiming(1, { duration: 600 }));
    wmY.value   = withDelay(1000, withTiming(0, { duration: 600, easing: ease }));
    tagOp.value = withDelay(1200, withTiming(1, { duration: 500 }));

    dotsOp.value = withDelay(1300, withTiming(1, { duration: 400 }));
    d1.value = withDelay(1400, withTiming(1, { duration: 400 }));
    d2.value = withDelay(1600, withTiming(1, { duration: 400 }));
    d3.value = withDelay(1800, withTiming(1, { duration: 400 }));
    d4.value = withDelay(2000, withTiming(1, { duration: 400 }));
    d5.value = withDelay(2200, withTiming(1, { duration: 400 }));

    exitOp.value = withDelay(3100, withTiming(0, { duration: 700 }, (done) => {
      if (done) runOnJS(onFinish)();
    }));
    exitY.value = withDelay(3100, withTiming(-15, { duration: 700, easing: Easing.in(Easing.ease) }));
  }, []);

  // SVG animated props
  const p1 = useAnimatedProps(() => ({ strokeDashoffset: o1.value }));
  const p2 = useAnimatedProps(() => ({ strokeDashoffset: o2.value }));
  const p3 = useAnimatedProps(() => ({ strokeDashoffset: o3.value }));
  const p4 = useAnimatedProps(() => ({ strokeDashoffset: o4.value }));
  const pDot = useAnimatedProps(() => ({ r: dotR.value }));
  const pGlobe = useAnimatedProps(() => ({ opacity: globeOp.value }));

  // RN animated styles
  const overlayStyle = useAnimatedStyle(() => ({
    opacity: exitOp.value,
    transform: [{ translateY: exitY.value }],
  }));
  const wordmarkStyle = useAnimatedStyle(() => ({
    opacity: wmOp.value,
    transform: [{ translateY: wmY.value }],
  }));
  const taglineStyle = useAnimatedStyle(() => ({ opacity: tagOp.value }));
  const dotsRowStyle = useAnimatedStyle(() => ({ opacity: dotsOp.value }));

  const dot1Style = useAnimatedStyle(() => ({
    backgroundColor: d1.value > 0.5 ? 'rgba(255,255,255,0.9)' : 'rgba(255,255,255,0.25)',
    transform: [{ scale: d1.value > 0.5 ? 1.3 : 1 }],
  }));
  const dot2Style = useAnimatedStyle(() => ({
    backgroundColor: d2.value > 0.5 ? 'rgba(255,255,255,0.9)' : 'rgba(255,255,255,0.25)',
    transform: [{ scale: d2.value > 0.5 ? 1.3 : 1 }],
  }));
  const dot3Style = useAnimatedStyle(() => ({
    backgroundColor: d3.value > 0.5 ? 'rgba(255,255,255,0.9)' : 'rgba(255,255,255,0.25)',
    transform: [{ scale: d3.value > 0.5 ? 1.3 : 1 }],
  }));
  const dot4Style = useAnimatedStyle(() => ({
    backgroundColor: d4.value > 0.5 ? 'rgba(255,255,255,0.9)' : 'rgba(255,255,255,0.25)',
    transform: [{ scale: d4.value > 0.5 ? 1.3 : 1 }],
  }));
  const dot5Style = useAnimatedStyle(() => ({
    backgroundColor: d5.value > 0.5 ? 'rgba(255,255,255,0.9)' : 'rgba(255,255,255,0.25)',
    transform: [{ scale: d5.value > 0.5 ? 1.3 : 1 }],
  }));

  return (
    <Reanimated.View style={[styles.overlay, overlayStyle]} pointerEvents="none">
      {/* Radial mesh */}
      <View style={styles.mesh} />

      {/* Concentric rings */}
      <View style={styles.ringsWrap}>
        {[110, 190, 290, 400].map((sz, i) => (
          <View key={i} style={[styles.ring, { width: sz, height: sz, borderRadius: sz / 2, opacity: 0.18 - i * 0.04 }]} />
        ))}
      </View>

      {/* Animated SVG Globe */}
      <View style={styles.logoWrap}>
        <Svg width={180} height={180} viewBox="0 0 90 90" fill="none">
          <G>
            {/* Globe circle — fades in */}
            <AnimatedCircle
              cx={45} cy={45} r={38}
              stroke="rgba(255,255,255,0.2)"
              strokeWidth={1.5}
              fill="none"
              animatedProps={pGlobe}
            />
            {/* Arc 1 — white top fill */}
            <AnimatedPath
              d="M15 20 Q45 5 75 20 Q62 35 45 38 Q28 35 15 20Z"
              fill="rgba(255,255,255,0.1)"
              stroke="rgba(255,255,255,0.9)"
              strokeWidth={3.5}
              strokeLinecap="round"
              strokeDasharray={`${O1}`}
              animatedProps={p1}
            />
            {/* Arc 2 — coral mid */}
            <AnimatedPath
              d="M9 50 Q28 38 45 42 Q62 46 79 38 Q75 60 45 72 Q15 60 9 50Z"
              fill="rgba(240,122,68,0.12)"
              stroke="#F07A44"
              strokeWidth={3}
              strokeLinecap="round"
              strokeDasharray={`${O2}`}
              animatedProps={p2}
            />
            {/* Arc 3 — bottom white */}
            <AnimatedPath
              d="M20 68 Q32 76 45 78 Q58 76 70 68"
              fill="none"
              stroke="rgba(255,255,255,0.5)"
              strokeWidth={2.5}
              strokeLinecap="round"
              strokeDasharray={`${O3}`}
              animatedProps={p3}
            />
            {/* Arc 4 — right sand */}
            <AnimatedPath
              d="M72 22 Q82 34 80 50"
              fill="none"
              stroke="#F5E0CC"
              strokeWidth={2}
              strokeLinecap="round"
              strokeDasharray={`${O4}`}
              animatedProps={p4}
            />
            {/* Center dot */}
            <AnimatedCircle cx={45} cy={40} fill="#F5E0CC" animatedProps={pDot} />
          </G>
        </Svg>
      </View>

      {/* Wordmark */}
      <Reanimated.Text style={[styles.wordmark, wordmarkStyle]}>
        {'ilo'}<Reanimated.Text style={styles.wordmarkLight}>{'tel'}</Reanimated.Text>
      </Reanimated.Text>

      {/* Tagline */}
      <Reanimated.Text style={[styles.tagline, taglineStyle]}>
        One eSIM · EveryWhere
      </Reanimated.Text>

      {/* 5 progress dots */}
      <Reanimated.View style={[styles.dotsRow, dotsRowStyle]}>
        <Reanimated.View style={[styles.dot, dot1Style]} />
        <Reanimated.View style={[styles.dot, dot2Style]} />
        <Reanimated.View style={[styles.dot, dot3Style]} />
        <Reanimated.View style={[styles.dot, dot4Style]} />
        <Reanimated.View style={[styles.dot, dot5Style]} />
      </Reanimated.View>
    </Reanimated.View>
  );
}

const styles = StyleSheet.create({
  overlay: {
    position: 'absolute',
    width: W,
    height: H,
    zIndex: 999,
    backgroundColor: '#2A1508',
    alignItems: 'center',
    justifyContent: 'center',
    overflow: 'hidden',
  },
  mesh: {
    position: 'absolute',
    top: 0, left: 0, right: 0, bottom: 0,
  },
  ringsWrap: {
    position: 'absolute',
    width: W,
    height: H,
    alignItems: 'center',
    justifyContent: 'center',
  },
  ring: {
    position: 'absolute',
    borderWidth: 1,
    borderColor: 'rgba(240,122,68,0.3)',
  },
  logoWrap: {
    marginBottom: 20,
  },
  wordmark: {
    fontSize: 34,
    fontWeight: '800',
    color: '#FFFFFF',
    letterSpacing: -1,
    marginBottom: 8,
  },
  wordmarkLight: {
    fontWeight: '300',
    color: 'rgba(255,255,255,0.5)',
  },
  tagline: {
    fontSize: 13,
    color: 'rgba(255,255,255,0.65)',
    fontWeight: '500',
    letterSpacing: 2,
    textTransform: 'uppercase',
    marginBottom: 32,
  },
  dotsRow: {
    flexDirection: 'row',
    gap: 6,
  },
  dot: {
    width: 6,
    height: 6,
    borderRadius: 3,
    backgroundColor: 'rgba(255,255,255,0.25)',
  },
});
