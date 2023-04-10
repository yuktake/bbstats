// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbp.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPbpCollection on Isar {
  IsarCollection<Pbp> get pbps => this.collection();
}

const PbpSchema = CollectionSchema(
  name: r'Pbp',
  id: 6380877255492908118,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'myTeamPlay': PropertySchema(
      id: 1,
      name: r'myTeamPlay',
      type: IsarType.bool,
    ),
    r'playAt': PropertySchema(
      id: 2,
      name: r'playAt',
      type: IsarType.dateTime,
    ),
    r'quarter': PropertySchema(
      id: 3,
      name: r'quarter',
      type: IsarType.long,
    ),
    r'shotPosition': PropertySchema(
      id: 4,
      name: r'shotPosition',
      type: IsarType.object,
      target: r'ShotPosition',
    ),
    r'supportedPlayerId': PropertySchema(
      id: 5,
      name: r'supportedPlayerId',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.byte,
      enumMap: _PbptypeEnumValueMap,
    )
  },
  estimateSize: _pbpEstimateSize,
  serialize: _pbpSerialize,
  deserialize: _pbpDeserialize,
  deserializeProp: _pbpDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'player': LinkSchema(
      id: -8353410687257832882,
      name: r'player',
      target: r'Player',
      single: true,
    ),
    r'game': LinkSchema(
      id: -1701806937728641696,
      name: r'game',
      target: r'Game',
      single: true,
    )
  },
  embeddedSchemas: {r'ShotPosition': ShotPositionSchema},
  getId: _pbpGetId,
  getLinks: _pbpGetLinks,
  attach: _pbpAttach,
  version: '3.0.5',
);

int _pbpEstimateSize(
  Pbp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.shotPosition;
    if (value != null) {
      bytesCount += 3 +
          ShotPositionSchema.estimateSize(
              value, allOffsets[ShotPosition]!, allOffsets);
    }
  }
  return bytesCount;
}

void _pbpSerialize(
  Pbp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeBool(offsets[1], object.myTeamPlay);
  writer.writeDateTime(offsets[2], object.playAt);
  writer.writeLong(offsets[3], object.quarter);
  writer.writeObject<ShotPosition>(
    offsets[4],
    allOffsets,
    ShotPositionSchema.serialize,
    object.shotPosition,
  );
  writer.writeLong(offsets[5], object.supportedPlayerId);
  writer.writeByte(offsets[6], object.type.index);
}

Pbp _pbpDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pbp();
  object.description = reader.readString(offsets[0]);
  object.id = id;
  object.myTeamPlay = reader.readBool(offsets[1]);
  object.playAt = reader.readDateTime(offsets[2]);
  object.quarter = reader.readLong(offsets[3]);
  object.shotPosition = reader.readObjectOrNull<ShotPosition>(
    offsets[4],
    ShotPositionSchema.deserialize,
    allOffsets,
  );
  object.supportedPlayerId = reader.readLongOrNull(offsets[5]);
  object.type = _PbptypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
      RecordType.NONE;
  return object;
}

