import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/search_bloc/search_bloc.dart';
import '../controller/search_bloc/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        ///TOdO:USE REFER
        // final SearchBloc searchBloc = context.read<SearchBloc>();
        return const Scaffold(
          body: Center(
            child: Text('Search'),
          ),
        );
      },
    );
  }
}
