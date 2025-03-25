import 'package:catmo_ui/app/permissions.dart';

class PermissionHelper {
  static bool hasPermission(
    Set<Permission> userPermissions,
    Permission permission,
  ) {
    return userPermissions.contains(permission);
  }

  static bool hasAllPermissions(
    Set<Permission> userPermissions,
    List<Permission> requiredPermissions,
  ) {
    return requiredPermissions.every(userPermissions.contains);
  }

  static bool hasAnyPermission(
    Set<Permission> userPermissions,
    List<Permission> requiredPermissions,
  ) {
    return requiredPermissions.any(userPermissions.contains);
  }
}
