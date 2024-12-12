class UserModel {
  final String? name;
  final String? password;
  final String? position;
  final int? year;
  final String? department;
  final String? bloodGroup;
  final String? nssJoinYear;
  final DateTime? dob;
  final int? activityHours;

  const UserModel({
    this.name,
    this.password,
    this.position,
    this.year,
    this.department,
    this.bloodGroup,
    this.nssJoinYear,
    this.dob,
    this.activityHours,
  });

  UserModel.fromMap(Map<String, dynamic> data)
      : name = data['name'] as String?,
        password = data['password'] as String?,
        position = data['position'] as String?,
        year = data['year'] as int?,
        department = data['department'] as String?,
        bloodGroup = data['bloodGroup'] as String?,
        nssJoinYear = data['nssJoinYear'] as String?,
        activityHours = data['activityHours'] as int?,
        dob = data['dob'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                data['dob'].millisecondsSinceEpoch)
            : null;

  Map<String, dynamic> toMap() => {
        'name': name,
        'password': password,
        'position': position,
        'year': year,
        'department': department,
        'bloodGroup': bloodGroup,
        'nssJoinYear': nssJoinYear,
        'dob': dob?.millisecondsSinceEpoch,
        'activityHours': activityHours,
      };

  // Helper method for safer password comparison (avoid logging passwords)
  bool passwordMatches(String attemptedPassword) =>
      password == attemptedPassword;
}
