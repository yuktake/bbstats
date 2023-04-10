// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_summary.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGameSummaryCollection on Isar {
  IsarCollection<GameSummary> get gameSummarys => this.collection();
}

const GameSummarySchema = CollectionSchema(
  name: r'GameSummary',
  id: -486216222824619780,
  properties: {
    r'q1': PropertySchema(
      id: 0,
      name: r'q1',
      type: IsarType.long,
    ),
    r'q2': PropertySchema(
      id: 1,
      name: r'q2',
      type: IsarType.long,
    ),
    r'q3': PropertySchema(
      id: 2,
      name: r'q3',
      type: IsarType.long,
    ),
    r'q4': PropertySchema(
      id: 3,
      name: r'q4',
      type: IsarType.long,
    )
  },
  estimateSize: _gameSummaryEstimateSize,
  serialize: _gameSummarySerialize,
  deserialize: _gameSummaryDeserialize,
  deserializeProp: _gameSummaryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'game': LinkSchema(
      id: 6348032507657175716,
      name: r'game',
      target: r'Game',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _gameSummaryGetId,
  getLinks: _gameSummaryGetLinks,
  attach: _gameSummaryAttach,
  version: '3.0.5',
);

int _gameSummaryEstimateSize(
  GameSummary object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _gameSummarySerialize(
  GameSummary object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.q1);
  writer.writeLong(offsets[1], object.q2);
  writer.writeLong(offsets[2], object.q3);
  writer.writeLong(offsets[3], object.q4);
}

GameSummary _gameSummaryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameSummary();
  object.id = id;
  object.q1 = reader.readLong(offsets[0]);
  object.q2 = reader.readLong(offsets[1]);
  object.q3 = reader.readLong(offsets[2]);
  object.q4 = reader.readLong(offsets[3]);
  return object;
}

P _gameSummaryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameSummaryGetId(GameSummary object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameSummaryGetLinks(GameSummary object) {
  return [object.game];
}

void _gameSummaryAttach(
    IsarCollection<dynamic> col, Id id, GameSummary object) {
  object.id = id;
  object.game.attach(col, col.isar.collection<Game>(), r'game', id);
}

extension GameSummaryQueryWhereSort
    on QueryBuilder<GameSummary, GameSummary, QWhere> {
  QueryBuilder<GameSummary, GameSummary, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GameSummaryQueryWhere
    on QueryBuilder<GameSummary, GameSummary, QWhereClause> {
  QueryBuilder<GameSummary, GameSummary, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameSummaryQueryFilter
    on QueryBuilder<GameSummary, GameSummary, QFilterCondition> {
  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q1EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'q1',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q1GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'q1',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q1LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'q1',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q1Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'q1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q2EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'q2',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q2GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'q2',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q2LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'q2',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q2Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'q2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q3EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'q3',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q3GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'q3',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q3LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'q3',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q3Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'q3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q4EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'q4',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q4GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'q4',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q4LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'q4',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> q4Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'q4',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameSummaryQueryObject
    on QueryBuilder<GameSummary, GameSummary, QFilterCondition> {}

extension GameSummaryQueryLinks
    on QueryBuilder<GameSummary, GameSummary, QFilterCondition> {
  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> game(
      FilterQuery<Game> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'game');
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterFilterCondition> gameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'game', 0, true, 0, true);
    });
  }
}

extension GameSummaryQuerySortBy
    on QueryBuilder<GameSummary, GameSummary, QSortBy> {
  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q1', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q1', Sort.desc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q2', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q2', Sort.desc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q3', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q3', Sort.desc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q4', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> sortByQ4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q4', Sort.desc);
    });
  }
}

extension GameSummaryQuerySortThenBy
    on QueryBuilder<GameSummary, GameSummary, QSortThenBy> {
  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q1', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q1', Sort.desc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q2', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q2', Sort.desc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q3', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q3', Sort.desc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q4', Sort.asc);
    });
  }

  QueryBuilder<GameSummary, GameSummary, QAfterSortBy> thenByQ4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'q4', Sort.desc);
    });
  }
}

extension GameSummaryQueryWhereDistinct
    on QueryBuilder<GameSummary, GameSummary, QDistinct> {
  QueryBuilder<GameSummary, GameSummary, QDistinct> distinctByQ1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'q1');
    });
  }

  QueryBuilder<GameSummary, GameSummary, QDistinct> distinctByQ2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'q2');
    });
  }

  QueryBuilder<GameSummary, GameSummary, QDistinct> distinctByQ3() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'q3');
    });
  }

  QueryBuilder<GameSummary, GameSummary, QDistinct> distinctByQ4() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'q4');
    });
  }
}

extension GameSummaryQueryProperty
    on QueryBuilder<GameSummary, GameSummary, QQueryProperty> {
  QueryBuilder<GameSummary, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GameSummary, int, QQueryOperations> q1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'q1');
    });
  }

  QueryBuilder<GameSummary, int, QQueryOperations> q2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'q2');
    });
  }

  QueryBuilder<GameSummary, int, QQueryOperations> q3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'q3');
    });
  }

  QueryBuilder<GameSummary, int, QQueryOperations> q4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'q4');
    });
  }
}
