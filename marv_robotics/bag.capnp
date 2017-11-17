@0xca58624d56a7cca8;

using import "/marv_pycapnp/types.capnp".Timedelta;
using import "/marv_pycapnp/types.capnp".Timestamp;

struct Bagmeta {
  bags @0 :List(Bag);
  startTime @1 :Timestamp;
  endTime @2 :Timestamp;
  duration @3 :Timedelta;
  msgCount @4 :UInt64;
  msgTypes @5 :List(MsgType);
  topics @6 :List(Topic);
}

struct Bag {
  startTime @0 :UInt64;
  endTime @1 :UInt64;
  duration @2 :UInt64;
  msgCount @3 :UInt64;
  msgTypes @4 :List(MsgType);
  topics @5 :List(Topic);
  version @6 :UInt16;
}

struct MsgType {
  name @0 :Text;
  md5sum @1 :Text;
  msgDef @2 :Text;
}

struct Topic {
  name @0 :Text;
  msgCount @1 :UInt64;
  msgType @2 :Text;
  latching @3 :Bool;
}

struct Header {
  msgTypes @0 :List(MsgType);
  topics @1 :List(Topic);
}

struct Message {
  tidx @0 :UInt32;
  # Message belongs to topic with tidx within header.topics list

  data @1 :Data;
  # Serialized message data

  timestamp @2 :Timestamp;
}


