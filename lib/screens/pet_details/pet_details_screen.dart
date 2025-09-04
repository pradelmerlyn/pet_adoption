import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/blocs/pet_details/pet_details_bloc.dart';
import 'package:pet_adoption/models/animals/animals_model.dart';
import 'package:pet_adoption/screens/questionnaire/questionnaire_screen.dart';
import 'package:pet_adoption/theme/color.dart';
import 'package:pet_adoption/widgets/bottom_navbar.dart';

class PetDetailsScreen extends StatefulWidget {
  final AnimalModel petDetails;

  const PetDetailsScreen({super.key, required this.petDetails});

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  final bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PetDetailsBloc, PetDetailsState>(
      listener: (context, state) {
        if (state is PetDetailsLoaded) {
          final isFavorite = state.isFavorite;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isFavorite ? 'Added to favorites' : 'Removed from favorites',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.appBgColor,
        bottomNavigationBar: const BottomNavbarWidget(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColor.appBarColor,
              expandedHeight: 300,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Background image
                    Positioned.fill(
                      child: Image.network(
                        widget.petDetails.imageUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Rounded info container
                    _buildHeaderInfo(),

                    // Favorite icon
                    BlocBuilder<PetDetailsBloc, PetDetailsState>(
                      builder: (context, state) {
                        if (state is PetDetailsLoaded) {
                          return _setFavorite(state.isFavorite);
                        }
                        return const SizedBox();
                      },
                    ),
                    // Back icon
                    _goBackButton(),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            // Info cards & owner section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInfoCard(
                              'Sex', widget.petDetails.gender ?? 'Unknown'),
                          _buildInfoCard(
                              'Age', widget.petDetails.age ?? 'Unknown'),
                          _buildInfoCard(
                              'Weight',
                              widget.petDetails.weight != null
                                  ? '${widget.petDetails.weight} KG'
                                  : 'Unknown'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildOwnerCard(),
                    _buildAboutMe(widget.petDetails.description ?? ''),
                    const SizedBox(height: 16),
                    _buildAdoptionButton(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.petDetails.name ?? 'Unknown Pet',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: AppColor.darker),
                const SizedBox(width: 4),
                Text(
                  widget.petDetails.shortDescription ?? 'None',
                  style: const TextStyle(color: AppColor.darker, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value.toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Animal Shelter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                "Pet's Owner",
                style: TextStyle(fontSize: 12, color: AppColor.labelColor),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // Call action
            },
            icon: const Icon(
              Icons.call,
              size: 18,
              color: AppColor.appBarColor,
            ),
            label: const Text(
              'Call',
              style: TextStyle(color: AppColor.appBarColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMe(String info) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            info == '' ? 'No description available.' : info,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildAdoptionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const QuestionnaireScreen()));
      },
      heroTag: 'adopt',
      elevation: 0,
      backgroundColor: AppColor.red,
      label: const Text(
        "Adopt Me!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      icon: const Icon(
        Icons.pets_rounded,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _setFavorite(bool isFavorite) {
    return Positioned(
      bottom: 10,
      right: 30,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: isFavorite ? AppColor.red : AppColor.darker,
        child: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColor.appBarColor,
            size: 20,
          ),
          onPressed: () {
            context.read<PetDetailsBloc>().add(const ToggleFavoriteEvent());
          },
        ),
      ),
    );
  }

  Widget _goBackButton() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 10,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.8),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            final bloc = context.read<PetDetailsBloc>();
            if (bloc.state is PetDetailsLoaded) {
              final isFavorite = (bloc.state as PetDetailsLoaded).isFavorite;
              Navigator.pop(context, isFavorite);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
