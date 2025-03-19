import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgm_block/core/data/network/api_constants.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/features/movies/domain/entities/movie.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String getPosterUrl(String? path) {
  if (path != null) {
    return ApiConstants.basePosterUrl + path;
  } else {
    return ApiConstants.moviePlaceHolder;
  }
}

String getBackdropUrl(String? path) {
  if (path != null) {
    return ApiConstants.baseBackdropUrl + path;
  } else {
    return ApiConstants.moviePlaceHolder;
  }
}

String getCastProfileImage(Map<String, dynamic> json) {
  if (json['profile_path'] != null) {
    return ApiConstants.baseProfileUrl + json['profile_path'];
  } else {
    return ApiConstants.castPlaceHolder;
  }
}

String? getTrailerUrl(Map<String, dynamic> json) {
  List videos = json['videos']['results'] as List;
  if (videos.isEmpty) return null;
  var trailer = videos.firstWhere((video) => video['type'] == "Trailer",
      orElse: () => null);
  if (trailer == null) return null;
  return ApiConstants.baseVideoUrl + trailer['key'];
}

String getFormatedDateMMMyyyy(String? dateString) {
  try {
    if (dateString != null) {
      DateTime date = DateTime.parse(dateString);
      DateFormat formatter = DateFormat('MMM-yyyy');
      return formatter.format(date);
    } else {
      return '';
    }
  } catch (e) {
    return "Invalid Date";
  }
}

String getFormatedDateMMddyyyy(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('MMM-dd-yyyy').format(dateTime);
}

String? getFormatedDateMMMdy(String? dateString) {
  if (dateString == null) return null;
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('MMM d, y').format(dateTime);
}

String? getAgeFromBirthDay(String? dobString) {
  if (dobString == null) return null;
  DateTime dob = DateTime.parse(dobString);
  DateTime now = DateTime.now();
  int age = now.year - dob.year;
  if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
    age--;
  }
  return age.toString();
}

String getGender(int? gender) {
  if (gender == null) return "Prefers not to say";
  return gender == 2 ? "Male" : "Female";
}

bool isTextOverFlowing(String text,
    {TextStyle? style, int maxLines = 1, double width = double.infinity}) {
  TextSpan textSpan = TextSpan(
    text: text,
    style: style,
  );
  TextPainter textPainter = TextPainter(
    text: textSpan,
    maxLines: maxLines,
  );
  textPainter.layout(maxWidth: width);
  return textPainter.didExceedMaxLines;
}

EdgeInsetsDirectional listPadding(int index, int count) =>
    EdgeInsetsDirectional.only(
        start: index == 0 ? KPaddings.sideDefault : 0,
        end: index == count - 1 ? KPaddings.sideDefault : 0);

playTrailer(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
}

/// Navigations

navigateToMoviesList(BuildContext context, String category,
    {bool isMovie = true}) async {
  if (isMovie) {
    context.pushNamed(KRouteNames.moviesList, pathParameters: {
      KPathParameters.category: category,
    });
  }
}

navigateToDetailsView(BuildContext context, Media media) {
  if (media is Movie) {
    context.pushNamed(KRouteNames.movieDetails, pathParameters: {
      KPathParameters.movieId: media.id.toString(),
    });
  } else {
    log('not a movie');
  }
}

navigateToPersonView(BuildContext context, int id) {
  context.pushNamed(KRouteNames.person, pathParameters: {
    KPathParameters.personId: id.toString(),
  });
}

goBack(BuildContext context) {
  context.canPop() ? context.pop() : null;
}
