/**
 * WorldOffersSection — affichage direct des offres "Monde", sans étape de
 * sélection de carte : il n'existe qu'une seule "région" possible (le
 * monde), donc dès que l'onglet Monde est actif on charge et affiche
 * directement les offres, empilées par eSIM. Simple wrapper inline autour
 * du même <OffersSections/> que la modal utilise.
 */
import { EsimSummary } from '@ilotel/shared';
import React, { useEffect } from 'react';
import { View } from 'react-native';
import { worldStyles } from './OffersDrawer.styles';
import OffersSections from './OffersSections';
import { useOffersDrawer } from './useOffersDrawer';

interface WorldOffersSectionProps {
  members: EsimSummary[];
}

export default function WorldOffersSection({ members }: WorldOffersSectionProps) {
  const { sections, openDrawer, selectOffer } = useOffersDrawer(members);

  // Charge les offres dès que la liste "monde" est disponible — pas besoin
  // d'attendre un tap utilisateur comme pour une carte classique.
  const membersKey = members.map((m) => m.id).join(',');
  useEffect(() => {
    if (members.length > 0) openDrawer();
  }, [membersKey]);

  if (members.length === 0) return null;

  return (
    <View style={worldStyles.wrap}>
      <OffersSections sections={sections} onOfferPress={selectOffer} />
    </View>
  );
}
