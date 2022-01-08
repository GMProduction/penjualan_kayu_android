import 'package:toast/toast.dart';

void toastShow(text, context, color, {duration = 5, isKeyboardVisible = false}){


  Toast.show(text, context,
      duration: duration,
      gravity: isKeyboardVisible ? Toast.CENTER : Toast.BOTTOM,
      backgroundColor: color);
}