P _pbpDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<ShotPosition>(
        offset,
        ShotPositionSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (_PbptypeValueEnumMap[reader.readByteOrNull(offset)] ??
          RecordType.NONE) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PbptypeEnumValueMap = {
  'NONE': 0,
  'TWO_POINT_MADE': 1,
  'TWO_POINT_MISS': 2,
  'THREE_POINT_MADE': 3,
  'THREE_POINT_MISS': 4,
  'FT_MADE': 5,
  'FT_MISS': 6,
  'SHOT_CLOCK_TURNOVER': 7,
  'TIMEOUT': 8,
  'GAMESET': 9,
  'OFFENCE_REBOUND': 10,
  'DEFENCE_REBOUND': 11,
  'BLOCK': 12,
  'STEAL': 13,
  'TURNOVER': 14,
  'ASSIST': 15,
  'FOUL': 16,
  'SUBSTITUTE': 17,
};
const _PbptypeValueEnumMap = {
  0: RecordType.NONE,
  1: RecordType.TWO_POINT_MADE,
  2: RecordType.TWO_POINT_MISS,
  3: RecordType.THREE_POINT_MADE,
  4: RecordType.THREE_POINT_MISS,
  5: RecordType.FT_MADE,
  6: RecordType.FT_MISS,
  7: RecordType.SHOT_CLOCK_TURNOVER,
  8: RecordType.TIMEOUT,
  9: RecordType.GAMESET,
  10: RecordType.OFFENCE_REBOUND,
  11: RecordType.DEFENCE_REBOUND,
  12: RecordType.BLOCK,
  13: RecordType.STEAL,
  14: RecordType.TURNOVER,
  15: RecordType.ASSIST,
  16: RecordType.FOUL,
  17: RecordType.SUBSTITUTE,
};

Id _pbpGetId(Pbp object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pbpGetLinks(Pbp object) {
  return [object.player, object.game];
}

void _pbpAttach(IsarCollection<dynamic> col, Id id, Pbp object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
  object.game.attach(col, col.isar.collection<Game>(), r'game', id);
}

extension PbpQueryWhereSort on QueryBuilder<Pbp, Pbp, QWhere> {
  QueryBuilder<Pbp, Pbp, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PbpQueryWhere on QueryBuilder<Pbp, Pbp, QWhereClause> {
  QueryBuilder<Pbp, Pbp, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Pbp, Pbp, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterWhereClause> idBetween(
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

extension PbpQueryFilter on QueryBuilder<Pbp, Pbp, QFilterCondition> {
  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> myTeamPlayEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myTeamPlay',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> playAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> playAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> playAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> playAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> quarterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quarter',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> quarterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quarter',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> quarterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quarter',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> quarterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quarter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> shotPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shotPosition',
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> shotPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shotPosition',
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> supportedPlayerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supportedPlayerId',
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> supportedPlayerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supportedPlayerId',
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> supportedPlayerIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supportedPlayerId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> supportedPlayerIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supportedPlayerId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> supportedPlayerIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supportedPlayerId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> supportedPlayerIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supportedPlayerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> typeEqualTo(RecordType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> typeGreaterThan(
    RecordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> typeLessThan(
    RecordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> typeBetween(
    RecordType lower,
    RecordType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PbpQueryObject on QueryBuilder<Pbp, Pbp, QFilterCondition> {
  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> shotPosition(
      FilterQuery<ShotPosition> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'shotPosition');
    });
  }
}

extension PbpQueryLinks on QueryBuilder<Pbp, Pbp, QFilterCondition> {
  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> player(FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> game(FilterQuery<Game> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'game');
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterFilterCondition> gameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'game', 0, true, 0, true);
    });
  }
}

extension PbpQuerySortBy on QueryBuilder<Pbp, Pbp, QSortBy> {
  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByMyTeamPlay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myTeamPlay', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByMyTeamPlayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myTeamPlay', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByPlayAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playAt', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByPlayAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playAt', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByQuarter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarter', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByQuarterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarter', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortBySupportedPlayerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportedPlayerId', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortBySupportedPlayerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportedPlayerId', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension PbpQuerySortThenBy on QueryBuilder<Pbp, Pbp, QSortThenBy> {
  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByMyTeamPlay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myTeamPlay', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByMyTeamPlayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myTeamPlay', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByPlayAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playAt', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByPlayAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playAt', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByQuarter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarter', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByQuarterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarter', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenBySupportedPlayerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportedPlayerId', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenBySupportedPlayerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportedPlayerId', Sort.desc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Pbp, Pbp, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension PbpQueryWhereDistinct on QueryBuilder<Pbp, Pbp, QDistinct> {
  QueryBuilder<Pbp, Pbp, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pbp, Pbp, QDistinct> distinctByMyTeamPlay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'myTeamPlay');
    });
  }

  QueryBuilder<Pbp, Pbp, QDistinct> distinctByPlayAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playAt');
    });
  }

  QueryBuilder<Pbp, Pbp, QDistinct> distinctByQuarter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quarter');
    });
  }

  QueryBuilder<Pbp, Pbp, QDistinct> distinctBySupportedPlayerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supportedPlayerId');
    });
  }

  QueryBuilder<Pbp, Pbp, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension PbpQueryProperty on QueryBuilder<Pbp, Pbp, QQueryProperty> {
  QueryBuilder<Pbp, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pbp, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Pbp, bool, QQueryOperations> myTeamPlayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myTeamPlay');
    });
  }

  QueryBuilder<Pbp, DateTime, QQueryOperations> playAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playAt');
    });
  }

  QueryBuilder<Pbp, int, QQueryOperations> quarterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quarter');
    });
  }

  QueryBuilder<Pbp, ShotPosition?, QQueryOperations> shotPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shotPosition');
    });
  }

  QueryBuilder<Pbp, int?, QQueryOperations> supportedPlayerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supportedPlayerId');
    });
  }

  QueryBuilder<Pbp, RecordType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ShotPositionSchema = Schema(
  name: r'ShotPosition',
  id: -2582152703813579961,
  properties: {
    r'playType': PropertySchema(
      id: 0,
      name: r'playType',
      type: IsarType.byte,
      enumMap: _ShotPositionplayTypeEnumValueMap,
    ),
    r'point': PropertySchema(
      id: 1,
      name: r'point',
      type: IsarType.long,
    ),
    r'positionX': PropertySchema(
      id: 2,
      name: r'positionX',
      type: IsarType.long,
    ),
    r'positionY': PropertySchema(
      id: 3,
      name: r'positionY',
      type: IsarType.long,
    ),
    r'shotType': PropertySchema(
      id: 4,
      name: r'shotType',
      type: IsarType.byte,
      enumMap: _ShotPositionshotTypeEnumValueMap,
    ),
    r'shotZone': PropertySchema(
      id: 5,
      name: r'shotZone',
      type: IsarType.byte,
      enumMap: _ShotPositionshotZoneEnumValueMap,
    )
  },
  estimateSize: _shotPositionEstimateSize,
  serialize: _shotPositionSerialize,
  deserialize: _shotPositionDeserialize,
  deserializeProp: _shotPositionDeserializeProp,
);

