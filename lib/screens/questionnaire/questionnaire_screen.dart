import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/blocs/agreement/agreement_bloc.dart';
import 'package:pet_adoption/blocs/home_environment/home_environment_bloc.dart';
import 'package:pet_adoption/blocs/household_info/household_info_bloc.dart';
import 'package:pet_adoption/blocs/personal_info/personal_info_bloc.dart';
import 'package:pet_adoption/blocs/pet_ownership/pet_ownership_bloc.dart';
import 'package:pet_adoption/blocs/pet_reference/pet_reference_bloc.dart';
import 'package:pet_adoption/models/agreement/agreement_model.dart';
import 'package:pet_adoption/models/home_environment/home_environment_model.dart';
import 'package:pet_adoption/models/household_info/household_info_model.dart';
import 'package:pet_adoption/models/personal_info/personal_info_model.dart';
import 'package:pet_adoption/models/pet_owner_history/pet_owner_history_model.dart';
import 'package:pet_adoption/models/pet_reference/pet_reference_model.dart';
import 'package:pet_adoption/screens/agreement/agreement_screen.dart';
import 'package:pet_adoption/screens/home_environment/home_environment_screen.dart';
import 'package:pet_adoption/screens/household_info/household_info_screen.dart';
import 'package:pet_adoption/screens/personal_info/personal_info_screen.dart';
import 'package:pet_adoption/screens/pet_care/pet_care_screen.dart';
import 'package:pet_adoption/screens/pet_owner_history/pet_owner_history_screen.dart';
import 'package:pet_adoption/screens/pet_reference/pet_reference_screen.dart';
import 'package:pet_adoption/theme/color.dart';
import 'package:pet_adoption/widgets/appbar_widget.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final Map<String, dynamic> _formData = {};

  // 🔑 Form keys for each form step
  final _personalInfoKey = GlobalKey<FormState>();
  final _homeEnvironmentKey = GlobalKey<FormState>();
  final _householdInfoKey = GlobalKey<FormState>();
  final _petReferenceInfoKey = GlobalKey<FormState>();
  final _petOwnershipKey = GlobalKey<FormState>();
  final _petCareKey = GlobalKey<FormState>();
  final _agreementKey = GlobalKey<FormState>();
  // Add more keys for more steps...

  late List<Widget> _formPages;

  @override
  void initState() {
    super.initState();
    _formPages = [
      PersonalInfoScreen(formKey: _personalInfoKey, formData: _formData),
      HomeEnvironmentScreen(formKey: _homeEnvironmentKey, formData: _formData),
      HouseholdInfoScreen( formKey: _householdInfoKey, formData: _formData ),
      PetReferenceScreen( formKey: _petReferenceInfoKey, formData: _formData, ),
      PetOwnerHistoryScreen(formKey: _petOwnershipKey, formData: _formData,),
      PetCareScreen(formKey: _petCareKey, formData: _formData,),
      AgreementScreen(formKey: _agreementKey,formData: _formData,),
    ];
  }

  void _nextPage() {
    final currentFormKey = _getFormKeyForPage(_currentPage);
    
    // Validate the current form
    if (currentFormKey?.currentState?.validate() ?? false) {
      currentFormKey?.currentState?.save();
      final personalInfoModel = PersonalInfoModel.fromJson( _formData);
      final homeEnvironmentInfoModel = HomeEnvironmentModel.fromJson( _formData);
      final householdInfoModel = HouseholdInfoModel.fromJson( _formData);
      final petOwnershipInfoModel = PetOwnerHistoryModel.fromJson( _formData);
      final petReferenceInfoModel = PetReferenceModel.fromJson( _formData);
      final agreementInfoModel = AgreementModel.fromJson( _formData);

      // Save the form data to the bloc
      context.read<PersonalInfoBloc>().add(SavePersonalInfo(personalInfoModel));
      context.read<HomeEnvironmentBloc>().add(SaveHomeEnvironmentInfo(homeEnvironmentInfoModel));
      context.read<HouseholdInfoBloc>().add(SaveHouseholdInfo(householdInfoModel));
      context.read<PetOwnershipBloc>().add(SavePetOwnershipInfo(petOwnershipInfoModel));
      context.read<PetReferenceBloc>().add(SavePetReferenceInfo(petReferenceInfoModel));
      context.read<AgreementBloc>().add(SaveAgreementInfo(agreementInfoModel));


      debugPrint("Form data after step $_currentPage: $_formData");

      // Move to the next page
      if (_currentPage < _formPages.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage++;
        });
      } else {
        print("Submitting form with data: $_formData");
        // All done! Submit or move on
      }
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  GlobalKey<FormState>? _getFormKeyForPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return _personalInfoKey;
      case 1:
        return _homeEnvironmentKey;
      case 2:
        return _householdInfoKey;
      case 3:
        return _petReferenceInfoKey;
      case 4:
        return _petOwnershipKey;
      case 5:
        return _petCareKey;
      case 6:
        return _agreementKey;

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Adoption Form',
        backgroundColor: AppColor.red,
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.zero,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: SizedBox(
              height: 20,
              child: PageViewDotIndicator(
                currentItem: _currentPage,
                count: _formPages.length,
                unselectedColor: Colors.grey,
                selectedColor: AppColor.red,
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: _formPages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _previousPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColor.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      child: const Text("Back"),
                    ),
                  ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _nextPage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    child: Text(_currentPage == _formPages.length - 1
                        ? "Submit"
                        : "Next"),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
