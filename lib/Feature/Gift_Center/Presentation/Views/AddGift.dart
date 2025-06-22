import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Add_New_Gift/add_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/Widgets/AddGiftbody.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo_impl.dart';

class AddGift extends StatelessWidget {
  const AddGift({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddGiftCubit(GiftHomeRepoImpl(ApiClass(Dio()))),
      child: const AddGiftbody(),
    );
  }
}
