import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';
import 'package:simple_calendar_app/presentation/res/app_color.dart';

class ColorItemView extends StatelessWidget {
  const ColorItemView({
    required this.color,
    required this.itemSelectState,
    Key? key,
  }) : super(key: key);

  final Color color;
  final ItemSelectState itemSelectState;

  static const Size colorCircleSize = Size.square(Dimens.viewSize24);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _ColorItemView(color: color, itemSelectState: itemSelectState, colorCircleSize: colorCircleSize),
          AnimatedExpansion(
            isExpanded: itemSelectState == ItemSelectState.color,
            curve: itemSelectState == ItemSelectState.color ? Curves.easeOutSine : Curves.easeInSine,
            duration: kThemeAnimationDuration,
            child: AnimatedOpacity(
              opacity: itemSelectState == ItemSelectState.color ? 1 : 0,
              duration: kThemeAnimationDuration,
              curve: itemSelectState == ItemSelectState.color ? Curves.easeOutSine : Curves.easeInSine,
              child: GridView.count(
                padding: const EdgeInsets.only(
                  left: Dimens.padding64 + 2, // circleと端を合わせる為
                  right: Dimens.padding24,
                  bottom: Dimens.padding16,
                ),
                shrinkWrap: true,
                crossAxisCount: 8,
                children: AppColor.eventColors
                    .map(
                      (eventColor) => ColorCircle(
                        color: eventColor,
                        isSelected: color == eventColor,
                        onTap: () => EventEditController.of(context).onColorSelected(eventColor),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      );
}

class _ColorItemView extends StatelessWidget {
  const _ColorItemView({
    required this.color,
    required this.itemSelectState,
    required this.colorCircleSize,
    Key? key,
  }) : super(key: key);

  final Color color;
  final ItemSelectState itemSelectState;
  final Size colorCircleSize;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => EventEditController.of(context).onColorItemTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.padding16),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: Dimens.padding24),
                  Icon(
                    FluentIcons.color_20_regular,
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                  ),
                  const SizedBox(width: Dimens.padding24),
                  Material(
                    color: color,
                    elevation: 0.5,
                    shadowColor: color,
                    borderRadius: BorderRadius.circular(Dimens.radius64),
                    child: AnimatedContainer(
                      height: itemSelectState == ItemSelectState.color ? colorCircleSize.height : 18,
                      width: itemSelectState == ItemSelectState.color ? colorCircleSize.width : 18,
                      duration: kThemeAnimationDuration,
                      curve: itemSelectState == ItemSelectState.color ? Curves.easeOutSine : Curves.easeInSine,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    required this.color,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        // 消える途中でsplashが残るので、全部透明にする
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: onTap,
        child: Center(
          child: Material(
            elevation: 0.5,
            shadowColor: color,
            color: color,
            borderRadius: BorderRadius.circular(Dimens.radius64),
            child: SizedBox.fromSize(
              size: ColorItemView.colorCircleSize,
              child: Visibility(
                visible: isSelected,
                child: const Icon(
                  FluentIcons.checkmark_24_filled,
                  color: Colors.white,
                  size: Dimens.viewSize16,
                ),
              ),
            ),
          ),
        ),
      );
}
