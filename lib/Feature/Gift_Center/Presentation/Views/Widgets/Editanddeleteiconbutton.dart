import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/App_Router.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Delete%20Gift/delete_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Get_all_Gift/get_all_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo_impl.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/gift/gift_model.dart';

class Editanddeleteiconbutton extends StatelessWidget {
  const Editanddeleteiconbutton({
    super.key,
    required this.width,
    required this.gift,
    required this.token,
  });

  final double width;
  final Gift gift;
  final String token;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () async {
            final updated = await GoRouter.of(context).push(
              AppRouter.editgift,
              extra: {
                'gift': gift,
                'token': token,
              },
            );
            if (updated == true) {
              context.read<GetAllGiftCubit>().getAllGift(token: token);
            }
          },
          icon: const Icon(
            FontAwesomeIcons.solidPenToSquare,
            color: Colors.black,
            size: 24,
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        BlocProvider(
          create: (context) =>
              DeleteGiftCubit(GiftHomeRepoImpl(ApiClass(Dio()))),
          child: BlocListener<DeleteGiftCubit, DeleteGiftState>(
            listener: (context, state) {
              if (state is DeleteGiftFailure) {
                CustomScaffoldMessenger(
                    context,
                    "Error is : ${state.errmessage}",
                    FontAwesomeIcons.circleXmark);
              } else if (state is DeleteGiftSuccess) {
                CustomScaffoldMessenger(
                    context, 'Success', Icons.check_circle_outline);
                context.read<GetAllGiftCubit>().getAllGift(token: token);
              }
            },
            child: BlocBuilder<DeleteGiftCubit, DeleteGiftState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    print('the id of plate is ${gift.id}');
                    context
                        .read<DeleteGiftCubit>()
                        .deletegift(id: gift.id.toString(), token: token);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.solidTrashCan,
                    color: Color.fromARGB(255, 168, 0, 0),
                    size: 24,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
