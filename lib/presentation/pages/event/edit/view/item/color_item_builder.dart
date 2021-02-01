import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/widget/utils/combine_stream_builder.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/color_item_view.dart';

class ColorItemBuilder extends StatelessWidget {
  const ColorItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CombineStreamBuilder2<Color, ItemSelectState>(
        stream1: EventEditViewModelData.of(context).color,
        stream2: EventEditViewModelData.of(context).itemSelectState,
        initialData1: EventEditViewModelData.of(context).colorValue,
        initialData2: EventEditViewModelData.of(context).itemSelectStateValue,
        builder: (context, color, itemSelectState) => ColorItemView(color: color, itemSelectState: itemSelectState),
      );
}
