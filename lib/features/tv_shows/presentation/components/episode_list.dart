import 'package:flutter/material.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_episode.dart';
import 'package:sgm_block/features/tv_shows/presentation/components/episode_card.dart';
import 'package:sgm_block/utils/constants/values.dart';

class TvShowEpisodesList extends StatelessWidget {
  const TvShowEpisodesList({
    super.key,
    required this.episodes,
  });

  final List<TvShowEpisode> episodes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(episodes.length, (index) {
        TvShowEpisode episode = episodes[index];
        return Padding(
          padding:
              const EdgeInsets.symmetric(vertical: KPaddings.insideDefault / 2),
          child: EpisodeCard(episode: episode),
        );
      }).toList(),
    );
  }
}
