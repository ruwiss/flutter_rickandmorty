import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/episode_model.dart';
import 'package:rickandmorty/views/screens/section_characters_view/section_characters_viewmodel.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/character_card_listview.dart';

class SectionCharactersView extends StatefulWidget {
  final EpisodeModel episodeModel;
  const SectionCharactersView({super.key, required this.episodeModel});

  @override
  State<SectionCharactersView> createState() => _SectionCharactersViewState();
}

class _SectionCharactersViewState extends State<SectionCharactersView> {
  @override
  void initState() {
    super.initState();
    context
        .read<SectionCharactersViewmodel>()
        .getCharacters(widget.episodeModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.episodeModel.episode),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Consumer<SectionCharactersViewmodel>(
              builder: (context, viewModel, child) {
                return CharacterCardListView(characters: viewModel.characters);
              },
            ),
          ],
        ),
      ),
    );
  }
}
