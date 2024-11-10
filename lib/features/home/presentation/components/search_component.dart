import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(top: .042),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.withOpacity(.5),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/search.svg',
                    width: 20, height: 20),
                const SizedBox(
                  width: 15,
                ),
                Text("Search here...",
                    style:
                    TextStyle(color: Colors.grey, fontFamily: "Readex Pro")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}