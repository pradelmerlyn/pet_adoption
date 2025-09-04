import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pet_adoption/utils/phone_number_formatter.dart';
import 'package:pet_adoption/utils/step_header.dart';
import 'package:pet_adoption/widgets/choicechips.dart';
import 'package:pet_adoption/widgets/datepicker_widget.dart';
import 'package:pet_adoption/widgets/textarea_widget.dart';
import 'package:pet_adoption/widgets/textformfield_widget.dart';

class PersonalInfoScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? formData;

  const PersonalInfoScreen({
    super.key,
    required this.formKey,
    required this.formData,
  });

  @override
  State<PersonalInfoScreen> createState() => PersonalInfoScreenState();
}

class PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  DateTime? _selectedDate;
  bool genderSelect = false;


  void _pickBirthday() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdayController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

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
                    const Text(
                      "In an effort to help the process go smoothly, please be as detailed as possible with your responses to the questions below.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const StepsHeader(step: 1, title: 'Personal Information'),
                    TextFormFieldWidget(
                        controller: _nameController,
                        labelText: 'Full Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          widget.formData?['name'] = value;
                        }),
                    const SizedBox(height: 12),
                    DateFormFieldWidget(
                      controller: _birthdayController,
                      topLabel: 'Date of Birth',
                      labelText: 'Birthday',
                      onTap: _pickBirthday,
                      onSaved: (value) => widget.formData?['birthday'] = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your birthday';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    ChoiceChipWidget(title: 'Select your gender',
                     choices: const ['Male', 'Female', 'Other'],
                      onChanged: (val) {},
                      onSaved: (value) => widget.formData?['gender'] = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Please select an option'
                          : null,
                    ),
                    
                    const SizedBox(height: 12),
                    TextFormFieldWidget(
                      controller: _emailController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }else if (EmailValidator.validate(value) == false) {
                          return 'Please enter a valid email';

                        }
                        return null;
                      },
                      onSaved: (value) => widget.formData?['email'] = value,
                    ),
                    const SizedBox(height: 12),
                    TextFormFieldWidget(
                    controller: _phoneController,
                    labelText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      PhoneNumberFormatter(),
                    ],
                    validator:
                        PhoneNumberFormatter.validate, // 👈 nice and clean now
                    onSaved: (value) => widget.formData?['phone'] = value,
                  ),
                    TextareaWidget(
                      title: 'Address (Street, City, State, Zip Code)',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      onSaved: (value) => widget.formData?['address'] = value,
                    ),
                    TextFormFieldWidget(
                      controller: _occupationController,
                      labelText: 'Occupation',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your occupation';
                        }
                        return null;
                      },
                      onSaved: (newValue) =>
                          widget.formData?['occupation'] = newValue,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}
