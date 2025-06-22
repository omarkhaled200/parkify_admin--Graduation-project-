import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Get_all_Gift/get_all_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/Widgets/Pointviewbody.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo_impl.dart';

class Pointview extends StatelessWidget {
  const Pointview({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllGiftCubit(GiftHomeRepoImpl(ApiClass(Dio())))
        ..getAllGift(token: token),
      child: Pointviewbody(
        token: token,
      ),
    );
  }
}
