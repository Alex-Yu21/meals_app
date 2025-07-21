import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          FilterTile(
            filter: Filter.glutenFree,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
          ),
          FilterTile(
            filter: Filter.lactoseFree,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
          ),
          FilterTile(
            filter: Filter.vegetarian,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
          ),
          FilterTile(
            filter: Filter.vegan,
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
          ),
        ],
      ),
    );
  }
}

class FilterTile extends ConsumerWidget {
  final Filter filter;
  final String title;
  final String subtitle;
  const FilterTile({
    super.key,
    required this.filter,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return SwitchListTile(
      value: activeFilters[filter]!,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
