import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';
import 'package:technical_test_dna/app/helper/constants.dart';
import 'package:technical_test_dna/app/widget/widget.dart';

class TextF extends StatefulWidget {
  const TextF({
    super.key,
    required this.icon,
    this.curFocusNode,
    this.nextFocusNode,
    this.hint,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.textAlign,
    this.enable,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    this.prefixIcon,
    this.isHintVisible = true,
    this.prefixText,
    this.hintText,
    this.autofillHints,
    this.semantic,
    this.onSubmit,
    this.hintColor,
    this.autoValidate,
    this.errorSize = 12,
    this.isRequired,
  });

  final HeroIcons icon;
  final FocusNode? curFocusNode;
  final FocusNode? nextFocusNode;
  final String? hint;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final Function? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool? enable;
  final List<TextInputFormatter>? inputFormatter;
  final bool isHintVisible;
  final String? prefixText;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final String? semantic;
  final Function(String?)? onSubmit;
  final Color? hintColor;
  final Widget? prefixIcon;
  final AutovalidateMode? autoValidate;
  final double errorSize;
  final bool? isRequired;

  @override
  _TextFState createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.isHintVisible,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: widget.hint ?? '',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.hintColor ?? const Color(0xff16191C),
                ),
                if (widget.isRequired != null) ...[
                  if (widget.isRequired == true) ...[
                    TextWidget(
                      text: '*',
                      color: Colors.red,
                    )
                  ] else ...[
                    TextWidget(
                      text: ' (tidak wajib diisi)',
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ],
                ]
              ],
            ),
          ),
          const SizedBox(height: 8),
          Semantics(
            label: widget.semantic,
            child: TextFormField(
              key: widget.key,
              autovalidateMode:
                  widget.autoValidate ?? AutovalidateMode.onUserInteraction,
              autofillHints: widget.autofillHints,
              enabled: widget.enable,
              obscureText: widget.obscureText ?? false,
              focusNode: widget.curFocusNode,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              textAlign: widget.textAlign ?? TextAlign.start,
              minLines: widget.minLine ?? 1,
              maxLines: widget.maxLine ?? 1,
              inputFormatters: widget.inputFormatter,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: 12,
                color: Constants.get.primaryColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              cursorColor: const Color(0xff333333),
              decoration: InputDecoration(
                prefixIcon: HeroIcon(
                  widget.icon,
                  size: 16,
                  color: currentVal.isNotEmpty
                      ? Constants.get.primaryColor
                      : Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1,
                    color: currentVal.isNotEmpty
                        ? Constants.get.primaryColor
                        : Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1,
                    color: currentVal.isNotEmpty
                        ? Constants.get.primaryColor
                        : Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1,
                    color: currentVal.isNotEmpty
                        ? Constants.get.primaryColor
                        : Colors.grey,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1,
                    color: currentVal.isNotEmpty
                        ? Constants.get.primaryColor
                        : Colors.grey,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1,
                    color: currentVal.isNotEmpty
                        ? Constants.get.primaryColor
                        : Colors.grey,
                  ),
                ),
                errorStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: widget.errorSize,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                ),
                fillColor: Colors.white,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff9BA6AF),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: widget.validator as String? Function(String?)?,
              onChanged: (String value) {
                setState(() {
                  currentVal = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void onSubmitDefault(String? value) {
    setState(() {
      fieldFocusChange(
        context,
        widget.curFocusNode ?? FocusNode(),
        widget.nextFocusNode,
      );
    });
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
