import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/search/bloc/search_cubit.dart';
import 'package:spotify_clone/presentation/search/bloc/selected_option_cubit.dart';
import 'package:spotify_clone/presentation/search/widgets/search_content.dart';
import 'package:spotify_clone/presentation/search/widgets/search_field.dart';
import 'package:spotify_clone/presentation/search/widgets/search_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 10),
              SearchField(),
              SizedBox(height: 10),
              SearchOptions(),
              SizedBox(height: 10),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
