class PostEntity {
  String title;
  String body;

  PostEntity({
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostEntity && other.title == title && other.body == body;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode;

  @override
  String toString() => 'PostEntity(title: $title, body: $body)';
}
