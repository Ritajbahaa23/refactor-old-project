import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/styles/colors.dart';
import '../controller/layout_bloc/layout_bloc.dart';
import '../controller/layout_bloc/layout_event.dart';
import '../controller/layout_bloc/layout_state.dart';

class BottomNavBarBuilder extends StatelessWidget {
  const BottomNavBarBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final LayoutBloc layoutBloc = context.read<LayoutBloc>();
        return Container(
          height: 60,
          decoration: BoxDecoration(color: AppColor.white, boxShadow: [
            BoxShadow(
              color: AppColor.primary.withOpacity(0.4).withOpacity(0.12),
              blurRadius: 15.0,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  layoutBloc.add(const ScreenIndexChangeEvent(0));
                },
                icon: layoutBloc.state.screenIndex == 0
                    ? const FaIcon(
                        FontAwesomeIcons.house,
                        color: AppColor.primary,
                      )
                    : FaIcon(
                        FontAwesomeIcons.house,
                        color: AppColor.primary.withOpacity(0.4),
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  layoutBloc.add(const ScreenIndexChangeEvent(1));
                },
                icon: layoutBloc.state.screenIndex == 1
                    ? const FaIcon(
                        FontAwesomeIcons.search,
                        color: AppColor.primary,
                      )
                    : FaIcon(
                        FontAwesomeIcons.search,
                        color: AppColor.primary.withOpacity(0.4),
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  layoutBloc.add(const ScreenIndexChangeEvent(2));
                },
                icon: layoutBloc.state.screenIndex == 2
                    ? const FaIcon(
                        FontAwesomeIcons.message,
                        color: AppColor.primary,
                      )
                    : FaIcon(
                        FontAwesomeIcons.message,
                        color: AppColor.primary.withOpacity(0.4),
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  layoutBloc.add(const ScreenIndexChangeEvent(3));
                },
                icon: layoutBloc.state.screenIndex == 3
                    ? const FaIcon(
                        FontAwesomeIcons.user,
                        color: AppColor.primary,
                      )
                    : FaIcon(
                        FontAwesomeIcons.user,
                        color: AppColor.primary.withOpacity(0.4),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
