// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGameCollection on Isar {
  IsarCollection<Game> get games => this.collection();
}

const GameSchema = CollectionSchema(
  name: r'Game',
  id: -6261407721091271860,
  properties: {
    r'ast': PropertySchema(
      id: 0,
      name: r'ast',
      type: IsarType.long,
    ),
    r'benchPts': PropertySchema(
      id: 1,
      name: r'benchPts',
      type: IsarType.long,
    ),
    r'blk': PropertySchema(
      id: 2,
      name: r'blk',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dReb': PropertySchema(
      id: 4,
      name: r'dReb',
      type: IsarType.long,
    ),
    r'fgRatio': PropertySchema(
      id: 5,
      name: r'fgRatio',
      type: IsarType.double,
    ),
    r'fga': PropertySchema(
      id: 6,
      name: r'fga',
      type: IsarType.long,
    ),
    r'fgm': PropertySchema(
      id: 7,
      name: r'fgm',
      type: IsarType.long,
    ),
    r'ftRatio': PropertySchema(
      id: 8,
      name: r'ftRatio',
      type: IsarType.double,
    ),
    r'fta': PropertySchema(
      id: 9,
      name: r'fta',
      type: IsarType.long,
    ),
    r'ftm': PropertySchema(
      id: 10,
      name: r'ftm',
      type: IsarType.long,
    ),
    r'gameDate': PropertySchema(
      id: 11,
      name: r'gameDate',
      type: IsarType.dateTime,
    ),
    r'myPts': PropertySchema(
      id: 12,
      name: r'myPts',
      type: IsarType.long,
    ),
    r'oReb': PropertySchema(
      id: 13,
      name: r'oReb',
      type: IsarType.long,
    ),
    r'onGame': PropertySchema(
      id: 14,
      name: r'onGame',
      type: IsarType.bool,
    ),
    r'opponentAst': PropertySchema(
      id: 15,
      name: r'opponentAst',
      type: IsarType.long,
    ),
    r'opponentBenchPts': PropertySchema(
      id: 16,
      name: r'opponentBenchPts',
      type: IsarType.long,
    ),
    r'opponentBlk': PropertySchema(
      id: 17,
      name: r'opponentBlk',
      type: IsarType.long,
    ),
    r'opponentDReb': PropertySchema(
      id: 18,
      name: r'opponentDReb',
      type: IsarType.long,
    ),
    r'opponentFgRatio': PropertySchema(
      id: 19,
      name: r'opponentFgRatio',
      type: IsarType.double,
    ),
    r'opponentFga': PropertySchema(
      id: 20,
      name: r'opponentFga',
      type: IsarType.long,
    ),
    r'opponentFgm': PropertySchema(
      id: 21,
      name: r'opponentFgm',
      type: IsarType.long,
    ),
    r'opponentFtRatio': PropertySchema(
      id: 22,
      name: r'opponentFtRatio',
      type: IsarType.double,
    ),
    r'opponentFta': PropertySchema(
      id: 23,
      name: r'opponentFta',
      type: IsarType.long,
    ),
    r'opponentFtm': PropertySchema(
      id: 24,
      name: r'opponentFtm',
      type: IsarType.long,
    ),
    r'opponentOReb': PropertySchema(
      id: 25,
      name: r'opponentOReb',
      type: IsarType.long,
    ),
    r'opponentPf': PropertySchema(
      id: 26,
      name: r'opponentPf',
      type: IsarType.long,
    ),
    r'opponentPts': PropertySchema(
      id: 27,
      name: r'opponentPts',
      type: IsarType.long,
    ),
    r'opponentReb': PropertySchema(
      id: 28,
      name: r'opponentReb',
      type: IsarType.long,
    ),
    r'opponentStl': PropertySchema(
      id: 29,
      name: r'opponentStl',
      type: IsarType.long,
    ),
    r'opponentTo': PropertySchema(
      id: 30,
      name: r'opponentTo',
      type: IsarType.long,
    ),
    r'opponentTpRatio': PropertySchema(
      id: 31,
      name: r'opponentTpRatio',
      type: IsarType.double,
    ),
    r'opponentTpa': PropertySchema(
      id: 32,
      name: r'opponentTpa',
      type: IsarType.long,
    ),
    r'opponentTpm': PropertySchema(
      id: 33,
      name: r'opponentTpm',
      type: IsarType.long,
    ),
    r'outcome': PropertySchema(
      id: 34,
      name: r'outcome',
      type: IsarType.byte,
      enumMap: _GameoutcomeEnumValueMap,
    ),
    r'pf': PropertySchema(
      id: 35,
      name: r'pf',
      type: IsarType.long,
    ),
    r'reb': PropertySchema(
      id: 36,
      name: r'reb',
      type: IsarType.long,
    ),
    r'stl': PropertySchema(
      id: 37,
      name: r'stl',
      type: IsarType.long,
    ),
    r'to': PropertySchema(
      id: 38,
      name: r'to',
      type: IsarType.long,
    ),
    r'tpRatio': PropertySchema(
      id: 39,
      name: r'tpRatio',
      type: IsarType.double,
    ),
    r'tpa': PropertySchema(
      id: 40,
      name: r'tpa',
      type: IsarType.long,
    ),
    r'tpm': PropertySchema(
      id: 41,
      name: r'tpm',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 42,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _gameEstimateSize,
  serialize: _gameSerialize,
  deserialize: _gameDeserialize,
  deserializeProp: _gameDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'opponent': LinkSchema(
      id: 1040075604518001694,
      name: r'opponent',
      target: r'Team',
      single: true,
    ),
    r'boxscores': LinkSchema(
      id: 1366752793555448834,
      name: r'boxscores',
      target: r'Boxscore',
      single: false,
    ),
    r'pbps': LinkSchema(
      id: -4427701273131939474,
      name: r'pbps',
      target: r'Pbp',
      single: false,
      linkName: r'game',
    )
  },
  embeddedSchemas: {},
  getId: _gameGetId,
  getLinks: _gameGetLinks,
  attach: _gameAttach,
  version: '3.0.5',
);

int _gameEstimateSize(
  Game object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _gameSerialize(
  Game object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ast);
  writer.writeLong(offsets[1], object.benchPts);
  writer.writeLong(offsets[2], object.blk);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeLong(offsets[4], object.dReb);
  writer.writeDouble(offsets[5], object.fgRatio);
  writer.writeLong(offsets[6], object.fga);
  writer.writeLong(offsets[7], object.fgm);
  writer.writeDouble(offsets[8], object.ftRatio);
  writer.writeLong(offsets[9], object.fta);
  writer.writeLong(offsets[10], object.ftm);
  writer.writeDateTime(offsets[11], object.gameDate);
  writer.writeLong(offsets[12], object.myPts);
  writer.writeLong(offsets[13], object.oReb);
  writer.writeBool(offsets[14], object.onGame);
  writer.writeLong(offsets[15], object.opponentAst);
  writer.writeLong(offsets[16], object.opponentBenchPts);
  writer.writeLong(offsets[17], object.opponentBlk);
  writer.writeLong(offsets[18], object.opponentDReb);
  writer.writeDouble(offsets[19], object.opponentFgRatio);
  writer.writeLong(offsets[20], object.opponentFga);
  writer.writeLong(offsets[21], object.opponentFgm);
  writer.writeDouble(offsets[22], object.opponentFtRatio);
  writer.writeLong(offsets[23], object.opponentFta);
  writer.writeLong(offsets[24], object.opponentFtm);
  writer.writeLong(offsets[25], object.opponentOReb);
  writer.writeLong(offsets[26], object.opponentPf);
  writer.writeLong(offsets[27], object.opponentPts);
  writer.writeLong(offsets[28], object.opponentReb);
  writer.writeLong(offsets[29], object.opponentStl);
  writer.writeLong(offsets[30], object.opponentTo);
  writer.writeDouble(offsets[31], object.opponentTpRatio);
  writer.writeLong(offsets[32], object.opponentTpa);
  writer.writeLong(offsets[33], object.opponentTpm);
  writer.writeByte(offsets[34], object.outcome.index);
  writer.writeLong(offsets[35], object.pf);
  writer.writeLong(offsets[36], object.reb);
  writer.writeLong(offsets[37], object.stl);
  writer.writeLong(offsets[38], object.to);
  writer.writeDouble(offsets[39], object.tpRatio);
  writer.writeLong(offsets[40], object.tpa);
  writer.writeLong(offsets[41], object.tpm);
  writer.writeDateTime(offsets[42], object.updatedAt);
}

Game _gameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Game();
  object.ast = reader.readLong(offsets[0]);
  object.benchPts = reader.readLong(offsets[1]);
  object.blk = reader.readLong(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.dReb = reader.readLong(offsets[4]);
  object.fgRatio = reader.readDouble(offsets[5]);
  object.fga = reader.readLong(offsets[6]);
  object.fgm = reader.readLong(offsets[7]);
  object.ftRatio = reader.readDouble(offsets[8]);
  object.fta = reader.readLong(offsets[9]);
  object.ftm = reader.readLong(offsets[10]);
  object.gameDate = reader.readDateTime(offsets[11]);
  object.id = id;
  object.myPts = reader.readLong(offsets[12]);
  object.oReb = reader.readLong(offsets[13]);
  object.onGame = reader.readBool(offsets[14]);
  object.opponentAst = reader.readLong(offsets[15]);
  object.opponentBenchPts = reader.readLong(offsets[16]);
  object.opponentBlk = reader.readLong(offsets[17]);
  object.opponentDReb = reader.readLong(offsets[18]);
  object.opponentFgRatio = reader.readDouble(offsets[19]);
  object.opponentFga = reader.readLong(offsets[20]);
  object.opponentFgm = reader.readLong(offsets[21]);
  object.opponentFtRatio = reader.readDouble(offsets[22]);
  object.opponentFta = reader.readLong(offsets[23]);
  object.opponentFtm = reader.readLong(offsets[24]);
  object.opponentOReb = reader.readLong(offsets[25]);
  object.opponentPf = reader.readLong(offsets[26]);
  object.opponentPts = reader.readLong(offsets[27]);
  object.opponentReb = reader.readLong(offsets[28]);
  object.opponentStl = reader.readLong(offsets[29]);
  object.opponentTo = reader.readLong(offsets[30]);
  object.opponentTpRatio = reader.readDouble(offsets[31]);
  object.opponentTpa = reader.readLong(offsets[32]);
  object.opponentTpm = reader.readLong(offsets[33]);
  object.outcome =
      _GameoutcomeValueEnumMap[reader.readByteOrNull(offsets[34])] ??
          Outcome.NONE;
  object.pf = reader.readLong(offsets[35]);
  object.reb = reader.readLong(offsets[36]);
  object.stl = reader.readLong(offsets[37]);
  object.to = reader.readLong(offsets[38]);
  object.tpRatio = reader.readDouble(offsets[39]);
  object.tpa = reader.readLong(offsets[40]);
  object.tpm = reader.readLong(offsets[41]);
  object.updatedAt = reader.readDateTime(offsets[42]);
  return object;
}

P _gameDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readLong(offset)) as P;
    case 25:
      return (reader.readLong(offset)) as P;
    case 26:
      return (reader.readLong(offset)) as P;
    case 27:
      return (reader.readLong(offset)) as P;
    case 28:
      return (reader.readLong(offset)) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    case 30:
      return (reader.readLong(offset)) as P;
    case 31:
      return (reader.readDouble(offset)) as P;
    case 32:
      return (reader.readLong(offset)) as P;
    case 33:
      return (reader.readLong(offset)) as P;
    case 34:
      return (_GameoutcomeValueEnumMap[reader.readByteOrNull(offset)] ??
          Outcome.NONE) as P;
    case 35:
      return (reader.readLong(offset)) as P;
    case 36:
      return (reader.readLong(offset)) as P;
    case 37:
      return (reader.readLong(offset)) as P;
    case 38:
      return (reader.readLong(offset)) as P;
    case 39:
      return (reader.readDouble(offset)) as P;
    case 40:
      return (reader.readLong(offset)) as P;
    case 41:
      return (reader.readLong(offset)) as P;
    case 42:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GameoutcomeEnumValueMap = {
  'NONE': 0,
  'WIN': 1,
  'LOSE': 2,
  'DRAW': 3,
};
const _GameoutcomeValueEnumMap = {
  0: Outcome.NONE,
  1: Outcome.WIN,
  2: Outcome.LOSE,
  3: Outcome.DRAW,
};

