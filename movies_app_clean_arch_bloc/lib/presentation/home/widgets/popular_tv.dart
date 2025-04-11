import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/common/widgets/tv/tv_card.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/popular_tv_state.dart';

class PopularTvWidget extends StatelessWidget {
  const PopularTvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PopularTvCubit()..getPopularTv();
      },
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PopularTvLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TvCard(tvEntity: state.tv[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.tv.length,
              ),
            );
          }
          if (state is FailureLoadPopularTv) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
