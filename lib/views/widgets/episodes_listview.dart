import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/models/episode_model.dart';

class EpisodesListView extends StatefulWidget {
  final List<EpisodeModel> episodes;
  final bool loadMore;
  final VoidCallback? onLoadMore;
  const EpisodesListView({
    super.key,
    required this.episodes,
    this.loadMore = false,
    this.onLoadMore,
  });

  @override
  State<EpisodesListView> createState() => _EpisodesListViewState();
}

class _EpisodesListViewState extends State<EpisodesListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  void _listenScroll() {
    if (widget.onLoadMore == null) return;
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const delta = 200;

      if (maxScroll - currentPosition <= delta) {
        widget.onLoadMore!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      itemCount: widget.episodes.length,
      itemBuilder: (context, index) {
        final EpisodeModel model = widget.episodes[index];
        return Column(
          children: [
            ListTile(
              onTap: () => context.push(
                AppRoutes.sectionCharacters,
                extra: model,
              ),
              leading: const Icon(
                Icons.face_retouching_natural,
                size: 36,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: Text(
                model.episode,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                model.name,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            if (widget.loadMore && index == widget.episodes.length - 1)
              const CircularProgressIndicator.adaptive(),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Theme.of(context).colorScheme.tertiary,
        indent: 30,
        endIndent: 30,
        height: 0,
      ),
    );
  }
}
