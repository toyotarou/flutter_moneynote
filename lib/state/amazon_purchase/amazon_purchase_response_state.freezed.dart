// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amazon_purchase_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AmazonPurchaseResponseState {
  AsyncValue<List<AmazonPurchase>> get amazonPurchaseList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AmazonPurchaseResponseStateCopyWith<AmazonPurchaseResponseState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmazonPurchaseResponseStateCopyWith<$Res> {
  factory $AmazonPurchaseResponseStateCopyWith(
          AmazonPurchaseResponseState value,
          $Res Function(AmazonPurchaseResponseState) then) =
      _$AmazonPurchaseResponseStateCopyWithImpl<$Res,
          AmazonPurchaseResponseState>;
  @useResult
  $Res call({AsyncValue<List<AmazonPurchase>> amazonPurchaseList});
}

/// @nodoc
class _$AmazonPurchaseResponseStateCopyWithImpl<$Res,
        $Val extends AmazonPurchaseResponseState>
    implements $AmazonPurchaseResponseStateCopyWith<$Res> {
  _$AmazonPurchaseResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amazonPurchaseList = null,
  }) {
    return _then(_value.copyWith(
      amazonPurchaseList: null == amazonPurchaseList
          ? _value.amazonPurchaseList
          : amazonPurchaseList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<AmazonPurchase>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmazonPurchaseResponseStateImplCopyWith<$Res>
    implements $AmazonPurchaseResponseStateCopyWith<$Res> {
  factory _$$AmazonPurchaseResponseStateImplCopyWith(
          _$AmazonPurchaseResponseStateImpl value,
          $Res Function(_$AmazonPurchaseResponseStateImpl) then) =
      __$$AmazonPurchaseResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<AmazonPurchase>> amazonPurchaseList});
}

/// @nodoc
class __$$AmazonPurchaseResponseStateImplCopyWithImpl<$Res>
    extends _$AmazonPurchaseResponseStateCopyWithImpl<$Res,
        _$AmazonPurchaseResponseStateImpl>
    implements _$$AmazonPurchaseResponseStateImplCopyWith<$Res> {
  __$$AmazonPurchaseResponseStateImplCopyWithImpl(
      _$AmazonPurchaseResponseStateImpl _value,
      $Res Function(_$AmazonPurchaseResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amazonPurchaseList = null,
  }) {
    return _then(_$AmazonPurchaseResponseStateImpl(
      amazonPurchaseList: null == amazonPurchaseList
          ? _value.amazonPurchaseList
          : amazonPurchaseList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<AmazonPurchase>>,
    ));
  }
}

/// @nodoc

class _$AmazonPurchaseResponseStateImpl
    implements _AmazonPurchaseResponseState {
  const _$AmazonPurchaseResponseStateImpl(
      {this.amazonPurchaseList =
          const AsyncValue<List<AmazonPurchase>>.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<AmazonPurchase>> amazonPurchaseList;

  @override
  String toString() {
    return 'AmazonPurchaseResponseState(amazonPurchaseList: $amazonPurchaseList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmazonPurchaseResponseStateImpl &&
            (identical(other.amazonPurchaseList, amazonPurchaseList) ||
                other.amazonPurchaseList == amazonPurchaseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amazonPurchaseList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmazonPurchaseResponseStateImplCopyWith<_$AmazonPurchaseResponseStateImpl>
      get copyWith => __$$AmazonPurchaseResponseStateImplCopyWithImpl<
          _$AmazonPurchaseResponseStateImpl>(this, _$identity);
}

abstract class _AmazonPurchaseResponseState
    implements AmazonPurchaseResponseState {
  const factory _AmazonPurchaseResponseState(
          {final AsyncValue<List<AmazonPurchase>> amazonPurchaseList}) =
      _$AmazonPurchaseResponseStateImpl;

  @override
  AsyncValue<List<AmazonPurchase>> get amazonPurchaseList;
  @override
  @JsonKey(ignore: true)
  _$$AmazonPurchaseResponseStateImplCopyWith<_$AmazonPurchaseResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
