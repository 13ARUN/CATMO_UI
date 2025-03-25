import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catmo_ui/app/permissions.dart';

final userPermissionsProvider = Provider<Set<Permission>>((ref) {
  return {
    Permission.viewEvents,
    Permission.registerForEvents,
    Permission.viewPastAlerts,
    Permission.triggerAlarms,
    Permission.viewDocsImages,
    Permission.editProfile,
    Permission.downloadReportsOfPastAlerts,
  };
});
