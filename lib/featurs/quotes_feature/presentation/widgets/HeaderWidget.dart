
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../provider/MainScreenProvider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: bgGreyColor.withAlpha(235),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(12),
              iconSize: 26,
              onPressed: (){},
              icon: const Icon(Icons.menu, color: Colors.green),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: ((value) => model.cityName = value),
              onSubmitted: (_) => model.onSubmitSearch(),
              decoration: InputDecoration(
                filled: true,
                fillColor: bgGreyColor.withAlpha(235),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.green.withAlpha(135)),
                prefixIcon: IconButton(
                  icon:  Icon(Icons.search, color: Colors.green.shade900),
                  onPressed: model.onSubmitSearch,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: bgGreyColor.withAlpha(235),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(12),
              iconSize: 26,
              onPressed: model.onSubmitLocate,
              icon: const Icon(Icons.location_on_outlined, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
