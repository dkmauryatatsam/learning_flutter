import 'package:clean_arch_practice1/core/errors/exception.dart';
import 'package:clean_arch_practice1/features/feature1/domain/entities/post_entity.dart';

class PostModel {
  int? id;
  String? title;
  String? body;

  PostModel(
    this.id,
    this.title,
    this.body,
  );

  static PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(json['id'], json['title'], json['body']);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "body": body,
    };
  }

  PostEntity toDomain() {
    checkIfNull(title);
    checkIfNull(body);
    return PostEntity(
      title: title!,
      body: body!,
    );
  }

  factory PostModel.fromDomain(PostEntity domain) {
    return PostModel(
      null,
      domain.title,
      domain.body,
    );
  }
}

checkIfNull(dynamic field) {
  if (field == null) {
    throw DataToDomainConversionException();
  }
}
