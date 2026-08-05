/**
 * FeaturedCarousel — remplace l'ancienne carte "Monde entier" unique par un
 * carrousel plein écran (1 slide visible à la fois, swipe net) parmi les
 * destination marquées `featured`. Chaque slide est un <FeaturedCard/> normal —
 * visuel inchangé, juste plusieurs offres au lieu d'une seule.
 *
 * - 0 item  → géré par l'appelant (index.tsx), ce composant n'est pas monté
 * - 1 item  → carrousel sans les points de pagination (rien à naviguer)
 * - 2-8     → carrousel complet avec points de pagination
 */
import { Destination } from '@ilotel/shared';
import React, { useRef, useState } from 'react';
import { FlatList, NativeScrollEvent, NativeSyntheticEvent, View } from 'react-native';
import FeaturedCard from './FeaturedCard';
import { carouselStyles } from './Featuredcarousel';

interface FeaturedCarouselProps {
  destinations: Destination[];
}

export default function FeaturedCarousel({ destinations }: FeaturedCarouselProps) {
  const [containerWidth, setContainerWidth] = useState(0);
  const [activeIndex, setActiveIndex] = useState(0);
  const listRef = useRef<FlatList<Destination>>(null);

  const handleMomentumScrollEnd = (e: NativeSyntheticEvent<NativeScrollEvent>) => {
    if (!containerWidth) return;
    const idx = Math.round(e.nativeEvent.contentOffset.x / containerWidth);
    setActiveIndex(Math.max(0, Math.min(idx, destinations.length - 1)));
  };

  return (
    <View
      style={carouselStyles.wrap}
      onLayout={(e) => setContainerWidth(e.nativeEvent.layout.width)}
    >
      {containerWidth > 0 && (
        <FlatList
          ref={listRef}
          data={destinations}
          keyExtractor={(item) => item.id}
          horizontal
          pagingEnabled
          showsHorizontalScrollIndicator={false}
          onMomentumScrollEnd={handleMomentumScrollEnd}
          getItemLayout={(_, index) => ({
            length: containerWidth,
            offset: containerWidth * index,
            index,
          })}
          renderItem={({ item }) => (
            <View style={[carouselStyles.slide, { width: containerWidth }]}>
              <FeaturedCard destination={item} />
            </View>
          )}
        />
      )}

      {destinations.length > 1 && (
        <View style={carouselStyles.dotsRow}>
          {destinations.map((destination, i) => (
            <View
              key={destination.id}
              style={[carouselStyles.dot, i === activeIndex && carouselStyles.dotActive]}
            />
          ))}
        </View>
      )}
    </View>
  );
}