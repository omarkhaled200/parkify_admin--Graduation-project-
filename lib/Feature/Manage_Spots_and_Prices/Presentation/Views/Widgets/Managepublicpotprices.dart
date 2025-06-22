import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Add%20Price/add_price_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/ManagePublicSpotPricesbody.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo_impl.dart';

class Managepublicpotprices extends StatelessWidget {
  const Managepublicpotprices({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddPriceCubit(PublicspotHomeRepoImpl(ApiClass(Dio()))),
      child: ManagePublicSpotPricesbody(),
    );
  }
}
