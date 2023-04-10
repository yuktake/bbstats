// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boxscore.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBoxscoreCollection on Isar {
  IsarCollection<Boxscore> get boxscores => this.collection();
}

const BoxscoreSchema = CollectionSchema(
  name: r'Boxscore',
  id: 3985557715270277267,
  properties: {
    r'ast': PropertySchema(
      id: 0,
      name: r'ast',
      type: IsarType.long,
    ),
    r'blk': PropertySchema(
      id: 1,
      name: r'blk',
      type: IsarType.long,
    ),
    r'dReb': PropertySchema(
      id: 2,
      name: r'dReb',
      type: IsarType.long,
    ),
    r'fgRatio': PropertySchema(
      id: 3,
      name: r'fgRatio',
      type: IsarType.double,
    ),
    r'fga': PropertySchema(
      id: 4,
      name: r'fga',
      type: IsarType.long,
    ),
    r'fgm': PropertySchema(
      id: 5,
      name: r'fgm',
      type: IsarType.long,
    ),
    r'ftRatio': PropertySchema(
      id: 6,
      name: r'ftRatio',
      type: IsarType.double,
    ),
    r'fta': PropertySchema(
      id: 7,
      name: r'fta',
      type: IsarType.long,
    ),
    r'ftm': PropertySchema(
      id: 8,
      name: r'ftm',
      type: IsarType.long,
    ),
    r'oReb': PropertySchema(
      id: 9,
      name: r'oReb',
      type: IsarType.long,
    ),
    r'onCourt': PropertySchema(
      id: 10,
      name: r'onCourt',
      type: IsarType.bool,
    ),
    r'pf': PropertySchema(
      id: 11,
      name: r'pf',
      type: IsarType.long,
    ),
    r'pts': PropertySchema(
      id: 12,
      name: r'pts',
      type: IsarType.long,
    ),
    r'reb': PropertySchema(
      id: 13,
      name: r'reb',
      type: IsarType.long,
    ),
    r'starter': PropertySchema(
      id: 14,
      name: r'starter',
      type: IsarType.bool,
    ),
    r'stl': PropertySchema(
      id: 15,
      name: r'stl',
      type: IsarType.long,
    ),
    r'to': PropertySchema(
      id: 16,
      name: r'to',
      type: IsarType.long,
    ),
    r'tpRatio': PropertySchema(
      id: 17,
      name: r'tpRatio',
      type: IsarType.double,
    ),
    r'tpa': PropertySchema(
      id: 18,
      name: r'tpa',
      type: IsarType.long,
    ),
    r'tpm': PropertySchema(
      id: 19,
      name: r'tpm',
      type: IsarType.long,
    )
  },
  estimateSize: _boxscoreEstimateSize,
  serialize: _boxscoreSerialize,
  deserialize: _boxscoreDeserialize,
  deserializeProp: _boxscoreDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'player': LinkSchema(
      id: -3422415171451497206,
      name: r'player',
      target: r'Player',
      single: true,
      linkName: r'boxscores',
    ),
    r'game': LinkSchema(
      id: -5678566242401693646,
      name: r'game',
      target: r'Game',
      single: true,
      linkName: r'boxscores',
    )
  },
  embeddedSchemas: {},
  getId: _boxscoreGetId,
  getLinks: _boxscoreGetLinks,
  attach: _boxscoreAttach,
  version: '3.0.5',
);

int _boxscoreEstimateSize(
  Boxscore object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _boxscoreSerialize(
  Boxscore object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ast);
  writer.writeLong(offsets[1], object.blk);
  writer.writeLong(offsets[2], object.dReb);
  writer.writeDouble(offsets[3], object.fgRatio);
  writer.writeLong(offsets[4], object.fga);
  writer.writeLong(offsets[5], object.fgm);
  writer.writeDouble(offsets[6], object.ftRatio);
  writer.writeLong(offsets[7], object.fta);
  writer.writeLong(offsets[8], object.ftm);
  writer.writeLong(offsets[9], object.oReb);
  writer.writeBool(offsets[10], object.onCourt);
  writer.writeLong(offsets[11], object.pf);
  writer.writeLong(offsets[12], object.pts);
  writer.writeLong(offsets[13], object.reb);
  writer.writeBool(offsets[14], object.starter);
  writer.writeLong(offsets[15], object.stl);
  writer.writeLong(offsets[16], object.to);
  writer.writeDouble(offsets[17], object.tpRatio);
  writer.writeLong(offsets[18], object.tpa);
  writer.writeLong(offsets[19], object.tpm);
}

Boxscore _boxscoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Boxscore();
  object.ast = reader.readLong(offsets[0]);
  object.blk = reader.readLong(offsets[1]);
  object.dReb = reader.readLong(offsets[2]);
  object.fgRatio = reader.readDouble(offsets[3]);
  object.fga = reader.readLong(offsets[4]);
  object.fgm = reader.readLong(offsets[5]);
  object.ftRatio = reader.readDouble(offsets[6]);
  object.fta = reader.readLong(offsets[7]);
  object.ftm = reader.readLong(offsets[8]);
  object.id = id;
  object.oReb = reader.readLong(offsets[9]);
  object.onCourt = reader.readBool(offsets[10]);
  object.pf = reader.readLong(offsets[11]);
  object.pts = reader.readLong(offsets[12]);
  object.reb = reader.readLong(offsets[13]);
  object.starter = reader.readBool(offsets[14]);
  object.stl = reader.readLong(offsets[15]);
  object.to = reader.readLong(offsets[16]);
  object.tpRatio = reader.readDouble(offsets[17]);
  object.tpa = reader.readLong(offsets[18]);
  object.tpm = reader.readLong(offsets[19]);
  return object;
}

