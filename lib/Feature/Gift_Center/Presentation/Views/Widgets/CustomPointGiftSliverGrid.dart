import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Get_all_Gift/get_all_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/Widgets/ItemPointGift.dart';

class CustomPointGiftSliverList extends StatelessWidget {
  const CustomPointGiftSliverList({
    super.key,
    required this.token,
  });
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllGiftCubit, GetAllGiftState>(
      builder: (context, state) {
        if (state is GetAllGiftSuccess) {
          return SliverList.builder(
              itemCount: state.gift.length,
              itemBuilder: (context, index) {
                return ItemPointGift(
                  token: token,
                  gift: state.gift[index],
                );
              });
        } else if (state is GetAllGiftFailure) {
          return SliverToBoxAdapter(
            child: Text('Error: ${state.errmessage}'),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: SpinKitFadingCircle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}