Id _gameGetId(Game object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameGetLinks(Game object) {
  return [object.opponent, object.boxscores, object.pbps];
}

void _gameAttach(IsarCollection<dynamic> col, Id id, Game object) {
  object.id = id;
  object.opponent.attach(col, col.isar.collection<Team>(), r'opponent', id);
  object.boxscores
      .attach(col, col.isar.collection<Boxscore>(), r'boxscores', id);
  object.pbps.attach(col, col.isar.collection<Pbp>(), r'pbps', id);
}

extension GameQueryWhereSort on QueryBuilder<Game, Game, QWhere> {
  QueryBuilder<Game, Game, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GameQueryWhere on QueryBuilder<Game, Game, QWhereClause> {
  QueryBuilder<Game, Game, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Game, Game, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterWhereClause> idBetween(
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

extension GameQueryFilter on QueryBuilder<Game, Game, QFilterCondition> {
  QueryBuilder<Game, Game, QAfterFilterCondition> astEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ast',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> astGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ast',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> astLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ast',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> astBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ast',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> benchPtsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'benchPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> benchPtsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'benchPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> benchPtsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'benchPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> benchPtsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'benchPts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> blkEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blk',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> blkGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blk',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> blkLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blk',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> blkBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blk',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dRebEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dRebGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dRebLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dRebBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dReb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgRatioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fgRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgRatioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fgRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgRatioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fgRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgRatioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fgRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fga',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fga',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fga',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fga',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fgm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fgm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fgm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> fgmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fgm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftRatioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ftRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftRatioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ftRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftRatioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ftRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftRatioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ftRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fta',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fta',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fta',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ftm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ftm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ftm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> ftmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ftm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gameDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gameDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gameDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> myPtsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> myPtsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'myPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> myPtsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'myPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> myPtsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'myPts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> oRebEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> oRebGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> oRebLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> oRebBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oReb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> onGameEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onGame',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentAstEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentAst',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentAstGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentAst',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentAstLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentAst',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentAstBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentAst',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBenchPtsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentBenchPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBenchPtsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentBenchPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBenchPtsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentBenchPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBenchPtsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentBenchPts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBlkEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentBlk',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBlkGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentBlk',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBlkLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentBlk',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentBlkBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentBlk',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentDRebEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentDReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentDRebGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentDReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentDRebLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentDReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentDRebBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentDReb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgRatioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentFgRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgRatioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentFgRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgRatioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentFgRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgRatioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentFgRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentFga',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentFga',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentFga',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentFga',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgmEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentFgm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentFgm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentFgm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFgmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentFgm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtRatioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentFtRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtRatioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentFtRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtRatioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentFtRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtRatioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentFtRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentFta',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentFta',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentFta',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentFta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtmEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentFtm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentFtm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentFtm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentFtmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentFtm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentORebEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentOReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentORebGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentOReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentORebLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentOReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentORebBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentOReb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPfEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentPf',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPfGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentPf',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPfLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentPf',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPfBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentPf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPtsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPtsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPtsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentPts',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentPtsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentPts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentRebEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentRebGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentRebLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentRebBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentReb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentStlEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentStl',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentStlGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentStl',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentStlLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentStl',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentStlBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentStl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentToEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentToGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentToLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentToBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpRatioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentTpRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpRatioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentTpRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpRatioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentTpRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpRatioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentTpRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentTpa',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentTpa',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentTpa',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentTpa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpmEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentTpm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentTpm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentTpm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentTpmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentTpm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> outcomeEqualTo(
      Outcome value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outcome',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> outcomeGreaterThan(
    Outcome value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outcome',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> outcomeLessThan(
    Outcome value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outcome',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> outcomeBetween(
    Outcome lower,
    Outcome upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outcome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pfEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pf',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pfGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pf',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pfLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pf',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pfBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> rebEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> rebGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> rebLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reb',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> rebBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> stlEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stl',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> stlGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stl',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> stlLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stl',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> stlBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> toEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> toGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> toLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> toBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'to',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpRatioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tpRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpRatioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tpRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpRatioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tpRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpRatioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tpRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tpa',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tpa',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tpa',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tpa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tpm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tpm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tpm',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> tpmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tpm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameQueryObject on QueryBuilder<Game, Game, QFilterCondition> {}

extension GameQueryLinks on QueryBuilder<Game, Game, QFilterCondition> {
  QueryBuilder<Game, Game, QAfterFilterCondition> opponent(
      FilterQuery<Team> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'opponent');
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> opponentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opponent', 0, true, 0, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> boxscores(
      FilterQuery<Boxscore> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'boxscores');
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> boxscoresLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'boxscores', length, true, length, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> boxscoresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'boxscores', 0, true, 0, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> boxscoresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'boxscores', 0, false, 999999, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> boxscoresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'boxscores', 0, true, length, include);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> boxscoresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'boxscores', length, include, 999999, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> boxscoresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'boxscores', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pbps(FilterQuery<Pbp> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'pbps');
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pbpsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pbps', length, true, length, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pbpsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pbps', 0, true, 0, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pbpsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pbps', 0, false, 999999, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pbpsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pbps', 0, true, length, include);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pbpsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pbps', length, include, 999999, true);
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pbpsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'pbps', lower, includeLower, upper, includeUpper);
    });
  }
}

