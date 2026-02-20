import { Colors } from '@/constants/theme';
import React from 'react';
import { Text, TextInput, View } from 'react-native';
import { styles } from './SearchBar.styles';

interface SearchBarProps {
  value: string;
  onChangeText: (text: string) => void;
  placeholder?: string;
}

export default function SearchBar({
  value,
  onChangeText,
  placeholder = 'Rechercher un pays...',
}: SearchBarProps) {
  return (
    <View style={styles.container}>
      <Text style={styles.icon}>🔍</Text>
      <TextInput
        style={styles.input}
        value={value}
        onChangeText={onChangeText}
        placeholder={placeholder}
        placeholderTextColor={Colors.muted}
        autoCorrect={false}
        autoCapitalize="none"
      />
    </View>
  );
}
