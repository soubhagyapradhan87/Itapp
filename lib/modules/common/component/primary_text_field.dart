import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.style,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.onTap,
    this.prefix,
    this.suffix,
    this.border,
    this.contentPadding,
    this.onChanged,
    this.minLines,
    this.maxLines = 1,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.autofillHints,
    this.obscureText = false,
    this.errorMaxLines = 100,
    this.autocorrect = false,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final TextStyle? style;
  final bool enabled;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final int? minLines;
  final int? maxLines;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String?>? validator;
  final FormFieldSetter<String?>? onSaved;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final bool autocorrect;
  final int errorMaxLines;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
    super.initState();
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enabled,
      child: TextFormField(
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        controller: widget.controller,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        focusNode: _focusNode,
        // cursorColor: context.theme.primaryTitleColor,
        // style: context.primaryTextFieldText,
        autocorrect: widget.autocorrect,
        decoration: InputDecoration(
          isDense: true,
          labelText: widget.label,
          hintText: widget.hint,
          border: widget.border,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          errorText: _focusNode.hasFocus ? null : widget.errorText,
          contentPadding: widget.contentPadding ?? const EdgeInsets.only(bottom: 10),
          errorMaxLines: widget.errorMaxLines,
          // labelStyle: context.primaryTextFieldLabel,
          // hintStyle: context.primaryTextFieldHint,
        ),
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        onSaved: widget.onSaved,
        autofillHints: widget.autofillHints,
        obscureText: widget.obscureText,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }
}
