import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget nextPage;
  final String buttonText;
  final Color fgColor;
  final Color fgColorPressed;
  final Color bgColor;
  final Color bgColorPressed;


  const MyButton({
    super.key,
    required this.nextPage, 
    required this.buttonText,
    required this.fgColor,
    required this.fgColorPressed,
    required this.bgColor,
    required this.bgColorPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: const Alignment(0,0.85),
          child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            },
            style: ButtonStyle(
              foregroundColor: getColor(fgColor, fgColorPressed),
              backgroundColor: getColor(bgColor, bgColorPressed),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ))
              ),
            child: Text(buttonText, style:  const TextStyle(fontSize: 17),)
            )
            ),
          );
  }

    // Get color method
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      }
      else
      {
        return color;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }
}