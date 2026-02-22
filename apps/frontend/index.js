// apps/frontend/index.js
import { AppRegistry } from 'react-native';

// Requis par @stripe/stripe-react-native sur Android
AppRegistry.registerHeadlessTask('StripeKeepJsAwakeTask', () => async () => {});

import 'expo-router/entry';
