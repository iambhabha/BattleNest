import 'package:flutter/material.dart';
import '../../event_detail/event_detail_screen.dart';

class GridBlock extends StatelessWidget {
  final Map<String, dynamic> config;
  const GridBlock({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final items = List<Map<String, dynamic>>.from(config['items'] ?? []);
    final layout = config['layout'] ?? {};
    final columns = layout['columns'] ?? 2;
    final itemHeight = (layout['itemHeight'] ?? 160).toDouble();
    final itemWidth = (layout['itemWidth'] ?? 140).toDouble();
    final title = config['title'] ?? '';
    final isTappable = config['tappable'] == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            childAspectRatio: itemWidth / itemHeight,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final content = Card(
              child: Column(
                children: [
                  Image.network(item['image'], height: itemHeight * 0.6, fit: BoxFit.cover),
                  Text(item['title'] ?? ''),
                  Text('Game: ${item['game'] ?? ''}'),
                ],
              ),
            );
            return isTappable && item['eventId'] != null
                ? GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => EventDetailScreen(eventId: item['eventId'])),
                      ),
                  child: content,
                )
                : content;
          },
        ),
      ],
    );
  }
}
