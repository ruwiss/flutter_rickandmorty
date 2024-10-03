import 'package:flutter/foundation.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/episode_model.dart';
import 'package:rickandmorty/services/api_service.dart';

class SectionsViewmodel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  EpisodesModel? _episodesModel;
  EpisodesModel? get episodesModel => _episodesModel;

  void getEpisodes() async {
    _episodesModel = await _apiService.getAllEpisodes();
    notifyListeners();
  }

  bool loadMore = false;
  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  int _page = 1;

  void onLoadMore() async {
    if (loadMore && _page == _episodesModel!.info.pages) return;

    setLoadMore(true);
    final data =
        await _apiService.getAllEpisodes(url: _episodesModel?.info.next);
    _page++;
    _episodesModel!.info = data.info;
    _episodesModel!.episodes.addAll(data.episodes);

    setLoadMore(false);
  }
}
