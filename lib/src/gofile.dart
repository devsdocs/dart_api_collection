import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:dart_api_collection/src/common.dart';
import 'package:dio/dio.dart';

part 'gofile/api.dart';

part 'gofile/helper/extension.dart';
part 'gofile/helper/content_option.dart';

part 'gofile/model/gofile_common_result.dart';
part 'gofile/model/gofile_get_account.dart';
part 'gofile/model/gofile_get_content.dart';
part 'gofile/model/gofile_local_upload.dart';
part 'gofile/model/gofile_upload_server.dart';
