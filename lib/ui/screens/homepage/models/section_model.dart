class SectionModel {
  final String id;
  final String title;
  final int priority;
  final String layout;
  final List<ItemModel> items;
  final bool visible;

  SectionModel({
    required this.id,
    required this.title,
    required this.priority,
    required this.layout,
    required this.items,
    required this.visible,
  });

  factory SectionModel.fromFirestore(String id, Map<String, dynamic> data) {
    return SectionModel(
      id: id,
      title: data['title'] ?? '',
      priority: data['priority'] ?? 0,
      layout: data['layout'] ?? '',
      items:
          (data['items'] as List<dynamic>? ?? [])
              .map((item) => ItemModel.fromMap(item))
              .toList(),
      visible: data['visible'] ?? true,
    );
  }
}

class ItemModel {
  final String title;
  final String image;
  final String status;
  final String type;
  final int priority;
  final bool visible;
  final String? teamType;
  final int? participants;
  // Add more fields as needed

  ItemModel({
    required this.title,
    required this.image,
    required this.status,
    required this.type,
    required this.priority,
    required this.visible,
    this.teamType,
    this.participants,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? '',
      type: map['type'] ?? '',
      priority: map['priority'] ?? 0,
      visible: map['visible'] ?? true,
      teamType: map['teamType'],
      participants: map['participants'],
    );
  }
}
