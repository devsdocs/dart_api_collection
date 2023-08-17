part of '../streamwish.dart';

class StreamwishApi {
  StreamwishApi(String apiKey) : _rawApi = _StreamwishRawApi(apiKey);

  final _StreamwishRawApi _rawApi;

  _StreamwishRawApi get rawApi => _rawApi;
}
