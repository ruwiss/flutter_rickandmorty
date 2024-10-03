import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/models/location_model.dart';

class LocationListView extends StatefulWidget {
  final LocationModel locationModel;
  final VoidCallback? onLoadMore;
  final bool loadMore;
  const LocationListView({
    super.key,
    required this.locationModel,
    this.onLoadMore,
    required this.loadMore,
  });

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _detectScrollBottom();
    super.initState();
  }

  void _detectScrollBottom() {
    if (widget.onLoadMore != null) {
      _scrollController.addListener(() {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.position.pixels;
        const int delta = 200;

        if (maxScroll - currentPosition <= delta) {
          widget.onLoadMore!();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      itemCount: widget.locationModel.locations.length,
      itemBuilder: (context, index) {
        final LocationItem location = widget.locationModel.locations[index];
        return Column(
          children: [
            ListTile(
              onTap: () => context.push(AppRoutes.residents, extra: location),
              leading: const Icon(Icons.location_on),
              trailing: const Icon(Icons.keyboard_arrow_right),
              title: Text(
                location.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                children: [
                  _subtitleItem(text: 'Tür: ', value: location.type),
                  _subtitleItem(
                    text: 'Kişi Sayısı: ',
                    value: location.residents.length.toString(),
                  ),
                ],
              ),
            ),
            if (widget.loadMore &&
                index == widget.locationModel.locations.length - 1)
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

  Widget _subtitleItem({required String text, required String value}) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
