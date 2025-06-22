import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Edit_Gift/edit_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/Widgets/Editgiftbody.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo_impl.dart';

class Editgift extends StatelessWidget {
  const Editgift({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditGiftCubit(GiftHomeRepoImpl(ApiClass(Dio()))),
      child: const Editgiftbody(),
    );
  }
}
