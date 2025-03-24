import 'package:catmo_ui/app/permissions.dart';

class PermissionService {
  PermissionService(this._permissions);
  final Set<Permission> _permissions;

  bool has(Permission permission) => _permissions.contains(permission);

  bool get canViewDashboard => has(Permission.viewDashboard);
  bool get canEditProfile => has(Permission.editProfile);
  bool get canViewReports => has(Permission.viewReports);
}
