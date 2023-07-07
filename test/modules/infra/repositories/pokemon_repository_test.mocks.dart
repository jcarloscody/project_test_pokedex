// Mocks generated by Mockito 5.4.2 from annotations
// in pokedex/test/modules/infra/repositories/pokemon_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart'
    as _i5;
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart'
    as _i2;
import 'package:pokedex/modules/infra/data/http/ipokemon_data_http.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokemonSpecificEntity_0 extends _i1.SmartFake
    implements _i2.PokemonSpecificEntity {
  _FakePokemonSpecificEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IPokemonDataHttp].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPokemonDataHttp extends _i1.Mock implements _i3.IPokemonDataHttp {
  MockIPokemonDataHttp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.PokemonGlobalEntity>> getPokemons() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
        ),
        returnValue: _i4.Future<List<_i5.PokemonGlobalEntity>>.value(
            <_i5.PokemonGlobalEntity>[]),
      ) as _i4.Future<List<_i5.PokemonGlobalEntity>>);
  @override
  _i4.Future<_i2.PokemonSpecificEntity> getPokemon({required String? text}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemon,
          [],
          {#text: text},
        ),
        returnValue: _i4.Future<_i2.PokemonSpecificEntity>.value(
            _FakePokemonSpecificEntity_0(
          this,
          Invocation.method(
            #getPokemon,
            [],
            {#text: text},
          ),
        )),
      ) as _i4.Future<_i2.PokemonSpecificEntity>);
}
