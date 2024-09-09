import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/domain/repositories/auth/abstract_auth_repository.dart';
import 'package:salary_calculator/domain/repositories/home/abstract_home_repository.dart';
import 'package:salary_calculator/screens/home/bloc/home_bloc.dart';
import 'package:salary_calculator/screens/home/widgets/profile_row.dart';
import 'package:salary_calculator/screens/home/widgets/salary_card.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/widgets/loader.dart';

import '../../domain/config/localization.dart';
import '../../utils/ui_conts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = HomeBloc(homeRepository: GetIt.I<AbstractHomeRepository>());

  @override
  void initState() {
    _bloc.add(const OnInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          switch (state) {
            case HomeStateLoading():
              return const Center(child: CircularProgressIndicator());
            case HomeStateLoaded():
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => AppNavigation.toProfile(),
                      child: ProfileRow(
                        userName: state.user.requiredContent.firstNameRu,
                        avatar: state.user.requiredContent.photo,
                      ),
                    ),
                    UIConst.margin16v,
                    SalaryCard(
                      salary: state.salary,
                    ),
                    UIConst.margin16v,
                    MenuTile(
                      title: AppLocalization.salaryHistory,
                      onTap: () => AppNavigation.toHistory(),
                    ),
                    UIConst.margin32v,
                    Text(
                      AppLocalization.calculationText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    UIConst.margin16v,
                    ...CalculationType.values.map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: MenuTile(title: e.name, onTap: () => AppNavigation.toCalculation(e)),
                        )),
                  ],
                ),
              );
            case HomeStateError():
              return const Center(
                child: Text('Home Screen: Error'),
              );
          }
        },
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MenuTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: AppColors.primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.hintText,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
