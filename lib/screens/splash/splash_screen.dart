import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salary_calculator/domain/config/assets.dart';
import 'package:salary_calculator/screens/splash/bloc/splash_bloc.dart';
import 'package:salary_calculator/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashBloc _bloc = SplashBloc();

  @override
  void initState() {
    _bloc.add(const OnInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(AppAssets.logoNordClan),
      ),
    );
  }
}
