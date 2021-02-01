import 'package:flutter/material.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/event_list_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/view/day_pager.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/view/day_view.dart';

class EventListPageView extends StatelessWidget {
  const EventListPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: _EventListPageBody()),
      );
}

class _EventListPageBody extends StatelessWidget {
  const _EventListPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => EventListController.of(context).onOverlayTap(),
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * DayView.viewportHeightFraction,
              child: const DayPagerBuilder(),
            ),
          ),
        ],
      );
}
