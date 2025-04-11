import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app_clean_arch_bloc/common/widgets/appbar/basic_app_bar.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/assets/app_vectors.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/widgets/category_text_widget.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/widgets/now_playing_movies_widget.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/widgets/popular_tv.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/widgets/trending_movies_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo, fit: BoxFit.fitWidth),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryTextWidget(title: 'Trendings 🔥'),
              TrendingMoviesWidget(),
              SizedBox(height: 16),
              CategoryTextWidget(title: 'Now Playing'),
              SizedBox(height: 16),
              NowPlayingMoviesWidget(),
              SizedBox(height: 16),
              CategoryTextWidget(title: 'Popular TV'),
              SizedBox(height: 16),
              PopularTvWidget(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
