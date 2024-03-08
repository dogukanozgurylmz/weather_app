import 'package:flutter/material.dart';
import 'package:weather_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.read,
  });

  final HomeViewModel read;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: read.searchController,
            decoration: InputDecoration(
              hintText: "Şehir ara",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.blue.shade100,
              filled: true,
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) => const PopScope(
                canPop: false,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
            await read.search();
            Navigation.ofPop();
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
