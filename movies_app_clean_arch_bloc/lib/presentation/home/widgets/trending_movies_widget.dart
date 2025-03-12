import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/assets/app_images.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/trendings_cubit.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/trendings_state.dart';

class TrendingMoviesWidget extends StatelessWidget {
  const TrendingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingsCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingsMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrendingsMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink:
                  state.movies
                      .map(
                        (item) =>
                            AppImages.movieImageBasePath +
                            item.posterPath.toString(),
                      )
                      .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is FailureLoadTrendingsMovies) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
