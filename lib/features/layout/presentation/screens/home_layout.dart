import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:climatify/features/chat/presentation/components/controller/chat_bloc/chat_bloc.dart';
import 'package:climatify/features/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:climatify/features/home/presentation/controller/home_bloc/home_event.dart';
import 'package:climatify/features/layout/presentation/components/bottom_nav_bar_component.dart';
import 'package:climatify/features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import 'package:climatify/features/notifications/presentation/controller/notifications_bloc/notifications_bloc.dart';
import 'package:climatify/features/profile/presentation/controller/profile_bloc/profile_bloc.dart';
import 'package:climatify/features/search/presentation/controller/search_bloc/search_bloc.dart';
import 'package:climatify/features/settings/presentation/controller/settings_bloc/settings_bloc.dart';
import 'package:climatify/features/stories/presentation/controller/stories_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;
import 'package:vs_story_designer/vs_story_designer.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/styles/colors.dart';
import '../controller/layout_bloc/layout_state.dart';

class HomeLayout extends StatelessWidget {
   HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<LayoutBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<HomeBloc>()..add(GetUserDataEvent()),
        ),
        BlocProvider(
          create: (context) => sl<StoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ChatBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<NotificationsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ProfileBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SettingsBloc>(),
        ),
      ],
      child: BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, state) {
          if (kDebugMode) {
          //  log('________________ Layout SCREEN STATE __________________$state');
          }
          final LayoutBloc layoutBloc = context.read<LayoutBloc>();

          return Scaffold(
              body: layoutBloc.screens[layoutBloc.state.screenIndex],
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.dockedButtonShadow.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  onPressed: () async{
                    String? mediaPath = await _prepareImage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VSStoryDesigner(
                          centerText: "Start Creating Your Story",
                          middleBottomWidget: const SizedBox(),
                          galleryThumbnailQuality: 250,
                          onDone: (uri) {
                            debugPrint(uri);
                            // Share.shareXFiles([XFile(uri)]);
                          },
                          mediaPath: mediaPath,
                        ),
                      ),
                    );},
                  backgroundColor: AppColor.dockedButton,
                  shape: const CircleBorder(),
                  elevation: 0.0,
                  splashColor: AppColor.primary.withOpacity(0.2),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: const BottomNavBarBuilder());
        },
      ),
    );
  }
  final GlobalKey _globalKey = GlobalKey();
  Future<String?> _prepareImage() async {
    ByteData? byteData;
    try {
      RenderRepaintBoundary? boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;
      ui.Image? image = await boundary?.toImage(pixelRatio: 4);
      byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
      Uint8List bytes = byteData!.buffer.asUint8List();
      final directory = (await getTemporaryDirectory()).path;
      String imgPath = '$directory/${Random().nextInt(999999)}.jpg';
      File imgFile = File(imgPath);
      await imgFile.writeAsBytes(bytes);
      return imgFile.path;
    } catch (e) {
      return null;
    }
  }
}
