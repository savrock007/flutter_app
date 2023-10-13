import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(MovieSearchRoute());
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Перейти к поиску'),
                Icon(Icons.arrow_forward_ios, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(SavedMoviesRoute());
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Перейти в мою коллекцию'),
                Icon(Icons.arrow_forward_ios, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
