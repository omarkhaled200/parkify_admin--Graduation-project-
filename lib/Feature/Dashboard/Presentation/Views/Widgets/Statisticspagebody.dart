import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/Function/custom_lunch_url.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/View_Model/Get%20Data/get_data_cubit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/View_Model/Get%20Monthly%20Profit/get_monthly_profit_cubit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/View_Model/Get%20Popular%20Gift/get_popular_gift_cubit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/View_Model/Get%20Popular%20Public%20Spot/get_popular_public_spot_cubit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/View_Model/Get%20Popular%20Reservable%20Spot/get_popular_reservable_spot_cubit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/View_Model/Get%20User%20Account%20Status/get_user_account_status_cubit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/View_Model/Get%20all%20location%20report/get_all_location_report_cubit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/Dashboardandselectlocation.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/MonthlyProfit.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/MostpopularGifts.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/Mostusedpublicspots.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/Mostusedreservablespots.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/StatItem.dart';

import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/Useraccountsstatus.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/customCardDetialsStatistics.dart';

import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepoImpl.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Get%20all%20locations/get_all_locations_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/location_model/location_model.dart';

class Statisticspagebody extends StatefulWidget {
  const Statisticspagebody({super.key, required this.token});
  final String token;
  @override
  State<Statisticspagebody> createState() => _StatisticspagebodyState();
}

class _StatisticspagebodyState extends State<Statisticspagebody> {
  String? selectedLocation;
  int? selectedId;
  late final GetDataCubit getDataCubit;
  late final GetPopularPublicSpotCubit getPopularPublicSpotCubit;
  late final GetPopularReservableSpotCubit getPopularReservableSpotCubit;
  late final GetUserAccountStatusCubit getuseraccountstatus;
  late final GetMonthlyProfitCubit getMonthlyProfit;
  late final GetPopularGiftCubit getPopularGift;
  late final GetAllLocationReportCubit getAllLocationReport;

  @override
  void initState() {
    super.initState();
    getDataCubit = GetDataCubit(Dashboardhomerepoimpl(ApiClass(Dio())));
    getPopularPublicSpotCubit =
        GetPopularPublicSpotCubit(Dashboardhomerepoimpl(ApiClass(Dio())));
    getPopularReservableSpotCubit =
        GetPopularReservableSpotCubit(Dashboardhomerepoimpl(ApiClass(Dio())));
    getuseraccountstatus =
        GetUserAccountStatusCubit(Dashboardhomerepoimpl(ApiClass(Dio())));
    getMonthlyProfit =
        GetMonthlyProfitCubit(Dashboardhomerepoimpl(ApiClass(Dio())));
    getPopularGift =
        GetPopularGiftCubit(Dashboardhomerepoimpl(ApiClass(Dio())));
    getAllLocationReport =
        GetAllLocationReportCubit(Dashboardhomerepoimpl(ApiClass(Dio())));
  }

  @override
  void dispose() {
    getDataCubit.close();
    getPopularPublicSpotCubit.close();
    getPopularReservableSpotCubit.close();
    getuseraccountstatus.close();
    getMonthlyProfit.close();
    getPopularGift.close();
    getAllLocationReport.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BlocBuilder<GetAllLocationsCubit, GetAllLocationsState>(
                    builder: (context, state) {
                      if (state is GetAllLocationsSuccess) {
                        List<LocationModel> locationModels = [
                          LocationModel(id: 0, name: 'All Locations'),
                          ...state.location,
                        ];

                        selectedLocation ??= locationModels.first.name;

                        int? localSelectedId = locationModels
                            .firstWhere(
                              (loc) => loc.name == selectedLocation,
                              orElse: () =>
                                  LocationModel(id: 0, name: 'All Locations'),
                            )
                            .id;

                        selectedId = localSelectedId;

                        return Dashboardandselectlocation(
                          width: width,
                          loc: locationModels
                              .map((e) => e.name)
                              .whereType<String>()
                              .toList(),
                          selectedplate: selectedLocation!,
                          onChanged: (newValue) {
                            setState(() {
                              selectedLocation = newValue;
                              // إعادة تعيين selectedId عند تغيير الموقع
                              selectedId = locationModels
                                  .firstWhere(
                                    (loc) => loc.name == newValue,
                                    orElse: () => const LocationModel(
                                        id: 0, name: 'All Locations'),
                                  )
                                  .id;
                            });
                          },
                        );
                      } else if (state is GetAllLocationsFailure) {
                        CustomScaffoldMessenger(
                            context,
                            "Error is : ${state.errmessage}",
                            FontAwesomeIcons.circleXmark);
                        return const SizedBox.shrink();
                      } else {
                        return const SpinKitFadingCircle(color: Colors.black);
                      }
                    },
                  ),
                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
            if (selectedId != null)
              BlocProvider.value(
                value: getDataCubit
                  ..GetData(token: widget.token, id: selectedId!),
                child: BlocBuilder<GetDataCubit, GetDataState>(
                  builder: (context, state) {
                    if (state is GetDataSuccess) {
                      print('the list is ${state.list}');
                      return SliverList.builder(
                        itemCount: stats.length,
                        itemBuilder: (context, index) {
                          return customCardDetialsStatistics(
                            stat: stats[index],
                            value: state.list.length > index
                                ? state.list[index]
                                : '0',
                          );
                        },
                      );
                    } else if (state is GetDataFailure) {
                      print('selected id is $selectedId');
                      print('the error is ${state.errmessage}');
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Failed to load statistics',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: SpinKitFadingCircle(color: Colors.black),
                        ),
                      );
                    }
                  },
                ),
              ),
            if (selectedId == null)
              const SliverToBoxAdapter(
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                ),
              ),
            if (selectedId != null)
              BlocProvider.value(
                value: getPopularPublicSpotCubit
                  ..GetPopularPublicSpot(token: widget.token, id: selectedId!),
                child: BlocBuilder<GetPopularPublicSpotCubit,
                    GetPopularPublicSpotState>(
                  builder: (context, state) {
                    if (state is GetPopularPublicSpotSuccess) {
                      return SliverToBoxAdapter(
                        child: Mostusedpublicspots(
                          spot: state.public,
                        ),
                      );
                    } else if (state is GetPopularPublicSpotFailure) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Failed to load statistics',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: SpinKitFadingCircle(color: Colors.black),
                        ),
                      );
                    }
                  },
                ),
              ),
            if (selectedId == null)
              const SliverToBoxAdapter(
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                ),
              ),
            if (selectedId != null)
              BlocProvider.value(
                value: getPopularReservableSpotCubit
                  ..GetPopularReservableSpot(
                      token: widget.token, id: selectedId!),
                child: BlocBuilder<GetPopularReservableSpotCubit,
                    GetPopularReservableSpotState>(
                  builder: (context, state) {
                    if (state is GetPopularReservableSpotSuccess) {
                      return SliverToBoxAdapter(
                          child: Mostusedreservablespots(
                        reservablespot: state.reservable,
                      ));
                    } else if (state is GetPopularReservableSpotFailure) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Failed to load statistics',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: SpinKitFadingCircle(color: Colors.black),
                        ),
                      );
                    }
                  },
                ),
              ),
            if (selectedId == null)
              const SliverToBoxAdapter(
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                ),
              ),
