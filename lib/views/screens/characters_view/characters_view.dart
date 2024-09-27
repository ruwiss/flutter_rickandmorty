import 'package:flutter/material.dart';
import 'package:rickandmorty/views/widgets/character_cardview.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            children: [
              _searchInputWidget(context),
              const CharacterCardView(
                image:
                    'https://rickandmortyapi.com/api/character/avatar/600.jpeg',
                name: 'Rick Sanchez',
                origin: 'Earth (C-137)',
                status: 'Yaşıyor',
                type: 'İnsan',
              ),
              const CharacterCardView(
                image:
                    'https://rickandmortyapi.com/api/character/avatar/600.jpeg',
                name: 'Rick Sanchez',
                origin: 'Earth (C-137)',
                status: 'Yaşıyor',
                type: 'İnsan',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchInputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Karakterlerde Ara',
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
