import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/domain/repositories/home/abstract_home_repository.dart';
import 'package:salary_calculator/screens/profile/bloc/profile_bloc.dart';
import 'package:salary_calculator/screens/profile/widgets/add_salary_bottom_sheet.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/ui_conts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc _bloc = ProfileBloc(homeRepository: GetIt.I<AbstractHomeRepository>());

  @override
  void initState() {
    _bloc.add(const OnInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(AppLocalization.profileTitle),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _bloc,
        builder: (context, state) {
          switch (state) {
            case ProfileStateLoading():
              return Center(
                child: CircularProgressIndicator(),
              );
            case ProfileStateLoaded():
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 48.0,
                          width: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(64.0),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://static.wikia.nocookie.net/thelastofus/images/3/34/Part_II_Ellie_infobox.png/revision/latest/scale-to-width-down/1200?cb=20230215221019'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(state.user.firstNameRu),
                      ],
                    ),
                    UIConst.margin32v,
                    Text(
                      AppLocalization.jobTitleText,
                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    UIConst.margin16v,
                    Container(
                      height: 40.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: AppColors.mainColor,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(state.user.department),
                        ),
                      ),
                    ),
                    UIConst.margin32v,
                    Text(
                      AppLocalization.salary,
                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SalaryInfoWidget(
                      firstDate: 'Настоящее время',
                      secondDate: 'Октябрь 2023',
                      firstSalary: '150 000 ₽',
                      secondSalary: '40 000 ₽',
                    ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.error_outline,
                    //       color: AppColors.errorColor,
                    //       size: 18.0,
                    //     ),
                    //     const SizedBox(width: 4.0),
                    //     Text(
                    //       AppLocalization.emptyCurrentSalary,
                    //       style: const TextStyle(color: AppColors.errorColor),
                    //     ),
                    //   ],
                    // ),
                    UIConst.margin16v,
                    Center(
                      child: InkWell(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => const AddSalaryBottomSheet(),
                        ),
                        child: Text(
                          AppLocalization.addText,
                          style: const TextStyle(
                            color: AppColors.mainButton,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: TextButton(
                        onPressed: () => _bloc.add(const LogoutEvent()),
                        child: Text(
                          AppLocalization.exitText,
                          style: const TextStyle(color: AppColors.errorColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    UIConst.margin16v,
                  ],
                ),
              );

            case ProfileStateError():
              return Center(
                child: Text('Error'),
              );
          }
        },
      ),
    );
  }
}

class SalaryInfoWidget extends StatelessWidget {
  final String firstDate;
  final String secondDate;
  final String firstSalary;
  final String secondSalary;
  const SalaryInfoWidget({
    super.key,
    required this.firstDate,
    required this.secondDate,
    required this.firstSalary,
    required this.secondSalary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstDate,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColors.hintText,
                ),
              ),
              const Text(
                '|',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.hintText,
                ),
              ),
              Text(
                secondDate,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColors.hintText,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                firstSalary,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.mainButton,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                secondSalary,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.mainButton,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
            ),
          ),
        ],
      ),
    );
  }
}
