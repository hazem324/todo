import 'package:flutter/material.dart';
class ColorSelection extends StatelessWidget {
  final TextStyle latoStyle;
  final int selectedColorsIndex;
  final List<Color> colors;
  final Function(int) onSelectedColors;

  ColorSelection({
    Key? key,
    required this.selectedColorsIndex,
    required this.latoStyle,
    required this.colors,
    required this.onSelectedColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            Text(
              "Colors",
              style: latoStyle,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Wrap(


          children: List<Widget>.generate(
            colors.length,
            (int index) {
              final Color color = colors[index];
              return InkWell(
                onTap: () {
                  onSelectedColors(index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: color,
                    child: selectedColorsIndex == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
