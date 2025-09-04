import 'package:flutter/material.dart';
import 'package:pet_adoption/utils/step_header.dart';
import 'package:pet_adoption/widgets/textarea_widget.dart';

class PetCareScreen extends StatefulWidget{
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? formData;

  const PetCareScreen({
    super.key,
    required this.formKey,
    required this.formData,
  });

  @override
  State<PetCareScreen> createState() => _PetCareScreenState();
}

class _PetCareScreenState extends State<PetCareScreen> {
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
                  const SizedBox(height: 16),
                  const StepsHeader(step: 6, title: 'Pet Care Information'),
                  const SizedBox(height: 12),
                  TextareaWidget(
                    title:
                        'Who will be the primary caretaker of the pet?',
                    hintText: '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['is_renting'] = value,
                  ),
                  TextareaWidget(
                    title:
                        'How many hours a day will the pet be left alone?',
                    hintText: '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['hours_pet_alone'] = value,
                  ),
                  TextareaWidget(
                    title:
                        'Where will the pet stay when you are out of town or on vacation?',
                    hintText: '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['vacation_plan'] = value,
                  ),
                  TextareaWidget(
                    title:
                        'What steps will you take to introduce your new pet to his/her new surroundings?',
                    hintText: '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['pet_intro_plan'] = value,
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