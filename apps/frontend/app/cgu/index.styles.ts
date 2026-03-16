import { Platform, StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FAFBFF',
  },
  header: {
    paddingTop: Platform.OS === 'ios' ? 56 : 32,
    paddingBottom: 12,
    paddingHorizontal: 20,
    backgroundColor: '#FFFFFF',
    borderBottomWidth: 1,
    borderBottomColor: '#EFEFEF',
  },
  backBtn: {
    marginBottom: 8,
  },
  backText: {
    color: '#0066FF',
    fontSize: 15,
    fontWeight: '500',
  },
  headerTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1A1A2E',
  },
  scroll: {
    flex: 1,
  },
  content: {
    paddingHorizontal: 20,
    paddingTop: 24,
    paddingBottom: 48,
  },
  h1: {
    fontSize: 17,
    fontWeight: '800',
    color: '#1A1A2E',
    marginBottom: 6,
    lineHeight: 24,
  },
  h2: {
    fontSize: 14,
    fontWeight: '700',
    color: '#0066FF',
    marginTop: 20,
    marginBottom: 8,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  body: {
    fontSize: 13,
    color: '#444',
    lineHeight: 20,
  },
  liRow: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    marginTop: 4,
    paddingLeft: 4,
  },
  liDot: {
    fontSize: 13,
    color: '#0066FF',
    marginRight: 8,
    lineHeight: 20,
  },
  liText: {
    flex: 1,
    fontSize: 13,
    color: '#444',
    lineHeight: 20,
  },
  divider: {
    height: 1,
    backgroundColor: '#EAEEFF',
    marginVertical: 16,
  },
  footer: {
    marginTop: 24,
    padding: 16,
    backgroundColor: '#F0F2FF',
    borderRadius: 12,
  },
  footerText: {
    fontSize: 12,
    color: '#888',
    textAlign: 'center',
    lineHeight: 18,
  },
});
