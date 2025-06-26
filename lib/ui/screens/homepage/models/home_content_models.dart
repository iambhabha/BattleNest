// FINAL HOME MODELS — PRODUCTION GRADE NAMING
// File: home_content_models.dart

class HomeContentBlock {
  final String type;
  final String? title;
  final int priority;
  final bool tappable;
  final HomeBlockLayout layout;
  final List<HomeBlockItem> items;

  HomeContentBlock({
    required this.type,
    this.title,
    required this.priority,
    required this.tappable,
    required this.layout,
    required this.items,
  });

  factory HomeContentBlock.fromMap(Map<String, dynamic> map) {
    return HomeContentBlock(
      type: map['type'],
      title: map['title'],
      priority: map['priority'] ?? 9999,
      tappable: map['tappable'] ?? false,
      layout: HomeBlockLayout.fromMap(map['layout'] ?? {}),
      items: List<Map<String, dynamic>>.from(map['items'] ?? []).map((e) => HomeBlockItem.fromMap(e)).toList(),
    );
  }
}

class HomeBlockLayout {
  final double height;
  final double width;
  final double itemHeight;
  final double itemWidth;
  final String orientation;
  final int columns;

  HomeBlockLayout({
    required this.height,
    required this.width,
    required this.itemHeight,
    required this.itemWidth,
    required this.orientation,
    required this.columns,
  });

  factory HomeBlockLayout.fromMap(Map<String, dynamic> map) {
    return HomeBlockLayout(
      height: (map['height'] ?? 180).toDouble(),
      width: (map['width'] ?? 0).toDouble(),
      itemHeight: (map['itemHeight'] ?? 140).toDouble(),
      itemWidth: (map['itemWidth'] ?? 120).toDouble(),
      orientation: map['orientation'] ?? 'horizontal',
      columns: map['columns'] ?? 2,
    );
  }
}

class HomeBlockItem {
  final String image;
  final String? title;
  final String? game;
  final String? teamType;
  final int? participants;
  final String? eventId;

  HomeBlockItem({required this.image, this.title, this.game, this.teamType, this.participants, this.eventId});

  factory HomeBlockItem.fromMap(Map<String, dynamic> map) {
    return HomeBlockItem(
      image: map['image'] ?? '',
      title: map['title'],
      game: map['game'],
      teamType: map['teamType'],
      participants: map['participants'],
      eventId: map['eventId'],
    );
  }
}
