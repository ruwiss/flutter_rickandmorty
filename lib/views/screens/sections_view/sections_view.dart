import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/decorated_container.dart';
import 'package:rickandmorty/views/widgets/episodes_listview.dart';

import 'sections_viewmodel.dart';

class SectionsView extends StatefulWidget {
  const SectionsView({super.key});

  @override
  State<SectionsView> createState() => _SectionsViewState();
}

class _SectionsViewState extends State<SectionsView> {
  @override
  void initState() {
    super.initState();
    context.read<SectionsViewmodel>().getEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppBarWidget(
          title: 'Bölümler',
          transparentBackground: true,
        ),
        body: DecoratedContainer(
          topChild: const SizedBox(height: 74),
          child: Consumer<SectionsViewmodel>(
            builder: (context, viewModel, child) {
              if (viewModel.episodesModel == null) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: EpisodesListView(
                    episodes: viewModel.episodesModel!.episodes,
                    onLoadMore: viewModel.onLoadMore,
                    loadMore: viewModel.loadMore,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
