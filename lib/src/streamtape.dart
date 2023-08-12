import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:dart_api_collection/src/common.dart';
import 'package:dio/dio.dart';

part 'streamtape/api.dart';

part 'streamtape/helper/extension.dart';
part 'streamtape/helper/progress.dart';

part 'streamtape/model/streamtape_account_info.dart';
part 'streamtape/model/streamtape_common_result.dart';
part 'streamtape/model/streamtape_convert_failed.dart';
part 'streamtape/model/streamtape_convert_running.dart';
part 'streamtape/model/streamtape_download_link.dart';
part 'streamtape/model/streamtape_download_ticket.dart';
part 'streamtape/model/streamtape_file_info.dart';
part 'streamtape/model/streamtape_file_folder_list.dart';
part 'streamtape/model/streamtape_file_rename.dart';
part 'streamtape/model/streamtape_file_thumbnail.dart';
part 'streamtape/model/streamtape_folder_create.dart';
part 'streamtape/model/streamtape_upload_link.dart';
part 'streamtape/model/streamtape_upload_result.dart';
part 'streamtape/model/streamtape_remote_upload_add.dart';
part 'streamtape/model/streamtape_remote_upload_check.dart';
