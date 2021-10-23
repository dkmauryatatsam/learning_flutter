import 'package:clean_arch_practice1/core/errors/failure.dart';
import 'package:clean_arch_practice1/features/feature1/domain/entities/post_entity.dart';
import 'package:clean_arch_practice1/features/feature1/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPosts {
  final PostRepository repository;
  GetPosts({
    required this.repository,
  });

  Future<Either<Failure, List<PostEntity>>> call() {
    return repository.getPost();
  }
}
