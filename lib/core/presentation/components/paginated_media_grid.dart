import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/media_card.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KPaginatedMediaGrid extends StatefulWidget {
  final List<Media> medias;
  final bool isLoadingMore;
  final void Function()? onPageReached;
  const KPaginatedMediaGrid({
    super.key,
    required this.medias,
    this.onPageReached,
    this.isLoadingMore = false,
  });

  @override
  State<KPaginatedMediaGrid> createState() => _KPaginatedMediaGridState();
}

class _KPaginatedMediaGridState extends State<KPaginatedMediaGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      widget.onPageReached?.call();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(KPaddings.sideDefault),
            sliver: SliverGrid.builder(
              itemCount: widget.medias.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 180,
                crossAxisSpacing: KPaddings.sideDefault,
                mainAxisSpacing: KPaddings.sideDefault,
              ),
              itemBuilder: (context, index) {
                return KMediaCard(
                    media: widget.medias[index], showRating: true);
              },
            ),
          ),
          if (widget.isLoadingMore)
            SliverList(
              delegate: SliverChildListDelegate([
                KGaps.small.height,
                const KPaginationLoader(),
              ]),
            ),
          SliverToBoxAdapter(child: KGaps.betweenItems.height),
        ],
      ),
    );
  }
}
