import 'package:go_router/go_router.dart';
import 'package:salary_calculator/screens/auth/auth_screen.dart';
import 'package:salary_calculator/screens/calculation/calculation_screen.dart';
import 'package:salary_calculator/screens/history/history_screen.dart';
import 'package:salary_calculator/screens/home/bloc/home_bloc.dart';
import 'package:salary_calculator/screens/home/home_screen.dart';
import 'package:salary_calculator/screens/onboarding/onboarding_screen.dart';
import 'package:salary_calculator/screens/profile/profile_screen.dart';
import 'package:salary_calculator/screens/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: 'auth',
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'profile',
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      name: 'history',
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      name: 'calculation',
      path: '/calculation',
      builder: (context, state) => CalculationScreen(calculationType: state.extra as CalculationType),
    ),
  ],
);

class AppNavigation {
  static void back() => appRouter.pop();
  static void toAuth() => appRouter.pushReplacement('/auth');
  static void toOnboarding() => appRouter.pushReplacement('/onboarding');
  static void toHome() => appRouter.pushReplacement('/home');
  static void toProfile() => appRouter.push('/profile');
  static void toHistory() => appRouter.push('/history');
  static void toCalculation(CalculationType calculationType) => appRouter.push('/calculation', extra: calculationType);
}
