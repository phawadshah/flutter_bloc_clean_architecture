import 'package:flutter/material.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_season.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class SeasonDropDownWidget extends StatelessWidget {
  final int selectedSeason;
  final List<TvShowSeason> seasons;
  final void Function(int?)? onSeasonSelected;
  const SeasonDropDownWidget({
    super.key,
    required this.selectedSeason,
    required this.seasons,
    this.onSeasonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      elevation: 0,
      style: context.bodyMedium,
      focusColor: Colors.transparent,
      underline: Container(),
      value: selectedSeason,
      items: List.generate(
        seasons.length,
        (index) => DropdownMenuItem(
          value: seasons[index].seasonNumber,
          child: Text("Season ${seasons[index].seasonNumber}"),
        ),
      ),
      onChanged: onSeasonSelected,
    );
  }
}
