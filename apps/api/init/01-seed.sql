-- =============================================================================
-- SEED — Reset complet + données liées aux offres
-- =============================================================================

-- Nettoyage dans l'ordre (FK)
UPDATE esim_inventory SET order_id = NULL, status = 'available', reserved_at = NULL, sold_at = NULL;
DELETE FROM orders;
DELETE FROM discounts;
DELETE FROM esim_inventory;
DELETE FROM offers;
DELETE FROM esims;

-- ============================================================
-- INSERT esims
-- ============================================================
-- =====================
-- ESIMS
-- =====================

INSERT INTO public.esims (id, featured, code, name, type, region, flag, region_countries) VALUES

-- =====================
-- local
-- =====================

-- Afrique AF

('a2b93439-736b-4646-8d26-a8b8630c4616', false, 'za', 'Afrique du Sud', 'local', 'af', '🇿🇦', '{"za": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('ec705aa3-7a3c-4917-b9da-60dca7a9f593', false, 'dz', 'Algérie', 'local', 'af', '🇩🇿', '{"dz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('88a6ae89-0dba-4b60-a600-495c1d7ca834', false, 'ao', 'Angola', 'local', 'af', '🇦🇴', '{"ao": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('8affb6bf-f360-4bcb-b08c-086989eae7df', true, 'bw', 'Botswana', 'local', 'af', '🇧🇼', '{"bw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('18d78ee2-4be5-4458-b15e-723e30e1f812', false, 'bf', 'Burkina Faso', 'local', 'af', '🇧🇫', '{"bf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('8100fc37-7d2d-47f2-92c5-12f9d0986e86', false, 'bi', 'Burundi', 'local', 'af', '🇧🇮', '{"bi": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4bcc5461-d8b0-4088-b045-40270850cea0', false, 'bj', 'Bénin', 'local', 'af', '🇧🇯', '{"bj": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('18e22b43-0f2b-4a3f-a4a5-64dc48802086', true, 'cm', 'Cameroun', 'local', 'af', '🇨🇲', '{"cm": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('bece1e79-beda-42a7-835e-fbf7d62cf22c', false, 'cv', 'Cap-Vert', 'local', 'af', '🇨🇻', '{"cv": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('b18078e3-5ea0-404b-b015-4b7e06196a03', false, 'km', 'Comores', 'local', 'af', '🇰🇲', '{"km": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('b7073514-059e-4f7f-8626-6a11215414ae', false, 'cg', 'Congo', 'local', 'af', '🇨🇬', '{"cg": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('f1ff57fd-3196-49ee-8de7-11d6f886cd5f', false, 'dj', 'Djibouti', 'local', 'af', '🇩🇯', '{"dj": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('85610ad8-2345-4089-81b2-23d08b4f5197', false, 'sz', 'Eswatini', 'local', 'af', '🇸🇿', '{"sz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('622f5c1c-542b-4d4b-8044-aaa9d6260463', true, 'ga', 'Gabon', 'local', 'af', '🇬🇦', '{"ga": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('73fa0649-807d-4962-8ebb-0a67c70f06b6', true, 'gh', 'Ghana', 'local', 'af', '🇬🇭', '{"gh": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('01e0eff2-6e95-4955-b771-72ac99b68657', true, 'gn', 'Guinée', 'local', 'af', '🇬🇳', '{"gn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', true, 'gw', 'Guinée-Bissau', 'local', 'af', '🇬🇼', '{"gw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('2af7024e-0176-42cb-b595-9cfcb49b3a06', true, 'ke', 'Kenya', 'local', 'af', '🇰🇪', '{"ke": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('c36b3ba2-e433-4a4d-bceb-46171388bb28', false, 'mg', 'Madagascar', 'local', 'af', '🇲🇬', '{"mg": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('c3e18708-3553-4175-9587-6e2281101020', true, 'mw', 'Malawi', 'local', 'af', '🇲🇼', '{"mw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4c47c065-c066-4e24-ad4e-963da4de4be6', false, 'ml', 'Mali', 'local', 'af', '🇲🇱', '{"ml": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('20a7b210-b291-4913-8932-de05a4a17fd7', false, 'ma', 'Maroc', 'local', 'af', '🇲🇦', '{"ma": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('2dcc8be7-f717-4749-a4aa-170b2fa1e160', false, 'mu', 'Maurice', 'local', 'af', '🇲🇺', '{"mu": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('b82bde93-00a9-4d61-9111-7a29f0433642', false, 'mr', 'Mauritanie', 'local', 'af', '🇲🇷', '{"mr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('507f3503-1f2d-4428-a46d-a82e2fad56ce', false, 'yt', 'Mayotte', 'local', 'af', '🇾🇹', '{"yt": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('79a013f3-3374-4972-a748-3cdb0fb98b48', false, 'mz', 'Mozambique', 'local', 'af', '🇲🇿', '{"mz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('950518ff-16b8-46f2-8280-8653a0f4aa2e', false, 'na', 'Namibie', 'local', 'af', '🇳🇦', '{"na": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('04d7b769-7c89-4bae-9554-55e2ee926929', false, 'ng', 'Nigeria', 'local', 'af', '🇳🇬', '{"ng": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('552e2cd2-b1c8-448b-a123-4c63756cbad0', false, 'ug', 'Ouganda', 'local', 'af', '🇺🇬', '{"ug": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('f8651905-903a-46a8-9237-e9fc5e88a59d', false, 'cd', 'RD Congo', 'local', 'af', '🇨🇩', '{"cd": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('0ae6b101-ba17-49cd-b9c8-92ba770903be', false, 'rw', 'Rwanda', 'local', 'af', '🇷🇼', '{"rw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('aa747bc5-2197-48b1-90a8-fb7b4e448ff1', false, 'cf', 'Rép. centrafricaine', 'local', 'af', '🇨🇫', '{"cf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('cd35dcc4-dc9d-4f6a-8818-7f262d933276', false, 're', 'Réunion', 'local', 'af', '🇷🇪', '{"re": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('57884e9b-f978-4090-bce4-75b6e93b3feb', false, 'sc', 'Seychelles', 'local', 'af', '🇸🇨', '{"sc": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3d9541fe-8d81-4733-834a-9d94668fa9fe', false, 'sl', 'Sierra Leone', 'local', 'af', '🇸🇱', '{"sl": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('18944f45-0a29-4a74-b05c-2edf9002c388', false, 'sd', 'Soudan', 'local', 'af', '🇸🇩', '{"sd": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('c8f5dddd-43ba-4e19-8da8-d0db121694ce', false, 'ss', 'Soudan du Sud', 'local', 'af', '🇸🇸', '{"ss": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('20647fac-7e92-481f-a6a7-ca1e8c451910', false, 'sn', 'Sénégal', 'local', 'af', '🇸🇳', '{"sn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('b71ac246-e162-4d99-a087-bf499b50b789', false, 'tz', 'Tanzanie', 'local', 'af', '🇹🇿', '{"tz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('c0e8360d-63e2-4005-80e5-c9f4cddf64f9', false, 'tg', 'Togo', 'local', 'af', '🇹🇬', '{"tg": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('9331f629-cc33-4f38-8294-4757e8627b74', false, 'tn', 'Tunisie', 'local', 'af', '🇹🇳', '{"tn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4a0d10c5-4fe0-48a3-bc50-8e3e5047bbcd', false, 'zm', 'Zambie', 'local', 'af', '🇿🇲', '{"zm": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', false, 'eg', 'Égypte', 'local', 'af', '🇪🇬', '{"eg": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3e60394e-1329-4788-9578-d6f600fc9ae5', false, 'et', 'Éthiopie', 'local', 'af', '🇪🇹', '{"et": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Amérique AM

('9abae76a-9068-494e-b529-819fdaecbadd', false, 'ar', 'Argentine', 'local', 'am', '🇦🇷', '{"ar": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('fe125ecb-1101-4aec-ab06-038fc05e976c', false, 'aw', 'Aruba', 'local', 'am', '🇦🇼', '{"aw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('2c6b087d-239f-4d39-99d2-fe45c4f32672', false, 'bs', 'Bahamas', 'local', 'am', '🇧🇸', '{"bs": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('300a0580-3eb9-4780-a42f-944459198313', false, 'bz', 'Belize', 'local', 'am', '🇧🇿', '{"bz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('666cd467-8716-4b94-bc10-8bfae45d1ccb', false, 'bo', 'Bolivie', 'local', 'am', '🇧🇴', '{"bo": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', false, 'br', 'Brésil', 'local', 'am', '🇧🇷', '{"br": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', false, 'ca', 'Canada', 'local', 'am', '🇨🇦', '{"ca": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('9dc48c68-a75f-4cc4-a7d4-ce6ff01cbec9', false, 'cl', 'Chili', 'local', 'am', '🇨🇱', '{"cl": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('8eec889b-4487-4c46-b2ec-aa680bbdd721', false, 'co', 'Colombie', 'local', 'am', '🇨🇴', '{"co": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', false, 'cr', 'Costa Rica', 'local', 'am', '🇨🇷', '{"cr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3a211984-8c5a-4b7b-83bf-0b9f6d039916', false, 'cw', 'Curaçao', 'local', 'am', '🇨🇼', '{"cw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('bfef0194-d761-4587-9229-45771ff85965', false, 'sv', 'El Salvador', 'local', 'am', '🇸🇻', '{"sv": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d4535f19-cff0-4456-a4e8-4218275df8e5', false, 'gl', 'Groenland', 'local', 'am', '🇬🇱', '{"gl": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d574eb3d-d1af-46de-867c-12b162d2cbf4', false, 'gp', 'Guadeloupe', 'local', 'am', '🇬🇵', '{"gf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gp": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('1cf701c6-f7c4-4a73-889a-b66a60f80062', false, 'gt', 'Guatemala', 'local', 'am', '🇬🇹', '{"gt": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('9d7fa02d-1f49-4e1c-89b4-db961eed8142', false, 'gy', 'Guyana', 'local', 'am', '🇬🇾', '{"gy": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('443e4e46-ed50-4816-9a10-4ff4990b643e', false, 'gf', 'Guyane française', 'local', 'am', '🇬🇫', '{"gf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('1fa157a8-1c21-4495-a7ad-0e38c6e70769', false, 'hn', 'Honduras', 'local', 'am', '🇭🇳', '{"hn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3e418e21-0282-4d16-9a75-da6874d50698', false, 'mq', 'Martinique', 'local', 'am', '🇲🇶', '{"gf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mq": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('f50b53f8-ab49-4b71-9226-727124563dce', false, 'mx', 'Mexique', 'local', 'am', '🇲🇽', '{"mx": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('e9f15ed5-016c-451d-b96c-482463e316d2', false, 'ni', 'Nicaragua', 'local', 'am', '🇳🇮', '{"ni": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', false, 'pa', 'Panama', 'local', 'am', '🇵🇦', '{"pa": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', false, 'py', 'Paraguay', 'local', 'am', '🇵🇾', '{"py": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', false, 'pe', 'Pérou', 'local', 'am', '🇵🇪', '{"pe": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', false, 'do', 'Rép. dominicaine', 'local', 'am', '🇩🇴', '{"do": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('57a98d28-3af6-4ee3-9b4a-27d0e44f41a6', false, 'bl', 'Saint-Barthélemy', 'local', 'am', '🇧🇱', '{"bl": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('8d3484bd-f560-419e-ae65-a43236eb7754', false, 'mf', 'Saint-Martin', 'local', 'am', '🇲🇫', '{"gf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d3844292-5c75-4af2-8c36-21d59ca7c4ac', false, 'sr', 'Suriname', 'local', 'am', '🇸🇷', '{"sr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d4b597b3-46da-429b-9de6-b2110f2fb552', false, 'tt', 'Trinité-et-Tobago', 'local', 'am', '🇹🇹', '{"tt": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', false, 'uy', 'Uruguay', 'local', 'am', '🇺🇾', '{"uy": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('fc8adfb9-fe36-45c0-8d06-69bfd508c899', false, 've', 'Venezuela', 'local', 'am', '🇻🇪', '{"ve": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('c0b05975-5b74-4d19-bf7b-6d6c93a562a2', false, 'ec', 'Équateur', 'local', 'am', '🇪🇨', '{"ec": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Asie AS

('db0671c5-fee7-484c-962e-20e4ee9f5f43', false, 'am', 'Arménie', 'local', 'as', '🇦🇲', '["am", "ar", "bo", "br", "bz", "ca", "cl", "co", "cr", "do", "ec", "gl", "gt", "hn", "mx", "ni", "pa", "pe", "pr", "py", "sv", "us", "uy", "ve", "vg", "vi"]'),
('6f074ac8-c8a2-47e7-9966-7193db9fa1dc', false, 'az', 'Azerbaïdjan', 'local', 'as', '🇦🇿', '{"az": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d15b65f7-df13-4df6-9e79-e0463791e071', false, 'bt', 'Bhoutan', 'local', 'as', '🇧🇹', '{"bt": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d228e113-01ec-4173-a275-67e5dbd3f00a', false, 'bn', 'Brunei', 'local', 'as', '🇧🇳', '{"bn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('b3043532-ec5a-4c7b-86be-d7c14b401168', false, 'kh', 'Cambodge', 'local', 'as', '🇰🇭', '{"kh": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', false, 'cn', 'Chine', 'local', 'as', '🇨🇳', '{"cn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', false, 'kr', 'Corée du Sud', 'local', 'as', '🇰🇷', '{"kr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', false, 'ge', 'Géorgie', 'local', 'as', '🇬🇪', '{"ge": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('b3378ac1-e71a-4172-b73a-fda355742af2', false, 'hk', 'Hong Kong', 'local', 'as', '🇭🇰', '{"hk": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', false, 'in', 'Inde', 'local', 'as', '🇮🇳', '{"in": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', false, 'id', 'Indonésie', 'local', 'as', '🇮🇩', '{"id": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', false, 'jp', 'Japon', 'local', 'as', '🇯🇵', '{"jp": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', false, 'kz', 'Kazakhstan', 'local', 'as', '🇰🇿', '{"kz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', false, 'kg', 'Kirghizistan', 'local', 'as', '🇰🇬', '{"kg": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('fc9e9738-ece0-426b-99e9-af330604674f', false, 'mo', 'Macao', 'local', 'as', '🇲🇴', '{"mo": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', false, 'my', 'Malaisie', 'local', 'as', '🇲🇾', '{"my": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('0d75c093-7466-476c-a75f-d87f621eb86d', false, 'mn', 'Mongolie', 'local', 'as', '🇲🇳', '{"mn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('607fb6b6-fa55-461a-9535-41bba2e710f2', false, 'np', 'Népal', 'local', 'as', '🇳🇵', '{"np": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', false, 'uz', 'Ouzbékistan', 'local', 'as', '🇺🇿', '{"uz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', false, 'pk', 'Pakistan', 'local', 'as', '🇵🇰', '{"pk": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', false, 'ph', 'Philippines', 'local', 'as', '🇵🇭', '{"ph": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', false, 'sg', 'Singapour', 'local', 'as', '🇸🇬', '{"sg": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('09925e99-4237-47de-acd4-f9c83f739e0f', false, 'lk', 'Sri Lanka', 'local', 'as', '🇱🇰', '{"lk": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', false, 'tj', 'Tadjikistan', 'local', 'as', '🇹🇯', '{"tj": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4b712600-a89d-45bf-a2e5-227208769c2c', false, 'tw', 'Taïwan', 'local', 'as', '🇹🇼', '{"tw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('ccda7780-bccf-4df5-866d-2512fe061197', false, 'th', 'Thaïlande', 'local', 'as', '🇹🇭', '{"th": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('03be8bc2-1e20-4482-8dc6-036064614db6', false, 'vn', 'Vietnam', 'local', 'as', '🇻🇳', '{"vn": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Europe EU

('6618653a-8531-4a48-bc18-66f6783ccdf6', false, 'al', 'Albanie', 'local', 'eu', '🇦🇱', '{"al": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}, "Opérateur_name_2": {"3G": false, "4G": true, "5G": false}}}'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', false, 'de', 'Allemagne', 'local', 'eu', '🇩🇪', '{"de": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('05d44374-2606-4100-a79c-64c9699db094', false, 'ad', 'Andorre', 'local', 'eu', '🇦🇩', '{"ad": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('547e8d96-fb59-4cb0-a469-db74bf912703', false, 'at', 'Autriche', 'local', 'eu', '🇦🇹', '{"at": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', false, 'be', 'Belgique', 'local', 'eu', '🇧🇪', '{"be": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('01cd0f2e-f4be-4904-b08c-8ae448ddc80e', false, 'by', 'Biélorussie', 'local', 'eu', '🇧🇾', '{"by": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('5ae1cd2e-6859-41cd-accb-ae5a1abe947c', false, 'ba', 'Bosnie-Herzégovine', 'local', 'eu', '🇧🇦', '{"ba": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('138a1373-d698-4310-bbc2-28a411aedb55', false, 'bg', 'Bulgarie', 'local', 'eu', '🇧🇬', '{"bg": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', false, 'cy', 'Chypre', 'local', 'eu', '🇨🇾', '{"cy": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('11df7336-ec98-4b37-b02c-29095ebb3d45', false, 'hr', 'Croatie', 'local', 'eu', '🇭🇷', '{"hr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3014d626-9c7f-4803-8fe8-270f67da6833', false, 'dk', 'Danemark', 'local', 'eu', '🇩🇰', '{"dk": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', false, 'es', 'Espagne', 'local', 'eu', '🇪🇸', '{"es": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', false, 'ee', 'Estonie', 'local', 'eu', '🇪🇪', '{"ee": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('0a06379a-dba0-4082-872e-40645e1c0393', false, 'fi', 'Finlande', 'local', 'eu', '🇫🇮', '{"fi": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('996f27cf-e96a-42fd-8795-d92d46138607', false, 'fr', 'France', 'local', 'eu', '🇫🇷', '{"fr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3c87a8ac-01d1-4d0a-80e2-a869c56deb95', false, 'gi', 'Gibraltar', 'local', 'eu', '🇬🇮', '{"gi": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', false, 'gr', 'Grèce', 'local', 'eu', '🇬🇷', '{"gr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('81125430-b0dd-4e2a-a90f-6169b00a5afd', false, 'hu', 'Hongrie', 'local', 'eu', '🇭🇺', '{"hu": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('f197448d-ed17-4091-94d8-8a932c534aab', false, 'ie', 'Irlande', 'local', 'eu', '🇮🇪', '{"ie": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', false, 'is', 'Islande', 'local', 'eu', '🇮🇸', '{"is": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', false, 'it', 'Italie', 'local', 'eu', '🇮🇹', '{"it": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('fcff9806-45b3-471b-89ec-d4716f90d013', false, 'lv', 'Lettonie', 'local', 'eu', '🇱🇻', '{"lv": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('91fca936-4213-418b-9121-01faebcc45ef', false, 'lt', 'Lituanie', 'local', 'eu', '🇱🇹', '{"lt": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('5955df61-0197-4e53-85ff-ba92c3289ebc', false, 'lu', 'Luxembourg', 'local', 'eu', '🇱🇺', '{"lu": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('0dee01ad-1df3-4ce9-b355-25bec805ec91', false, 'mk', 'Macédoine du Nord', 'local', 'eu', '🇲🇰', '{"mk": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', false, 'mt', 'Malte', 'local', 'eu', '🇲🇹', '{"mt": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4fe9ee34-3e98-4dd6-a484-2272c3bf7261', false, 'md', 'Moldavie', 'local', 'eu', '🇲🇩', '{"md": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('385aeecb-fb20-47e6-bbf9-dfb6e506cc88', false, 'me_', 'Monténégro', 'local', 'eu', '', '{"me": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', false, 'no', 'Norvège', 'local', 'eu', '🇳🇴', '{"no": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', false, 'nl', 'Pays-Bas', 'local', 'eu', '🇳🇱', '{"nl": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', false, 'pl', 'Pologne', 'local', 'eu', '🇵🇱', '{"pl": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('037b8737-045b-4a50-beae-a2af6d1c4106', false, 'pt', 'Portugal', 'local', 'eu', '🇵🇹', '{"pt": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('dc0946f2-13db-4f2a-8259-d32977418215', false, 'ro', 'Roumanie', 'local', 'eu', '🇷🇴', '{"ro": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('327f649b-460b-49c2-ab74-ccc84adc615c', false, 'gb', 'Royaume-Uni', 'local', 'eu', '🇬🇧', '{"gb": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('891ee240-1d18-4fe9-b626-b93f55225f93', false, 'ru', 'Russie', 'local', 'eu', '🇷🇺', '{"ru": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('7e713e18-46ed-45d2-b54e-bf087123ab60', false, 'rs', 'Serbie', 'local', 'eu', '🇷🇸', '{"rs": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('66ec6adb-dd58-479f-8547-cfb41e664528', false, 'sk', 'Slovaquie', 'local', 'eu', '🇸🇰', '{"sk": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('0e795b5a-64a6-47de-82ff-11c8eff90077', false, 'si', 'Slovénie', 'local', 'eu', '🇸🇮', '{"si": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', false, 'ch', 'Suisse', 'local', 'eu', '🇨🇭', '{"ch": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', false, 'se', 'Suède', 'local', 'eu', '🇸🇪', '{"se": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('44ea41be-40ed-4339-8bff-de45994a77a2', false, 'cz', 'Tchéquie', 'local', 'eu', '🇨🇿', '{"cz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('ebaff4c3-2062-4908-8641-c00568028c7e', false, 'tr', 'Turquie', 'local', 'eu', '🇹🇷', '{"tr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('af28a2cc-8c89-4347-82bf-14d4ccf4373d', false, 'ua', 'Ukraine', 'local', 'eu', '🇺🇦', '{"ua": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('36129492-21ba-443f-9197-a7623a997c2c', false, 'fo', 'Îles Féroé', 'local', 'eu', '🇫🇴', '{"fo": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Moyen-Orient ME

('0d9a1def-7bb9-401d-8aa9-3cd84db2a141', false, 'sa', 'Arabie saoudite', 'local', 'me', '🇸🇦', '{"sa": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('72776ef6-113d-4171-b418-d99377b38ab5', false, 'bh', 'Bahreïn', 'local', 'me', '🇧🇭', '{"bh": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('673f0f6e-745b-411e-8900-f13f3275ea21', false, 'iq', 'Irak', 'local', 'me', '🇮🇶', '{"iq": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', false, 'il', 'Israël', 'local', 'me', '🇮🇱', '{"il": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('0c2281a3-3b02-4875-9663-40847e1c5bf7', false, 'jo', 'Jordanie', 'local', 'me', '🇯🇴', '{"jo": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('ff3bf3ce-7219-42db-89d7-43adbc1a263b', false, 'kw', 'Koweït', 'local', 'me', '🇰🇼', '{"kw": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('a60ee5dd-3acf-4afb-9d20-01edd5d60cb7', false, 'om', 'Oman', 'local', 'me', '🇴🇲', '{"om": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('5b6fa89d-9c96-47a3-a7b2-a4f0e18c6eb3', false, 'ps', 'Palestine', 'local', 'me', '🇵🇸', '{"ps": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d934bb7c-f750-48b3-ac92-86903494333b', false, 'qa', 'Qatar', 'local', 'me', '🇶🇦', '{"qa": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4e141b22-bb56-406b-a0b5-42a48bf1af59', false, 'ae', 'Émirats arabes unis', 'local', 'me', '🇦🇪', '{"ae": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Océanie OC

('a6ce2d02-3950-4de5-b945-b380ae095ea9', false, 'au', 'Australie', 'local', 'oc', '🇦🇺', '{"au": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4643c960-c4df-413e-8eb1-28795ebc13f2', false, 'fj', 'Fidji', 'local', 'oc', '🇫🇯', '{"fj": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('47560712-bb5b-43e6-b88c-55ae6fca9a0a', false, 'gu', 'Guam', 'local', 'oc', '🇬🇺', '{"gu": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('64feb637-d560-4b7b-ac2f-f81a347e9098', false, 'nr', 'Nauru', 'local', 'oc', '🇳🇷', '{"nr": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('adde12c2-76bd-4f99-8229-f96af97c5f8b', false, 'nc', 'Nouvelle-Calédonie', 'local', 'oc', '🇳🇨', '{"nc": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', false, 'nz', 'Nouvelle-Zélande', 'local', 'oc', '🇳🇿', '{"nz": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d1824057-970c-4dde-89bb-1433a20ae7cc', false, 'pf', 'Polynésie française', 'local', 'oc', '🇵🇫', '{"pf": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('90e23d02-e342-490a-8353-c2c85145d7b3', false, 'ws', 'Samoa', 'local', 'oc', '🇼🇸', '{"ws": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('f5dc92b9-1137-40ea-8031-7f097fe7a5e1', false, 'to', 'Tonga', 'local', 'oc', '🇹🇴', '{"to": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('9ba71685-57e6-48c9-b6e2-e660851d15ee', false, 'vu', 'Vanuatu', 'local', 'oc', '🇻🇺', '{"vu": { "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
-- =====================
-- REGION
-- =====================

-- Afrique AF

('906ae15d-02cc-42db-b7a3-213042e7fdc7', false, 'af', 'Afrique', 'region', 'af', '🌍', '{"af":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ci":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "eg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "et":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ga":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ke":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "km":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ls":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ma":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ml":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ne":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ng":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "re":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "rw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ss":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "td":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ug":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "yt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "za":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "zm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d26f02d1-3bed-4fba-9a2d-ade19b7d32dd', false, 'af2', 'Afrique (sélection)', 'region', 'af', '🌍', '{"bj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ci":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "eg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ma":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ml":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ng":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "re":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "rw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ss":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ug":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "yt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "za":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "zm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Amérique AM

('daff99bc-4144-4769-8a07-a976a92313e3', false, 'latam2', 'Amérique latine (étendue)', 'region', 'am', '🌎', '{"ar":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "br":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "co":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ec":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mx":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ni":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "py":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "uy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ve":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('3efa96a5-227e-41fd-85dc-39718ebf399f', false, 'carib-b', 'Caraïbes (B)', 'region', 'am', '🌎', '{"ag":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ai":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "aw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bs":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "do":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ht":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ky":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ms":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sx":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('e3dcd9c5-3512-454f-92b0-0637d5ced156', false, 'carib2', 'Caraïbes (étendue)', 'region', 'am', '🌎', '{"bl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('e4197d22-7677-40b4-b61a-ddf6fc3d0aec', false, 'us-can', 'USA & Canada', 'region', 'am', '🌎', '{"ca":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "us":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', false, 'us-all', 'États-Unis & territoires', 'region', 'am', '🌎', '{"pr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "us":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Asie AS

('d02a228e-6a2b-4b05-8570-fe7956f08628', false, 'as', 'Asie', 'region', 'as', '🌏', '{"au":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "az":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "id":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "in":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ir":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "la":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "my":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "np":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ph":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "th":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "uz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('d5b45760-9074-4142-abe8-df4dafdf5391', false, 'as3', 'Asie (étendue)', 'region', 'as', '🌏', '{"cn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "id":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "in":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "la":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "my":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ph":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "th":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('af3cfa07-0c05-45da-aa01-b0f8a54df2ed', false, 'mys-sgp', 'Malaisie & Singapour', 'region', 'as', '🌏', '{"my":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Europe EU

('e746daaf-52d0-4e9c-8b18-d97506fea34b', false, 'eu', 'Europe', 'region', 'eu', '🇪🇺', '{"ad":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "at":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "be":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ch":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "de":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ee":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "es":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ie":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "im":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "is":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "it":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "je":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "li":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "md":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "no":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "re":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ro":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "se":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "si":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ua":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', false, 'eu-ext', 'Europe étendue', 'region', 'eu', '🇪🇺', '{"ad":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "al":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "at":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "az":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ba":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "be":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "by":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ch":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "de":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ee":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "es":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ge":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ie":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "il":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "im":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "is":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "it":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "je":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "li":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "md":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "me":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "no":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ro":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "rs":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ru":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "se":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "si":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ua":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "uz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "yt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('e11eaf06-a7b3-4bcb-aa19-00f695b9e272', false, 'jey-ggy', 'Jersey, Guernesey & Île de Man', 'region', 'eu', '🇪🇺', '{"gg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "im":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "je":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('4b5f225e-3828-46bc-86c9-5bdef91d2e86', false, 'scand', 'Scandinavie', 'region', 'eu', '🇪🇺', '{"dk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ee":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "is":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "no":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "se":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Moyen-Orient ME

('e52f1848-d286-4c99-9c67-221cb876f6ee', false, 'me-woi', 'Moyen-Orient (sans Israël)', 'region', 'me', '🌍', '{"ae":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "af":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "am":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "il":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "iq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ir":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "om":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ps":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "qa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('7505117e-4acd-437f-a3e6-ed4978df651e', false, 'me1', 'Moyen-Orient (sélection)', 'region', 'me', '🌍', '{"bh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "il":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "iq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "om":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "qa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('8dea511e-d8f9-4b4b-81d1-dca0251866cb', false, 'me2', 'Moyen-Orient (étendu)', 'region', 'me', '🌍', '{"bh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "il":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "iq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "om":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "qa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Océanie OC

('ffe3fed4-6311-49eb-80c0-d24b2744c355', false, 'anz', 'Australie & NZ', 'region', 'oc', '🌏', '{"au":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('b9a02fc3-b556-4460-895d-3065cd377641', false, 'oc', 'Océanie', 'region', 'oc', '🌏', '{"au":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "to":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ws":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),

-- Monde WW

('63adfa4b-f6a1-4064-b34b-1dae578c03ef', false, 'ww1', 'Monde (179 pays)', 'global', 'ww', '🌐', '{"ad":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ae":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ag":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ai":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "al":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ar":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "at":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "au":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "aw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "az":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ba":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "be":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "br":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bs":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "by":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ca":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ch":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ci":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "co":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "de":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "do":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ec":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ee":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "eg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "es":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ga":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ge":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ht":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "id":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ie":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "il":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "im":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "in":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "iq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "is":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "it":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "je":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ke":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "km":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ky":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "la":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "li":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ma":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "md":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "me":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ml":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ms":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mx":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "my":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ng":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ni":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "no":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "om":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pe":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ph":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "py":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "qa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "re":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ro":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "rs":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ru":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "rw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "se":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "si":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ss":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sx":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "th":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "to":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ua":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ug":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "us":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "uy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "uz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ve":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ws":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "yt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "za":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "zm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}'),
('8df03d84-b222-41f2-8560-a268aa57ef94', false, 'ww2', 'Monde (202 pays)', 'global', 'ww', '🌐', '{"ad":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ae":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "af":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}, "Opérateur_name-2": {"3G": false, "4G": false, "5G": true}}, "ag":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ai":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "al":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "am":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ar":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "at":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "au":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "aw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "az":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ba":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "be":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "br":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bs":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "by":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "bz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ca":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ch":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ci":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "co":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "cz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "de":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "do":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "dz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ec":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ee":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "eg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "es":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "et":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "fr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ga":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ge":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "gy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ht":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "hu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "id":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ie":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "il":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "im":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "in":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "iq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ir":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "is":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "it":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "je":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "jp":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ke":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kh":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "km":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ky":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "kz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "la":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "li":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ls":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "lv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ma":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "md":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "me":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ml":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mo":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mq":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ms":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mx":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "my":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "mz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ne":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ng":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ni":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "no":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "np":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "nz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "om":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pe":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pf":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ph":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ps":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "pt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "py":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "qa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "re":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ro":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "rs":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ru":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "rw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sa":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sb":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sd":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "se":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "si":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sk":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sl":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ss":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sv":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sx":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "sz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "td":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "th":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tj":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "to":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tr":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tw":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "tz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ua":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ug":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "us":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "uy":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "uz":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vc":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ve":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vg":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vi":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vn":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "vu":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "ws":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "yt":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "za":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}, "zm":{ "Opérateur_name": {"3G": false, "4G": true, "5G": false}}}');



-- =====================
-- OFFERS
-- =====================

INSERT INTO public.offers (id, esim_id, data_gb, duration_days, base_price, stripe_price_id, transatel_product_id, unit) VALUES


-- Afrique

('371abd00-9b07-4439-a404-a517e669788d', '906ae15d-02cc-42db-b7a3-213042e7fdc7', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_AFG_1GB_7D', 'Go'),
('e0797c78-003a-43ad-96de-e7b00df68546', '906ae15d-02cc-42db-b7a3-213042e7fdc7', 1.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_AFRICA2_1GB_30D', 'Go'),
('bd788b2d-3996-4ef4-b27f-99db52208f05', '906ae15d-02cc-42db-b7a3-213042e7fdc7', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_AFG_3GB_15D', 'Go'),
('bf126b32-d65b-4565-92f1-a4ad2bc00d05', '906ae15d-02cc-42db-b7a3-213042e7fdc7', 3.0, 15, 41.8, '', 'WW_901O_STACK_ONEOFF_AFRICA2_3GB_15D', 'Go'),

-- Afrique (sélection)

('8f5fc2a3-c4da-42c1-a57f-814705cdaa72', 'd26f02d1-3bed-4fba-9a2d-ade19b7d32dd', 1.0, 30, 6.65, '', 'WW_901O_STACK_ONEOFF_BESTAFRICA2_1GB_30D', 'Go'),
('4a9e6157-2076-4557-8edc-4d81bf20e76c', 'd26f02d1-3bed-4fba-9a2d-ade19b7d32dd', 3.0, 30, 14.25, '', 'WW_901O_STACK_ONEOFF_BESTAFRICA2_3GB_30D', 'Go'),
('ca36d2d5-e593-4774-8343-f4e8751db82a', 'd26f02d1-3bed-4fba-9a2d-ade19b7d32dd', 10.0, 30, 28.5, '', 'WW_901O_STACK_ONEOFF_BESTAFRICA2_10GB_30D', 'Go'),
('6d555f19-3857-43e6-8f82-c618e0a58249', 'd26f02d1-3bed-4fba-9a2d-ade19b7d32dd', 40.0, 7, 46.55, '', 'WW_901O_STACK_ONEOFF_BESTAFRICA2_UNLIMITED_7D_FUP20', 'UNLI'),
('9afe1f74-6474-4d99-9651-0e1869be9b72', 'd26f02d1-3bed-4fba-9a2d-ade19b7d32dd', 120.0, 30, 122.55, '', 'WW_901O_STACK_ONEOFF_BESTAFRICA2_UNLIMITED_30D_FUP60', 'UNLI'),

-- Afrique du Sud

('930a7692-d4fd-4554-8aff-b3cfa949f623', 'a2b93439-736b-4646-8d26-a8b8630c4616', 1.0, 30, 5.7, '', 'WW_901O_STACK_ONEOFF_ZAF_1GB_30D', 'Go'),
('6dcd1d39-b21c-400a-bd97-34b649b76240', 'a2b93439-736b-4646-8d26-a8b8630c4616', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_ZAF_3GB_15D', 'Go'),
('78fb2286-52b8-4a22-bc0e-3e5323b67c78', 'a2b93439-736b-4646-8d26-a8b8630c4616', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_ZAF_10GB_7D', 'Go'),
('76744bec-7ead-4b76-bb50-1d6f89293b3c', 'a2b93439-736b-4646-8d26-a8b8630c4616', 10.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_ZAF_10GB_30D', 'Go'),
('4d003949-301b-454b-a14a-d5efc04450df', 'a2b93439-736b-4646-8d26-a8b8630c4616', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_ZAF_25GB_30D', 'Go'),
('cfa68c13-5eb4-4afe-a32b-989786e2a0b8', 'a2b93439-736b-4646-8d26-a8b8630c4616', 40.0, 7, 34.2, '', 'WW_901O_STACK_ONEOFF_ZAF_UNLIMITED_7D_FUP20', 'UNLI'),
('9ebff454-fb9d-40d0-b108-8711778310d5', 'a2b93439-736b-4646-8d26-a8b8630c4616', 50.0, 30, 52.25, '', 'WW_901O_STACK_ONEOFF_ZAF_50GB_30D', 'Go'),
('78235a95-1515-405c-90c7-c32832320baa', 'a2b93439-736b-4646-8d26-a8b8630c4616', 60.0, 15, 65.55, '', 'WW_901O_STACK_ONEOFF_ZAF_UNLIMITED_15D_FUP30', 'UNLI'),
('8a288737-a62b-47be-9dc2-09dc476226b9', 'a2b93439-736b-4646-8d26-a8b8630c4616', 120.0, 30, 83.6, '', 'WW_901O_STACK_ONEOFF_ZAF_UNLIMITED_30D_FUP60', 'UNLI'),

-- Albanie

('ae714b22-3eb2-44ee-a93c-f830f6fcae27', '6618653a-8531-4a48-bc18-66f6783ccdf6', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_ALBANIA_1GB_7D', 'Go'),
('bbc577b0-f04a-4ea5-b445-2cb59a220334', '6618653a-8531-4a48-bc18-66f6783ccdf6', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_ALBANIA_3GB_15D', 'Go'),
('37cbe908-545e-4f7b-b096-bc2eaf252fca', '6618653a-8531-4a48-bc18-66f6783ccdf6', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_ALBANIA_10GB_7D', 'Go'),
('20d65848-ff55-4195-950e-91fbbd15623a', '6618653a-8531-4a48-bc18-66f6783ccdf6', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_ALBANIA_10GB_30D', 'Go'),
('025620f9-6094-4a1d-b722-1b7ad835708c', '6618653a-8531-4a48-bc18-66f6783ccdf6', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_ALBANIA_UNLIMITED_7D_FUP20', 'UNLI'),
('82bb2b2b-be1b-4d54-8199-fc92f17bfadf', '6618653a-8531-4a48-bc18-66f6783ccdf6', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_ALBANIA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Algérie

('755917a5-da89-4b01-80c6-a97171fe64ab', 'ec705aa3-7a3c-4917-b9da-60dca7a9f593', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_ALGERIA_1GB_7D', 'Go'),
('dd5f3021-efc0-4990-a743-094bb35d9e0f', 'ec705aa3-7a3c-4917-b9da-60dca7a9f593', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_ALGERIA_3GB_15D', 'Go'),
('74e0d823-f26d-438a-ae85-d9040be32173', 'ec705aa3-7a3c-4917-b9da-60dca7a9f593', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_ALGERIA_10GB_7D', 'Go'),
('bbe31705-ac11-49d0-a9e0-1a756318b532', 'ec705aa3-7a3c-4917-b9da-60dca7a9f593', 10.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_ALGERIA_10GB_30D', 'Go'),

-- Allemagne

('f6254a88-7de9-4f86-a12a-f249b18554ba', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 3.0, 15, 6.65, '', 'WW_901O_STACK_ONEOFF_GERMANY_3GB_15D', 'Go'),
('99e6d963-79db-4678-88fc-6d5913742f63', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_GERMANY_10GB_7D', 'Go'),
('28a58086-18a2-43ee-89cf-1481bdbe7f4a', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 10.0, 30, 11.88, '', 'WW_901O_STACK_ONEOFF_GERMANY_10GB_30D', 'Go'),
('3b78b94d-367d-4ff9-8ab7-d27c481f18cb', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 14.0, 1, 7.6, '', 'WW_901O_STACK_ONEOFF_GERMANY_UNLIMITED_1D_FUP7', 'UNLI'),
('9fc88181-1ee5-49f4-98eb-a7b06c0898b1', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 25.0, 30, 23.75, '', 'WW_901O_STACK_ONEOFF_GERMANY_25GB_30D', 'Go'),
('6fce1d9a-faa7-4db5-a81b-9b731928e59e', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_GERMANY_UNLIMITED_7D_FUP20', 'UNLI'),
('a6bd0a68-f954-4e78-9c71-8339120294bf', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 50.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_GERMANY_50GB_30D', 'Go'),
('8de6d4e1-37b6-4e19-9a81-48026468bd2a', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 60.0, 15, 42.75, '', 'WW_901O_STACK_ONEOFF_GERMANY_UNLIMITED_15D_FUP30', 'UNLI'),
('d5f8d331-0604-4f2d-a85a-33df3a108007', 'aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 120.0, 30, 55.1, '', 'WW_901O_STACK_ONEOFF_GERMANY_UNLIMITED_30D_FUP60', 'UNLI'),

-- Amérique latine (étendue)

('c52d93cd-0ef4-4cdf-9951-30394ffb1055', 'daff99bc-4144-4769-8a07-a976a92313e3', 1.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_BESTLATAM2_1GB_30D', 'Go'),
('562b3c26-79fb-45ea-9fe9-c6a3ac67ccdd', 'daff99bc-4144-4769-8a07-a976a92313e3', 3.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_BESTLATAM2_3GB_30D', 'Go'),
('6fe929f1-a670-4fcb-9b59-f9cc1993bb06', 'daff99bc-4144-4769-8a07-a976a92313e3', 10.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_BESTLATAM2_10GB_30D', 'Go'),
('ca91ee9f-47e0-4a10-b03e-28033ef66fbf', 'daff99bc-4144-4769-8a07-a976a92313e3', 25.0, 30, 55.1, '', 'WW_901O_STACK_ONEOFF_BESTLATAM2_25GB_30D', 'Go'),
('5dd072a2-6787-4f4f-ae42-79d511059bb0', 'daff99bc-4144-4769-8a07-a976a92313e3', 40.0, 7, 41.8, '', 'WW_901O_STACK_ONEOFF_BESTLATAM2_UNLIMITED_7D_FUP20', 'UNLI'),
('78db340f-634c-424b-8e6a-a63baacae78a', 'daff99bc-4144-4769-8a07-a976a92313e3', 120.0, 30, 103.55, '', 'WW_901O_STACK_ONEOFF_BESTLATAM2_UNLIMITED_30D_FUP60', 'UNLI'),
('192b83c7-f02b-4e94-bdb7-bb4f3a064dbc', 'daff99bc-4144-4769-8a07-a976a92313e3', 500.0, 2, 4.75, '', 'WW_901O_STACK_ONEOFF_BESTLATAM2_500MB_2D', 'Mo'),

-- Andorre

('8439d3f8-34f3-4378-b736-2e8dad45b7b1', '05d44374-2606-4100-a79c-64c9699db094', 1.0, 7, 2.85, '', 'WW_901O_STACK_ONEOFF_ANDORRA_1GB_7D', 'Go'),
('99e62f90-d9d9-464e-bca0-c7ab575e433c', '05d44374-2606-4100-a79c-64c9699db094', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_ANDORRA_3GB_15D', 'Go'),
('bb4a744c-16ef-4888-b99b-fc16074494f8', '05d44374-2606-4100-a79c-64c9699db094', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_ANDORRA_10GB_7D', 'Go'),
('1b78ee55-5ffe-4172-bbf5-9c51cab0013e', '05d44374-2606-4100-a79c-64c9699db094', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_ANDORRA_10GB_30D', 'Go'),
('4ae4505c-aad9-4eaa-aa1d-8c429c0958ea', '05d44374-2606-4100-a79c-64c9699db094', 50.0, 7, 33.25, '', 'WW_901O_STACK_ONEOFF_ANDORRA_UNLIMITED_7D_FUP25', 'UNLI'),

-- Angola

('ec5baa98-abce-4ee3-8609-54386c9b0394', '88a6ae89-0dba-4b60-a600-495c1d7ca834', 1.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_ANGOLA_1GB_7D', 'Go'),

-- Arabie saoudite

('0cf7206e-e035-4dca-9345-50f0d0928842', '0d9a1def-7bb9-401d-8aa9-3cd84db2a141', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_KSA_1GB_7D', 'Go'),
('40270ffb-225e-43ec-b2a1-fa78e35b4fba', '0d9a1def-7bb9-401d-8aa9-3cd84db2a141', 3.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_KSA_3GB_30D', 'Go'),
('3ef417d0-6156-46d9-a5f0-c3891800413e', '0d9a1def-7bb9-401d-8aa9-3cd84db2a141', 10.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_KSA_10GB_7D', 'Go'),
('069aaefb-f748-48c1-9ee0-6bdcc43d100f', '0d9a1def-7bb9-401d-8aa9-3cd84db2a141', 10.0, 30, 25.65, '', 'WW_901O_STACK_ONEOFF_KSA_10GB_30D', 'Go'),

-- Argentine

('504c8ebb-dfa6-41bf-b9c2-b04a90848786', '9abae76a-9068-494e-b529-819fdaecbadd', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_ARG_1GB_7D', 'Go'),
('c1b1f478-465a-4ec3-9458-823914a3ef8b', '9abae76a-9068-494e-b529-819fdaecbadd', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_ARG_3GB_15D', 'Go'),
('498b3635-3f08-405e-89ab-c3e1b74ef183', '9abae76a-9068-494e-b529-819fdaecbadd', 10.0, 30, 21.85, '', 'WW_901O_STACK_ONEOFF_ARG_10GB_30D', 'Go'),
('0a2ea162-dc42-44cb-aafa-abb3e219a7bf', '9abae76a-9068-494e-b529-819fdaecbadd', 25.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_ARG_25GB_30D', 'Go'),
('61acbe92-c1be-49b9-9e20-1df50423adec', '9abae76a-9068-494e-b529-819fdaecbadd', 40.0, 7, 33.25, '', 'WW_901O_STACK_ONEOFF_ARG_UNLIMITED_7D_FUP20', 'UNLI'),
('183b909b-b06b-416b-acee-a8542c7d10a2', '9abae76a-9068-494e-b529-819fdaecbadd', 120.0, 30, 74.1, '', 'WW_901O_STACK_ONEOFF_ARG_UNLIMITED_30D_FUP60', 'UNLI'),

-- Arménie

('0a18e93a-331b-47bc-b953-8a0762a89570', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 1.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_ARMENIA_1GB_7D', 'Go'),
('dc8a4958-1c45-4844-b7f6-9bf8f016d717', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 1.0, 30, 14.25, '', 'WW_901O_STACK_ONEOFF_AMERICA_1GB_30D', 'Go'),
('e7412575-3c6e-419b-8fc0-7937ae00a6f8', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 3.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_AMERICA_3GB_15D', 'Go'),
('b6ae6d00-2b5d-45bb-beb4-e37583d52367', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 3.0, 15, 15.2, '', 'WW_901O_STACK_ONEOFF_ARMENIA_3GB_15D', 'Go'),
('58b1a931-ce98-48f0-832c-7948d912963e', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 10.0, 7, 24.7, '', 'WW_901O_STACK_ONEOFF_ARMENIA_10GB_7D', 'Go'),
('8953b6fe-e653-4bca-8181-3230e46c2772', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 10.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_ARMENIA_10GB_30D', 'Go'),
('eb839e57-d283-4ca6-8953-341144b1dd03', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 40.0, 7, 37.05, '', 'WW_901O_STACK_ONEOFF_ARMENIA_UNLIMITED_7D_FUP20', 'UNLI'),
('bf243289-1113-405d-a7a5-f4cd8ec91ddf', 'db0671c5-fee7-484c-962e-20e4ee9f5f43', 60.0, 15, 65.55, '', 'WW_901O_STACK_ONEOFF_ARMENIA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Aruba

('2144921d-d442-4e67-89ef-c6af80bf8ae5', 'fe125ecb-1101-4aec-ab06-038fc05e976c', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_ARUBA_1GB_7D', 'Go'),
('2d55731c-54da-42c3-b3f6-9d17a3d10d28', 'fe125ecb-1101-4aec-ab06-038fc05e976c', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_ARUBA_3GB_15D', 'Go'),
('f95e1e33-1160-46d5-9619-6398b5a78f0c', 'fe125ecb-1101-4aec-ab06-038fc05e976c', 10.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_ARUBA_10GB_7D', 'Go'),
('4132d6f4-507b-458e-8671-4f991caa7061', 'fe125ecb-1101-4aec-ab06-038fc05e976c', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_ARUBA_10GB_30D', 'Go'),

-- Asie

('66a91b90-2e97-4cc3-a61c-346f07d368df', 'd02a228e-6a2b-4b05-8570-fe7956f08628', 1.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_ASIA_1GB_30D', 'Go'),
('6b88f64a-1d12-4de3-917b-0b2b5db6704d', 'd02a228e-6a2b-4b05-8570-fe7956f08628', 3.0, 15, 18.05, '', 'WW_901O_STACK_ONEOFF_ASIA_3GB_15D', 'Go'),
('af9cb82b-291c-4125-ae49-cb0c0d9c9b5f', 'd02a228e-6a2b-4b05-8570-fe7956f08628', 10.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_ASIA_10GB_30D', 'Go'),
('63ad7169-e2b5-43ca-afde-5c75df68a10e', 'd02a228e-6a2b-4b05-8570-fe7956f08628', 500.0, 1, 1.9, '', 'WW_901O_STACK_ONEOFF_ASIA_500MB_1D', 'Mo'),

-- Asie (étendue)

('13d6d80f-2e83-4ba5-9f00-18065215f5fe', 'd5b45760-9074-4142-abe8-df4dafdf5391', 1.0, 1, 1.9, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_1GB_1D', 'Go'),
('104efa14-f43b-4d80-a56a-2532859dc837', 'd5b45760-9074-4142-abe8-df4dafdf5391', 1.0, 7, 2.38, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_1GB_7D', 'Go'),
('d3edc42f-887c-4af0-b3eb-4ccc4fdf093b', 'd5b45760-9074-4142-abe8-df4dafdf5391', 3.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_3GB_30D', 'Go'),
('cca8fea4-77a3-42d3-bb62-3381ff2eb508', 'd5b45760-9074-4142-abe8-df4dafdf5391', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_10GB_7D', 'Go'),
('b810f29a-7540-46f7-bce3-a63996f9abd5', 'd5b45760-9074-4142-abe8-df4dafdf5391', 10.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_10GB_30D', 'Go'),
('965d6d04-c635-4b00-9bec-f76f29a94535', 'd5b45760-9074-4142-abe8-df4dafdf5391', 25.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_25GB_30D', 'Go'),
('76b2f318-3717-4d51-a667-83e8cb747d61', 'd5b45760-9074-4142-abe8-df4dafdf5391', 50.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_UNLIMITED_7D_FUP25', 'UNLI'),
('37b59917-f871-41d8-bd65-919746582fe6', 'd5b45760-9074-4142-abe8-df4dafdf5391', 60.0, 15, 42.75, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_UNLIMITED_15D_FUP30', 'UNLI'),
('82772d5e-eb26-49a4-8b1e-21bb27cac96a', 'd5b45760-9074-4142-abe8-df4dafdf5391', 120.0, 30, 62.7, '', 'WW_901O_STACK_ONEOFF_BESTASIA3_UNLIMITED_30D_FUP60', 'UNLI'),

-- Australie

('a0c6b829-9db4-42ae-9f8f-c218b52f2ad8', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_AUS_1GB_7D', 'Go'),
('d180a801-342f-4748-abfa-7291d696aa63', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_AUS_3GB_15D', 'Go'),
('3dc0a2e2-ea80-43cf-9e67-af99d745a422', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_AUS_10GB_7D', 'Go'),
('f3809200-2ebe-4a53-8c38-96bc89f85bfa', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_AUS_10GB_30D', 'Go'),
('d992222f-d291-4c68-ad10-0e328d61a798', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 25.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_AUS_25GB_30D', 'Go'),
('2301cae1-243b-4407-8286-d4cc9241a08f', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_AUS_UNLIMITED_7D_FUP20', 'UNLI'),
('5e630711-c6da-4d17-b10f-f5aa564e2cf1', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 50.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_AUS_50GB_30D', 'Go'),
('758e97d0-cbbb-4fc2-9b81-e30998e9d7cc', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 60.0, 15, 42.75, '', 'WW_901O_STACK_ONEOFF_AUS_UNLIMITED_15D_FUP30', 'UNLI'),
('5940ba65-876a-484b-92af-8ad6ddc31687', 'a6ce2d02-3950-4de5-b945-b380ae095ea9', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_AUS_UNLIMITED_30D_FUP60', 'UNLI'),

-- Australie & NZ

('60702bb6-7a0a-4796-9253-d43701264943', 'ffe3fed4-6311-49eb-80c0-d24b2744c355', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_ANZ_1GB_7D', 'Go'),

-- Autriche

('9bd218b0-6989-4d65-ba0a-74241dc8ac09', '547e8d96-fb59-4cb0-a469-db74bf912703', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_AUSTRIA_3GB_15D', 'Go'),
('0d1b95bb-2dd5-424a-a344-185f274b1ca0', '547e8d96-fb59-4cb0-a469-db74bf912703', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_AUSTRIA_10GB_7D', 'Go'),
('7329e650-b367-476d-beb6-357f0b8fc58f', '547e8d96-fb59-4cb0-a469-db74bf912703', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_AUSTRIA_10GB_30D', 'Go'),
('b850429e-29f4-4044-8898-28dc8170c4c6', '547e8d96-fb59-4cb0-a469-db74bf912703', 25.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_AUSTRIA_25GB_30D', 'Go'),
('f9254e1a-39f4-47a8-9117-210b616d80f1', '547e8d96-fb59-4cb0-a469-db74bf912703', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_AUSTRIA_UNLIMITED_7D_FUP20', 'UNLI'),
('6c81cc5b-97d8-4d2f-9c03-fc5486bcd3ee', '547e8d96-fb59-4cb0-a469-db74bf912703', 50.0, 30, 34.2, '', 'WW_901O_STACK_ONEOFF_AUSTRIA_50GB_30D', 'Go'),
('9c451a85-d29c-4474-98f8-fd754d7b1531', '547e8d96-fb59-4cb0-a469-db74bf912703', 120.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_AUSTRIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Azerbaïdjan

('ea35fc6d-f351-4a29-a19a-99e102b9969c', '6f074ac8-c8a2-47e7-9966-7193db9fa1dc', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_AZE_1GB_7D', 'Go'),
('defe50f6-a15a-49c3-9a6c-48a76c417579', '6f074ac8-c8a2-47e7-9966-7193db9fa1dc', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_AZE_3GB_15D', 'Go'),

-- Bahamas

('5bc22a20-3c55-40d8-b527-d08d490df96a', '2c6b087d-239f-4d39-99d2-fe45c4f32672', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_BAHAMAS_1GB_7D', 'Go'),
('ede2fc31-0d46-488a-aba1-32cc34b4cbec', '2c6b087d-239f-4d39-99d2-fe45c4f32672', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_BAHAMAS_3GB_15D', 'Go'),
('11745485-19e5-4b99-be59-d83fec307ff0', '2c6b087d-239f-4d39-99d2-fe45c4f32672', 10.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_BAHAMAS_10GB_7D', 'Go'),
('0e903708-3118-4b7f-b17c-1e5789f87147', '2c6b087d-239f-4d39-99d2-fe45c4f32672', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_BAHAMAS_10GB_30D', 'Go'),

-- Bahreïn

('f52cb253-c500-4293-95f6-61f4da96bde9', '72776ef6-113d-4171-b418-d99377b38ab5', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_BAHRAIN_1GB_7D', 'Go'),
('1880c6db-3126-4a8b-91a4-a6b9bdb058fb', '72776ef6-113d-4171-b418-d99377b38ab5', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_BAHRAIN_3GB_15D', 'Go'),
('f2541b61-c47f-477d-b2a8-5e39eefb7b78', '72776ef6-113d-4171-b418-d99377b38ab5', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_BAHRAIN_10GB_7D', 'Go'),
('52dae417-77ef-4f14-82c6-71be53b572c6', '72776ef6-113d-4171-b418-d99377b38ab5', 10.0, 30, 19.95, '', 'WW_901O_STACK_ONEOFF_BAHRAIN_10GB_30D', 'Go'),
('45a8aba9-0b13-439e-b057-09f276468c54', '72776ef6-113d-4171-b418-d99377b38ab5', 25.0, 30, 34.2, '', 'WW_901O_STACK_ONEOFF_BAHRAIN_25GB_30D', 'Go'),
('da72dbae-dea5-4027-9471-56b912a320e3', '72776ef6-113d-4171-b418-d99377b38ab5', 40.0, 7, 35.15, '', 'WW_901O_STACK_ONEOFF_BAHRAIN_UNLIMITED_7D_FUP20', 'UNLI'),
('81b6041f-9b0c-409e-bfd5-a5ba8f8ec4fd', '72776ef6-113d-4171-b418-d99377b38ab5', 60.0, 15, 52.25, '', 'WW_901O_STACK_ONEOFF_BAHRAIN_UNLIMITED_15D_FUP30', 'UNLI'),

-- Belgique

('dbebe9a0-e77d-40bf-8bbf-2244205640ba', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 3.0, 30, 5.7, '', 'WW_901O_STACK_ONEOFF_BEL_3GB_30D', 'Go'),
('5e8fab32-9748-4001-8083-6c57a84af5a8', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_BEL_10GB_7D', 'Go'),
('ad722f2c-3c03-47b3-8b62-157f7593f020', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_BEL_10GB_30D', 'Go'),
('071a9443-1f44-48b0-b2a3-d0dfc50de91e', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 25.0, 30, 24.7, '', 'WW_901O_STACK_ONEOFF_BEL_25GB_30D', 'Go'),
('c1310f8c-c577-420c-b701-ffbe053563d3', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 40.0, 7, 24.7, '', 'WW_901O_STACK_ONEOFF_BEL_UNLIMITED_7D_FUP20', 'UNLI'),
('f6af0a11-c84a-4fb2-b6d4-19a19ed967a0', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 50.0, 30, 45.6, '', 'WW_901O_STACK_ONEOFF_BEL_50GB_30D', 'Go'),
('27b64e00-58b6-4b5f-b71c-85121df2987a', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_BEL_UNLIMITED_15D_FUP30', 'UNLI'),
('db65bf75-f9b0-4948-828a-ed39e2ba2a3b', 'a7448b2c-6d84-428e-bd9c-f6330b52f880', 120.0, 30, 53.2, '', 'WW_901O_STACK_ONEOFF_BEL_UNLIMITED_30D_FUP60', 'UNLI'),

-- Belize

('c1ebe57f-3573-46de-baf0-88fd0462b930', '300a0580-3eb9-4780-a42f-944459198313', 1.0, 7, 14.25, '', 'WW_901O_STACK_ONEOFF_BELIZE_1GB_7D', 'Go'),

-- Bhoutan

('4941f9a9-e34f-49ac-b8a4-6bdf675b2dd7', 'd15b65f7-df13-4df6-9e79-e0463791e071', 1.0, 7, 47.5, '', 'WW_901O_STACK_ONEOFF_BHUTAN_1GB_7D', 'Go'),

-- Biélorussie

('369a6e8b-2c9e-41ea-b130-45158e3b2d0f', '01cd0f2e-f4be-4904-b08c-8ae448ddc80e', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_BELARUS_1GB_7D', 'Go'),
('89c049ee-3231-4441-84d3-6f9db6f3996f', '01cd0f2e-f4be-4904-b08c-8ae448ddc80e', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_BELARUS_3GB_15D', 'Go'),
('dc8fea0c-8780-443f-98de-b75a59d4616a', '01cd0f2e-f4be-4904-b08c-8ae448ddc80e', 10.0, 7, 20.9, '', 'WW_901O_STACK_ONEOFF_BELARUS_10GB_7D', 'Go'),
('ab829d28-e929-49a3-b377-d65874826437', '01cd0f2e-f4be-4904-b08c-8ae448ddc80e', 10.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_BELARUS_10GB_30D', 'Go'),

-- Bolivie

('2edd3684-bc0f-422c-a570-d49c907b264d', '666cd467-8716-4b94-bc10-8bfae45d1ccb', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_BOL_1GB_7D', 'Go'),
('36103791-ec35-4a83-9dab-6398e97e1cb4', '666cd467-8716-4b94-bc10-8bfae45d1ccb', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_BOL_3GB_15D', 'Go'),
('72c6da25-2a45-4d73-a594-aad23d22016b', '666cd467-8716-4b94-bc10-8bfae45d1ccb', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_BOL_10GB_7D', 'Go'),
('9bb8841b-8f5f-4c4c-95b6-2c229768dd30', '666cd467-8716-4b94-bc10-8bfae45d1ccb', 10.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_BOL_10GB_30D', 'Go'),
('f8f0def6-3975-475e-9c7a-7760a438a195', '666cd467-8716-4b94-bc10-8bfae45d1ccb', 40.0, 7, 33.25, '', 'WW_901O_STACK_ONEOFF_BOL_UNLIMITED_7D_FUP20', 'UNLI'),
('4eb5e336-515c-4ec0-b53b-272caf63c87d', '666cd467-8716-4b94-bc10-8bfae45d1ccb', 60.0, 15, 56.05, '', 'WW_901O_STACK_ONEOFF_BOL_UNLIMITED_15D_FUP30', 'UNLI'),

-- Bosnie-Herzégovine

('c0f0f71f-a9dc-4717-ac32-49b8ff9d9e0f', '5ae1cd2e-6859-41cd-accb-ae5a1abe947c', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_BOSNIA_3GB_15D', 'Go'),
('5b1ff9a8-606a-4970-ab24-51e778e7b259', '5ae1cd2e-6859-41cd-accb-ae5a1abe947c', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_BOSNIA_10GB_7D', 'Go'),
('8ff9be6a-bfa5-4a71-8c76-5f152427809c', '5ae1cd2e-6859-41cd-accb-ae5a1abe947c', 10.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_BOSNIA_10GB_30D', 'Go'),
('4c5acd9e-9a87-4f5d-b686-f054382bc5fd', '5ae1cd2e-6859-41cd-accb-ae5a1abe947c', 40.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_BOSNIA_UNLIMITED_7D_FUP20', 'UNLI'),
('d92210c7-b174-4f94-a370-0d5dbbacd6ce', '5ae1cd2e-6859-41cd-accb-ae5a1abe947c', 120.0, 30, 64.6, '', 'WW_901O_STACK_ONEOFF_BOSNIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Botswana

('068f0a4a-a3a7-477d-82b7-69acb3e44466', '8affb6bf-f360-4bcb-b08c-086989eae7df', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_BOTSWANA_1GB_7D', 'Go'),
('9d38d963-4bba-4eee-8484-f7c7199c8ceb', '8affb6bf-f360-4bcb-b08c-086989eae7df', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_BOTSWANA_3GB_15D', 'Go'),
('856ee504-d672-403c-b3ac-5937f46d36d7', '8affb6bf-f360-4bcb-b08c-086989eae7df', 10.0, 30, 24.7, '', 'WW_901O_STACK_ONEOFF_BOTSWANA_10GB_30D', 'Go'),
('caa21218-4832-4cd4-a0ab-8f97aec507e7', '8affb6bf-f360-4bcb-b08c-086989eae7df', 25.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_BOTSWANA_25GB_30D', 'Go'),

-- Brunei

('ba85e742-9157-46c3-9527-923b2add3b64', 'd228e113-01ec-4173-a275-67e5dbd3f00a', 1.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_BRUNEI_1GB_7D', 'Go'),
('e51badf5-3da7-45b8-bcb4-315ac7843cc8', 'd228e113-01ec-4173-a275-67e5dbd3f00a', 3.0, 15, 15.2, '', 'WW_901O_STACK_ONEOFF_BRUNEI_3GB_15D', 'Go'),
('46ded56d-ed17-4b98-b1c4-b9097bf604eb', 'd228e113-01ec-4173-a275-67e5dbd3f00a', 10.0, 7, 33.25, '', 'WW_901O_STACK_ONEOFF_BRUNEI_10GB_7D', 'Go'),
('a7f6ed64-9adf-4d40-94e4-f151fa24fd69', 'd228e113-01ec-4173-a275-67e5dbd3f00a', 10.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_BRUNEI_10GB_30D', 'Go'),

-- Brésil

('4dbc8292-5a45-4032-99d9-c36a076e8771', '940caea8-d149-46ee-8afc-a5f45e5283ef', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_BRAZIL_1GB_7D', 'Go'),
('74567454-1161-42d8-8ddd-cc94a2f0939d', '940caea8-d149-46ee-8afc-a5f45e5283ef', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_BRAZIL_3GB_15D', 'Go'),
('cccf500d-5f76-4243-a687-1022201932bb', '940caea8-d149-46ee-8afc-a5f45e5283ef', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_BRAZIL_10GB_7D', 'Go'),
('e155b7e7-3add-4527-8947-44af88819be5', '940caea8-d149-46ee-8afc-a5f45e5283ef', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_BRAZIL_10GB_30D', 'Go'),
('2c798d17-9a7d-4611-b072-d8b299057f2e', '940caea8-d149-46ee-8afc-a5f45e5283ef', 25.0, 30, 42.75, '', 'WW_901O_STACK_ONEOFF_BRAZIL_25GB_30D', 'Go'),
('2e056886-25fd-4ac1-8733-9677d7edea68', '940caea8-d149-46ee-8afc-a5f45e5283ef', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_BRAZIL_UNLIMITED_7D_FUP20', 'UNLI'),
('67b5d5b2-87b7-489f-85a3-9bee22ec5f83', '940caea8-d149-46ee-8afc-a5f45e5283ef', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_BRAZIL_UNLIMITED_15D_FUP30', 'UNLI'),
('ccabb228-a53e-409f-9859-156622ee26ab', '940caea8-d149-46ee-8afc-a5f45e5283ef', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_BRAZIL_UNLIMITED_30D_FUP60', 'UNLI'),
('9a807762-644a-4143-a9dd-336e66998f93', '940caea8-d149-46ee-8afc-a5f45e5283ef', 500.0, 2, 3.8, '', 'WW_901O_STACK_ONEOFF_BRAZIL_500MB_2D', 'Mo'),

-- Bulgarie

('0fcb48a8-38eb-4783-8f11-d6f71786193c', '138a1373-d698-4310-bbc2-28a411aedb55', 3.0, 15, 3.8, '', 'WW_901O_STACK_ONEOFF_BULGARIA_3GB_15D', 'Go'),
('bdb5692f-6c99-49a7-9ea0-823a60345c70', '138a1373-d698-4310-bbc2-28a411aedb55', 10.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_BULGARIA_10GB_7D', 'Go'),
('d211c59f-a0bd-478c-b166-0246c298380e', '138a1373-d698-4310-bbc2-28a411aedb55', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_BULGARIA_10GB_30D', 'Go'),
('a34c2aaf-2e71-4725-8185-83e897e21e15', '138a1373-d698-4310-bbc2-28a411aedb55', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_BULGARIA_25GB_30D', 'Go'),
('e54fe6c4-fba4-4907-806a-ef9e847b4390', '138a1373-d698-4310-bbc2-28a411aedb55', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_BULGARIA_UNLIMITED_7D_FUP20', 'UNLI'),
('88303408-f6a4-4254-bcb5-46f5b67bd162', '138a1373-d698-4310-bbc2-28a411aedb55', 50.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_BULGARIA_50GB_30D', 'Go'),
('c8cd2221-9c87-47c5-8e9b-cf8294139bca', '138a1373-d698-4310-bbc2-28a411aedb55', 60.0, 15, 30.4, '', 'WW_901O_STACK_ONEOFF_BULGARIA_UNLIMITED_15D_FUP30', 'UNLI'),
('02a5178e-7e0a-47d2-bc05-6a9d9d98b165', '138a1373-d698-4310-bbc2-28a411aedb55', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_BULGARIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Burkina Faso

('e6628c67-e13a-4253-9531-71b17716d12f', '18d78ee2-4be5-4458-b15e-723e30e1f812', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_BURKINAFASO_1GB_7D', 'Go'),
('5aff99c6-762f-455f-88f2-52c428e93d46', '18d78ee2-4be5-4458-b15e-723e30e1f812', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_BURKINAFASO_3GB_15D', 'Go'),

-- Burundi

('3f6ae7f3-5cc4-4c95-8511-160f0c4e160f', '8100fc37-7d2d-47f2-92c5-12f9d0986e86', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_BURUNDI_1GB_7D', 'Go'),
('eff71ac2-6a74-43a6-831f-b205681804eb', '8100fc37-7d2d-47f2-92c5-12f9d0986e86', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_BURUNDI_3GB_15D', 'Go'),

-- Bénin

('176f865b-6bc1-4fe9-98b7-a7c4d7adcccc', '4bcc5461-d8b0-4088-b045-40270850cea0', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_BENIN_3GB_15D', 'Go'),
('57c58ac4-9904-4537-af82-00535badc628', '4bcc5461-d8b0-4088-b045-40270850cea0', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_BENIN_10GB_7D', 'Go'),
('4dd68b02-8a7e-4f15-b32f-d4c8ee3b5140', '4bcc5461-d8b0-4088-b045-40270850cea0', 10.0, 30, 25.65, '', 'WW_901O_STACK_ONEOFF_BENIN_10GB_30D', 'Go'),

-- Cambodge

('799010ce-b54b-4e87-a2b6-f54eda58f800', 'b3043532-ec5a-4c7b-86be-d7c14b401168', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_CAMBO_1GB_7D', 'Go'),
('4a965774-1ec3-47b6-af9d-d4ead42d7d2a', 'b3043532-ec5a-4c7b-86be-d7c14b401168', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_CAMBO_3GB_15D', 'Go'),
('78a7f1a0-ba10-473c-80b0-19de35410fc8', 'b3043532-ec5a-4c7b-86be-d7c14b401168', 10.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_CAMBO_10GB_7D', 'Go'),
('8b1c4d2b-0dc6-4fcb-8225-825aa36e2d6d', 'b3043532-ec5a-4c7b-86be-d7c14b401168', 10.0, 30, 19.0, '', 'WW_901O_STACK_ONEOFF_CAMBO_10GB_30D', 'Go'),
('862b5766-ed98-4ea1-a1c4-fee4d4f249df', 'b3043532-ec5a-4c7b-86be-d7c14b401168', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_CAMBO_25GB_30D', 'Go'),
('390145ef-cd88-402c-9f1b-0d0ddb8f7774', 'b3043532-ec5a-4c7b-86be-d7c14b401168', 120.0, 30, 64.6, '', 'WW_901O_STACK_ONEOFF_CAMBO_UNLIMITED_30D_FUP60', 'UNLI'),

-- Cameroun

('72382a09-a762-4412-ae68-1916767de415', '18e22b43-0f2b-4a3f-a4a5-64dc48802086', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_CAMEROON_3GB_15D', 'Go'),
('709cbf7d-3b8e-4875-9291-6182e9051563', '18e22b43-0f2b-4a3f-a4a5-64dc48802086', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_CAMEROON_10GB_7D', 'Go'),
('385690e9-20f5-4c10-9f11-ca3d06e67c77', '18e22b43-0f2b-4a3f-a4a5-64dc48802086', 10.0, 30, 25.65, '', 'WW_901O_STACK_ONEOFF_CAMEROON_10GB_30D', 'Go'),

-- Canada

('646583ba-50ce-43af-8e72-6e1378dff8e0', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_CAN_3GB_15D', 'Go'),
('2f540bd4-e5d1-4dfe-bcaf-357b39804340', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 10.0, 7, 14.25, '', 'WW_901O_STACK_ONEOFF_CAN_10GB_7D', 'Go'),
('741c964a-5ecf-47d9-906f-3533d1a71150', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_CAN_10GB_30D', 'Go'),
('332e6cd6-b4ab-4f47-a827-f6b8e2db93df', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_CAN_25GB_30D', 'Go'),
('d232722b-186b-48dd-83a9-d4c3edd9eac7', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 40.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_CAN_UNLIMITED_7D_FUP20', 'UNLI'),
('d84d5b54-e169-4540-a28d-372fef8b8d0c', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 50.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_CAN_50GB_30D', 'Go'),
('830adc46-95f9-44fd-ba1b-5fb8ba9054e5', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_CAN_UNLIMITED_15D_FUP30', 'UNLI'),
('e7049964-eea3-4e96-babe-858e75f3cd27', 'fb942b0c-f7ba-4a3b-a901-e568ad216991', 120.0, 30, 61.75, '', 'WW_901O_STACK_ONEOFF_CAN_UNLIMITED_30D_FUP60', 'UNLI'),

-- Cap-Vert

('c3b2271c-52f3-4c2c-9198-58da411d5796', 'bece1e79-beda-42a7-835e-fbf7d62cf22c', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_CAPEVERDE_1GB_7D', 'Go'),
('b26839e2-426e-41ab-b02c-fa0677ec76ac', 'bece1e79-beda-42a7-835e-fbf7d62cf22c', 3.0, 15, 34.2, '', 'WW_901O_STACK_ONEOFF_CAPEVERDE_3GB_15D', 'Go'),

-- Caraïbes (B)

('b8bbafec-faea-474a-be8b-6b79029bebf5', '3efa96a5-227e-41fd-85dc-39718ebf399f', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_CARIBBEAN2_1GB_7D', 'Go'),
('d0201ebe-dbfa-463d-b9cd-19e9441530b9', '3efa96a5-227e-41fd-85dc-39718ebf399f', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_CARIBBEAN2_3GB_15D', 'Go'),
('0935bf9b-e7b7-4652-a31a-df133757a591', '3efa96a5-227e-41fd-85dc-39718ebf399f', 10.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_CARIBBEAN2_10GB_7D', 'Go'),
('c8964e53-2343-44da-adff-7f68a53db364', '3efa96a5-227e-41fd-85dc-39718ebf399f', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_CARIBBEAN2_10GB_30D', 'Go'),
('e8f90374-786b-45f6-af22-66bd90b37eac', '3efa96a5-227e-41fd-85dc-39718ebf399f', 40.0, 7, 46.55, '', 'WW_901O_STACK_ONEOFF_CARIBBEAN2_UNLIMITED_7D_FUP20', 'UNLI'),
('78c780fa-7f4f-46ab-9e2a-ae5fae17cd15', '3efa96a5-227e-41fd-85dc-39718ebf399f', 60.0, 15, 83.6, '', 'WW_901O_STACK_ONEOFF_CARIBBEAN2_UNLIMITED_15D_FUP30', 'UNLI'),

-- Caraïbes (étendue)

('17c9416c-11af-4331-8625-f05f82e6cf04', 'e3dcd9c5-3512-454f-92b0-0637d5ced156', 3.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_BESTCARIBBEAN2_3GB_30D', 'Go'),
('47554cf5-6a7f-4541-a430-620df5bdbc47', 'e3dcd9c5-3512-454f-92b0-0637d5ced156', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_BESTCARIBBEAN2_10GB_30D', 'Go'),
('aa04fedd-d22e-4fd3-abb1-899944dbd2b2', 'e3dcd9c5-3512-454f-92b0-0637d5ced156', 40.0, 7, 25.65, '', 'WW_901O_STACK_ONEOFF_BESTCARIBBEAN2_UNLIMITED_7D_FUP20', 'UNLI'),
('647ce5db-ea2e-419a-8738-5001c74d5d93', 'e3dcd9c5-3512-454f-92b0-0637d5ced156', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_BESTCARIBBEAN2_UNLIMITED_30D_FUP60', 'UNLI'),

-- Chili

('f45a4187-7fb9-41b3-adb8-f92166e7496e', '9dc48c68-a75f-4cc4-a7d4-ce6ff01cbec9', 25.0, 30, 45.6, '', 'WW_901O_STACK_ONEOFF_CHILE_25GB_30D', 'Go'),
('25238e38-0660-4667-8332-277a9eae8bc0', '9dc48c68-a75f-4cc4-a7d4-ce6ff01cbec9', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_CHILE_UNLIMITED_7D_FUP20', 'UNLI'),
('91897b0f-bd8b-4e74-b8e8-aa5f30cb47cc', '9dc48c68-a75f-4cc4-a7d4-ce6ff01cbec9', 120.0, 30, 64.6, '', 'WW_901O_STACK_ONEOFF_CHILE_UNLIMITED_30D_FUP60', 'UNLI'),

-- Chine

('af319e65-23e7-4666-9274-241cd1c5befa', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_CHINA_1GB_7D', 'Go'),
('d6914596-0933-450c-bd25-2ab9cae47991', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 3.0, 30, 7.6, '', 'WW_901O_STACK_ONEOFF_CHINA_3GB_30D', 'Go'),
('12240317-9001-4635-9015-6b074dae413b', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_CHINA_10GB_7D', 'Go'),
('d352f654-60ec-4533-b04b-fa3185410b26', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 10.0, 30, 16.15, '', 'WW_901O_STACK_ONEOFF_CHINA_10GB_30D', 'Go'),
('0f49331e-4ba3-4fa3-b13e-74ab41393f01', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 25.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_CHINA_25GB_30D', 'Go'),
('57484d53-5b4c-4713-82e7-7e53c6fb65c9', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 40.0, 7, 24.7, '', 'WW_901O_STACK_ONEOFF_CHINA_UNLIMITED_7D_FUP20', 'UNLI'),
('fe4b3b6b-3bbd-4136-a853-2443fe1240dc', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_CHINA_UNLIMITED_15D_FUP30', 'UNLI'),
('5528dddc-be75-414d-ab01-c32be0576423', 'dc3a745e-a756-4fa1-9503-e8520c2d69d3', 120.0, 30, 74.1, '', 'WW_901O_STACK_ONEOFF_CHINA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Chypre

('cdd2b417-1a10-4932-b385-9707f0593f23', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_CYPRUS_3GB_15D', 'Go'),
('f5f6a4a5-924b-42ae-a0fb-946ecf11b5b4', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_CYPRUS_10GB_7D', 'Go'),
('d250d975-0474-4e26-a187-f38034a2131b', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_CYPRUS_10GB_30D', 'Go'),
('36a898ff-86f0-4e25-acdf-3a633c844ec1', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_CYPRUS_25GB_30D', 'Go'),
('5ff1f6e4-7751-4dc0-b051-ad82e04d52ca', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_CYPRUS_UNLIMITED_7D_FUP20', 'UNLI'),
('6ca4f2fc-373d-4967-a323-8abcfade8478', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 50.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_CYPRUS_50GB_30D', 'Go'),
('e76e53fb-a203-4742-97ef-c86c2e75921e', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_CYPRUS_UNLIMITED_15D_FUP30', 'UNLI'),
('59c1bb57-dfcf-4010-88fa-1d7dc97d19fc', 'e30e8612-39ab-40af-80c1-8bb389a7b874', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_CYPRUS_UNLIMITED_30D_FUP60', 'UNLI'),

-- Colombie

('d3df2211-2997-49ac-9f3b-01f2730096f6', '8eec889b-4487-4c46-b2ec-aa680bbdd721', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_COLOMBIA_1GB_7D', 'Go'),
('945b9e1d-0849-4217-bbca-f6cd2df9f365', '8eec889b-4487-4c46-b2ec-aa680bbdd721', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_COLOMBIA_3GB_15D', 'Go'),
('2b15be99-ee16-4212-bbef-a54a028f1ed9', '8eec889b-4487-4c46-b2ec-aa680bbdd721', 10.0, 7, 21.85, '', 'WW_901O_STACK_ONEOFF_COLOMBIA_10GB_7D', 'Go'),
('a3f08907-b864-4d12-82d2-083a07bcfa62', '8eec889b-4487-4c46-b2ec-aa680bbdd721', 10.0, 30, 23.75, '', 'WW_901O_STACK_ONEOFF_COLOMBIA_10GB_30D', 'Go'),
('18757e80-8818-4fdd-8c2b-c8b50aaf895d', '8eec889b-4487-4c46-b2ec-aa680bbdd721', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_COLOMBIA_UNLIMITED_7D_FUP20', 'UNLI'),
('e398e4e0-e1de-4619-8109-e59815493368', '8eec889b-4487-4c46-b2ec-aa680bbdd721', 60.0, 15, 56.05, '', 'WW_901O_STACK_ONEOFF_COLOMBIA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Comores

('96341a26-6050-46b3-aad9-a73b6c940e1e', 'b18078e3-5ea0-404b-b015-4b7e06196a03', 1.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_COMOROS_1GB_7D', 'Go'),
('f0f88626-b8a7-479e-b691-ce90f246a6a9', 'b18078e3-5ea0-404b-b015-4b7e06196a03', 3.0, 15, 15.2, '', 'WW_901O_STACK_ONEOFF_COMOROS_3GB_15D', 'Go'),

-- Congo

('2b4d7f70-6733-42b8-9a04-83a1a393947c', 'b7073514-059e-4f7f-8626-6a11215414ae', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_CONGO_10GB_7D', 'Go'),
('14614df4-3fb1-447f-8ab0-6a8ab7bf149a', 'b7073514-059e-4f7f-8626-6a11215414ae', 10.0, 30, 25.65, '', 'WW_901O_STACK_ONEOFF_CONGO_10GB_30D', 'Go'),

-- Corée du Sud

('01744cb1-29da-4a82-a2a0-b3fea82d7660', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_KOREA_1GB_7D', 'Go'),
('bb0240f1-8df9-4710-96fc-322d3337aefe', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 3.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_KOREA_3GB_7D', 'Go'),
('1cc49e14-37d2-4955-949f-2e5f4b6b6bd6', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 3.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_KOREA_3GB_30D', 'Go'),
('478dea6a-dcf7-4c7c-8c81-62af551516a7', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_KOREA_10GB_7D', 'Go'),
('40e422f2-ddb6-447a-a037-11a7c4d263bc', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_KOREA_10GB_30D', 'Go'),
('023a600c-b7fc-47be-a56e-c2e936517b24', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 25.0, 30, 23.75, '', 'WW_901O_STACK_ONEOFF_KOREA_25GB_30D', 'Go'),
('38526a60-edc6-456d-beb6-1d9446653c00', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 50.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_KOREA_UNLIMITED_7D_FUP25', 'UNLI'),
('0177ac45-ab8b-48e2-bee5-cf3d4b0d95f6', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 60.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_KOREA_UNLIMITED_15D_FUP30', 'UNLI'),
('7c32f021-1e1f-47be-bd05-e0df07d333d7', '0a01dc2b-374f-4deb-b5df-997410a54ee5', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_KOREA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Costa Rica

('084b596d-d0f0-4587-b145-bc6aea491ede', '1bf2b466-363b-4fa1-971f-040ac6da7850', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_COSTARICA_1GB_7D', 'Go'),
('42c44e25-d642-4569-9e93-a9f6daebc095', '1bf2b466-363b-4fa1-971f-040ac6da7850', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_COSTARICA_3GB_15D', 'Go'),
('c033fa0a-857a-4078-a295-a4001f1497a4', '1bf2b466-363b-4fa1-971f-040ac6da7850', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_COSTA-RICA_10GB_7D', 'Go'),
('727b9b69-c264-48dd-8aef-665d2f0ba0cf', '1bf2b466-363b-4fa1-971f-040ac6da7850', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_COSTA-RICA_10GB_30D', 'Go'),
('f91d5e05-97a1-43eb-90ec-54ae5791dc53', '1bf2b466-363b-4fa1-971f-040ac6da7850', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_COSTA-RICA_25GB_30D', 'Go'),
('acc4b7f5-b1a3-4c1b-8807-f605ed415573', '1bf2b466-363b-4fa1-971f-040ac6da7850', 40.0, 7, 24.7, '', 'WW_901O_STACK_ONEOFF_COSTA-RICA_UNLIMITED_7D_FUP20', 'UNLI'),
('126406c8-8f31-464f-a1e1-65caac508705', '1bf2b466-363b-4fa1-971f-040ac6da7850', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_COSTA-RICA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Croatie

('cbc50943-78a4-4ef7-9685-d929f48fbf42', '11df7336-ec98-4b37-b02c-29095ebb3d45', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_CROATIA_3GB_15D', 'Go'),
('8f03e33a-2132-475c-b93c-579a080bd56b', '11df7336-ec98-4b37-b02c-29095ebb3d45', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_CROATIA_10GB_7D', 'Go'),
('ca177188-ccc9-4614-8d10-eae84a75575d', '11df7336-ec98-4b37-b02c-29095ebb3d45', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_CROATIA_10GB_30D', 'Go'),
('9fa0fdf6-b465-496b-9b8b-d68314bbc74f', '11df7336-ec98-4b37-b02c-29095ebb3d45', 25.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_CROATIA_25GB_30D', 'Go'),
('3b31ef39-db2d-4c45-acd3-4b17d03f089f', '11df7336-ec98-4b37-b02c-29095ebb3d45', 40.0, 7, 19.0, '', 'WW_901O_STACK_ONEOFF_CROATIA_UNLIMITED_7D_FUP20', 'UNLI'),
('43841265-3796-4968-a076-329e7a06b3e3', '11df7336-ec98-4b37-b02c-29095ebb3d45', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_CROATIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Curaçao

('4eb7f00e-37a3-4c22-85c8-8a431323645b', '3a211984-8c5a-4b7b-83bf-0b9f6d039916', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_CUW_1GB_7D', 'Go'),
('77f30bbf-88eb-407d-a0c4-c4fba41208b3', '3a211984-8c5a-4b7b-83bf-0b9f6d039916', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_CUW_3GB_15D', 'Go'),
('99c78e26-4556-4f42-896e-5e78051fe068', '3a211984-8c5a-4b7b-83bf-0b9f6d039916', 10.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_CUW_10GB_7D', 'Go'),
('53209fc8-7776-4584-b37a-ef7a4fcad2de', '3a211984-8c5a-4b7b-83bf-0b9f6d039916', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_CUW_10GB_30D', 'Go'),

-- Danemark

('734470b3-2648-4d33-9510-c20d4474ccc5', '3014d626-9c7f-4803-8fe8-270f67da6833', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_DENMARK_3GB_15D', 'Go'),
('4384ad33-d80f-480e-a0c4-e13c28b2b6e8', '3014d626-9c7f-4803-8fe8-270f67da6833', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_DENMARK_10GB_7D', 'Go'),
('fd9fee5b-83ee-4a2d-ba2c-089eecbffe04', '3014d626-9c7f-4803-8fe8-270f67da6833', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_DENMARK_10GB_30D', 'Go'),
('da6f295f-456a-456b-b3bd-40918a4bfa5b', '3014d626-9c7f-4803-8fe8-270f67da6833', 25.0, 30, 19.95, '', 'WW_901O_STACK_ONEOFF_DENMARK_25GB_30D', 'Go'),
('a9f96501-e977-4a39-a334-ea7f1914c3bd', '3014d626-9c7f-4803-8fe8-270f67da6833', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_DENMARK_UNLIMITED_7D_FUP20', 'UNLI'),
('57d1f8ca-795f-4406-b2f2-f4477401e518', '3014d626-9c7f-4803-8fe8-270f67da6833', 50.0, 30, 35.15, '', 'WW_901O_STACK_ONEOFF_DENMARK_50GB_30D', 'Go'),
('3ad3cc9a-8a8d-4e89-96dc-f36cfb7bab36', '3014d626-9c7f-4803-8fe8-270f67da6833', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_DENMARK_UNLIMITED_15D_FUP30', 'UNLI'),
('f56f3973-2896-45a6-8a43-d8288d8e3906', '3014d626-9c7f-4803-8fe8-270f67da6833', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_DENMARK_UNLIMITED_30D_FUP60', 'UNLI'),

-- Djibouti

('41cda9ed-1bdf-4f03-b9d4-4f7e3bc3cd8c', 'f1ff57fd-3196-49ee-8de7-11d6f886cd5f', 1.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_DJIBOUTI_1GB_7D', 'Go'),
('a1556e76-57fc-46a9-a8ab-b63ebb5c8596', 'f1ff57fd-3196-49ee-8de7-11d6f886cd5f', 3.0, 15, 41.8, '', 'WW_901O_STACK_ONEOFF_DJIBOUTI_3GB_15D', 'Go'),
('94552951-93c9-472a-abbe-fd1ff489c8cf', 'f1ff57fd-3196-49ee-8de7-11d6f886cd5f', 10.0, 30, 93.1, '', 'WW_901O_STACK_ONEOFF_DJIBOUTI_10GB_30D', 'Go'),

-- El Salvador

('29987f90-80f5-46c6-bf59-4f260f0d52d7', 'bfef0194-d761-4587-9229-45771ff85965', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_SLV_3GB_15D', 'Go'),
('f2a8755f-efa1-44eb-bddb-4e90275129b5', 'bfef0194-d761-4587-9229-45771ff85965', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_SLV_10GB_7D', 'Go'),
('33314d8b-fb07-4a2a-91dc-b5989dbe63a8', 'bfef0194-d761-4587-9229-45771ff85965', 10.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_SLV_10GB_30D', 'Go'),
('f170bba9-6742-4cc2-9652-5ff886cbd205', 'bfef0194-d761-4587-9229-45771ff85965', 40.0, 7, 33.25, '', 'WW_901O_STACK_ONEOFF_SLV_UNLIMITED_7D_FUP20', 'UNLI'),
('97f99922-e4ee-4868-b040-eb3201f5d8ae', 'bfef0194-d761-4587-9229-45771ff85965', 60.0, 15, 56.05, '', 'WW_901O_STACK_ONEOFF_SLV_UNLIMITED_15D_FUP30', 'UNLI'),

-- Espagne

('3dfdb16d-c91d-4e85-83bb-771b2b3a9161', '867d5991-013b-4922-a9e5-f00aae98b9cd', 3.0, 30, 4.75, '', 'WW_901O_STACK_ONEOFF_ESP_3GB_30D', 'Go'),
('5a40e583-14f7-44ee-a862-c0e36210361f', '867d5991-013b-4922-a9e5-f00aae98b9cd', 10.0, 8, 8.55, '', 'WW_901O_STACK_ONEOFF_ESP_10GB_8D', 'Go'),
('7af8faea-bb90-4b87-952b-7221c66f5f96', '867d5991-013b-4922-a9e5-f00aae98b9cd', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_ESP_10GB_30D', 'Go'),
('8c039ba6-3b02-4023-8c64-8006b5d37007', '867d5991-013b-4922-a9e5-f00aae98b9cd', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_ESP_25GB_30D', 'Go'),
('7756925d-c59e-4b3c-a67c-7e27b1e9c3d5', '867d5991-013b-4922-a9e5-f00aae98b9cd', 50.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_ESP_50GB_30D', 'Go'),
('aa2e6b8e-7122-4258-aba7-8302c779b382', '867d5991-013b-4922-a9e5-f00aae98b9cd', 60.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_ESP_UNLIMITED_15D_FUP30', 'UNLI'),
('9add1c13-1f04-43fd-8f76-ff80325aef04', '867d5991-013b-4922-a9e5-f00aae98b9cd', 120.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_ESP_UNLIMITED_30D_FUP60', 'UNLI'),

-- Estonie

('4a08f067-abd7-4cab-8b89-121d1526f09b', '2531b471-becf-4b17-98a7-77e8b3ffcd75', 3.0, 15, 3.8, '', 'WW_901O_STACK_ONEOFF_ESTONIA_3GB_15D', 'Go'),
('dd04f14c-cecd-4b04-9862-3e09cf93d3d2', '2531b471-becf-4b17-98a7-77e8b3ffcd75', 10.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_ESTONIA_10GB_7D', 'Go'),
('8b41db34-31ce-456a-9c84-667bc9c0784a', '2531b471-becf-4b17-98a7-77e8b3ffcd75', 10.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_ESTONIA_10GB_30D', 'Go'),
('adf34d37-8550-4453-9b2b-9ee4d287b119', '2531b471-becf-4b17-98a7-77e8b3ffcd75', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_ESTONIA_UNLIMITED_7D_FUP20', 'UNLI'),
('14612c96-a250-4058-9834-76e11a31a63c', '2531b471-becf-4b17-98a7-77e8b3ffcd75', 50.0, 30, 34.2, '', 'WW_901O_STACK_ONEOFF_ESTONIA_50GB_30D', 'Go'),
('d6b9f3ac-511d-4750-a382-dc567b5f8bb3', '2531b471-becf-4b17-98a7-77e8b3ffcd75', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_ESTONIA_UNLIMITED_15D_FUP30', 'UNLI'),
('86e0f448-e3bf-4b3c-a90c-56f27070ace1', '2531b471-becf-4b17-98a7-77e8b3ffcd75', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_ESTONIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Eswatini

('7b89fd3b-4e66-49d8-883f-5be645401145', '85610ad8-2345-4089-81b2-23d08b4f5197', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_ESWATINI_10GB_7D', 'Go'),

-- Europe

('c29feb40-e61b-4e02-b9ab-122da6047653', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 3.0, 30, 6.65, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_3GB_30D', 'Go'),
('e85e601d-3f85-43c6-b1df-af0a5434e859', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_10GB_7D', 'Go'),
('36d5b5b3-b962-4e4b-ae76-312d0009e9ae', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 10.0, 30, 14.25, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_10GB_30D', 'Go'),
('d5f7ebe2-1c49-4977-bb8c-39f67dee0589', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_25GB_30D', 'Go'),
('cf3c150e-a773-4f34-aeef-cc289e06029f', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 50.0, 7, 21.85, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_UNLIMITED_7D_FUP25', 'UNLI'),
('3264dbb9-299b-4f33-a11e-363f3abf5839', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 50.0, 30, 51.3, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_50GB_30D', 'Go'),
('5e8f6f22-d5e1-4bdc-955b-c07c0a74ca6c', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 60.0, 15, 36.1, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_UNLIMITED_15D_FUP30', 'UNLI'),
('279e2447-9ef9-406e-aaa9-425b800b3e17', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 120.0, 30, 58.9, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_UNLIMITED_30D_FUP60', 'UNLI'),
('950ef290-ea07-4a2d-b184-d6ba0c12c816', 'e746daaf-52d0-4e9c-8b18-d97506fea34b', 500.0, 2, 1.9, '', 'WW_901O_STACK_ONEOFF_EU28PLUS_500MB_2D', 'Mo'),

-- Europe étendue

('6cd2f877-340c-4502-9702-f1b71d4cafdc', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 1.0, 30, 7.6, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_1GB_30D', 'Go'),
('e77a80c2-7578-453c-8007-f9758d67721e', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 3.0, 15, 15.2, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_3GB_15D', 'Go'),
('a6365570-aaa5-498f-8dc3-6400d085b730', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 3.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_3GB_30D', 'Go'),
('71e61014-e4b5-4a35-8f12-d49475a70075', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 10.0, 7, 30.4, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_10GB_7D', 'Go'),
('3c978f47-1b71-4a91-a215-c366f35697e1', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 10.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_10GB_30D', 'Go'),
('b922f565-214b-4721-8d36-e3b293b24ee6', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 25.0, 30, 52.25, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_25GB_30D', 'Go'),
('e8b96298-c510-49c1-a722-6a93b6453e11', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 40.0, 7, 46.55, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_UNLIMITED_7D_FUP20', 'UNLI'),
('ba7c6aba-d692-4565-b1cf-515f42afb5d3', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 60.0, 15, 56.05, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_UNLIMITED_15D_FUP30', 'UNLI'),
('726c75dd-7652-4e6b-b82e-a3b7446b4692', '47bd11e5-2c92-4c8d-b53e-294b128ebac7', 120.0, 30, 73.15, '', 'WW_901O_STACK_ONEOFF_EU_EXTENDED_UNLIMITED_30D_FUP60', 'UNLI'),

-- Fidji

('eccd5910-fb5f-45cc-ab62-86539622a183', '4643c960-c4df-413e-8eb1-28795ebc13f2', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_FIJI_1GB_7D', 'Go'),
('540c2828-65ca-4995-82a4-a02660979508', '4643c960-c4df-413e-8eb1-28795ebc13f2', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_FIJI_3GB_15D', 'Go'),

-- Finlande

('ebe5696b-fc3d-469f-ae07-3dc1422342be', '0a06379a-dba0-4082-872e-40645e1c0393', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_FINLAND_3GB_15D', 'Go'),
('38d30a50-86ee-459b-89cf-0dcccc5c6bb3', '0a06379a-dba0-4082-872e-40645e1c0393', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_FINLAND_10GB_7D', 'Go'),
('d089f1ca-5b4c-47fd-923f-e4ea81cbf41a', '0a06379a-dba0-4082-872e-40645e1c0393', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_FINLAND_10GB_30D', 'Go'),
('29c9d470-9ba5-4c58-9168-184835173b37', '0a06379a-dba0-4082-872e-40645e1c0393', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_FINLAND_UNLIMITED_7D_FUP20', 'UNLI'),
('0e7d003d-64c0-404a-9598-d1ae8a975adb', '0a06379a-dba0-4082-872e-40645e1c0393', 50.0, 30, 35.15, '', 'WW_901O_STACK_ONEOFF_FINLAND_50GB_30D', 'Go'),
('93684256-51df-4363-b947-fa439db58bc3', '0a06379a-dba0-4082-872e-40645e1c0393', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_FINLAND_UNLIMITED_15D_FUP30', 'UNLI'),
('9da60ea7-49e5-469b-bc11-36140e9bf08a', '0a06379a-dba0-4082-872e-40645e1c0393', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_FINLAND_UNLIMITED_30D_FUP60', 'UNLI'),

-- France

('36fec956-3486-4bbf-bb6a-77bfb801b20f', '996f27cf-e96a-42fd-8795-d92d46138607', 3.0, 30, 3.8, '', 'WW_901O_STACK_ONEOFF_FRA_3GB_30D', 'Go'),
('439e9c1f-f365-466a-9848-4513476dc887', '996f27cf-e96a-42fd-8795-d92d46138607', 10.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_FRA_10GB_7D', 'Go'),
('ee5a2629-2740-404e-a28f-efdf87c2cade', '996f27cf-e96a-42fd-8795-d92d46138607', 10.0, 30, 9.5, '', 'WW_901O_STACK_ONEOFF_FRA_10GB_30D', 'Go'),
('e860ce7a-9100-43cf-8034-57975fb79d5e', '996f27cf-e96a-42fd-8795-d92d46138607', 14.0, 1, 5.7, '', 'WW_901O_STACK_ONEOFF_FRANCE_UNLIMITED_1D_FUP7', 'UNLI'),
('73aacfdc-4be1-4b6b-aa23-0fba6a8fa014', '996f27cf-e96a-42fd-8795-d92d46138607', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_FRA_25GB_30D', 'Go'),
('69e4a46b-2883-45fc-a328-a2a582902571', '996f27cf-e96a-42fd-8795-d92d46138607', 50.0, 7, 19.0, '', 'WW_901O_STACK_ONEOFF_FRA_UNLIMITED_7D_FUP25', 'UNLI'),
('7778b151-3c0f-4893-aa8c-478b5a55121a', '996f27cf-e96a-42fd-8795-d92d46138607', 50.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_FRA_50GB_30D', 'Go'),
('6d14319f-7bf8-45ad-a356-02756df900bd', '996f27cf-e96a-42fd-8795-d92d46138607', 60.0, 15, 23.75, '', 'WW_901O_STACK_ONEOFF_FRA_UNLIMITED_15D_FUP30', 'UNLI'),
('c5c5cb89-29d9-419c-9885-c86337f93714', '996f27cf-e96a-42fd-8795-d92d46138607', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_FRA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Gabon

('ab8554a4-59f2-4571-bcf1-a0115403728d', '622f5c1c-542b-4d4b-8044-aaa9d6260463', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_GABON_1GB_7D', 'Go'),
('1cd1acad-c94f-46a7-9cdb-66144eb5fd40', '622f5c1c-542b-4d4b-8044-aaa9d6260463', 3.0, 15, 17.1, '', 'WW_901O_STACK_ONEOFF_GABON_3GB_15D', 'Go'),

-- Ghana

('fd94d783-a147-4aa6-98a6-2c8cee95f8d5', '73fa0649-807d-4962-8ebb-0a67c70f06b6', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_GHANA_1GB_7D', 'Go'),
('2b9a0123-5fe1-4b5d-8592-f661327a5ccd', '73fa0649-807d-4962-8ebb-0a67c70f06b6', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_GHANA_3GB_15D', 'Go'),

-- Gibraltar

('b366dd40-05ce-4892-bd2a-2dcac02d051d', '3c87a8ac-01d1-4d0a-80e2-a869c56deb95', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_GIBRALTAR_1GB_7D', 'Go'),
('0451eb1d-18a0-4d2b-a849-8d16bef6c07f', '3c87a8ac-01d1-4d0a-80e2-a869c56deb95', 3.0, 15, 17.1, '', 'WW_901O_STACK_ONEOFF_GIBRALTAR_3GB_15D', 'Go'),

-- Groenland

('ebecfe33-1062-4b29-aa76-e82cfee38e53', 'd4535f19-cff0-4456-a4e8-4218275df8e5', 1.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_GROENLAND_1GB_7D', 'Go'),
('fb4ab176-cb23-4e8f-9e07-2615a58bf4b5', 'd4535f19-cff0-4456-a4e8-4218275df8e5', 3.0, 15, 22.8, '', 'WW_901O_STACK_ONEOFF_GROENLAND_3GB_15D', 'Go'),
('007d24a5-97f5-49b3-93f7-665b3a2a2fbf', 'd4535f19-cff0-4456-a4e8-4218275df8e5', 10.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_GROENLAND_10GB_30D', 'Go'),

-- Grèce

('eada8f65-fa23-4bdc-8b16-ae899e2615ec', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 3.0, 30, 5.7, '', 'WW_901O_STACK_ONEOFF_GREECE_3GB_30D', 'Go'),
('892cd6cc-cdc8-4f0c-b500-1ff2fc7a5421', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_GREECE_10GB_7D', 'Go'),
('5de183eb-29ba-4c74-b492-ec985e8c0701', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_GREECE_10GB_30D', 'Go'),
('7595240c-59aa-4f5a-899e-97838b5b632c', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 25.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_GREECE_25GB_30D', 'Go'),
('26ed573d-8cf0-40d8-a71b-d7d94388b1e1', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_GREECE_UNLIMITED_7D_FUP20', 'UNLI'),
('38b93f74-4597-4dc4-b58a-0565aaab7c58', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 50.0, 30, 30.4, '', 'WW_901O_STACK_ONEOFF_GREECE_50GB_30D', 'Go'),
('1c20ebb8-8d0d-4f42-8718-2dc5df9df426', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_GREECE_UNLIMITED_15D_FUP30', 'UNLI'),
('4b4f27b5-6ee2-4de9-91d9-a067c672c807', '986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 120.0, 30, 52.25, '', 'WW_901O_STACK_ONEOFF_GREECE_UNLIMITED_30D_FUP60', 'UNLI'),

-- Guadeloupe

('1f67ccb9-6620-4497-bc0e-bdc8c136923d', 'd574eb3d-d1af-46de-867c-12b162d2cbf4', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_GUADELOUPE_1GB_7D', 'Go'),
('b0fae600-5e75-48eb-92c2-d08ccc34669a', 'd574eb3d-d1af-46de-867c-12b162d2cbf4', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_GUADELOUPE_3GB_15D', 'Go'),

-- Guam

('de300d55-9378-4e28-9eb4-a39d4b5122b4', '47560712-bb5b-43e6-b88c-55ae6fca9a0a', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_GUAM_1GB_7D', 'Go'),
('58d04b51-a52e-4bab-b9bc-5b5235047a0b', '47560712-bb5b-43e6-b88c-55ae6fca9a0a', 3.0, 15, 18.05, '', 'WW_901O_STACK_ONEOFF_GUAM_3GB_15D', 'Go'),
('390deeee-d290-4d97-9df8-1add4e3d9c93', '47560712-bb5b-43e6-b88c-55ae6fca9a0a', 10.0, 8, 37.05, '', 'WW_901O_STACK_ONEOFF_GUAM_10GB_8D', 'Go'),

-- Guatemala

('ed241fe0-93f9-4ef6-8865-cd020c17ca28', '1cf701c6-f7c4-4a73-889a-b66a60f80062', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_GTM_1GB_7D', 'Go'),
('84d40a4e-4c62-4916-8d7e-7bc2e24779a1', '1cf701c6-f7c4-4a73-889a-b66a60f80062', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_GTM_3GB_15D', 'Go'),
('ea60000e-c45b-4719-ad98-545e4357c58f', '1cf701c6-f7c4-4a73-889a-b66a60f80062', 10.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_GTM_10GB_30D', 'Go'),
('2b3da9b7-6141-4e6d-9dc1-1206a7cb14f2', '1cf701c6-f7c4-4a73-889a-b66a60f80062', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_GTM_25GB_30D', 'Go'),
('f9bac2e9-b329-41fc-a7d2-094d91ece266', '1cf701c6-f7c4-4a73-889a-b66a60f80062', 40.0, 7, 32.3, '', 'WW_901O_STACK_ONEOFF_GTM_UNLIMITED_7D_FUP20', 'UNLI'),
('e620206c-c4e7-4361-bb34-dc5f4304e1de', '1cf701c6-f7c4-4a73-889a-b66a60f80062', 60.0, 15, 52.25, '', 'WW_901O_STACK_ONEOFF_GTM_UNLIMITED_15D_FUP30', 'UNLI'),

-- Guinée

('b64e882c-2082-47f0-bfe4-57f368706e47', '01e0eff2-6e95-4955-b771-72ac99b68657', 1.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_GUINEA_1GB_7D', 'Go'),
('6540b77c-78b4-44c9-8d83-e615026a761b', '01e0eff2-6e95-4955-b771-72ac99b68657', 3.0, 15, 16.15, '', 'WW_901O_STACK_ONEOFF_GUINEA_3GB_15D', 'Go'),
('121f7e46-edbb-4bc1-82a2-e15040bdf183', '01e0eff2-6e95-4955-b771-72ac99b68657', 10.0, 7, 29.45, '', 'WW_901O_STACK_ONEOFF_GUINEA_10GB_7D', 'Go'),
('43483c14-c2e1-4b65-a9ad-50d80df6dc64', '01e0eff2-6e95-4955-b771-72ac99b68657', 10.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_GUINEA_10GB_30D', 'Go'),

-- Guinée-Bissau

('7682f499-25f0-4437-98d3-38f39d7f0c13', 'dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_GUINEA-BISSAU_1GB_7D', 'Go'),
('5db977a2-c9ba-4814-adb5-d70572722c05', 'dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_GUINEA-BISSAU_3GB_15D', 'Go'),
('a34709b4-0a18-43d5-9968-ce65bd81c5ee', 'dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', 10.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_GUINEA-BISSAU_10GB_30D', 'Go'),
('19031c61-9ab1-4db9-a0b5-ed37ca9b404e', 'dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', 25.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_GUINEA-BISSAU_25GB_30D', 'Go'),
('f6555764-20da-47ad-b4b1-8cbc3684c194', 'dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', 50.0, 7, 45.6, '', 'WW_901O_STACK_ONEOFF_GUINEA-BISSAU_UNLIMITED_7D_FUP20', 'UNLI'),

-- Guyana

('f0952a50-95e0-4348-81dd-884cf2a1986e', '9d7fa02d-1f49-4e1c-89b4-db961eed8142', 1.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_GUYANA_1GB_7D', 'Go'),
('7a7d5581-4cfb-4cff-ac35-811f23a0c052', '9d7fa02d-1f49-4e1c-89b4-db961eed8142', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_GUYANA_3GB_15D', 'Go'),
('069d9335-aad0-429c-9a36-086519764c10', '9d7fa02d-1f49-4e1c-89b4-db961eed8142', 10.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_GUYANA_10GB_7D', 'Go'),
('11e20369-f6cc-4fb0-86b6-b08b86992fcb', '9d7fa02d-1f49-4e1c-89b4-db961eed8142', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_GUYANA_10GB_30D', 'Go'),

-- Guyane française

('65b124e5-895f-40a7-8082-5cd58be9cfeb', '443e4e46-ed50-4816-9a10-4ff4990b643e', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_FRGUIANA_3GB_15D', 'Go'),

-- Géorgie

('fb8272b0-39cc-4132-9e04-6ab67c378e7e', '6f7d9aef-77cf-41e5-81ef-af251505a5f5', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_GEORGIA_1GB_7D', 'Go'),
('2814803b-191d-4cc1-ade4-11504153ab2e', '6f7d9aef-77cf-41e5-81ef-af251505a5f5', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_GEORGIA_3GB_15D', 'Go'),
('7fa0c7de-1317-43cb-87c0-ecc837f892ce', '6f7d9aef-77cf-41e5-81ef-af251505a5f5', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_GEORGIA_10GB_7D', 'Go'),
('b50ffee4-e4a0-4b72-b4cc-8017760a933a', '6f7d9aef-77cf-41e5-81ef-af251505a5f5', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_GEORGIA_10GB_30D', 'Go'),
('9ad3efc3-bfc2-4bad-b375-d53540848478', '6f7d9aef-77cf-41e5-81ef-af251505a5f5', 25.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_GEORGIA_25GB_30D', 'Go'),
('af5da2dc-ab78-4f71-96fc-740bc7ac0218', '6f7d9aef-77cf-41e5-81ef-af251505a5f5', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_GEORGIA_UNLIMITED_7D_FUP20', 'UNLI'),
('480f0fba-1eeb-4cc3-a164-df322377c1b9', '6f7d9aef-77cf-41e5-81ef-af251505a5f5', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_GEORGIA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Honduras

('1edd9be4-a7f7-4d3d-b626-ce158a9cad91', '1fa157a8-1c21-4495-a7ad-0e38c6e70769', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_HONDURAS_1GB_7D', 'Go'),
('a7e6f74d-aa27-4793-9713-fe7f1dbe18f4', '1fa157a8-1c21-4495-a7ad-0e38c6e70769', 3.0, 15, 9.5, '', 'WW_901O_STACK_ONEOFF_HONDURAS_3GB_15D', 'Go'),
('f1cd1247-6cb9-4425-80f9-0f14df35433b', '1fa157a8-1c21-4495-a7ad-0e38c6e70769', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_HONDURAS_10GB_7D', 'Go'),
('ec6c7419-79c9-4779-8773-3f91a4dfa867', '1fa157a8-1c21-4495-a7ad-0e38c6e70769', 10.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_HONDURAS_10GB_30D', 'Go'),
('c51481c0-a939-4ada-9945-9ee30951f248', '1fa157a8-1c21-4495-a7ad-0e38c6e70769', 40.0, 7, 32.3, '', 'WW_901O_STACK_ONEOFF_HONDURAS_UNLIMITED_7D_FUP20', 'UNLI'),
('0ee026c4-7e16-4d69-baf0-f53ec60d5022', '1fa157a8-1c21-4495-a7ad-0e38c6e70769', 60.0, 15, 56.05, '', 'WW_901O_STACK_ONEOFF_HONDURAS_UNLIMITED_15D_FUP30', 'UNLI'),

-- Hong Kong

('f5c8a61a-66ca-4567-a181-bf20d9f3aac7', 'b3378ac1-e71a-4172-b73a-fda355742af2', 3.0, 15, 6.65, '', 'WW_901O_STACK_ONEOFF_HKG_3GB_15D', 'Go'),
('2c7fc00e-5fa6-48c7-8af9-d3f287f7d57c', 'b3378ac1-e71a-4172-b73a-fda355742af2', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_HKG_10GB_7D', 'Go'),
('638cf32d-ff94-4d10-b246-405b1334f6f0', 'b3378ac1-e71a-4172-b73a-fda355742af2', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_HKG_10GB_30D', 'Go'),
('172d81c3-c214-4d73-8c4f-48598c672ab9', 'b3378ac1-e71a-4172-b73a-fda355742af2', 25.0, 30, 24.7, '', 'WW_901O_STACK_ONEOFF_HKG_25GB_30D', 'Go'),
('be0a82df-5340-488b-b197-1b6f3cf41344', 'b3378ac1-e71a-4172-b73a-fda355742af2', 40.0, 7, 21.85, '', 'WW_901O_STACK_ONEOFF_HKG_UNLIMITED_7D_FUP20', 'UNLI'),
('d2e22887-6991-438b-8883-685c6e89deba', 'b3378ac1-e71a-4172-b73a-fda355742af2', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_HKG_UNLIMITED_15D_FUP30', 'UNLI'),
('72296a95-60ec-493b-973c-814e00db3a94', 'b3378ac1-e71a-4172-b73a-fda355742af2', 120.0, 30, 52.25, '', 'WW_901O_STACK_ONEOFF_HKG_UNLIMITED_30D_FUP60', 'UNLI'),

-- Hongrie

('b93f79c9-6d9d-44c9-a6b2-cee9eecbf58d', '81125430-b0dd-4e2a-a90f-6169b00a5afd', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_HUNGARY_3GB_15D', 'Go'),
('b7352be9-181f-491f-bc93-cc7fbf1f2acc', '81125430-b0dd-4e2a-a90f-6169b00a5afd', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_HUNGARY_10GB_7D', 'Go'),
('67736658-bc5a-4f54-a837-fbb94f6e0b6c', '81125430-b0dd-4e2a-a90f-6169b00a5afd', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_HUNGARY_10GB_30D', 'Go'),
('b478aaf6-2b66-4499-a661-231afe3bd392', '81125430-b0dd-4e2a-a90f-6169b00a5afd', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_HUNGARY_UNLIMITED_7D_FUP20', 'UNLI'),
('4a9a8f44-480c-49f4-b42f-1aed57b9aac6', '81125430-b0dd-4e2a-a90f-6169b00a5afd', 50.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_HUNGARY_50GB_30D', 'Go'),
('dbec9557-020b-47d9-bb59-7f89da5be04b', '81125430-b0dd-4e2a-a90f-6169b00a5afd', 60.0, 15, 34.2, '', 'WW_901O_STACK_ONEOFF_HUNGARY_UNLIMITED_15D_FUP30', 'UNLI'),

-- Inde

('5782cf23-f998-4904-b85b-6c88cac87dc3', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 1.0, 7, 3.32, '', 'WW_901O_STACK_ONEOFF_IND_1GB_7D', 'Go'),
('fd470790-3566-47f2-b564-939397dee6dd', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 3.0, 30, 6.65, '', 'WW_901O_STACK_ONEOFF_IND_3GB_30D', 'Go'),
('f83cf81f-4476-4474-8a57-f83176e8ce49', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 10.0, 7, 12.35, '', 'WW_901O_STACK_ONEOFF_IND_10GB_7D', 'Go'),
('8ac2d7fa-ed8b-4190-904c-853c0afded60', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 10.0, 30, 14.25, '', 'WW_901O_STACK_ONEOFF_IND_10GB_30D', 'Go'),
('bee51d70-ee80-4ef0-bb9c-bec0426e1c77', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_INDIA_25GB_30D', 'Go'),
('ef023146-a3de-4a31-ab34-adacb5407c20', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 50.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_IND_UNLIMITED_7D_FUP25', 'UNLI'),
('f2937d07-6873-40ea-9073-3c4b46bb1ac4', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 50.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_IND_50GB_30D', 'Go'),
('537e8177-3584-43fd-bd73-c487cd220f05', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 60.0, 15, 43.7, '', 'WW_901O_STACK_ONEOFF_IND_UNLIMITED_15D_FUP30', 'UNLI'),
('e07305a7-6919-4034-b1e3-f5ced0b9e9a7', 'c704ae62-138d-46c2-b63e-e584fcaf102d', 120.0, 30, 64.6, '', 'WW_901O_STACK_ONEOFF_IND_UNLIMITED_30D_FUP60', 'UNLI'),

-- Indonésie

('9440b72e-2601-4e78-9f04-e5ebaae13033', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_INDONESIA_1GB_7D', 'Go'),
('2d257cab-c08f-4ec2-a64d-ba375145437e', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 3.0, 15, 6.65, '', 'WW_901O_STACK_ONEOFF_INDONESIA_3GB_15D', 'Go'),
('424eb7c9-8e67-4f7b-8de7-938296ac0352', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_INDONESIA_10GB_7D', 'Go'),
('940c8ba6-017c-4486-b012-d89c33fe8740', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_INDONESIA_10GB_30D', 'Go'),
('84273483-eea0-43ac-a07c-5f17896b6991', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 25.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_INDONESIA_25GB_30D', 'Go'),
('ac744be3-4c4f-4c52-876f-c6bacb0b0031', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_INDONESIA_UNLIMITED_7D_FUP20', 'UNLI'),
('bb7fd413-e467-4d79-873e-ed0ca0784e1b', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 60.0, 15, 38.0, '', 'WW_901O_STACK_ONEOFF_INDONESIA_UNLIMITED_15D_FUP30', 'UNLI'),
('54cb51db-e054-447d-b311-f27cd22ed084', '8d5b3c0b-7f30-4372-a8bb-08859f172450', 120.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_INDONESIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Irak

('6821f9b9-8297-4e44-bac8-45216cbb4df6', '673f0f6e-745b-411e-8900-f13f3275ea21', 3.0, 15, 10.45, '', 'WW_901O_STACK_ONEOFF_IRAQ_3GB_15D', 'Go'),
('50224900-c9e4-4c7a-a8e4-dd6d17c8eba1', '673f0f6e-745b-411e-8900-f13f3275ea21', 10.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_IRAQ_10GB_30D', 'Go'),

-- Irlande

('b03f8352-1ee3-49a9-9bac-ea1e76ebbe33', 'f197448d-ed17-4091-94d8-8a932c534aab', 3.0, 15, 6.65, '', 'WW_901O_STACK_ONEOFF_IRELAND_3GB_15D', 'Go'),
('800e58f5-22c3-424c-8274-939e5c13feae', 'f197448d-ed17-4091-94d8-8a932c534aab', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_IRELAND_10GB_7D', 'Go'),
('e5ed204d-853d-44ce-aa3b-fc406bd5b5d3', 'f197448d-ed17-4091-94d8-8a932c534aab', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_IRELAND_10GB_30D', 'Go'),
('e4833952-781b-4e0a-bdc1-462d943736b2', 'f197448d-ed17-4091-94d8-8a932c534aab', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_IRELAND_UNLIMITED_7D_FUP20', 'UNLI'),
('6f6927b0-b96d-47ef-b1e4-d800eff51453', 'f197448d-ed17-4091-94d8-8a932c534aab', 50.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_IRELAND_50GB_30D', 'Go'),
('d3ece54e-834b-4eb2-9522-44bcf74a0786', 'f197448d-ed17-4091-94d8-8a932c534aab', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_IRELAND_UNLIMITED_15D_FUP30', 'UNLI'),
('ba8938b1-60f4-4e57-9493-fe1d2aaa1139', 'f197448d-ed17-4091-94d8-8a932c534aab', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_IRELAND_UNLIMITED_30D_FUP60', 'UNLI'),

-- Islande

('33146399-8ca2-42ef-8ce8-e2bc2a0c928f', '6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_ICELAND_3GB_15D', 'Go'),
('0aeac8c0-eb2b-4e6b-9c0b-9345eef0a6be', '6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', 10.0, 7, 10.45, '', 'WW_901O_STACK_ONEOFF_ICELAND_10GB_7D', 'Go'),
('6acb18ab-c78e-45dd-a557-aeb7c75d623a', '6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_ICELAND_10GB_30D', 'Go'),
('c78e9d7e-a11e-406b-a6e8-4f2c417c2bcc', '6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_ICELAND_UNLIMITED_7D_FUP20', 'UNLI'),
('ea14cbb6-43ea-41a9-be87-47013172e1f0', '6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', 50.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_ICELAND_50GB_30D', 'Go'),

-- Israël

('efb6dfd0-f9e6-478d-b164-b072e76e7443', '30401a5f-c030-4d51-8210-f7abcb030f4e', 3.0, 30, 5.7, '', 'WW_901O_STACK_ONEOFF_ISRAEL_3GB_30D', 'Go'),
('4f00fb33-3c89-47b4-a428-d856582b0a2a', '30401a5f-c030-4d51-8210-f7abcb030f4e', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_ISRAEL_10GB_7D', 'Go'),
('6b8d3cc6-1f9d-4db2-abad-c8d4f9fd76c4', '30401a5f-c030-4d51-8210-f7abcb030f4e', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_ISRAEL_10GB_30D', 'Go'),
('41c31a89-6208-40fa-9f59-c2014521747e', '30401a5f-c030-4d51-8210-f7abcb030f4e', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_ISRAEL_UNLIMITED_7D_FUP20', 'UNLI'),
('9e56e8cb-690b-4829-8445-99ac5b4a64ea', '30401a5f-c030-4d51-8210-f7abcb030f4e', 50.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_ISRAEL_50GB_30D', 'Go'),
('97d5f093-d84d-499d-9e76-76fc8bd03e55', '30401a5f-c030-4d51-8210-f7abcb030f4e', 60.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_ISRAEL_UNLIMITED_15D_FUP30', 'UNLI'),
('bf1e83ab-691c-44a5-a767-91e536e30d65', '30401a5f-c030-4d51-8210-f7abcb030f4e', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_ISRAEL_UNLIMITED_30D_FUP60', 'UNLI'),

-- Italie

('f7b1323c-c119-4a9c-a477-3626af5280fe', '09815bac-d9a8-4f9f-9aaf-1f9928480480', 3.0, 30, 4.75, '', 'WW_901O_STACK_ONEOFF_ITA_3GB_30D', 'Go'),
('d1bf991e-5d56-42ab-811d-9c9c235f4e02', '09815bac-d9a8-4f9f-9aaf-1f9928480480', 10.0, 8, 8.55, '', 'WW_901O_STACK_ONEOFF_ITA_10GB_8D', 'Go'),
('b0879b97-4544-4443-8b36-bb865c064336', '09815bac-d9a8-4f9f-9aaf-1f9928480480', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_ITA_10GB_30D', 'Go'),
('b617f226-433b-44f2-8fdd-ee592b68f883', '09815bac-d9a8-4f9f-9aaf-1f9928480480', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_ITA_25GB_30D', 'Go'),
('c2424845-b8b8-4503-8cf3-616cf2c375cc', '09815bac-d9a8-4f9f-9aaf-1f9928480480', 50.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_ITA_50GB_30D', 'Go'),
('53ddd6a1-b2e7-432b-86d9-b1ec673b0d3b', '09815bac-d9a8-4f9f-9aaf-1f9928480480', 60.0, 15, 23.75, '', 'WW_901O_STACK_ONEOFF_ITA_UNLIMITED_15D_FUP30', 'UNLI'),
('c6ec4059-5dc0-4846-808f-7507f63cef84', '09815bac-d9a8-4f9f-9aaf-1f9928480480', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_ITA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Japon

('a08b7a97-221e-4d1b-a97c-05b0babd2ce3', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 1.0, 30, 3.8, '', 'WW_901O_STACK_ONEOFF_JPN_1GB_30D', 'Go'),
('5693e20b-e506-4ee7-971b-29f5606e99d8', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 3.0, 15, 7.12, '', 'WW_901O_STACK_ONEOFF_JPN_3GB_15D', 'Go'),
('36a1bb9c-0008-4136-87e6-8a048542c45f', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_JPN_10GB_7D', 'Go'),
('cd1d3864-2c2f-4a9a-9e0f-00c5f0fe9290', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 10.0, 30, 15.67, '', 'WW_901O_STACK_ONEOFF_JPN_10GB_30D', 'Go'),
('a893b40e-c7f1-4e89-abd9-a9a4bf053fd5', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 25.0, 30, 30.4, '', 'WW_901O_STACK_ONEOFF_JPN_25GB_30D', 'Go'),
('b9ca223c-e63b-499d-b856-d89d6244dca1', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 50.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_JPN_UNLIMITED_7D_FUP25', 'UNLI'),
('e3bb2ace-b314-46b1-b832-8c5014064e47', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 50.0, 30, 52.25, '', 'WW_901O_STACK_ONEOFF_JPN_50GB_30D', 'Go'),
('d1242b1c-c73b-4aec-b7b2-0339ef76dbb3', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_JPN_UNLIMITED_15D_FUP30', 'UNLI'),
('060a4387-3be8-4dc4-9251-1f47914f24a8', 'fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 120.0, 30, 61.75, '', 'WW_901O_STACK_ONEOFF_JPN_UNLIMITED_30D_FUP60', 'UNLI'),

-- Jersey, Guernesey & Île de Man

('1dd9e6f3-f4c8-4b85-9b18-b23bc0e771d2', 'e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_JEY-GGY-IMN_1GB_7D', 'Go'),
('4c42cb0d-2c93-46ac-acae-37ca1c7b7b94', 'e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 3.0, 15, 6.65, '', 'WW_901O_STACK_ONEOFF_JEY-GGY-IMN_3GB_15D', 'Go'),
('f39212d3-6691-4a4e-a773-f9983943d543', 'e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_JEY-GGY-IMN_10GB_7D', 'Go'),
('90dd3198-9f3b-48b4-a192-6b76248e8f94', 'e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_JEY-GGY-IMN_10GB_30D', 'Go'),
('e7bb97f5-1c28-4ef9-b70d-8f271343e6d4', 'e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 40.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_JEY-GGY-IMN2_UNLIMITED_7D_FUP20', 'UNLI'),
('58eefc1f-e5ea-4cc1-b41b-91596b73d51c', 'e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_JEY-GGY-IMN_UNLIMITED_15D_FUP30', 'UNLI'),

-- Jordanie

('c7046bfc-6261-46b5-a27c-0c7b6900d5c9', '0c2281a3-3b02-4875-9663-40847e1c5bf7', 1.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_JORDAN_1GB_7D', 'Go'),
('2222e4c7-0c05-49a0-ac74-1ddd9d7662d8', '0c2281a3-3b02-4875-9663-40847e1c5bf7', 3.0, 15, 15.2, '', 'WW_901O_STACK_ONEOFF_JORDAN_3GB_15D', 'Go'),
('9a63fcae-9888-4748-bfa5-79740f4715ff', '0c2281a3-3b02-4875-9663-40847e1c5bf7', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_JORDAN_10GB_30D', 'Go'),

-- Kazakhstan

('5e35a25f-92e7-4867-b2ed-3f078d6db32f', 'd82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_KAZ_1GB_7D', 'Go'),
('f16394f5-2aa1-4889-a785-2e4a65b30953', 'd82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_KAZ_3GB_15D', 'Go'),
('3f6d5f48-5cec-4877-9b7e-db82d73c9a46', 'd82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_KAZ_10GB_7D', 'Go'),
('7481b66a-8fcc-4e4d-90b2-d2d3a658638b', 'd82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_KAZ_10GB_30D', 'Go'),
('e195d9b2-1fd5-4412-bfd0-522fb0443a59', 'd82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 25.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_KAZ_25GB_30D', 'Go'),
('f086cfaf-19f7-433c-8789-8d8d9b52d7dc', 'd82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_KAZ_UNLIMITED_7D_FUP20', 'UNLI'),
('09edb5f2-b807-4c2a-be1b-c16d20ad983a', 'd82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_KAZ_UNLIMITED_15D_FUP30', 'UNLI'),

-- Kenya

('74a6643b-a3c7-4f6a-ba0a-a797c5cb19a0', '2af7024e-0176-42cb-b595-9cfcb49b3a06', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_KENYA_1GB_7D', 'Go'),
('ca1f0fa5-93c5-464a-936e-f8ce36ea568a', '2af7024e-0176-42cb-b595-9cfcb49b3a06', 3.0, 15, 18.05, '', 'WW_901O_STACK_ONEOFF_KENYA_3GB_15D', 'Go'),
('b3769bb6-5e2d-42b3-91db-e09545b139dc', '2af7024e-0176-42cb-b595-9cfcb49b3a06', 10.0, 7, 37.05, '', 'WW_901O_STACK_ONEOFF_KENYA_10GB_7D', 'Go'),
('0478feaa-25b6-4b55-9814-70f9222a1299', '2af7024e-0176-42cb-b595-9cfcb49b3a06', 10.0, 30, 39.9, '', 'WW_901O_STACK_ONEOFF_KENYA_10GB_30D', 'Go'),
('c470077a-f2dd-4d96-868e-bbc41af58236', '2af7024e-0176-42cb-b595-9cfcb49b3a06', 40.0, 7, 56.05, '', 'WW_901O_STACK_ONEOFF_KENYA_UNLIMITED_7D_FUP20', 'UNLI'),
('2d921bb6-579b-4dc7-a5ca-69047029e58c', '2af7024e-0176-42cb-b595-9cfcb49b3a06', 60.0, 15, 83.6, '', 'WW_901O_STACK_ONEOFF_KENYA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Kirghizistan

('10859e57-22c3-4165-997d-ba770b56672e', '601ef2d4-ce42-4620-b7f3-551ef4a910a6', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_KGZ_1GB_7D', 'Go'),
('6bb7e189-9883-4d5a-a9db-13d49ec82b48', '601ef2d4-ce42-4620-b7f3-551ef4a910a6', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_KGZ_3GB_15D', 'Go'),
('0b3c513a-8a32-478c-8355-29794a84f9c1', '601ef2d4-ce42-4620-b7f3-551ef4a910a6', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_KGZ_10GB_7D', 'Go'),
('dc450d53-be0a-4b39-9202-c2dca5a2bb84', '601ef2d4-ce42-4620-b7f3-551ef4a910a6', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_KGZ_10GB_30D', 'Go'),
('25811b84-73a6-4fdb-94ec-064fcdefff6e', '601ef2d4-ce42-4620-b7f3-551ef4a910a6', 25.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_KGZ_25GB_30D', 'Go'),
('82707c1d-c477-4bd8-8493-426601688dc4', '601ef2d4-ce42-4620-b7f3-551ef4a910a6', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_KGZ_UNLIMITED_7D_FUP20', 'UNLI'),
('16eba399-e803-41dd-8428-12c8de72bfbe', '601ef2d4-ce42-4620-b7f3-551ef4a910a6', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_KGZ_UNLIMITED_15D_FUP30', 'UNLI'),

-- Koweït

('2f6d8fed-8731-42b3-9a13-31287aa4fbc0', 'ff3bf3ce-7219-42db-89d7-43adbc1a263b', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_KUWAIT_1GB_7D', 'Go'),
('6d4dd030-1df4-4753-a5ce-123dfac54c76', 'ff3bf3ce-7219-42db-89d7-43adbc1a263b', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_KUWAIT_3GB_15D', 'Go'),
('50ff8dfc-4a8f-437a-931e-6396d237f50e', 'ff3bf3ce-7219-42db-89d7-43adbc1a263b', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_KUWAIT_10GB_7D', 'Go'),
('1f5d45a7-4caf-4c1a-af47-926f51785602', 'ff3bf3ce-7219-42db-89d7-43adbc1a263b', 10.0, 30, 25.65, '', 'WW_901O_STACK_ONEOFF_KUWAIT_10GB_30D', 'Go'),
('a27c1dbc-3390-4f07-ab3b-c862b759e4bb', 'ff3bf3ce-7219-42db-89d7-43adbc1a263b', 40.0, 7, 24.7, '', 'WW_901O_STACK_ONEOFF_KUWAIT_UNLIMITED_7D_FUP20', 'UNLI'),
('7f26c4f1-c274-4540-b83b-2530a0fbb23b', 'ff3bf3ce-7219-42db-89d7-43adbc1a263b', 60.0, 15, 42.75, '', 'WW_901O_STACK_ONEOFF_KUWAIT_UNLIMITED_15D_FUP30', 'UNLI'),

-- Lettonie

('0c94766b-620e-4dea-8158-93c1f9785a5e', 'fcff9806-45b3-471b-89ec-d4716f90d013', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_LATVIA_10GB_7D', 'Go'),
('cfa24429-7f70-40a9-b124-5aa95494f8ed', 'fcff9806-45b3-471b-89ec-d4716f90d013', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_LATVIA_10GB_30D', 'Go'),
('1f472220-4e5e-45f6-92b9-405fbacb6a72', 'fcff9806-45b3-471b-89ec-d4716f90d013', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_LATVIA_UNLIMITED_7D_FUP20', 'UNLI'),
('0af572a0-deeb-4ffa-922b-9cf9fc2017aa', 'fcff9806-45b3-471b-89ec-d4716f90d013', 50.0, 30, 30.4, '', 'WW_901O_STACK_ONEOFF_LATVIA_50GB_30D', 'Go'),
('79d9ac93-ae66-442c-bf65-e3b411af297f', 'fcff9806-45b3-471b-89ec-d4716f90d013', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_LATVIA_UNLIMITED_15D_FUP30', 'UNLI'),
('60d01ef2-b1fd-4543-9972-f264a53ae8a9', 'fcff9806-45b3-471b-89ec-d4716f90d013', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_LATVIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Lituanie

('68a8ca68-a02f-459a-a520-5b3310a1b0ed', '91fca936-4213-418b-9121-01faebcc45ef', 10.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_LITHUANIA_10GB_7D', 'Go'),
('f29fb070-2abe-4993-a08c-ecc2934c6f03', '91fca936-4213-418b-9121-01faebcc45ef', 10.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_LITHUANIA_10GB_30D', 'Go'),
('9ba5c148-af92-40da-8f3e-b767e5594d34', '91fca936-4213-418b-9121-01faebcc45ef', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_LITHUANIA_25GB_30D', 'Go'),
('b985fcc7-48b9-4c18-b437-dc7106be44ab', '91fca936-4213-418b-9121-01faebcc45ef', 40.0, 7, 14.25, '', 'WW_901O_STACK_ONEOFF_LITHUANIA_UNLIMITED_7D_FUP20', 'UNLI'),
('3389a636-ecd6-428f-9746-a25169309bc8', '91fca936-4213-418b-9121-01faebcc45ef', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_LITHUANIA_UNLIMITED_15D_FUP30', 'UNLI'),
('a4c20cd1-17a0-46f0-8dff-4dff8428a658', '91fca936-4213-418b-9121-01faebcc45ef', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_LITHUANIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Luxembourg

('be64e4cd-186a-454d-8fb2-458a725a5dfc', '5955df61-0197-4e53-85ff-ba92c3289ebc', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_LUXEMBOURG_3GB_15D', 'Go'),
('6e8ea168-4cfa-4003-936f-8edad1968fe9', '5955df61-0197-4e53-85ff-ba92c3289ebc', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_LUXEMBOURG_10GB_7D', 'Go'),

-- Macao

('e437fe8c-0031-4dbc-97d1-e5e393dd7e5d', 'fc9e9738-ece0-426b-99e9-af330604674f', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_MAC_3GB_15D', 'Go'),
('c489eac0-fccf-45a3-8d05-f45e9b834064', 'fc9e9738-ece0-426b-99e9-af330604674f', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_MAC_10GB_7D', 'Go'),
('ebf7379f-bfc4-4b49-a21d-72b914814fec', 'fc9e9738-ece0-426b-99e9-af330604674f', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_MAC_10GB_30D', 'Go'),
('6aaa9744-c988-4186-b653-0e1bc6a54437', 'fc9e9738-ece0-426b-99e9-af330604674f', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_MAC_25GB_30D', 'Go'),
('54fd24b1-944f-4ebf-87b0-582477b99d6a', 'fc9e9738-ece0-426b-99e9-af330604674f', 40.0, 7, 24.7, '', 'WW_901O_STACK_ONEOFF_MAC_UNLIMITED_7D_FUP20', 'UNLI'),
('c1820c36-9c33-4a91-9dce-31fc84e35a07', 'fc9e9738-ece0-426b-99e9-af330604674f', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_MAC_UNLIMITED_15D_FUP30', 'UNLI'),

-- Macédoine du Nord

('dcc1d2db-a8ef-4ce1-8dbf-2802bcf002eb', '0dee01ad-1df3-4ce9-b355-25bec805ec91', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_MACEDONIA_1GB_7D', 'Go'),
('d756752b-4ff2-43b6-ae43-b5ee622f3682', '0dee01ad-1df3-4ce9-b355-25bec805ec91', 3.0, 15, 17.1, '', 'WW_901O_STACK_ONEOFF_MACEDONIA_3GB_15D', 'Go'),

-- Madagascar

('a335e82b-b657-42c4-8ff9-034c8a438513', 'c36b3ba2-e433-4a4d-bceb-46171388bb28', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_MDG_1GB_7D', 'Go'),
('375c7bbe-5bb4-4442-b789-0afc3c814951', 'c36b3ba2-e433-4a4d-bceb-46171388bb28', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_MDG_3GB_15D', 'Go'),
('7e69da3a-d575-45a8-b282-fb5fc22eec38', 'c36b3ba2-e433-4a4d-bceb-46171388bb28', 10.0, 7, 24.7, '', 'WW_901O_STACK_ONEOFF_MDG_10GB_7D', 'Go'),
('4915ec21-bd1d-4730-8e19-d865b7d7515a', 'c36b3ba2-e433-4a4d-bceb-46171388bb28', 10.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_MDG_10GB_30D', 'Go'),

-- Malaisie

('a5de25bd-63e0-464b-a058-8f7527f1ef42', 'a44d6f2f-61cc-4a05-b984-568c02f6f111', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_MALAYSIA_3GB_15D', 'Go'),
('5c44ee7f-0126-4857-9acd-f65d9ef840c8', 'a44d6f2f-61cc-4a05-b984-568c02f6f111', 10.0, 7, 10.45, '', 'WW_901O_STACK_ONEOFF_MALAYSIA_10GB_7D', 'Go'),
('7a35a62e-9446-4b45-8196-695bf9aaeb2a', 'a44d6f2f-61cc-4a05-b984-568c02f6f111', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_MALAYSIA_10GB_30D', 'Go'),
('514a163b-1858-47fd-aafa-44310d40119d', 'a44d6f2f-61cc-4a05-b984-568c02f6f111', 25.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_MALAYSIA_25GB_30D', 'Go'),
('77c9dfa7-9f8f-4f29-a736-3ea9a425ada1', 'a44d6f2f-61cc-4a05-b984-568c02f6f111', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_MALAYSIA_UNLIMITED_7D_FUP20', 'UNLI'),
('5806d766-ba70-49a2-b0c1-2ca3fc6d6038', 'a44d6f2f-61cc-4a05-b984-568c02f6f111', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_MALAYSIA_UNLIMITED_15D_FUP30', 'UNLI'),
('46169ddb-7b8b-4f35-983d-fd2953cdbc8d', 'a44d6f2f-61cc-4a05-b984-568c02f6f111', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_MALAYSIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Malaisie & Singapour

('3aeff6cf-28e7-40e4-9966-f311873b7558', 'af3cfa07-0c05-45da-aa01-b0f8a54df2ed', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_MYS_SGP_1GB_7D', 'Go'),
('b7ef42e9-f54e-4d45-8941-e19b10a63b6b', 'af3cfa07-0c05-45da-aa01-b0f8a54df2ed', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_MYS_SGP_3GB_15D', 'Go'),
('75d9a0e1-e254-43d7-81ed-870d004f1e36', 'af3cfa07-0c05-45da-aa01-b0f8a54df2ed', 10.0, 30, 16.15, '', 'WW_901O_STACK_ONEOFF_MYS_SGP_10GB_30D', 'Go'),

-- Malawi

('317f9755-45c1-4614-b58d-e3cb7c3a7f45', 'c3e18708-3553-4175-9587-6e2281101020', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_MALAWI_1GB_7D', 'Go'),
('429b67b7-85de-4985-b87a-3bca3bcf8804', 'c3e18708-3553-4175-9587-6e2281101020', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_MALAWI_3GB_15D', 'Go'),

-- Mali

('87b200f8-c2ce-481e-aba7-999513f57361', '4c47c065-c066-4e24-ad4e-963da4de4be6', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_MALI_1GB_7D', 'Go'),
('c28891b3-134c-493a-ab12-7410579db2fe', '4c47c065-c066-4e24-ad4e-963da4de4be6', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_MALI_3GB_15D', 'Go'),
('78d48cc1-73d2-47fd-8f4f-27ce4af76d52', '4c47c065-c066-4e24-ad4e-963da4de4be6', 10.0, 7, 37.05, '', 'WW_901O_STACK_ONEOFF_MALI_10GB_7D', 'Go'),
('420becbc-139f-43b2-b9b4-583308539619', '4c47c065-c066-4e24-ad4e-963da4de4be6', 10.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_MALI_10GB_30D', 'Go'),

-- Malte

('50402a90-d643-4b92-a6d0-00aedbed61fb', '1ede8fa4-4262-4136-8ad7-2058de17a117', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_MALTA_3GB_15D', 'Go'),
('9d0d572e-dba2-4e6c-ab1b-7bff338fc953', '1ede8fa4-4262-4136-8ad7-2058de17a117', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_MALTA_10GB_7D', 'Go'),
('e182c795-65a0-4840-a4cc-7acf4337d029', '1ede8fa4-4262-4136-8ad7-2058de17a117', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_MALTA_10GB_30D', 'Go'),
('3e42cd29-2519-4468-b73a-878382a06c78', '1ede8fa4-4262-4136-8ad7-2058de17a117', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_MALTA_UNLIMITED_7D_FUP20', 'UNLI'),
('a64717b8-ec8d-4889-8986-08b5c401b109', '1ede8fa4-4262-4136-8ad7-2058de17a117', 50.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_MALTA_50GB_30D', 'Go'),
('bb55f43b-18a8-471c-826d-99216eb1f7f0', '1ede8fa4-4262-4136-8ad7-2058de17a117', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_MALTA_UNLIMITED_15D_FUP30', 'UNLI'),
('3eb4c3fc-eeee-4fa1-84a6-b939bd971040', '1ede8fa4-4262-4136-8ad7-2058de17a117', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_MALTA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Maroc

('eb534544-76d6-47f1-81fb-5df3fb46f80a', '20a7b210-b291-4913-8932-de05a4a17fd7', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_MOROCCO_1GB_7D', 'Go'),
('eaf6fdd5-87a7-470e-81bf-71cf5a8ef825', '20a7b210-b291-4913-8932-de05a4a17fd7', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_MOROCCO_3GB_15D', 'Go'),
('3d765db5-4910-4ee8-b5bf-25089fcbfca1', '20a7b210-b291-4913-8932-de05a4a17fd7', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_MOROCCO_10GB_7D', 'Go'),
('d67503bc-4357-4cac-9d28-8e3c4f0d9bad', '20a7b210-b291-4913-8932-de05a4a17fd7', 10.0, 30, 21.85, '', 'WW_901O_STACK_ONEOFF_MOROCCO_10GB_30D', 'Go'),
('3090ea2c-ba2f-43a1-8738-8c742e847d71', '20a7b210-b291-4913-8932-de05a4a17fd7', 25.0, 30, 42.75, '', 'WW_901O_STACK_ONEOFF_MOROCCO_25GB_30D', 'Go'),
('fad276f8-6c63-490d-be22-927ebf97b680', '20a7b210-b291-4913-8932-de05a4a17fd7', 50.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_MOROCCO_UNLIMITED_7D_FUP25', 'UNLI'),
('da19953d-da19-4e64-b8bd-69e8b919dda6', '20a7b210-b291-4913-8932-de05a4a17fd7', 60.0, 15, 42.75, '', 'WW_901O_STACK_ONEOFF_MOROCCO_UNLIMITED_15D_FUP30', 'UNLI'),
('5ce4f867-5026-4b66-af5b-231853cbae06', '20a7b210-b291-4913-8932-de05a4a17fd7', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_MOROCCO_UNLIMITED_30D_FUP60', 'UNLI'),

-- Martinique

('7e2ff748-fbfa-416e-a237-1eea7fb014be', '3e418e21-0282-4d16-9a75-da6874d50698', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_MARTINIQUE_1GB_7D', 'Go'),
('87e2f924-7610-49e9-b813-db1df05c095b', '3e418e21-0282-4d16-9a75-da6874d50698', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_MARTINIQUE_3GB_15D', 'Go'),

-- Maurice

('c4845449-e4f9-4387-b35d-e796f189edaf', '2dcc8be7-f717-4749-a4aa-170b2fa1e160', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_MAURITIUS_1GB_7D', 'Go'),
('30a0a75c-63bc-462d-af0d-836bef996670', '2dcc8be7-f717-4749-a4aa-170b2fa1e160', 3.0, 15, 9.5, '', 'WW_901O_STACK_ONEOFF_MAURITIUS_3GB_15D', 'Go'),
('3809ee08-bd71-48c1-b035-362948226261', '2dcc8be7-f717-4749-a4aa-170b2fa1e160', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_MAURITIUS_10GB_7D', 'Go'),
('2935d59c-e4f1-4b9b-8acb-a929fdcca246', '2dcc8be7-f717-4749-a4aa-170b2fa1e160', 10.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_MAURITIUS_10GB_30D', 'Go'),
('97bcb58c-d5ce-4712-9878-382f33fd857b', '2dcc8be7-f717-4749-a4aa-170b2fa1e160', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_MAURITIUS_UNLIMITED_7D_FUP20', 'UNLI'),
('fde3ec1e-3461-4a09-9a2c-8894f83196be', '2dcc8be7-f717-4749-a4aa-170b2fa1e160', 60.0, 15, 52.25, '', 'WW_901O_STACK_ONEOFF_MAURITIUS_UNLIMITED_15D_FUP30', 'UNLI'),

-- Mauritanie

('5b8774b8-a206-4014-a139-e27396d8c4da', 'b82bde93-00a9-4d61-9111-7a29f0433642', 1.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_MAURITANIA_1GB_7D', 'Go'),
('b23dfb03-4399-406a-8bc4-e2502c33662d', 'b82bde93-00a9-4d61-9111-7a29f0433642', 3.0, 15, 22.8, '', 'WW_901O_STACK_ONEOFF_MAURITANIA_3GB_15D', 'Go'),

-- Mayotte

('f6a577d5-b317-4d51-890c-2382d042ac45', '507f3503-1f2d-4428-a46d-a82e2fad56ce', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_MAYOTTE_1GB_7D', 'Go'),
('a862292b-70cc-49a9-8628-c1740be65dbb', '507f3503-1f2d-4428-a46d-a82e2fad56ce', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_MAYOTTE_3GB_15D', 'Go'),

-- Mexique

('73e8903f-3f09-4fbf-92f8-bacaf3b38b32', 'f50b53f8-ab49-4b71-9226-727124563dce', 1.0, 30, 4.75, '', 'WW_901O_STACK_ONEOFF_MEXICO_1GB_30D', 'Go'),
('03037495-af49-45d8-abe8-1c892558321b', 'f50b53f8-ab49-4b71-9226-727124563dce', 3.0, 30, 9.5, '', 'WW_901O_STACK_ONEOFF_MEXICO_3GB_30D', 'Go'),
('8821ac87-fb69-4541-b15c-bff203ab5b4a', 'f50b53f8-ab49-4b71-9226-727124563dce', 10.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_MEXICO_10GB_7D', 'Go'),
('f00899a0-3250-4945-b5ac-7bdbf18ac15c', 'f50b53f8-ab49-4b71-9226-727124563dce', 10.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_MEXICO_10GB_30D', 'Go'),
('1145490c-46d5-446e-b2fb-b15bb8c5bf57', 'f50b53f8-ab49-4b71-9226-727124563dce', 40.0, 7, 46.55, '', 'WW_901O_STACK_ONEOFF_MEXICO_UNLIMITED_7D_FUP20', 'UNLI'),
('9f4dcdba-3fdb-43c7-94c3-d175c7aab024', 'f50b53f8-ab49-4b71-9226-727124563dce', 500.0, 2, 2.85, '', 'WW_901O_STACK_ONEOFF_MEXICO_500MB_2D', 'Mo'),

-- Moldavie

('c1c9971e-bd8b-4f7b-bcb0-d1477799729c', '4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_MOLDOVA_3GB_15D', 'Go'),
('765759c5-8a4e-43d0-8a55-6efccf2bfd4a', '4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 10.0, 7, 10.45, '', 'WW_901O_STACK_ONEOFF_MOLDOVA_10GB_7D', 'Go'),
('9bfa2a17-1585-4ce9-9d90-2b39d1c32097', '4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 10.0, 30, 14.25, '', 'WW_901O_STACK_ONEOFF_MOLDOVA_10GB_30D', 'Go'),
('cbf08f76-a961-4c22-862b-dd3de0806ee3', '4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 25.0, 30, 29.45, '', 'WW_901O_STACK_ONEOFF_MOLDOVA_25GB_30D', 'Go'),
('e4722ba7-caf6-4912-a4f3-150d99ea903b', '4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 50.0, 30, 53.2, '', 'WW_901O_STACK_ONEOFF_MOLDOVA_50GB_30D', 'Go'),

-- Monde (179 pays)

('76d880fc-4570-4f62-a644-23327cf118bf', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 1.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_1GB_30D', 'Go'),
('1d42ae19-6014-4eb5-9b26-875f7364c077', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 3.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_3GB_30D', 'Go'),
('3d15ea0d-e441-4a90-9ebd-25424c460cc5', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 10.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_10GB_30D', 'Go'),
('56f9b2b8-78ae-47d5-83be-18254de43d99', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 25.0, 90, 56.05, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_25GB_3M', 'Go'),
('f07dc256-479d-4fcd-a4de-eaea0f95f716', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 50.0, 8, 46.55, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_UNLIMITED_8D_FUP25', 'UNLI'),
('18a5967d-245d-489b-b539-903bba6c6aa6', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 50.0, 180, 94.05, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_50GB_6M', 'Go'),
('f23a48dd-5bda-4a4a-8ac7-4cc1039d210d', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 60.0, 15, 73.15, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_UNLIMITED_15D_FUP30', 'UNLI'),
('d413c126-afe6-4cff-9d44-f63d87dccd0f', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 120.0, 30, 113.05, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_UNLIMITED_30D_FUP60', 'UNLI'),
('66d1cbfa-62c3-492a-9646-4643ed98d08c', '63adfa4b-f6a1-4064-b34b-1dae578c03ef', 500.0, 30, 4.75, '', 'WW_901O_STACK_ONEOFF_BEST_WORLD_500MB_30D', 'Mo'),

-- Monde (202 pays)

('804c476a-7c63-4f77-b365-20e49511b382', '8df03d84-b222-41f2-8560-a268aa57ef94', 1.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_WORLD2_1GB_30D', 'Go'),
('ea01803c-77ea-4b0e-abf3-c64aad4acc3a', '8df03d84-b222-41f2-8560-a268aa57ef94', 3.0, 30, 24.7, '', 'WW_901O_STACK_ONEOFF_WORLD2_3GB_30D', 'Go'),
('8f6309a7-1096-4616-9f2a-1595beec35c1', '8df03d84-b222-41f2-8560-a268aa57ef94', 10.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_WORLD2_10GB_30D', 'Go'),
('aa91cfeb-fa33-4d83-875f-49775464b589', '8df03d84-b222-41f2-8560-a268aa57ef94', 25.0, 90, 121.6, '', 'WW_901O_STACK_ONEOFF_WORLD2_25GB_3M', 'Go'),
('3be0e033-abe0-459f-bea8-6f9e1a5d6b43', '8df03d84-b222-41f2-8560-a268aa57ef94', 50.0, 180, 178.6, '', 'WW_901O_STACK_ONEOFF_WORLD2_50GB_6M', 'Go'),
('77ddafee-910a-4cf0-baaf-0191066e55f6', '8df03d84-b222-41f2-8560-a268aa57ef94', 500.0, 1, 7.6, '', 'WW_901O_STACK_ONEOFF_WORLD2_500MB_1D', 'Mo'),
('2bde36c0-6f73-4272-bfe6-93f557f83832', '8df03d84-b222-41f2-8560-a268aa57ef94', 500.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_WORLD2_500MB_30D', 'Mo'),

-- Mongolie

('7f25358a-28a9-4320-8cdb-ced9233e1cc8', '0d75c093-7466-476c-a75f-d87f621eb86d', 1.0, 7, 15.2, '', 'WW_901O_STACK_ONEOFF_MONGOLIA_1GB_7D', 'Go'),
('49f26109-bc77-4fc2-b200-0abc358580f3', '0d75c093-7466-476c-a75f-d87f621eb86d', 3.0, 15, 30.4, '', 'WW_901O_STACK_ONEOFF_MONGOLIA_3GB_15D', 'Go'),

-- Monténégro

('95862e3b-3f23-4102-b8da-d0be104d3789', '385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_MONTENEGRO_1GB_7D', 'Go'),
('fd3ed2a2-d3ec-4d1c-b4b7-84a9fbde4ca8', '385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_MONTENEGRO_3GB_15D', 'Go'),
('11c71f83-fc79-437d-8839-c6433861537a', '385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_MONTENEGRO_10GB_7D', 'Go'),
('32e42699-8842-4b32-8f41-db376b98ad72', '385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 10.0, 30, 19.95, '', 'WW_901O_STACK_ONEOFF_MONTENEGRO_10GB_30D', 'Go'),
('8a91ab37-1203-44cf-92c4-851a5cc18d94', '385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_MONTENEGRO_UNLIMITED_7D_FUP20', 'UNLI'),
('f1eeeb9a-f9fa-4647-9f7f-7d976f3053dc', '385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 60.0, 15, 41.8, '', 'WW_901O_STACK_ONEOFF_MONTENEGRO_UNLIMITED_15D_FUP30', 'UNLI'),

-- Moyen-Orient (sans Israël)

('eec5585d-b6c9-49d7-bff6-40897fb29855', 'e52f1848-d286-4c99-9c67-221cb876f6ee', 1.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_ME_Wo_Israel_1GB_30D', 'Go'),
('f8e37d90-f9dc-417f-baaa-4273691da75e', 'e52f1848-d286-4c99-9c67-221cb876f6ee', 3.0, 15, 26.6, '', 'WW_901O_STACK_ONEOFF_ME_Wo_Israel_3GB_15D', 'Go'),

-- Moyen-Orient (sélection)

('4009a8c5-3bcb-4598-93e0-49c289d52c87', '7505117e-4acd-437f-a3e6-ed4978df651e', 3.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_BESTME_3GB_30D', 'Go'),

-- Moyen-Orient (étendu)

('81fe2dc0-423e-4139-8528-c5f4fb7e2983', '8dea511e-d8f9-4b4b-81d1-dca0251866cb', 10.0, 7, 32.3, '', 'WW_901O_STACK_ONEOFF_BEST_ME_10GB_7D', 'Go'),
('18fb80c8-aa9d-45cf-a91c-d0904851ce69', '8dea511e-d8f9-4b4b-81d1-dca0251866cb', 10.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_BEST_ME_10GB_30D', 'Go'),
('198a8c25-1c55-4d8b-99b7-1094eac65982', '8dea511e-d8f9-4b4b-81d1-dca0251866cb', 40.0, 7, 46.55, '', 'WW_901O_STACK_ONEOFF_BEST_ME_UNLIMITED_7D_FUP20', 'UNLI'),
('6f488bd9-bb61-4d4c-bb38-8ecc420852cb', '8dea511e-d8f9-4b4b-81d1-dca0251866cb', 60.0, 15, 83.6, '', 'WW_901O_STACK_ONEOFF_BEST_ME_UNLIMITED_15D_FUP30', 'UNLI'),
('2b7d8f7d-0be3-4a16-8fff-4d27094dc071', '8dea511e-d8f9-4b4b-81d1-dca0251866cb', 120.0, 30, 141.55, '', 'WW_901O_STACK_ONEOFF_BEST_ME_UNLIMITED_30D_FUP60', 'UNLI'),

-- Mozambique

('6f9a50b0-00df-401f-81f5-a29843488d1e', '79a013f3-3374-4972-a748-3cdb0fb98b48', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_MOZAMBIQUE_1GB_7D', 'Go'),
('25efbde9-c1e4-4f46-9377-a474e832c087', '79a013f3-3374-4972-a748-3cdb0fb98b48', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_MOZAMBIQUE_3GB_15D', 'Go'),

-- Namibie

('d94f8952-6054-416f-baee-f3e8f7b3eb9b', '950518ff-16b8-46f2-8280-8653a0f4aa2e', 1.0, 7, 47.5, '', 'WW_901O_STACK_ONEOFF_NAMIBIA_1GB_7D', 'Go'),

-- Nauru

('a5057766-cbc1-4c7b-8ef6-ae80c4efa978', '64feb637-d560-4b7b-ac2f-f81a347e9098', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_NAURU_1GB_7D', 'Go'),
('9ed14883-581e-4dea-b7f6-f4ec4b0a7831', '64feb637-d560-4b7b-ac2f-f81a347e9098', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_NAURU_3GB_15D', 'Go'),

-- Nicaragua

('e895af37-771d-413a-8107-4f1007d85ed4', 'e9f15ed5-016c-451d-b96c-482463e316d2', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_NICARAGUA_1GB_7D', 'Go'),
('08940c0e-0dc3-41ca-a551-a5a4b8ea1fa3', 'e9f15ed5-016c-451d-b96c-482463e316d2', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_NICARAGUA_3GB_15D', 'Go'),
('ef1f82fd-487a-4264-a2ff-ac8a48605ef7', 'e9f15ed5-016c-451d-b96c-482463e316d2', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_NICARAGUA_10GB_7D', 'Go'),
('af45cdea-1643-4d20-be7b-83eda5a0a9f8', 'e9f15ed5-016c-451d-b96c-482463e316d2', 10.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_NICARAGUA_10GB_30D', 'Go'),
('4f0b0ffd-52cd-45bb-93bb-f957e0efa654', 'e9f15ed5-016c-451d-b96c-482463e316d2', 25.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_NICARAGUA_25GB_30D', 'Go'),
('0f97101f-b485-43a5-87c0-70f16cbc7732', 'e9f15ed5-016c-451d-b96c-482463e316d2', 40.0, 7, 34.2, '', 'WW_901O_STACK_ONEOFF_NICARAGUA_UNLIMITED_7D_FUP20', 'UNLI'),
('15f87bd3-fb2f-46cc-b6c0-f4b990ec3833', 'e9f15ed5-016c-451d-b96c-482463e316d2', 60.0, 15, 62.7, '', 'WW_901O_STACK_ONEOFF_NICARAGUA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Nigeria

('f5ab03b2-5784-4ba0-b296-213e38e8d622', '04d7b769-7c89-4bae-9554-55e2ee926929', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_NIGERIA_3GB_15D', 'Go'),
('ea32aa77-1549-4fe9-b18f-db3ae4b0e3eb', '04d7b769-7c89-4bae-9554-55e2ee926929', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_NIGERIA_10GB_7D', 'Go'),
('492777d0-333f-48d6-88fa-70be555054c5', '04d7b769-7c89-4bae-9554-55e2ee926929', 10.0, 30, 25.65, '', 'WW_901O_STACK_ONEOFF_NIGERIA_10GB_30D', 'Go'),
('266b5294-12d7-406d-a9d2-6207a91408e0', '04d7b769-7c89-4bae-9554-55e2ee926929', 25.0, 30, 45.6, '', 'WW_901O_STACK_ONEOFF_NIGERIA_25GB_30D', 'Go'),

-- Norvège

('6a87cedc-9e23-4422-8b6a-954af761ba46', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_NORWAY_3GB_15D', 'Go'),
('da09261d-f7fe-4d94-85f3-d5b23d37c61c', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_NORWAY_10GB_7D', 'Go'),
('67b62312-1780-473a-b865-30023271f8e4', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_NORWAY_10GB_30D', 'Go'),
('9a7b8d74-857c-45c1-82e0-5eea38523b64', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 25.0, 30, 19.95, '', 'WW_901O_STACK_ONEOFF_NORWAY_25GB_30D', 'Go'),
('c4328d2d-6ff8-4b3f-8e38-87fd717763ca', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_NORWAY_UNLIMITED_7D_FUP20', 'UNLI'),
('72a08373-7d16-4e7e-a70d-d3d7fb33dde8', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 50.0, 30, 35.15, '', 'WW_901O_STACK_ONEOFF_NORWAY_50GB_30D', 'Go'),
('2a32202c-8a93-45b0-865c-b30525b48364', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_NORWAY_UNLIMITED_15D_FUP30', 'UNLI'),
('b303749f-2722-4d21-9ab6-b4c18aa9556e', '5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_NORWAY_UNLIMITED_30D_FUP60', 'UNLI'),

-- Nouvelle-Calédonie

('5b70b121-2de7-4000-99a2-cc1607d0e497', 'adde12c2-76bd-4f99-8229-f96af97c5f8b', 1.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_NCL_1GB_7D', 'Go'),
('2f39c839-f75c-44ad-9aa8-4b3f27908c2a', 'adde12c2-76bd-4f99-8229-f96af97c5f8b', 3.0, 15, 36.1, '', 'WW_901O_STACK_ONEOFF_NCL_3GB_15D', 'Go'),

-- Nouvelle-Zélande

('211635bd-451e-4207-b1ac-891fddc913e2', '1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 3.0, 30, 6.65, '', 'WW_901O_STACK_ONEOFF_NZL_3GB_30D', 'Go'),
('b6ca5e12-585e-4b6c-821f-0e13ffc3d2e1', '1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_NZL_10GB_7D', 'Go'),
('79825763-74c0-43f6-bace-475f8231660e', '1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_NZL_10GB_30D', 'Go'),
('d20dcc47-fbb7-4169-8cfa-31a26d289028', '1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 25.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_NZL_25GB_30D', 'Go'),
('47f5fe66-11fc-4ddf-afe7-d47b0176264a', '1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_NZL_UNLIMITED_7D_FUP20', 'UNLI'),
('7078a7b0-4112-4f53-a954-4d3797c3800a', '1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 60.0, 15, 41.8, '', 'WW_901O_STACK_ONEOFF_NZL_UNLIMITED_15D_FUP30', 'UNLI'),
('85e5f67b-d392-4b37-9ba3-48aff6219d6c', '1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 120.0, 30, 61.75, '', 'WW_901O_STACK_ONEOFF_NZL_UNLIMITED_30D_FUP60', 'UNLI'),

-- Népal

('93a9ce79-49bb-4add-88f4-f433d868535c', '607fb6b6-fa55-461a-9535-41bba2e710f2', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_NEPAL_1GB_7D', 'Go'),
('8d336927-d5dc-4c78-809f-e6719a67d43b', '607fb6b6-fa55-461a-9535-41bba2e710f2', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_NEPAL_3GB_15D', 'Go'),

-- Océanie

('2889729a-4abe-4d6a-8a0b-cc1ef540000a', 'b9a02fc3-b556-4460-895d-3065cd377641', 1.0, 30, 14.25, '', 'WW_901O_STACK_ONEOFF_OCEANIA_1GB_30D', 'Go'),
('4c8a0b5f-54e7-4fa6-aa58-cec5b44687ab', 'b9a02fc3-b556-4460-895d-3065cd377641', 3.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_OCEANIA_3GB_15D', 'Go'),
('9b19103c-f943-4440-9948-f23b29fe072c', 'b9a02fc3-b556-4460-895d-3065cd377641', 10.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_OCEANIA_10GB_30D', 'Go'),

-- Oman

('a9ea967b-0988-42f0-84cd-eab085810576', 'a60ee5dd-3acf-4afb-9d20-01edd5d60cb7', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_OMAN_1GB_7D', 'Go'),
('4fca443f-b0b5-4836-8ed8-21d9d3f8c673', 'a60ee5dd-3acf-4afb-9d20-01edd5d60cb7', 3.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_OMAN_3GB_30D', 'Go'),
('7487b085-e636-4621-ade3-04c78afde7dc', 'a60ee5dd-3acf-4afb-9d20-01edd5d60cb7', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_OMAN_10GB_7D', 'Go'),

-- Ouganda

('18761479-a3f0-4f60-8793-3897cfefa7b5', '552e2cd2-b1c8-448b-a123-4c63756cbad0', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_UGANDA_1GB_7D', 'Go'),
('32fe7cd0-50f0-4979-b6ba-041d4f17d218', '552e2cd2-b1c8-448b-a123-4c63756cbad0', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_UGANDA_3GB_15D', 'Go'),

-- Ouzbékistan

('81367572-26cb-4671-bf86-44d5a510db95', '6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_UZBEKISTAN_1GB_7D', 'Go'),
('84459e6b-5197-48a5-8cc0-16dce8ae1cef', '6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_UZBEKISTAN_3GB_15D', 'Go'),
('022c0987-602f-4dac-8c00-3f62fbf81d08', '6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_UZBEKISTAN_10GB_7D', 'Go'),
('ec4b5d9e-cef8-453a-8520-a70f81456b72', '6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_UZBEKISTAN_10GB_30D', 'Go'),
('9404aa20-8df8-4c36-b959-26a0a33577cd', '6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 25.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_UZBEKISTAN_25GB_30D', 'Go'),
('e1eec9b1-4fd4-4365-be10-fdf1259efed9', '6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_UZBEKISTAN_UNLIMITED_7D_FUP20', 'UNLI'),
('b6cfe6cc-a8e2-4c1e-b20c-93a68f53a866', '6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_UZBEKISTAN_UNLIMITED_15D_FUP30', 'UNLI'),

-- Pakistan

('53d86146-3743-4f8c-92d2-82a120e3efbc', '89c1c33a-f4fa-4ed3-bb19-22982321e116', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_PAKISTAN_1GB_7D', 'Go'),
('599cb7d1-309c-46a8-b5b3-62ecbc087e5a', '89c1c33a-f4fa-4ed3-bb19-22982321e116', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_PAKISTAN_3GB_15D', 'Go'),
('480faa79-0189-4001-a360-1fc23525d9df', '89c1c33a-f4fa-4ed3-bb19-22982321e116', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_PAKISTAN_10GB_7D', 'Go'),
('44e68321-5753-4893-bd06-a067cdb94149', '89c1c33a-f4fa-4ed3-bb19-22982321e116', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_PAKISTAN_10GB_30D', 'Go'),
('04841c67-3686-4826-8d05-4b1f754d26cb', '89c1c33a-f4fa-4ed3-bb19-22982321e116', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_PAKISTAN_25GB_30D', 'Go'),
('ecd9cd19-398c-41c5-a545-76d173f82d17', '89c1c33a-f4fa-4ed3-bb19-22982321e116', 40.0, 7, 25.65, '', 'WW_901O_STACK_ONEOFF_PAKISTAN_UNLIMITED_7D_FUP20', 'UNLI'),
('18396c12-f1de-4510-aeee-af699d62c60f', '89c1c33a-f4fa-4ed3-bb19-22982321e116', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_PAKISTAN_UNLIMITED_15D_FUP30', 'UNLI'),

-- Palestine

('3b2e9015-0cf5-43d3-90ad-771e8f0ce6bd', '5b6fa89d-9c96-47a3-a7b2-a4f0e18c6eb3', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_PALESTINE_1GB_7D', 'Go'),
('281d3ca3-2a2b-4325-afc6-a43cb63925bf', '5b6fa89d-9c96-47a3-a7b2-a4f0e18c6eb3', 3.0, 15, 18.05, '', 'WW_901O_STACK_ONEOFF_PALESTINE_3GB_15D', 'Go'),
('2c954532-af6c-44b2-a51f-639a9985899f', '5b6fa89d-9c96-47a3-a7b2-a4f0e18c6eb3', 10.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_PALESTINE_10GB_30D', 'Go'),

-- Panama

('cf74a6de-5aa8-4e6f-a14d-cd599dcf5064', '668509e8-a2c4-40cd-bcd1-62b53a93b87e', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_PANAMA_1GB_7D', 'Go'),
('116a1c92-22f0-4ef3-8947-76ddbb11f4a4', '668509e8-a2c4-40cd-bcd1-62b53a93b87e', 3.0, 15, 9.5, '', 'WW_901O_STACK_ONEOFF_PANAMA_3GB_15D', 'Go'),
('e558784d-ae76-4fb0-a836-e38cbe9bf84b', '668509e8-a2c4-40cd-bcd1-62b53a93b87e', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_PANAMA_10GB_7D', 'Go'),
('1008db4c-fd9c-4edd-9b2f-0df1e8482dc7', '668509e8-a2c4-40cd-bcd1-62b53a93b87e', 10.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_PANAMA_10GB_30D', 'Go'),
('2a12fdc3-00e2-4d4c-bb41-94ebd5bfa97f', '668509e8-a2c4-40cd-bcd1-62b53a93b87e', 25.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_PANAMA_25GB_30D', 'Go'),
('063bf57b-594a-4146-ab96-9c3941f4acf6', '668509e8-a2c4-40cd-bcd1-62b53a93b87e', 40.0, 7, 29.45, '', 'WW_901O_STACK_ONEOFF_PANAMA_UNLIMITED_7D_FUP20', 'UNLI'),
('00c69cc2-04cc-450c-9fa2-bca6d6c4d3c2', '668509e8-a2c4-40cd-bcd1-62b53a93b87e', 60.0, 15, 52.25, '', 'WW_901O_STACK_ONEOFF_PANAMA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Paraguay

('e46ec141-a649-4aee-99d5-4350464b6308', '1f8980af-30bc-4485-b093-d17d94c09ec6', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_PARAGUAY_1GB_7D', 'Go'),
('39509f0a-9352-4565-ab14-85785d0578b4', '1f8980af-30bc-4485-b093-d17d94c09ec6', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_PARAGUAY_3GB_15D', 'Go'),
('181e2d13-d11b-49d9-a226-9338d2797d51', '1f8980af-30bc-4485-b093-d17d94c09ec6', 10.0, 7, 14.25, '', 'WW_901O_STACK_ONEOFF_PARAGUAY_10GB_7D', 'Go'),
('74df43dd-e17b-40c6-8978-b11d2f6c71c5', '1f8980af-30bc-4485-b093-d17d94c09ec6', 10.0, 30, 17.1, '', 'WW_901O_STACK_ONEOFF_PARAGUAY_10GB_30D', 'Go'),
('ec9fb923-81f3-443b-bfa6-51526ae51309', '1f8980af-30bc-4485-b093-d17d94c09ec6', 25.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_PARAGUAY_25GB_30D', 'Go'),
('83d84048-7027-4c9f-aa58-b2f91b9115a8', '1f8980af-30bc-4485-b093-d17d94c09ec6', 40.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_PARAGUAY_UNLIMITED_7D_FUP20', 'UNLI'),
('a6f4fa98-ce0f-4b18-ab36-ac09ef09abc1', '1f8980af-30bc-4485-b093-d17d94c09ec6', 60.0, 15, 53.2, '', 'WW_901O_STACK_ONEOFF_PARAGUAY_UNLIMITED_15D_FUP30', 'UNLI'),

-- Pays-Bas

('d572ad66-5555-4b9c-bc25-48d5d7734892', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_3GB_15D', 'Go'),
('e182c61c-c404-45b0-9827-a586de986b02', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_10GB_7D', 'Go'),
('4243016e-f958-4a01-8145-679ddf161b5c', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_10GB_30D', 'Go'),
('2641ece8-3c83-4fb8-957f-888f9239432b', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_25GB_30D', 'Go'),
('7c124ca7-2b13-44ae-bdb7-4584f4fa2163', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_UNLIMITED_7D_FUP20', 'UNLI'),
('4c6a274b-6f55-4041-81fe-1d5db523f499', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 50.0, 30, 31.35, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_50GB_30D', 'Go'),
('20e75d61-6abd-4e0f-885d-42c13d5e1991', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_UNLIMITED_15D_FUP30', 'UNLI'),
('35504fea-7466-4c79-9501-0f1d483602f9', '3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 120.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_NETHERLANDS_UNLIMITED_30D_FUP60', 'UNLI'),

-- Philippines

('a53ab37d-d9df-4df3-90a2-4fbccd2cdb07', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_1GB_7D', 'Go'),
('9663e328-5891-4d0c-83ba-d41c73ab6ebf', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_3GB_15D', 'Go'),
('bd57198d-1ec0-4f23-a4c0-6aca8527280e', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 10.0, 7, 13.3, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_10GB_7D', 'Go'),
('52d553d4-6307-4986-91d6-7935f8b32a8d', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 10.0, 30, 15.2, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_10GB_30D', 'Go'),
('8e7245bf-0d47-4f80-b8e0-039fa4ed8586', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_25GB_30D', 'Go'),
('935f7e44-85af-45f9-99fa-2275c204a911', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_UNLIMITED_7D_FUP20', 'UNLI'),
('f57f4b23-6ec1-410b-8ce2-71a7e3e0789d', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 50.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_50GB_30D', 'Go'),
('4f2dd794-9ffe-4a0a-b895-e8bf85e353ae', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 60.0, 15, 41.8, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_UNLIMITED_15D_FUP30', 'UNLI'),
('9f8473af-d77e-48b9-9bfb-b92ef8a23ac7', '37e79854-50fe-4d7b-9845-9e62704c1a3f', 120.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_PHILIPPINES_UNLIMITED_30D_FUP60', 'UNLI'),

-- Pologne

('ba1f0224-47a1-43e1-bf5f-ecdf755eca63', '1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 3.0, 30, 4.75, '', 'WW_901O_STACK_ONEOFF_POL_3GB_30D', 'Go'),
('a6198269-a7a0-4ca6-9cff-023fe8dc7840', '1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 10.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_POL_10GB_7D', 'Go'),
('b02b212b-a00c-4ae2-98c9-3a9cd6777713', '1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 10.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_POL_10GB_30D', 'Go'),
('f51fc58a-b91d-4cde-9bd3-214602629bc8', '1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_POL_25GB_30D', 'Go'),
('f5c3e31a-f01b-4e73-bfb1-db83e490dbfb', '1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 40.0, 7, 14.25, '', 'WW_901O_STACK_ONEOFF_POL_UNLIMITED_7D_FUP20', 'UNLI'),
('2e4fef18-3144-44f2-929f-cac086f72f8e', '1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_POL_UNLIMITED_15D_FUP30', 'UNLI'),
('52d4c18a-1480-449e-8f98-587748e48a4c', '1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_POL_UNLIMITED_30D_FUP60', 'UNLI'),

-- Polynésie française

('0be7b734-a3ca-49ff-a9c8-91e7f27e564c', 'd1824057-970c-4dde-89bb-1433a20ae7cc', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_POLYNESIA_1GB_7D', 'Go'),
('ea2d6ba0-6dfb-4c13-ba43-30b243766300', 'd1824057-970c-4dde-89bb-1433a20ae7cc', 3.0, 15, 20.9, '', 'WW_901O_STACK_ONEOFF_POLYNESIA_3GB_15D', 'Go'),
('1b48fc66-4031-453a-b8b7-f3ee7bbde9b1', 'd1824057-970c-4dde-89bb-1433a20ae7cc', 10.0, 7, 34.2, '', 'WW_901O_STACK_ONEOFF_POLYNESIA_10GB_7D', 'Go'),
('c3313c48-d974-42cb-ae50-820ba2891839', 'd1824057-970c-4dde-89bb-1433a20ae7cc', 10.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_POLYNESIA_10GB_30D', 'Go'),
('b5a6965e-fb1d-42ba-a860-fd57df322721', 'd1824057-970c-4dde-89bb-1433a20ae7cc', 25.0, 30, 75.05, '', 'WW_901O_STACK_ONEOFF_POLYNESIA_25GB_30D', 'Go'),
('6d9f8992-3f8d-41db-9fee-0cea843c73e9', 'd1824057-970c-4dde-89bb-1433a20ae7cc', 40.0, 7, 69.35, '', 'WW_901O_STACK_ONEOFF_POLYNESIA_UNLIMITED_7D_FUP20', 'UNLI'),

-- Portugal

('e33c5fd1-0188-42ab-b4e3-54bdad62da81', '037b8737-045b-4a50-beae-a2af6d1c4106', 3.0, 30, 5.7, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_3GB_30D', 'Go'),
('4dd38daa-c4a8-4af6-ad86-ffe6d5d58389', '037b8737-045b-4a50-beae-a2af6d1c4106', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_10GB_7D', 'Go'),
('8975cb75-268c-4540-a4e5-9f00cbb3c5d0', '037b8737-045b-4a50-beae-a2af6d1c4106', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_10GB_30D', 'Go'),
('794e9abf-6a2b-4e36-b388-a85e9aa3cf0f', '037b8737-045b-4a50-beae-a2af6d1c4106', 25.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_25GB_30D', 'Go'),
('b1474894-07c5-442f-90bd-0729d90fb822', '037b8737-045b-4a50-beae-a2af6d1c4106', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_UNLIMITED_7D_FUP20', 'UNLI'),
('67f484b1-02f6-4864-b8bd-873fa354fbf9', '037b8737-045b-4a50-beae-a2af6d1c4106', 50.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_50GB_30D', 'Go'),
('70778c0d-9c8e-460d-bbfe-b7cda27467fd', '037b8737-045b-4a50-beae-a2af6d1c4106', 60.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_UNLIMITED_15D_FUP30', 'UNLI'),
('c05ecea3-4a42-44e2-8e82-471f2f465400', '037b8737-045b-4a50-beae-a2af6d1c4106', 120.0, 30, 45.6, '', 'WW_901O_STACK_ONEOFF_PORTUGAL_UNLIMITED_30D_FUP60', 'UNLI'),

-- Pérou

('e48746c5-450e-4b4e-81d5-a62a46e1cd11', 'e4c02753-cbb2-4fcf-89a6-ada2538552ce', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_PERU_1GB_7D', 'Go'),
('b1eff6b4-2af6-4c30-889e-12ccc5a189a7', 'e4c02753-cbb2-4fcf-89a6-ada2538552ce', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_PERU_3GB_15D', 'Go'),
('ad8d7cdb-1f36-45f0-bb07-54b20d0be5ea', 'e4c02753-cbb2-4fcf-89a6-ada2538552ce', 10.0, 7, 20.9, '', 'WW_901O_STACK_ONEOFF_PERU_10GB_7D', 'Go'),
('4cca6d91-47c1-4ad0-9e29-455b9f0da089', 'e4c02753-cbb2-4fcf-89a6-ada2538552ce', 10.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_PERU_10GB_30D', 'Go'),
('0c77c246-b099-46eb-931b-f4bde27ff77e', 'e4c02753-cbb2-4fcf-89a6-ada2538552ce', 25.0, 30, 39.9, '', 'WW_901O_STACK_ONEOFF_PERU_25GB_30D', 'Go'),
('26438a68-49c2-4729-a91f-3e037dee697e', 'e4c02753-cbb2-4fcf-89a6-ada2538552ce', 40.0, 7, 33.25, '', 'WW_901O_STACK_ONEOFF_PERU_UNLIMITED_7D_FUP20', 'UNLI'),
('cff4f7f4-c716-4f8b-acd4-581113d7fda0', 'e4c02753-cbb2-4fcf-89a6-ada2538552ce', 120.0, 30, 75.05, '', 'WW_901O_STACK_ONEOFF_PERU_UNLIMITED_30D_FUP60', 'UNLI'),

-- Qatar

('e482da51-9721-427a-8380-ef3cb04d9d33', 'd934bb7c-f750-48b3-ac92-86903494333b', 3.0, 30, 7.6, '', 'WW_901O_STACK_ONEOFF_QATAR_3GB_30D', 'Go'),
('44a8850e-1188-425b-875f-9868ebc0d997', 'd934bb7c-f750-48b3-ac92-86903494333b', 10.0, 7, 15.2, '', 'WW_901O_STACK_ONEOFF_QATAR_10GB_7D', 'Go'),
('a34ade3f-84b5-40f5-bfd5-8b349e1f2af1', 'd934bb7c-f750-48b3-ac92-86903494333b', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_QATAR_10GB_30D', 'Go'),
('6555045f-c5f5-478c-836b-47703fecc759', 'd934bb7c-f750-48b3-ac92-86903494333b', 40.0, 7, 30.4, '', 'WW_901O_STACK_ONEOFF_QATAR_UNLIMITED_7D_FUP20', 'UNLI'),

-- RD Congo

('9a9c5c59-f7ac-4ca7-9f1e-954ebd8cfe99', 'f8651905-903a-46a8-9237-e9fc5e88a59d', 1.0, 7, 47.5, '', 'WW_901O_STACK_ONEOFF_DRCONGO_1GB_7D', 'Go'),

-- Roumanie

('22a893f4-16d4-401f-8e51-ce16e7d06a9d', 'dc0946f2-13db-4f2a-8259-d32977418215', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_ROMANIA_3GB_15D', 'Go'),
('1adc7ad6-be92-48aa-90e6-bf2d8dd5b710', 'dc0946f2-13db-4f2a-8259-d32977418215', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_ROMANIA_10GB_30D', 'Go'),
('3dc9e49f-db94-451a-94bf-e988a6a09949', 'dc0946f2-13db-4f2a-8259-d32977418215', 50.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_ROMANIA_50GB_30D', 'Go'),

-- Royaume-Uni

('c29b81f7-0fb3-4f58-bd98-a413b18168c7', '327f649b-460b-49c2-ab74-ccc84adc615c', 3.0, 30, 6.65, '', 'WW_901O_STACK_ONEOFF_UKONLY_3GB_30D', 'Go'),
('6817b27a-a874-405e-a7ba-0baff48f99db', '327f649b-460b-49c2-ab74-ccc84adc615c', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_UKONLY_10GB_7D', 'Go'),
('b80e9cec-370d-479e-af8c-730dee72107b', '327f649b-460b-49c2-ab74-ccc84adc615c', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_UKONLY_10GB_30D', 'Go'),
('c8728f5e-05f5-4984-ac08-0084a035bce8', '327f649b-460b-49c2-ab74-ccc84adc615c', 14.0, 1, 7.6, '', 'WW_901O_STACK_ONEOFF_UKONLY_UNLIMITED_1D_FUP7', 'UNLI'),
('6a266036-123e-4398-90b4-95b2aec024f1', '327f649b-460b-49c2-ab74-ccc84adc615c', 25.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_UKONLY_25GB_30D', 'Go'),
('7e1d5f81-2253-46da-a538-24b922adbdd2', '327f649b-460b-49c2-ab74-ccc84adc615c', 50.0, 7, 20.9, '', 'WW_901O_STACK_ONEOFF_UKONLY_UNLIMITED_7D_FUP25', 'UNLI'),
('04f6d5ab-d53a-4111-88db-ca06179ca744', '327f649b-460b-49c2-ab74-ccc84adc615c', 50.0, 30, 30.4, '', 'WW_901O_STACK_ONEOFF_UKONLY_50GB_30D', 'Go'),
('e81228a4-2c92-4dec-9504-dd3460495401', '327f649b-460b-49c2-ab74-ccc84adc615c', 120.0, 30, 41.8, '', 'WW_901O_STACK_ONEOFF_UKONLY_UNLIMITED_30D_FUP60', 'UNLI'),

-- Russie

('d9835478-4e49-4f55-b2b4-1da52e7f627e', '891ee240-1d18-4fe9-b626-b93f55225f93', 1.0, 7, 2.85, '', 'WW_901O_STACK_ONEOFF_RUSSIA_1GB_7D', 'Go'),
('6d6dd60e-37ac-4ae2-8886-a998c58a1f74', '891ee240-1d18-4fe9-b626-b93f55225f93', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_RUSSIA_3GB_15D', 'Go'),
('22e96ff3-cc82-4812-8fba-629480f8c907', '891ee240-1d18-4fe9-b626-b93f55225f93', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_RUSSIA_10GB_7D', 'Go'),
('ebf4de82-b73f-4db0-ba96-a06cc7245212', '891ee240-1d18-4fe9-b626-b93f55225f93', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_RUSSIA_10GB_30D', 'Go'),
('d8215f92-f73a-4575-a50b-7d7b9f6b583c', '891ee240-1d18-4fe9-b626-b93f55225f93', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_RUSSIA_25GB_30D', 'Go'),
('235e03d6-7bce-487e-aa90-e761132dc8ac', '891ee240-1d18-4fe9-b626-b93f55225f93', 40.0, 7, 20.9, '', 'WW_901O_STACK_ONEOFF_RUSSIA_UNLIMITED_7D_FUP20', 'UNLI'),
('0c04032e-8d9b-4ddd-b21a-32cd4b282ecb', '891ee240-1d18-4fe9-b626-b93f55225f93', 50.0, 30, 43.7, '', 'WW_901O_STACK_ONEOFF_RUSSIA_50GB_30D', 'Go'),
('d0111101-9594-45a8-94fc-79eed1ea6a4d', '891ee240-1d18-4fe9-b626-b93f55225f93', 60.0, 15, 39.9, '', 'WW_901O_STACK_ONEOFF_RUSSIA_UNLIMITED_15D_FUP30', 'UNLI'),
('87f39d23-732c-4590-8c27-7fa5de95eed3', '891ee240-1d18-4fe9-b626-b93f55225f93', 120.0, 30, 60.8, '', 'WW_901O_STACK_ONEOFF_RUSSIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Rwanda

('811673b2-6d73-43d1-86c0-a7e729e23c19', '0ae6b101-ba17-49cd-b9c8-92ba770903be', 3.0, 15, 11.4, '', 'WW_901O_STACK_ONEOFF_RWANDA_3GB_15D', 'Go'),
('22ecfb9b-9f8b-4673-b502-759db69ce160', '0ae6b101-ba17-49cd-b9c8-92ba770903be', 10.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_RWANDA_10GB_7D', 'Go'),
('b56d6741-5bd4-4739-86c3-24c8acc92961', '0ae6b101-ba17-49cd-b9c8-92ba770903be', 10.0, 30, 25.65, '', 'WW_901O_STACK_ONEOFF_RWANDA_10GB_30D', 'Go'),
('a8b41ad9-f2a0-463e-8555-23e43f0ead6a', '0ae6b101-ba17-49cd-b9c8-92ba770903be', 25.0, 30, 45.6, '', 'WW_901O_STACK_ONEOFF_RWANDA_25GB_30D', 'Go'),

-- Rép. centrafricaine

('5aafa0d2-a62d-43af-ac60-1a72008f8eee', 'aa747bc5-2197-48b1-90a8-fb7b4e448ff1', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_CAF_1GB_7D', 'Go'),
('bd7a1b55-c6a2-45ff-b5c4-9b3a2b82693a', 'aa747bc5-2197-48b1-90a8-fb7b4e448ff1', 3.0, 15, 17.1, '', 'WW_901O_STACK_ONEOFF_CAF_3GB_15D', 'Go'),
('f2abfcac-209d-4b02-b103-69c83ed34972', 'aa747bc5-2197-48b1-90a8-fb7b4e448ff1', 10.0, 7, 35.15, '', 'WW_901O_STACK_ONEOFF_CAF_10GB_7D', 'Go'),
('e1653bc2-c093-4a42-84c5-94a87634c342', 'aa747bc5-2197-48b1-90a8-fb7b4e448ff1', 10.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_CAF_10GB_30D', 'Go'),

-- Rép. dominicaine

('8c50a6b6-8243-44af-a485-a8b8fb0174ca', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_DOM_1GB_7D', 'Go'),
('2d65ba3d-cf74-4a6d-a50c-fe1cdad0cf6a', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_DOM_3GB_15D', 'Go'),
('5bb06d8f-c4de-4da9-9346-c473543f050a', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 10.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_DOM_10GB_7D', 'Go'),
('58efb478-6ec6-4adf-be85-d0669d847072', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 10.0, 30, 19.95, '', 'WW_901O_STACK_ONEOFF_DOM_10GB_30D', 'Go'),
('039fa36e-352e-4623-8844-5ffd089d1b26', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_DOM_25GB_30D', 'Go'),
('993d6ad5-15fb-4ca5-b2fa-1f27e1f3f059', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 40.0, 7, 32.3, '', 'WW_901O_STACK_ONEOFF_DOM_UNLIMITED_7D_FUP20', 'UNLI'),
('f2938dc9-1a60-47d1-8c4f-7aab638b559e', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 60.0, 15, 50.35, '', 'WW_901O_STACK_ONEOFF_DOM_UNLIMITED_15D_FUP30', 'UNLI'),
('1978b6d5-b4a0-421f-a414-84f08accfcb4', '4efd99a5-16fc-48a1-97d8-98b4b2a90070', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_DOM_UNLIMITED_30D_FUP60', 'UNLI'),

-- Réunion

('0061627c-acb9-419a-9412-861ec0dbe0b0', 'cd35dcc4-dc9d-4f6a-8818-7f262d933276', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_REUNION_3GB_15D', 'Go'),
('8f9ba9e1-36b4-48bf-a4b3-7293f8e2cf29', 'cd35dcc4-dc9d-4f6a-8818-7f262d933276', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_REUNION_10GB_30D', 'Go'),

-- Saint-Barthélemy

('e9b1e879-ca09-4378-ad85-69a5bcda9171', '57a98d28-3af6-4ee3-9b4a-27d0e44f41a6', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_S-BARTHELEMY_3GB_15D', 'Go'),

-- Saint-Martin

('2c318add-dfec-4d04-b238-9ec38524310f', '8d3484bd-f560-419e-ae65-a43236eb7754', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_S-MARTIN_1GB_7D', 'Go'),
('123eedd8-caf8-494b-8e2f-8db64ec980bd', '8d3484bd-f560-419e-ae65-a43236eb7754', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_S-MARTIN_3GB_15D', 'Go'),

-- Samoa

('281f0284-1721-413e-968c-539bb6828f94', '90e23d02-e342-490a-8353-c2c85145d7b3', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_SAMOA_1GB_7D', 'Go'),
('93105069-972f-46b9-b419-43aabcb6dc32', '90e23d02-e342-490a-8353-c2c85145d7b3', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_SAMOA_3GB_15D', 'Go'),

-- Scandinavie

('aabc0cd1-7265-467b-89a8-535796c2778f', '4b5f225e-3828-46bc-86c9-5bdef91d2e86', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_SCANDINAVIA_3GB_15D', 'Go'),
('14f46a70-e1e7-44fd-9735-ec3f8d21113c', '4b5f225e-3828-46bc-86c9-5bdef91d2e86', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_SCANDINAVIA_10GB_30D', 'Go'),
('4fa54878-44db-4a60-a658-3ae848966899', '4b5f225e-3828-46bc-86c9-5bdef91d2e86', 50.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_SCANDINAVIA_50GB_30D', 'Go'),

-- Serbie

('8549d314-3df2-45d0-8d57-e80c96df6f48', '7e713e18-46ed-45d2-b54e-bf087123ab60', 3.0, 15, 6.65, '', 'WW_901O_STACK_ONEOFF_SERBIA_3GB_15D', 'Go'),
('faffa26a-eecd-4fda-a99f-85a528575369', '7e713e18-46ed-45d2-b54e-bf087123ab60', 10.0, 7, 12.35, '', 'WW_901O_STACK_ONEOFF_SERBIA_10GB_7D', 'Go'),
('b66c02f1-2ab2-4d53-b5b8-5b572f8a746d', '7e713e18-46ed-45d2-b54e-bf087123ab60', 10.0, 30, 14.25, '', 'WW_901O_STACK_ONEOFF_SERBIA_10GB_30D', 'Go'),
('4e7d10f2-1185-416a-bae1-5087cf3bc4cb', '7e713e18-46ed-45d2-b54e-bf087123ab60', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_SERBIA_25GB_30D', 'Go'),
('c4868888-8c47-47f2-be46-7b0899bb3970', '7e713e18-46ed-45d2-b54e-bf087123ab60', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_SERBIA_UNLIMITED_7D_FUP20', 'UNLI'),
('5b61ca6a-9b99-453e-a584-d0f301c159de', '7e713e18-46ed-45d2-b54e-bf087123ab60', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_SERBIA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Seychelles

('faf1d23c-26dc-4131-8400-29181860b531', '57884e9b-f978-4090-bce4-75b6e93b3feb', 1.0, 7, 7.6, '', 'WW_901O_STACK_ONEOFF_SEYCHELLES_1GB_7D', 'Go'),
('88f58440-9562-40ad-8403-5dccba5404e9', '57884e9b-f978-4090-bce4-75b6e93b3feb', 3.0, 15, 15.2, '', 'WW_901O_STACK_ONEOFF_SEYCHELLES_3GB_15D', 'Go'),
('85e28636-aa91-46d0-8c58-55f8466e8347', '57884e9b-f978-4090-bce4-75b6e93b3feb', 10.0, 7, 30.4, '', 'WW_901O_STACK_ONEOFF_SEYCHELLES_10GB_7D', 'Go'),
('771d0cb2-c59f-4130-bdac-6f23a106d19e', '57884e9b-f978-4090-bce4-75b6e93b3feb', 10.0, 30, 33.25, '', 'WW_901O_STACK_ONEOFF_SEYCHELLES_10GB_30D', 'Go'),

-- Sierra Leone

('8aef9093-bde4-4987-a10a-00d0de5d0452', '3d9541fe-8d81-4733-834a-9d94668fa9fe', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_SIERRALEONE_1GB_7D', 'Go'),
('ee93f073-73b4-4854-b875-1e08a1a61c2c', '3d9541fe-8d81-4733-834a-9d94668fa9fe', 3.0, 15, 18.05, '', 'WW_901O_STACK_ONEOFF_SIERRALEONE_3GB_15D', 'Go'),
('82e01d4f-4f28-47a7-8675-f62288b8fadf', '3d9541fe-8d81-4733-834a-9d94668fa9fe', 10.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_SIERRALEONE_10GB_30D', 'Go'),

-- Singapour

('0766ce4e-aecd-44bc-8d28-e49ddece09bf', '67e347cb-a6e4-4e87-a714-179bba2d6829', 1.0, 7, 2.85, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_1GB_7D', 'Go'),
('1003f516-9588-4819-99aa-d09fc2673e3d', '67e347cb-a6e4-4e87-a714-179bba2d6829', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_3GB_15D', 'Go'),
('495ade42-34fc-4135-b2ac-c3e115fbe741', '67e347cb-a6e4-4e87-a714-179bba2d6829', 10.0, 7, 10.45, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_10GB_7D', 'Go'),
('82e59a08-432a-4b7d-a871-f2dbd0b23ab5', '67e347cb-a6e4-4e87-a714-179bba2d6829', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_10GB_30D', 'Go'),
('a3e894d0-0d41-4f21-bea2-e92655a3a897', '67e347cb-a6e4-4e87-a714-179bba2d6829', 20.0, 2, 8.55, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_UNLIMITED_2D_FUP10', 'UNLI'),
('2c4eabf7-d46b-4eb9-9c02-f7a35fd98912', '67e347cb-a6e4-4e87-a714-179bba2d6829', 25.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_25GB_30D', 'Go'),
('425137f0-b33f-45ae-bd52-18258478155d', '67e347cb-a6e4-4e87-a714-179bba2d6829', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_UNLIMITED_7D_FUP20', 'UNLI'),
('f28b4cad-6e50-4144-8278-36299782e54c', '67e347cb-a6e4-4e87-a714-179bba2d6829', 60.0, 15, 33.25, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_UNLIMITED_15D_FUP30', 'UNLI'),
('abcdf9ad-e5a6-4204-b6e2-4a4164877d11', '67e347cb-a6e4-4e87-a714-179bba2d6829', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_SINGAPORE_UNLIMITED_30D_FUP60', 'UNLI'),

-- Slovaquie

('4265a098-4c48-4dce-a475-6ad19fe8a806', '66ec6adb-dd58-479f-8547-cfb41e664528', 3.0, 15, 4.75, '', 'WW_901O_STACK_ONEOFF_SLOVAKIA_3GB_15D', 'Go'),
('bbe2c731-6f6d-42ad-beb5-014d0fa8664a', '66ec6adb-dd58-479f-8547-cfb41e664528', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_SLOVAKIA_10GB_7D', 'Go'),
('cd786475-bc0b-456a-985c-93e10ced34be', '66ec6adb-dd58-479f-8547-cfb41e664528', 10.0, 30, 9.5, '', 'WW_901O_STACK_ONEOFF_SLOVAKIA_10GB_30D', 'Go'),
('57f2a289-3015-4abc-872d-10c2b3d51f17', '66ec6adb-dd58-479f-8547-cfb41e664528', 25.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_SLOVAKIA_25GB_30D', 'Go'),
('9782566e-98af-409a-aac7-a7298321dcba', '66ec6adb-dd58-479f-8547-cfb41e664528', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_SLOVAKIA_UNLIMITED_7D_FUP20', 'UNLI'),
('e61b0ef1-6ae5-41e4-b70f-963d1d4463f8', '66ec6adb-dd58-479f-8547-cfb41e664528', 60.0, 15, 34.2, '', 'WW_901O_STACK_ONEOFF_SLOVAKIA_UNLIMITED_15D_FUP30', 'UNLI'),
('bdfe87ad-c74c-446e-b9ff-1c70b6b9362c', '66ec6adb-dd58-479f-8547-cfb41e664528', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_SLOVAKIA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Slovénie

('12c55a35-efb4-41d6-839a-e330cfdaf935', '0e795b5a-64a6-47de-82ff-11c8eff90077', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_SLOVENIA_3GB_15D', 'Go'),
('531fc087-b12d-4d45-95f8-5544c87c8b0b', '0e795b5a-64a6-47de-82ff-11c8eff90077', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_SLOVENIA_10GB_7D', 'Go'),
('c83ff411-9d69-4a4e-a0ee-9bc1f03ec0e2', '0e795b5a-64a6-47de-82ff-11c8eff90077', 10.0, 30, 12.35, '', 'WW_901O_STACK_ONEOFF_SLOVENIA_10GB_30D', 'Go'),

-- Soudan

('5cd1ba6d-5adc-4cf7-acf6-4a15f7679f8a', '18944f45-0a29-4a74-b05c-2edf9002c388', 3.0, 15, 16.15, '', 'WW_901O_STACK_ONEOFF_SUDAN_3GB_15D', 'Go'),
('e6a507e1-bf66-4366-aeae-19ee42736718', '18944f45-0a29-4a74-b05c-2edf9002c388', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_SUDAN_10GB_30D', 'Go'),

-- Soudan du Sud

('76c83f16-096d-43a2-90cf-8b201cdf074c', 'c8f5dddd-43ba-4e19-8da8-d0db121694ce', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_SOUTHSUDAN_1GB_7D', 'Go'),
('8e8fe611-99c3-4f6e-9838-5f28b3b932bf', 'c8f5dddd-43ba-4e19-8da8-d0db121694ce', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_SOUTHSUDAN_3GB_15D', 'Go'),

-- Sri Lanka

('87db52bd-7aba-4733-adf8-baf9078f5239', '09925e99-4237-47de-acd4-f9c83f739e0f', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_SRILANKA_3GB_15D', 'Go'),
('0c8e11fc-4e7b-4c44-9fd2-48a97e345bee', '09925e99-4237-47de-acd4-f9c83f739e0f', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_SRILANKA_10GB_7D', 'Go'),
('3b2f3d2a-6396-4b73-96b6-c087855219dd', '09925e99-4237-47de-acd4-f9c83f739e0f', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_SRILANKA_10GB_30D', 'Go'),
('e0362614-c0c1-4d32-a11d-278545892b78', '09925e99-4237-47de-acd4-f9c83f739e0f', 40.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_SRILANKA_UNLIMITED_7D_FUP20', 'UNLI'),
('4f7cc58a-a3e0-471b-9664-4ea43f7ef309', '09925e99-4237-47de-acd4-f9c83f739e0f', 50.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_SRILANKA_50GB_30D', 'Go'),
('95211e54-2614-4b67-959c-ad1fad26a952', '09925e99-4237-47de-acd4-f9c83f739e0f', 60.0, 15, 42.75, '', 'WW_901O_STACK_ONEOFF_SRILANKA_UNLIMITED_15D_FUP30', 'UNLI'),
('46adc5f3-d742-4c91-91c9-bac422e2eace', '09925e99-4237-47de-acd4-f9c83f739e0f', 120.0, 30, 61.75, '', 'WW_901O_STACK_ONEOFF_SRILANKA_UNLIMITED_30D_FUP60', 'UNLI'),

-- Suisse

('7bb8c39d-fb16-4226-a2b5-a295868b7942', '66e3a4ba-392a-41a0-af87-ccb569fb02a2', 3.0, 30, 6.17, '', 'WW_901O_STACK_ONEOFF_SWITZERLAND_3GB_30D', 'Go'),
('98dc89d5-559f-4338-a939-de1289e798bb', '66e3a4ba-392a-41a0-af87-ccb569fb02a2', 10.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_SWITZERLAND_10GB_7D', 'Go'),
('afbef729-871b-4065-9363-5a959b286daa', '66e3a4ba-392a-41a0-af87-ccb569fb02a2', 10.0, 30, 10.45, '', 'WW_901O_STACK_ONEOFF_SWITZERLAND_10GB_30D', 'Go'),
('10081a61-ae5e-42d7-a94e-c7064520f754', '66e3a4ba-392a-41a0-af87-ccb569fb02a2', 25.0, 30, 22.8, '', 'WW_901O_STACK_ONEOFF_SWITZERLAND_25GB_30D', 'Go'),
('5fc90077-5028-4616-9b4d-2938437da673', '66e3a4ba-392a-41a0-af87-ccb569fb02a2', 50.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_SWITZERLAND_50GB_30D', 'Go'),
('dab0bee0-64cf-4b67-9330-f542a75bedf8', '66e3a4ba-392a-41a0-af87-ccb569fb02a2', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_SWITZERLAND_UNLIMITED_15D_FUP30', 'UNLI'),
('b6ee7589-6198-4b64-9679-5a64e74997f4', '66e3a4ba-392a-41a0-af87-ccb569fb02a2', 120.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_SWITZERLAND_UNLIMITED_30D_FUP60', 'UNLI'),

-- Suriname

('24dc5ce9-4fdd-4852-8fe3-29dd9b3fefc0', 'd3844292-5c75-4af2-8c36-21d59ca7c4ac', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_SURINAME_1GB_7D', 'Go'),
('4fb10113-1ae3-4cef-8fe4-26f5669c6447', 'd3844292-5c75-4af2-8c36-21d59ca7c4ac', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_SURINAME_3GB_15D', 'Go'),
('cf69787a-1579-4fe0-a6e3-8665e6f0b33e', 'd3844292-5c75-4af2-8c36-21d59ca7c4ac', 10.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_SURINAME_10GB_7D', 'Go'),
('74413547-3147-403b-9b54-afa0eebe2741', 'd3844292-5c75-4af2-8c36-21d59ca7c4ac', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_SURINAME_10GB_30D', 'Go'),

-- Suède

('320236c1-064e-40e8-8d84-a712537dd207', '797526bb-9f4f-4325-8f80-856fb2496c3b', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_SWEDEN_3GB_15D', 'Go'),
('02046805-2ed0-4281-b867-08cb084b7698', '797526bb-9f4f-4325-8f80-856fb2496c3b', 10.0, 7, 9.5, '', 'WW_901O_STACK_ONEOFF_SWEDEN_10GB_7D', 'Go'),
('3b8d8a97-609a-41a7-a4e5-d7e571578b75', '797526bb-9f4f-4325-8f80-856fb2496c3b', 10.0, 30, 11.4, '', 'WW_901O_STACK_ONEOFF_SWEDEN_10GB_30D', 'Go'),
('297c257a-18ba-4500-b62c-0ab9127b9e6c', '797526bb-9f4f-4325-8f80-856fb2496c3b', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_SWEDEN_UNLIMITED_7D_FUP20', 'UNLI'),
('321a3c03-ff4f-47da-9275-5b62730690db', '797526bb-9f4f-4325-8f80-856fb2496c3b', 50.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_SWEDEN_50GB_30D', 'Go'),
('b7d51c33-3d9a-4df6-8a8c-9eb23833e095', '797526bb-9f4f-4325-8f80-856fb2496c3b', 60.0, 15, 27.55, '', 'WW_901O_STACK_ONEOFF_SWEDEN_UNLIMITED_15D_FUP30', 'UNLI'),
('436a13a2-0e19-4602-b894-3c6405fbc316', '797526bb-9f4f-4325-8f80-856fb2496c3b', 120.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_SWEDEN_UNLIMITED_30D_FUP60', 'UNLI'),

-- Sénégal

('b867594a-a6dc-4739-a36b-7afdae2206c2', '20647fac-7e92-481f-a6a7-ca1e8c451910', 1.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_SENEGAL_1GB_7D', 'Go'),
('27bfa7b3-d43a-404e-a660-0bb2a26018fb', '20647fac-7e92-481f-a6a7-ca1e8c451910', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_SENEGAL_3GB_15D', 'Go'),
('f31092b1-6db4-4cc0-89c4-9008f79fa77c', '20647fac-7e92-481f-a6a7-ca1e8c451910', 10.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_SENEGAL_10GB_30D', 'Go'),
('2d2b178a-15d3-4a5d-9de9-6a1ca41a64d0', '20647fac-7e92-481f-a6a7-ca1e8c451910', 25.0, 30, 56.05, '', 'WW_901O_STACK_ONEOFF_SENEGAL_25GB_30D', 'Go'),
('d7fcf1d9-06d4-4b66-8a96-e205d8336ae5', '20647fac-7e92-481f-a6a7-ca1e8c451910', 40.0, 7, 41.8, '', 'WW_901O_STACK_ONEOFF_SENEGAL_UNLIMITED_7D_FUP20', 'UNLI'),

-- Tadjikistan

('7a027f76-efff-40db-a9b5-49a0ae71c3ee', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_1GB_7D', 'Go'),
('01b2b2f3-7d7f-43b5-9518-fa5b4e33c015', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_3GB_15D', 'Go'),
('590af1c7-32c7-437b-ada2-41e8f7b92b68', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 10.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_10GB_7D', 'Go'),
('79cc01c7-fdbf-416c-a6bd-af8bd8ee71cd', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 10.0, 30, 19.0, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_10GB_30D', 'Go'),
('27fdbdbe-9dad-4422-b38f-0e1e9a68d29f', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_25GB_30D', 'Go'),
('47c1e6d3-5949-490e-9ceb-a140341d0dd0', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 50.0, 7, 34.2, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_UNLIMITED_7D_FUP25', 'UNLI'),
('6570c193-d440-41d3-be10-7c23c4ec732b', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_UNLIMITED_15D_FUP30', 'UNLI'),
('9bb5ce1b-cadf-4c61-a870-f3d02ff130af', '92a5002d-021b-41f0-aa54-b6d6350a3ce8', 120.0, 30, 84.55, '', 'WW_901O_STACK_ONEOFF_TAJIKISTAN_UNLIMITED_30D_FUP60', 'UNLI'),

-- Tanzanie

('be9dc282-0d05-48ad-8b0c-fc6a927fd30e', 'b71ac246-e162-4d99-a087-bf499b50b789', 1.0, 7, 8.55, '', 'WW_901O_STACK_ONEOFF_TANZANIA_1GB_7D', 'Go'),
('92164222-ba0b-41de-a158-81e044289222', 'b71ac246-e162-4d99-a087-bf499b50b789', 3.0, 15, 17.1, '', 'WW_901O_STACK_ONEOFF_TANZANIA_3GB_15D', 'Go'),
('e3a696d4-f91c-4b5a-a6f7-aec411e4b58c', 'b71ac246-e162-4d99-a087-bf499b50b789', 10.0, 8, 34.2, '', 'WW_901O_STACK_ONEOFF_TANZANIA_10GB_8D', 'Go'),

-- Taïwan

('6391a9c2-4ca9-41c9-a2fa-0be49d3824f3', '4b712600-a89d-45bf-a2e5-227208769c2c', 1.0, 7, 2.85, '', 'WW_901O_STACK_ONEOFF_TAIWAN_1GB_7D', 'Go'),
('04681511-6f11-4f08-98ff-46bf0175046e', '4b712600-a89d-45bf-a2e5-227208769c2c', 3.0, 7, 5.7, '', 'WW_901O_STACK_ONEOFF_TAIWAN_3GB_7D', 'Go'),
('b473766c-5c46-48c4-985b-75bad5275a1c', '4b712600-a89d-45bf-a2e5-227208769c2c', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_TAIWAN_10GB_7D', 'Go'),
('9cf0c084-f09f-41bf-9059-9814c06222a6', '4b712600-a89d-45bf-a2e5-227208769c2c', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_TAIWAN_10GB_30D', 'Go'),
('fc102216-8b50-4ee5-8e1a-e9313de0ee4d', '4b712600-a89d-45bf-a2e5-227208769c2c', 25.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_TAIWAN_25GB_30D', 'Go'),
('9328fec5-05fd-4ceb-9556-7065b2f76320', '4b712600-a89d-45bf-a2e5-227208769c2c', 40.0, 7, 20.9, '', 'WW_901O_STACK_ONEOFF_TAIWAN_UNLIMITED_7D_FUP20', 'UNLI'),
('bd5ee2c4-82b4-4cb8-8dfc-cab9be262e24', '4b712600-a89d-45bf-a2e5-227208769c2c', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_TAIWAN_UNLIMITED_15D_FUP30', 'UNLI'),
('a5f3f051-8766-42bd-bf40-a5106aaf49b0', '4b712600-a89d-45bf-a2e5-227208769c2c', 120.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_TAIWAN_UNLIMITED_30D_FUP60', 'UNLI'),

-- Tchéquie

('71537df1-cfdc-4069-bd8c-3ccd5571ec5d', '44ea41be-40ed-4339-8bff-de45994a77a2', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_CZECHIA_3GB_15D', 'Go'),
('0077adf8-239b-454d-9634-029b0011acfb', '44ea41be-40ed-4339-8bff-de45994a77a2', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_CZECHIA_10GB_7D', 'Go'),
('bdee1e09-fde7-4faa-8010-4cd75cdec19c', '44ea41be-40ed-4339-8bff-de45994a77a2', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_CZECHIA_10GB_30D', 'Go'),
('926119d1-a74e-4a93-8d31-5f742f65697a', '44ea41be-40ed-4339-8bff-de45994a77a2', 25.0, 30, 24.7, '', 'WW_901O_STACK_ONEOFF_CZECHIA_25GB_30D', 'Go'),
('a39be41a-0330-4485-8478-1e7b2b63ccfc', '44ea41be-40ed-4339-8bff-de45994a77a2', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_CZECHIA_UNLIMITED_7D_FUP20', 'UNLI'),
('2d6d6efe-8be7-4315-ad06-afabe1ce55d2', '44ea41be-40ed-4339-8bff-de45994a77a2', 50.0, 30, 34.2, '', 'WW_901O_STACK_ONEOFF_CZECHIA_50GB_30D', 'Go'),
('5a04bcef-d774-404a-b532-edd3b9c42e45', '44ea41be-40ed-4339-8bff-de45994a77a2', 60.0, 15, 34.2, '', 'WW_901O_STACK_ONEOFF_CZECHIA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Thaïlande

('4fa37269-ea52-4142-8371-5fa7bd1ce84c', 'ccda7780-bccf-4df5-866d-2512fe061197', 1.0, 7, 3.7, '', 'WW_901O_STACK_ONEOFF_THAILAND_1GB_7D', 'Go'),
('eef4b4d8-f1e6-471d-83a4-1a96b385e54b', 'ccda7780-bccf-4df5-866d-2512fe061197', 3.0, 15, 6.55, '', 'WW_901O_STACK_ONEOFF_THAILAND_3GB_15D', 'Go'),
('47de1b03-cd47-4610-a16c-b36a2fe97cef', 'ccda7780-bccf-4df5-866d-2512fe061197', 10.0, 7, 11.3, '', 'WW_901O_STACK_ONEOFF_THAILAND_10GB_7D', 'Go'),
('9891dd04-d385-4a0a-8729-00b19c71e0b3', 'ccda7780-bccf-4df5-866d-2512fe061197', 10.0, 30, 13.21, '', 'WW_901O_STACK_ONEOFF_THAILAND_10GB_30D', 'Go'),
('6907c446-908c-4410-b0d2-72f19a39f511', 'ccda7780-bccf-4df5-866d-2512fe061197', 25.0, 30, 23.65, '', 'WW_901O_STACK_ONEOFF_THAILAND_25GB_30D', 'Go'),
('82c2c4d5-f6e6-4f1f-a546-5e52f3907029', 'ccda7780-bccf-4df5-866d-2512fe061197', 50.0, 7, 21.75, '', 'WW_901O_STACK_ONEOFF_THAILAND_UNLIMITED_7D_FUP25', 'UNLI'),
('e9f2fc19-f1f3-455e-b992-0eeb0c2b3a21', 'ccda7780-bccf-4df5-866d-2512fe061197', 60.0, 15, 45.6, '', 'WW_901O_STACK_ONEOFF_THAILAND_UNLIMITED_15D_FUP30', 'UNLI'),
('b7bedf36-04a1-4f1f-bd4c-af11aec5f916', 'ccda7780-bccf-4df5-866d-2512fe061197', 120.0, 30, 55.0, '', 'WW_901O_STACK_ONEOFF_THAILAND_UNLIMITED_30D_FUP60', 'UNLI'),

-- Togo

('eb116a56-a9d7-41d8-9c5c-76c54e2cc4ef', 'c0e8360d-63e2-4005-80e5-c9f4cddf64f9', 1.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_TOGO_1GB_7D', 'Go'),

-- Tonga

('683a4c9a-248a-41e9-b785-596e7dab0427', 'f5dc92b9-1137-40ea-8031-7f097fe7a5e1', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_TONGA_3GB_15D', 'Go'),

-- Trinité-et-Tobago

('d1cf3fb0-2f69-45d2-8708-e262b30300c0', 'd4b597b3-46da-429b-9de6-b2110f2fb552', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_TRINIDAD_1GB_7D', 'Go'),
('a44b4d45-ad15-4bb6-84ad-31441b8837a0', 'd4b597b3-46da-429b-9de6-b2110f2fb552', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_TRINIDAD_3GB_15D', 'Go'),
('27d692be-ae54-4401-831d-4821a8f196aa', 'd4b597b3-46da-429b-9de6-b2110f2fb552', 10.0, 7, 26.6, '', 'WW_901O_STACK_ONEOFF_TRINIDAD_10GB_7D', 'Go'),
('d404e5c6-19df-4a0b-b550-2fb48722c96c', 'd4b597b3-46da-429b-9de6-b2110f2fb552', 10.0, 30, 32.3, '', 'WW_901O_STACK_ONEOFF_TRINIDAD_10GB_30D', 'Go'),

-- Tunisie

('207e6890-fae0-410c-ae55-6842387620ed', '9331f629-cc33-4f38-8294-4757e8627b74', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_TUNISIA_1GB_7D', 'Go'),
('920aba6d-6661-4aad-92a5-e600233aac74', '9331f629-cc33-4f38-8294-4757e8627b74', 3.0, 15, 7.6, '', 'WW_901O_STACK_ONEOFF_TUNISIA_3GB_15D', 'Go'),
('d210ddbb-edc6-4035-8735-ab53ed22b957', '9331f629-cc33-4f38-8294-4757e8627b74', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_TUNISIA_10GB_7D', 'Go'),
('61222e0d-38d2-4c60-9244-7afed35b9299', '9331f629-cc33-4f38-8294-4757e8627b74', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_TUNISIA_10GB_30D', 'Go'),
('8728f82f-03b4-4ef5-9a5d-a6161ef9e432', '9331f629-cc33-4f38-8294-4757e8627b74', 25.0, 30, 36.1, '', 'WW_901O_STACK_ONEOFF_TUNISIA_25GB_30D', 'Go'),
('b1a90df3-b0b1-44b0-a221-9b5fa66e8d3d', '9331f629-cc33-4f38-8294-4757e8627b74', 40.0, 7, 31.35, '', 'WW_901O_STACK_ONEOFF_TUNISIA_UNLIMITED_7D_FUP20', 'UNLI'),
('8b22a19f-4c14-4fcf-acb4-ca219b5e75a1', '9331f629-cc33-4f38-8294-4757e8627b74', 60.0, 15, 46.55, '', 'WW_901O_STACK_ONEOFF_TUNISIA_UNLIMITED_15D_FUP30', 'UNLI'),

-- Turquie

('03cfd0d9-d1f4-412c-8ae1-dfc1f1188ff6', 'ebaff4c3-2062-4908-8641-c00568028c7e', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_TURKEY_1GB_7D', 'Go'),
('bf03fcdc-bc93-40e6-a998-de07692a4870', 'ebaff4c3-2062-4908-8641-c00568028c7e', 3.0, 30, 6.65, '', 'WW_901O_STACK_ONEOFF_TURKEY_3GB_30D', 'Go'),
('aafdacb4-a2a8-462f-b42c-bbf5988839b6', 'ebaff4c3-2062-4908-8641-c00568028c7e', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_TURKEY_10GB_7D', 'Go'),
('bd27888a-ed02-4f8e-91ba-96574de00531', 'ebaff4c3-2062-4908-8641-c00568028c7e', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_TURKEY_10GB_30D', 'Go'),
('8b5d8610-0c9c-495d-aa02-534a38c515dd', 'ebaff4c3-2062-4908-8641-c00568028c7e', 14.0, 1, 8.55, '', 'WW_901O_STACK_ONEOFF_TURKEY_UNLIMITED_1D_FUP7', 'UNLI'),
('ab9de4e2-c369-429e-aa0f-59d1632b313e', 'ebaff4c3-2062-4908-8641-c00568028c7e', 25.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_TURKEY_25GB_30D', 'Go'),
('b0fa6cb1-ad07-49b9-a741-a200e783ef09', 'ebaff4c3-2062-4908-8641-c00568028c7e', 40.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_TURKEY_UNLIMITED_7D_FUP20', 'UNLI'),
('9c1a8ac9-49ca-401a-8ad3-7951cb1ddb74', 'ebaff4c3-2062-4908-8641-c00568028c7e', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_TURKEY_UNLIMITED_15D_FUP30', 'UNLI'),
('e095122c-3a99-4de6-b763-2e55a267060b', 'ebaff4c3-2062-4908-8641-c00568028c7e', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_TURKEY_UNLIMITED_30D_FUP60', 'UNLI'),

-- USA & Canada

('b58d7b64-9efd-4c41-99c1-fad5aef6d001', 'e4197d22-7677-40b4-b61a-ddf6fc3d0aec', 40.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_USACAN_UNLIMITED_7D_FUP20', 'UNLI'),
('c4edd664-d568-4df5-a402-43a6fbaaaa60', 'e4197d22-7677-40b4-b61a-ddf6fc3d0aec', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_USACAN_UNLIMITED_15D_FUP30', 'UNLI'),
('f8b7c087-da5a-4cce-a802-2845b0ae7c1a', 'e4197d22-7677-40b4-b61a-ddf6fc3d0aec', 120.0, 30, 61.75, '', 'WW_901O_STACK_ONEOFF_USACAN_UNLIMITED_30D_FUP60', 'UNLI'),

-- Ukraine

('9009b30c-f938-4889-b504-50046a7f5ef2', 'af28a2cc-8c89-4347-82bf-14d4ccf4373d', 10.0, 30, 7.6, '', 'WW_901O_STACK_ONEOFF_UKRAINE_10GB_30D', 'Go'),
('c8d529d7-582f-41a1-882b-370f2044d0f4', 'af28a2cc-8c89-4347-82bf-14d4ccf4373d', 40.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_UKRAINE_UNLIMITED_7D_FUP20', 'UNLI'),
('95a21fcb-528f-4bf1-994c-f7a16691a2f0', 'af28a2cc-8c89-4347-82bf-14d4ccf4373d', 50.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_UKRAINE_50GB_30D', 'Go'),
('eb434721-bc0d-4869-8e3b-b5e9673ef5a9', 'af28a2cc-8c89-4347-82bf-14d4ccf4373d', 120.0, 30, 27.55, '', 'WW_901O_STACK_ONEOFF_UKRAINE_UNLIMITED_30D_FUP60', 'UNLI'),

-- Uruguay

('57fbb82a-8b9c-4822-9319-3fe74a629725', 'f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_URUGUAY_1GB_7D', 'Go'),
('ba3bf403-790c-4e9c-adb6-c5bd5068eca0', 'f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 3.0, 15, 8.55, '', 'WW_901O_STACK_ONEOFF_URUGUAY_3GB_15D', 'Go'),
('4bde4885-9c45-4da7-82be-e434a684d92e', 'f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_URUGUAY_10GB_7D', 'Go'),
('dc17c316-a522-4245-8581-820b6992481c', 'f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 10.0, 30, 20.9, '', 'WW_901O_STACK_ONEOFF_URUGUAY_10GB_30D', 'Go'),
('8452ad37-1c1a-41e1-a44a-aa15db59e66d', 'f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_URUGUAY_25GB_30D', 'Go'),
('9b9390cd-6ac9-477b-b35c-a2a7300764d4', 'f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 40.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_URUGUAY_UNLIMITED_7D_FUP20', 'UNLI'),
('f00dccd1-d0e1-4e60-aa9c-8de00708957d', 'f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 120.0, 30, 83.6, '', 'WW_901O_STACK_ONEOFF_URUGUAY_UNLIMITED_30D_FUP60', 'UNLI'),

-- Vanuatu

('37f77a29-eaf4-46c3-86aa-ffdd8262d889', '9ba71685-57e6-48c9-b6e2-e660851d15ee', 1.0, 7, 17.1, '', 'WW_901O_STACK_ONEOFF_VANUATU_1GB_7D', 'Go'),
('15d57601-d4db-4f0e-bdda-b8207315cf88', '9ba71685-57e6-48c9-b6e2-e660851d15ee', 3.0, 15, 32.3, '', 'WW_901O_STACK_ONEOFF_VANUATU_3GB_15D', 'Go'),

-- Venezuela

('f1009497-f7d7-4ec9-82bd-d6eb97190b13', 'fc8adfb9-fe36-45c0-8d06-69bfd508c899', 1.0, 7, 6.65, '', 'WW_901O_STACK_ONEOFF_VENEZUELA_1GB_7D', 'Go'),
('0dd542ae-f155-4881-9cbf-bc462f234cd4', 'fc8adfb9-fe36-45c0-8d06-69bfd508c899', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_VENEZUELA_3GB_15D', 'Go'),
('96e61c1c-48b1-470c-990b-ba7b55217793', 'fc8adfb9-fe36-45c0-8d06-69bfd508c899', 10.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_VENEZUELA_10GB_30D', 'Go'),
('03a27457-f13d-49ed-b4d0-2c316529948c', 'fc8adfb9-fe36-45c0-8d06-69bfd508c899', 25.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_VENEZUELA_25GB_30D', 'Go'),

-- Vietnam

('a82bffc5-28f4-44df-a3c5-ac913fab7ac5', '03be8bc2-1e20-4482-8dc6-036064614db6', 3.0, 15, 6.55, '', 'WW_901O_STACK_ONEOFF_VIETNAM_3GB_15D', 'Go'),
('e63e0416-0b1e-4a18-990a-8ae09e0ef2a2', '03be8bc2-1e20-4482-8dc6-036064614db6', 10.0, 7, 10.36, '', 'WW_901O_STACK_ONEOFF_VIETNAM_10GB_7D', 'Go'),
('7b36cd55-bc84-4b0d-a072-646caca870e5', '03be8bc2-1e20-4482-8dc6-036064614db6', 10.0, 30, 12.25, '', 'WW_901O_STACK_ONEOFF_VIETNAM_10GB_30D', 'Go'),
('b44f6537-5024-42d6-87f1-53b8eb7bb586', '03be8bc2-1e20-4482-8dc6-036064614db6', 40.0, 7, 22.8, '', 'WW_901O_STACK_ONEOFF_VIETNAM_UNLIMITED_7D_FUP20', 'UNLI'),
('45c85cae-ad71-4409-ae19-fc56b6c878d6', '03be8bc2-1e20-4482-8dc6-036064614db6', 50.0, 30, 35.05, '', 'WW_901O_STACK_ONEOFF_VIETNAM_50GB_30D', 'Go'),
('187a4437-e2c7-4dca-b154-f163323ba146', '03be8bc2-1e20-4482-8dc6-036064614db6', 60.0, 15, 37.9, '', 'WW_901O_STACK_ONEOFF_VIETNAM_UNLIMITED_15D_FUP30', 'UNLI'),
('65c446ed-106e-4636-92dd-def44c5e9383', '03be8bc2-1e20-4482-8dc6-036064614db6', 120.0, 30, 52.15, '', 'WW_901O_STACK_ONEOFF_VIETNAM_UNLIMITED_30D_FUP60', 'UNLI'),

-- Zambie

('08a7cef5-a310-486e-8df8-b7b4bf1470ca', '4a0d10c5-4fe0-48a3-bc50-8e3e5047bbcd', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_ZAMBIA_1GB_7D', 'Go'),
('f51e9e2a-49d7-4b5b-8b66-9c9c24861c63', '4a0d10c5-4fe0-48a3-bc50-8e3e5047bbcd', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_ZAMBIA_3GB_15D', 'Go'),

-- Égypte

('a3d78229-6d29-4c17-bdef-d089cf249849', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 1.0, 30, 4.75, '', 'WW_901O_STACK_ONEOFF_EGYPT_1GB_30D', 'Go'),
('5a497c18-5b2d-4f27-8e12-74152cf53e22', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 3.0, 30, 8.55, '', 'WW_901O_STACK_ONEOFF_EGYPT_3GB_30D', 'Go'),
('a72aeff0-0878-4591-a0da-2fbae1c5853b', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 10.0, 7, 16.15, '', 'WW_901O_STACK_ONEOFF_EGYPT_10GB_7D', 'Go'),
('8f52fc93-31cd-4ddb-9565-98061626ea20', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 10.0, 30, 18.05, '', 'WW_901O_STACK_ONEOFF_EGYPT_10GB_30D', 'Go'),
('064c279a-c212-4761-8abb-43f5a1fbf5e1', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 25.0, 30, 37.05, '', 'WW_901O_STACK_ONEOFF_EGYPT_25GB_30D', 'Go'),
('043b954a-3af2-44a6-adfc-21b7f979c49c', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 50.0, 7, 27.55, '', 'WW_901O_STACK_ONEOFF_EGYPT_UNLIMITED_7D_FUP25', 'UNLI'),
('5a163e1f-2599-4c48-bcc9-da3d445460e5', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 60.0, 15, 41.8, '', 'WW_901O_STACK_ONEOFF_EGYPT_UNLIMITED_15D_FUP30', 'UNLI'),
('78084c58-1589-4240-9b48-157d68949a5d', 'df6771d7-ea09-42c4-9ff8-a752a462d64e', 120.0, 30, 65.55, '', 'WW_901O_STACK_ONEOFF_EGYPT_UNLIMITED_30D_FUP60', 'UNLI'),

-- Émirats arabes unis

('eb5511c3-c80b-46ed-afd0-f9c5a0ad2548', '4e141b22-bb56-406b-a0b5-42a48bf1af59', 1.0, 7, 4.75, '', 'WW_901O_STACK_ONEOFF_UAE_1GB_7D', 'Go'),
('01c655e5-a4c6-4f7d-9d87-21f17e8e6a93', '4e141b22-bb56-406b-a0b5-42a48bf1af59', 3.0, 15, 9.5, '', 'WW_901O_STACK_ONEOFF_UAE_3GB_15D', 'Go'),
('c843ee06-6d8c-437d-9cc5-572caf523ce1', '4e141b22-bb56-406b-a0b5-42a48bf1af59', 10.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_UAE_10GB_7D', 'Go'),
('9416eac4-9a17-47cd-aa8e-583005014ef1', '4e141b22-bb56-406b-a0b5-42a48bf1af59', 14.0, 1, 11.4, '', 'WW_901O_STACK_ONEOFF_UAE_UNLIMITED_1D_FUP7', 'UNLI'),
('9ef9bc36-3564-47f5-81ea-1b7981757c13', '4e141b22-bb56-406b-a0b5-42a48bf1af59', 25.0, 30, 46.55, '', 'WW_901O_STACK_ONEOFF_UAE_25GB_30D', 'Go'),
('83f2647c-61af-48d0-9002-51308a63df41', '4e141b22-bb56-406b-a0b5-42a48bf1af59', 40.0, 7, 34.2, '', 'WW_901O_STACK_ONEOFF_UAE_UNLIMITED_7D_FUP20', 'UNLI'),

-- Équateur

('3e8ebd8a-7c72-4632-90ce-ef4ca1ff5396', 'c0b05975-5b74-4d19-bf7b-6d6c93a562a2', 1.0, 30, 6.65, '', 'WW_901O_STACK_ONEOFF_ECUADOR_1GB_30D', 'Go'),
('5c8fe830-3897-4374-b254-9ae3922484a1', 'c0b05975-5b74-4d19-bf7b-6d6c93a562a2', 3.0, 15, 13.3, '', 'WW_901O_STACK_ONEOFF_ECUADOR_3GB_15D', 'Go'),
('ad952b7c-d5c4-470f-9527-b339665d5362', 'c0b05975-5b74-4d19-bf7b-6d6c93a562a2', 10.0, 30, 26.6, '', 'WW_901O_STACK_ONEOFF_ECUADOR_10GB_30D', 'Go'),

-- États-Unis & territoires

('33a38092-b54c-495d-b4a7-a14569d0c97c', '2a6b3054-99e6-4a24-b5ea-37a008934996', 1.0, 7, 3.8, '', 'WW_901O_STACK_ONEOFF_USA_1GB_7D', 'Go'),
('737884fb-4203-4467-9e2f-c4f2bf27b1c8', '2a6b3054-99e6-4a24-b5ea-37a008934996', 3.0, 15, 6.65, '', 'WW_901O_STACK_ONEOFF_USA_3GB_15D', 'Go'),
('34be8e5a-8e2c-49c5-9025-93c1784a222e', '2a6b3054-99e6-4a24-b5ea-37a008934996', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_USA_10GB_7D', 'Go'),
('c43650bd-df12-4538-8e75-8376d6afc1be', '2a6b3054-99e6-4a24-b5ea-37a008934996', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_USA_10GB_30D', 'Go'),
('75da561c-8e84-48fe-b00c-81ef8c2eb616', '2a6b3054-99e6-4a24-b5ea-37a008934996', 14.0, 1, 8.55, '', 'WW_901O_STACK_ONEOFF_USA_UNLIMITED_1D_FUP7', 'UNLI'),
('907e3185-abf6-4086-a702-d6141d0b6de5', '2a6b3054-99e6-4a24-b5ea-37a008934996', 25.0, 30, 30.4, '', 'WW_901O_STACK_ONEOFF_USA_25GB_30D', 'Go'),
('2a88118d-ff5b-4f80-8c60-6f4511974937', '2a6b3054-99e6-4a24-b5ea-37a008934996', 50.0, 7, 23.75, '', 'WW_901O_STACK_ONEOFF_USA_UNLIMITED_7D_FUP25', 'UNLI'),
('736b03d5-442e-486b-af93-51974501c83a', '2a6b3054-99e6-4a24-b5ea-37a008934996', 50.0, 30, 45.6, '', 'WW_901O_STACK_ONEOFF_USA_50GB_30D', 'Go'),
('589c577e-696c-49e5-9ca3-bee373882005', '2a6b3054-99e6-4a24-b5ea-37a008934996', 60.0, 15, 37.05, '', 'WW_901O_STACK_ONEOFF_USA_UNLIMITED_15D_FUP30', 'UNLI'),
('023f8dfe-483d-46d1-9ec6-9ea0a85d57bb', '2a6b3054-99e6-4a24-b5ea-37a008934996', 120.0, 30, 61.75, '', 'WW_901O_STACK_ONEOFF_USA_UNLIMITED_30D_FUP60', 'UNLI'),
('3d4b2f1f-7354-4863-ba57-d59b716afd2f', '2a6b3054-99e6-4a24-b5ea-37a008934996', 500.0, 1, 2.75, '', 'WW_901O_STACK_ONEOFF_USA_500MB_1D', 'Mo'),

-- Éthiopie

('d6f7c965-3061-4051-ac0e-ba5f6a89bd1c', '3e60394e-1329-4788-9578-d6f600fc9ae5', 1.0, 7, 18.05, '', 'WW_901O_STACK_ONEOFF_ETHIOPIA_1GB_7D', 'Go'),
('5b8142c7-5de8-43e4-a7cf-0003c1001933', '3e60394e-1329-4788-9578-d6f600fc9ae5', 3.0, 15, 36.1, '', 'WW_901O_STACK_ONEOFF_ETHIOPIA_3GB_15D', 'Go'),

-- Îles Féroé

('5df92778-afd1-4584-be8d-f836b339e7d6', '36129492-21ba-443f-9197-a7623a997c2c', 3.0, 15, 5.7, '', 'WW_901O_STACK_ONEOFF_FAROE_3GB_15D', 'Go'),
('9b9cbc24-8c94-4de0-beda-1800e5d6fbec', '36129492-21ba-443f-9197-a7623a997c2c', 10.0, 7, 11.4, '', 'WW_901O_STACK_ONEOFF_FAROE_10GB_7D', 'Go'),
('432e7266-abdd-4928-8084-5aad0487a19c', '36129492-21ba-443f-9197-a7623a997c2c', 10.0, 30, 13.3, '', 'WW_901O_STACK_ONEOFF_FAROE_10GB_30D', 'Go'),
('4a45edb6-12e5-42d2-b588-95857c8cf712', '36129492-21ba-443f-9197-a7623a997c2c', 25.0, 30, 24.7, '', 'WW_901O_STACK_ONEOFF_FAROE_25GB_30D', 'Go');

INSERT INTO discounts (offer_id, type, value, active, starts_at, ends_at) VALUES
('6d14319f-7bf8-45ad-a356-02756df900bd', 'fixed', 10.0, true, NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days'),
('db65bf75-f9b0-4948-828a-ed39e2ba2a3b', 'percentage', 5, true, NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days');

-- =============================================================================
-- ESIM INVENTORY
-- msisdn    : numéro de la SIM, utilisé pour l'assignation OCS Transatel
-- iccid     : identifiant de la SIM, envoyé au client dans l'email
-- activation_code : code QR/LPA fourni dans le fichier CSV Transatel
--
-- En seed les valeurs sont fictives.
-- En production, importer depuis le fichier CSV livré par Transatel.
-- =============================================================================

INSERT INTO esim_inventory (esim_id, offer_id, iccid, msisdn, activation_code, status) VALUES
('cd35dcc4-dc9d-4f6a-8818-7f262d933276', '0061627c-acb9-419a-9412-861ec0dbe0b0', '47528665896641628125', '604940259407746', 'LPA:1$code.demo.com$TDNZAGLPJJLNK96907FCGPXE22FUHUKK', 'available'),
('44ea41be-40ed-4339-8bff-de45994a77a2', '0077adf8-239b-454d-9634-029b0011acfb', '97425502957459405600', '025216694285187', 'LPA:1$code.demo.com$T01XD1PRRUB3KXF5CS977KJX82DNYD54', 'available'),
('d4535f19-cff0-4456-a4e8-4218275df8e5', '007d24a5-97f5-49b3-93f7-665b3a2a2fbf', '90308344456292691972', '712763991749338', 'LPA:1$code.demo.com$37DQVTSGXG11PFAREIQ1RNRQYMTSD945', 'available'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', '00c69cc2-04cc-450c-9fa2-bca6d6c4d3c2', '00721609234785302960', '317768599080364', 'LPA:1$code.demo.com$MJRBMTJMN9KR07KOGTADC9JNFD788GA3', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '01744cb1-29da-4a82-a2a0-b3fea82d7660', '22548453755205374710', '744540344340379', 'LPA:1$code.demo.com$5OS14CP2RL08XMIP8TKAI85KEIFFITGD', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '0177ac45-ab8b-48e2-bee5-cf3d4b0d95f6', '66452352367880330731', '259899738564874', 'LPA:1$code.demo.com$PFO3E09521FUQH0VHM3ZDQ296GRTKDCR', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '01b2b2f3-7d7f-43b5-9518-fa5b4e33c015', '53381482162687008579', '148767094628637', 'LPA:1$code.demo.com$AOXLRUXKREKKY281SK3MU2P58IK8AVU8', 'available'),
('4e141b22-bb56-406b-a0b5-42a48bf1af59', '01c655e5-a4c6-4f7d-9d87-21f17e8e6a93', '46785787133751893940', '388756719548076', 'LPA:1$code.demo.com$BV8W30K08RZFXWIGM3XVIR7CPOFOD95R', 'available'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', '02046805-2ed0-4281-b867-08cb084b7698', '88609329631255265860', '849257041297152', 'LPA:1$code.demo.com$LIGTF1FKSRM9F1V7U2Q2U8NLF1RJG9TR', 'available'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', '022c0987-602f-4dac-8c00-3f62fbf81d08', '47040903043646276032', '752651684229570', 'LPA:1$code.demo.com$X1ZO3SA8KBLS68RJV4FGR8XFNKCXVEU3', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '023a600c-b7fc-47be-a56e-c2e936517b24', '18799586003506041570', '011778146962011', 'LPA:1$code.demo.com$BOL5MMU6H7YN68BYDZ9CX66LF9TBDI5W', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '023f8dfe-483d-46d1-9ec6-9ea0a85d57bb', '15250973372931953871', '148918827527440', 'LPA:1$code.demo.com$MDY2M8DMPSS5TXNHHSXZV7SJ22J9AGR1', 'available'),
('6618653a-8531-4a48-bc18-66f6783ccdf6', '025620f9-6094-4a1d-b722-1b7ad835708c', '54192039034675375930', '238860547604404', 'LPA:1$code.demo.com$1A4XBCVNIIXHMPAJ56WNPJCVIWVNP5K4', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', '02a5178e-7e0a-47d2-bc05-6a9d9d98b165', '18936998747668047376', '214433488368994', 'LPA:1$code.demo.com$TQQL5OKLOYB0PS1FY73MFG1415EM9OT8', 'available'),
('f50b53f8-ab49-4b71-9226-727124563dce', '03037495-af49-45d8-abe8-1c892558321b', '76043388209221090584', '260575567158160', 'LPA:1$code.demo.com$936KCC6SMN5JFV3EYQIEOWH5MQFSEI4K', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', '039fa36e-352e-4623-8844-5ffd089d1b26', '82050558934411748764', '839057268516477', 'LPA:1$code.demo.com$02JU6XFVUBH57CA1OIYFWVJQDWXN6AOE', 'available'),
('fc8adfb9-fe36-45c0-8d06-69bfd508c899', '03a27457-f13d-49ed-b4d0-2c316529948c', '59749401147244354917', '599241581033892', 'LPA:1$code.demo.com$J8INPM9IHWH6DH0MFIXXFA2XI4Z2ULA0', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', '03cfd0d9-d1f4-412c-8ae1-dfc1f1188ff6', '64011620593714900661', '085416675301379', 'LPA:1$code.demo.com$N7UDMYUNIXIYF7QEXY6YUMOT405F8K8Y', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', '043b954a-3af2-44a6-adfc-21b7f979c49c', '40581729845035831003', '800968392069755', 'LPA:1$code.demo.com$XD3SNDKICTYQEOGE11JYGKJ77NRHTEKP', 'available'),
('3c87a8ac-01d1-4d0a-80e2-a869c56deb95', '0451eb1d-18a0-4d2b-a849-8d16bef6c07f', '63038480715028971567', '979698786490452', 'LPA:1$code.demo.com$33J7J3VR0CTD7D9X5SAVN1ZM39D2JRWM', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', '04681511-6f11-4f08-98ff-46bf0175046e', '16828717509885308302', '535379609387625', 'LPA:1$code.demo.com$REND14F6YHQ0KKIOUV16ZXT7UYQNPONF', 'available'),
('2af7024e-0176-42cb-b595-9cfcb49b3a06', '0478feaa-25b6-4b55-9814-70f9222a1299', '41223559720139786404', '184083011857271', 'LPA:1$code.demo.com$U9O5YK6HNUNB21QWRTUI6SQZTKZI6QIW', 'available'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', '04841c67-3686-4826-8d05-4b1f754d26cb', '03244219841836179563', '704413171728988', 'LPA:1$code.demo.com$NFQOMMYH39LK54CQF8NK19ETFZZDHSHB', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', '04f6d5ab-d53a-4111-88db-ca06179ca744', '96950123150841442834', '861227167587889', 'LPA:1$code.demo.com$5UB3S5GTTN1VZKPYY1UE8BE28FU8AIHD', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', '060a4387-3be8-4dc4-9251-1f47914f24a8', '89870393638682406360', '102831792070121', 'LPA:1$code.demo.com$3GLCR643A9JLA4E8CFAZYP18YPT213GS', 'available'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', '063bf57b-594a-4146-ab96-9c3941f4acf6', '20176691878583057589', '785435474342107', 'LPA:1$code.demo.com$0MT89RISJ38GP1KY1QC1T334J8ER16RH', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', '064c279a-c212-4761-8abb-43f5a1fbf5e1', '61266075934726021280', '691665677276882', 'LPA:1$code.demo.com$VZ7PFN76M43LIKJFELFV3KVS6Y4F7ZFJ', 'available'),
('8affb6bf-f360-4bcb-b08c-086989eae7df', '068f0a4a-a3a7-477d-82b7-69acb3e44466', '21840931225076885273', '603550275791109', 'LPA:1$code.demo.com$P7N8AHI83QJI3HIC9E2A32GEFIPWK2RY', 'available'),
('0d9a1def-7bb9-401d-8aa9-3cd84db2a141', '069aaefb-f748-48c1-9ee0-6bdcc43d100f', '76633306142228187242', '719980701817984', 'LPA:1$code.demo.com$96KXBO33FCMH07FGJS51GD3BP84ISPA8', 'available'),
('9d7fa02d-1f49-4e1c-89b4-db961eed8142', '069d9335-aad0-429c-9a36-086519764c10', '34203192566288080758', '625038329311722', 'LPA:1$code.demo.com$4ZT3QB3LE6T09RMYDY7IRNZTEV8WO7NV', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', '071a9443-1f44-48b0-b2a3-d0dfc50de91e', '11992600441306089509', '975959894097237', 'LPA:1$code.demo.com$E0NEIZ9LR8AX1UCTO2V8V5QVPUOJO5QJ', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', '0766ce4e-aecd-44bc-8d28-e49ddece09bf', '19080784171145081926', '717072078211746', 'LPA:1$code.demo.com$ADLPWLHS0K0ZFFRQTPZ6MXV0OBZV3TEP', 'available'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', '084b596d-d0f0-4587-b145-bc6aea491ede', '29748635907190841071', '599816259640146', 'LPA:1$code.demo.com$WB1BFKVVSR8FWCYYZ27037SVTOYQ5KT7', 'available'),
('e9f15ed5-016c-451d-b96c-482463e316d2', '08940c0e-0dc3-41ca-a551-a5a4b8ea1fa3', '13296448385674644755', '745349808784151', 'LPA:1$code.demo.com$ZLW2MOI1C7M0DXFCE526M9UFC72DYO8S', 'available'),
('4a0d10c5-4fe0-48a3-bc50-8e3e5047bbcd', '08a7cef5-a310-486e-8df8-b7b4bf1470ca', '41659025176835466453', '783753267687272', 'LPA:1$code.demo.com$SAHIQX620S6URQPC6Y8P4LQ33XQKBOCR', 'available'),
('3efa96a5-227e-41fd-85dc-39718ebf399f', '0935bf9b-e7b7-4652-a31a-df133757a591', '79365661328154771340', '311469597256747', 'LPA:1$code.demo.com$OHOB5CV1ZHY6435GPDYYDHO3H2ICRVYL', 'available'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', '09edb5f2-b807-4c2a-be1b-c16d20ad983a', '03525175866840872007', '010329880177839', 'LPA:1$code.demo.com$0V9MQK18Y4MTWCB1D7EZDTKS3P0AYRMP', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', '0a18e93a-331b-47bc-b953-8a0762a89570', '04584885747928599703', '805656544818246', 'LPA:1$code.demo.com$KO77N2CX2JDB80MER5WMJEHTQG6CQ12E', 'available'),
('9abae76a-9068-494e-b529-819fdaecbadd', '0a2ea162-dc42-44cb-aafa-abb3e219a7bf', '41758204184979344700', '317866199492853', 'LPA:1$code.demo.com$ALL0IMXQ1VAWC5FA59KYLY4LEVFTPBNA', 'available'),
('6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', '0aeac8c0-eb2b-4e6b-9c0b-9345eef0a6be', '75231869709727749976', '630150462529864', 'LPA:1$code.demo.com$0KEAJ880RQKNPLR0YLSM7QDPTG9FGOSW', 'available'),
('fcff9806-45b3-471b-89ec-d4716f90d013', '0af572a0-deeb-4ffa-922b-9cf9fc2017aa', '85059402504338448520', '083912700405691', 'LPA:1$code.demo.com$NVS1IKOJQTR0R6CFA080TMIF6K71QVFH', 'available'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', '0b3c513a-8a32-478c-8355-29794a84f9c1', '83162641109173783234', '480856668018340', 'LPA:1$code.demo.com$PP9TTU6YRVRRT0A38CAW81BDX0COLFCB', 'available'),
('d1824057-970c-4dde-89bb-1433a20ae7cc', '0be7b734-a3ca-49ff-a9c8-91e7f27e564c', '01619637109168372618', '354009710564430', 'LPA:1$code.demo.com$TC7UUZKR796NM9YEMM9SK98V20VW25W6', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', '0c04032e-8d9b-4ddd-b21a-32cd4b282ecb', '45039025481380521743', '473192882816307', 'LPA:1$code.demo.com$YL55P5YVT7QVXAGCSXCF7Q783BNPBW6C', 'available'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', '0c77c246-b099-46eb-931b-f4bde27ff77e', '56655314266663316431', '414038961247763', 'LPA:1$code.demo.com$LKIRWKTL5H69C097RFQ06YDOIUL75BBX', 'available'),
('09925e99-4237-47de-acd4-f9c83f739e0f', '0c8e11fc-4e7b-4c44-9fd2-48a97e345bee', '62920388306071566503', '397241177384582', 'LPA:1$code.demo.com$3PALHUMRRM23QCBPL8QZBCP19BVH7OWP', 'available'),
('fcff9806-45b3-471b-89ec-d4716f90d013', '0c94766b-620e-4dea-8158-93c1f9785a5e', '48860029995487827895', '457902299008890', 'LPA:1$code.demo.com$ODK0B5ORLRDQMSDDBHXNQGPNDH1NVMAO', 'available'),
('0d9a1def-7bb9-401d-8aa9-3cd84db2a141', '0cf7206e-e035-4dca-9345-50f0d0928842', '07779049982212298030', '099976090676414', 'LPA:1$code.demo.com$0IC51DFO5KLQKWO2LPZ2UX64HPUA9JAM', 'available'),
('547e8d96-fb59-4cb0-a469-db74bf912703', '0d1b95bb-2dd5-424a-a344-185f274b1ca0', '47291877724299766534', '553632678604629', 'LPA:1$code.demo.com$60OGYH0DNPCC4XYUDX9U80RLZYI3HJKO', 'available'),
('fc8adfb9-fe36-45c0-8d06-69bfd508c899', '0dd542ae-f155-4881-9cbf-bc462f234cd4', '32028860358597455552', '425708119704979', 'LPA:1$code.demo.com$OKKUKXI6D3ZMWPIVJVCTR8Y0I7Q7W8IJ', 'available'),
('0a06379a-dba0-4082-872e-40645e1c0393', '0e7d003d-64c0-404a-9598-d1ae8a975adb', '63086463884499834584', '111557466620289', 'LPA:1$code.demo.com$GSPQY2EHWQXE8QSMIPY4DJEKNVYNIJ96', 'available'),
('2c6b087d-239f-4d39-99d2-fe45c4f32672', '0e903708-3118-4b7f-b17c-1e5789f87147', '65619010415693646003', '949599938055913', 'LPA:1$code.demo.com$E35WFWBBMGFA20PKT9CPFZVU5EDKOU7W', 'available'),
('1fa157a8-1c21-4495-a7ad-0e38c6e70769', '0ee026c4-7e16-4d69-baf0-f53ec60d5022', '20809005045524973471', '162859886745919', 'LPA:1$code.demo.com$BB4YMBL4HAI8AYT4LIDUTF97YYD8P8Y3', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', '0f49331e-4ba3-4fa3-b13e-74ab41393f01', '31710665795986787259', '245937756749138', 'LPA:1$code.demo.com$66VSK2BOTHTQ6EUF602KMFYFBXHJ8HB6', 'available'),
('e9f15ed5-016c-451d-b96c-482463e316d2', '0f97101f-b485-43a5-87c0-70f16cbc7732', '59034379708022934183', '906080963780484', 'LPA:1$code.demo.com$8CIIUK2Q7PP0R8WJ2F7L7TGJWX4KXEC0', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', '0fcb48a8-38eb-4783-8f11-d6f71786193c', '80323581191443272202', '501236525438090', 'LPA:1$code.demo.com$3ZPHKOITQYSFXVE8SLP4TWR4X4W3J654', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', '1003f516-9588-4819-99aa-d09fc2673e3d', '54059438157475886325', '840289237894858', 'LPA:1$code.demo.com$WTT4FPEF37DVWZYWD6JI8FS26888YAGG', 'available'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', '10081a61-ae5e-42d7-a94e-c7064520f754', '18466370057906533702', '402170281227594', 'LPA:1$code.demo.com$2V9H71C4607OT3FJIZSPZT3WSQ00VDVN', 'available'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', '1008db4c-fd9c-4edd-9b2f-0df1e8482dc7', '17006360781501774281', '928949171984951', 'LPA:1$code.demo.com$JDNEMU719652GEWYTPLL4HSW9H54O5M5', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', '104efa14-f43b-4d80-a56a-2532859dc837', '07144639878079144594', '844372671179265', 'LPA:1$code.demo.com$MA3NZBZUUJKGN1CB4ZPDMDC73KC03JM0', 'available'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', '10859e57-22c3-4165-997d-ba770b56672e', '37695144829322557254', '779421577486189', 'LPA:1$code.demo.com$GQC11H97BHRD9T182EDI0QF52JGDQMJF', 'available'),
('f50b53f8-ab49-4b71-9226-727124563dce', '1145490c-46d5-446e-b2fb-b15bb8c5bf57', '62386342685957065285', '899761020037990', 'LPA:1$code.demo.com$RS21PP5G9TFMU1OFZPQJXLC69K0AL537', 'available'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', '116a1c92-22f0-4ef3-8947-76ddbb11f4a4', '93003565990504425060', '771766862735402', 'LPA:1$code.demo.com$3174ZOC75I1VYRNH81T0ED9M4EVLX4X0', 'available'),
('2c6b087d-239f-4d39-99d2-fe45c4f32672', '11745485-19e5-4b99-be59-d83fec307ff0', '81077944054558338952', '142285041583555', 'LPA:1$code.demo.com$FLA2YZI6ZBVGW09KVGP3IE26S36NO5XN', 'available'),
('385aeecb-fb20-47e6-bbf9-dfb6e506cc88', '11c71f83-fc79-437d-8839-c6433861537a', '35814190045452481987', '378156014958694', 'LPA:1$code.demo.com$2ZTAC0UK0TJDYVG7FEAM47KYGCLR0CSC', 'available'),
('9d7fa02d-1f49-4e1c-89b4-db961eed8142', '11e20369-f6cc-4fb0-86b6-b08b86992fcb', '61016757142424671634', '177592659233363', 'LPA:1$code.demo.com$S76XBPHUXDDZD2O478XKMZ1KSCOY9AYV', 'available'),
('01e0eff2-6e95-4955-b771-72ac99b68657', '121f7e46-edbb-4bc1-82a2-e15040bdf183', '29144660080559696036', '217252243578272', 'LPA:1$code.demo.com$QPVBU4CDYB1LJPA91H9XPE90P26UMQA6', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', '12240317-9001-4635-9015-6b074dae413b', '84022469881718865362', '832621118350670', 'LPA:1$code.demo.com$EN4B4CWTUD0ISLI01W23OXENR9BXIK40', 'available'),
('8d3484bd-f560-419e-ae65-a43236eb7754', '123eedd8-caf8-494b-8e2f-8db64ec980bd', '81298526386525115988', '677884225484203', 'LPA:1$code.demo.com$SDGWWJYFT4OLP1VVBW3R4O0FHLZK6K6H', 'available'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', '126406c8-8f31-464f-a1e1-65caac508705', '93836514067894526250', '844346077596224', 'LPA:1$code.demo.com$K0L1R0IDSFGCRG79LWABCRXYCRXRTM4C', 'available'),
('0e795b5a-64a6-47de-82ff-11c8eff90077', '12c55a35-efb4-41d6-839a-e330cfdaf935', '34471550326104061739', '842939581061682', 'LPA:1$code.demo.com$HRBGALKT9CKY4KEZTB3OXXXW49XNB7V8', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', '13d6d80f-2e83-4ba5-9f00-18065215f5fe', '55498280974745067288', '353618007129395', 'LPA:1$code.demo.com$A5AQLSPMO7FSQXRI1LJDCCAMJIA1ZOZY', 'available'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', '14612c96-a250-4058-9834-76e11a31a63c', '68305414289406711206', '152771497831997', 'LPA:1$code.demo.com$C8ZT3QO4P7EZCOWF9J8L2KTVY79A5HLN', 'available'),
('b7073514-059e-4f7f-8626-6a11215414ae', '14614df4-3fb1-447f-8ab0-6a8ab7bf149a', '71056816239355519095', '121795022561038', 'LPA:1$code.demo.com$TXN6ZJ1PVEIQY7R9XD9AHSIP2P0Q425T', 'available'),
('4b5f225e-3828-46bc-86c9-5bdef91d2e86', '14f46a70-e1e7-44fd-9735-ec3f8d21113c', '45082379362397407294', '030093798480680', 'LPA:1$code.demo.com$G01EAUM04N9CXIF3MFNDJDD5BW2CLX1D', 'available'),
('9ba71685-57e6-48c9-b6e2-e660851d15ee', '15d57601-d4db-4f0e-bdda-b8207315cf88', '44762391936733631545', '525432417901575', 'LPA:1$code.demo.com$CLSKA5AWODDS1847TM0OIVKYQ2BJS1TW', 'available'),
('e9f15ed5-016c-451d-b96c-482463e316d2', '15f87bd3-fb2f-46cc-b6c0-f4b990ec3833', '94876995266329604774', '019314239079005', 'LPA:1$code.demo.com$U94DZ8K169XGD9N773XL983D85QSOGAH', 'available'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', '16eba399-e803-41dd-8428-12c8de72bfbe', '18289566015962940269', '871716153851098', 'LPA:1$code.demo.com$7CCVPN5860XLT9A75H3OEYJ65DDF91OO', 'available'),
('b3378ac1-e71a-4172-b73a-fda355742af2', '172d81c3-c214-4d73-8c4f-48598c672ab9', '41083024625462880509', '453457739893327', 'LPA:1$code.demo.com$JX6VTUP1UCKLSWRD6VPT0L92VAL9FW2D', 'available'),
('4bcc5461-d8b0-4088-b045-40270850cea0', '176f865b-6bc1-4fe9-98b7-a7c4d7adcccc', '72557987481837276141', '491018941277707', 'LPA:1$code.demo.com$9Q4KYMERNYBDL8E4QAS80XHHAUAWJD3P', 'available'),
('e3dcd9c5-3512-454f-92b0-0637d5ced156', '17c9416c-11af-4331-8625-f05f82e6cf04', '97027760450351497798', '159652984791674', 'LPA:1$code.demo.com$PHBBZ7134A7HTPXY5GMQLXVPG9CBE675', 'available'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', '181e2d13-d11b-49d9-a226-9338d2797d51', '92083188071526721518', '979510140894962', 'LPA:1$code.demo.com$QDF8WL24KTJT7WWAZ53OI9HLQYLSZBED', 'available'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', '18396c12-f1de-4510-aeee-af699d62c60f', '90067978262178668315', '800123479916834', 'LPA:1$code.demo.com$UXJP6WAGDC17JCGGH8QVN1XHCQM07Q6E', 'available'),
('9abae76a-9068-494e-b529-819fdaecbadd', '183b909b-b06b-416b-acee-a8542c7d10a2', '43410568524636092813', '660521363845050', 'LPA:1$code.demo.com$9YJQOSW0CMA5RZ6HCD5U9P6NMT9234FK', 'available'),
('8eec889b-4487-4c46-b2ec-aa680bbdd721', '18757e80-8818-4fdd-8c2b-c8b50aaf895d', '31289936711741498548', '083979493910028', 'LPA:1$code.demo.com$09PTP534K2W6KA2684NNDJJWWRYPNKQS', 'available'),
('552e2cd2-b1c8-448b-a123-4c63756cbad0', '18761479-a3f0-4f60-8793-3897cfefa7b5', '70806176233465508346', '158057831557344', 'LPA:1$code.demo.com$LOHJN6628VZA6LSD6QQFEWSG8GV98JBV', 'available'),
('03be8bc2-1e20-4482-8dc6-036064614db6', '187a4437-e2c7-4dca-b154-f163323ba146', '60753767072678878443', '718216430260617', 'LPA:1$code.demo.com$8NX2342G6QEYW52Y2LMTL6KKBV9QYCBE', 'available'),
('72776ef6-113d-4171-b418-d99377b38ab5', '1880c6db-3126-4a8b-91a4-a6b9bdb058fb', '66117930021147352269', '276076010448809', 'LPA:1$code.demo.com$91R074LEG12E4OSYFE461EV9I953C111', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', '18a5967d-245d-489b-b539-903bba6c6aa6', '48497586328544912045', '273883379964731', 'LPA:1$code.demo.com$RPYWCPN3IEB3PRVFDJ0YUYVAAMNP5BSC', 'available'),
('8dea511e-d8f9-4b4b-81d1-dca0251866cb', '18fb80c8-aa9d-45cf-a91c-d0904851ce69', '26801509875154863970', '557350550017289', 'LPA:1$code.demo.com$I1GVPHQMU0TZ485K6XJMS7O9EWWMM5NS', 'available'),
('dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', '19031c61-9ab1-4db9-a0b5-ed37ca9b404e', '97246579605218188830', '474704989489232', 'LPA:1$code.demo.com$5QP4IK9T7DZI6CTNV2454W2YB2J8Z8IP', 'available'),
('daff99bc-4144-4769-8a07-a976a92313e3', '192b83c7-f02b-4e94-bdb7-bb4f3a064dbc', '40564248902612018099', '307454460022987', 'LPA:1$code.demo.com$EWFJIBHZ8SDEXCFIPN4BOV9TTW481SFG', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', '1978b6d5-b4a0-421f-a414-84f08accfcb4', '00453152401938559011', '605387669013473', 'LPA:1$code.demo.com$VYSWEJYYE51W0DN8QZPKIOPLVF1RBWUA', 'available'),
('8dea511e-d8f9-4b4b-81d1-dca0251866cb', '198a8c25-1c55-4d8b-99b7-1094eac65982', '95409868862144167333', '124505396330863', 'LPA:1$code.demo.com$NU0P5EWWYRPMQSTE53D26ME27YOXNN6S', 'available'),
('dc0946f2-13db-4f2a-8259-d32977418215', '1adc7ad6-be92-48aa-90e6-bf2d8dd5b710', '39206065438745867482', '657561644024042', 'LPA:1$code.demo.com$ZCHDRFWO7QN19KM9T27VBCI94BLOGGZU', 'available'),
('d1824057-970c-4dde-89bb-1433a20ae7cc', '1b48fc66-4031-453a-b8b7-f3ee7bbde9b1', '49476384681968933121', '078899808183433', 'LPA:1$code.demo.com$JBWD7YKHZFOJK7XUKIX51ZFARYO54V4C', 'available'),
('05d44374-2606-4100-a79c-64c9699db094', '1b78ee55-5ffe-4172-bbf5-9c51cab0013e', '24997858505940541876', '718683065170911', 'LPA:1$code.demo.com$NCMLM92N2Q5XMR1JQ6PAJTJWC5HIFA72', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', '1c20ebb8-8d0d-4f42-8718-2dc5df9df426', '46648979159264973346', '312756929008728', 'LPA:1$code.demo.com$4WC0KIZB8BUJ7TN9GKZFLL4WKW9XXKCR', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '1cc49e14-37d2-4955-949f-2e5f4b6b6bd6', '75944246527633737822', '852506484503125', 'LPA:1$code.demo.com$3DB0XK4ZYFS8FZYEPIWI3B9Q1RVVGWJV', 'available'),
('622f5c1c-542b-4d4b-8044-aaa9d6260463', '1cd1acad-c94f-46a7-9cdb-66144eb5fd40', '45302361226070947102', '062009439588175', 'LPA:1$code.demo.com$ZKVU4807AY9BE8FRCMU50UJPUQDLDFX4', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', '1d42ae19-6014-4eb5-9b26-875f7364c077', '88477514454110408652', '976200897800686', 'LPA:1$code.demo.com$UY11RLRH8FELX40HJ62YP7IX78BMQVS4', 'available'),
('e11eaf06-a7b3-4bcb-aa19-00f695b9e272', '1dd9e6f3-f4c8-4b85-9b18-b23bc0e771d2', '73431856456505532145', '452227666313104', 'LPA:1$code.demo.com$8ALCN0H9YAF6ZKVP365C86O3MFAE4GLB', 'available'),
('1fa157a8-1c21-4495-a7ad-0e38c6e70769', '1edd9be4-a7f7-4d3d-b626-ce158a9cad91', '47961714452001023255', '945878304255794', 'LPA:1$code.demo.com$0WCJFBQSN08J0F9D0ACOGCHHGRY62T1T', 'available'),
('fcff9806-45b3-471b-89ec-d4716f90d013', '1f472220-4e5e-45f6-92b9-405fbacb6a72', '57293742725845933679', '881414976678977', 'LPA:1$code.demo.com$0LBX52VFUFIWTW2MJEDI6VPVRIGAXTWU', 'available'),
('ff3bf3ce-7219-42db-89d7-43adbc1a263b', '1f5d45a7-4caf-4c1a-af47-926f51785602', '49650345822212482618', '058637033567157', 'LPA:1$code.demo.com$KPNPYYJ3WF7BPNF2129NL4P61AUXEVZQ', 'available'),
('d574eb3d-d1af-46de-867c-12b162d2cbf4', '1f67ccb9-6620-4497-bc0e-bdc8c136923d', '44444756831396244234', '615653876909922', 'LPA:1$code.demo.com$FEFJ7SHSW12HX69AA3QZ7APMBN3578G1', 'available'),
('9331f629-cc33-4f38-8294-4757e8627b74', '207e6890-fae0-410c-ae55-6842387620ed', '39893619126074171908', '228434468063656', 'LPA:1$code.demo.com$4H3AKO3DJZR359H1RW2DJKRQ5MAZA4S9', 'available'),
('6618653a-8531-4a48-bc18-66f6783ccdf6', '20d65848-ff55-4195-950e-91fbbd15623a', '99971173931398844360', '812560175525809', 'LPA:1$code.demo.com$X5X6RNFNU8W3Y474AGUK9LP7VZKOBFNZ', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', '20e75d61-6abd-4e0f-885d-42c13d5e1991', '22980858264849323206', '158947704351936', 'LPA:1$code.demo.com$362PKEIXGIY30Y8635TZ6PW614VAA0G2', 'available'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', '211635bd-451e-4207-b1ac-891fddc913e2', '62228177936308345671', '030458602432952', 'LPA:1$code.demo.com$4PKNMC0N8PA0U5UZEX2J5EKF1G02TF9X', 'available'),
('fe125ecb-1101-4aec-ab06-038fc05e976c', '2144921d-d442-4e67-89ef-c6af80bf8ae5', '42531597206499402703', '550527511119432', 'LPA:1$code.demo.com$Y6MIWSZRR7ZG623AQJHIHUGTASPMW9AC', 'available'),
('0c2281a3-3b02-4875-9663-40847e1c5bf7', '2222e4c7-0c05-49a0-ac74-1ddd9d7662d8', '18405678727349622173', '035066330844426', 'LPA:1$code.demo.com$BN2NVCRX31AYZXLXGPSS96WEB2HRNMNM', 'available'),
('dc0946f2-13db-4f2a-8259-d32977418215', '22a893f4-16d4-401f-8e51-ce16e7d06a9d', '34353554127782332771', '751495109298847', 'LPA:1$code.demo.com$ABBV85TKWII0M7LLOKLHSQVVYO60451Q', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', '22e96ff3-cc82-4812-8fba-629480f8c907', '25549039574167740100', '833353978746069', 'LPA:1$code.demo.com$ZR4WUZKU8M3CDJLRPYTYMI084ESFV7R1', 'available'),
('0ae6b101-ba17-49cd-b9c8-92ba770903be', '22ecfb9b-9f8b-4673-b502-759db69ce160', '52373707374493842046', '041780852002807', 'LPA:1$code.demo.com$GQGJQX74PU7QXSPMQ4SLO9S79523FPC1', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', '2301cae1-243b-4407-8286-d4cc9241a08f', '25306684978174859424', '843079434589485', 'LPA:1$code.demo.com$TS1RLQW67B565QCPJ6Q442VL02M7FV6Z', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', '235e03d6-7bce-487e-aa90-e761132dc8ac', '86702577742886577864', '889899650475369', 'LPA:1$code.demo.com$EVTHWTWQRO7MYCKT5HNHFDR4G0ZUAMH1', 'available'),
('d3844292-5c75-4af2-8c36-21d59ca7c4ac', '24dc5ce9-4fdd-4852-8fe3-29dd9b3fefc0', '81068005791734894262', '522181998624944', 'LPA:1$code.demo.com$DUAH1QJM5UME1JLE0BH0G8F1V6BP10HK', 'available'),
('9dc48c68-a75f-4cc4-a7d4-ce6ff01cbec9', '25238e38-0660-4667-8332-277a9eae8bc0', '75925077237538843808', '833221110043618', 'LPA:1$code.demo.com$LNC88AJUBV0PXNX3P6QVCSNBNIKXHAG5', 'available'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', '25811b84-73a6-4fdb-94ec-064fcdefff6e', '04472482905244078744', '056102046846747', 'LPA:1$code.demo.com$008TEZNWNC616QDKGY1HUGFRP7NYO1A2', 'available'),
('79a013f3-3374-4972-a748-3cdb0fb98b48', '25efbde9-c1e4-4f46-9377-a474e832c087', '65603181168938863094', '891987608390767', 'LPA:1$code.demo.com$ELS50FTNCJ6ZSAZM8EEUBA9EIZS7BIQW', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', '2641ece8-3c83-4fb8-957f-888f9239432b', '12176491861402269583', '372376408338669', 'LPA:1$code.demo.com$SOTGA8TO8JM9SYXZW9TKDYB7OYSQ1JKE', 'available'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', '26438a68-49c2-4729-a91f-3e037dee697e', '22520606800580640643', '741216186922305', 'LPA:1$code.demo.com$ZKR8XOTICGSEZPR6G09QKAQBY4JKLD15', 'available'),
('04d7b769-7c89-4bae-9554-55e2ee926929', '266b5294-12d7-406d-a9d2-6207a91408e0', '52243048741676943957', '754886715830556', 'LPA:1$code.demo.com$H0JCVPPIU2LNNCOAA722CESWBRBYQC5P', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', '26ed573d-8cf0-40d8-a71b-d7d94388b1e1', '78315928500655911023', '297110281378765', 'LPA:1$code.demo.com$V9GL0KDOV4UQPX352YN10A36GAVDF9DZ', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', '279e2447-9ef9-406e-aaa9-425b800b3e17', '02871263451520652717', '704974937063662', 'LPA:1$code.demo.com$OT1O19K1O5MD6RTASLYCDYS527GSO6FH', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', '27b64e00-58b6-4b5f-b71c-85121df2987a', '20310818377048549617', '941449981485388', 'LPA:1$code.demo.com$WOK49IQBFXKG9KP3VD1Y342GWQ4ML7PN', 'available'),
('20647fac-7e92-481f-a6a7-ca1e8c451910', '27bfa7b3-d43a-404e-a660-0bb2a26018fb', '92720780946968271223', '041019557287558', 'LPA:1$code.demo.com$H3OTVEXW47OL9TH5D5WM8DB5VN3K3TAZ', 'available'),
('d4b597b3-46da-429b-9de6-b2110f2fb552', '27d692be-ae54-4401-831d-4821a8f196aa', '60998715110646703893', '194698757942305', 'LPA:1$code.demo.com$UCLWXTREUZ6NYOP26LRNO8AIXEC07AH9', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '27fdbdbe-9dad-4422-b38f-0e1e9a68d29f', '55612887576884494923', '689911264278861', 'LPA:1$code.demo.com$8UAWDXDNG512Y1UP583AQSC5LKYW9H7X', 'available'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', '2814803b-191d-4cc1-ade4-11504153ab2e', '15799822127007579660', '559114138205666', 'LPA:1$code.demo.com$DETQICOUYMMBUED9BQSW6QTWO2D41NZV', 'available'),
('5b6fa89d-9c96-47a3-a7b2-a4f0e18c6eb3', '281d3ca3-2a2b-4325-afc6-a43cb63925bf', '17219413284203363296', '924625519906344', 'LPA:1$code.demo.com$B2XOYQIAZ005CG5R5D7Z1H8QFHE0QF6S', 'available'),
('90e23d02-e342-490a-8353-c2c85145d7b3', '281f0284-1721-413e-968c-539bb6828f94', '05278343651957011113', '505830822706446', 'LPA:1$code.demo.com$O96KTQVSS9KL2FYWRUZQNTB0LUSEZEF5', 'available'),
('b9a02fc3-b556-4460-895d-3065cd377641', '2889729a-4abe-4d6a-8a0b-cc1ef540000a', '93077849880351627662', '359304050802395', 'LPA:1$code.demo.com$FVEH1QSP3RBZBU7LH4MOKU3ODER7WLU9', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', '28a58086-18a2-43ee-89cf-1481bdbe7f4a', '20278960370774905069', '779448332513097', 'LPA:1$code.demo.com$1XK1NVTZA27OSGBZGSG2X9S165N62ARP', 'available'),
('2dcc8be7-f717-4749-a4aa-170b2fa1e160', '2935d59c-e4f1-4b9b-8acb-a929fdcca246', '25650305766508710086', '991451361761938', 'LPA:1$code.demo.com$C1HOK1UHXTBS8VL7V6NDN44TG8IZ2DZU', 'available'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', '297c257a-18ba-4500-b62c-0ab9127b9e6c', '04157379525550930363', '382144731358295', 'LPA:1$code.demo.com$078HL5YNV8T8PQ72OM1PMM2PIVSA6T4I', 'available'),
('bfef0194-d761-4587-9229-45771ff85965', '29987f90-80f5-46c6-bf59-4f260f0d52d7', '59362309641957998460', '777436413797535', 'LPA:1$code.demo.com$BSEXFED5YP1BRQZ26SUZ0FA072KTQK0F', 'available'),
('0a06379a-dba0-4082-872e-40645e1c0393', '29c9d470-9ba5-4c58-9168-184835173b37', '26186502268124673011', '762859191144458', 'LPA:1$code.demo.com$33HR5IBOLDG4EXUJI3QB08HJ7TU38W05', 'available'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', '2a12fdc3-00e2-4d4c-bb41-94ebd5bfa97f', '10514083648705884712', '842468039077995', 'LPA:1$code.demo.com$QC812KAOV1FFQVUR8F40RMQHMSQ63YCT', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', '2a32202c-8a93-45b0-865c-b30525b48364', '19061796439895064917', '431399703296977', 'LPA:1$code.demo.com$CUL5B3F8TJG0QOZ0BKRD8SSFJSD1BF88', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '2a88118d-ff5b-4f80-8c60-6f4511974937', '11945428222128128208', '482558569807098', 'LPA:1$code.demo.com$T8XRHR0PA5BC8NLKJ1ZUA764EY3LEHOG', 'available'),
('8eec889b-4487-4c46-b2ec-aa680bbdd721', '2b15be99-ee16-4212-bbef-a54a028f1ed9', '46478416744165840507', '477003514490957', 'LPA:1$code.demo.com$DRLN2BG2WE38ZONLP3YT8FQ85A1EWS1L', 'available'),
('1cf701c6-f7c4-4a73-889a-b66a60f80062', '2b3da9b7-6141-4e6d-9dc1-1206a7cb14f2', '78472574942841116875', '081184064561446', 'LPA:1$code.demo.com$DBKH6CZKSS0S249N7MIZ0XE0QU5XTFT3', 'available'),
('b7073514-059e-4f7f-8626-6a11215414ae', '2b4d7f70-6733-42b8-9a04-83a1a393947c', '59143579982861814423', '745934033935605', 'LPA:1$code.demo.com$D0GJ9GBQNC5Q0HJYTJ8T4P4MX92DUP7L', 'available'),
('8dea511e-d8f9-4b4b-81d1-dca0251866cb', '2b7d8f7d-0be3-4a16-8fff-4d27094dc071', '94556159976659624164', '309664967158775', 'LPA:1$code.demo.com$X7NUKK11UNQO6MS9N02BW1F4KMYB46BG', 'available'),
('73fa0649-807d-4962-8ebb-0a67c70f06b6', '2b9a0123-5fe1-4b5d-8592-f661327a5ccd', '99197621952711662295', '004038830673007', 'LPA:1$code.demo.com$CR0FY0EZ678XGK4UPXJI9WIELXRHLW83', 'available'),
('8df03d84-b222-41f2-8560-a268aa57ef94', '2bde36c0-6f73-4272-bfe6-93f557f83832', '03942309511681686449', '730748857286645', 'LPA:1$code.demo.com$LL2IP74YHH64L4LJHDQJDBITU1Y8KZNM', 'available'),
('8d3484bd-f560-419e-ae65-a43236eb7754', '2c318add-dfec-4d04-b238-9ec38524310f', '56767071101638294657', '407135798412112', 'LPA:1$code.demo.com$EL5PX8UNV99TL1DD26NXTTRFDN953SN4', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', '2c4eabf7-d46b-4eb9-9c02-f7a35fd98912', '71386453282134625128', '233139524477469', 'LPA:1$code.demo.com$XXYORKOKJ489XJGTQ34WU14CBJRQI4A8', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', '2c798d17-9a7d-4611-b072-d8b299057f2e', '51679772709781992581', '147341152533861', 'LPA:1$code.demo.com$294SD9UT83WT2MPRTJC1PYCXERIN69ZO', 'available'),
('b3378ac1-e71a-4172-b73a-fda355742af2', '2c7fc00e-5fa6-48c7-8af9-d3f287f7d57c', '47723744097463751754', '465117548871679', 'LPA:1$code.demo.com$US7RR89QZS00YNSRCZSZJF5900G5JSEH', 'available'),
('5b6fa89d-9c96-47a3-a7b2-a4f0e18c6eb3', '2c954532-af6c-44b2-a51f-639a9985899f', '58343788776594315379', '861341560983587', 'LPA:1$code.demo.com$6CXH3RMZUHWRM74BMZUOJEKXO4EMQLIW', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', '2d257cab-c08f-4ec2-a64d-ba375145437e', '41730844795537937263', '919344262548602', 'LPA:1$code.demo.com$5G9A31H8XQVHOG723FQK8K8HCXPL4VIU', 'available'),
('20647fac-7e92-481f-a6a7-ca1e8c451910', '2d2b178a-15d3-4a5d-9de9-6a1ca41a64d0', '94512297356188641442', '243427861957629', 'LPA:1$code.demo.com$12OQMZETLQLLBFV7QTGDV1KVMAGNPZN3', 'available'),
('fe125ecb-1101-4aec-ab06-038fc05e976c', '2d55731c-54da-42c3-b3f6-9d17a3d10d28', '91661581997139392161', '016865266603652', 'LPA:1$code.demo.com$WHP8N0IDWY5T85UHGIULO24T7ZL44ZV8', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', '2d65ba3d-cf74-4a6d-a50c-fe1cdad0cf6a', '81621348616735534208', '948444099934258', 'LPA:1$code.demo.com$K00XOCMQFGHNLIO0RF01TWHRGFM1TVO0', 'available'),
('44ea41be-40ed-4339-8bff-de45994a77a2', '2d6d6efe-8be7-4315-ad06-afabe1ce55d2', '27659210630557644519', '825017836845125', 'LPA:1$code.demo.com$2AX09OC7QJF5YSZ3J8EPBKV50RQMRI9D', 'available'),
('2af7024e-0176-42cb-b595-9cfcb49b3a06', '2d921bb6-579b-4dc7-a5ca-69047029e58c', '95918790309481295357', '771947294677108', 'LPA:1$code.demo.com$RMOV59BB3Q9LVA4Q3GCDD8TL77ICSZBG', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', '2e056886-25fd-4ac1-8733-9677d7edea68', '13435078713590682206', '045072046553090', 'LPA:1$code.demo.com$TKF5ZWOVFFFH5E5TE26RSKA7CJZUYH3M', 'available'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', '2e4fef18-3144-44f2-929f-cac086f72f8e', '13952139773934132017', '592489337078331', 'LPA:1$code.demo.com$WX8LVLHEXI0V1ZNJ6RVXFXNGTV0GON3F', 'available'),
('666cd467-8716-4b94-bc10-8bfae45d1ccb', '2edd3684-bc0f-422c-a570-d49c907b264d', '21278303535011970245', '339967030472485', 'LPA:1$code.demo.com$IBES2YRSBNZQXJLFSPB6FAY4ENSQPX93', 'available'),
('adde12c2-76bd-4f99-8229-f96af97c5f8b', '2f39c839-f75c-44ad-9aa8-4b3f27908c2a', '70237461497896899392', '833150574965404', 'LPA:1$code.demo.com$93LQDO9PMDR2VG7N5BVAGS1EDCTQE0B4', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', '2f540bd4-e5d1-4dfe-bcaf-357b39804340', '94581891427337280863', '974327968047681', 'LPA:1$code.demo.com$UHCLNT9UPX3ELS9M7KJAH5W93E07X6K3', 'available'),
('ff3bf3ce-7219-42db-89d7-43adbc1a263b', '2f6d8fed-8731-42b3-9a13-31287aa4fbc0', '08266636608524620103', '561879320845533', 'LPA:1$code.demo.com$IPZXAZLB3J0D7ATKK8ZS7ULCUDXI0RJ9', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', '3090ea2c-ba2f-43a1-8738-8c742e847d71', '98870652053675796693', '660869250873763', 'LPA:1$code.demo.com$68OE2YLYLPS9CRRG18DMPO39Y6RLGA0A', 'available'),
('2dcc8be7-f717-4749-a4aa-170b2fa1e160', '30a0a75c-63bc-462d-af0d-836bef996670', '12042499613904009370', '410474328871046', 'LPA:1$code.demo.com$CJ108ZDDD6QDING578WU8F9TP4HQDNWW', 'available'),
('c3e18708-3553-4175-9587-6e2281101020', '317f9755-45c1-4614-b58d-e3cb7c3a7f45', '63593105713483670158', '633729721629933', 'LPA:1$code.demo.com$CXQHTOFVX0WJ09K7Y9GJDBBV28PGB4D6', 'available'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', '320236c1-064e-40e8-8d84-a712537dd207', '95562364468542405639', '707424587956529', 'LPA:1$code.demo.com$U39SQ5Z8I8BJQC569FO62QITLNLFATQS', 'available'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', '321a3c03-ff4f-47da-9275-5b62730690db', '14433006541553275348', '036187893914717', 'LPA:1$code.demo.com$JPTWGIY9HS9JIKTW05V40BBKA303RSFI', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', '3264dbb9-299b-4f33-a11e-363f3abf5839', '57834127164442360595', '711916009367594', 'LPA:1$code.demo.com$KN6SZ9Z1S3WACDWZA0AGFSBLBVO71BT4', 'available'),
('385aeecb-fb20-47e6-bbf9-dfb6e506cc88', '32e42699-8842-4b32-8f41-db376b98ad72', '40079264214853597819', '265557657538292', 'LPA:1$code.demo.com$4B043YL055MK4LZTXDX0LEPLM0HLQR8I', 'available'),
('552e2cd2-b1c8-448b-a123-4c63756cbad0', '32fe7cd0-50f0-4979-b6ba-041d4f17d218', '95193903935537298705', '066877384507908', 'LPA:1$code.demo.com$EUMJIZ8Z5B7LFHSVNHOOJG6EU0NDRRFO', 'available'),
('6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', '33146399-8ca2-42ef-8ce8-e2bc2a0c928f', '50873990950248925021', '120753084399727', 'LPA:1$code.demo.com$X8GUBBS291Q4YFI00N2WMRKW0UGONP1E', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', '332e6cd6-b4ab-4f47-a827-f6b8e2db93df', '08801738565609302226', '323772237119790', 'LPA:1$code.demo.com$NSBOCEGZ1CXXGUOF7A9AIV7I8E4CH7DV', 'available'),
('bfef0194-d761-4587-9229-45771ff85965', '33314d8b-fb07-4a2a-91dc-b5989dbe63a8', '91400840480226485795', '985901375177735', 'LPA:1$code.demo.com$2U7EFV40UWL5KWY6M42SNBKH19KMUURC', 'available'),
('91fca936-4213-418b-9121-01faebcc45ef', '3389a636-ecd6-428f-9746-a25169309bc8', '55864572125498548241', '498305258556756', 'LPA:1$code.demo.com$WCNY6XPZ5ONUMMHYDRB6MJDLOVSJQGCE', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '33a38092-b54c-495d-b4a7-a14569d0c97c', '79582294026768247532', '148047504613195', 'LPA:1$code.demo.com$TKRBQ1TRKD123B5SJBYPDQR0SIJYRA7C', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '34be8e5a-8e2c-49c5-9025-93c1784a222e', '15205682711710675888', '772835891142351', 'LPA:1$code.demo.com$MIJY3Y52HM1LQRMWWHUP2S8JUJBD3YIR', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', '35504fea-7466-4c79-9501-0f1d483602f9', '77952837030239416905', '166671607616191', 'LPA:1$code.demo.com$GORHHU8LC4ELAIWGZUL5PX3DR3DA78G6', 'available'),
('666cd467-8716-4b94-bc10-8bfae45d1ccb', '36103791-ec35-4a83-9dab-6398e97e1cb4', '93926344933473440060', '030237289119320', 'LPA:1$code.demo.com$MWQDAYPIIM0TLUTO15LM4HQDUZNFFIEY', 'available'),
('01cd0f2e-f4be-4904-b08c-8ae448ddc80e', '369a6e8b-2c9e-41ea-b130-45158e3b2d0f', '61756641062691904233', '071360488897235', 'LPA:1$code.demo.com$I6PL48T8LS0KVZ17DXYMLCZRR3RE196L', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', '36a1bb9c-0008-4136-87e6-8a048542c45f', '95646174204944366418', '297949886252910', 'LPA:1$code.demo.com$BRL72TZNEOUUDN9OVT9MCZQRU4GZAZ1Q', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', '36a898ff-86f0-4e25-acdf-3a633c844ec1', '90866725671541809752', '444722209016196', 'LPA:1$code.demo.com$AQ6HVD7J6882UMCVZAYG1GVNXLI2C0A4', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', '36d5b5b3-b962-4e4b-ae76-312d0009e9ae', '70931801602484360482', '306425560204807', 'LPA:1$code.demo.com$SLWW7ZNQ6ECVC28P3COMOVYVUCPLHH9K', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', '36fec956-3486-4bbf-bb6a-77bfb801b20f', '77127321045787138099', '316733855095448', 'LPA:1$code.demo.com$CENYS5GWYOE5I99ZONYWDAB79M7ZUZQ2', 'available'),
('906ae15d-02cc-42db-b7a3-213042e7fdc7', '371abd00-9b07-4439-a404-a517e669788d', '93926524504500606655', '376877200705467', 'LPA:1$code.demo.com$5FQXRAEB4A5Y89NB9N3PMJJOESN277VY', 'available'),
('c36b3ba2-e433-4a4d-bceb-46171388bb28', '375c7bbe-5bb4-4442-b789-0afc3c814951', '96137653021777458620', '170338554370139', 'LPA:1$code.demo.com$U80XO4RFGPFTCQ7UFLDPELTOQA4HD7D2', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', '37b59917-f871-41d8-bd65-919746582fe6', '60889014277650026946', '156050460493528', 'LPA:1$code.demo.com$C9UHN1XP7MVOR1NMSSF8K9Z4MJH9ZJZ2', 'available'),
('6618653a-8531-4a48-bc18-66f6783ccdf6', '37cbe908-545e-4f7b-b096-bc2eaf252fca', '12894779591914938315', '904343920184290', 'LPA:1$code.demo.com$MDDF0TOYVLE0IBP1PNKBDVL70CFXEZZ6', 'available'),
('9ba71685-57e6-48c9-b6e2-e660851d15ee', '37f77a29-eaf4-46c3-86aa-ffdd8262d889', '34461148867359042985', '270831679324633', 'LPA:1$code.demo.com$BJ6YEQXN6KVF0GDSCFN2CY7NQO03HC95', 'available'),
('2dcc8be7-f717-4749-a4aa-170b2fa1e160', '3809ee08-bd71-48c1-b035-362948226261', '63649004705557532420', '637512720444346', 'LPA:1$code.demo.com$QYQ3P9XD04J498F6R8ZGBHXS0HJD8V5T', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '38526a60-edc6-456d-beb6-1d9446653c00', '61261393328449669849', '049940101659043', 'LPA:1$code.demo.com$6AP1RJ1G18YLFJU5PS748ZXWZIX01KJ1', 'available'),
('18e22b43-0f2b-4a3f-a4a5-64dc48802086', '385690e9-20f5-4c10-9f11-ca3d06e67c77', '94360605278086813915', '705548530577079', 'LPA:1$code.demo.com$2ZEID15ADAWMM1XDFECLDSNN9Z5LB2GV', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', '38b93f74-4597-4dc4-b58a-0565aaab7c58', '75854457577475490379', '208788691999482', 'LPA:1$code.demo.com$O6VH3TOES4H2O6X4I8URC7JHLBL0VQQC', 'available'),
('0a06379a-dba0-4082-872e-40645e1c0393', '38d30a50-86ee-459b-89cf-0dcccc5c6bb3', '57946855244859599570', '168402682557352', 'LPA:1$code.demo.com$SITEMYNT0QIM9NRYEU4DR4OUP4JSXKY5', 'available'),
('b3043532-ec5a-4c7b-86be-d7c14b401168', '390145ef-cd88-402c-9f1b-0d0ddb8f7774', '91833570296932798659', '441837906715043', 'LPA:1$code.demo.com$JOGO8KK1UP24KC9M2EVOGKYUFG05IPPO', 'available'),
('47560712-bb5b-43e6-b88c-55ae6fca9a0a', '390deeee-d290-4d97-9df8-1add4e3d9c93', '77347121608735106631', '179327287286008', 'LPA:1$code.demo.com$3TTJB9M1JT299VDY9H1JBFZ3G1X2AQ5S', 'available'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', '39509f0a-9352-4565-ab14-85785d0578b4', '24225793268364555698', '341025036566625', 'LPA:1$code.demo.com$2PAGLSKPPD2LCKOA8QBO65BB92K2RX0U', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', '3ad3cc9a-8a8d-4e89-96dc-f36cfb7bab36', '45839877785265514032', '240384496339477', 'LPA:1$code.demo.com$U0MDSOLN7PFV1PIAZQ3KDNYQQS3IDI8L', 'available'),
('af3cfa07-0c05-45da-aa01-b0f8a54df2ed', '3aeff6cf-28e7-40e4-9966-f311873b7558', '08719924720009771451', '875334916209250', 'LPA:1$code.demo.com$XRQAZG7XL3NFI5M1RD7OL460WPJJW13O', 'available'),
('5b6fa89d-9c96-47a3-a7b2-a4f0e18c6eb3', '3b2e9015-0cf5-43d3-90ad-771e8f0ce6bd', '36866245951182445140', '647909921180455', 'LPA:1$code.demo.com$4VW40OIQ6VZTQ1UEX5ZCTJVUH8XSW8MW', 'available'),
('09925e99-4237-47de-acd4-f9c83f739e0f', '3b2f3d2a-6396-4b73-96b6-c087855219dd', '94106962151930194333', '681467491528636', 'LPA:1$code.demo.com$NIMJDX0T1MGLP7T0C6NZWXVQB6EA0SKV', 'available'),
('11df7336-ec98-4b37-b02c-29095ebb3d45', '3b31ef39-db2d-4c45-acd3-4b17d03f089f', '61262235539167510668', '620062747645875', 'LPA:1$code.demo.com$VYB544QNWMP7QFZAXYAX8ZK63KPLI0F9', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', '3b78b94d-367d-4ff9-8ab7-d27c481f18cb', '88825200562244032956', '767121517937751', 'LPA:1$code.demo.com$22HTKIRDCVJGOV6Y78ZLYPVOQKFD0VUY', 'available'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', '3b8d8a97-609a-41a7-a4e5-d7e571578b75', '13353175994238037245', '099981481053909', 'LPA:1$code.demo.com$TL5FOVCCBHEPK5LRS5HEX0FQW4E5LYTN', 'available'),
('8df03d84-b222-41f2-8560-a268aa57ef94', '3be0e033-abe0-459f-bea8-6f9e1a5d6b43', '38535834826326247833', '084199762888797', 'LPA:1$code.demo.com$EG7WU1257I5N5V4XY8ZZ9KJC8AZ5EIEZ', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', '3c978f47-1b71-4a91-a215-c366f35697e1', '92347196464789664061', '373286203219208', 'LPA:1$code.demo.com$6TF7YJEI8LQDZ1F0ZOHXDAOJNJID4UA2', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', '3d15ea0d-e441-4a90-9ebd-25424c460cc5', '51377147022578859896', '898824685816214', 'LPA:1$code.demo.com$PJXAYVUP7F0G4IQWJMG1I6VJVVZSZ31C', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '3d4b2f1f-7354-4863-ba57-d59b716afd2f', '75416002019166886309', '216137812371802', 'LPA:1$code.demo.com$BGMCS5TWCAC6A90RCCQ967KMXD6NZNNX', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', '3d765db5-4910-4ee8-b5bf-25089fcbfca1', '60738961821363856758', '159797212911469', 'LPA:1$code.demo.com$4O0KPVFW5NGYTE3IAW524NJRXWMBD4PX', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', '3dc0a2e2-ea80-43cf-9e67-af99d745a422', '97540046239049649943', '108437232404983', 'LPA:1$code.demo.com$BCPENNBS64GEW91IILRNV3JP1DLXKWYK', 'available'),
('dc0946f2-13db-4f2a-8259-d32977418215', '3dc9e49f-db94-451a-94bf-e988a6a09949', '84489643162175321006', '704225245600285', 'LPA:1$code.demo.com$9VR7PNHCA6KKVEWMXDUVK40Z2IARORAV', 'available'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', '3dfdb16d-c91d-4e85-83bb-771b2b3a9161', '32573478424374146207', '794501441802218', 'LPA:1$code.demo.com$4AACKBX6X3RSFXF1VTDW8M92TGGRNHX2', 'available'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', '3e42cd29-2519-4468-b73a-878382a06c78', '81992701711110213814', '623236040411914', 'LPA:1$code.demo.com$GOVCJWL5PKA1YKILMBQA4QACUWREN94P', 'available'),
('c0b05975-5b74-4d19-bf7b-6d6c93a562a2', '3e8ebd8a-7c72-4632-90ce-ef4ca1ff5396', '74862328768370761451', '941307621888494', 'LPA:1$code.demo.com$W25KX9AODY5OXBHG0GG5RFZUGVCLVUT5', 'available'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', '3eb4c3fc-eeee-4fa1-84a6-b939bd971040', '94146418162705328470', '132774911713639', 'LPA:1$code.demo.com$IJK0YDHMSHV9WKNKTRBNHZ353IVFKFWO', 'available'),
('0d9a1def-7bb9-401d-8aa9-3cd84db2a141', '3ef417d0-6156-46d9-a5f0-c3891800413e', '95864541180597807642', '208098090990268', 'LPA:1$code.demo.com$FZV2GTVY719GLR2QS3TE0POYZJ7KIQH6', 'available'),
('8100fc37-7d2d-47f2-92c5-12f9d0986e86', '3f6ae7f3-5cc4-4c95-8511-160f0c4e160f', '83428477051708522228', '373791568168523', 'LPA:1$code.demo.com$4JE0ILTBWNLV3A0T284E55W9FNRZL10F', 'available'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', '3f6d5f48-5cec-4877-9b7e-db82d73c9a46', '46851610601538010565', '865517646388855', 'LPA:1$code.demo.com$8YGNCE1L1IR9XR5PLC0M6KL4IERPD2D8', 'available'),
('7505117e-4acd-437f-a3e6-ed4978df651e', '4009a8c5-3bcb-4598-93e0-49c289d52c87', '72900380932795269689', '994280990039917', 'LPA:1$code.demo.com$3EUAHYBALEJDPSBC507DDAYORVN32SIG', 'available'),
('0d9a1def-7bb9-401d-8aa9-3cd84db2a141', '40270ffb-225e-43ec-b2a1-fa78e35b4fba', '96632568425567950521', '523874481176245', 'LPA:1$code.demo.com$KT1HIRFI5OLOVLM418G4DID4S70YFU30', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '40e422f2-ddb6-447a-a037-11a7c4d263bc', '22451715575744686361', '534261527183724', 'LPA:1$code.demo.com$MAQK98BB9WOLWMVAMJU4L4VQ0DNOQN9L', 'available'),
('fe125ecb-1101-4aec-ab06-038fc05e976c', '4132d6f4-507b-458e-8671-4f991caa7061', '28160348139353385427', '294424502555988', 'LPA:1$code.demo.com$C5A97H6O79RY3C8XFI79JL37PN73KDYK', 'available'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', '41c31a89-6208-40fa-9f59-c2014521747e', '75545874906612313221', '525529195434838', 'LPA:1$code.demo.com$OGCYXZM6BZ6H8Y5AW7YDHWPBT8C7BQDS', 'available'),
('f1ff57fd-3196-49ee-8de7-11d6f886cd5f', '41cda9ed-1bdf-4f03-b9d4-4f7e3bc3cd8c', '41179267522870267554', '959978841785610', 'LPA:1$code.demo.com$O6S4VLTT2U2W1VGNQI0JH0HD2NE0P028', 'available'),
('4c47c065-c066-4e24-ad4e-963da4de4be6', '420becbc-139f-43b2-b9b4-583308539619', '37903935067519302261', '548270229890819', 'LPA:1$code.demo.com$GVFZ0CXHZ0K8PX4GUNL617LBHQ0C12YM', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', '4243016e-f958-4a01-8145-679ddf161b5c', '93279181771176270088', '976312477253975', 'LPA:1$code.demo.com$E09VHO81OARMBTBLH571PFD5IV4PA5WZ', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', '424eb7c9-8e67-4f7b-8de7-938296ac0352', '00925129808495854267', '430509082986780', 'LPA:1$code.demo.com$IYEKLB80CRXW9T78TQP08HKM0C5QRHGD', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', '425137f0-b33f-45ae-bd52-18258478155d', '33838591924672440125', '225369590867057', 'LPA:1$code.demo.com$34OXBF9Y5WZX82BD46UGMMDS08DLC32B', 'available'),
('66ec6adb-dd58-479f-8547-cfb41e664528', '4265a098-4c48-4dce-a475-6ad19fe8a806', '50272833784818858053', '552578786837112', 'LPA:1$code.demo.com$R2R6OG2PR81A8PA3JPMWX1V7HOAYNEM1', 'available'),
('c3e18708-3553-4175-9587-6e2281101020', '429b67b7-85de-4985-b87a-3bca3bcf8804', '27265614848188790145', '667069093011664', 'LPA:1$code.demo.com$PY496LLEQ6SDJFBSSF1EC0Y8D5XBX0LL', 'available'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', '42c44e25-d642-4569-9e93-a9f6daebc095', '18072053618200486280', '552921338997116', 'LPA:1$code.demo.com$421KX9V72UY4ZZACRJ0HZSL2I3QU5TN3', 'available'),
('36129492-21ba-443f-9197-a7623a997c2c', '432e7266-abdd-4928-8084-5aad0487a19c', '38997152720353756768', '733563595848980', 'LPA:1$code.demo.com$FUYJHTK0ZPJC8A9JAODVAJFX9G0RF4V4', 'available'),
('01e0eff2-6e95-4955-b771-72ac99b68657', '43483c14-c2e1-4b65-a9ad-50d80df6dc64', '91429047440240379444', '211095142522676', 'LPA:1$code.demo.com$TI8SN7VXG3494XUOV2ZX4JEVM799BP95', 'available'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', '436a13a2-0e19-4602-b894-3c6405fbc316', '05848935132334224270', '602694806998888', 'LPA:1$code.demo.com$GL394H8O4CBZVCSKOCJI95XYX51EWNBW', 'available'),
('11df7336-ec98-4b37-b02c-29095ebb3d45', '43841265-3796-4968-a076-329e7a06b3e3', '97169603538165237220', '199444210221392', 'LPA:1$code.demo.com$702HST3XWOMVW8AMHU3FZY0JONW11XUS', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', '4384ad33-d80f-480e-a0c4-e13c28b2b6e8', '06055816387136221642', '335083897044484', 'LPA:1$code.demo.com$7KSGWMV4CS0CS4Q8U2JEHIVKY5SB7JGU', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', '439e9c1f-f365-466a-9848-4513476dc887', '89620556081896503642', '985634179501858', 'LPA:1$code.demo.com$BUHGCJSBWVWFGIU8UXR2FMHWQ5V403RG', 'available'),
('d934bb7c-f750-48b3-ac92-86903494333b', '44a8850e-1188-425b-875f-9868ebc0d997', '30032648188888453376', '263351590855449', 'LPA:1$code.demo.com$FYF3OUQWYU8N9ODXK3EC99YM0AKS37JJ', 'available'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', '44e68321-5753-4893-bd06-a067cdb94149', '26821441100479312198', '725416634303260', 'LPA:1$code.demo.com$298VPGDD73QQZ9IHK41EIXDPJG5HAS01', 'available'),
('72776ef6-113d-4171-b418-d99377b38ab5', '45a8aba9-0b13-439e-b057-09f276468c54', '86734476990393358454', '150721620021187', 'LPA:1$code.demo.com$A7XBCAG4E97N68IJA2TTM9RZR16PSWN1', 'available'),
('03be8bc2-1e20-4482-8dc6-036064614db6', '45c85cae-ad71-4409-ae19-fc56b6c878d6', '35333784590686591884', '868216567427412', 'LPA:1$code.demo.com$EGC74GMRS2NYYIZ1K8QGFFHV85SX30HC', 'available'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', '46169ddb-7b8b-4f35-983d-fd2953cdbc8d', '65297270453257020134', '480590424573601', 'LPA:1$code.demo.com$G6WEWFN5Z51H359KYXJGFPLCIDSF19QT', 'available'),
('09925e99-4237-47de-acd4-f9c83f739e0f', '46adc5f3-d742-4c91-91c9-bac422e2eace', '75818271373432670232', '693080968130917', 'LPA:1$code.demo.com$VTMC2ZCNWCQRAWH2ZFLKTXR2Q6AVHJAV', 'available'),
('d228e113-01ec-4173-a275-67e5dbd3f00a', '46ded56d-ed17-4b98-b1c4-b9097bf604eb', '84541356954851960012', '689184015352257', 'LPA:1$code.demo.com$CXKTCQS0VD3FUJUDHYS0Q5NT9B3K1LDF', 'available'),
('e3dcd9c5-3512-454f-92b0-0637d5ced156', '47554cf5-6a7f-4541-a430-620df5bdbc47', '41265170291656404104', '713357066564464', 'LPA:1$code.demo.com$9ZDC4GBESZ7WZNAV7ZR3FQKH19I7QVS0', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '478dea6a-dcf7-4c7c-8c81-62af551516a7', '24659751246589460566', '370530606443248', 'LPA:1$code.demo.com$R1505MV5UTQD2R344K9IKJBP255DOTAD', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '47c1e6d3-5949-490e-9ceb-a140341d0dd0', '69488803902055695666', '765235200705520', 'LPA:1$code.demo.com$M7IPHZT6H3WE3OS9KG42SFH2ZWZQRN43', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', '47de1b03-cd47-4610-a16c-b36a2fe97cef', '04016565905337336264', '523646458495707', 'LPA:1$code.demo.com$F9WXDZOHNO5SZA34Z32K9YDY069G840Q', 'available'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', '47f5fe66-11fc-4ddf-afe7-d47b0176264a', '14824163529959752079', '143480502001782', 'LPA:1$code.demo.com$JBUF3SB0V1Z0Z6SDJ63O3J4RXBUD58B4', 'available'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', '480f0fba-1eeb-4cc3-a164-df322377c1b9', '77663729413716355178', '483963225946355', 'LPA:1$code.demo.com$ZKDY2MXG9CDRLOE2STM33EZZ10X84YXZ', 'available'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', '480faa79-0189-4001-a360-1fc23525d9df', '11605968972209468712', '743470612710596', 'LPA:1$code.demo.com$7T4OS8ZJP75UH1IA5WQP0YHWLA570WTE', 'available'),
('c36b3ba2-e433-4a4d-bceb-46171388bb28', '4915ec21-bd1d-4730-8e19-d865b7d7515a', '56081087562784187549', '556958413640560', 'LPA:1$code.demo.com$5PGHPU20DK1M94XHP0QUJPDK6VI20B0S', 'available'),
('04d7b769-7c89-4bae-9554-55e2ee926929', '492777d0-333f-48d6-88fa-70be555054c5', '27178867917481894569', '825805816689473', 'LPA:1$code.demo.com$Z7T5YIAGLKH0GQNPQ11NU5NEJDI1WYNQ', 'available'),
('d15b65f7-df13-4df6-9e79-e0463791e071', '4941f9a9-e34f-49ac-b8a4-6bdf675b2dd7', '86170618588302209901', '030711882477808', 'LPA:1$code.demo.com$3HHUJ9DE1BEI3AMX84F1FZ7DOYEMZQZN', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', '495ade42-34fc-4135-b2ac-c3e115fbe741', '67372960747974701049', '733199348078490', 'LPA:1$code.demo.com$W2TGO1E4VWDD9NOCOJYCIT2FW4FQH1ZD', 'available'),
('9abae76a-9068-494e-b529-819fdaecbadd', '498b3635-3f08-405e-89ab-c3e1b74ef183', '40877888129758295057', '207531321694878', 'LPA:1$code.demo.com$8SIL10JRFXFHP33X0KFO8CBZJ5LUXJVV', 'available'),
('0d75c093-7466-476c-a75f-d87f621eb86d', '49f26109-bc77-4fc2-b200-0abc358580f3', '36614212344265124121', '743799937918200', 'LPA:1$code.demo.com$11F4SHYTVIANVSIW4967LBAO4UJTOQOZ', 'available'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', '4a08f067-abd7-4cab-8b89-121d1526f09b', '80405203253960779740', '132509958601029', 'LPA:1$code.demo.com$89786LDQKIXJD16JMU98YYZZ4Z6Z3VJL', 'available'),
('36129492-21ba-443f-9197-a7623a997c2c', '4a45edb6-12e5-42d2-b588-95857c8cf712', '45516166204897648669', '956346976928117', 'LPA:1$code.demo.com$CY3NXO9ZASBGELLNQ89YCTHVBFTH978L', 'available'),
('b3043532-ec5a-4c7b-86be-d7c14b401168', '4a965774-1ec3-47b6-af9d-d4ead42d7d2a', '38876803674501332268', '020230905554003', 'LPA:1$code.demo.com$VA0DJ2LAX8YNCN3QZZ2U8XJ3V3MV6E3Y', 'available'),
('81125430-b0dd-4e2a-a90f-6169b00a5afd', '4a9a8f44-480c-49f4-b42f-1aed57b9aac6', '88743711117377596149', '995326204968166', 'LPA:1$code.demo.com$VU6YLPAJ30W0LNHHPDKI0DMKS8OT0ZBP', 'available'),
('d26f02d1-3bed-4fba-9a2d-ade19b7d32dd', '4a9e6157-2076-4557-8edc-4d81bf20e76c', '29486496489165360199', '147294622214826', 'LPA:1$code.demo.com$Q9ZO9SE3389NB7OFA71T3FTZ7U6QMS82', 'available'),
('05d44374-2606-4100-a79c-64c9699db094', '4ae4505c-aad9-4eaa-aa1d-8c429c0958ea', '90720395534899723606', '595646482671496', 'LPA:1$code.demo.com$GMB9XUA0FK1N8E3Q8CDB4R50TQXZW3BJ', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', '4b4f27b5-6ee2-4de9-91d9-a067c672c807', '36418193359644395731', '551324519589472', 'LPA:1$code.demo.com$TH5AUF5AZS8WRWPREOK5Q0F87SNUZVLI', 'available'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', '4bde4885-9c45-4da7-82be-e434a684d92e', '75779234316355183093', '925978749786028', 'LPA:1$code.demo.com$BT3SJEH96N74FP16WW7HVWZ50GWDEVKM', 'available'),
('e11eaf06-a7b3-4bcb-aa19-00f695b9e272', '4c42cb0d-2c93-46ac-acae-37ca1c7b7b94', '44029692703041600798', '299725099559365', 'LPA:1$code.demo.com$F2PRH9SCSI4K5VAPJ0UWMNGRLDWSFNYW', 'available'),
('5ae1cd2e-6859-41cd-accb-ae5a1abe947c', '4c5acd9e-9a87-4f5d-b686-f054382bc5fd', '53449848041570392130', '938642177273555', 'LPA:1$code.demo.com$RR8KSISJ4A4AHK1Y2ELUDCM13PLDSDK6', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', '4c6a274b-6f55-4041-81fe-1d5db523f499', '28720351668839934999', '448586419634468', 'LPA:1$code.demo.com$NA436I823MD2YEP3GCEO9CXYPBU55BMO', 'available'),
('b9a02fc3-b556-4460-895d-3065cd377641', '4c8a0b5f-54e7-4fa6-aa58-cec5b44687ab', '98896012320740470277', '239306550896120', 'LPA:1$code.demo.com$0Y1BGNSUD33K0WVB8XM12Y5DF56J9ETV', 'available'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', '4cca6d91-47c1-4ad0-9e29-455b9f0da089', '82490569126805280434', '643620956775072', 'LPA:1$code.demo.com$BO414DN8HVFSGY3YMPCAQGBTVAHF4TMJ', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '4d003949-301b-454b-a14a-d5efc04450df', '57741067681261853879', '848815517741346', 'LPA:1$code.demo.com$0A3PD90GJ33U01MWEZQUW21AHFNV9VH3', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', '4dbc8292-5a45-4032-99d9-c36a076e8771', '62404090927458081414', '176456100672449', 'LPA:1$code.demo.com$S0PFHE9UAJXSOVWAUXI1QCEKDNT8JBO2', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', '4dd38daa-c4a8-4af6-ad86-ffe6d5d58389', '33332133297561944518', '133824584882477', 'LPA:1$code.demo.com$NCWBFV4O0OKZJC09R9Y105Q2ZPK3HOWR', 'available'),
('4bcc5461-d8b0-4088-b045-40270850cea0', '4dd68b02-8a7e-4f15-b32f-d4c8ee3b5140', '53105111372579417821', '673894949479207', 'LPA:1$code.demo.com$9KQX0R3YZQ9LGO7UJIUBRR9PKL5I6NNW', 'available'),
('7e713e18-46ed-45d2-b54e-bf087123ab60', '4e7d10f2-1185-416a-bae1-5087cf3bc4cb', '70644203630344536857', '696965138578002', 'LPA:1$code.demo.com$0D9WX0IMQ3JSM433QFMOBVEQKE1EO6J7', 'available'),
('666cd467-8716-4b94-bc10-8bfae45d1ccb', '4eb5e336-515c-4ec0-b53b-272caf63c87d', '51742170533563316619', '839263807696280', 'LPA:1$code.demo.com$DFNSM5RO4W372VNDT8T61BWC7CP9KBKG', 'available'),
('3a211984-8c5a-4b7b-83bf-0b9f6d039916', '4eb7f00e-37a3-4c22-85c8-8a431323645b', '64147975001949897176', '297587840646870', 'LPA:1$code.demo.com$YLS7RX8PO0OG79FLZ75QUEFJ22PZ9D89', 'available'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', '4f00fb33-3c89-47b4-a428-d856582b0a2a', '97960913157566579054', '306814468276643', 'LPA:1$code.demo.com$S46OYSA2W26XMFQINS03RDZ39E4096ZS', 'available'),
('e9f15ed5-016c-451d-b96c-482463e316d2', '4f0b0ffd-52cd-45bb-93bb-f957e0efa654', '84869945458827728648', '870172030420435', 'LPA:1$code.demo.com$B3Y8WDBUYZB1UB7F67RHF6VPQO1XLL00', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', '4f2dd794-9ffe-4a0a-b895-e8bf85e353ae', '99600320654090193115', '887855581018774', 'LPA:1$code.demo.com$ZORJPEGYE7P0JCCJE0QY8NMO2UTT7MJU', 'available'),
('09925e99-4237-47de-acd4-f9c83f739e0f', '4f7cc58a-a3e0-471b-9664-4ea43f7ef309', '14496412032043090776', '311682245127125', 'LPA:1$code.demo.com$CWZP4COT301BFP13XO5S58GUIGB3VSFU', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', '4fa37269-ea52-4142-8371-5fa7bd1ce84c', '46567036196984063071', '405073433068991', 'LPA:1$code.demo.com$6HWEETPZP8H7RUXCZ4AMLWPNVEJTXHOC', 'available'),
('4b5f225e-3828-46bc-86c9-5bdef91d2e86', '4fa54878-44db-4a60-a658-3ae848966899', '40120436563606403528', '302603800194411', 'LPA:1$code.demo.com$6KCUJG6K7XP7F55D37OCW60W0V0CWFV9', 'available'),
('d3844292-5c75-4af2-8c36-21d59ca7c4ac', '4fb10113-1ae3-4cef-8fe4-26f5669c6447', '63047794652305880507', '225094340928447', 'LPA:1$code.demo.com$Q3D2GF5CJ9SFQLHHKPJIEK02G8GOZGXA', 'available'),
('a60ee5dd-3acf-4afb-9d20-01edd5d60cb7', '4fca443f-b0b5-4836-8ed8-21d9d3f8c673', '31321163745757470276', '783156789372180', 'LPA:1$code.demo.com$4GVMI9OUBEPT5SA6N0UJ00MSN9LFH9CY', 'available'),
('673f0f6e-745b-411e-8900-f13f3275ea21', '50224900-c9e4-4c7a-a8e4-dd6d17c8eba1', '40497294628421517919', '480507939304534', 'LPA:1$code.demo.com$2H5H8825MO4ZIX8BS88VIJGN6V24N9DL', 'available'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', '50402a90-d643-4b92-a6d0-00aedbed61fb', '28816358875042933325', '993051498911602', 'LPA:1$code.demo.com$90MYSHADQESYUY2LOPHG00XU2MOY2K8F', 'available'),
('9abae76a-9068-494e-b529-819fdaecbadd', '504c8ebb-dfa6-41bf-b9c2-b04a90848786', '78503170882662796618', '721061445789686', 'LPA:1$code.demo.com$UFNXEXU015ZS4P67GZQOK9ESTU8SK3Q4', 'available'),
('ff3bf3ce-7219-42db-89d7-43adbc1a263b', '50ff8dfc-4a8f-437a-931e-6396d237f50e', '24368535964959147475', '338362954857790', 'LPA:1$code.demo.com$G5RUF7OIP121A69PNAUEQCVORXFEPQO1', 'available'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', '514a163b-1858-47fd-aafa-44310d40119d', '82014792259213148873', '079844321802638', 'LPA:1$code.demo.com$EKEY2PZ242MS44D6OOLZ6H7PKU7Z9FWS', 'available'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', '52d4c18a-1480-449e-8f98-587748e48a4c', '78825087822663875045', '970189901509635', 'LPA:1$code.demo.com$VTN59TN55J4I9MD7JRHHTGKIU9C58MKD', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', '52d553d4-6307-4986-91d6-7935f8b32a8d', '29044477948439007315', '330012295322153', 'LPA:1$code.demo.com$EFAQFY2C1G1CXGWJNB8ILEAN9T6YJG6J', 'available'),
('72776ef6-113d-4171-b418-d99377b38ab5', '52dae417-77ef-4f14-82c6-71be53b572c6', '38712362559542299557', '095581391039628', 'LPA:1$code.demo.com$ZKQZ2GNPHHTFOCQNVF3MWAOLP9RC3MC6', 'available'),
('0e795b5a-64a6-47de-82ff-11c8eff90077', '531fc087-b12d-4d45-95f8-5544c87c8b0b', '44624683776681527844', '613263745109079', 'LPA:1$code.demo.com$NHCKAY0540MSTI29608R8PCLBEFC6U1A', 'available'),
('3a211984-8c5a-4b7b-83bf-0b9f6d039916', '53209fc8-7776-4584-b37a-ef7a4fcad2de', '75434243427236141667', '630439309196804', 'LPA:1$code.demo.com$2NLSTGU5BZ8VLP3UJW3USXOBYVTAYIDL', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', '537e8177-3584-43fd-bd73-c487cd220f05', '62577056562550999541', '883451949286569', 'LPA:1$code.demo.com$FR0VALB25I00TTLSPUPRCQXH6EO6SV4B', 'available'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', '53d86146-3743-4f8c-92d2-82a120e3efbc', '53965062180798789461', '785012582698957', 'LPA:1$code.demo.com$TFNVCSIZ1O5CC13Z5RQE49EQMVW1LIT4', 'available'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', '53ddd6a1-b2e7-432b-86d9-b1ec673b0d3b', '22142546382540594547', '470555487790428', 'LPA:1$code.demo.com$JWO46DJ036FHE1RQMMRL5P9X01G2IP5B', 'available'),
('4643c960-c4df-413e-8eb1-28795ebc13f2', '540c2828-65ca-4995-82a4-a02660979508', '53714099540786959038', '168198725305450', 'LPA:1$code.demo.com$158PUJK7LYYJXP3A6X46AHDQ777G8FC1', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', '54cb51db-e054-447d-b311-f27cd22ed084', '65328847790136985139', '506994094268113', 'LPA:1$code.demo.com$BX6RH761JP9GAYNUAMCTXO3GFLNTPCE0', 'available'),
('fc9e9738-ece0-426b-99e9-af330604674f', '54fd24b1-944f-4ebf-87b0-582477b99d6a', '14783507828574991652', '478205144169770', 'LPA:1$code.demo.com$WQDS23ZFJUKWOSDC10GTWUVM22ELID6M', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', '5528dddc-be75-414d-ab01-c32be0576423', '98198899198237689255', '283468543758231', 'LPA:1$code.demo.com$UN16YV942J31T4FSHY02MMM1MP5O1U6N', 'available'),
('daff99bc-4144-4769-8a07-a976a92313e3', '562b3c26-79fb-45ea-9fe9-c6a3ac67ccdd', '75250894489384382434', '829555449344167', 'LPA:1$code.demo.com$99HZ3THAJZ5R6WPY7V698SQHJUBZ6OZM', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', '5693e20b-e506-4ee7-971b-29f5606e99d8', '01876014770611037625', '033778449595220', 'LPA:1$code.demo.com$YM02AR4RJTV9C3KC12KHV1SP0DDZ1IC3', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', '56f9b2b8-78ae-47d5-83be-18254de43d99', '68987952085718200753', '145479073143701', 'LPA:1$code.demo.com$42KHSINOQOXF1J91EOMCDX2AKAGE06L9', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', '57484d53-5b4c-4713-82e7-7e53c6fb65c9', '74597175757128494455', '869991426470361', 'LPA:1$code.demo.com$T3HNOBA1T0GFDE3R3Z01DIQXYRFH1LTY', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', '5782cf23-f998-4904-b85b-6c88cac87dc3', '92165317440797029895', '895487501038239', 'LPA:1$code.demo.com$JG30KQNDSYHKVJX0KNQGF9JJXBRTQAWP', 'available'),
('4bcc5461-d8b0-4088-b045-40270850cea0', '57c58ac4-9904-4537-af82-00535badc628', '31180041613424782590', '447854098712002', 'LPA:1$code.demo.com$AQHGFXWZ3QHZT5X7QPYN3JCGUYOMYWKK', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', '57d1f8ca-795f-4406-b2f2-f4477401e518', '91618991379774578263', '239134441050491', 'LPA:1$code.demo.com$9PRVXYCXE0PATXP5R3409G4WCHZ8B4QW', 'available'),
('66ec6adb-dd58-479f-8547-cfb41e664528', '57f2a289-3015-4abc-872d-10c2b3d51f17', '30199823379934765549', '133182509725150', 'LPA:1$code.demo.com$7WOX36SV3J6C5XFJ725Y5QT1N3E4DT1O', 'available'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', '57fbb82a-8b9c-4822-9319-3fe74a629725', '11160072144782579684', '563390940627895', 'LPA:1$code.demo.com$HFLENU78D54X44I0RGC4NOXY7BJ8EOW5', 'available'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', '5806d766-ba70-49a2-b0c1-2ca3fc6d6038', '53565436238480281675', '171422716167792', 'LPA:1$code.demo.com$UO4S0CMYHTK6M1X609NBS4O26XICY2SY', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '589c577e-696c-49e5-9ca3-bee373882005', '30640309607836053753', '028318782617035', 'LPA:1$code.demo.com$0KRPSXM5X678AGT9EQWOC559YEV4HN6S', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', '58b1a931-ce98-48f0-832c-7948d912963e', '96694462365098978196', '456012825962895', 'LPA:1$code.demo.com$75QEEG8WUCEKH8JF8DL4OQH0PIY5YP9Q', 'available'),
('47560712-bb5b-43e6-b88c-55ae6fca9a0a', '58d04b51-a52e-4bab-b9bc-5b5235047a0b', '42660799779657198756', '200626851284724', 'LPA:1$code.demo.com$10XK5OUF12BPI6KA8A7DMHN8A5BFYDJL', 'available'),
('e11eaf06-a7b3-4bcb-aa19-00f695b9e272', '58eefc1f-e5ea-4cc1-b41b-91596b73d51c', '98535067184506307631', '010286641811358', 'LPA:1$code.demo.com$L2WEOJ43GLW8Q924PTTIRAGID44BB5Z7', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', '58efb478-6ec6-4adf-be85-d0669d847072', '80270762844092291485', '219050736013838', 'LPA:1$code.demo.com$NTTW2V6PE8PCJQJS26ZMQVO8ZB9U3SW8', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '590af1c7-32c7-437b-ada2-41e8f7b92b68', '29536021066686657413', '426673762243196', 'LPA:1$code.demo.com$1GGKDEB37JEU2JZJCMQG16WE9U60W93C', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', '5940ba65-876a-484b-92af-8ad6ddc31687', '67843820593027243915', '365268804030064', 'LPA:1$code.demo.com$QCBTZ1DH5D4UBBZNEHCOSJX8Y850C3Y1', 'available'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', '599cb7d1-309c-46a8-b5b3-62ecbc087e5a', '57441601725398709985', '483897929238603', 'LPA:1$code.demo.com$YTV8D247X0SGMMJ0VYMSJPJYN64S5SG5', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', '59c1bb57-dfcf-4010-88fa-1d7dc97d19fc', '22666640496858792307', '208602089579137', 'LPA:1$code.demo.com$VT8A18QFBLFGNFG3LIRDZFCSIBCWMCHW', 'available'),
('44ea41be-40ed-4339-8bff-de45994a77a2', '5a04bcef-d774-404a-b532-edd3b9c42e45', '43266470366755726160', '507779546076238', 'LPA:1$code.demo.com$QQBLRDA358G5KT077ZZRCHR40FCS74QZ', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', '5a163e1f-2599-4c48-bcc9-da3d445460e5', '88536341664556644502', '913996600310664', 'LPA:1$code.demo.com$NG1IZYJ2Z1D382750EKEGQ7030BNDI1M', 'available'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', '5a40e583-14f7-44ee-a862-c0e36210361f', '63961239401722266531', '519407139962858', 'LPA:1$code.demo.com$QBB0LDXKEFNGL4LW3C36CKDZ475JRZW2', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', '5a497c18-5b2d-4f27-8e12-74152cf53e22', '58875024505749325317', '637482763977583', 'LPA:1$code.demo.com$MH2WX4T5GO96F36AI63QV86Z270TN6QT', 'available'),
('aa747bc5-2197-48b1-90a8-fb7b4e448ff1', '5aafa0d2-a62d-43af-ac60-1a72008f8eee', '83931109655754654041', '053478880525384', 'LPA:1$code.demo.com$VSAOD65TNPT54B0BY970R25T4T15BOM4', 'available'),
('18d78ee2-4be5-4458-b15e-723e30e1f812', '5aff99c6-762f-455f-88f2-52c428e93d46', '24894813437185408710', '338917214274082', 'LPA:1$code.demo.com$SAW255SJ83CMVK6CY1EWUTYIDGSRP4WA', 'available'),
('5ae1cd2e-6859-41cd-accb-ae5a1abe947c', '5b1ff9a8-606a-4970-ab24-51e778e7b259', '26713649725077467756', '520923334561705', 'LPA:1$code.demo.com$536SV6I59C45U60NVTY7A73DV4NXL2GX', 'available'),
('7e713e18-46ed-45d2-b54e-bf087123ab60', '5b61ca6a-9b99-453e-a584-d0f301c159de', '33928969689620170076', '446365494423406', 'LPA:1$code.demo.com$PIDQPGYCYEEH1HEEQ6PPU3VPJ0GXC9FZ', 'available'),
('adde12c2-76bd-4f99-8229-f96af97c5f8b', '5b70b121-2de7-4000-99a2-cc1607d0e497', '14104026221444898088', '212632392354736', 'LPA:1$code.demo.com$WT6YLIPBLWI25ZFNYOSNZ6RLUG6G9A4Y', 'available'),
('3e60394e-1329-4788-9578-d6f600fc9ae5', '5b8142c7-5de8-43e4-a7cf-0003c1001933', '73826976493288695279', '460265934686006', 'LPA:1$code.demo.com$B70J6M9JG3K38281GCTR63OYI61Q5AH4', 'available'),
('b82bde93-00a9-4d61-9111-7a29f0433642', '5b8774b8-a206-4014-a139-e27396d8c4da', '34979860993898340531', '341593592154685', 'LPA:1$code.demo.com$JXH35U5BFZIP2WMR3OCTXM40XBBV3ZV0', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', '5bb06d8f-c4de-4da9-9346-c473543f050a', '59638080472021144694', '664504876354388', 'LPA:1$code.demo.com$QQ448DOQXA0RVBSRU65ASNGVGT4SK08W', 'available'),
('2c6b087d-239f-4d39-99d2-fe45c4f32672', '5bc22a20-3c55-40d8-b527-d08d490df96a', '45297010952502784360', '242683789380012', 'LPA:1$code.demo.com$8P37KXQO3XC0FZIWATCZVXAMDC497AWY', 'available'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', '5c44ee7f-0126-4857-9acd-f65d9ef840c8', '43099312681800975222', '698345276537560', 'LPA:1$code.demo.com$SHVZKSW66EWD81B30ASY3EHQQKSZD4NO', 'available'),
('c0b05975-5b74-4d19-bf7b-6d6c93a562a2', '5c8fe830-3897-4374-b254-9ae3922484a1', '24982815452499335568', '843620987886790', 'LPA:1$code.demo.com$PTBKL0M3S01Q7YZ5P5CCAEKJ4YQ81RAE', 'available'),
('18944f45-0a29-4a74-b05c-2edf9002c388', '5cd1ba6d-5adc-4cf7-acf6-4a15f7679f8a', '08179619244460939070', '905630239781367', 'LPA:1$code.demo.com$XX28HQWBUSC5EPXVEI93EFOC4RVYFT9F', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', '5ce4f867-5026-4b66-af5b-231853cbae06', '46060661818835086605', '164443242803906', 'LPA:1$code.demo.com$1Z7VAKARMFJAB5T0GN5AOM8GVA8EF2NF', 'available'),
('dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', '5db977a2-c9ba-4814-adb5-d70572722c05', '07243115593854348905', '359552889658047', 'LPA:1$code.demo.com$RL7XRHH7C82WQRANPO32MBU4O0W5SMY0', 'available'),
('daff99bc-4144-4769-8a07-a976a92313e3', '5dd072a2-6787-4f4f-ae42-79d511059bb0', '64310972496371516906', '607636594478300', 'LPA:1$code.demo.com$U59ZT45SS96CIEC47EA9KVL3QNE7V30N', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', '5de183eb-29ba-4c74-b492-ec985e8c0701', '02092734266235450777', '465096620628793', 'LPA:1$code.demo.com$RBFV7VXC5GQQO15NRBHAOMU0JUBTGLUK', 'available'),
('36129492-21ba-443f-9197-a7623a997c2c', '5df92778-afd1-4584-be8d-f836b339e7d6', '70171687618667016829', '612023815810139', 'LPA:1$code.demo.com$8OULY3UNIDKJY7TQTE0FKZHMCBRX9V0T', 'available'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', '5e35a25f-92e7-4867-b2ed-3f078d6db32f', '62429312748998521681', '570021857757653', 'LPA:1$code.demo.com$0O0RS3C9YCXHMHX9SB3F7AFJCK94UPF3', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', '5e630711-c6da-4d17-b10f-f5aa564e2cf1', '34901914836318761084', '307844616555605', 'LPA:1$code.demo.com$8XQL4I1F6Q5YFW0C7V5AYZJUH8MZ82XA', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', '5e8f6f22-d5e1-4bdc-955b-c07c0a74ca6c', '62100015077366216635', '722579764344238', 'LPA:1$code.demo.com$GSIUZVWBS5CTEOAQX2ISPY0BM5ADFY12', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', '5e8fab32-9748-4001-8083-6c57a84af5a8', '74333001462566966390', '841705102981573', 'LPA:1$code.demo.com$JQE0GKXH29IDDM8VMZWOFL4J6MEY5Q8S', 'available'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', '5fc90077-5028-4616-9b4d-2938437da673', '61804583476230680238', '340351762815840', 'LPA:1$code.demo.com$4E7PUMVRGLY15BACMQ0PUI6SHAMG8SVV', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', '5ff1f6e4-7751-4dc0-b051-ad82e04d52ca', '59620435189705232802', '185982903151789', 'LPA:1$code.demo.com$7VRHQ6C3ZEI9DTSBWDAF81JBBOQ5XVGH', 'available'),
('ffe3fed4-6311-49eb-80c0-d24b2744c355', '60702bb6-7a0a-4796-9253-d43701264943', '96458129714494714131', '062646697560342', 'LPA:1$code.demo.com$XBH0PSWG4IVMA86JP07PO49I7INCQEF2', 'available'),
('fcff9806-45b3-471b-89ec-d4716f90d013', '60d01ef2-b1fd-4543-9972-f264a53ae8a9', '43776412220208159425', '672780410571605', 'LPA:1$code.demo.com$Q3V1TE6H8T2ZFUCYLJQR1ZAJCYIY16E0', 'available'),
('9331f629-cc33-4f38-8294-4757e8627b74', '61222e0d-38d2-4c60-9244-7afed35b9299', '29930985941869447123', '885304048243830', 'LPA:1$code.demo.com$TWZOH9I7NAA9ZHZ0TXOC7PAZR2GE6KBL', 'available'),
('9abae76a-9068-494e-b529-819fdaecbadd', '61acbe92-c1be-49b9-9e20-1df50423adec', '02949549854049573125', '667842336054582', 'LPA:1$code.demo.com$KW07SUISOD6LX23Y74N3R7A4A5K70Y6O', 'available'),
('b3378ac1-e71a-4172-b73a-fda355742af2', '638cf32d-ff94-4d10-b246-405b1334f6f0', '70212296549637555956', '913060599463631', 'LPA:1$code.demo.com$E77MI8OFPABPZG84PXZCP2BFWUZA549K', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', '6391a9c2-4ca9-41c9-a2fa-0be49d3824f3', '40155362047762108878', '072134155484017', 'LPA:1$code.demo.com$R04K38B3OWFF06QWETFLN20CZPJRSU6D', 'available'),
('d02a228e-6a2b-4b05-8570-fe7956f08628', '63ad7169-e2b5-43ca-afde-5c75df68a10e', '02248542928299496169', '374407502197627', 'LPA:1$code.demo.com$KFANROY94BAZM6Q86MPCJKQFA1WCQ3M8', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', '646583ba-50ce-43af-8e72-6e1378dff8e0', '72661417875284458070', '598778244863741', 'LPA:1$code.demo.com$JE0UYUNLYOQ7QI3EQRB7GMADAP988K7V', 'available'),
('e3dcd9c5-3512-454f-92b0-0637d5ced156', '647ce5db-ea2e-419a-8738-5001c74d5d93', '42025795897163933853', '580142142191836', 'LPA:1$code.demo.com$V8WHFHV0HZ488HXD262U7M6I5BK7F48E', 'available'),
('01e0eff2-6e95-4955-b771-72ac99b68657', '6540b77c-78b4-44c9-8d83-e615026a761b', '57695776494895480446', '976116010356360', 'LPA:1$code.demo.com$LJK1DT9DG2RKFHKLE240N1BG1WMY947V', 'available'),
('d934bb7c-f750-48b3-ac92-86903494333b', '6555045f-c5f5-478c-836b-47703fecc759', '28223348802281649090', '622555223202699', 'LPA:1$code.demo.com$24NK7PJBJU2GQ1Q2G7LV9Y183VBCYKKK', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '6570c193-d440-41d3-be10-7c23c4ec732b', '16890662992188579214', '004310509204494', 'LPA:1$code.demo.com$QBY122HOWTF1MERG69FIWPQN0TSZEAYS', 'available'),
('443e4e46-ed50-4816-9a10-4ff4990b643e', '65b124e5-895f-40a7-8082-5cd58be9cfeb', '73274962920293955349', '625849996047910', 'LPA:1$code.demo.com$BSNRLCFGXSQYPWVB6TPD0C9A3KYTVEH4', 'available'),
('03be8bc2-1e20-4482-8dc6-036064614db6', '65c446ed-106e-4636-92dd-def44c5e9383', '14769930030428998554', '622063124889546', 'LPA:1$code.demo.com$NMDI2LOU52OQMQ3WFG1WKBDDSJ1O784N', 'available'),
('d02a228e-6a2b-4b05-8570-fe7956f08628', '66a91b90-2e97-4cc3-a61c-346f07d368df', '32475790999586509340', '309066024810688', 'LPA:1$code.demo.com$LDK0Y3LWOQX6S7C4RX9F6LMHJCWL8MWU', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', '66d1cbfa-62c3-492a-9646-4643ed98d08c', '88471114731110852459', '743515669100544', 'LPA:1$code.demo.com$EV1VLDTGQ6BI47KEIL6UJIFYVYR6DDDP', 'available'),
('81125430-b0dd-4e2a-a90f-6169b00a5afd', '67736658-bc5a-4f54-a837-fbb94f6e0b6c', '27324454204082794019', '322995650342676', 'LPA:1$code.demo.com$Z7JI88ZT1KBCA0BU4HJMVO42HBLWRRFZ', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', '67b5d5b2-87b7-489f-85a3-9bee22ec5f83', '14582378498738948569', '427446672471350', 'LPA:1$code.demo.com$WMO5T9Y5WBGRPLFC9EYA4Z2K6N0YZUGE', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', '67b62312-1780-473a-b865-30023271f8e4', '70163774942873787634', '420390018949868', 'LPA:1$code.demo.com$P5MOP8UJ7HZ32TWT9096GA01YI1D9K47', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', '67f484b1-02f6-4864-b8bd-873fa354fbf9', '84883294990208240584', '430477518318190', 'LPA:1$code.demo.com$PV6YMXJBTZLG8YN4XYRPG5936JNXVI24', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', '6817b27a-a874-405e-a7ba-0baff48f99db', '95055620972745317924', '723309930229266', 'LPA:1$code.demo.com$1LNO87KLW8PEMN686QO9HGRNFBRTAA2Z', 'available'),
('673f0f6e-745b-411e-8900-f13f3275ea21', '6821f9b9-8297-4e44-bac8-45216cbb4df6', '16075423604781535702', '744811889725520', 'LPA:1$code.demo.com$F556RBBNCSY176O0M1QL5TIB9CSF5RAH', 'available'),
('f5dc92b9-1137-40ea-8031-7f097fe7a5e1', '683a4c9a-248a-41e9-b785-596e7dab0427', '83800254447495872734', '357610780683599', 'LPA:1$code.demo.com$U2R8CO4UC1J2CCYQH33F9RF00DZXKF3U', 'available'),
('91fca936-4213-418b-9121-01faebcc45ef', '68a8ca68-a02f-459a-a520-5b3310a1b0ed', '50232951719973170561', '852357834183425', 'LPA:1$code.demo.com$TCWCWWJTX08XTLENAOVIIW5XEE3AOITE', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', '6907c446-908c-4410-b0d2-72f19a39f511', '40503249183808838987', '845456807920623', 'LPA:1$code.demo.com$5CKGPBIKHTSTK3RIDVGUXJHE16AGYSKR', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', '69e4a46b-2883-45fc-a328-a2a582902571', '14852950683844367082', '259171897339936', 'LPA:1$code.demo.com$K4AHU7XAVKWE3V1WRJUD8OGZD18GALIY', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', '6a266036-123e-4398-90b4-95b2aec024f1', '97581499396231861441', '074188846824627', 'LPA:1$code.demo.com$URDHO5P2GSBGG0586HQOMCV7X4A1LFLE', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', '6a87cedc-9e23-4422-8b6a-954af761ba46', '99358059678949798851', '627210890042325', 'LPA:1$code.demo.com$S0LAWZVVRKDYV3CC50HRD9PIIN7KJQSJ', 'available'),
('fc9e9738-ece0-426b-99e9-af330604674f', '6aaa9744-c988-4186-b653-0e1bc6a54437', '80285953606191359851', '994143335378690', 'LPA:1$code.demo.com$G670YI674CULPLG9S17W16BNVBX2FEUX', 'available'),
('6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', '6acb18ab-c78e-45dd-a557-aeb7c75d623a', '35223107838438020351', '912560697724561', 'LPA:1$code.demo.com$CKXC9S122EI3796N086X4QHGDYXNXEQ9', 'available'),
('d02a228e-6a2b-4b05-8570-fe7956f08628', '6b88f64a-1d12-4de3-917b-0b2b5db6704d', '73376705216779962845', '595522284164858', 'LPA:1$code.demo.com$NVZHN7X2YF316JOQ5BKXPJHYTIDI3F4R', 'available'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', '6b8d3cc6-1f9d-4db2-abad-c8d4f9fd76c4', '23602769289120426726', '417259389453436', 'LPA:1$code.demo.com$25D1PATQZH8W8VO3AO7HH334838HN7ZE', 'available'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', '6bb7e189-9883-4d5a-a9db-13d49ec82b48', '98660288223845120045', '673148053645458', 'LPA:1$code.demo.com$10OKEXNI0L6JLG85YL4YTTWCIPNUMS0D', 'available'),
('547e8d96-fb59-4cb0-a469-db74bf912703', '6c81cc5b-97d8-4d2f-9c03-fc5486bcd3ee', '33046449918395104427', '057083838807131', 'LPA:1$code.demo.com$MTD54GYYG67GRP0TUR00Y2EAUXIJ221U', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', '6ca4f2fc-373d-4967-a323-8abcfade8478', '01339141668913690180', '301424476031344', 'LPA:1$code.demo.com$ILQ7Y4L7OILOHS6FF9S8ZRGI8ULY6TMF', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', '6cd2f877-340c-4502-9702-f1b71d4cafdc', '49551926177689919352', '876194190304953', 'LPA:1$code.demo.com$5SEM6BJX22D0ZM9TY50J8V4WOKSHP5RS', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', '6d14319f-7bf8-45ad-a356-02756df900bd', '73422102926601346001', '890020319492235', 'LPA:1$code.demo.com$IAJOFKECMPGOAW59YN8VM9E6YHCIPFZT', 'available'),
('ff3bf3ce-7219-42db-89d7-43adbc1a263b', '6d4dd030-1df4-4753-a5ce-123dfac54c76', '34057435880597085437', '391328242440046', 'LPA:1$code.demo.com$9E58JC1U9RTN6GU8SE1VVDRI99RK2LX1', 'available'),
('d26f02d1-3bed-4fba-9a2d-ade19b7d32dd', '6d555f19-3857-43e6-8f82-c618e0a58249', '59935068590030309962', '535613260338577', 'LPA:1$code.demo.com$KE5D7CMTNSK2S0HK5V0CIEUNSQYX3S8K', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', '6d6dd60e-37ac-4ae2-8886-a998c58a1f74', '78176315291874060138', '343423134366192', 'LPA:1$code.demo.com$LMIVEE49ATO0NBKF95LJJV15YLZNACI7', 'available'),
('d1824057-970c-4dde-89bb-1433a20ae7cc', '6d9f8992-3f8d-41db-9fee-0cea843c73e9', '23982288802277909119', '365087654370192', 'LPA:1$code.demo.com$2N8BJ3T73HS0ZCS4KX9H98DBDWHHKB5W', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '6dcd1d39-b21c-400a-bd97-34b649b76240', '80706320694452391234', '435342916170311', 'LPA:1$code.demo.com$DE8CKASMRNDZSN4D2VN69NJG6ETF5HG3', 'available'),
('5955df61-0197-4e53-85ff-ba92c3289ebc', '6e8ea168-4cfa-4003-936f-8edad1968fe9', '03856247019220069408', '164370900270272', 'LPA:1$code.demo.com$XVUGQH0O8MGYOLIF8FTE3ZQZXZWMKZFD', 'available'),
('8dea511e-d8f9-4b4b-81d1-dca0251866cb', '6f488bd9-bb61-4d4c-bb38-8ecc420852cb', '88686751654723877412', '751985780906465', 'LPA:1$code.demo.com$OONZ0S7XCZPEN8A07U86T6U2CCE0B941', 'available'),
('f197448d-ed17-4091-94d8-8a932c534aab', '6f6927b0-b96d-47ef-b1e4-d800eff51453', '77120224098318623631', '587770201473738', 'LPA:1$code.demo.com$IGXI3U7Y4CT9ZO7JOIWYKAC90EUUJRYY', 'available'),
('79a013f3-3374-4972-a748-3cdb0fb98b48', '6f9a50b0-00df-401f-81f5-a29843488d1e', '08989828387545749517', '778486106488344', 'LPA:1$code.demo.com$IEDZ0RWUMJMBPHV5TQBXAW0YR89F7DFO', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', '6fce1d9a-faa7-4db5-a81b-9b731928e59e', '85896747165888524325', '685822651334101', 'LPA:1$code.demo.com$DNMOKXLKN8DJLKP6QLD5WKBAVOJSAGME', 'available'),
('daff99bc-4144-4769-8a07-a976a92313e3', '6fe929f1-a670-4fcb-9b59-f9cc1993bb06', '38357449322438669410', '288590992477753', 'LPA:1$code.demo.com$XV1U3QQ7NS99GTCYDEIIAU5OCR0MUZVG', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', '70778c0d-9c8e-460d-bbfe-b7cda27467fd', '79348868219537437060', '888249802449069', 'LPA:1$code.demo.com$BC44927QLMBEDL1GPXBN1HOVO0OWP8AP', 'available'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', '7078a7b0-4112-4f53-a954-4d3797c3800a', '89453673619014385702', '953375008383179', 'LPA:1$code.demo.com$PTA1OXOXV5D3VW4EZ7KSD8G09171SALZ', 'available'),
('18e22b43-0f2b-4a3f-a4a5-64dc48802086', '709cbf7d-3b8e-4875-9291-6182e9051563', '64603300964150771619', '067488799705767', 'LPA:1$code.demo.com$7OYBHAS23YOOII9AL8BSTAZZBHXVHBZZ', 'available'),
('44ea41be-40ed-4339-8bff-de45994a77a2', '71537df1-cfdc-4069-bd8c-3ccd5571ec5d', '63930558297779951561', '826056338127465', 'LPA:1$code.demo.com$UEDTWURL1VP6I0L8Y3WTME93AL7C1GEB', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', '71e61014-e4b5-4a35-8f12-d49475a70075', '11686733734357144772', '928715746649077', 'LPA:1$code.demo.com$RAOFA1VPVKATPY9W9Z9TKY02DHECK18X', 'available'),
('b3378ac1-e71a-4172-b73a-fda355742af2', '72296a95-60ec-493b-973c-814e00db3a94', '68315802479515180672', '434677839963679', 'LPA:1$code.demo.com$3TBDP7X6J3HAQ37Q0NRZG9JD7I8LW23B', 'available'),
('18e22b43-0f2b-4a3f-a4a5-64dc48802086', '72382a09-a762-4412-ae68-1916767de415', '60697327161293018796', '010545880171206', 'LPA:1$code.demo.com$53XPMQG8AJPJ11ST3S2XB3PKYFDVYW72', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', '726c75dd-7652-4e6b-b82e-a3b7446b4692', '21996661157689224488', '864852549542112', 'LPA:1$code.demo.com$1RWLBJCQ2BV1LAHPJ9QW2AGM4VHBWHV1', 'available'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', '727b9b69-c264-48dd-8aef-665d2f0ba0cf', '08185827898038746894', '508013685878447', 'LPA:1$code.demo.com$D9ZGJG22YNNLYRCE1WQC0NEB912QAE0Q', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', '72a08373-7d16-4e7e-a70d-d3d7fb33dde8', '55700112515527800517', '977581568287781', 'LPA:1$code.demo.com$29R0RXY573ALY57SEDSTDG538RKO0SKF', 'available'),
('666cd467-8716-4b94-bc10-8bfae45d1ccb', '72c6da25-2a45-4d73-a594-aad23d22016b', '10550372764600194211', '119947876791907', 'LPA:1$code.demo.com$KQJTRKKB3KZVBA6OOGDGUC4FU1LTL3B1', 'available'),
('547e8d96-fb59-4cb0-a469-db74bf912703', '7329e650-b367-476d-beb6-357f0b8fc58f', '90041173909031542919', '313624043517037', 'LPA:1$code.demo.com$VTVKDJFOA5KOB7HU4N8W1B4SG3D5D0GP', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', '734470b3-2648-4d33-9510-c20d4474ccc5', '17021088329582208069', '629951216692844', 'LPA:1$code.demo.com$RCYNGX5WO9OVROTR9P4GS9A40HZDB1CM', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '736b03d5-442e-486b-af93-51974501c83a', '95569885045986243799', '517961246708933', 'LPA:1$code.demo.com$BQRTL7IL8D1BMUGVECHIB7R6IPKQVCQE', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '737884fb-4203-4467-9e2f-c4f2bf27b1c8', '68680208915476411908', '092176900658639', 'LPA:1$code.demo.com$E9IJJVVLWLGH5Y1MUYX4VUN5XHEU0L47', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', '73aacfdc-4be1-4b6b-aa23-0fba6a8fa014', '25878980514753711095', '294666598459086', 'LPA:1$code.demo.com$BJXPWR5EOUXKLXF2DMN38UHDCZPE22GZ', 'available'),
('f50b53f8-ab49-4b71-9226-727124563dce', '73e8903f-3f09-4fbf-92f8-bacaf3b38b32', '19232914911946762158', '056200051763875', 'LPA:1$code.demo.com$UENMRBSJ1GBZX00IQW42CESHD8JB110L', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', '741c964a-5ecf-47d9-906f-3533d1a71150', '30888192782554826969', '131097487220867', 'LPA:1$code.demo.com$TARQ1RKBUO25FCLLJQY7TOC7JY3A92SC', 'available'),
('d3844292-5c75-4af2-8c36-21d59ca7c4ac', '74413547-3147-403b-9b54-afa0eebe2741', '69206331966144789212', '831498881273847', 'LPA:1$code.demo.com$V2CF3JA5O3XQDAOI671XKMC0V95T6YMN', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', '74567454-1161-42d8-8ddd-cc94a2f0939d', '27662151737290781619', '012936321487396', 'LPA:1$code.demo.com$E2JYVON76Q9LE6CCYZ37SCZ68WXDIG2R', 'available'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', '7481b66a-8fcc-4e4d-90b2-d2d3a658638b', '79050610067354186759', '134737774283539', 'LPA:1$code.demo.com$JO3NKULRO5A3A2IIRB8ISA2WYX08OBML', 'available'),
('a60ee5dd-3acf-4afb-9d20-01edd5d60cb7', '7487b085-e636-4621-ade3-04c78afde7dc', '51455494729902597378', '420921268740212', 'LPA:1$code.demo.com$HVKTH0TH9RNCSM74V28XHYO99L878583', 'available'),
('2af7024e-0176-42cb-b595-9cfcb49b3a06', '74a6643b-a3c7-4f6a-ba0a-a797c5cb19a0', '46805780477232885127', '689054650997430', 'LPA:1$code.demo.com$48OR7K3UTZ5ZU3EN8INNICEIALRI3HR9', 'available'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', '74df43dd-e17b-40c6-8978-b11d2f6c71c5', '59622322700574592093', '987594826535769', 'LPA:1$code.demo.com$CPTF0L03H4J7722MAR5H4PK40N4073VE', 'available'),
('ec705aa3-7a3c-4917-b9da-60dca7a9f593', '74e0d823-f26d-438a-ae85-d9040be32173', '55940175694790049227', '954564297128290', 'LPA:1$code.demo.com$RY6YNNMAJBT30R0EY8AMNP630XK62G3H', 'available'),
('ec705aa3-7a3c-4917-b9da-60dca7a9f593', '755917a5-da89-4b01-80c6-a97171fe64ab', '25647970052975155784', '286213594834445', 'LPA:1$code.demo.com$Q2L2ZZ7IU0C9ISHKZ06Y51QHE189ADSM', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', '758e97d0-cbbb-4fc2-9b81-e30998e9d7cc', '65157612918750229660', '068937652029762', 'LPA:1$code.demo.com$N6CSOZJ3HHX07PZS7VT9UM3TOV42FSMM', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', '7595240c-59aa-4f5a-899e-97838b5b632c', '20845361289782196288', '931634103532434', 'LPA:1$code.demo.com$6L0Z1NF0A11QZ1FMUZY4TLVNXB52M5O0', 'available'),
('af3cfa07-0c05-45da-aa01-b0f8a54df2ed', '75d9a0e1-e254-43d7-81ed-870d004f1e36', '07365788230542701226', '012741789176278', 'LPA:1$code.demo.com$IXUVEMXGYDNOZ6GE9U1WEPU9WB6PJ44X', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '75da561c-8e84-48fe-b00c-81ef8c2eb616', '65185232118922848663', '848145287542273', 'LPA:1$code.demo.com$0HVQ6L4YWOIS9RFXFGL5TMCD4MXGU4DV', 'available'),
('4fe9ee34-3e98-4dd6-a484-2272c3bf7261', '765759c5-8a4e-43d0-8a55-6efccf2bfd4a', '52198297207142693811', '154285812807115', 'LPA:1$code.demo.com$GVL235Q6CAFRMYQI752HEKH03438NAYX', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '76744bec-7ead-4b76-bb50-1d6f89293b3c', '31256514935936472288', '147525873693275', 'LPA:1$code.demo.com$TE9YLW6D24VIWETPPKF602FRP9KWJY9X', 'available'),
('dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', '7682f499-25f0-4437-98d3-38f39d7f0c13', '35517758011271455721', '536443986016008', 'LPA:1$code.demo.com$YZIK95YX5RAZJP5UB11U02VHANKNOCIL', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', '76b2f318-3717-4d51-a667-83e8cb747d61', '92181785045983533525', '046071743412790', 'LPA:1$code.demo.com$1MLED1LYO0X66JUP3GHMNMS8V3EJ2VKT', 'available'),
('c8f5dddd-43ba-4e19-8da8-d0db121694ce', '76c83f16-096d-43a2-90cf-8b201cdf074c', '93945329579411850784', '751631962705252', 'LPA:1$code.demo.com$NYUUNHNZK51L3234BMTFT40W1YKHCVGI', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', '76d880fc-4570-4f62-a644-23327cf118bf', '17564794322220683084', '650958705415220', 'LPA:1$code.demo.com$X43O1RMXIN02GG8TSK306E6KMVESYAI6', 'available'),
('57884e9b-f978-4090-bce4-75b6e93b3feb', '771d0cb2-c59f-4130-bdac-6f23a106d19e', '68978868454836129618', '144751938894364', 'LPA:1$code.demo.com$UM9S6YM1F4EL9LFUEEHF7TDXFCNP3729', 'available'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', '7756925d-c59e-4b3c-a67c-7e27b1e9c3d5', '04540777628329970820', '962487059740238', 'LPA:1$code.demo.com$19H5UP2PNJ7A7PGK3BCW71PP8GSIVCMQ', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', '7778b151-3c0f-4893-aa8c-478b5a55121a', '53598133483315268305', '462337865127085', 'LPA:1$code.demo.com$SHCT36RDGBCG2AYX98KQ49QI2OI1WK1Y', 'available'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', '77c9dfa7-9f8f-4f29-a736-3ea9a425ada1', '73950217235387054628', '786077609823984', 'LPA:1$code.demo.com$UU2GHMVC0J0XSGRYZ7AIEBM91K4RIZOB', 'available'),
('8df03d84-b222-41f2-8560-a268aa57ef94', '77ddafee-910a-4cf0-baaf-0191066e55f6', '85507742604315899539', '685364716974011', 'LPA:1$code.demo.com$E6Q0FHWNSXCHHMRNRBU0VOJ73T370I2D', 'available'),
('3a211984-8c5a-4b7b-83bf-0b9f6d039916', '77f30bbf-88eb-407d-a0c4-c4fba41208b3', '80987789182450136049', '939171942984917', 'LPA:1$code.demo.com$LIOHTW0AINT5966TU14LE4ZFUMRJTDA8', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', '78084c58-1589-4240-9b48-157d68949a5d', '02165474897303484616', '590760497283623', 'LPA:1$code.demo.com$WTOBA15PGF1CYCODQOOYPAUS2O7H2CWH', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '78235a95-1515-405c-90c7-c32832320baa', '45668535659378073043', '718968504545887', 'LPA:1$code.demo.com$PV9CXVPV81I2UY6IXHDU0SI1GG5YNAW4', 'available'),
('b3043532-ec5a-4c7b-86be-d7c14b401168', '78a7f1a0-ba10-473c-80b0-19de35410fc8', '03653858305530826021', '024989969464989', 'LPA:1$code.demo.com$1OGDQGGAC99V2IP0P3GJK6K4406E672R', 'available'),
('3efa96a5-227e-41fd-85dc-39718ebf399f', '78c780fa-7f4f-46ab-9e2a-ae5fae17cd15', '02607598727631025826', '362366700941370', 'LPA:1$code.demo.com$8P4N49J7IWFVYMJ9WZZCS3XBDSMANCW5', 'available'),
('4c47c065-c066-4e24-ad4e-963da4de4be6', '78d48cc1-73d2-47fd-8f4f-27ce4af76d52', '02587117032699578658', '162756997514333', 'LPA:1$code.demo.com$YA45IYNZIP6K1QG5EAINXHVZ4OG71Y7W', 'available'),
('daff99bc-4144-4769-8a07-a976a92313e3', '78db340f-634c-424b-8e6a-a63baacae78a', '37656538836131062742', '538284588557161', 'LPA:1$code.demo.com$75XXNFBZ4OM0ZIYBJ33ZSO50KVK2O4S1', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '78fb2286-52b8-4a22-bc0e-3e5323b67c78', '18447677458577890427', '741690994491054', 'LPA:1$code.demo.com$Q2JGRF0LK27PY50XW0GIYQOID45NQ1ZW', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', '794e9abf-6a2b-4e36-b388-a85e9aa3cf0f', '53906897492599592360', '715432899257303', 'LPA:1$code.demo.com$YTU96DCO9LGEBO150DST8L4LHRADSMAR', 'available'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', '79825763-74c0-43f6-bace-475f8231660e', '12601517740318206964', '684881322392045', 'LPA:1$code.demo.com$0KZ83I3XI93ZUK8TDA9F0CAL42VL70HW', 'available'),
('b3043532-ec5a-4c7b-86be-d7c14b401168', '799010ce-b54b-4e87-a2b6-f54eda58f800', '23035325099135053024', '287744886643616', 'LPA:1$code.demo.com$SSM0FRQV3OMT0DY5IV0YFONO9BYRO9FE', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '79cc01c7-fdbf-416c-a6bd-af8bd8ee71cd', '96886759519529498127', '838948259244137', 'LPA:1$code.demo.com$EIC6W3033AREYAAVQWYP7VJQ9FHGCJL5', 'available'),
('fcff9806-45b3-471b-89ec-d4716f90d013', '79d9ac93-ae66-442c-bf65-e3b411af297f', '71290285323219189186', '164534870503888', 'LPA:1$code.demo.com$BZ1PADB3HEG9OAB90MV4BROAB7699JKU', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '7a027f76-efff-40db-a9b5-49a0ae71c3ee', '09244823471694736797', '339393402155916', 'LPA:1$code.demo.com$3KDEIDJ2RJ2DF6H0PPQIHSUFQS7TUL0I', 'available'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', '7a35a62e-9446-4b45-8196-695bf9aaeb2a', '43374841572927532693', '829090827265668', 'LPA:1$code.demo.com$HUMIDZ9GLSFNH4GXUB0S1GE9EJVNKIRM', 'available'),
('9d7fa02d-1f49-4e1c-89b4-db961eed8142', '7a7d5581-4cfb-4cff-ac35-811f23a0c052', '70337614478592132050', '374876921188483', 'LPA:1$code.demo.com$3SY6A4YERPJ6DYHJ0REET9G9J4JWBYN5', 'available'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', '7af8faea-bb90-4b87-952b-7221c66f5f96', '87197966272119221676', '776010102177247', 'LPA:1$code.demo.com$BAMXZ72YGZG8LYKZDDCA6YBHUQ9HYTC8', 'available'),
('03be8bc2-1e20-4482-8dc6-036064614db6', '7b36cd55-bc84-4b0d-a072-646caca870e5', '64269007475019615526', '764469843662741', 'LPA:1$code.demo.com$YMQ341DB7DU93TSXPAQGINOO2KV9O9OF', 'available'),
('85610ad8-2345-4089-81b2-23d08b4f5197', '7b89fd3b-4e66-49d8-883f-5be645401145', '20560128721870788094', '393461511681260', 'LPA:1$code.demo.com$M50Z77FZMATE99VYJL6H48VFFWUK1IWI', 'available'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', '7bb8c39d-fb16-4226-a2b5-a295868b7942', '80070883843918314465', '493813343526969', 'LPA:1$code.demo.com$QC9KAGENFE8CNX9V5UHAODUH0UNVP3N0', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', '7c124ca7-2b13-44ae-bdb7-4584f4fa2163', '18781121465926219907', '144568608365120', 'LPA:1$code.demo.com$4MACCZ8CHU3KAKNMNNWGOJ06QR88Z61S', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', '7c32f021-1e1f-47be-bd05-e0df07d333d7', '52254659694473282086', '850488703160478', 'LPA:1$code.demo.com$HN0OZMVE5MYNOQI4XL5U5194846JV968', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', '7e1d5f81-2253-46da-a538-24b922adbdd2', '30814903927810240459', '525486773489707', 'LPA:1$code.demo.com$YK61OLBNH500AX1T3I14E83D5L15N1MZ', 'available'),
('3e418e21-0282-4d16-9a75-da6874d50698', '7e2ff748-fbfa-416e-a237-1eea7fb014be', '16811596395652095149', '959970666014284', 'LPA:1$code.demo.com$S80TKQ497Q1JP6PF9NIFKKQTY7SR8ID7', 'available'),
('c36b3ba2-e433-4a4d-bceb-46171388bb28', '7e69da3a-d575-45a8-b282-fb5fc22eec38', '16178528078672221677', '560710952365069', 'LPA:1$code.demo.com$IP6AYPWSW8MWNZN44R2DAA8PI6QKOEB4', 'available'),
('0d75c093-7466-476c-a75f-d87f621eb86d', '7f25358a-28a9-4320-8cdb-ced9233e1cc8', '66260090425914675201', '041532572303430', 'LPA:1$code.demo.com$Y28TW54JQIICMBM6QWJWPYUHWCRSBDGV', 'available'),
('ff3bf3ce-7219-42db-89d7-43adbc1a263b', '7f26c4f1-c274-4540-b83b-2530a0fbb23b', '99230235448483615169', '025018977607532', 'LPA:1$code.demo.com$0PDDD74IU23TQEJR59JAW4VKLZSJ68V7', 'available'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', '7fa0c7de-1317-43cb-87c0-ecc837f892ce', '72061594684091868009', '905736752189615', 'LPA:1$code.demo.com$NZIMKQJ1SN89NH75JYDFUOPL0PK4CTIR', 'available'),
('f197448d-ed17-4091-94d8-8a932c534aab', '800e58f5-22c3-424c-8274-939e5c13feae', '00517269711450843032', '222677578197096', 'LPA:1$code.demo.com$HQCYEYBFJ463TIOHR2MG6LGGXDPF5AFI', 'available'),
('8df03d84-b222-41f2-8560-a268aa57ef94', '804c476a-7c63-4f77-b365-20e49511b382', '03827911283522808295', '973194032969830', 'LPA:1$code.demo.com$ZQ8C4JQ4ZKJOJ7653OAASHWXKOVH7YY7', 'available'),
('0ae6b101-ba17-49cd-b9c8-92ba770903be', '811673b2-6d73-43d1-86c0-a7e729e23c19', '27599414867266858704', '203121882910084', 'LPA:1$code.demo.com$QHHXHBEJP1E9EUU1Z7L6LVF487ME9C4X', 'available'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', '81367572-26cb-4671-bf86-44d5a510db95', '94284225075147013526', '447168797955973', 'LPA:1$code.demo.com$H1B7V8IU9G0CZASV16CT0ICITIM0THR8', 'available'),
('72776ef6-113d-4171-b418-d99377b38ab5', '81b6041f-9b0c-409e-bfd5-a5ba8f8ec4fd', '64132112164263497185', '243477048595860', 'LPA:1$code.demo.com$O0TV63FEH5AC8MSZRZJV7XO545RE4D4Q', 'available'),
('8dea511e-d8f9-4b4b-81d1-dca0251866cb', '81fe2dc0-423e-4139-8528-c5f4fb7e2983', '31836376631712232821', '565232265513661', 'LPA:1$code.demo.com$70VUZZEIB58VOWLQVCO2EKS6BUNTN3DO', 'available'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', '82707c1d-c477-4bd8-8493-426601688dc4', '49462612425361564249', '635588179775764', 'LPA:1$code.demo.com$16Z79TVGZNTW3C8EFKABF6MTM7RGB0YX', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', '82772d5e-eb26-49a4-8b1e-21bb27cac96a', '09462506978509139503', '121634948659316', 'LPA:1$code.demo.com$7ON67KC9RDT77NFUTOW74125G5NQLSKE', 'available'),
('6618653a-8531-4a48-bc18-66f6783ccdf6', '82bb2b2b-be1b-4d54-8199-fc92f17bfadf', '12005114264327041369', '637089099823320', 'LPA:1$code.demo.com$KJJ27OJYMQQZGSXUIT6LC4YXD40C8TU1', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', '82c2c4d5-f6e6-4f1f-a546-5e52f3907029', '24172106624239783311', '468124179046322', 'LPA:1$code.demo.com$BIL2VDIAGSTVA4GK00RXX5SKX2SM6WYX', 'available'),
('3d9541fe-8d81-4733-834a-9d94668fa9fe', '82e01d4f-4f28-47a7-8675-f62288b8fadf', '76623445490387638845', '696854895118427', 'LPA:1$code.demo.com$H1AVLRRL0E68SXS3U3N3B1B31O7QS5BF', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', '82e59a08-432a-4b7d-a871-f2dbd0b23ab5', '40229344370750769499', '052285080954925', 'LPA:1$code.demo.com$8UVXF4GUIQSNSLMAW0LL7W2K11X6RCBT', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', '830adc46-95f9-44fd-ba1b-5fb8ba9054e5', '88647004096244890083', '717349976109951', 'LPA:1$code.demo.com$ASUODZZHBMCE53CTYZ44PUOTICEHHB1B', 'available'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', '83d84048-7027-4c9f-aa58-b2f91b9115a8', '83286820973560459985', '517382994777963', 'LPA:1$code.demo.com$7T11B2Z57KMV6T2YAQNVME9AIWJBT0G0', 'available'),
('4e141b22-bb56-406b-a0b5-42a48bf1af59', '83f2647c-61af-48d0-9002-51308a63df41', '66016240645615035439', '820687591976058', 'LPA:1$code.demo.com$3R2MFBRDRXQEH3RO0B0NJCI73CQJUKDO', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', '84273483-eea0-43ac-a07c-5f17896b6991', '80065276006717931933', '601005210991589', 'LPA:1$code.demo.com$349T0EGZKBPH5KM21DL9CEWZ6WQ59DFH', 'available'),
('05d44374-2606-4100-a79c-64c9699db094', '8439d3f8-34f3-4378-b736-2e8dad45b7b1', '58624142601024101529', '974574386746178', 'LPA:1$code.demo.com$K41NRQVDD1W69S176VQLGZVRRCGGQFND', 'available'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', '84459e6b-5197-48a5-8cc0-16dce8ae1cef', '95474946324421336437', '167988854625548', 'LPA:1$code.demo.com$V7RXEG5JHJ1IHQ16PO9HZIR087MO6IIC', 'available'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', '8452ad37-1c1a-41e1-a44a-aa15db59e66d', '48713454771222843795', '378460671254014', 'LPA:1$code.demo.com$YQRUWGX9O74IDICSQ7S4TV42HIKW8UMZ', 'available'),
('1cf701c6-f7c4-4a73-889a-b66a60f80062', '84d40a4e-4c62-4916-8d7e-7bc2e24779a1', '99663757785749976340', '809670699633214', 'LPA:1$code.demo.com$THVY40EF9UWIRDPA0OMFLXLSA5U77GAN', 'available'),
('7e713e18-46ed-45d2-b54e-bf087123ab60', '8549d314-3df2-45d0-8d57-e80c96df6f48', '65596352090506849112', '240554965003078', 'LPA:1$code.demo.com$YO2DBUZGA57CTXRJ9X5ALPYFXBUXZYCF', 'available'),
('8affb6bf-f360-4bcb-b08c-086989eae7df', '856ee504-d672-403c-b3ac-5937f46d36d7', '22108297214010900587', '783235872988394', 'LPA:1$code.demo.com$ASDB9F6J4KVHQY70T4LRDP7Q02VU78RE', 'available'),
('57884e9b-f978-4090-bce4-75b6e93b3feb', '85e28636-aa91-46d0-8c58-55f8466e8347', '04045532695063576098', '122090437058079', 'LPA:1$code.demo.com$V6L0YEO0XWT68XZME8QTHBEAWJ07YX1T', 'available'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', '85e5f67b-d392-4b37-9ba3-48aff6219d6c', '08561211516066426858', '703764579459406', 'LPA:1$code.demo.com$DSDZZ97SGNVP04CCOKIECDFDM5ORNORF', 'available'),
('b3043532-ec5a-4c7b-86be-d7c14b401168', '862b5766-ed98-4ea1-a1c4-fee4d4f249df', '68867440471345023799', '245619018988675', 'LPA:1$code.demo.com$FAE3AEPOR7WIXAP0RDQXA47KP1V37N8W', 'available'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', '86e0f448-e3bf-4b3c-a90c-56f27070ace1', '24148551077962523052', '273914804223218', 'LPA:1$code.demo.com$SYUHA1KQW18G97QQSQF791U6PGWLHNB3', 'available'),
('9331f629-cc33-4f38-8294-4757e8627b74', '8728f82f-03b4-4ef5-9a5d-a6161ef9e432', '32706022203749231689', '986583724475966', 'LPA:1$code.demo.com$EW7L6AAIQUJRTME9KAWT7QXHC831V6KW', 'available'),
('4c47c065-c066-4e24-ad4e-963da4de4be6', '87b200f8-c2ce-481e-aba7-999513f57361', '65351604464213693564', '989567696063696', 'LPA:1$code.demo.com$GBPHNJKBFZTU1V8ONVDBXZ12S3DDZ3WQ', 'available'),
('09925e99-4237-47de-acd4-f9c83f739e0f', '87db52bd-7aba-4733-adf8-baf9078f5239', '33728619181576707176', '137046683539064', 'LPA:1$code.demo.com$0MGHO9HBTXVR2070FIWJN9ASY9O9K08B', 'available'),
('3e418e21-0282-4d16-9a75-da6874d50698', '87e2f924-7610-49e9-b813-db1df05c095b', '80131039467402938899', '304753332446793', 'LPA:1$code.demo.com$X7T2UHMOWZTGN1JUCWE6EK72OJT29DTK', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', '87f39d23-732c-4590-8c27-7fa5de95eed3', '20001729725303980507', '971975624026631', 'LPA:1$code.demo.com$Q165JQ2P7IOMX2C1PIM476PL5ICHBS36', 'available'),
('f50b53f8-ab49-4b71-9226-727124563dce', '8821ac87-fb69-4541-b15c-bff203ab5b4a', '84455303310729975878', '456965408059656', 'LPA:1$code.demo.com$NC9K3E6IYHB7UUKDTH4FX567V2XRQI6K', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', '88303408-f6a4-4254-bcb5-46f5b67bd162', '15254350355711840762', '207789690487264', 'LPA:1$code.demo.com$50H6CWYQZFZHUZBANO6I0ON0ALCT2XWV', 'available'),
('57884e9b-f978-4090-bce4-75b6e93b3feb', '88f58440-9562-40ad-8403-5dccba5404e9', '15400534539180384295', '886910408666472', 'LPA:1$code.demo.com$M93G87M6MK16CW1S7PN789HC7YOD9DSK', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', '892cd6cc-cdc8-4f0c-b500-1ff2fc7a5421', '66149704619321038819', '816708621680357', 'LPA:1$code.demo.com$DILWV5XYM76QV0DLRVOCLJCZWO8LEGTV', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', '8953b6fe-e653-4bca-8181-3230e46c2772', '08562102606801391672', '438576168303091', 'LPA:1$code.demo.com$QT4WJ5G43C93B1CCMPZAACW7F46D13PR', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', '8975cb75-268c-4540-a4e5-9f00cbb3c5d0', '72848448000961532226', '615311896952460', 'LPA:1$code.demo.com$WJCP56P2CC6TR162E1PG9ZJ24XUCD9XS', 'available'),
('01cd0f2e-f4be-4904-b08c-8ae448ddc80e', '89c049ee-3231-4441-84d3-6f9db6f3996f', '81192541956324920977', '818723017174010', 'LPA:1$code.demo.com$RKO4SF988X31UXJIKSSL70LPIXJP0YT1', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '8a288737-a62b-47be-9dc2-09dc476226b9', '07385554004371815734', '416007675964646', 'LPA:1$code.demo.com$9CW19AYFYHIUJDA8JHOH5EGA6SODNAVA', 'available'),
('385aeecb-fb20-47e6-bbf9-dfb6e506cc88', '8a91ab37-1203-44cf-92c4-851a5cc18d94', '62980149076085200975', '162931342833435', 'LPA:1$code.demo.com$X2FSWJP32ZR8RUBZD2CWE2RMUIE3O979', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', '8ac2d7fa-ed8b-4190-904c-853c0afded60', '47098518365943650556', '644518707583803', 'LPA:1$code.demo.com$T623E19TI2PQ2F41A44SMBJDVEOPTMRA', 'available'),
('3d9541fe-8d81-4733-834a-9d94668fa9fe', '8aef9093-bde4-4987-a10a-00d0de5d0452', '33062939031118313747', '395253662170946', 'LPA:1$code.demo.com$XVD8BF4L3XUQT26QH9W7Y8E79ZBY0FFP', 'available'),
('b3043532-ec5a-4c7b-86be-d7c14b401168', '8b1c4d2b-0dc6-4fcb-8225-825aa36e2d6d', '44389242737411264792', '554134024617046', 'LPA:1$code.demo.com$Z8YNJD2TGB3IMY8XPRI63D6YYLNLHBCB', 'available'),
('9331f629-cc33-4f38-8294-4757e8627b74', '8b22a19f-4c14-4fcf-acb4-ca219b5e75a1', '25530409586910722421', '422538558007940', 'LPA:1$code.demo.com$V20QYFFEJ97QLN0AHITC4EVIS487WSRV', 'available'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', '8b41db34-31ce-456a-9c84-667bc9c0784a', '77092567367619705719', '962112241179369', 'LPA:1$code.demo.com$UJZP90679O38RTLGVIH4LFFDOW6IRS9W', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', '8b5d8610-0c9c-495d-aa02-534a38c515dd', '48713992363234578485', '947331805099301', 'LPA:1$code.demo.com$V3PR1A4TLLDEAX69IPVAU6AJCOZ0GYPK', 'available'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', '8c039ba6-3b02-4023-8c64-8006b5d37007', '08939308144370793141', '703950282238281', 'LPA:1$code.demo.com$GK66GB2NBM69VLROOGOI4V80LZJ3PZ07', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', '8c50a6b6-8243-44af-a485-a8b8fb0174ca', '95143140526173408285', '347779893896269', 'LPA:1$code.demo.com$6F841CQN0UIL47EQQUA5MOSX2KNITUAT', 'available'),
('607fb6b6-fa55-461a-9535-41bba2e710f2', '8d336927-d5dc-4c78-809f-e6719a67d43b', '41188456925064878401', '708905960500863', 'LPA:1$code.demo.com$OLAT4QCEWORROY8PCTE9UDQII88Y6QAR', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', '8de6d4e1-37b6-4e19-9a81-48026468bd2a', '20183492996844173811', '938209490533322', 'LPA:1$code.demo.com$2K1CE801A0Q5VA00BVIH6T7OX1NHFPM4', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', '8e7245bf-0d47-4f80-b8e0-039fa4ed8586', '65787475403547001072', '574701868219976', 'LPA:1$code.demo.com$LF34F8N5U2OGHIFQ7XZHB7H82E5CYU9Q', 'available'),
('c8f5dddd-43ba-4e19-8da8-d0db121694ce', '8e8fe611-99c3-4f6e-9838-5f28b3b932bf', '58886748142282667592', '842190471119454', 'LPA:1$code.demo.com$YD7R4MBQMMNNQ34025I19F7TI5C2R2YV', 'available'),
('11df7336-ec98-4b37-b02c-29095ebb3d45', '8f03e33a-2132-475c-b93c-579a080bd56b', '94165721680144994284', '873520917300834', 'LPA:1$code.demo.com$ILAQ3E4GXN9OKV4FGO88YZ4DH1CXVZR4', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', '8f52fc93-31cd-4ddb-9565-98061626ea20', '74056647642905387588', '455939947414285', 'LPA:1$code.demo.com$OY9N12F4ISBHMJMHBZG7CAV09XNBRW5O', 'available'),
('d26f02d1-3bed-4fba-9a2d-ade19b7d32dd', '8f5fc2a3-c4da-42c1-a57f-814705cdaa72', '49037752899615110146', '051997917944398', 'LPA:1$code.demo.com$PJNI5U19ZUTOJRD4H0RXACMSYXJ6T7NN', 'available'),
('8df03d84-b222-41f2-8560-a268aa57ef94', '8f6309a7-1096-4616-9f2a-1595beec35c1', '22878410676511055515', '747111505274559', 'LPA:1$code.demo.com$3LVKC3KNX3CH7IOOZBWJ7E47N1J2BIN6', 'available'),
('cd35dcc4-dc9d-4f6a-8818-7f262d933276', '8f9ba9e1-36b4-48bf-a4b3-7293f8e2cf29', '88800749072958296330', '100101773121852', 'LPA:1$code.demo.com$0YKK8U37Z3XMOTY3JKIJBXRDPHU5G20S', 'available'),
('5ae1cd2e-6859-41cd-accb-ae5a1abe947c', '8ff9be6a-bfa5-4a71-8c76-5f152427809c', '23276183304259320501', '229993148723568', 'LPA:1$code.demo.com$31WUJO7YQE0GKFGSV1YGXOPPZ5SSHA54', 'available'),
('af28a2cc-8c89-4347-82bf-14d4ccf4373d', '9009b30c-f938-4889-b504-50046a7f5ef2', '22581338421713083346', '747402537450759', 'LPA:1$code.demo.com$I41TTFT5YARW3WPBH8XVBZ5BR5UD71CT', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', '907e3185-abf6-4086-a702-d6141d0b6de5', '76660869679719385848', '080021455931410', 'LPA:1$code.demo.com$PTMGFC6WBEL4MB4KBFAGSM3CT3EDRO10', 'available'),
('e11eaf06-a7b3-4bcb-aa19-00f695b9e272', '90dd3198-9f3b-48b4-a192-6b76248e8f94', '65892180660833649699', '982172243641722', 'LPA:1$code.demo.com$NLQRI9284U3P33VEANITY3IE5ST4V4VY', 'available'),
('9dc48c68-a75f-4cc4-a7d4-ce6ff01cbec9', '91897b0f-bd8b-4e74-b8e8-aa5f30cb47cc', '44187272191781562636', '107495741743895', 'LPA:1$code.demo.com$PVZS41U3VH4L19QKT8QO9I3FN7SUJBBW', 'available'),
('9331f629-cc33-4f38-8294-4757e8627b74', '920aba6d-6661-4aad-92a5-e600233aac74', '20479968454416697647', '242787593992907', 'LPA:1$code.demo.com$256NHVQKJ4BNDGJ9HCAFYF48BA5QI48Z', 'available'),
('b71ac246-e162-4d99-a087-bf499b50b789', '92164222-ba0b-41de-a158-81e044289222', '16815235760267315305', '738055072598783', 'LPA:1$code.demo.com$YCGK56A0T322OOTQG9KDLX9V5SRA4IB6', 'available'),
('44ea41be-40ed-4339-8bff-de45994a77a2', '926119d1-a74e-4a93-8d31-5f742f65697a', '63550075973362280890', '709433595514464', 'LPA:1$code.demo.com$1P6D6EVD9W1FGSILLY0RAB1QMT0BH52D', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '930a7692-d4fd-4554-8aff-b3cfa949f623', '14114943175798249376', '756239351944693', 'LPA:1$code.demo.com$37L2R5B4WDGREXR9T0C9O25HEAS9IKIU', 'available'),
('90e23d02-e342-490a-8353-c2c85145d7b3', '93105069-972f-46b9-b419-43aabcb6dc32', '64636046373195311095', '601922632538386', 'LPA:1$code.demo.com$D9WWA18TKH6IWTCPCWEEFK854IKZY4JY', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', '9328fec5-05fd-4ceb-9556-7065b2f76320', '49357877396126160434', '905118761653046', 'LPA:1$code.demo.com$41ISCM3H31LWX0MT1RSB34Q9DVT3EJG6', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', '935f7e44-85af-45f9-99fa-2275c204a911', '36707489242631355883', '301318591555831', 'LPA:1$code.demo.com$J9RRHP1HF71P198D0R7H4UR328CL39BE', 'available'),
('0a06379a-dba0-4082-872e-40645e1c0393', '93684256-51df-4363-b947-fa439db58bc3', '73599559973631949668', '063031784952934', 'LPA:1$code.demo.com$GM7Q6ESEM2LJSBBZJ9J9HBELYNI6SIB0', 'available'),
('607fb6b6-fa55-461a-9535-41bba2e710f2', '93a9ce79-49bb-4add-88f4-f433d868535c', '09703029339160566305', '888355257515279', 'LPA:1$code.demo.com$DZSW336P3SZGZ7DDJPQ7X2FLTT2AJX96', 'available'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', '9404aa20-8df8-4c36-b959-26a0a33577cd', '76600058804405095327', '738261759711235', 'LPA:1$code.demo.com$ZUMAHPW2WM1PMUNI6UM2ZC3ZUH9Q20JK', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', '940c8ba6-017c-4486-b012-d89c33fe8740', '51721280322951608546', '040048252529924', 'LPA:1$code.demo.com$M64ZQAAWCOJSK60XQLV69PBNPGESYW1L', 'available'),
('4e141b22-bb56-406b-a0b5-42a48bf1af59', '9416eac4-9a17-47cd-aa8e-583005014ef1', '03300627106828415786', '656208421488632', 'LPA:1$code.demo.com$JNTC6W6FRAOJSYNHOKHEOU2DLNLU7Y6B', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', '9440b72e-2601-4e78-9f04-e5ebaae13033', '87604714449464893181', '250138517775960', 'LPA:1$code.demo.com$96331IN5WFAZNYRL0OOCSX4VRD1O56O9', 'available'),
('f1ff57fd-3196-49ee-8de7-11d6f886cd5f', '94552951-93c9-472a-abbe-fd1ff489c8cf', '07107444098764482635', '484922629017481', 'LPA:1$code.demo.com$B72D16UZMJSE9FMEROM473V050YBK04S', 'available'),
('8eec889b-4487-4c46-b2ec-aa680bbdd721', '945b9e1d-0849-4217-bbca-f6cd2df9f365', '36306506091729557578', '112451850523156', 'LPA:1$code.demo.com$DG1X16H344IMLK424KLOEWP5PU01DP95', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', '950ef290-ea07-4a2d-b184-d6ba0c12c816', '84084542473588424837', '742105176401782', 'LPA:1$code.demo.com$SSKITPOA4I3LB68P1L3REEXDN4UYOG2P', 'available'),
('09925e99-4237-47de-acd4-f9c83f739e0f', '95211e54-2614-4b67-959c-ad1fad26a952', '47002357880413550593', '136609878707277', 'LPA:1$code.demo.com$VZWZR28KTU3H0PQXS2C9R23D45M3IZZR', 'available'),
('385aeecb-fb20-47e6-bbf9-dfb6e506cc88', '95862e3b-3f23-4102-b8da-d0be104d3789', '42341251088953263480', '266926728677278', 'LPA:1$code.demo.com$UZ1M6JYEDNH7OQVUYW6IX4J5DIMEUM2A', 'available'),
('af28a2cc-8c89-4347-82bf-14d4ccf4373d', '95a21fcb-528f-4bf1-994c-f7a16691a2f0', '67171084843571180268', '869049694092631', 'LPA:1$code.demo.com$T9YS2L2J748D21IFRBJ3W8L6E4VO8GWL', 'available'),
('b18078e3-5ea0-404b-b015-4b7e06196a03', '96341a26-6050-46b3-aad9-a73b6c940e1e', '58544814707646270461', '233683942393132', 'LPA:1$code.demo.com$29PDJJDU2N5SRZKDB505TAPA69TA9PYI', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', '965d6d04-c635-4b00-9bec-f76f29a94535', '56488875790944200584', '109807015195569', 'LPA:1$code.demo.com$0N47C18AT26AK0GYX3GJIHOY5I57H3II', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', '9663e328-5891-4d0c-83ba-d41c73ab6ebf', '06148377350190872486', '775122407081981', 'LPA:1$code.demo.com$CU20NC197WKOCCVSVR6I8RUHZC6CWGTC', 'available'),
('fc8adfb9-fe36-45c0-8d06-69bfd508c899', '96e61c1c-48b1-470c-990b-ba7b55217793', '11133174162031305033', '584077080386997', 'LPA:1$code.demo.com$B02747QCFOIFZI2IY169OZQXI6S75Y5D', 'available'),
('66ec6adb-dd58-479f-8547-cfb41e664528', '9782566e-98af-409a-aac7-a7298321dcba', '12633363811135580527', '687373555166128', 'LPA:1$code.demo.com$5FEPNU54ED2DQTPP5TEVR0PU5H1U3OLI', 'available'),
('2dcc8be7-f717-4749-a4aa-170b2fa1e160', '97bcb58c-d5ce-4712-9878-382f33fd857b', '09296218649476180800', '891256549787459', 'LPA:1$code.demo.com$GR7ADFVYERC6HU0I16XQMRWEDQU4EZOJ', 'available'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', '97d5f093-d84d-499d-9e76-76fc8bd03e55', '59880369443133833218', '931105896824087', 'LPA:1$code.demo.com$LCF2J2O168HO6MQ5A1KYT2AI9WQQZZLG', 'available'),
('bfef0194-d761-4587-9229-45771ff85965', '97f99922-e4ee-4868-b040-eb3201f5d8ae', '37124823518732317867', '921438059145741', 'LPA:1$code.demo.com$2PXXF8YTIHAELOS9U7S1MNBHJ67VMF9N', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', '9891dd04-d385-4a0a-8729-00b19c71e0b3', '90429130289702762391', '931637473358432', 'LPA:1$code.demo.com$TZTNCWKHIOFIK1ZSMQG7NBUHRDLUSV4M', 'available'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', '98dc89d5-559f-4338-a939-de1289e798bb', '20208518575184962450', '256692053979662', 'LPA:1$code.demo.com$R1KSU6LRWNBKJU5LL9PU2211MCOJQQTF', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', '993d6ad5-15fb-4ca5-b2fa-1f27e1f3f059', '92868342899983476278', '116198438327644', 'LPA:1$code.demo.com$V3B66CTKRVZESKAHYFN20MYALW8FQE4J', 'available'),
('3a211984-8c5a-4b7b-83bf-0b9f6d039916', '99c78e26-4556-4f42-896e-5e78051fe068', '76360583928388479163', '476758393537900', 'LPA:1$code.demo.com$9O4QQOBBOJ0PVQDTR8D54HJMIAX3P3HV', 'available'),
('05d44374-2606-4100-a79c-64c9699db094', '99e62f90-d9d9-464e-bca0-c7ab575e433c', '12932714115677251654', '259571601139423', 'LPA:1$code.demo.com$AP6ML6U0F8E5ED1VBLHNKVZ9USNFWDYH', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', '99e6d963-79db-4678-88fc-6d5913742f63', '11766923758150429731', '431318181084909', 'LPA:1$code.demo.com$JW9FIGMCR9FY6NHEAVCK50VXODBILXK4', 'available'),
('0c2281a3-3b02-4875-9663-40847e1c5bf7', '9a63fcae-9888-4748-bfa5-79740f4715ff', '16679441120342294930', '258702252796031', 'LPA:1$code.demo.com$NF6N99FNJNOMLVNZHX0K2IWRT5FRPT01', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', '9a7b8d74-857c-45c1-82e0-5eea38523b64', '04182885523696202980', '758300702609809', 'LPA:1$code.demo.com$TQPT06V0399YSEZ6DL1431D37ORV3JX6', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', '9a807762-644a-4143-a9dd-336e66998f93', '50810445210562370866', '175377612605341', 'LPA:1$code.demo.com$CW3B3ANBIL9E417IMBQF92681UHPM2J0', 'available'),
('f8651905-903a-46a8-9237-e9fc5e88a59d', '9a9c5c59-f7ac-4ca7-9f1e-954ebd8cfe99', '97283177967111061470', '824829209538866', 'LPA:1$code.demo.com$8IXFCLK9CWRJQSAZFZTH9MA342XMC7QE', 'available'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', '9ad3efc3-bfc2-4bad-b375-d53540848478', '69032207396258327434', '132842018347315', 'LPA:1$code.demo.com$I5ZDVQHJPXBVN6JEZQEPOFYRO7E48YMH', 'available'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', '9add1c13-1f04-43fd-8f76-ff80325aef04', '50239573848923472760', '917738164262476', 'LPA:1$code.demo.com$CVRSNZLFY6VKOODU5FBQ2N0RO0PA1MO2', 'available'),
('d26f02d1-3bed-4fba-9a2d-ade19b7d32dd', '9afe1f74-6474-4d99-9651-0e1869be9b72', '20235322061398947156', '851804585582900', 'LPA:1$code.demo.com$YIARH1HNHE0Q7368C594P1P87YYD7PK5', 'available'),
('b9a02fc3-b556-4460-895d-3065cd377641', '9b19103c-f943-4440-9948-f23b29fe072c', '84208889392119675252', '223672609186148', 'LPA:1$code.demo.com$KTGI1GLJCAV7S42C0V6DE0G9BD7X654D', 'available'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', '9b9390cd-6ac9-477b-b35c-a2a7300764d4', '54924062647201330923', '325809490976572', 'LPA:1$code.demo.com$GDQVXRZ2NUUJ84JV52JIN19ZF6WRVVOU', 'available'),
('36129492-21ba-443f-9197-a7623a997c2c', '9b9cbc24-8c94-4de0-beda-1800e5d6fbec', '90276124899928067641', '890250004398412', 'LPA:1$code.demo.com$HVFWL20AG9PRLUAP2IX769M134IPDYLL', 'available'),
('91fca936-4213-418b-9121-01faebcc45ef', '9ba5c148-af92-40da-8f3e-b767e5594d34', '21182332257134817577', '606007890071599', 'LPA:1$code.demo.com$AARH7GJS70LQ79ORCCVQYQSXDA2JNZJX', 'available'),
('92a5002d-021b-41f0-aa54-b6d6350a3ce8', '9bb5ce1b-cadf-4c61-a870-f3d02ff130af', '49398024116376693915', '239467497841465', 'LPA:1$code.demo.com$SMPP9UT6R0HWGBX9ZQDHGLJ0TCN8OPWJ', 'available'),
('666cd467-8716-4b94-bc10-8bfae45d1ccb', '9bb8841b-8f5f-4c4c-95b6-2c229768dd30', '15910773490178614531', '935193038358263', 'LPA:1$code.demo.com$DFETMZZZMVNAW4JIZBUM2KSUD64XC6PV', 'available'),
('547e8d96-fb59-4cb0-a469-db74bf912703', '9bd218b0-6989-4d65-ba0a-74241dc8ac09', '82286355603279828121', '216203104081532', 'LPA:1$code.demo.com$M1AM8PS6VGCULF2I2NHDKD8Y22Z9AOA8', 'available'),
('4fe9ee34-3e98-4dd6-a484-2272c3bf7261', '9bfa2a17-1585-4ce9-9d90-2b39d1c32097', '16285574474130914911', '975394162208188', 'LPA:1$code.demo.com$KMTU2G2YSKSPQ20OTLAZO12UK42YEY5F', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', '9c1a8ac9-49ca-401a-8ad3-7951cb1ddb74', '88033192986903531116', '606844177202474', 'LPA:1$code.demo.com$QW3ZIO66P0KGWCMBTNDIO40G83X6ZCLB', 'available'),
('547e8d96-fb59-4cb0-a469-db74bf912703', '9c451a85-d29c-4474-98f8-fd754d7b1531', '56841996192056518476', '682852686241335', 'LPA:1$code.demo.com$OHN0YJ00EUUFAFRBDH8PWLBWNCM4C0W6', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', '9cf0c084-f09f-41bf-9059-9814c06222a6', '78593264641815773897', '033569436234204', 'LPA:1$code.demo.com$TIBVQCL8EDPS4XYC3WDTRCXDAQK7FADE', 'available'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', '9d0d572e-dba2-4e6c-ab1b-7bff338fc953', '91452999232175129972', '369238484898605', 'LPA:1$code.demo.com$K0GUDD6A6RN4LWB4V7Q5JJM49F6CKAR0', 'available'),
('8affb6bf-f360-4bcb-b08c-086989eae7df', '9d38d963-4bba-4eee-8484-f7c7199c8ceb', '36171833391572931963', '314128585770436', 'LPA:1$code.demo.com$5RPWEPY75TD8N9XA2SIT0Q74BRGD5Q6W', 'available'),
('0a06379a-dba0-4082-872e-40645e1c0393', '9da60ea7-49e5-469b-bc11-36140e9bf08a', '82857589687264407409', '897791076762413', 'LPA:1$code.demo.com$Q62FMF617ZUD85B9KXO9577ZVXZLY2NZ', 'available'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', '9e56e8cb-690b-4829-8445-99ac5b4a64ea', '14420982294331892478', '872645577309270', 'LPA:1$code.demo.com$BY3X91UMQTPHDCB0YCYGT43YB2EJQVPK', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', '9ebff454-fb9d-40d0-b108-8711778310d5', '34900233633105174306', '905084631683853', 'LPA:1$code.demo.com$1A76SYIWREOALEH2PKAQBL6O2R0GFQFT', 'available'),
('64feb637-d560-4b7b-ac2f-f81a347e9098', '9ed14883-581e-4dea-b7f6-f4ec4b0a7831', '22719928493840059799', '313139915205145', 'LPA:1$code.demo.com$QKSDROJT8EB9VTOB4Q8CFKQO9PCQTWF0', 'available'),
('4e141b22-bb56-406b-a0b5-42a48bf1af59', '9ef9bc36-3564-47f5-81ea-1b7981757c13', '54338325434941559122', '709411843965929', 'LPA:1$code.demo.com$DOWC4ITOHA787Z45B5LCAXLRBBGSSB3P', 'available'),
('f50b53f8-ab49-4b71-9226-727124563dce', '9f4dcdba-3fdb-43c7-94c3-d175c7aab024', '39252680122308006357', '268236943848080', 'LPA:1$code.demo.com$OW7X2QVU81VELM85M42YFWQJ0B4CHZFT', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', '9f8473af-d77e-48b9-9bfb-b92ef8a23ac7', '58235489610111096582', '226519749950600', 'LPA:1$code.demo.com$C1I1GQ0HO84LM84JU7MWE75WKI4GM13D', 'available'),
('11df7336-ec98-4b37-b02c-29095ebb3d45', '9fa0fdf6-b465-496b-9b8b-d68314bbc74f', '59375089236176606357', '456036343098970', 'LPA:1$code.demo.com$WPVW4308AOG0KN0L16Q9Y6E7A3VJ1ZCH', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', '9fc88181-1ee5-49f4-98eb-a7b06c0898b1', '58833049238573677185', '195818440698167', 'LPA:1$code.demo.com$B2WU0X7OGFT66OG77HRQGQYI0U2D4Y51', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 'a08b7a97-221e-4d1b-a97c-05b0babd2ce3', '88714777467062999528', '187779333358484', 'LPA:1$code.demo.com$DGGE1WKCR1QA7BZ7CR0GBDY7AGX6EWUZ', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', 'a0c6b829-9db4-42ae-9f8f-c218b52f2ad8', '93920335228344169781', '110093579783271', 'LPA:1$code.demo.com$IEK3A5VVNQ3WPRG6P52J6S8SOAD7DLYL', 'available'),
('f1ff57fd-3196-49ee-8de7-11d6f886cd5f', 'a1556e76-57fc-46a9-a8ab-b63ebb5c8596', '80446403567058999056', '380469047169170', 'LPA:1$code.demo.com$0MPUS8E21FFB5JMQ3ZWZEP3I3I1UK0RV', 'available'),
('ff3bf3ce-7219-42db-89d7-43adbc1a263b', 'a27c1dbc-3390-4f07-ab3b-c862b759e4bb', '17363615483393430994', '656983284995021', 'LPA:1$code.demo.com$ZPJDNDXVH236BWP6JR0WI4UBQQL4VNP7', 'available'),
('c36b3ba2-e433-4a4d-bceb-46171388bb28', 'a335e82b-b657-42c4-8ff9-034c8a438513', '74108918349108384212', '841194565984523', 'LPA:1$code.demo.com$X3CCVY7D9WD55SJ4SLRAI16644G328E5', 'available'),
('dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', 'a34709b4-0a18-43d5-9968-ce65bd81c5ee', '01122295736595354460', '456777993843453', 'LPA:1$code.demo.com$LCFA7X0RWSYXOL1RT1RESMO2TJJC2HRC', 'available'),
('d934bb7c-f750-48b3-ac92-86903494333b', 'a34ade3f-84b5-40f5-bfd5-8b349e1f2af1', '56196242534271863059', '641926644781998', 'LPA:1$code.demo.com$FIO9BRV1MTISEY8GBLINAZMWOLCS3NBQ', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', 'a34c2aaf-2e71-4725-8185-83e897e21e15', '07161636288852421023', '859438011246769', 'LPA:1$code.demo.com$R7MFT461TX3CQ15J250F0LPJPE82OGOD', 'available'),
('44ea41be-40ed-4339-8bff-de45994a77a2', 'a39be41a-0330-4485-8478-1e7b2b63ccfc', '72598686578178605666', '354889600850596', 'LPA:1$code.demo.com$9G0QDGHKIYST4GTMW7QDTAKVWIQKY01M', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', 'a3d78229-6d29-4c17-bdef-d089cf249849', '61023726208623453098', '063347614155439', 'LPA:1$code.demo.com$LM81I3WYT2U95GPMLW7J40JJ2ER4OCE6', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', 'a3e894d0-0d41-4f21-bea2-e92655a3a897', '68911138249180512762', '849088244577837', 'LPA:1$code.demo.com$AR0NHW1U9MRX8LRF80XO2KL2M1Z5FFJB', 'available'),
('8eec889b-4487-4c46-b2ec-aa680bbdd721', 'a3f08907-b864-4d12-82d2-083a07bcfa62', '82110516484336496983', '471185876677735', 'LPA:1$code.demo.com$XCBBPV4I89H1DLEA7X4E3RBYV1U7KG3M', 'available'),
('d4b597b3-46da-429b-9de6-b2110f2fb552', 'a44b4d45-ad15-4bb6-84ad-31441b8837a0', '60746143980585561855', '610150620249144', 'LPA:1$code.demo.com$Y1X6FHTRR5XEHM93H839ZZ0LL0S0D585', 'available'),
('91fca936-4213-418b-9121-01faebcc45ef', 'a4c20cd1-17a0-46f0-8dff-4dff8428a658', '51344673694165689481', '464664789057382', 'LPA:1$code.demo.com$81NBO0FVQL0YR8ONNHIHL6MZ6H75P9O0', 'available'),
('64feb637-d560-4b7b-ac2f-f81a347e9098', 'a5057766-cbc1-4c7b-8ef6-ae80c4efa978', '98933223865825354610', '195130028885487', 'LPA:1$code.demo.com$6SYCPDGAA49LD9W2N7ZUVPJ0FZYQ7ERX', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', 'a53ab37d-d9df-4df3-90a2-4fbccd2cdb07', '91841633329842275943', '980166012333027', 'LPA:1$code.demo.com$7YFOS0A4ZTLQ2RI4B6T3FVUGM1F1B26Z', 'available'),
('a44d6f2f-61cc-4a05-b984-568c02f6f111', 'a5de25bd-63e0-464b-a058-8f7527f1ef42', '67082672218275724427', '376284688442735', 'LPA:1$code.demo.com$UZGV3RLTQ5JS890GG5RVFGZVMV9NKZKR', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', 'a5f3f051-8766-42bd-bf40-a5106aaf49b0', '60944608119253624348', '894086834892153', 'LPA:1$code.demo.com$J6WL94T9AEWMWPC16D62AO6FOBXOFWVL', 'available'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 'a6198269-a7a0-4ca6-9cff-023fe8dc7840', '29549056809638521715', '371042596993743', 'LPA:1$code.demo.com$305AV2ZQVZZ726BHWC6MCSG3T1370OUF', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', 'a6365570-aaa5-498f-8dc3-6400d085b730', '58082395835131144625', '477648834388771', 'LPA:1$code.demo.com$EUY9HO6BFV73EI3ZJA9BS2T4K4WBV0MP', 'available'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', 'a64717b8-ec8d-4889-8986-08b5c401b109', '78293710785769846451', '582501602878810', 'LPA:1$code.demo.com$3SRFGNU9ZMBE1YGY5LW8BONZLJGRVHII', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 'a6bd0a68-f954-4e78-9c71-8339120294bf', '26911100850198911241', '950287778507046', 'LPA:1$code.demo.com$KYW5CSQ16T74SPCNSZNOHMMNNLW7R5NG', 'available'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', 'a6f4fa98-ce0f-4b18-ab36-ac09ef09abc1', '27533280515048163492', '324097412712223', 'LPA:1$code.demo.com$3GBG1H637TKOEFM64P2P8C5GY0JJV6I5', 'available'),
('df6771d7-ea09-42c4-9ff8-a752a462d64e', 'a72aeff0-0878-4591-a0da-2fbae1c5853b', '24783534197631503265', '281322742773900', 'LPA:1$code.demo.com$7980ZWP5NK20KYIEH5OE59PGZIUUD5P0', 'available'),
('1fa157a8-1c21-4495-a7ad-0e38c6e70769', 'a7e6f74d-aa27-4793-9713-fe7f1dbe18f4', '92145378997288712482', '937347827064940', 'LPA:1$code.demo.com$6KFW8D8S4PXW516ZLBJOZ7CTK6LJ5Q9Q', 'available'),
('d228e113-01ec-4173-a275-67e5dbd3f00a', 'a7f6ed64-9adf-4d40-94e4-f151fa24fd69', '98345533511553099134', '037762102969069', 'LPA:1$code.demo.com$F805GF3D1GNEYLDGA666D91HYMQTPEIF', 'available'),
('03be8bc2-1e20-4482-8dc6-036064614db6', 'a82bffc5-28f4-44df-a3c5-ac913fab7ac5', '69789033520148728974', '069877739339022', 'LPA:1$code.demo.com$QJ76I6E05QSEE8HU5IOVQTONMVRQ26JB', 'available'),
('507f3503-1f2d-4428-a46d-a82e2fad56ce', 'a862292b-70cc-49a9-8628-c1740be65dbb', '16681033087609897100', '489745727645022', 'LPA:1$code.demo.com$415GXO4GWA7K01Z3TJ0FBS62RBS1KK9O', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 'a893b40e-c7f1-4e89-abd9-a9a4bf053fd5', '39894091392037195711', '168424910648469', 'LPA:1$code.demo.com$LCNVXVR10IE1BBLZ7Q14W6Y9F2W0FRE6', 'available'),
('0ae6b101-ba17-49cd-b9c8-92ba770903be', 'a8b41ad9-f2a0-463e-8555-23e43f0ead6a', '10960104567483773911', '905835968421602', 'LPA:1$code.demo.com$FVNAVAN3GI8HFFD6AMCXXROJEH63TH6A', 'available'),
('a60ee5dd-3acf-4afb-9d20-01edd5d60cb7', 'a9ea967b-0988-42f0-84cd-eab085810576', '00073815496171398908', '868024593747099', 'LPA:1$code.demo.com$L7EEHGNZPH1GOHGAA9674I1Z9BTU9JHU', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', 'a9f96501-e977-4a39-a334-ea7f1914c3bd', '93329462711265921365', '343835853521946', 'LPA:1$code.demo.com$DTTSEKMC46FBUEBG38KHZPPCZI258IYH', 'available'),
('e3dcd9c5-3512-454f-92b0-0637d5ced156', 'aa04fedd-d22e-4fd3-abb1-899944dbd2b2', '85786752837841525182', '912651271619870', 'LPA:1$code.demo.com$RGCP8UUTQLQRL7HQ7I35F3JIBCS6F8VM', 'available'),
('867d5991-013b-4922-a9e5-f00aae98b9cd', 'aa2e6b8e-7122-4258-aba7-8302c779b382', '46920179792847642989', '258184427136380', 'LPA:1$code.demo.com$WIOWUUVBDGGRYQPOUH117BBPON86D08W', 'available'),
('8df03d84-b222-41f2-8560-a268aa57ef94', 'aa91cfeb-fa33-4d83-875f-49775464b589', '82869278627036400125', '631550640338122', 'LPA:1$code.demo.com$GLV9OXY1R1LPCIGS27ER7RKCLOPWLT07', 'available'),
('4b5f225e-3828-46bc-86c9-5bdef91d2e86', 'aabc0cd1-7265-467b-89a8-535796c2778f', '34772570871296347471', '677590041387557', 'LPA:1$code.demo.com$CR10O7G2L7ZUVXQNW5AXYMV1YAEB8N0E', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', 'aafdacb4-a2a8-462f-b42c-bbf5988839b6', '69425377270753101619', '984373574990546', 'LPA:1$code.demo.com$DZZMYIJ3G5DXFUPHMSTW2CE13JFKPIGV', 'available'),
('01cd0f2e-f4be-4904-b08c-8ae448ddc80e', 'ab829d28-e929-49a3-b377-d65874826437', '11181019639002829974', '917566832222001', 'LPA:1$code.demo.com$X3UFO12KHXUCFSX1EGHY3HXUCNZ88EX1', 'available'),
('622f5c1c-542b-4d4b-8044-aaa9d6260463', 'ab8554a4-59f2-4571-bcf1-a0115403728d', '92063267502461760492', '500264612841179', 'LPA:1$code.demo.com$HHOP0NN8KDLQ2PDGK4NCW9O0UG5N78DB', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', 'ab9de4e2-c369-429e-aa0f-59d1632b313e', '64314059675354075180', '395368428870541', 'LPA:1$code.demo.com$82H7MWYG702YTNS9YGALBGNKK2LHUP7A', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', 'abcdf9ad-e5a6-4204-b6e2-4a4164877d11', '72293450155641995214', '711595164832550', 'LPA:1$code.demo.com$TDJPNUE89BSC9VBR5OHTVP9ATXY1I0VW', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', 'ac744be3-4c4f-4c52-876f-c6bacb0b0031', '34524214638768076272', '543593797240124', 'LPA:1$code.demo.com$8DO843J4MGRXO1W1CH05VCV8DDKILBMF', 'available'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', 'acc4b7f5-b1a3-4c1b-8807-f605ed415573', '38652601139277847926', '151947008710871', 'LPA:1$code.demo.com$1TQ2NZMBGPLNP8DE3GV5OA55NFVXX0DB', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', 'ad722f2c-3c03-47b3-8b62-157f7593f020', '34628586202365261331', '810661660567258', 'LPA:1$code.demo.com$2360O19KRL8FYG7COKOHDEW8NVIJBS9O', 'available'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', 'ad8d7cdb-1f36-45f0-bb07-54b20d0be5ea', '29006484419366301523', '166084595942082', 'LPA:1$code.demo.com$BGDUOENZ9DIPL5FCXY5XIS6N247VIICZ', 'available'),
('c0b05975-5b74-4d19-bf7b-6d6c93a562a2', 'ad952b7c-d5c4-470f-9527-b339665d5362', '62230787783456181180', '154474596276413', 'LPA:1$code.demo.com$V5HH32NRIKS5QTMO387FZ9F806NF54MQ', 'available'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', 'adf34d37-8550-4453-9b2b-9ee4d287b119', '00482799711250489405', '264149325071228', 'LPA:1$code.demo.com$HRK6A2W74XHA59LS6RO1WBO1222FACTS', 'available'),
('6618653a-8531-4a48-bc18-66f6783ccdf6', 'ae714b22-3eb2-44ee-a93c-f830f6fcae27', '56769697817861580388', '739143650819595', 'LPA:1$code.demo.com$IU8JPTG8MBVOW8QX35PLJ8788RD4KJFZ', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', 'af319e65-23e7-4666-9274-241cd1c5befa', '86921379337143345351', '356240641430749', 'LPA:1$code.demo.com$0K1Y2N6H5CG27KG6NSXHMP1ZG2PE5GWA', 'available'),
('e9f15ed5-016c-451d-b96c-482463e316d2', 'af45cdea-1643-4d20-be7b-83eda5a0a9f8', '54535381621619013973', '944537207918374', 'LPA:1$code.demo.com$7ZVNBRGVAR1R3J37DDZLSHSH2Z45CQF7', 'available'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', 'af5da2dc-ab78-4f71-96fc-740bc7ac0218', '20940261070021989280', '552204073186180', 'LPA:1$code.demo.com$SBE7VFCAJ89P6UXERO8GN73XVTYDZQAZ', 'available'),
('d02a228e-6a2b-4b05-8570-fe7956f08628', 'af9cb82b-291c-4125-ae49-cb0c0d9c9b5f', '79919221146529918956', '164077351546951', 'LPA:1$code.demo.com$1OFXZK4OEQVZOT676MUCWU1QQGKLR421', 'available'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', 'afbef729-871b-4065-9363-5a959b286daa', '26065621851305899871', '003998475735228', 'LPA:1$code.demo.com$4QRXGX9KN25XWDRRA829NAQKZGCRRDRA', 'available'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 'b02b212b-a00c-4ae2-98c9-3a9cd6777713', '10665728158637899482', '300830063448493', 'LPA:1$code.demo.com$MU3MQP6R259LGHPMK0UPPTAWTCDWQ8JY', 'available'),
('f197448d-ed17-4091-94d8-8a932c534aab', 'b03f8352-1ee3-49a9-9bac-ea1e76ebbe33', '82521792071252250848', '300294245135841', 'LPA:1$code.demo.com$MDG4QVVBIWRK1RLM58A3BJXLZ3C9L3DT', 'available'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', 'b0879b97-4544-4443-8b36-bb865c064336', '23874668143339527457', '465196961743430', 'LPA:1$code.demo.com$KTXO3M6M70NRHC80NHNAM5UBA51VCTZY', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', 'b0fa6cb1-ad07-49b9-a741-a200e783ef09', '32846070479179309998', '104741380333883', 'LPA:1$code.demo.com$WRMLZQ3PR8O1ZT3MQHMNJ280RZU6H113', 'available'),
('d574eb3d-d1af-46de-867c-12b162d2cbf4', 'b0fae600-5e75-48eb-92c2-d08ccc34669a', '57260171319377112340', '090488035643923', 'LPA:1$code.demo.com$VHRJ0U6WRFXH6K642STDC0WKDYQLKA7M', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', 'b1474894-07c5-442f-90bd-0729d90fb822', '50767026538017398557', '194942582604435', 'LPA:1$code.demo.com$BFK52KNZKXX9MIPOXTS3IOG6FZQQ1RPC', 'available'),
('9331f629-cc33-4f38-8294-4757e8627b74', 'b1a90df3-b0b1-44b0-a221-9b5fa66e8d3d', '35397115027107624142', '331600558213731', 'LPA:1$code.demo.com$QGELAL83ITIRD4IAFEUKY3G5U9ZAU8NZ', 'available'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', 'b1eff6b4-2af6-4c30-889e-12ccc5a189a7', '27241530073316463807', '347208618331744', 'LPA:1$code.demo.com$EWYD3346VY6LUM805UR2ZOYIR4RT2LU1', 'available'),
('b82bde93-00a9-4d61-9111-7a29f0433642', 'b23dfb03-4399-406a-8bc4-e2502c33662d', '61068006031987778714', '866081562755679', 'LPA:1$code.demo.com$5CHA2M1MKW05SCGM0LDFI6L3ARNADV3J', 'available'),
('bece1e79-beda-42a7-835e-fbf7d62cf22c', 'b26839e2-426e-41ab-b02c-fa0677ec76ac', '81557183091932708498', '151487675332973', 'LPA:1$code.demo.com$9YZF5YBSJXVBK2GKTPA8J4XB5Z2M7LU2', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 'b303749f-2722-4d21-9ab6-b4c18aa9556e', '20891119915497695239', '466331481633338', 'LPA:1$code.demo.com$W0RGEG7IC3FXZVDY3156OCF2FKWFLZVH', 'available'),
('3c87a8ac-01d1-4d0a-80e2-a869c56deb95', 'b366dd40-05ce-4892-bd2a-2dcac02d051d', '01115781983839259773', '812010481935415', 'LPA:1$code.demo.com$HOLUEGDHJSHLOSY660MXEVMTYR1O8DV7', 'available'),
('2af7024e-0176-42cb-b595-9cfcb49b3a06', 'b3769bb6-5e2d-42b3-91db-e09545b139dc', '77024353260496653715', '909392466289137', 'LPA:1$code.demo.com$09HAYQBU7VMILRHOMUBL9ZGGJXGHI4JN', 'available'),
('03be8bc2-1e20-4482-8dc6-036064614db6', 'b44f6537-5024-42d6-87f1-53b8eb7bb586', '17159441333182241544', '355913188205042', 'LPA:1$code.demo.com$H719FXTJLHDUDD4RWN4LQ22FTVSR28E9', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', 'b473766c-5c46-48c4-985b-75bad5275a1c', '34869104692486742355', '849984133589748', 'LPA:1$code.demo.com$1HURE9I0SNM3IBJWY2K5SDC8FUAJYIBG', 'available'),
('81125430-b0dd-4e2a-a90f-6169b00a5afd', 'b478aaf6-2b66-4499-a661-231afe3bd392', '65819424957608510254', '137489587406290', 'LPA:1$code.demo.com$LJ5OPJ666RSU2UDYPGZI9D9KF0CWJ7U9', 'available'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', 'b50ffee4-e4a0-4b72-b4cc-8017760a933a', '25778179524650752822', '047539593781325', 'LPA:1$code.demo.com$KADU4SOFN98XWN3J6XWX2L72NCZXZ6QS', 'available'),
('0ae6b101-ba17-49cd-b9c8-92ba770903be', 'b56d6741-5bd4-4739-86c3-24c8acc92961', '82862955635315103842', '574099799682567', 'LPA:1$code.demo.com$X76MDUSDC6LVE8VJ4EQ8J4IE8KCYOCES', 'available'),
('e4197d22-7677-40b4-b61a-ddf6fc3d0aec', 'b58d7b64-9efd-4c41-99c1-fad5aef6d001', '87459374894892884296', '248229283954813', 'LPA:1$code.demo.com$9G1FO2I5VN2HUFMV9YS0BPLP4Y7ZJ0IM', 'available'),
('d1824057-970c-4dde-89bb-1433a20ae7cc', 'b5a6965e-fb1d-42ba-a860-fd57df322721', '92165829433743590358', '823972531761944', 'LPA:1$code.demo.com$5LBJF1DAMB718J4DJJ72TSP546AB1QZY', 'available'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', 'b617f226-433b-44f2-8fdd-ee592b68f883', '41020896238120133528', '773985782210410', 'LPA:1$code.demo.com$HGL9KX0A7CAMV3M75MAZSOYCIO2BUGGO', 'available'),
('01e0eff2-6e95-4955-b771-72ac99b68657', 'b64e882c-2082-47f0-bfe4-57f368706e47', '71702507021296938973', '031349925474799', 'LPA:1$code.demo.com$WV0HCSWHXRYLJEG83U4XFU00Y0XNQULC', 'available'),
('7e713e18-46ed-45d2-b54e-bf087123ab60', 'b66c02f1-2ab2-4d53-b5b8-5b572f8a746d', '78837481610740198272', '497006593359253', 'LPA:1$code.demo.com$7OJHXUO0J98LWXZQI813MB5MO6F2X5N3', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', 'b6ae6d00-2b5d-45bb-beb4-e37583d52367', '62394922132263484425', '794815246906264', 'LPA:1$code.demo.com$HKMP8IG7AUTS3BZHB66ZRE19UUTJFJKP', 'available'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 'b6ca5e12-585e-4b6c-821f-0e13ffc3d2e1', '84805896023322097177', '758387638395897', 'LPA:1$code.demo.com$1VGMULQ3KMLM3IFRGV4N52JNQLX0FIR0', 'available'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 'b6cfe6cc-a8e2-4c1e-b20c-93a68f53a866', '93975194861999837639', '082283578484023', 'LPA:1$code.demo.com$LL4EPXNENYVZC348X45E42ZTSSB31SS4', 'available'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', 'b6ee7589-6198-4b64-9679-5a64e74997f4', '88855183144127452975', '721291562723086', 'LPA:1$code.demo.com$06CSGI9IX0P8S0Z3MCKTRTHB1ZIS13U1', 'available'),
('81125430-b0dd-4e2a-a90f-6169b00a5afd', 'b7352be9-181f-491f-bc93-cc7fbf1f2acc', '25173908899977874577', '174189929990571', 'LPA:1$code.demo.com$OB32RZ7XYXI6IIUX8AHCWX1W8Y2LY90M', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', 'b7bedf36-04a1-4f1f-bd4c-af11aec5f916', '69784922280046462911', '518882048682302', 'LPA:1$code.demo.com$WCFZEF0O7X92QOXWGA2G6KSFA55IAWHP', 'available'),
('797526bb-9f4f-4325-8f80-856fb2496c3b', 'b7d51c33-3d9a-4df6-8a8c-9eb23833e095', '32689315457517672462', '926588766919018', 'LPA:1$code.demo.com$5OBK49D2Y7INTNDD7NSCMGWO9B26TQE0', 'available'),
('af3cfa07-0c05-45da-aa01-b0f8a54df2ed', 'b7ef42e9-f54e-4d45-8941-e19b10a63b6b', '60902339680342736561', '934698487237196', 'LPA:1$code.demo.com$N00ZMSR87HHQ9MUSQC8N3FN8208BKTNA', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', 'b80e9cec-370d-479e-af8c-730dee72107b', '50682873909556129637', '068449432131576', 'LPA:1$code.demo.com$JQSADQP4R8G2N4MQ4F3OVNW247RDUNLU', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', 'b810f29a-7540-46f7-bce3-a63996f9abd5', '29805119273402583098', '981953977946584', 'LPA:1$code.demo.com$95K5IKJ6C395ODPCLL0PY4A57CEUYZ08', 'available'),
('547e8d96-fb59-4cb0-a469-db74bf912703', 'b850429e-29f4-4044-8898-28dc8170c4c6', '73070108913920871882', '050042427915603', 'LPA:1$code.demo.com$F2R58HB0DF3FQ6UZUHF4LMVX7A1VG5SS', 'available'),
('20647fac-7e92-481f-a6a7-ca1e8c451910', 'b867594a-a6dc-4739-a36b-7afdae2206c2', '45234880491003911605', '000174524185767', 'LPA:1$code.demo.com$KZ523HP5PPUXYVDLVF73K4TI9XYLPQKO', 'available'),
('3efa96a5-227e-41fd-85dc-39718ebf399f', 'b8bbafec-faea-474a-be8b-6b79029bebf5', '18382156875142478071', '963925654165402', 'LPA:1$code.demo.com$5WKWU0QYH9T9K6VSOVE23BMBGT7I2PVY', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', 'b922f565-214b-4721-8d36-e3b293b24ee6', '99315086915328519181', '313169778604809', 'LPA:1$code.demo.com$SJGGQ08MY6ANV7T036Q2MY3JR01CR0RN', 'available'),
('81125430-b0dd-4e2a-a90f-6169b00a5afd', 'b93f79c9-6d9d-44c9-a6b2-cee9eecbf58d', '98704676047641011576', '907640076103248', 'LPA:1$code.demo.com$W5CQXGKBAZMJR3HSEZVDI1A4V2XF7PQW', 'available'),
('91fca936-4213-418b-9121-01faebcc45ef', 'b985fcc7-48b9-4c18-b437-dc7106be44ab', '88654532278139025095', '008996460700383', 'LPA:1$code.demo.com$I8H0KYKAR11BTQZYNN3RZB1QMHGE1XOP', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 'b9ca223c-e63b-499d-b856-d89d6244dca1', '11814500732471560641', '901086255684805', 'LPA:1$code.demo.com$4DYS1C2LQ6APS1R1UGY0EA5HHR3RQB90', 'available'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 'ba1f0224-47a1-43e1-bf5f-ecdf755eca63', '44037962210799732032', '631612710850035', 'LPA:1$code.demo.com$AUZT4GRHGWILEMQN64WPNZB06OSMNPF4', 'available'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 'ba3bf403-790c-4e9c-adb6-c5bd5068eca0', '92054739168313709199', '535806356916748', 'LPA:1$code.demo.com$R4TZRYH99CBWRVWKQFLDQ80XWHDDRGIM', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', 'ba7c6aba-d692-4565-b1cf-515f42afb5d3', '23187408655169499538', '881366941336228', 'LPA:1$code.demo.com$UUFF6OOU88Y7RICNEQ4BLD1FS74SDFSU', 'available'),
('d228e113-01ec-4173-a275-67e5dbd3f00a', 'ba85e742-9157-46c3-9527-923b2add3b64', '42530821825527187074', '297811260248167', 'LPA:1$code.demo.com$SEVAWO5GCB8DBFZZJZ7FBT1MXRUNMK4B', 'available'),
('f197448d-ed17-4091-94d8-8a932c534aab', 'ba8938b1-60f4-4e57-9493-fe1d2aaa1139', '01235711065614010018', '257899150717680', 'LPA:1$code.demo.com$Z53ZGUTWC0ZHD695U1F769ADI6839IOS', 'available'),
('0a01dc2b-374f-4deb-b5df-997410a54ee5', 'bb0240f1-8df9-4710-96fc-322d3337aefe', '75037658720034808862', '671515338655012', 'LPA:1$code.demo.com$GRKCSK2ZAAFAZ0W7TFO262LVIZM1X1LH', 'available'),
('05d44374-2606-4100-a79c-64c9699db094', 'bb4a744c-16ef-4888-b99b-fc16074494f8', '66488302456130823068', '296291432310352', 'LPA:1$code.demo.com$AZLOQLTCPA9WHUOH0XAR1D1AE31XQDOK', 'available'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', 'bb55f43b-18a8-471c-826d-99216eb1f7f0', '48014769260900324672', '823601296437693', 'LPA:1$code.demo.com$3D1GOVQY8SHTK2O39SZMNXS6XVYS3TMO', 'available'),
('8d5b3c0b-7f30-4372-a8bb-08859f172450', 'bb7fd413-e467-4d79-873e-ed0ca0784e1b', '30306287904361625166', '339932627662792', 'LPA:1$code.demo.com$LZAUP9PDSMFT5AHQ60OPHZSPAEW1TPEL', 'available'),
('6618653a-8531-4a48-bc18-66f6783ccdf6', 'bbc577b0-f04a-4ea5-b445-2cb59a220334', '45033621207142977074', '071369192521233', 'LPA:1$code.demo.com$JB0MW6HSCHB96SKUVL0QMWSXBOAO0VX6', 'available'),
('66ec6adb-dd58-479f-8547-cfb41e664528', 'bbe2c731-6f6d-42ad-beb5-014d0fa8664a', '14114743620883394474', '568029502497160', 'LPA:1$code.demo.com$ILH5TMBTKYN0WT6EPKUUGQKNJSH6CNSO', 'available'),
('ec705aa3-7a3c-4917-b9da-60dca7a9f593', 'bbe31705-ac11-49d0-a9e0-1a756318b532', '93715524278354349200', '296909616933414', 'LPA:1$code.demo.com$J6CVHN2QRE2F0DMVE9PR8LEPHB0JBWLL', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', 'bd27888a-ed02-4f8e-91ba-96574de00531', '03662913279931983449', '914098398888651', 'LPA:1$code.demo.com$0JIPKNTW9UKU9FDAM9P7QBZFP4AGUC1I', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', 'bd57198d-1ec0-4f23-a4c0-6aca8527280e', '86389416858601254109', '770678590391985', 'LPA:1$code.demo.com$7HKTI5W2JYQQUSS8PTW9D8RUTDLO898D', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', 'bd5ee2c4-82b4-4cb8-8dfc-cab9be262e24', '67721421680355950724', '386423096511173', 'LPA:1$code.demo.com$Y5VABR16W5QV5H88LWGNOKDKYHRAD9X6', 'available'),
('906ae15d-02cc-42db-b7a3-213042e7fdc7', 'bd788b2d-3996-4ef4-b27f-99db52208f05', '44507508532999816583', '175541386694676', 'LPA:1$code.demo.com$W3A4D00OR112CGUD8I2HN3O9B04S47WI', 'available'),
('aa747bc5-2197-48b1-90a8-fb7b4e448ff1', 'bd7a1b55-c6a2-45ff-b5c4-9b3a2b82693a', '29696132748154173783', '377965365827410', 'LPA:1$code.demo.com$DRZQG6LGFXXQH9EW9BOQBUAAOSPPZUPN', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', 'bdb5692f-6c99-49a7-9ea0-823a60345c70', '81236052934363928058', '782014402516426', 'LPA:1$code.demo.com$RL3CP53P2A4679GNEQGH50XAMSWXUJWS', 'available'),
('44ea41be-40ed-4339-8bff-de45994a77a2', 'bdee1e09-fde7-4faa-8010-4cd75cdec19c', '18818461328941200236', '996696065377695', 'LPA:1$code.demo.com$NSR5J4H8SBVIIX9K9VDC8DHGPKY6YXBO', 'available'),
('66ec6adb-dd58-479f-8547-cfb41e664528', 'bdfe87ad-c74c-446e-b9ff-1c70b6b9362c', '94869527924201325557', '987978859316878', 'LPA:1$code.demo.com$ITRWL1GIFX8SG823MGROHPRHV2J2HOIG', 'available'),
('b3378ac1-e71a-4172-b73a-fda355742af2', 'be0a82df-5340-488b-b197-1b6f3cf41344', '77952172325395639975', '486106184236001', 'LPA:1$code.demo.com$LG5FLF032ZR5OD2FNGQJIHTT39DXV5AF', 'available'),
('5955df61-0197-4e53-85ff-ba92c3289ebc', 'be64e4cd-186a-454d-8fb2-458a725a5dfc', '51021208272449113656', '699525841908766', 'LPA:1$code.demo.com$1YCS1SQ54M3XSUVA0EKYREJABYFUEGJP', 'available'),
('b71ac246-e162-4d99-a087-bf499b50b789', 'be9dc282-0d05-48ad-8b0c-fc6a927fd30e', '39815115067500710463', '545645620902439', 'LPA:1$code.demo.com$WK6J34BG19C3PCK8ZD0U1CSO00AU19XT', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', 'bee51d70-ee80-4ef0-bb9c-bec0426e1c77', '83391362042797105422', '629032473385233', 'LPA:1$code.demo.com$Z1JCS3LVU8POQT32OFA4Q1JLIK4Z2I3B', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', 'bf03fcdc-bc93-40e6-a998-de07692a4870', '93978283982482302889', '303482013629470', 'LPA:1$code.demo.com$B7EBXK23ODVRLTKKTQ8ZWXQ9O5JMWI6V', 'available'),
('906ae15d-02cc-42db-b7a3-213042e7fdc7', 'bf126b32-d65b-4565-92f1-a4ad2bc00d05', '77922552666656401570', '580322249761781', 'LPA:1$code.demo.com$SLDXKVNUTYCZNBNK3N0TYIVEL0BPN85Y', 'available'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', 'bf1e83ab-691c-44a5-a767-91e536e30d65', '64581413724303275040', '137063479617021', 'LPA:1$code.demo.com$IBOM3EH80NKQQSKI56M64X03Z1RX5O42', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', 'bf243289-1113-405d-a7a5-f4cd8ec91ddf', '31232456522181764160', '226023150662753', 'LPA:1$code.demo.com$3R9TNMIFB31GS90XZEOQI0ZREWJYAXF3', 'available'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', 'c033fa0a-857a-4078-a295-a4001f1497a4', '82451611176655855266', '303900062452281', 'LPA:1$code.demo.com$EA7KO4QN42INZA6S711I3BHTL3ABPQMA', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', 'c05ecea3-4a42-44e2-8e82-471f2f465400', '43240217177341198261', '153426435740626', 'LPA:1$code.demo.com$GS5DUS738ZQDEHD5TRQFWVY3WVSU5W3Z', 'available'),
('5ae1cd2e-6859-41cd-accb-ae5a1abe947c', 'c0f0f71f-a9dc-4717-ac32-49b8ff9d9e0f', '51898224625791079632', '904913499948086', 'LPA:1$code.demo.com$1854F70LOLI670YVYDILKSM40D116POG', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', 'c1310f8c-c577-420c-b701-ffbe053563d3', '23785850062670553951', '191465335601741', 'LPA:1$code.demo.com$052KVSNT8AYXODE5XIBFYR8Z9QT1COKO', 'available'),
('fc9e9738-ece0-426b-99e9-af330604674f', 'c1820c36-9c33-4a91-9dce-31fc84e35a07', '14033544907691984988', '808218838617205', 'LPA:1$code.demo.com$ZYR11YIUP9E5PV7OS83F95G05KEO2XJU', 'available'),
('9abae76a-9068-494e-b529-819fdaecbadd', 'c1b1f478-465a-4ec3-9458-823914a3ef8b', '92666940889106267151', '933560555556178', 'LPA:1$code.demo.com$Z1UHXXSIKPE195V4BF4LKEQUB2SSJE95', 'available'),
('4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 'c1c9971e-bd8b-4f7b-bcb0-d1477799729c', '36316655305185095199', '237402532588859', 'LPA:1$code.demo.com$XXSMO5MU6687HV09SE7PHQ7HCEJ9WY3P', 'available'),
('300a0580-3eb9-4780-a42f-944459198313', 'c1ebe57f-3573-46de-baf0-88fd0462b930', '19377381004563680530', '553999391496399', 'LPA:1$code.demo.com$XE5AXZ01NGJLJXQ8ODFWEGIDSAVXHF86', 'available'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', 'c2424845-b8b8-4503-8cf3-616cf2c375cc', '33696522105201439860', '855078668175884', 'LPA:1$code.demo.com$PZI08TDMNUN87RADRYOFSF2HB8HB2E89', 'available'),
('4c47c065-c066-4e24-ad4e-963da4de4be6', 'c28891b3-134c-493a-ab12-7410579db2fe', '42529203989105353508', '665693588211298', 'LPA:1$code.demo.com$2MUQZA6CPI00MKAPSNMVY6XZVBR3WP2B', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', 'c29b81f7-0fb3-4f58-bd98-a413b18168c7', '48624563223741467879', '344668673738072', 'LPA:1$code.demo.com$96Q963KIDLYRZN5YAGPHYX7YHKGFL6H8', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', 'c29feb40-e61b-4e02-b9ab-122da6047653', '20271129768802850243', '085235084112250', 'LPA:1$code.demo.com$KVDS3NJHCEHV1QZRG8DMN31O7HJ08V5P', 'available'),
('d1824057-970c-4dde-89bb-1433a20ae7cc', 'c3313c48-d974-42cb-ae50-820ba2891839', '55320577846110407807', '485719120560911', 'LPA:1$code.demo.com$O3BG50AFIOL1RSICXEKXCX43HQ5RXBU1', 'available'),
('bece1e79-beda-42a7-835e-fbf7d62cf22c', 'c3b2271c-52f3-4c2c-9198-58da411d5796', '24945342558915884232', '378734955903996', 'LPA:1$code.demo.com$6A1W1Z6NMNUPAF2TKTZSZ1CIORPLMZ5R', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 'c4328d2d-6ff8-4b3f-8e38-87fd717763ca', '61759832057752989331', '271778900222093', 'LPA:1$code.demo.com$SCVH0F6J6CSZBSWQXKQ0Q6C2SUJMI01D', 'available'),
('2a6b3054-99e6-4a24-b5ea-37a008934996', 'c43650bd-df12-4538-8e75-8376d6afc1be', '44546203460590031021', '135623733451196', 'LPA:1$code.demo.com$KTKNRTECTCPQRWXAJELZQ8L80APY81MM', 'available'),
('2af7024e-0176-42cb-b595-9cfcb49b3a06', 'c470077a-f2dd-4d96-868e-bbc41af58236', '20119856228257912198', '675753877984024', 'LPA:1$code.demo.com$LNC574NP84LAL43VKPY0S55AYP8Y4OTG', 'available'),
('2dcc8be7-f717-4749-a4aa-170b2fa1e160', 'c4845449-e4f9-4387-b35d-e796f189edaf', '59614444196441526887', '638015860968382', 'LPA:1$code.demo.com$DBL261EYQ8181GPWDPD21MV1KCLFEFOR', 'available'),
('7e713e18-46ed-45d2-b54e-bf087123ab60', 'c4868888-8c47-47f2-be46-7b0899bb3970', '64150344749800204960', '286323380840913', 'LPA:1$code.demo.com$GYFDGOD7G38LRIWYS540J7GRRMFXXUQG', 'available'),
('fc9e9738-ece0-426b-99e9-af330604674f', 'c489eac0-fccf-45a3-8d05-f45e9b834064', '15536414412553051228', '738580531580728', 'LPA:1$code.demo.com$MJH4UWHMBNNFEMMMFLTV1CZE54KNHAOK', 'available'),
('e4197d22-7677-40b4-b61a-ddf6fc3d0aec', 'c4edd664-d568-4df5-a402-43a6fbaaaa60', '12410906067923129697', '653714813609124', 'LPA:1$code.demo.com$AWLX0U1NINU6TDA6265EAKQX40LC31IB', 'available'),
('1fa157a8-1c21-4495-a7ad-0e38c6e70769', 'c51481c0-a939-4ada-9945-9ee30951f248', '06778887090918427090', '111148472828692', 'LPA:1$code.demo.com$MFS7LIHPLIXR17599T5C5FBTUHC0OY0I', 'available'),
('daff99bc-4144-4769-8a07-a976a92313e3', 'c52d93cd-0ef4-4cdf-9951-30394ffb1055', '37190182996636799547', '467010269149208', 'LPA:1$code.demo.com$LD2H7YXKMLF18PBJWEGSKJ590R6I4Q5Z', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', 'c5c5cb89-29d9-419c-9885-c86337f93714', '86043139835128998097', '584553576405151', 'LPA:1$code.demo.com$VYFZ8N8437FKJLNOPDVT6UDWPCUWZ26R', 'available'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', 'c6ec4059-5dc0-4846-808f-7507f63cef84', '23830945425730184245', '865468374958292', 'LPA:1$code.demo.com$GF86RBTW35IBJ50R0DTZ1FQSJGI3GW7M', 'available'),
('0c2281a3-3b02-4875-9663-40847e1c5bf7', 'c7046bfc-6261-46b5-a27c-0c7b6900d5c9', '05242326719095227261', '298652712213930', 'LPA:1$code.demo.com$DYQ40UZCQYOYJBGZVH757ZXVMUBWYAZV', 'available'),
('6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', 'c78e9d7e-a11e-406b-a6e8-4f2c417c2bcc', '21256718826378742228', '342918339040802', 'LPA:1$code.demo.com$OXEG2ADUA9EK2C7YAMIHEXD4516SYPXA', 'available'),
('0e795b5a-64a6-47de-82ff-11c8eff90077', 'c83ff411-9d69-4a4e-a0ee-9bc1f03ec0e2', '75624419878365040210', '283482563376160', 'LPA:1$code.demo.com$3JNV9WO4BF555M9N14ALHLP1ZHNH7B6M', 'available'),
('4e141b22-bb56-406b-a0b5-42a48bf1af59', 'c843ee06-6d8c-437d-9cc5-572caf523ce1', '60859356253386820634', '599507983587003', 'LPA:1$code.demo.com$6FDLY8RFKON2P1C8QXKM7F2Y5SK1VNT4', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', 'c8728f5e-05f5-4984-ac08-0084a035bce8', '24503162431069435979', '277874318609374', 'LPA:1$code.demo.com$NX6NTXPUJCRZXMQ64Y7R7FB3YVYUDCQM', 'available'),
('3efa96a5-227e-41fd-85dc-39718ebf399f', 'c8964e53-2343-44da-adff-7f68a53db364', '13616804068090468994', '459368454618820', 'LPA:1$code.demo.com$AROBUCXXQSF2HZ6URLHH8I0HZKJ9RPKL', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', 'c8cd2221-9c87-47c5-8e9b-cf8294139bca', '91981367764579864651', '049231484005073', 'LPA:1$code.demo.com$WAEZGWNBO77BRUR65L9ZWM7LZGRUAOBE', 'available'),
('af28a2cc-8c89-4347-82bf-14d4ccf4373d', 'c8d529d7-582f-41a1-882b-370f2044d0f4', '02024572852678065606', '941004773124417', 'LPA:1$code.demo.com$6UYCIMZSRE6BFPU1WKIW81R5BRDBTHF0', 'available'),
('11df7336-ec98-4b37-b02c-29095ebb3d45', 'ca177188-ccc9-4614-8d10-eae84a75575d', '03868105480947280974', '590717379666468', 'LPA:1$code.demo.com$BXK4X4WRO93RKQPW4EKWTMPOXLBNZGQ5', 'available'),
('2af7024e-0176-42cb-b595-9cfcb49b3a06', 'ca1f0fa5-93c5-464a-936e-f8ce36ea568a', '66612759786897769833', '558313987584435', 'LPA:1$code.demo.com$5J62D7DZEVMXWEJTCW34QHOKULTUEICL', 'available'),
('d26f02d1-3bed-4fba-9a2d-ade19b7d32dd', 'ca36d2d5-e593-4774-8343-f4e8751db82a', '93628290186190589166', '551630576254439', 'LPA:1$code.demo.com$J8E9GIK0122UYCSC8TAAE419XWGMMFEB', 'available'),
('daff99bc-4144-4769-8a07-a976a92313e3', 'ca91ee9f-47e0-4a10-b03e-28033ef66fbf', '66580741207385699009', '413314242867207', 'LPA:1$code.demo.com$NHJWD2FE1QR8QO9ME2BU4FHK76521943', 'available'),
('8affb6bf-f360-4bcb-b08c-086989eae7df', 'caa21218-4832-4cd4-a0ab-8f97aec507e7', '33977802350319200510', '210668950633520', 'LPA:1$code.demo.com$MI6N2BVQF7033JK4M1NS4S2AME9DAXSG', 'available'),
('11df7336-ec98-4b37-b02c-29095ebb3d45', 'cbc50943-78a4-4ef7-9685-d929f48fbf42', '85891317683087225228', '939350877386275', 'LPA:1$code.demo.com$7LS233YMAXRG98G6H6CF7I8TNESGBMUA', 'available'),
('4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 'cbf08f76-a961-4c22-862b-dd3de0806ee3', '50110310505011339783', '337215558855822', 'LPA:1$code.demo.com$PT6D7VIC851KPSZJUI0TALSX4W7OPFLM', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', 'cca8fea4-77a3-42d3-bb62-3381ff2eb508', '22271359276256517901', '261088483669372', 'LPA:1$code.demo.com$YZOK4587C48473LCM58OX8XGB9QEUQPH', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', 'ccabb228-a53e-409f-9859-156622ee26ab', '92989664393950593216', '853966648378229', 'LPA:1$code.demo.com$MCDQWTT06AN6G7M2F84GQCOC8XI4M039', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', 'cccf500d-5f76-4243-a687-1022201932bb', '60923976395846108940', '605974995048225', 'LPA:1$code.demo.com$LPDIWBPH7V4E9EFZ3EL1QNR4288ZD5F8', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 'cd1d3864-2c2f-4a9a-9e0f-00c5f0fe9290', '08357481040876413668', '502583342064971', 'LPA:1$code.demo.com$F7NNEOIYAZ4UBN39OR9JOD0EM4YDX5X4', 'available'),
('66ec6adb-dd58-479f-8547-cfb41e664528', 'cd786475-bc0b-456a-985c-93e10ced34be', '77356384914578814392', '867838284629927', 'LPA:1$code.demo.com$MIX6QXL1KRDVU91LTQ3S9MQPZ4YI1LAP', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', 'cdd2b417-1a10-4932-b385-9707f0593f23', '05617870114045105036', '388378998409971', 'LPA:1$code.demo.com$5AAJH382W5Q1F2LBNVJPYQDQF9GRVAVB', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', 'cf3c150e-a773-4f34-aeef-cc289e06029f', '39505782871632538357', '559850141842948', 'LPA:1$code.demo.com$IA7NAV47XQH63JMFIIIO7LYR1WFDV8DG', 'available'),
('d3844292-5c75-4af2-8c36-21d59ca7c4ac', 'cf69787a-1579-4fe0-a6e3-8665e6f0b33e', '96956074453141922059', '805465118144212', 'LPA:1$code.demo.com$8OSEUKZKW5R6YC5076FX2ZH10XFKL1KB', 'available'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', 'cf74a6de-5aa8-4e6f-a14d-cd599dcf5064', '98078268328266158441', '351879718827577', 'LPA:1$code.demo.com$0YDI7NWKB7V5MTGD1KEH06NYFZQIZ5YB', 'available'),
('fcff9806-45b3-471b-89ec-d4716f90d013', 'cfa24429-7f70-40a9-b124-5aa95494f8ed', '56887810910416063839', '742469693512653', 'LPA:1$code.demo.com$M4ZV6BE14EJWPE3544X1RBIT49WP6FH5', 'available'),
('a2b93439-736b-4646-8d26-a8b8630c4616', 'cfa68c13-5eb4-4afe-a32b-989786e2a0b8', '62795705194287772140', '964128035090170', 'LPA:1$code.demo.com$6FUJ8WQTNQKN0TAXQKWK1AQ3ZOI6HW52', 'available'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', 'cff4f7f4-c716-4f8b-acd4-581113d7fda0', '51506877183394611155', '122249410269537', 'LPA:1$code.demo.com$BE32XB6N30D7F8F47UN2AW15HDFQIGIB', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', 'd0111101-9594-45a8-94fc-79eed1ea6a4d', '33743495223349925236', '435279366838555', 'LPA:1$code.demo.com$G3K6E83M15AV9WV1TUCE7GSXA0RH6375', 'available'),
('3efa96a5-227e-41fd-85dc-39718ebf399f', 'd0201ebe-dbfa-463d-b9cd-19e9441530b9', '79820176435460191292', '272169351616013', 'LPA:1$code.demo.com$WP63KDQ9P4TEDIQZYX7S0C1LA7JO78FC', 'available'),
('0a06379a-dba0-4082-872e-40645e1c0393', 'd089f1ca-5b4c-47fd-923f-e4ea81cbf41a', '94824494253279109664', '024962941507715', 'LPA:1$code.demo.com$QGTXCNAU0IWY35N0GU8BUDRD4A9Z60QR', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 'd1242b1c-c73b-4aec-b7b2-0339ef76dbb3', '62317606608136298904', '397076719449952', 'LPA:1$code.demo.com$7N5DFY51Z9Z2IPP9GHV4TH4W1IKXJO62', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', 'd180a801-342f-4748-abfa-7291d696aa63', '60608580416646229307', '106267738721131', 'LPA:1$code.demo.com$099NOLURL5BAGRNHFTQXLQM023FU7ETR', 'available'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', 'd1bf991e-5d56-42ab-811d-9c9c235f4e02', '66902737491721147593', '317633653638284', 'LPA:1$code.demo.com$MPFG8G29VQMHDH97C768M40HEHE24XIQ', 'available'),
('d4b597b3-46da-429b-9de6-b2110f2fb552', 'd1cf3fb0-2f69-45d2-8708-e262b30300c0', '52609272454360618020', '475581140677198', 'LPA:1$code.demo.com$YNZLPG7Z8B2NVDVLZIICZJFWW7YZFJ62', 'available'),
('1333abeb-1fdc-4f02-84e9-d8a24da65e5f', 'd20dcc47-fbb7-4169-8cfa-31a26d289028', '56866116541212329134', '822644881930368', 'LPA:1$code.demo.com$G6MMRAN95SVUW9593AMFLHOB0692ZRC0', 'available'),
('9331f629-cc33-4f38-8294-4757e8627b74', 'd210ddbb-edc6-4035-8735-ab53ed22b957', '37863336843946387021', '264902787242902', 'LPA:1$code.demo.com$1QVAQHLFTTT54Y2KY326NBF4BK1511K5', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', 'd211c59f-a0bd-478c-b166-0246c298380e', '99494871158634257011', '437019629014550', 'LPA:1$code.demo.com$J37LV5Z7ICKUIY5RK2UKXZLOHKITDZBX', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', 'd232722b-186b-48dd-83a9-d4c3edd9eac7', '80013834635333669280', '106910638609893', 'LPA:1$code.demo.com$RZN8ENF9W9OYURF18EJ0G421FO0ZPK2K', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', 'd250d975-0474-4e26-a187-f38034a2131b', '00137312129226619177', '348248876836472', 'LPA:1$code.demo.com$JBVZ1JTILLDQBYJGE1WLYSSFAZ8O64RY', 'available'),
('b3378ac1-e71a-4172-b73a-fda355742af2', 'd2e22887-6991-438b-8883-685c6e89deba', '40032358670254936068', '198357066351733', 'LPA:1$code.demo.com$P41U17L7KW8HPBQ0IYC3D1JXQA8UPWKV', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', 'd352f654-60ec-4533-b04b-fa3185410b26', '33432221712504492017', '596137657915216', 'LPA:1$code.demo.com$CJH3ZYDWQ366V4R2PMOI3HDHEE4P31MM', 'available'),
('8eec889b-4487-4c46-b2ec-aa680bbdd721', 'd3df2211-2997-49ac-9f3b-01f2730096f6', '13990117307345176456', '349935004379295', 'LPA:1$code.demo.com$BD0YBXDJOYOK6I6XZWFOOF7R5099MUA9', 'available'),
('f197448d-ed17-4091-94d8-8a932c534aab', 'd3ece54e-834b-4eb2-9522-44bcf74a0786', '50954967495266766108', '515384075308448', 'LPA:1$code.demo.com$G1PKU7H8JEI7MGW82OVJYUZTYFWEOA53', 'available'),
('d5b45760-9074-4142-abe8-df4dafdf5391', 'd3edc42f-887c-4af0-b3eb-4ccc4fdf093b', '90906742120435044888', '661634712810714', 'LPA:1$code.demo.com$TNRPIYB0HWD2BLMHAE8FFU0VIQPGZ5W8', 'available'),
('d4b597b3-46da-429b-9de6-b2110f2fb552', 'd404e5c6-19df-4a0b-b550-2fb48722c96c', '69972136076013739183', '444339317082253', 'LPA:1$code.demo.com$MV1M2TCMCUGDQR4BTUD0GKLW0NP2LGLQ', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', 'd413c126-afe6-4cff-9d44-f63d87dccd0f', '03947196527740294941', '939379385973444', 'LPA:1$code.demo.com$J2BVG70W6ZS41QDKE5PLHG7TW1Z30QGW', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 'd572ad66-5555-4b9c-bc25-48d5d7734892', '24183241057534958747', '313667950447672', 'LPA:1$code.demo.com$45Z8HB9BUR0YWYRUQJFES0X91CU1FIKS', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', 'd5f7ebe2-1c49-4977-bb8c-39f67dee0589', '93646524206266144721', '534233269347585', 'LPA:1$code.demo.com$37EM25MFRUUMN4BR9IBY4DNOUQTXAHS8', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 'd5f8d331-0604-4f2d-a85a-33df3a108007', '70183101185418902211', '913257766475151', 'LPA:1$code.demo.com$5OKNSL78JR2LQU9TGGHSMK67EV3WQBVA', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', 'd67503bc-4357-4cac-9d28-8e3c4f0d9bad', '43425782114887796492', '255306788334299', 'LPA:1$code.demo.com$2XUI5L24OTI5VE2VU2B1EB43Y8EER8TF', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', 'd6914596-0933-450c-bd25-2ab9cae47991', '20651016690642057295', '101079822728142', 'LPA:1$code.demo.com$ISHADHMA3939LN3CKKQKG3NI048CI1TL', 'available'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', 'd6b9f3ac-511d-4750-a382-dc567b5f8bb3', '69572354028730758399', '110757658506927', 'LPA:1$code.demo.com$ANLMAS45NBOOFU6L2CYK9I1B9OIW0LVY', 'available'),
('3e60394e-1329-4788-9578-d6f600fc9ae5', 'd6f7c965-3061-4051-ac0e-ba5f6a89bd1c', '67417248324127512738', '452707355458758', 'LPA:1$code.demo.com$551NI1JJ0DBLBMZDKHPMIL5PKJM6QWOT', 'available'),
('0dee01ad-1df3-4ce9-b355-25bec805ec91', 'd756752b-4ff2-43b6-ae43-b5ee622f3682', '23185060329934069706', '638781630028072', 'LPA:1$code.demo.com$DE3CX9C2DBEUPKTM48TJLNE30TMKTZDS', 'available'),
('20647fac-7e92-481f-a6a7-ca1e8c451910', 'd7fcf1d9-06d4-4b66-8a96-e205d8336ae5', '82946537559916060347', '379293012085818', 'LPA:1$code.demo.com$C4NQYFLA4JVR960C8ICG26IZTX6SFRF6', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', 'd8215f92-f73a-4575-a50b-7d7b9f6b583c', '97309973355169832120', '787567014060882', 'LPA:1$code.demo.com$RTRIWN14JLUHKO3ADRL1NVLCO4VJ2LX7', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', 'd84d5b54-e169-4540-a28d-372fef8b8d0c', '13880335467273857221', '204315622791549', 'LPA:1$code.demo.com$7BQOGDV6DQUKYUE7H36UUU5DPQAUJRWV', 'available'),
('5ae1cd2e-6859-41cd-accb-ae5a1abe947c', 'd92210c7-b174-4f94-a370-0d5dbbacd6ce', '23289958367744319408', '240693223237491', 'LPA:1$code.demo.com$VO3HS37986TKKRQPGSF6OA9KS2H18OJM', 'available'),
('950518ff-16b8-46f2-8280-8653a0f4aa2e', 'd94f8952-6054-416f-baee-f3e8f7b3eb9b', '43708295428296318525', '890946147443493', 'LPA:1$code.demo.com$H2U1AMFBVWUGXR7Q0W78FNH092IWN2UC', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', 'd9835478-4e49-4f55-b2b4-1da52e7f627e', '59962404588914231079', '618795420846001', 'LPA:1$code.demo.com$2GQF8HOT4EZP1F820CIB4IRBLOPU9HVY', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', 'd992222f-d291-4c68-ad10-0e328d61a798', '15268355033600275574', '563520931896087', 'LPA:1$code.demo.com$VRT8C5KVLC3FT6S188PL7DHHQYO3N5GS', 'available'),
('5b6b03d9-538a-4f60-9aed-ffa1ba91ec08', 'da09261d-f7fe-4d94-85f3-d5b23d37c61c', '07471589816659295113', '016265481568658', 'LPA:1$code.demo.com$YXBND7YKUR1PWWT0EOBR199BJDKNU8PB', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', 'da19953d-da19-4e64-b8bd-69e8b919dda6', '73751933800767915837', '534346002180729', 'LPA:1$code.demo.com$Z7GU9ES78UX2ZLBWNXOCC632R0S3LROK', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', 'da6f295f-456a-456b-b3bd-40918a4bfa5b', '53475617172998687172', '899200718953180', 'LPA:1$code.demo.com$IFJ15T83TJA6DAA5T9J6ZRGIOVNG5ZL6', 'available'),
('72776ef6-113d-4171-b418-d99377b38ab5', 'da72dbae-dea5-4027-9471-56b912a320e3', '14568688285592102588', '634714281425081', 'LPA:1$code.demo.com$TVJQN7NSXBWWF5MU1T4BOA908ULI73XL', 'available'),
('66e3a4ba-392a-41a0-af87-ccb569fb02a2', 'dab0bee0-64cf-4b67-9330-f542a75bedf8', '32132706175403435293', '518363463716933', 'LPA:1$code.demo.com$CRBLKXR9IJZIAIQP0V52TNT6AUTF5XV9', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', 'db65bf75-f9b0-4948-828a-ed39e2ba2a3b', '41767568004871827481', '284759960868920', 'LPA:1$code.demo.com$M71CQMBZO06PO39ZVO2RZACONUQ09RUB', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', 'dbebe9a0-e77d-40bf-8bbf-2244205640ba', '50569130763508139422', '106626479658200', 'LPA:1$code.demo.com$8LFD5NN1FXABKE9ICVCHFFGKB8V5QCTS', 'available'),
('81125430-b0dd-4e2a-a90f-6169b00a5afd', 'dbec9557-020b-47d9-bb59-7f89da5be04b', '10492857648730131966', '781428208693559', 'LPA:1$code.demo.com$MRCI89HKQ5YSUOOG0ORJ1AIMCS3VMYVG', 'available'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 'dc17c316-a522-4245-8581-820b6992481c', '75125305749702355140', '136447047530324', 'LPA:1$code.demo.com$UA1W1VNM7FMPIHHHUILARVBXLEWHXQUE', 'available'),
('601ef2d4-ce42-4620-b7f3-551ef4a910a6', 'dc450d53-be0a-4b39-9202-c2dca5a2bb84', '43116393811945737129', '155734091770386', 'LPA:1$code.demo.com$XA9R6R5DP93H822G45SVF1V49GP1K1J6', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', 'dc8a4958-1c45-4844-b7f6-9bf8f016d717', '35834874152686986269', '635007246464327', 'LPA:1$code.demo.com$HJYUOM5O4H81OQEUCDR1G4ZMVY0Q8IFC', 'available'),
('01cd0f2e-f4be-4904-b08c-8ae448ddc80e', 'dc8fea0c-8780-443f-98de-b75a59d4616a', '70550386748640762548', '071877343279646', 'LPA:1$code.demo.com$MW07IYLGLMPISAE9RB850X3360ZOW3CR', 'available'),
('0dee01ad-1df3-4ce9-b355-25bec805ec91', 'dcc1d2db-a8ef-4ce1-8dbf-2802bcf002eb', '55165748329448192907', '015888919410834', 'LPA:1$code.demo.com$2Q09HIS7VGG8GPIVBJEH7RQU343T8YHM', 'available'),
('2531b471-becf-4b17-98a7-77e8b3ffcd75', 'dd04f14c-cecd-4b04-9862-3e09cf93d3d2', '12799831714978383122', '243169761532883', 'LPA:1$code.demo.com$GBWV6IXB8VVPU02OUKM4YDM1MU6NCFDM', 'available'),
('ec705aa3-7a3c-4917-b9da-60dca7a9f593', 'dd5f3021-efc0-4990-a743-094bb35d9e0f', '92759400887308542117', '980220667157089', 'LPA:1$code.demo.com$8G4YUZ0H79UTTWU03RPFMS87U00QMIFD', 'available'),
('47560712-bb5b-43e6-b88c-55ae6fca9a0a', 'de300d55-9378-4e28-9eb4-a39d4b5122b4', '59568548730796226092', '193036553349443', 'LPA:1$code.demo.com$T3V0NUE8E4BJMVF410U987VS29QA9UOV', 'available'),
('6f074ac8-c8a2-47e7-9966-7193db9fa1dc', 'defe50f6-a15a-49c3-9a6c-48a76c417579', '52355555964911792069', '090397744939605', 'LPA:1$code.demo.com$OH7Q7ZQ7FYXO51L5EU9SCKZMNXUZ1O6V', 'available'),
('09925e99-4237-47de-acd4-f9c83f739e0f', 'e0362614-c0c1-4d32-a11d-278545892b78', '70741127125176230322', '580492232100700', 'LPA:1$code.demo.com$P1QZFTZMGHLE2WRH0M46R42Q027OT15J', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', 'e07305a7-6919-4034-b1e3-f5ced0b9e9a7', '19561518246245711051', '767523376796659', 'LPA:1$code.demo.com$A2OTMVN7WXGNANRNS0PK0TX6X09WQRQQ', 'available'),
('906ae15d-02cc-42db-b7a3-213042e7fdc7', 'e0797c78-003a-43ad-96de-e7b00df68546', '36071123851633301556', '954706999281537', 'LPA:1$code.demo.com$BP8LT0U5OIBXFGWJQ03UNFE1X1TFY8A4', 'available'),
('ebaff4c3-2062-4908-8641-c00568028c7e', 'e095122c-3a99-4de6-b763-2e55a267060b', '02890637834148729322', '196959266785450', 'LPA:1$code.demo.com$NYJ9MS77CPIFDZ4X0NU336UGXFOUUPHQ', 'available'),
('940caea8-d149-46ee-8afc-a5f45e5283ef', 'e155b7e7-3add-4527-8947-44af88819be5', '85772336401512700382', '043604965214606', 'LPA:1$code.demo.com$TFER2ENHXJOR7VIFGTQAD5R6912ETCY2', 'available'),
('aa747bc5-2197-48b1-90a8-fb7b4e448ff1', 'e1653bc2-c093-4a42-84c5-94a87634c342', '61642224345528027219', '180048394500831', 'LPA:1$code.demo.com$9M546K2OJ0AP5CNYVQI8EJBA4GSXQWOS', 'available'),
('3d13fecc-40a5-49a6-942c-9202eaf1fdf1', 'e182c61c-c404-45b0-9827-a586de986b02', '91651058500634775601', '835142436475925', 'LPA:1$code.demo.com$6QHOCN9X8NKXSUMIBVT7P4FY9ADE6YV5', 'available'),
('1ede8fa4-4262-4136-8ad7-2058de17a117', 'e182c795-65a0-4840-a4cc-7acf4337d029', '62938688089736408258', '752082843560107', 'LPA:1$code.demo.com$Q95ZKVAA6Y5GZI6PJIZ9U2DCMUWNEQAN', 'available'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 'e195d9b2-1fd5-4412-bfd0-522fb0443a59', '11042689248837335038', '605926617728161', 'LPA:1$code.demo.com$47X2IGQXMP5NZ3L975V5AKC9F6WA66QH', 'available'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 'e1eec9b1-4fd4-4365-be10-fdf1259efed9', '00376099653934893621', '899290181000585', 'LPA:1$code.demo.com$4AA30OUQMWFGCW2547K6H23H2DGVZUPG', 'available'),
('037b8737-045b-4a50-beae-a2af6d1c4106', 'e33c5fd1-0188-42ab-b4e3-54bdad62da81', '38180378731659346240', '984758197706165', 'LPA:1$code.demo.com$7RBS8PP5VZSBWP5BF761JMBVMDTD4J7V', 'available'),
('8eec889b-4487-4c46-b2ec-aa680bbdd721', 'e398e4e0-e1de-4619-8109-e59815493368', '48147627670044419635', '409008544561417', 'LPA:1$code.demo.com$93W8WJM9E7QU89MZ5V0DPQ8BJNFA2KT8', 'available'),
('b71ac246-e162-4d99-a087-bf499b50b789', 'e3a696d4-f91c-4b5a-a6f7-aec411e4b58c', '01729621403822177551', '700087461078598', 'LPA:1$code.demo.com$2QL2FKDVEE0VKDF9ISGFQDPSSV9WS6XV', 'available'),
('fe2547a3-2ab2-49e1-84e3-5a6e265a3f58', 'e3bb2ace-b314-46b1-b832-8c5014064e47', '14471834006020495227', '959338221077640', 'LPA:1$code.demo.com$JC8R2XFCO74YGKPAC3TI0D0O6EKMYIFN', 'available'),
('fc9e9738-ece0-426b-99e9-af330604674f', 'e437fe8c-0031-4dbc-97d1-e5e393dd7e5d', '19487253707305635443', '039804660076610', 'LPA:1$code.demo.com$FYK2Y4KEAVHU97Z173MC0WNRJN34JXNB', 'available'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', 'e46ec141-a649-4aee-99d5-4350464b6308', '10133323548546884967', '452998476268042', 'LPA:1$code.demo.com$JWJ6MDZXKE345NYE15KW6US0AF6D7RG0', 'available'),
('4fe9ee34-3e98-4dd6-a484-2272c3bf7261', 'e4722ba7-caf6-4912-a4f3-150d99ea903b', '23078093306796704564', '595763042058549', 'LPA:1$code.demo.com$8DZNKUC8CXSTSJYBGHHGVP5P8TN6MEXP', 'available'),
('d934bb7c-f750-48b3-ac92-86903494333b', 'e482da51-9721-427a-8380-ef3cb04d9d33', '56904558809104738168', '213843338807097', 'LPA:1$code.demo.com$9FIZNWKM01Q0A2F4V6NATFNFFPB8GIFM', 'available'),
('f197448d-ed17-4091-94d8-8a932c534aab', 'e4833952-781b-4e0a-bdc1-462d943736b2', '73157511620111879525', '322643423212017', 'LPA:1$code.demo.com$NMNP72Z7A9G3R1APDFJ536Z7VREBJTY9', 'available'),
('e4c02753-cbb2-4fcf-89a6-ada2538552ce', 'e48746c5-450e-4b4e-81d5-a62a46e1cd11', '35654287403193220875', '039802830136249', 'LPA:1$code.demo.com$NV1737JGT4JPNM9SMRCWE6HUYM4KIGA7', 'available'),
('d228e113-01ec-4173-a275-67e5dbd3f00a', 'e51badf5-3da7-45b8-bcb4-315ac7843cc8', '24359596255173394720', '664210690402426', 'LPA:1$code.demo.com$O4BL3ULMMGCHMOS2526YKN3EQ17R0CXD', 'available'),
('138a1373-d698-4310-bbc2-28a411aedb55', 'e54fe6c4-fba4-4907-806a-ef9e847b4390', '15785890976339881797', '708109792836410', 'LPA:1$code.demo.com$9VRUZNLF7LMXWQ2B75C675Z80IWCNXX2', 'available'),
('668509e8-a2c4-40cd-bcd1-62b53a93b87e', 'e558784d-ae76-4fb0-a836-e38cbe9bf84b', '80863257461326060211', '946698676327062', 'LPA:1$code.demo.com$JC4CDPGO2QQZN30DGD0GBMLS1LG1GNGU', 'available'),
('f197448d-ed17-4091-94d8-8a932c534aab', 'e5ed204d-853d-44ce-aa3b-fc406bd5b5d3', '06658819233365576410', '064339532667409', 'LPA:1$code.demo.com$GZ5062BNQ8WBJ94PQ2PKS7NFQPK24C5W', 'available'),
('66ec6adb-dd58-479f-8547-cfb41e664528', 'e61b0ef1-6ae5-41e4-b70f-963d1d4463f8', '32166106886931481763', '161511340067754', 'LPA:1$code.demo.com$WUATP7ZN5D6VGNBL98TTZ6Z09N2B9JO5', 'available'),
('1cf701c6-f7c4-4a73-889a-b66a60f80062', 'e620206c-c4e7-4361-bb34-dc5f4304e1de', '27269483374738284461', '584622142321855', 'LPA:1$code.demo.com$NKZJ4VDK0WMNBV1A08UA5LU2TKAB3GRZ', 'available'),
('03be8bc2-1e20-4482-8dc6-036064614db6', 'e63e0416-0b1e-4a18-990a-8ae09e0ef2a2', '56810834751831650013', '407489266519187', 'LPA:1$code.demo.com$XQ2M0WOZBCXBXR1CT6XQTARZOPIPNMDM', 'available'),
('18d78ee2-4be5-4458-b15e-723e30e1f812', 'e6628c67-e13a-4253-9531-71b17716d12f', '86549524953351842684', '714360696433987', 'LPA:1$code.demo.com$GIE6W44EG39JSQ0GD3IOY5122TULCRXR', 'available'),
('18944f45-0a29-4a74-b05c-2edf9002c388', 'e6a507e1-bf66-4366-aeae-19ee42736718', '13918921805278267453', '757306831115731', 'LPA:1$code.demo.com$UPS22XNOT4YNXS46U65OKLEA9B75CMJ9', 'available'),
('fb942b0c-f7ba-4a3b-a901-e568ad216991', 'e7049964-eea3-4e96-babe-858e75f3cd27', '50048813447992299018', '798629396309958', 'LPA:1$code.demo.com$XUIQYDH3KVHRKDHYRJDWB9NJ79MAEMJK', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', 'e7412575-3c6e-419b-8fc0-7937ae00a6f8', '39123289332698472036', '769133519269994', 'LPA:1$code.demo.com$HM0TAXHB4QQU9XMYVLE4U4MHM4CLWAG4', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', 'e76e53fb-a203-4742-97ef-c86c2e75921e', '06074427649102862194', '247130920371746', 'LPA:1$code.demo.com$LPY8NYYDLJ3QDACG978EH3SS1MD6YCM4', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', 'e77a80c2-7578-453c-8007-f9758d67721e', '05790088998095252283', '118755662033389', 'LPA:1$code.demo.com$QXSU6V3SJ5LJ72YEGU7Z72XXRN4DWMPG', 'available'),
('e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 'e7bb97f5-1c28-4ef9-b70d-8f271343e6d4', '42542343473812373943', '264418800082365', 'LPA:1$code.demo.com$90H795P39EUM73RRPBWCGGJ526DWXV4L', 'available'),
('327f649b-460b-49c2-ab74-ccc84adc615c', 'e81228a4-2c92-4dec-9504-dd3460495401', '74277785553912240474', '809828720876989', 'LPA:1$code.demo.com$CQ0UASXR8DHND2HIMMUSUHLVMZQZ6MX7', 'available'),
('e746daaf-52d0-4e9c-8b18-d97506fea34b', 'e85e601d-3f85-43c6-b1df-af0a5434e859', '37870267210949423822', '457441655076273', 'LPA:1$code.demo.com$2I0S0BUU4OMHM63MS5G92JNYVQONBSA7', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', 'e860ce7a-9100-43cf-8034-57975fb79d5e', '97995567162955298731', '410172965606744', 'LPA:1$code.demo.com$8OSSD9AKWPILNIHCUZVXZMPM04JLY3NC', 'available'),
('e9f15ed5-016c-451d-b96c-482463e316d2', 'e895af37-771d-413a-8107-4f1007d85ed4', '18049930830583785665', '932315029229805', 'LPA:1$code.demo.com$QGZGJH98M1KTH3MCW117EKE2888B82Y9', 'available'),
('47bd11e5-2c92-4c8d-b53e-294b128ebac7', 'e8b96298-c510-49c1-a722-6a93b6453e11', '11035966121727979291', '997715871438047', 'LPA:1$code.demo.com$AOQAKQ2N9WIXIFYKEHWOVAQT0HSVT1T0', 'available'),
('3efa96a5-227e-41fd-85dc-39718ebf399f', 'e8f90374-786b-45f6-af22-66bd90b37eac', '24802285640966790387', '517644909941846', 'LPA:1$code.demo.com$4ZV5AP1YZAGKH1TTA1FI90KV0J39KA0S', 'available'),
('57a98d28-3af6-4ee3-9b4a-27d0e44f41a6', 'e9b1e879-ca09-4378-ad85-69a5bcda9171', '12069293123442892241', '994317723954075', 'LPA:1$code.demo.com$PA5TULBZPTBJQ56E258ELMIBG2N8ZLUZ', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', 'e9f2fc19-f1f3-455e-b992-0eeb0c2b3a21', '65546389120013008016', '569117468925581', 'LPA:1$code.demo.com$XJGVC535O61IYKF0QOVJ9QEBUH2MER4G', 'available'),
('8df03d84-b222-41f2-8560-a268aa57ef94', 'ea01803c-77ea-4b0e-abf3-c64aad4acc3a', '25748939718948096317', '674804174797775', 'LPA:1$code.demo.com$1ZO34ZS3MDISABV88EOMUCQYK4SQ4TUH', 'available'),
('6a2f4266-ddac-4e4c-b3b4-e208c6bceb45', 'ea14cbb6-43ea-41a9-be87-47013172e1f0', '76080438275155204589', '146045695668526', 'LPA:1$code.demo.com$KKJ5SEI48B9K3B2OMI5BLDUTUNIQ0HGL', 'available'),
('d1824057-970c-4dde-89bb-1433a20ae7cc', 'ea2d6ba0-6dfb-4c13-ba43-30b243766300', '60971238832698489942', '465117223706522', 'LPA:1$code.demo.com$P73SOE6PD1UBP7JJMZ505T3VYMNAC2XR', 'available'),
('04d7b769-7c89-4bae-9554-55e2ee926929', 'ea32aa77-1549-4fe9-b18f-db3ae4b0e3eb', '41395063046316543779', '765838859974557', 'LPA:1$code.demo.com$SUY2ROBFM1A2OTJH2AHEBYFKL7XE88D9', 'available'),
('6f074ac8-c8a2-47e7-9966-7193db9fa1dc', 'ea35fc6d-f351-4a29-a19a-99e102b9969c', '04314220112560744358', '423613207481487', 'LPA:1$code.demo.com$W5ZPQ0BOQGCNCXV4FXE62KDOOKKD8F0G', 'available'),
('1cf701c6-f7c4-4a73-889a-b66a60f80062', 'ea60000e-c45b-4719-ad98-545e4357c58f', '80817465751378565260', '239097074612648', 'LPA:1$code.demo.com$UGSFVVWM1YNZPGNQ5Y2VVSEWMY229B2S', 'available'),
('986d56f4-6c08-4fe7-8b7b-6b425e186f6c', 'eada8f65-fa23-4bdc-8b16-ae899e2615ec', '95077838870854086056', '311777966654406', 'LPA:1$code.demo.com$I36OYWJ7BN8IA9KZUGWL0JQWHOWU9P7I', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', 'eaf6fdd5-87a7-470e-81bf-71cf5a8ef825', '29013533225902374522', '933315056104077', 'LPA:1$code.demo.com$11CNTZEGESXR2TLPCC29TULO2ZKA9T80', 'available'),
('c0e8360d-63e2-4005-80e5-c9f4cddf64f9', 'eb116a56-a9d7-41d8-9c5c-76c54e2cc4ef', '71183563438344900093', '065629604734680', 'LPA:1$code.demo.com$YWQEPZ3RZAUCI08B6S35YA1J3LAA5FZF', 'available'),
('af28a2cc-8c89-4347-82bf-14d4ccf4373d', 'eb434721-bc0d-4869-8e3b-b5e9673ef5a9', '34020710854620806839', '967377568048757', 'LPA:1$code.demo.com$68TRCVE07JY1F1TDBL2HQESWDF2WVW7R', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', 'eb534544-76d6-47f1-81fb-5df3fb46f80a', '35718482901180918335', '551711169917937', 'LPA:1$code.demo.com$79WMEUTKFM1B4GHP8VMYWBQXL22GCIK0', 'available'),
('4e141b22-bb56-406b-a0b5-42a48bf1af59', 'eb5511c3-c80b-46ed-afd0-f9c5a0ad2548', '28023718931208180043', '399733040331349', 'LPA:1$code.demo.com$FPWACMI51B9FFKY0H28KIW8KU9KCZ2UW', 'available'),
('db0671c5-fee7-484c-962e-20e4ee9f5f43', 'eb839e57-d283-4ca6-8953-341144b1dd03', '64879920718571521021', '938309492666519', 'LPA:1$code.demo.com$KJSTLPQ9KBT875OK1FZUTFMM03LJZ9FZ', 'available'),
('0a06379a-dba0-4082-872e-40645e1c0393', 'ebe5696b-fc3d-469f-ae07-3dc1422342be', '53239716466752943196', '771389229928576', 'LPA:1$code.demo.com$E1STR7J8ZZZCMDPCJ3ILWUJ2L1Q137BV', 'available'),
('d4535f19-cff0-4456-a4e8-4218275df8e5', 'ebecfe33-1062-4b29-aa76-e82cfee38e53', '34918922843672196641', '741404884717874', 'LPA:1$code.demo.com$P5OY95A4MPLQYNAC97WAZZ191V45530N', 'available'),
('891ee240-1d18-4fe9-b626-b93f55225f93', 'ebf4de82-b73f-4db0-ba96-a06cc7245212', '82424283641613520303', '081877929490475', 'LPA:1$code.demo.com$SFCI2VZ7F0DDU9JDXOFSJTILU82S95K8', 'available'),
('fc9e9738-ece0-426b-99e9-af330604674f', 'ebf7379f-bfc4-4b49-a21d-72b914814fec', '71127048546966882720', '694276002299107', 'LPA:1$code.demo.com$GNZQWVLF544H2E3JORJX9R3SZALC2R99', 'available'),
('6f5da76e-1dc2-4cab-84b7-d48ec289ff40', 'ec4b5d9e-cef8-453a-8520-a70f81456b72', '56736191198057211902', '796956539327213', 'LPA:1$code.demo.com$9TF1O2E0D9C1QR5WCNVTRW4251K1X8GH', 'available'),
('88a6ae89-0dba-4b60-a600-495c1d7ca834', 'ec5baa98-abce-4ee3-8609-54386c9b0394', '05380092203897887387', '535590258496644', 'LPA:1$code.demo.com$T4YO6KJ2F3NMHO6WLZT63KD8745UV7OH', 'available'),
('1fa157a8-1c21-4495-a7ad-0e38c6e70769', 'ec6c7419-79c9-4779-8773-3f91a4dfa867', '57087981868107472242', '873017529113100', 'LPA:1$code.demo.com$TQ92LIR0GKJVRZJ1ET5FW98B0VK30M4E', 'available'),
('1f8980af-30bc-4485-b093-d17d94c09ec6', 'ec9fb923-81f3-443b-bfa6-51526ae51309', '92315063530586922207', '769509667299724', 'LPA:1$code.demo.com$4SJPNPZCWUMVMBDRNFY2YTVN8T7IX7I6', 'available'),
('4643c960-c4df-413e-8eb1-28795ebc13f2', 'eccd5910-fb5f-45cc-ab62-86539622a183', '02586799685062056046', '033047654388125', 'LPA:1$code.demo.com$GQN70D3U7WXYY0RJJAL2IHDT4C6IQ7YN', 'available'),
('89c1c33a-f4fa-4ed3-bb19-22982321e116', 'ecd9cd19-398c-41c5-a545-76d173f82d17', '06959278880246635474', '883922109749822', 'LPA:1$code.demo.com$9NUWL52RQBW4HV9VD1N57RON91KWSV8T', 'available'),
('1cf701c6-f7c4-4a73-889a-b66a60f80062', 'ed241fe0-93f9-4ef6-8865-cd020c17ca28', '36245578933717600708', '925136934766782', 'LPA:1$code.demo.com$Q3HP36YXFKK9U51MVKWJ0AYYR1U8B801', 'available'),
('2c6b087d-239f-4d39-99d2-fe45c4f32672', 'ede2fc31-0d46-488a-aba1-32cc34b4cbec', '67681273472515994883', '056825180957767', 'LPA:1$code.demo.com$2MHKQ0EO6WP395WC775MUNLC15FTB5QX', 'available'),
('996f27cf-e96a-42fd-8795-d92d46138607', 'ee5a2629-2740-404e-a28f-efdf87c2cade', '52151784773968933248', '044485662276250', 'LPA:1$code.demo.com$6K6VYNJPK9XUU0OFKUESVV5ZRX4OWO7H', 'available'),
('3d9541fe-8d81-4733-834a-9d94668fa9fe', 'ee93f073-73b4-4854-b875-1e08a1a61c2c', '16377612259439397111', '210414112444018', 'LPA:1$code.demo.com$AXV1BLDLWJ8PS6QC9IX1IEU7QTXZ1C92', 'available'),
('e52f1848-d286-4c99-9c67-221cb876f6ee', 'eec5585d-b6c9-49d7-bff6-40897fb29855', '01384866386033507762', '298976075431394', 'LPA:1$code.demo.com$AOQYWZREEYD3G567EAK70XCL6VOFNDXG', 'available'),
('ccda7780-bccf-4df5-866d-2512fe061197', 'eef4b4d8-f1e6-471d-83a4-1a96b385e54b', '19372980151828139705', '511042351017742', 'LPA:1$code.demo.com$WGS1GRCYYP5ZTF7Y182EYLMI178CBOYQ', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', 'ef023146-a3de-4a31-ab34-adacb5407c20', '51855388699990448421', '516973059813328', 'LPA:1$code.demo.com$O2DX3GRV7VX2R3IIV7YSRNMC9FKLDJS9', 'available'),
('e9f15ed5-016c-451d-b96c-482463e316d2', 'ef1f82fd-487a-4264-a2ff-ac8a48605ef7', '01991781372967863164', '274392577955932', 'LPA:1$code.demo.com$EGUMKBXXJSU6KNZPTB2GWC42VN3WSP6T', 'available'),
('30401a5f-c030-4d51-8210-f7abcb030f4e', 'efb6dfd0-f9e6-478d-b164-b072e76e7443', '91890992526298589923', '897051312365846', 'LPA:1$code.demo.com$TPE64PZ6Y3E3I1KZ4JZN2ES9HHZOWHRA', 'available'),
('8100fc37-7d2d-47f2-92c5-12f9d0986e86', 'eff71ac2-6a74-43a6-831f-b205681804eb', '71619720546442242321', '103136564762080', 'LPA:1$code.demo.com$JONPYHP5F3UGJ6ECV68FQ97OH1L1GS2N', 'available'),
('f50b53f8-ab49-4b71-9226-727124563dce', 'f00899a0-3250-4945-b5ac-7bdbf18ac15c', '85749933492817631236', '459710768567400', 'LPA:1$code.demo.com$4RR2STGGN2RCL9ZQNB038ASAQT0OIQSE', 'available'),
('f25dc363-1fd7-4f44-839d-57aaa59c9ee9', 'f00dccd1-d0e1-4e60-aa9c-8de00708957d', '24850760620156327673', '145958716554970', 'LPA:1$code.demo.com$AVFPJDWFWLK431B1MTJLIIQC2TWVPXKG', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', 'f07dc256-479d-4fcd-a4de-eaea0f95f716', '37823502550444147593', '987568248692359', 'LPA:1$code.demo.com$F1EEDEEHWQY085V6NOA9558C93SMYTY1', 'available'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 'f086cfaf-19f7-433c-8789-8d8d9b52d7dc', '96553034956774730504', '135347120435890', 'LPA:1$code.demo.com$08IPHC99HS555UCNS8FWMTD39Z5YS691', 'available'),
('9d7fa02d-1f49-4e1c-89b4-db961eed8142', 'f0952a50-95e0-4348-81dd-884cf2a1986e', '33964861095947138443', '885757783734435', 'LPA:1$code.demo.com$C3M6ZN00VPT2VOUA8U5UUW1WH4EHK9K1', 'available'),
('b18078e3-5ea0-404b-b015-4b7e06196a03', 'f0f88626-b8a7-479e-b691-ce90f246a6a9', '52965046035951143690', '033004720429947', 'LPA:1$code.demo.com$MLU0UHXYM31WKF0SERKYFXD6L6S0U2E1', 'available'),
('fc8adfb9-fe36-45c0-8d06-69bfd508c899', 'f1009497-f7d7-4ec9-82bd-d6eb97190b13', '09709688128595380759', '331724242482675', 'LPA:1$code.demo.com$NVDF4ZZCNG3R95RCRRNRXBSJJ44EJ2FV', 'available'),
('d82a6d65-7c19-4b61-a1a9-5c2d3f0bc3a0', 'f16394f5-2aa1-4889-a785-2e4a65b30953', '68415921125240579530', '455290221798824', 'LPA:1$code.demo.com$QW393PBP3ZPNTIF7ZZYRG78P0USHVPYI', 'available'),
('bfef0194-d761-4587-9229-45771ff85965', 'f170bba9-6742-4cc2-9652-5ff886cbd205', '51112267416179468236', '975615866093873', 'LPA:1$code.demo.com$FCZ1FQ3C4U6LELVKRCDH87IC2S6JVWTI', 'available'),
('1fa157a8-1c21-4495-a7ad-0e38c6e70769', 'f1cd1247-6cb9-4425-80f9-0f14df35433b', '89027392329502377387', '142201278076752', 'LPA:1$code.demo.com$PI8MWK335RL7LQP4POR2MFIM584B3YH8', 'available'),
('385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 'f1eeeb9a-f9fa-4647-9f7f-7d976f3053dc', '26064893314317537167', '055719057745895', 'LPA:1$code.demo.com$ISFGFPXHE5C1SPHYJI8X994NJN3QR8VV', 'available'),
('63adfa4b-f6a1-4064-b34b-1dae578c03ef', 'f23a48dd-5bda-4a4a-8ac7-4cc1039d210d', '38392546349504685629', '545049546557635', 'LPA:1$code.demo.com$JAYTVMS8PN5XJ9WPWDZWIJYSLX74WLQ1', 'available'),
('72776ef6-113d-4171-b418-d99377b38ab5', 'f2541b61-c47f-477d-b2a8-5e39eefb7b78', '19178127084999971909', '337652722918661', 'LPA:1$code.demo.com$MY3CODD8TOZABPFCTDNFF0RRR4J8SJVE', 'available'),
('67e347cb-a6e4-4e87-a714-179bba2d6829', 'f28b4cad-6e50-4144-8278-36299782e54c', '35754112723545417409', '679840397686660', 'LPA:1$code.demo.com$LNK415EJ3WSZ1GKGT0JJEHYFYNYYWL05', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', 'f2937d07-6873-40ea-9073-3c4b46bb1ac4', '48458627655476293169', '681295213644015', 'LPA:1$code.demo.com$2WUGCQSQCEK8ST4E7Q9KGS9Z4GKO0XZS', 'available'),
('4efd99a5-16fc-48a1-97d8-98b4b2a90070', 'f2938dc9-1a60-47d1-8c4f-7aab638b559e', '23715911872040663942', '844304396313659', 'LPA:1$code.demo.com$IHTOM5U9SY1H50K0XKQQD18GQLV4DU6B', 'available'),
('91fca936-4213-418b-9121-01faebcc45ef', 'f29fb070-2abe-4993-a08c-ecc2934c6f03', '35991799440415333462', '101786565498296', 'LPA:1$code.demo.com$2Y68507J9VZ276SBSSHP0A7LJ11Y4PPV', 'available'),
('bfef0194-d761-4587-9229-45771ff85965', 'f2a8755f-efa1-44eb-bddb-4e90275129b5', '31550641426413232014', '636954503677301', 'LPA:1$code.demo.com$AMQVCMPP7HHEY06N49GSCLHLUNEXRAB8', 'available'),
('aa747bc5-2197-48b1-90a8-fb7b4e448ff1', 'f2abfcac-209d-4b02-b103-69c83ed34972', '20053276940611025149', '204468387507832', 'LPA:1$code.demo.com$OMM2483M1PUUYV72HC0APOBEZLO9B9XV', 'available'),
('20647fac-7e92-481f-a6a7-ca1e8c451910', 'f31092b1-6db4-4cc0-89c4-9008f79fa77c', '78795500686223681131', '529787943850097', 'LPA:1$code.demo.com$ACCLF8N96BI5HRHB8OU8O6FTJ23IXKO8', 'available'),
('a6ce2d02-3950-4de5-b945-b380ae095ea9', 'f3809200-2ebe-4a53-8c38-96bc89f85bfa', '73534019344721853051', '588042787658352', 'LPA:1$code.demo.com$OXUASIX58PS1SOKE3SYSPX43JZXPRB6W', 'available'),
('e11eaf06-a7b3-4bcb-aa19-00f695b9e272', 'f39212d3-6691-4a4e-a773-f9983943d543', '13755397863498547200', '325637142341402', 'LPA:1$code.demo.com$VX28JKZMNQY8NSY7R085Q1E859TFJXFW', 'available'),
('9dc48c68-a75f-4cc4-a7d4-ce6ff01cbec9', 'f45a4187-7fb9-41b3-adb8-f92166e7496e', '65745034790598272399', '762732010818242', 'LPA:1$code.demo.com$2U94HQAYAWKHJQGTE43U16UTB9IR9ZM8', 'available'),
('4a0d10c5-4fe0-48a3-bc50-8e3e5047bbcd', 'f51e9e2a-49d7-4b5b-8b66-9c9c24861c63', '55237785591542884592', '042173033954534', 'LPA:1$code.demo.com$CPAQUCNJM9K9U4QNETY7BEKPUNVT7HNX', 'available'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 'f51fc58a-b91d-4cde-9bd3-214602629bc8', '22651586374625617241', '687815339841750', 'LPA:1$code.demo.com$YAIY1ZULRO9W57WFYMHTWUU5FUJXV6PQ', 'available'),
('72776ef6-113d-4171-b418-d99377b38ab5', 'f52cb253-c500-4293-95f6-61f4da96bde9', '73573650028103936047', '476355193040316', 'LPA:1$code.demo.com$Q59PZV296094ONZY66KR7G7TSQ5N1UKH', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', 'f56f3973-2896-45a6-8a43-d8288d8e3906', '47036440799090876532', '839516562381153', 'LPA:1$code.demo.com$L45KYPOVGEZ3NRZP291CHRPL5LMVFO5G', 'available'),
('37e79854-50fe-4d7b-9845-9e62704c1a3f', 'f57f4b23-6ec1-410b-8ce2-71a7e3e0789d', '97209227683649253140', '657054192749659', 'LPA:1$code.demo.com$OA9MUV9QC7GX49SXX5U8HO17DI5CRWQ3', 'available'),
('04d7b769-7c89-4bae-9554-55e2ee926929', 'f5ab03b2-5784-4ba0-b296-213e38e8d622', '37149961932435365718', '703068192029238', 'LPA:1$code.demo.com$8WWFOOZ6VPUBPXUP8U3D6STR159ARN9W', 'available'),
('1a84c505-5df0-4eda-8ba8-7a05c4d3e5c8', 'f5c3e31a-f01b-4e73-bfb1-db83e490dbfb', '60660568804171311154', '111590714560948', 'LPA:1$code.demo.com$C290GI54L0RLLC5OLAXCRNNHVW4PCC0B', 'available'),
('b3378ac1-e71a-4172-b73a-fda355742af2', 'f5c8a61a-66ca-4567-a181-bf20d9f3aac7', '61188560354106961793', '907256329032550', 'LPA:1$code.demo.com$5O9QK7EV0LJTDW5CWR40HB80U1AKHYHF', 'available'),
('e30e8612-39ab-40af-80c1-8bb389a7b874', 'f5f6a4a5-924b-42ae-a0fb-946ecf11b5b4', '05758915006294026755', '770677913486123', 'LPA:1$code.demo.com$5YMLNMKLODX1VX0THD3XDYKNPFPVHRFZ', 'available'),
('aa6a7a7d-02e2-4396-9d6e-b16a25d80349', 'f6254a88-7de9-4f86-a12a-f249b18554ba', '93660856629950419965', '164906589574704', 'LPA:1$code.demo.com$7N7FTDHLSY49JZIBBOASWAMZZ4WYKKUX', 'available'),
('dfbcaeb9-a04f-4e37-a7a5-743bb7f72ae8', 'f6555764-20da-47ad-b4b1-8cbc3684c194', '85981508954737292879', '138805616874064', 'LPA:1$code.demo.com$WJU129XL4TJRDQ03RYFL5VIVN7M6XNON', 'available'),
('507f3503-1f2d-4428-a46d-a82e2fad56ce', 'f6a577d5-b317-4d51-890c-2382d042ac45', '57471934324707351660', '399012752669333', 'LPA:1$code.demo.com$BCGXBTLX5RPJLYR6DUR2AS04ZLDW9A5A', 'available'),
('a7448b2c-6d84-428e-bd9c-f6330b52f880', 'f6af0a11-c84a-4fb2-b6d4-19a19ed967a0', '59010109791687646789', '397767025096986', 'LPA:1$code.demo.com$Y3GDEZ7FOWMB62X0W99XFEKUIGEGRDLF', 'available'),
('09815bac-d9a8-4f9f-9aaf-1f9928480480', 'f7b1323c-c119-4a9c-a477-3626af5280fe', '21656907058971008715', '446041301773348', 'LPA:1$code.demo.com$FT85S3X51ZASCXDU4I415M5ELWA82YCP', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', 'f83cf81f-4476-4474-8a57-f83176e8ce49', '73084003064269425718', '348612544138597', 'LPA:1$code.demo.com$5VP8EEV8XZO83PKAI9AU3VK13CMTDP5Y', 'available'),
('e4197d22-7677-40b4-b61a-ddf6fc3d0aec', 'f8b7c087-da5a-4cce-a802-2845b0ae7c1a', '32014334076983071077', '595712810577958', 'LPA:1$code.demo.com$1BHNORQNU3KCGP08GLW6PZGCAP18FDRY', 'available'),
('e52f1848-d286-4c99-9c67-221cb876f6ee', 'f8e37d90-f9dc-417f-baaa-4273691da75e', '89816299599743793086', '527729080573930', 'LPA:1$code.demo.com$AKLYMIHURP4KF4VSCRALPK8SKKCCO3X2', 'available'),
('666cd467-8716-4b94-bc10-8bfae45d1ccb', 'f8f0def6-3975-475e-9c7a-7760a438a195', '19329405318454306801', '922747515387330', 'LPA:1$code.demo.com$DOQQUMN9MYLP9C0VUGMVLMFRNF1OF0NP', 'available'),
('1bf2b466-363b-4fa1-971f-040ac6da7850', 'f91d5e05-97a1-43eb-90ec-54ae5791dc53', '71024606291944572706', '542561026807441', 'LPA:1$code.demo.com$NUEB1X3SYRUBJHJX27MQ0AT9KFN8Q2JA', 'available'),
('547e8d96-fb59-4cb0-a469-db74bf912703', 'f9254e1a-39f4-47a8-9117-210b616d80f1', '59388808129143835421', '283692642543175', 'LPA:1$code.demo.com$S2SG6SC6XLV1E3VM7FGXG6HUQ4LZOK2U', 'available'),
('fe125ecb-1101-4aec-ab06-038fc05e976c', 'f95e1e33-1160-46d5-9619-6398b5a78f0c', '43136936846047271602', '207025425763401', 'LPA:1$code.demo.com$EOU9Y5C7OLVUYBBNPQMX5BERY731RUSY', 'available'),
('1cf701c6-f7c4-4a73-889a-b66a60f80062', 'f9bac2e9-b329-41fc-a7d2-094d91ece266', '82021124482691296713', '375766667985867', 'LPA:1$code.demo.com$KHBFP5J60A6HQZDB0YMF36E7YZNYIC75', 'available'),
('20a7b210-b291-4913-8932-de05a4a17fd7', 'fad276f8-6c63-490d-be22-927ebf97b680', '00377295492229671806', '276942417235347', 'LPA:1$code.demo.com$E9B125KHSJPFIXEOP3UW6VKWDFR2RK0Z', 'available'),
('57884e9b-f978-4090-bce4-75b6e93b3feb', 'faf1d23c-26dc-4131-8400-29181860b531', '84129760657361735940', '404667908093348', 'LPA:1$code.demo.com$M8L3Q2AEDC6M4LOZDJNPSCUC2YB1NF4T', 'available'),
('7e713e18-46ed-45d2-b54e-bf087123ab60', 'faffa26a-eecd-4fda-a99f-85a528575369', '25890542690976567830', '198698720689962', 'LPA:1$code.demo.com$W855T4PLPHRV9D6OJK0V5KNR93PB91KX', 'available'),
('d4535f19-cff0-4456-a4e8-4218275df8e5', 'fb4ab176-cb23-4e8f-9e07-2615a58bf4b5', '68773213757771209417', '865536223581378', 'LPA:1$code.demo.com$AOZZINNN1QMGLNI71EUEI5Y1I25JMTC6', 'available'),
('6f7d9aef-77cf-41e5-81ef-af251505a5f5', 'fb8272b0-39cc-4132-9e04-6ab67c378e7e', '66253073705287250244', '167031298111210', 'LPA:1$code.demo.com$BNLMD9VDZ6EY3NYVY29O174PPOJPXPP6', 'available'),
('4b712600-a89d-45bf-a2e5-227208769c2c', 'fc102216-8b50-4ee5-8e1a-e9313de0ee4d', '13012053655519127492', '421832715657353', 'LPA:1$code.demo.com$IT9XUIK7MN7D3SAK0SZ4IQXSHQ9KE1YJ', 'available'),
('385aeecb-fb20-47e6-bbf9-dfb6e506cc88', 'fd3ed2a2-d3ec-4d1c-b4b7-84a9fbde4ca8', '87619411282752487009', '597953752567703', 'LPA:1$code.demo.com$7UP9EUU7VXVHSMGUCP8XNBRMZN6L9LC1', 'available'),
('c704ae62-138d-46c2-b63e-e584fcaf102d', 'fd470790-3566-47f2-b564-939397dee6dd', '58755459454261351435', '342890094965442', 'LPA:1$code.demo.com$MT5WZ89J00VG5NT47JWAZAKVV0LQ7OM6', 'available'),
('73fa0649-807d-4962-8ebb-0a67c70f06b6', 'fd94d783-a147-4aa6-98a6-2c8cee95f8d5', '37969919295338421601', '252562948477534', 'LPA:1$code.demo.com$DM4XWFHJXZHNYL73UUASO4W5UJNB21SW', 'available'),
('3014d626-9c7f-4803-8fe8-270f67da6833', 'fd9fee5b-83ee-4a2d-ba2c-089eecbffe04', '84680764726735682185', '685932542751572', 'LPA:1$code.demo.com$5TA3EROTVI6IPIFPHSMPZG8M20MMQQHY', 'available'),
('2dcc8be7-f717-4749-a4aa-170b2fa1e160', 'fde3ec1e-3461-4a09-9a2c-8894f83196be', '09018076358835200814', '248685934478009', 'LPA:1$code.demo.com$N4S7IKME02NUY6S8RB9047AI7XF7G5O1', 'available'),
('dc3a745e-a756-4fa1-9503-e8520c2d69d3', 'fe4b3b6b-3bbd-4136-a853-2443fe1240dc', '30661905416592014904', '283529854258217', 'LPA:1$code.demo.com$X1S42JA2UHUWVGWUUS9Q6G1JFQWWGQ9K', 'available');

-- =============================================================================
-- Vérification — stock par offre
-- =============================================================================

SELECT
  e.flag,
  e.name                                                        AS destination,
  o.data_gb || ' Go / ' || o.duration_days || 'j'              AS offre,
  o.transatel_product_id                                        AS product_transatel,
  COUNT(i.id) FILTER (WHERE i.status = 'available')            AS stock
FROM offers o
JOIN esims e ON e.id = o.esim_id
LEFT JOIN esim_inventory i ON i.offer_id = o.id
GROUP BY e.flag, e.name, o.data_gb, o.duration_days, o.base_price, o.transatel_product_id
ORDER BY e.name, o.base_price;