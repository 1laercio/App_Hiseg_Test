import 'package:app_hiseg_test/app/core/utils/style/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key,
      this.controller,
      required this.color,
      required this.title,
      required this.subtitle});

  final TextEditingController? controller;
  final Color? color;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 20, left: 20),
      child: TextFormField(
        controller: controller,
        //obscureText: !passwordVisibility,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyles.subtitle1(),
          hintText: subtitle,
          hintStyle: TextStyles.bodyText1(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          /*    suffixIcon: InkWell(
            onTap: () => setState(
              () => passwordVisibility = !passwordVisibility,
            ),
            focusNode: FocusNode(skipTraversal: true),
            child: Icon(
              passwordVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: const Color(0xFF95A1AC),
              size: 22,
            ),
          ), */
        ),
        style: TextStyles.bodyText1(),
      ),
    );
  }
}
