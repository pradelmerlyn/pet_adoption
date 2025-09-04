import 'package:flutter/material.dart';
import 'package:pet_adoption/utils/step_header.dart';
import 'package:pet_adoption/widgets/choicechips.dart';
import 'package:pet_adoption/widgets/dropdown_widget.dart';
import 'package:pet_adoption/widgets/radiobuttons_widgets.dart';
import 'package:pet_adoption/widgets/textarea_widget.dart';

class HomeEnvironmentScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? formData;

  const HomeEnvironmentScreen({
    super.key,
    required this.formKey,
    required this.formData,
  });

  @override
  State<HomeEnvironmentScreen> createState() => _HomeEnvironmentScreenState();
}

class _HomeEnvironmentScreenState extends State<HomeEnvironmentScreen> {

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
                  const StepsHeader(step: 2, title: 'Home Environment'),
                  const SizedBox(height: 12),
                  ChoiceChipWidget(
                      title: 'What type of building do you live in?',
                      choices: const ['House', 'Apartment', 'Condo', 'Other'],
                      onChanged: (val) {},
                      onSaved: (value) => widget.formData?['house_building'] = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Please select an option'
                          : null),
                  const SizedBox(height: 12),
                  ChoiceChipWidget(
                    title: 'Do you rent?',
                    choices: const ['Yes', 'No'],
                    onChanged: (val) {},
                    onSaved: (value) => widget.formData?['is_renting'] = value,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Please select an option'
                        : null,
                  ),
                  const SizedBox(height: 12),
                  TextareaWidget(
                    title: 'What happens to your pet if or when you move? ',
                    hintText: '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['pet_relocation_plan'] = value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
