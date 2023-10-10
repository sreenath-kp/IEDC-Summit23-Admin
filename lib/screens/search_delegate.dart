import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/progress_indicator.dart';
import 'package:summit_admin_app/controller/workshop_controller.dart';
import 'package:summit_admin_app/screens/workshop_scanner.dart';

class SearchWorkShopsDelegate extends SearchDelegate {
  final WidgetRef _ref;
  SearchWorkShopsDelegate({
    required WidgetRef ref,
  }) : _ref = ref;

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
    return const Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _ref.watch(getWorkShopsByNameProvider(query)).when(
          data: (workshops) => ListView.builder(
            itemBuilder: (context, index) {
              final workshop = workshops[index];
              return ListTile(
                  title: Text(workshop.title),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            WorkshopScannerScreen(wsName: workshop.title),
                      ),
                    );
                  });
            },
            itemCount: workshops.length,
          ),
          error: (error, stackTrace) {
            return const Text("error");
          },
          loading: () => const Loader(),
        );
  }
}
