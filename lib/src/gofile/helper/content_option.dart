part of '../../gofile.dart';

///Can be "public", "password", "description", "expire", "tags" or "directLink".
abstract class _GofileOption {
  String? name;
  String? value;
}

///The value of the option to be defined.
///
///For "public", can be "true" or "false". The contentId must be a folder.
class GofilePublicOption extends _GofileOption {
  GofilePublicOption({required this.setting});

  @override
  String get name => 'public';

  final bool setting;

  @override
  String get value => setting.toString();
}

///The value of the option to be defined.
///
///For "password", must be the password. The contentId must be a folder.
class GofilePasswordOption extends _GofileOption {
  GofilePasswordOption({required this.password});

  @override
  String get name => 'password';

  final String password;

  @override
  String get value => password;
}

///The value of the option to be defined.
///
///For "description", must be the description. The contentId must be a folder.
class GofileDescriptionOption extends _GofileOption {
  GofileDescriptionOption({required this.description});

  @override
  String get name => 'description';

  final String description;

  @override
  String get value => description;
}

///The value of the option to be defined.
///
///For "expire", must be the expiration date in the form of unix timestamp. The contentId must be a folder.
class GofileExpireOption extends _GofileOption {
  GofileExpireOption({required this.dateTime});

  @override
  String get name => 'expire';

  final DateTime dateTime;

  @override
  String get value => (dateTime.millisecondsSinceEpoch ~/ 1000).toString();
}

///The value of the option to be defined.
///
///For "tags", must be a comma seperated list of tags. The contentId must be a folder.
class GofileTagsOption extends _GofileOption {
  GofileTagsOption({required this.tags});

  @override
  String get name => 'tags';

  final List<String> tags;

  @override
  String get value => tags.joinComma;
}

///The value of the option to be defined.
///
///For "directLink", can be "true" or "false". The contentId must be a file.
class GofileDirectLinkOption extends _GofileOption {
  GofileDirectLinkOption({required this.enable});

  @override
  String get name => 'directLink';

  final bool enable;

  @override
  String get value => enable.toString();
}
