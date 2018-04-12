import 'package:flutter/material.dart';
import 'package:flutternw/data/model/champion.dart';
import 'package:flutternw/feature/widget/champion_photo.dart';
import 'package:flutternw/feature/widget/common.dart';
import 'package:meta/meta.dart';

class EventGrid extends StatelessWidget {
  static final Key emptyViewKey = new Key('emptyView');
  static final Key contentKey = new Key('content');

  EventGrid({
    @required this.events,
    @required this.onReloadCallback,
  });

  final List<Champion> events;
  final VoidCallback onReloadCallback;

  void _openEventDetails(BuildContext context, Champion event) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (BuildContext context) {}
//        builder: (_) => new EventDetailsPage(event),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var crossAxisChildCount = isPortrait ? 4 : 4;

    return new Container(
      key: contentKey,
      color: const Color(0xFF222222),
      child: new Scrollbar(
        child: new GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisChildCount,
          ),
          itemCount: events.length,
          itemBuilder: (BuildContext context, int index) {
            var event = events[index];
            return new EventGridItem(
              event: event,
              onTapped: () => _openEventDetails(context, event),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return new InfoMessageView(
        key: emptyViewKey,
        title: 'All empty!',
        description: 'Didn\'t find any movies at\nall. ¯\\_(ツ)_/¯',
        onActionButtonTapped: onReloadCallback,
      );
    }

    return _buildContent(context);
  }
}
