import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/color.dart';

class OpenContainerWrapper extends ConsumerWidget {
  Widget child;
  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;

  OpenContainerWrapper({
    super.key,
    required this.child,
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openElevation: 0,
      closedElevation: 0,
      middleColor: AppColors.white,
      clipBehavior: Clip.antiAlias,
      routeSettings: RouteSettings(name: 'openContainer'),
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      openShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      openBuilder: (BuildContext context, VoidCallback _) {
        return child;
      },
      useRootNavigator: true,
      transitionDuration: const Duration(seconds: 1),
      openColor: AppColors.transparent,
      closedColor: AppColors.white,
      onClosed: onClosed,
      tappable: true,
      closedBuilder: closedBuilder,
    );
  }
}
