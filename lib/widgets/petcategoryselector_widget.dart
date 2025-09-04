import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption/theme/color.dart';

class PetCategory {
  final String label;
  final String iconPath;

  PetCategory({required this.label, required this.iconPath});
}

class PetCategorySelectorWidget extends StatefulWidget {
  final List<PetCategory> categories;
  final ValueChanged<String>? onChanged;
  final String initialSelected;

  const PetCategorySelectorWidget({
    super.key,
    required this.categories,
    this.onChanged,
    this.initialSelected = '',
  });

  @override
  State<PetCategorySelectorWidget> createState() =>
      _PetCategorySelectorWidgetState();
}

class _PetCategorySelectorWidgetState extends State<PetCategorySelectorWidget> {
  late String selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.initialSelected.isNotEmpty
        ? widget.initialSelected
        : widget.categories.first.label;
  }

  void _select(String label) {
    setState(() {
      selectedType = label;
    });
    widget.onChanged?.call(label);
  }

  Widget _buildCategory(PetCategory category) {
    final bool isActive = selectedType == category.label;

    return GestureDetector(
      onTap: () => _select(category.label),
      child: Container(
        //padding: const EdgeInsets.all(5),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: isActive ? AppColor.actionColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              category.iconPath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              colorFilter: isActive
                  ? const ColorFilter.mode(
                      Colors.white, BlendMode.srcIn) // force white
                  : const ColorFilter.mode(
                      Colors.black, BlendMode.srcIn), // desaturated
            ),
            const SizedBox(height: 5),
            Text(
              category.label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.categories
          .map((category) => _buildCategory(category) )
          .toList(),
    ));
  }
}
