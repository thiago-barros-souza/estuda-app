import 'package:flutter/material.dart';

/// [Card] com o raio de borda padrão usado em todo o app.
/// Centralizado aqui (em vez de em ThemeData.cardTheme) para não depender de
/// classes de tema que mudam de nome entre versões do Flutter.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: EdgeInsets.zero,
      child: Padding(padding: padding, child: child),
    );
  }
}
