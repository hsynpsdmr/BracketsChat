import 'package:flutter/material.dart';
import '../../extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String title;
  final String? type;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  const LocaleText({Key? key, required this.title, this.type, this.style, this.textAlign, this.overflow, this.maxLines}) : super(key: key);

  String textDesigner() {
    return type == 'upper'
        ? title.localeUpper
        : type == 'lower'
            ? title.localeLower
            : title.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Text(textDesigner(), style: style, textAlign: textAlign, overflow: overflow, maxLines: maxLines);
  }
}

class MultilineLocaleText extends StatelessWidget {
  final String title;
  final String? type;
  final TextStyle? style;
  final TextAlign? textAlign;
  const MultilineLocaleText({Key? key, required this.title, this.type, this.style, this.textAlign}) : super(key: key);

  String textDesigner() {
    return type == 'upper'
        ? title.localeUpper
        : type == 'lower'
            ? title.localeLower
            : title.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Text(textDesigner().replaceAll(' ', '\n'), style: style, textAlign: textAlign);
  }
}
