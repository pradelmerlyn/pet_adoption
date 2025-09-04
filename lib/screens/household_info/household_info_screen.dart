import 'package:flutter/material.dart';
import 'package:pet_adoption/utils/step_header.dart';
import 'package:pet_adoption/widgets/choicechips.dart';
import 'package:pet_adoption/widgets/multichoicechips_widget.dart';

class HouseholdInfoScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? formData;

  const HouseholdInfoScreen({
    super.key,
    required this.formKey,
    required this.formData,
  });

  @override
  State<HouseholdInfoScreen> createState() => _HouseholdInfoScreenState();
}

class _HouseholdInfoScreenState extends State<HouseholdInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StepsHeader(step: 3, title: 'Household Information'),
                  const SizedBox(height: 12),
                  MultiChoiceChipWidget(
                    title: 'Who do you live with?',
                    choices: const [
                      'Living alone',
                      'Spouse/Partner',
                      'Parents',
                      'Children over 18',
                      'Children under 18',
                      'Roommate(s)',
                      'Relatives',
                    ],
                    onChanged: (val) {},
                    onSaved: (value) => widget.formData?['living_with'] = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select at least one option';
                      }
                      return null;
                    },
                  ),
                  ChoiceChipWidget(
                    title: 'Are any members of your household allergic to animals?',
                    choices: const ['Yes', 'No'],
                    onChanged: (val) {},
                    onSaved: (value) => widget.formData?['allergic_to_animals'] = value,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Please select an option'
                        : null,
                  ),
                  const SizedBox(height: 12),
                  
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
