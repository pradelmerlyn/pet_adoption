import 'package:flutter/material.dart';
import 'package:pet_adoption/theme/color.dart';
import 'package:pet_adoption/utils/step_header.dart';
import 'package:pet_adoption/widgets/checkbox_widget.dart';
import 'package:pet_adoption/widgets/choicechips.dart';

class AgreementScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? formData;

  const AgreementScreen({
    super.key,
    required this.formKey,
    required this.formData,
  });

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  
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
                  const StepsHeader(step: 7, title: 'Agreement'),
                  const SizedBox(height: 12),
                  ChoiceChipWidget(
                    title: 'Do you understand that adopting a pet is a long-term commitment?',
                    choices: const ['Yes', 'No'],
                    onSaved: (value) => widget.formData?['long_term_commitment'] = value,
                    onChanged: (val) {
                      print('User selected long-term commitement: $val');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                  ChoiceChipWidget(
                    title: 'Will you be able to visit the shelter for the meet-and-greet?',
                    choices: const ['Yes', 'No'],
                    onSaved: (value) => widget.formData?['meet_and_greet'] = value,
                    onChanged: (val) {
                      print('User selected meet and greet: $val');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                  CheckboxWidget(
                    label: 'I hereby certify that the information I provided is true and correct to the best of my knowledge.',
                    initialValue: false,
                    onSaved: (value) => widget.formData?['is_certify'] = value,
                    validator: (value) {
                      if (value != true) {
                        return 'You must agree before submitting.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                    },
                    activeColor: AppColor.red,
                    checkColor: Colors.white,
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
