import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart' as react;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/styles/colors.dart';
import '../../domain/entities/posts_entity.dart';

class PostCard extends StatefulWidget {
  final Datum datum;

  const PostCard({
    super.key,
    required this.datum,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
          color: AppColor.dockedButton,
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.shutterstock.com/shutterstock/photos/2042393249/display_1500/stock-photo-abstract-icon-representing-the-ecological-call-to-recycle-and-reuse-in-the-form-of-a-pond-with-a-2042393249.jpg'),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'climate change activist',
                        style: GoogleFonts.openSans().copyWith(
                          color: AppColor.textTitle,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '@CCA',
                        style: GoogleFonts.openSans().copyWith(
                          color: AppColor.textSubTitle,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(child: SvgPicture.asset("assets/icons/Menu.svg"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 11.0,
                  top: 5.0,
                  bottom: 10.0,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fringilla natoque id aenean.',
                  style: GoogleFonts.openSans().copyWith(
                    color: AppColor.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 222.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.shutterstock.com/shutterstock/photos/2042393249/display_1500/stock-photo-abstract-icon-representing-the-ecological-call-to-recycle-and-reuse-in-the-form-of-a-pond-with-a-2042393249.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  react.ReactionButton(
                                    onReactionChanged:
                                        (react.Reaction<String>? reaction) {
                                      debugPrint(
                                          'Selected value: ${reaction?.value}');
                                    },
                                    reactions: <react.Reaction<String>>[
                                      react.Reaction<String>(
                                        value: 'like',
                                        icon: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '🍀',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 25.0,
                                                ),
                                              ),
                                              Text(
                                                'Like',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      react.Reaction<String>(
                                        value: 'love',
                                        icon: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '🍃',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 25.0,
                                                ),
                                              ),
                                              Text(
                                                'Love',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      react.Reaction<String>(
                                        value: 'sad',
                                        icon: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '🍂',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 25.0,
                                                ),
                                              ),
                                              Text(
                                                'Sad',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      react.Reaction<String>(
                                        value: 'wow',
                                        icon: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '🍁',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 25.0,
                                                ),
                                              ),
                                              Text(
                                                'Wow',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      react.Reaction<String>(
                                        value: 'care',
                                        icon: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '🌿',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                              Text(
                                                'Care',
                                                style: GoogleFonts.workSans()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                    placeholder: const react.Reaction<String>(
                                      value: null,
                                      icon: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.leaf,
                                          color: AppColor.white,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    itemSize: const Size(50.0, 50.0),
                                    isChecked: false,
                                    toggle: true,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    '122',
                                    style: GoogleFonts.poppins().copyWith(
                                      color: AppColor.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.solidCommentDots,
                                      color: AppColor.white,
                                      size: 20.0,
                                    ),
                                  ),
                                  Text(
                                    '10',
                                    style: GoogleFonts.poppins().copyWith(
                                      color: AppColor.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Transform.rotate(
                                      angle: -75.0,
                                      child: const FaIcon(
                                        FontAwesomeIcons.paperPlane,
                                        color: AppColor.white,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                'Just now',
                                style: GoogleFonts.openSans().copyWith(
                                  color: AppColor.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
