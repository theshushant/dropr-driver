import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class SectionTile extends StatefulWidget {
  const SectionTile({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final String title;
  final Widget body;

  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: ColorValues.textFieldFillColor,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: customTextSize),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_down : Icons.arrow_forward_ios,
                  size: isOpen ? 28 : 18,
                ),
              ],
            ),
            _body,
          ],
        ),
      ),
    );
  }

  Widget get _body {
    if (!isOpen) {
      return SizedBox();
    }
    return widget.body;
  }
}
