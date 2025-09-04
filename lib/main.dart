import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/blocs/agreement/agreement_bloc.dart';
import 'package:pet_adoption/blocs/animals/animals_bloc.dart';
import 'package:pet_adoption/blocs/home_environment/home_environment_bloc.dart';
import 'package:pet_adoption/blocs/household_info/household_info_bloc.dart';
import 'package:pet_adoption/blocs/personal_info/personal_info_bloc.dart';
import 'package:pet_adoption/blocs/pet_ownership/pet_ownership_bloc.dart';
import 'package:pet_adoption/blocs/pet_reference/pet_reference_bloc.dart';
import 'package:pet_adoption/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => AnimalsBloc() ),
        BlocProvider( create: (context) => PersonalInfoBloc()),
        BlocProvider( create: (context) => HomeEnvironmentBloc()),
        BlocProvider( create: (context) => HouseholdInfoBloc()),
        BlocProvider( create: (context) => PetOwnershipBloc()),
        BlocProvider( create: (context) => PetReferenceBloc()),
        BlocProvider( create: (context) => AgreementBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


