import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/blocs/animals/animals_bloc.dart';
import 'package:pet_adoption/blocs/pet_details/pet_details_bloc.dart';
import 'package:pet_adoption/models/animals/animals_model.dart';
import 'package:pet_adoption/screens/login/login.dart';
import 'package:pet_adoption/screens/pet_details/pet_details_screen.dart';
import 'package:pet_adoption/theme/color.dart';
import 'package:pet_adoption/widgets/appbar_widget.dart';
import 'package:pet_adoption/widgets/bottom_navbar.dart';
import 'package:pet_adoption/widgets/petcategoryselector_widget.dart';
import 'package:pet_adoption/widgets/rounded_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  AnimalsBloc? _animalsBloc;
  List<String> favoriteIds = [];

  @override
  void initState() {
    super.initState();
    _animalsBloc = context.read<AnimalsBloc>();
    _animalsBloc?.add(GetAnimalsEvent(category: selectedCategory));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      bottomNavigationBar: const BottomNavbarWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: AppBarWidget(
              showBackButton: false,
              showUserGreeting: true,
              backgroundColor: Colors.transparent,
              actions: [_buildLoginAction()],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildBody(),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              child: Text(
                'Find your perfect pet!',
                style: TextStyle(
                  color: AppColor.darker,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildCategorySelector(),
            _buildPetsList(),
          ],
        ),
      ],
    );
  }

  Widget _buildCategorySelector() {
    return PetCategorySelectorWidget(
      categories: [
        PetCategory(label: 'All', iconPath: 'assets/icons/pet-border.svg'),
        PetCategory(label: 'Dog', iconPath: 'assets/icons/dog.svg'),
        PetCategory(label: 'Cat', iconPath: 'assets/icons/cat.svg'),
      ],
      initialSelected: selectedCategory,
      onChanged: (selected) {
        setState(() {
          selectedCategory = selected;
        });
        print("Selected category: $selected");
      },
    );
  }

  Widget _buildPetsList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<AnimalsBloc, AnimalsState>(
          listener: (context, state) {
            if (state.status == AnimalsStatus.loaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Animals loaded successfully!'),
                ),
              );
            }
            if (state.status == AnimalsStatus.failed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to load animals!'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == AnimalsStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == AnimalsStatus.failed) {
              return const Center(child: Text('Failed to load animals!'));
            }

            final filteredAnimals = selectedCategory == 'All'
                ? state.animals
                : state.animals
                    .where((animal) =>
                        animal.species?.toLowerCase() ==
                        selectedCategory.toLowerCase())
                    .toList();

            // debugPrint('Filtered animals 🐞🐞🐞: $filteredAnimals');
            // debugPrint('State animals 🐞🐞🐞: ${state.animals}');
            if (filteredAnimals.isEmpty) {
              return const Center(child: Text('No animals found!'));
            }

            return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredAnimals.length,
                itemBuilder: (context, index) {
                  final petDetails = filteredAnimals[index];
                  return _buildPetItem(pet: petDetails);
                });
          },
        ),
      ],
    );
  }

  Widget _buildPetItem({required AnimalModel pet}) {
    return GestureDetector(
      onTap: () async {
        final bool? isFavorite = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => PetDetailsBloc()
                ..add(GetPetDetailsEvent(
                  animal: pet,
                  petId: pet.id.toString(),
                  isFavorite: favoriteIds.contains(pet.id.toString()),
                  isLoading: false,
                )),
              child: PetDetailsScreen(petDetails: pet),
            ),
          ),
        );
        if (isFavorite != null) {
          setState(() {
            if (isFavorite == true) {
              if (!favoriteIds.contains(pet.id.toString())) {
                favoriteIds.add(pet.id.toString());
              }
              ;
            } else {
              favoriteIds.remove(pet.id.toString());
            }
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.appBgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: pet.imageUrl == null
                  ? const Icon(Icons.error, size: 150)
                  : Image.network(
                      pet.imageUrl ?? '',
                      width: 140,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(pet.name ?? '',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700)),
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Handle favorite action
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pet.shortDescription ?? 'No description',
                    style: const TextStyle(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  //const SizedBox(height: 5),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(pet.age ?? "Unknown",
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 5),
                          Text('• ${pet.gender ?? "Unknown"}',
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 5),
                          Text('• ${pet.weight ?? 0} KG',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginAction() {
    return RoundedButtonWidget(
      label: 'Be a FurParent', 
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      backgroundColor: AppColor.actionColor, 
      textColor: Colors.white,
      width: 150,
    );
  }
}