P _boxscoreDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
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
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _boxscoreGetId(Boxscore object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _boxscoreGetLinks(Boxscore object) {
  return [object.player, object.game];
}

void _boxscoreAttach(IsarCollection<dynamic> col, Id id, Boxscore object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
  object.game.attach(col, col.isar.collection<Game>(), r'game', id);
}

extension BoxscoreQueryWhereSort on QueryBuilder<Boxscore, Boxscore, QWhere> {
  QueryBuilder<Boxscore, Boxscore, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BoxscoreQueryWhere on QueryBuilder<Boxscore, Boxscore, QWhereClause> {
  QueryBuilder<Boxscore, Boxscore, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Boxscore, Boxscore, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterWhereClause> idBetween(
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

extension BoxscoreQueryFilter
    on QueryBuilder<Boxscore, Boxscore, QFilterCondition> {
  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> astEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ast',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> astGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> astLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> astBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> blkEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blk',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> blkGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> blkLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> blkBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> dRebEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> dRebGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> dRebLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> dRebBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgRatioEqualTo(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgRatioGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgRatioLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgRatioBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fga',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgaGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgaLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgaBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgmEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fgm',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgmGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgmLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> fgmBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftRatioEqualTo(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftRatioGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftRatioLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftRatioBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fta',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftaGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftaLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftaBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftmEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ftm',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftmGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftmLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ftmBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> oRebEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oReb',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> oRebGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> oRebLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> oRebBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> onCourtEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onCourt',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> pfEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pf',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> pfGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> pfLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> pfBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ptsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ptsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ptsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> ptsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> rebEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reb',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> rebGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> rebLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> rebBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> starterEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'starter',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> stlEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stl',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> stlGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> stlLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> stlBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> toEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> toGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> toLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> toBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpRatioEqualTo(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpRatioGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpRatioLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpRatioBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tpa',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpaGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpaLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpaBetween(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpmEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tpm',
        value: value,
      ));
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpmGreaterThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpmLessThan(
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

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> tpmBetween(
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
}

extension BoxscoreQueryObject
    on QueryBuilder<Boxscore, Boxscore, QFilterCondition> {}

extension BoxscoreQueryLinks
    on QueryBuilder<Boxscore, Boxscore, QFilterCondition> {
  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> game(
      FilterQuery<Game> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'game');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> gameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'game', 0, true, 0, true);
    });
  }
}

extension BoxscoreQuerySortBy on QueryBuilder<Boxscore, Boxscore, QSortBy> {
  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByAstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByBlkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByDRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFgRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFgaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFgmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFtRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByFtmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByORebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByOnCourt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onCourt', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByOnCourtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onCourt', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByPfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByStarter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starter', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByStarterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starter', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByStlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByTpRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByTpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> sortByTpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.desc);
    });
  }
}

extension BoxscoreQuerySortThenBy
    on QueryBuilder<Boxscore, Boxscore, QSortThenBy> {
  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByAstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ast', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByBlkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blk', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByDRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dReb', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFgRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgRatio', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFgaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fga', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFgmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fgm', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFtRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftRatio', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fta', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByFtmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ftm', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByORebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oReb', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByOnCourt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onCourt', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByOnCourtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onCourt', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByPfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pf', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByPtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByRebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reb', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByStarter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starter', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByStarterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starter', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByStlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stl', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByTpRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpRatio', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByTpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpa', Sort.desc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.asc);
    });
  }

  QueryBuilder<Boxscore, Boxscore, QAfterSortBy> thenByTpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tpm', Sort.desc);
    });
  }
}

extension BoxscoreQueryWhereDistinct
    on QueryBuilder<Boxscore, Boxscore, QDistinct> {
  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByAst() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ast');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByBlk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blk');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByDReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dReb');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByFgRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fgRatio');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByFga() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fga');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByFgm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fgm');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByFtRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ftRatio');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByFta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fta');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByFtm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ftm');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByOReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oReb');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByOnCourt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onCourt');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByPf() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pf');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByPts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByReb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reb');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByStarter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'starter');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByStl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stl');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'to');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByTpRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tpRatio');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByTpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tpa');
    });
  }

  QueryBuilder<Boxscore, Boxscore, QDistinct> distinctByTpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tpm');
    });
  }
}

extension BoxscoreQueryProperty
    on QueryBuilder<Boxscore, Boxscore, QQueryProperty> {
  QueryBuilder<Boxscore, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> astProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ast');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> blkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blk');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> dRebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dReb');
    });
  }

  QueryBuilder<Boxscore, double, QQueryOperations> fgRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fgRatio');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> fgaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fga');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> fgmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fgm');
    });
  }

  QueryBuilder<Boxscore, double, QQueryOperations> ftRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ftRatio');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> ftaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fta');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> ftmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ftm');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> oRebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oReb');
    });
  }

  QueryBuilder<Boxscore, bool, QQueryOperations> onCourtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onCourt');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> pfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pf');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> ptsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> rebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reb');
    });
  }

  QueryBuilder<Boxscore, bool, QQueryOperations> starterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'starter');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> stlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stl');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> toProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'to');
    });
  }

  QueryBuilder<Boxscore, double, QQueryOperations> tpRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tpRatio');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> tpaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tpa');
    });
  }

  QueryBuilder<Boxscore, int, QQueryOperations> tpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tpm');
    });
  }
}
