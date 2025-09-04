import 'package:flutter/material.dart';
import 'package:pet_adoption/utils/step_header.dart';
import 'package:pet_adoption/widgets/choicechips.dart';
import 'package:pet_adoption/widgets/radiobuttons_widgets.dart';
import 'package:pet_adoption/widgets/textarea_widget.dart';

class PetOwnerHistoryScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? formData;

  const PetOwnerHistoryScreen({
    super.key,
    required this.formKey,
    required this.formData,
  });

  @override
  State<PetOwnerHistoryScreen> createState() => _PetOwnerHistoryScreenState();
}

class _PetOwnerHistoryScreenState extends State<PetOwnerHistoryScreen> {


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
                  const StepsHeader(step: 5, title: 'Pet Ownership History'),
                  const SizedBox(height: 12),
                  ChoiceChipWidget(
                    title:
                      'Have you ever owned a pet before?',
                    choices: const ['Yes', 'No'],
                    initialValue: 'No',
                    onChanged: (val) {
                      print('User selected previous pet: $val');
                    },
                    onSaved: (value) => widget.formData?['has_previous_pet'] = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                  TextareaWidget(
                    title: 'What happened to your last pet?',
                    hintText: '',
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['last_pet_experience'] = value,
                  ),
                  ChoiceChipWidget(
                    title: 'Do you have any pets now?',
                    choices: const ['Yes', 'No'],
                    initialValue: 'No',
                    onChanged: (val) {
                      print('User selected current pet: $val');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['has_other_pets'] = value,
                  ),
                  TextareaWidget(
                    title:
                        'If yes, please list the names and ages of your pets:',
                    hintText: '',
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'This field is required';
                    //   }
                    //   return null;
                    // },
                    onSaved: (value) => widget.formData?['other_pets_details'] = value,
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