int _shotPositionEstimateSize(
  ShotPosition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _shotPositionSerialize(
  ShotPosition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.playType.index);
  writer.writeLong(offsets[1], object.point);
  writer.writeLong(offsets[2], object.positionX);
  writer.writeLong(offsets[3], object.positionY);
  writer.writeByte(offsets[4], object.shotType.index);
  writer.writeByte(offsets[5], object.shotZone.index);
}

ShotPosition _shotPositionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShotPosition();
  object.playType =
      _ShotPositionplayTypeValueEnumMap[reader.readByteOrNull(offsets[0])] ??
          PlayType.NONE;
  object.point = reader.readLong(offsets[1]);
  object.positionX = reader.readLong(offsets[2]);
  object.positionY = reader.readLong(offsets[3]);
  object.shotType =
      _ShotPositionshotTypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          ShotType.NONE;
  object.shotZone =
      _ShotPositionshotZoneValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          ShotZone.ALL;
  return object;
}

P _shotPositionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ShotPositionplayTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PlayType.NONE) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_ShotPositionshotTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ShotType.NONE) as P;
    case 5:
      return (_ShotPositionshotZoneValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ShotZone.ALL) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ShotPositionplayTypeEnumValueMap = {
  'NONE': 0,
  'ISOLATION': 1,
  'FASTBREAK': 2,
  'PICK_AND_ROLL_BALL_HANDLER': 3,
  'PICK_AND_ROLL_ROLL_MAN': 4,
  'POSTUP': 5,
  'SPOTUP': 6,
  'HANDOFF': 7,
  'CUT': 8,
  'OFF_SCREEN': 9,
  'SECOND_CHANCE': 10,
};
const _ShotPositionplayTypeValueEnumMap = {
  0: PlayType.NONE,
  1: PlayType.ISOLATION,
  2: PlayType.FASTBREAK,
  3: PlayType.PICK_AND_ROLL_BALL_HANDLER,
  4: PlayType.PICK_AND_ROLL_ROLL_MAN,
  5: PlayType.POSTUP,
  6: PlayType.SPOTUP,
  7: PlayType.HANDOFF,
  8: PlayType.CUT,
  9: PlayType.OFF_SCREEN,
  10: PlayType.SECOND_CHANCE,
};
const _ShotPositionshotTypeEnumValueMap = {
  'NONE': 0,
  'LAYUP': 1,
  'CATCH_AND_SHOT': 2,
  'PULLUP': 3,
  'FLOATING_SHOT': 4,
  'HOOK_SHOT': 5,
  'TIP_SHOT': 6,
  'FADEAWAY': 7,
  'DUNK': 8,
  'ALLEY_OOP': 9,
};
const _ShotPositionshotTypeValueEnumMap = {
  0: ShotType.NONE,
  1: ShotType.LAYUP,
  2: ShotType.CATCH_AND_SHOT,
  3: ShotType.PULLUP,
  4: ShotType.FLOATING_SHOT,
  5: ShotType.HOOK_SHOT,
  6: ShotType.TIP_SHOT,
  7: ShotType.FADEAWAY,
  8: ShotType.DUNK,
  9: ShotType.ALLEY_OOP,
};
const _ShotPositionshotZoneEnumValueMap = {
  'ALL': 0,
  'IN_THE_PAINT': 1,
  'MIDDLE_AREA': 2,
  'AROUND_TOP_THREE': 3,
  'LEFT_CORNER_THREE': 4,
  'RIGHT_CORNER_THREE': 5,
};
const _ShotPositionshotZoneValueEnumMap = {
  0: ShotZone.ALL,
  1: ShotZone.IN_THE_PAINT,
  2: ShotZone.MIDDLE_AREA,
  3: ShotZone.AROUND_TOP_THREE,
  4: ShotZone.LEFT_CORNER_THREE,
  5: ShotZone.RIGHT_CORNER_THREE,
};

