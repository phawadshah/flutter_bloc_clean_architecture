import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';
import 'package:sgm_block/features/persons/presentation/components/person_header.dart';
import 'package:sgm_block/features/persons/presentation/components/person_overview.dart';
import 'package:sgm_block/features/persons/presentation/components/person_related_movies.dart';
import 'package:sgm_block/features/persons/presentation/person_bloc/person_bloc.dart';
import 'package:sgm_block/features/persons/presentation/person_bloc/person_event.dart';
import 'package:sgm_block/features/persons/presentation/person_bloc/person_state.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class PersonView extends StatelessWidget {
  final int personId;
  const PersonView({super.key, required this.personId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonBloc>(
      create: (context) => sl<PersonBloc>()..add(GetPersonEvent(personId)),
      child: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const KRetryLoader();
            case RequestStatus.loaded:
              return PersonWidget(
                person: state.person!,
              );
            case RequestStatus.error:
              return KErrorWidget(
                message: state.message,
                onPressed: () {
                  context.read<PersonBloc>().add(GetPersonEvent(personId));
                },
              );
            case RequestStatus.retrying:
              return KRetryLoader(key: key);
          }
        },
      ),
    );
  }
}

class PersonWidget extends StatelessWidget {
  final Person person;
  const PersonWidget({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name, style: context.titleMedium),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: KPaddings.sideDefault),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonHeader(person: person),
              KGaps.betweenSections.height,
              PersonOverview(person: person),
              PersonRelatedMovies(medias: person.media)
            ],
          ),
        ),
      ),
    );
  }
}
