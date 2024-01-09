import 'package:flutter/material.dart';
import 'package:flutter_todo_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey(debugLabel: 'shell');

class GoRouterProvider {
  GoRouter goRouter() {
    return GoRouter(
      navigatorKey: _navigatorKey,
      initialLocation: '/',
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return DashboardPage(key: state.pageKey);
          },
          routes: [],
        ),
      ],
    );
  }
} 
