import 'package:booky_app/core/utils/api_services.dart';
import 'package:booky_app/core/utils/routes.dart';
import 'package:booky_app/core/utils/simple_bloc_observer.dart';
import 'package:booky_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booky_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booky_app/features/home/data/repo/home_repo_impl.dart';

import 'package:booky_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:booky_app/features/home/domain/usecases/fetch_newest_books.dart';
import 'package:booky_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booky_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/adapters.dart';
import 'constants.dart';
import 'features/home/domain/entities/book_entity.dart';

void main() async {
  Hive.registerAdapter(BookEntityAdapter());
  Hive.close();
  await Hive.initFlutter();
  await Hive.openBox(kFeaturedBox);
  await Hive.openBox(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  getIt.registerSingleton(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImplemenation(),
      homeRemoteDataSource: HomeRemoteDataSourceImplementation(ApiServices(
        dio: Dio(),
      )),
    ),
  );
  runApp(const BooklyApp());
}

final getIt = GetIt.instance;

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(FetchFeaturedBooksUseCase(HomeRepoImpl(
            homeLocalDataSource: HomeLocalDataSourceImplemenation(),
            homeRemoteDataSource:
                HomeRemoteDataSourceImplementation(ApiServices(
              dio: Dio(),
            )),
          )))
            ..featuredBooks();
        }),
        BlocProvider(create: (context) {
          return NewestBooksCubit(FetchNewestBooks(
            getIt.get(),
          ));
        })
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
