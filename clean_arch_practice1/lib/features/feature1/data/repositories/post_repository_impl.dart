import 'package:clean_arch_practice1/core/errors/exception.dart';
import 'package:clean_arch_practice1/core/errors/failure.dart';
import 'package:clean_arch_practice1/features/feature1/data/datasources/post_remote_data.dart';
import 'package:clean_arch_practice1/features/feature1/domain/entities/post_entity.dart';
import 'package:clean_arch_practice1/features/feature1/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteData postRemoteData;
  PostRepositoryImpl({
    required this.postRemoteData,
  });
  @override
  Future<Either<Failure, List<PostEntity>>> getPost() async {
    try {
      final postsData = await postRemoteData.getPosts();
      final posts = postsData.map((post) => post.toDomain()).toList();
      return right(posts);
    } on ServerException {
      return Left(ServerFailure());
    } on DataToDomainConversionException {
      return left(DataToDomainConversionFailure());
    }
  }
}
