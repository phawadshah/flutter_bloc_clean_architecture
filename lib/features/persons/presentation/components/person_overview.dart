import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sgm_block/core/presentation/components/empty_widget.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class PersonOverview extends StatefulWidget {
  final Person person;
  const PersonOverview({super.key, required this.person});

  @override
  State<PersonOverview> createState() => _PersonOverviewState();
}

class _PersonOverviewState extends State<PersonOverview> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    log(widget.person.id.toString());
    if (widget.person.biography == null || widget.person.biography!.isEmpty) {
      return const KEmptyWidget();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        TextSpan textSpan = TextSpan(
          text: widget.person.biography ?? '',
          style: context.bodyMedium,
        );
        TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: 5,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);
        final isTextLong = textPainter.didExceedMaxLines;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(KStrings.overView, style: context.titleMedium),
            KGaps.small.height,
            Text(
              widget.person.biography!,
              style: context.bodyMedium,
              maxLines: isExpanded ? null : 5,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            if (isTextLong)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'View Less' : 'View More',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            KGaps.betweenSections.height,
          ],
        );
      },
    );
  }
}
