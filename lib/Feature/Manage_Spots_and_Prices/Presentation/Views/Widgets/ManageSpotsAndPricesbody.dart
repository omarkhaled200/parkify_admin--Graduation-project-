import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Get%20Public%20Spots/get_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Get%20Reservable%20Spots/get_reservable_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/CustomTabBar.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/PublicSpotPage.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/ReservableSpotPagebody.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo_impl.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo_impl.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/spot%20Details%20Repos/spot_details_repos_impl.dart';

class ManageSpotsAndPricesbody extends StatefulWidget {
  const ManageSpotsAndPricesbody({super.key, required this.token});
  final String token;
  @override
  State<ManageSpotsAndPricesbody> createState() =>
      _ManageSpotsAndPricesbodyState();
}

class _ManageSpotsAndPricesbodyState extends State<ManageSpotsAndPricesbody> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(height * 0.06),
              child: const CustomTabBar(
                text1: 'Reservable Spot',
                text2: 'Public Spot',
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => GetSpotDetialsCubit(
                            SpotDetailsReposImpl(ApiClass(Dio())))
                          ..getSpotDetials(token: widget.token),
                      ),
                      BlocProvider(
                        create: (context) => GetReservableSpotsCubit(
                            ReservablespotHomeRepoImpl(
                                apiClass: ApiClass(Dio())))
                          ..getReservablespot(token: widget.token),
                      ),
                    ],
                    child: ReservableSpotPagebody(
                      token: widget.token,
                    ),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => GetSpotDetialsCubit(
                            SpotDetailsReposImpl(ApiClass(Dio())))
                          ..getSpotDetials(token: widget.token),
                      ),
                      BlocProvider(
                        create: (context) => GetPublicSpotsCubit(
                            PublicspotHomeRepoImpl(ApiClass(Dio())))
                          ..getPublicSpot(token: widget.token),
                      ),
                    ],
                    child: Publicspotpage(
                      token: widget.token,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
