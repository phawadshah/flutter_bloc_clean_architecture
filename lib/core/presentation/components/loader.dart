import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';

class KLoader extends StatelessWidget {
  const KLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCube(
        color: KColors.primary,
        size: KSizes.sizeXXl,
        duration: Duration(milliseconds: 2000),
      ),
    );
  }
}

class KRetryLoader extends StatelessWidget {
  const KRetryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCircle(
        color: KColors.primary,
        size: KSizes.sizeXl * 2,
        duration: Duration(milliseconds: 2000),
      ),
    );
  }
}

class KPaginationLoader extends StatelessWidget {
  const KPaginationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(
        color: KColors.primary,
        size: KSizes.sizeL,
      ),
    );
  }
}
