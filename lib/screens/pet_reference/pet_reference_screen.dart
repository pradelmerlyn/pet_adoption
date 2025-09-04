import 'package:flutter/material.dart';
import 'package:pet_adoption/utils/step_header.dart';
import 'package:pet_adoption/widgets/choicechips.dart';
import 'package:pet_adoption/widgets/radiobuttons_widgets.dart';
import 'package:pet_adoption/widgets/textarea_widget.dart';
import 'package:pet_adoption/widgets/textformfield_widget.dart';

class PetReferenceScreen extends StatefulWidget{
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? formData;

  const PetReferenceScreen({
    super.key,
    required this.formKey,
    required this.formData,
  });

  @override
  State<PetReferenceScreen> createState() => PetReferenceScreenState();
}

class PetReferenceScreenState extends State<PetReferenceScreen> {
  final TextEditingController _petNameController = TextEditingController();
  int selectedPage = 0;
  final int pageCount = 8;

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
                  const StepsHeader(step: 4, title: 'Pet Reference'),
                  const SizedBox(height: 12),
                   ChoiceChipWidget(
                      title: 'What are you looking to adopt?',
                      choices: const ['Cat', 'Dog', 'Other'],
                      onChanged: (val) {
                        print('User selected looking pets: $val');
                      },
                      onSaved: (value) => widget.formData?['adoption_reference'] = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    TextareaWidget(
                    title: 'Describe your ideal pet',
                    hintText: 'e.g. Friendly, playful, etc.',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['ideal_pet'] = value,
                  ),
                  TextFormFieldWidget(
                    controller: _petNameController,
                    
                    labelText: 'Pet name you want to adopt (if any)',
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your name';
                    //   }
                    //   return null;
                    // },
                    onSaved: (value) => widget.formData?['preferred_pet_name'] = value,
                  ),
                  ChoiceChipWidget(
                    title: 'Age preference',
                    choices: const ['Puppy/Kitten', 'Adult', 'Doesn\'t matter'],
                    onChanged: (val) {
                      print('User selected Age preference: $val');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.formData?['age_reference'] = value,
                  ),
                  const SizedBox(height: 12),
                  ChoiceChipWidget(
                    title: 'Gender preference',
                    choices: const ['Male', 'Female', 'Doesn\'t matter'],
                    onChanged: (val) {
                      print('User selected Gender preference: $val');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                   ChoiceChipWidget(
                    title: 'Size preference',
                    choices: const ['Small', 'Medium', 'Large', 'Doesn\'t matter'],
                    onChanged: (val) {
                      print('User selected Size preference: $val');
                    },
                    onSaved: (value) => widget.formData?['size_reference'] = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
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