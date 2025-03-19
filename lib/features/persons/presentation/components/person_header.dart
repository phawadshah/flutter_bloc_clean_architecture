import 'package:flutter/material.dart';
import 'package:sgm_block/core/presentation/components/image.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class PersonHeader extends StatelessWidget {
  const PersonHeader({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(KRadii.img),
          child: KImage(
            person.img,
            height: 130,
            width: 100,
            fit: BoxFit.fill,
          ),
        ),
        KGaps.small.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: KStrings.age, style: context.bodySmall),
                    TextSpan(
                        text: getAgeFromBirthDay(person.birthday),
                        style: context.bodyMedium),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: KStrings.born, style: context.bodySmall),
                    TextSpan(
                        text: getFormatedDateMMMdy(person.birthday),
                        style: context.bodyMedium),
                    TextSpan(
                        text: " ${person.placeOfBirth}",
                        style:
                            context.bodySmall.copyWith(color: Colors.yellow)),
                  ],
                ),
              ),
              if (person.deathday != null)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: KStrings.death, style: context.bodySmall),
                      TextSpan(text: getFormatedDateMMMdy(person.deathday)),
                    ],
                  ),
                ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: KStrings.gender, style: context.bodySmall),
                    TextSpan(text: (person.gender)),
                  ],
                ),
              ),
              if (person.knownFor != null)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: KStrings.department, style: context.bodySmall),
                      TextSpan(text: (person.knownFor)),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
