// ignore_for_file: constant_identifier_names

part of '../../mixdrop.dart';

enum MixdropSubtitleLanguage {
  AR('ar'),
  BG('bg'),
  BS('bs'),
  HR('hr'),
  CZ('cz'),
  DK('dk'),
  EN('en'),
  FI('fi'),
  FR('fr'),
  DE('de'),
  IN('in'),
  IT('it'),
  ID('id'),
  JP('jp'),
  MY('my'),
  NO('no'),
  PL('pl'),
  PT('pt'),
  RU('ru'),
  RO('ro'),
  RS('rs'),
  SK('sk'),
  ES('es'),
  SE('se'),
  TR('tr'),
  UD('ud');

  const MixdropSubtitleLanguage(this._value);

  final String _value;

  @override
  String toString() => _value;
}
