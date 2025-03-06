import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app_clean_arch_bloc/common/widgets/appbar/basic_app_bar.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/assets/app_vectors.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/widgets/trending_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo, fit: BoxFit.fitWidth),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [TrendingMoviesWidget()],
        ),
      ),
    );
  }
}
