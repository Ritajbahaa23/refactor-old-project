import 'package:climatify/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class EditableEmailField extends StatefulWidget {
  @override
  _EditableEmailFieldState createState() => _EditableEmailFieldState();
}

class _EditableEmailFieldState extends State<EditableEmailField> {
  bool _isEditing = false;
  TextEditingController _controller=TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'johndoe@gmail.com');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEditing = !_isEditing;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: _isEditing
                  ? TextField(
                controller: _controller,
                autofocus: true,
                onSubmitted: (value) {
                  setState(() {
                    _isEditing = false;
                  });
                },
              )
                  : Text(_controller.text),
            ),
            SizedBox(width: 8.0),
            SvgPicture.asset('assets/icons/Edit.svg',width: 20,height: 20,),
            SizedBox(width: 4.0),
            Text(
              'Edit',
              style: TextStyle(color: AppColor.basicColor,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}