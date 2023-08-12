part of '../../gofile.dart';

abstract class _GofileOption {
  String? name;
  String? value;
}

class GofilePublicOption extends _GofileOption {
  GofilePublicOption({required this.setting});

  @override
  String get name => 'public';

  final bool setting;

  @override
  String get value => setting.toString();
}

class GofilePasswordOption extends _GofileOption {
  GofilePasswordOption({required this.password});

  @override
  String get name => 'password';

  final String password;

  @override
  String get value => password;
}

class GofileDescriptionOption extends _GofileOption {
  GofileDescriptionOption({required this.description});

  @override
  String get name => 'description';

  final String description;

  @override
  String get value => description;
}

class GofileExpireOption extends _GofileOption {
  GofileExpireOption({required this.dateTime});

  @override
  String get name => 'expire';

  final DateTime dateTime;

  @override
  String get value => (dateTime.millisecondsSinceEpoch ~/ 1000).toString();
}

class GofileTagsOption extends _GofileOption {
  GofileTagsOption({required this.tags});

  @override
  String get name => 'tags';

  final List<String> tags;

  @override
  String get value => tags.joinComma;
}

class GofileDirectLinkOption extends _GofileOption {
  GofileDirectLinkOption({required this.enable});

  @override
  String get name => 'directLink';

  final bool enable;

  @override
  String get value => enable.toString();
}
