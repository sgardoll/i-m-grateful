import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Stability.ai REST API Group Code

class StabilityAiRESTAPIGroup {
  static String baseUrl = 'https://api.stability.ai';
  static Map<String, String> headers = {};
  static TextToImageCall textToImageCall = TextToImageCall();
  static ImageToImageCall imageToImageCall = ImageToImageCall();
  static UpscaleImageCall upscaleImageCall = UpscaleImageCall();
  static MaskingCall maskingCall = MaskingCall();
  static ListEnginesCall listEnginesCall = ListEnginesCall();
  static UserAccountCall userAccountCall = UserAccountCall();
  static UserBalanceCall userBalanceCall = UserBalanceCall();
}

class TextToImageCall {
  Future<ApiCallResponse> call({
    String? engineId = '',
    String? accept = '',
    String? organization = '',
    String? stabilityClientID = '',
    String? stabilityClientVersion = '',
    String? authorization = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'textToImage',
      apiUrl:
          '${StabilityAiRESTAPIGroup.baseUrl}/v1/generation/${engineId}/text-to-image',
      callType: ApiCallType.POST,
      headers: {
        ...StabilityAiRESTAPIGroup.headers,
        'Accept': '${accept}',
        'Organization': '${organization}',
        'Stability-Client-ID': '${stabilityClientID}',
        'Stability-Client-Version': '${stabilityClientVersion}',
        'Authorization': '${authorization}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ImageToImageCall {
  Future<ApiCallResponse> call({
    String? engineId = 'stable-diffusion-768-v2-1',
    String? accept = 'image/png',
    String? stabilityClientID = 'im_grateful',
    String? stabilityClientVersion = 'alpha',
    String? authorization = '',
    String? organization = '',
    double? imageStrength = 0.5,
    dynamic? textPromptsJson,
    FFUploadedFile? initImage,
    int? cfgScale = 7,
    String? sampler = 'K_DPM_2_ANCESTRAL',
    int? steps = 50,
  }) {
    final textPrompts = _serializeJson(textPromptsJson);

    return ApiManager.instance.makeApiCall(
      callName: 'imageToImage',
      apiUrl:
          '${StabilityAiRESTAPIGroup.baseUrl}/v1/generation/${engineId}/image-to-image',
      callType: ApiCallType.POST,
      headers: {
        ...StabilityAiRESTAPIGroup.headers,
        'Accept': '${accept}',
        'Stability-Client-ID': '${stabilityClientID}',
        'Stability-Client-Version': '${stabilityClientVersion}',
        'Authorization': '${authorization}',
      },
      params: {
        'image_strength': imageStrength,
        'init_image_mode': "IMAGE_STRENGTH",
        'init_image': initImage,
        'text_prompts': textPrompts,
        'cfg_scale': cfgScale,
        'sampler': sampler,
        'samples': 1,
        'steps': steps,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpscaleImageCall {
  Future<ApiCallResponse> call({
    String? engineId = '',
    String? accept = '',
    String? organization = '',
    String? stabilityClientID = '',
    String? stabilityClientVersion = '',
    String? authorization = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'upscaleImage',
      apiUrl:
          '${StabilityAiRESTAPIGroup.baseUrl}/v1/generation/${engineId}/image-to-image/upscale',
      callType: ApiCallType.POST,
      headers: {
        ...StabilityAiRESTAPIGroup.headers,
        'Accept': '${accept}',
        'Organization': '${organization}',
        'Stability-Client-ID': '${stabilityClientID}',
        'Stability-Client-Version': '${stabilityClientVersion}',
        'Authorization': '${authorization}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MaskingCall {
  Future<ApiCallResponse> call({
    String? engineId = '',
    String? accept = '',
    String? organization = '',
    String? stabilityClientID = '',
    String? stabilityClientVersion = '',
    String? authorization = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'masking',
      apiUrl:
          '${StabilityAiRESTAPIGroup.baseUrl}/v1/generation/${engineId}/image-to-image/masking',
      callType: ApiCallType.POST,
      headers: {
        ...StabilityAiRESTAPIGroup.headers,
        'Accept': '${accept}',
        'Organization': '${organization}',
        'Stability-Client-ID': '${stabilityClientID}',
        'Stability-Client-Version': '${stabilityClientVersion}',
        'Authorization': '${authorization}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListEnginesCall {
  Future<ApiCallResponse> call({
    String? organization = '',
    String? stabilityClientID = '',
    String? stabilityClientVersion = '',
    String? authorization = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listEngines',
      apiUrl: '${StabilityAiRESTAPIGroup.baseUrl}/v1/engines/list',
      callType: ApiCallType.GET,
      headers: {
        ...StabilityAiRESTAPIGroup.headers,
        'Organization': '${organization}',
        'Stability-Client-ID': '${stabilityClientID}',
        'Stability-Client-Version': '${stabilityClientVersion}',
        'Authorization': '${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserAccountCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'userAccount',
      apiUrl: '${StabilityAiRESTAPIGroup.baseUrl}/v1/user/account',
      callType: ApiCallType.GET,
      headers: {
        ...StabilityAiRESTAPIGroup.headers,
        'Authorization': '${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserBalanceCall {
  Future<ApiCallResponse> call({
    String? organization = '',
    String? stabilityClientID = '',
    String? stabilityClientVersion = '',
    String? authorization = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'userBalance',
      apiUrl: '${StabilityAiRESTAPIGroup.baseUrl}/v1/user/balance',
      callType: ApiCallType.GET,
      headers: {
        ...StabilityAiRESTAPIGroup.headers,
        'Organization': '${organization}',
        'Stability-Client-ID': '${stabilityClientID}',
        'Stability-Client-Version': '${stabilityClientVersion}',
        'Authorization': '${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Stability.ai REST API Group Code

class BayhouseAPICall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? textToCheck = '',
  }) {
    final body = '''
{
  "text": "${textToCheck}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BayhouseAPI',
      apiUrl: 'https://api.bayhouse.io/v1/util/filter-profanity',
      callType: ApiCallType.POST,
      headers: {
        'content-type': 'application/json; charset=UTF-8',
        'Authorization': 'hNpnRPkIGgRiImHBoiutfWmICsOkjFKxydNWWfvY',
      },
      params: {},
      body: body,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic cleanText(dynamic response) => getJsonField(
        response,
        r'''$.clean_text''',
      );
  static dynamic containsProfanity(dynamic response) => getJsonField(
        response,
        r'''$.contains_profanity''',
      );
}

class StableAICall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? object = '',
    String? artReferences = '',
    String? engineId = 'stable-diffusion-512-v2-1',
  }) {
    final body = '''
{
  'text_prompts': [
    {
      'text': 'An evocative iPhone background about ${object} created it in the style of ${artReferences}',
    }
  ],
  'sampler': 'K_DPMPP_2M',
  'cfg_scale': 7,
  'height': 768,
  'width': 512,
  'samples': 1,
  'steps': 30
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StableAI',
      apiUrl: 'https://api.stability.ai/v1/generation/{engineId}/text-to-image',
      callType: ApiCallType.POST,
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer {apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