extension GameQuerySortBy on QueryBuilder<Game, Game, QSortBy> {
  QueryBuilder<Game, Game, QAfterSortBy> sortByAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByAstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByBenchPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'benchPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByBenchPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'benchPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByBlkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByDRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFgRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFgaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFgmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFtRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFtmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByGameDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameDate', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByGameDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameDate', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByMyPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByMyPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByORebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOnGame() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onGame', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOnGameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onGame', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentAst', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentAstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentAst', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentBenchPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBenchPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentBenchPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBenchPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBlk', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentBlkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBlk', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentDReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentDRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentDReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFgRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFga', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFgaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFga', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFgmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFtRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFta', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFta', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentFtmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentOReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentORebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentOReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPf', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentPfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPf', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentStl', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentStlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentStl', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTo', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTo', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentTpRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpa', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentTpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpa', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOpponentTpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOutcome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByOutcomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByPfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByStlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTpRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GameQuerySortThenBy on QueryBuilder<Game, Game, QSortThenBy> {
  QueryBuilder<Game, Game, QAfterSortBy> thenByAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByAstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByBenchPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'benchPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByBenchPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'benchPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByBlkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByDRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFgRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFgaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFgmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFtRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFtmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByGameDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameDate', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByGameDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameDate', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByMyPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByMyPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByORebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOnGame() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onGame', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOnGameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onGame', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentAst', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentAstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentAst', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentBenchPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBenchPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentBenchPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBenchPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBlk', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentBlkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentBlk', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentDReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentDRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentDReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFgRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFga', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFgaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFga', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFgmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFgm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFtRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFta', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFta', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentFtmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentFtm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentOReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentORebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentOReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPf', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentPfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPf', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPts', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentPts', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentReb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentReb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentStl', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentStlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentStl', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTo', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTo', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentTpRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpa', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentTpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpa', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOpponentTpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentTpm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOutcome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByOutcomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outcome', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByPfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByStlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTpRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GameQueryWhereDistinct on QueryBuilder<Game, Game, QDistinct> {
  QueryBuilder<Game, Game, QDistinct> distinctByAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ast');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByBenchPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'benchPts');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blk');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dReb');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fgRatio');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fga');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fgm');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ftRatio');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fta');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ftm');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByGameDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gameDate');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByMyPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'myPts');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oReb');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOnGame() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onGame');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentAst');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentBenchPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentBenchPts');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentBlk');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentDReb');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentFgRatio');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentFga');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentFgm');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentFtRatio');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentFta');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentFtm');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentOReb');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentPf');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentPts');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentReb');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentStl');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentTo');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentTpRatio');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentTpa');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOpponentTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentTpm');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByOutcome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outcome');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pf');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reb');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stl');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'to');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tpRatio');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tpa');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tpm');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension GameQueryProperty on QueryBuilder<Game, Game, QQueryProperty> {
  QueryBuilder<Game, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> astProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ast');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> benchPtsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'benchPts');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> blkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blk');
    });
  }

  QueryBuilder<Game, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> dRebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dReb');
    });
  }

  QueryBuilder<Game, double, QQueryOperations> fgRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fgRatio');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> fgaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fga');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> fgmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fgm');
    });
  }

  QueryBuilder<Game, double, QQueryOperations> ftRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ftRatio');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> ftaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fta');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> ftmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ftm');
    });
  }

  QueryBuilder<Game, DateTime, QQueryOperations> gameDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameDate');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> myPtsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myPts');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> oRebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oReb');
    });
  }

  QueryBuilder<Game, bool, QQueryOperations> onGameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onGame');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentAstProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentAst');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentBenchPtsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentBenchPts');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentBlkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentBlk');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentDRebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentDReb');
    });
  }

  QueryBuilder<Game, double, QQueryOperations> opponentFgRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentFgRatio');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentFgaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentFga');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentFgmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentFgm');
    });
  }

  QueryBuilder<Game, double, QQueryOperations> opponentFtRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentFtRatio');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentFtaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentFta');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentFtmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentFtm');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentORebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentOReb');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentPfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentPf');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentPtsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentPts');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentRebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentReb');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentStlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentStl');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentTo');
    });
  }

  QueryBuilder<Game, double, QQueryOperations> opponentTpRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentTpRatio');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentTpaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentTpa');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> opponentTpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentTpm');
    });
  }

  QueryBuilder<Game, Outcome, QQueryOperations> outcomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outcome');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> pfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pf');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> rebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reb');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> stlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stl');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> toProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'to');
    });
  }

  QueryBuilder<Game, double, QQueryOperations> tpRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tpRatio');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> tpaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tpa');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> tpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tpm');
    });
  }

  QueryBuilder<Game, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
