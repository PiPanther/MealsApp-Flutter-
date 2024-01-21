import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String text) onSelectScreen;
  const MainDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black26, Colors.black87],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Row(
                children: [
                  const Icon(Icons.fastfood),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cooking Up',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              onSelectScreen('meals');
            },
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: const Icon(
              Icons.filter_list_alt,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
