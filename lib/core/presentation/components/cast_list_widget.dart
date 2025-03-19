import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/cast.dart';
import 'package:sgm_block/core/presentation/components/cast_card.dart';
import 'package:sgm_block/core/presentation/components/empty_widget.dart';
import 'package:sgm_block/core/presentation/components/section_title.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KCastListView extends StatelessWidget {
  final List<Cast> listOfCast;
  const KCastListView({
    super.key,
    required this.listOfCast,
  });

  @override
  Widget build(BuildContext context) {
    return listOfCast.isEmpty
        ? const KEmptyWidget()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const KSectionTitle(title: KStrings.cast),
              KGaps.small.height,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: KPaddings.insideDefault),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    listOfCast.length,
                    (index) {
                      Cast cast = listOfCast[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: KPaddings.insideDefault,
                        ),
                        child: KCastCard(cast: cast),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
