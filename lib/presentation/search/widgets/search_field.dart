import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/search/bloc/search_cubit.dart';
import 'package:spotify_clone/presentation/search/bloc/selected_option_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        context.read<SearchCubit>().search(
          value,
          context.read<SelectableOptionCubit>().state,
        );
      },
      decoration: InputDecoration(
        hintText: "Search...",
        fillColor: Colors.grey.shade200,
        filled: true,
        border: InputBorder.none,
      ),
    );
  }
}
