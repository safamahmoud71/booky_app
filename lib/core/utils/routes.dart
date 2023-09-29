
import 'package:booky_app/features/home/presentation/views/home_view.dart';
import 'package:booky_app/features/home/presentation/views/widgets/book_details_view.dart';
import 'package:booky_app/features/search/presentaion/view/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

class AppRouters {
  static const homeView = '/homeView';
  static const bookDetails = '/bookDetails';
  static const searchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: searchView, builder: (context, state) => const SearchView()),
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
      GoRoute(
          path: bookDetails,

          builder: (context, state) =>  BookDetailsView(index: 0))
    ],
  );
}
