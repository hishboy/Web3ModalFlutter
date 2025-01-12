import 'package:flutter/material.dart';
import 'package:web3modal_flutter/widgets/web3modal_theme.dart';

class Web3ModalSearchBar extends StatelessWidget {
  const Web3ModalSearchBar({
    super.key,
    required this.hintText,
    required this.onSearch,
  });

  final String hintText;
  final void Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    final Web3ModalTheme theme = Web3ModalTheme.of(context);

    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: theme.data.overlay005,
        borderRadius: BorderRadius.circular(
          theme.data.radiusXS,
        ),
        border: Border.all(
          color: theme.data.overlay005,
          width: 2,
        ),
      ),
      child: TextFormField(
        onChanged: onSearch,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: theme.data.foreground275,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: theme.data.foreground275,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.data.foreground275,
          ),
          border: InputBorder.none,
          isCollapsed: true,
          // contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        ),
      ),
    );
  }
}
