import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTab ;
  const RoundButton({Key?key,
    required this.title,
    required  this.onTab
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap : onTab,
      child:Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(title,style: TextStyle(color: Colors.white),),),
    )
    );
  }
}
