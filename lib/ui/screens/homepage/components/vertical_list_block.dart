import 'package:flutter/material.dart';
import '../../event_detail/event_detail_screen.dart';

class VerticalListBlock extends StatelessWidget {
  final Map<String, dynamic> config;
  const VerticalListBlock({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final items = List<Map<String, dynamic>>.from(config['items'] ?? []);
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
        Column(
          children:
              items.map((item) {
                final card = Card(
                  child: ListTile(
                    leading: Image.network(item['image'], width: 60, height: 60, fit: BoxFit.cover),
                    title: Text(item['title'] ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
              }).toList(),
        ),
      ],
    );
  }
}
