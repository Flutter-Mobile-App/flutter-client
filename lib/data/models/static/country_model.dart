import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'country_model.g.dart';

abstract class CountryListResponse implements Built<CountryListResponse, CountryListResponseBuilder> {

  BuiltList<CountryEntity> get data;

  CountryListResponse._();
  factory CountryListResponse([updates(CountryListResponseBuilder b)]) = _$CountryListResponse;
  static Serializer<CountryListResponse> get serializer => _$countryListResponseSerializer;
}

abstract class CountryItemResponse implements Built<CountryItemResponse, CountryItemResponseBuilder> {

  CountryEntity get data;

  CountryItemResponse._();
  factory CountryItemResponse([updates(CountryItemResponseBuilder b)]) = _$CountryItemResponse;
  static Serializer<CountryItemResponse> get serializer => _$countryItemResponseSerializer;
}

class CountryFields {
  static const String capital = 'capital';
  static const String citizenship = 'citizenship';
  static const String countryCode = 'countryCode';
  static const String currency = 'currency';
  static const String currencyCode = 'currencyCode';
  static const String currencySubUnit = 'currencySubUnit';
  static const String fullName = 'fullName';
  static const String iso_3166_2 = 'iso_3166_2';
  static const String iso_3166_3 = 'iso_3166_3';
  static const String name = 'name';
  static const String regionCode = 'regionCode';
  static const String subRegionCode = 'subRegionCode';
  static const String eea = 'eea';
  static const String swapPostalCode = 'swapPostalCode';
  static const String swapCurrencySymbol = 'swapCurrencySymbol';
  static const String thousandSeparator = 'thousandSeparator';
  static const String decimalSeparator = 'decimalSeparator';
  
}


abstract class CountryEntity implements Built<CountryEntity, CountryEntityBuilder> {

  factory CountryEntity() {
    return _$CountryEntity._(
      capital: '',
      citizenship: '',
      countryCode: '',
      currency: '',
      currencyCode: '',
      currencySubUnit: '',
      fullName: '',
      iso_3166_2: '',
      iso_3166_3: '',
      name: '',
      regionCode: '',
      subRegionCode: '',
      eea: false,
      swapPostalCode: false,
      swapCurrencySymbol: false,
      thousandSeparator: '',
      decimalSeparator: '',
    );
  }

  @BuiltValueField(wireName: 'capital')
  String get capital;

  @BuiltValueField(wireName: 'citizenship')
  String get citizenship;

  @BuiltValueField(wireName: 'country_code')
  String get countryCode;

  @BuiltValueField(wireName: 'currency')
  String get currency;

  @BuiltValueField(wireName: 'currency_code')
  String get currencyCode;

  @BuiltValueField(wireName: 'currency_sub_unit')
  String get currencySubUnit;

  @BuiltValueField(wireName: 'full_name')
  String get fullName;

  @BuiltValueField(wireName: 'iso_3166_2')
  String get iso_3166_2;

  @BuiltValueField(wireName: 'iso_3166_3')
  String get iso_3166_3;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'region_code')
  String get regionCode;

  @BuiltValueField(wireName: 'sub_region_code')
  String get subRegionCode;

  @BuiltValueField(wireName: 'eea')
  bool get eea;

  @BuiltValueField(wireName: 'swap_postal_code')
  bool get swapPostalCode;

  @BuiltValueField(wireName: 'swap_currency_symbol')
  bool get swapCurrencySymbol;

  @BuiltValueField(wireName: 'thousand_separator')
  String get thousandSeparator;

  @BuiltValueField(wireName: 'decimal_separator')
  String get decimalSeparator;

  CountryEntity._();
  static Serializer<CountryEntity> get serializer => _$countryEntitySerializer;
}

