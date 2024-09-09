import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/ui_conts.dart';
import 'package:salary_calculator/utils/widgets/buttons.dart';
import 'package:salary_calculator/utils/widgets/loader.dart';
import 'package:salary_calculator/utils/widgets/period_picker.dart';
import 'package:salary_calculator/utils/widgets/textfield.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingBloc _bloc = OnboardingBloc();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController prizeController = TextEditingController();
  final TextEditingController periodBeginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          bloc: _bloc,
          builder: (context, state) {
            switch (state) {
              case OnboardingStateLoading():
                return const DataCollectionLoader();
              case OnboardingStateLoaded():
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        AppLocalization.howDoYouEarnText,
                        style: const TextStyle(fontSize: 24.0),
                        maxLines: 2,
                      ),
                      UIConst.margin124v,
                      MainTextField(
                        controller: salaryController,
                        label: AppLocalization.salaryText,
                        isOnlyNumber: true,
                      ),
                      UIConst.margin8v,
                      MainTextField(
                        controller: prizeController,
                        label: AppLocalization.prizeText,
                        isOnlyNumber: true,
                      ),
                      UIConst.margin16v,
                      Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 18.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(AppLocalization.beforeTaxText),
                        ],
                      ),
                      UIConst.margin16v,
                      PeriodPicker(
                        onDateSelected: (DateTime value) => _bloc.add(PeriodDateSetEvent(periodBegin: value)),
                      ),
                      const Spacer(),
                      MainButton(
                        label: AppLocalization.continueText,
                        onTap: () => _bloc.add(
                          SalarySetEvent(
                            salary: int.parse(salaryController.text),
                            prize: int.parse(prizeController.text),
                          ),
                        ),
                        // onTap: () => AppNavigation.toHome(),
                      ),
                      UIConst.margin16v,
                    ],
                  ),
                );
              case OnboardingStateError():
                return const Center(
                  child: Text('Error'),
                );
            }
          },
        ),
      ),
    );
  }
}

class DataCollectionLoader extends StatelessWidget {
  const DataCollectionLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          AppLocalization.dataCollectionText,
          style: const TextStyle(fontSize: 24.0),
          textAlign: TextAlign.center,
        ),
        UIConst.margin32v,
        const LoadingDots(
          color: AppColors.mainButton,
        ),
      ],
    );
  }
}

/*
Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                AppLocalization.howDoYouEarnText,
                style: const TextStyle(fontSize: 24.0),
                maxLines: 2,
              ),
              UIConst.margin124v,
              MainTextField(
                controller: salaryController,
                label: AppLocalization.salaryText,
              ),
              UIConst.margin8v,
              MainTextField(
                controller: prizeController,
                label: AppLocalization.prizeText,
              ),
              UIConst.margin16v,
              Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 18.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(AppLocalization.beforeTaxText),
                ],
              ),
              UIConst.margin16v,
              MainTextField(
                controller: periodBeginController,
                label: AppLocalization.periodBeginText,
              ),
              const Spacer(),
              MainButton(
                label: AppLocalization.continueText,
                onTap: () => AppNavigation.toHome(),
              ),
              UIConst.margin16v,
            ],
          ),
 */