//////////////////////////////////////////////////////////////////////////////////////////////!
            if (selectedId != null)
              BlocProvider.value(
                value: getMonthlyProfit
                  ..GetMonthlyProfit(token: widget.token, id: selectedId!),
                child:
                    BlocBuilder<GetMonthlyProfitCubit, GetMonthlyProfitState>(
                  builder: (context, state) {
                    if (state is GetMonthlyProfitSuccess) {
                      return SliverToBoxAdapter(
                          child: MonthlyProfit(
                        profit: state.profit,
                      ));
                    } else if (state is GetMonthlyProfitFailure) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Failed to load statistics',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: SpinKitFadingCircle(color: Colors.black),
                        ),
                      );
                    }
                  },
                ),
              ),
            if (selectedId == null)
              const SliverToBoxAdapter(
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                ),
              ),
//////////////////////////////////////////////////////////////////////////////////////////////!
            if (selectedId != null)
              BlocProvider.value(
                value: getuseraccountstatus
                  ..GetUserAccountStatus(token: widget.token),
                child: BlocBuilder<GetUserAccountStatusCubit,
                    GetUserAccountStatusState>(
                  builder: (context, state) {
                    if (state is GetUserAccountStatusSuccess) {
                      return SliverToBoxAdapter(
                          child: Useraccountsstatus(
                        status: state.status,
                      ));
                    } else if (state is GetUserAccountStatusFailure) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Failed to load statistics',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: SpinKitFadingCircle(color: Colors.black),
                        ),
                      );
                    }
                  },
                ),
              ),
            if (selectedId == null)
              const SliverToBoxAdapter(
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                ),
              ),
            ////////////////////////////////////////////////////////////////////////!
            if (selectedId != null)
              BlocProvider.value(
                value: getPopularGift..GetPopularGift(token: widget.token),
                child: BlocBuilder<GetPopularGiftCubit, GetPopularGiftState>(
                  builder: (context, state) {
                    if (state is GetPopularGiftSuccess) {
                      return SliverToBoxAdapter(
                          child: MostpopularGifts(
                        gift: state.gift,
                      ));
                    } else if (state is GetPopularGiftFailure) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Failed to load statistics',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: SpinKitFadingCircle(color: Colors.black),
                        ),
                      );
                    }
                  },
                ),
              ),
            if (selectedId == null)
              const SliverToBoxAdapter(
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                ),
              ),

            //////////////////////////////////////////////////////////////////////////////!
            if (selectedId != null)
              BlocProvider.value(
                value: getAllLocationReport,
                child: BlocConsumer<GetAllLocationReportCubit,
                    GetAllLocationReportState>(
                  listener: (context, state) {
                    if (state is GetAllLocationReportFailure) {
                      const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Failed to load statistics',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else if (state is GetAllLocationReportSuccess) {
                      CustomScaffoldMessenger(
                        context,
                        "Success",
                        FontAwesomeIcons.check,
                      );
                      customLaunchUrl(context, state.report);
                    }
                  },
                  builder: (context, state) {
                    return SliverToBoxAdapter(
                      child: CustomButton(
                        icon: const Icon(Icons.file_download_outlined,
                            color: Colors.white),
                        heaight: height,
                        width: width,
                        text: 'Generate Report',
                        backcolor: Colors.black,
                        onPressed: () {
                          context
                              .read<GetAllLocationReportCubit>()
                              .GetAllLocationReport(
                                  token: widget.token, id: selectedId!);
                        },
                      ),
                    );
                  },
                ),
              ),
            if (selectedId == null)
              const SliverToBoxAdapter(
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
