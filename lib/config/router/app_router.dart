import 'package:forms_app/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen()
    ),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen()
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) => const BlocCounterScreen()
    ),
    GoRoute(
      path: '/registro',
      builder: (context, state) => const RegistroScreen()
    )
  ] 
);