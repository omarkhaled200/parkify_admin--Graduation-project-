import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/App_Router.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Get_all_Gift/get_all_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Get_point_view/get_point_view_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/Widgets/CustomPointGiftSliverGrid.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/Widgets/CustomPointViewdetialsCard.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo_impl.dart';

class Pointviewbody extends StatelessWidget {
  const Pointviewbody({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: BlocProvider(
                create: (context) =>
                    GetPointViewCubit(GiftHomeRepoImpl(ApiClass(Dio())))
                      ..getpointview(token: token),
                child: CustomPointViewdetialsCard(
                  heaight: heaight,
                  width: width,
                  token: token,
                ),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: heaight * 0.01,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  width: width,
                  heaight: heaight,
                  text: 'Add New Gift',
                  onPressed: () async {
                    final updated = await GoRouter.of(context)
                        .push(AppRouter.addgift, extra: token);
                    if (updated == true) {
                      context.read<GetAllGiftCubit>().getAllGift(token: token);
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: heaight * 0.01,
                ),
              ),
              CustomPointGiftSliverList(
                token: token,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
