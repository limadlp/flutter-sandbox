import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/common/widgets/movie/movie_card.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/now_playing_cubit.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  const NowPlayingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getTrendingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NowPlayingMoviesLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.movies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.movies.length,
              ),
            );
          }
          if (state is FailureLoadNowPlayingMovies) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
