import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/progress_indicator.dart';
import 'package:summit_admin_app/controller/workshop_controller.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/screens/workshop.dart';
import 'package:summit_admin_app/theme/pallete.dart';

class SearchWorkShopsDelegate extends SearchDelegate {
  final WidgetRef _ref;
  SearchWorkShopsDelegate({
    required WidgetRef ref,
  }) : _ref = ref;

  List<Workshop>? searchWorkshops(String query) {
    if (query.isNotEmpty) {
      return _ref.watch(getWorkShopsByNameProvider(query)).when(
            data: (workshops) => workshops,
            error: (error, stackTrace) => null,
            loading: () => [],
          );
    }
    return [];
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final workshops = searchWorkshops(query);
    if (workshops == null) {
      return const Center(
        child: Text("No results found"),
      );
    }
    return ListView.builder(
      itemCount: workshops.length,
      itemBuilder: (context, index) {
        final workshop = workshops[index];
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 40),
          title: Text(
            workshop.title,
            style: const TextStyle(
              color: Pallete.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WorkshopScreen(
                  workshop: workshop,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _ref.watch(getWorkShopsByNameProvider(query)).when(
          data: (workshops) => ListView.builder(
            itemCount: workshops.length,
            itemBuilder: (context, index) {
              final workshop = workshops[index];
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 40),
                title: Text(
                  workshop.title,
                  style: const TextStyle(
                    color: Pallete.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WorkshopScreen(
                        workshop: workshop,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          error: (error, stackTrace) {
            return const Text("error");
          },
          loading: () => const Loader(),
        );
  }
}
