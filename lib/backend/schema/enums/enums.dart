import 'package:collection/collection.dart';

enum UsersRolsEnum {
  user,
  professional,
}

enum Roles {
  user,
  profesional,
  business,
}

enum Plan {
  basic,
  standar,
  premiun,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UsersRolsEnum):
      return UsersRolsEnum.values.deserialize(value) as T?;
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (Plan):
      return Plan.values.deserialize(value) as T?;
    default:
      return null;
  }
}
