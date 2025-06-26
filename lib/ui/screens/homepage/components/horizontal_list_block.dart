import 'package:flutter/material.dart';
import '../../event_detail/event_detail_screen.dart';

class HorizontalListBlock extends StatelessWidget {
  final Map<String, dynamic> config;
  const HorizontalListBlock({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final items = List<Map<String, dynamic>>.from(config['items'] ?? []);
    final layout = config['layout'] ?? {};
    final height = (layout['height'] ?? 180).toDouble();
    final itemWidth = (layout['itemWidth'] ?? 140).toDouble();
    final itemHeight = (layout['itemHeight'] ?? 120).toDouble();
    final isTappable = config['tappable'] == true;
    final title = config['title'] ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final card = SizedBox(
                width: itemWidth,
                child: Card(
                  child: Column(
                    children: [
                      Image.network(item['image'], width: itemWidth, height: itemHeight, fit: BoxFit.cover),
                      Text(item['title'] ?? ''),
                      Text('Game: ${item['game'] ?? ''}'),
                      Text('Team: ${item['teamType'] ?? ''}'),
                      Text('Participants: ${item['participants'] ?? ''}'),
                    ],
                  ),
                ),
              );
              return isTappable && item['eventId'] != null
                  ? GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => EventDetailScreen(eventId: item['eventId'])),
                        ),
                    child: card,
                  )
                  : card;
            },
          ),
        ),
      ],
    );
  }
}
