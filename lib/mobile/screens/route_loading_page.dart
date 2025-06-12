import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouteLoadingPage extends StatefulWidget {
  final Widget? child;
  final ActiveGuardObserver? activeGuardObserver;

  const RouteLoadingPage({
    super.key,
    this.child,
    this.activeGuardObserver,
  });

  @override
  State<RouteLoadingPage> createState() => _RouteLoadingPageState();
}

class _RouteLoadingPageState extends State<RouteLoadingPage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    widget.activeGuardObserver?.addListener(_onActiveGuardChanged);
  }

  @override
  void dispose() {
    widget.activeGuardObserver?.removeListener(_onActiveGuardChanged);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(child: widget.child ?? const SizedBox()),
          if (_loading)
            Scaffold(
              body: SafeArea(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      );

  void _onActiveGuardChanged() => setState(() => _loading = widget.activeGuardObserver?.guardInProgress == true);
}
