import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/search/bloc/selected_option_cubit.dart';
import 'package:spotify_clone/presentation/search/widgets/selective_category.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectiveCategory(
              isSelected:
                  context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
              title: "Movie",
              onTap: () => context.read<SelectableOptionCubit>().selectMovie(),
            ),
            SizedBox(width: 5),
            SelectiveCategory(
              isSelected:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
              title: "Tv",
              onTap: () => context.read<SelectableOptionCubit>().selectTv(),
            ),
          ],
        );
      },
    );
  }
}
