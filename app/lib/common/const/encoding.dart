import 'dart:convert';

// rawString to base64 인코딩
Codec<String, String> stringToBase64 = utf8.fuse(base64);