extension ShotPositionQueryFilter
    on QueryBuilder<ShotPosition, ShotPosition, QFilterCondition> {
  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      playTypeEqualTo(PlayType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playType',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      playTypeGreaterThan(
    PlayType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playType',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      playTypeLessThan(
    PlayType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playType',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      playTypeBetween(
    PlayType lower,
    PlayType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition> pointEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'point',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      pointGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'point',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition> pointLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'point',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition> pointBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'point',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionXEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'positionX',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionXGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'positionX',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionXLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'positionX',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionXBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'positionX',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionYEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'positionY',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionYGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'positionY',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionYLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'positionY',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      positionYBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'positionY',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotTypeEqualTo(ShotType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shotType',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotTypeGreaterThan(
    ShotType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shotType',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotTypeLessThan(
    ShotType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shotType',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotTypeBetween(
    ShotType lower,
    ShotType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shotType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotZoneEqualTo(ShotZone value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shotZone',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotZoneGreaterThan(
    ShotZone value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shotZone',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotZoneLessThan(
    ShotZone value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shotZone',
        value: value,
      ));
    });
  }

  QueryBuilder<ShotPosition, ShotPosition, QAfterFilterCondition>
      shotZoneBetween(
    ShotZone lower,
    ShotZone upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shotZone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ShotPositionQueryObject
    on QueryBuilder<ShotPosition, ShotPosition, QFilterCondition> {}
