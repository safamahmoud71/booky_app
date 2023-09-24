import 'package:booky_app/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsImages.logo,
            width: 80,
          ),
          InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouters.searchView);
              },
              child: Image.asset(
                AssetsIcons.searchIcon,
                width: 20,
              )),
        ],
      ),
    );
  }
}
