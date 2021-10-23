import 'package:clean_arch_practice1/core/errors/failure.dart';
import 'package:clean_arch_practice1/features/feature1/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPost();
}
