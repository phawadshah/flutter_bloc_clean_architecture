import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KTabBar extends StatefulWidget {
  final int initalIndex;
  final List<Widget> tabs;
  final List<Widget> tabViews;
  const KTabBar({
    super.key,
    this.initalIndex = 0,
    required this.tabs,
    required this.tabViews,
  });

  @override
  State<KTabBar> createState() => _KTabBarState();
}

class _KTabBarState extends State<KTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late int tabIndex;

  @override
  void initState() {
    _tabController = TabController(
        initialIndex: widget.initalIndex,
        length: widget.tabs.length,
        vsync: this);
    tabIndex = widget.initalIndex;
    super.initState();
  }

  void onTabChanged(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          labelStyle: context.bodyMedium,
          unselectedLabelStyle: context.bodySmall,
          labelColor: KColors.primary,
          unselectedLabelColor: KColors.white,
          dividerColor: KColors.transparent,
          indicatorColor: KColors.primary,
          indicatorWeight: 4,
          splashBorderRadius: BorderRadius.zero,
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: onTabChanged,
          tabs: widget.tabs,
        ),
        KGaps.betweenSections.height,
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: KPaddings.sideDefault),
          child: widget.tabViews[tabIndex],
        ),
      ],
    );
  }
}
