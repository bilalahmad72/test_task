import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/values/values.dart';

class OtpInputBox extends StatefulWidget {
  final int index;
  final Function(String) onChanged;
  final Function() onCompleted;
  final TextEditingController controller;
  final FocusNode focusNode;

  const OtpInputBox({
    super.key,
    required this.index,
    required this.onChanged,
    required this.onCompleted,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<OtpInputBox> createState() => _OtpInputBoxState();
}

class _OtpInputBoxState extends State<OtpInputBox> with AppContextMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 40,
      margin: EdgeInsets.only(right: c.sizes.spacing6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(c.sizes.radius12),
        color: AppColors.neutral50,
        border: Border.all(color: AppColors.transparent),
      ),
      child: Center(
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          cursorHeight: 24,
          cursorWidth: 2,
          cursorColor: AppColors.neutral800,
          style: TextStyle(fontSize: c.sizes.fontSize24, color: AppColors.textActiveTertiary, fontWeight: FontWeight.bold),
          decoration: InputDecoration(counterText: '', border: InputBorder.none, contentPadding: EdgeInsets.zero),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(1)],
          onChanged: (value) {
            widget.onChanged(value);
            if (value.isNotEmpty) {
              if (widget.index < 5) {
                FocusScope.of(context).nextFocus();
              } else {
                widget.focusNode.unfocus();
                widget.onCompleted();
              }
            } else {
              if (widget.index > 0) {
                FocusScope.of(context).previousFocus();
              }
            }
          },
          onTapOutside: (val) {
            FocusScope.of(context).unfocus();
          },
          onTap: () {
            widget.controller.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
          },
        ),
      ),
    );
  }
}
