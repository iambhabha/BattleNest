class DropdownItem {
  final int id;
  final String title;
  final bool isDeleted;

  DropdownItem({required this.id, required this.title, this.isDeleted = false});

  factory DropdownItem.fromJson(Map<String, dynamic> json) =>
      DropdownItem(id: (json['id'] as num).toInt(), title: json['title'], isDeleted: json['isDeleted'] ?? false);

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'isDeleted': isDeleted};
}
