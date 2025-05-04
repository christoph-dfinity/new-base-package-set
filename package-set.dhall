[ { name = "ovs-ledger"
  , repo = "https://github.com/icdevsorg/ovs-ledger"
  , version = "0.0.1"
  , dependencies =
        [ "base"
        , "ic-certification"
        , "icrc1-mo"
        , "icrc2-mo"
        , "icrc3-mo"
        , "icrc4-mo"
        , "icrc75-mo"
        , "stable-write-only"
        , "sha2"
        , "candy"
        , "stableheapbtreemap"
        , "principal-ext"
        , "timer-tool"
        ]
      : List Text
  }
, { name = "nm"
  , repo = "https://github.com/dr-montasir/nm"
  , version = "1.1.1"
  , dependencies = [] : List Text
  }
, { name = "time"
  , repo = "https://github.com/ArielRobotti/time"
  , version = "1.0.7"
  , dependencies = [ "base" ] : List Text
  }
, { name = "tweetnacl"
  , repo = "https://github.com/nirvana369/tweetnacl/"
  , version = "1.1.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "xtended-numbers"
  , repo = "https://github.com/edjCase/motoko_numbers"
  , version = "0.4.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "jwt"
  , repo = "https://github.com/edjcase/motoko_jwt"
  , version = "0.2.0"
  , dependencies =
        [ "base"
        , "new-base"
        , "json"
        , "base-x-encoder"
        , "hmac"
        , "ecdsa"
        , "sha2"
        , "rsa"
        , "eddsa"
        ]
      : List Text
  }
, { name = "concurrent"
  , repo = "https://github.com/vporton/ic-concurrent"
  , version = "0.1.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "icrc-fungible"
  , repo = "https://github.com/PanIndustrial-Org/ICRC_fungible"
  , version = "0.0.5"
  , dependencies =
        [ "base"
        , "ic-certification"
        , "icrc1-mo"
        , "icrc2-mo"
        , "icrc3-mo"
        , "icrc4-mo"
        ]
      : List Text
  }
, { name = "test"
  , repo = "https://github.com/ZenVoich/test"
  , version = "2.1.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "math"
  , repo = "https://github.com/ArielRobotti/math"
  , version = "1.0.3"
  , dependencies = [ "base" ] : List Text
  }
, { name = "ecdsa"
  , repo = "https://github.com/edjCase/motoko_ecdsa"
  , version = "5.0.1"
  , dependencies =
      [ "sha2", "asn1", "xtended-numbers", "base-x-encoder" ] : List Text
  }
, { name = "assets"
  , repo = "https://github.com/krpeacock/assets"
  , version = "0.2.2"
  , dependencies = [ "test" ] : List Text
  }
, { name = "server"
  , repo = "https://github.com/krpeacock/server"
  , version = "1.0.0"
  , dependencies =
        [ "certified-cache", "test", "base", "assets", "http-parser", "serde" ]
      : List Text
  }
, { name = "certified-cache"
  , repo = "https://github.com/krpeacock/certified-cache"
  , version = "0.3.0"
  , dependencies =
      [ "base", "ic-certification", "StableHashMap", "sha2" ] : List Text
  }
, { name = "glob"
  , repo = "https://github.com/edjcase/motoko_glob"
  , version = "0.0.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "random"
  , repo = "https://github.com/ArielRobotti/random"
  , version = "1.0.2"
  , dependencies = [] : List Text
  }
, { name = "tecdsa"
  , repo = "https://github.com/bittoko/tecdsa"
  , version = "0.0.4"
  , dependencies =
      [ "test", "sha2", "base", "utilities", "stable-buffer" ] : List Text
  }
, { name = "account"
  , repo = "https://github.com/letmejustputthishere/account"
  , version = "1.0.1"
  , dependencies = [ "array", "base", "itertools" ] : List Text
  }
, { name = "liminal"
  , repo = "https://github.com/edjcase/liminal"
  , version = "0.0.1"
  , dependencies =
        [ "new-base"
        , "itertools"
        , "xtended-text"
        , "xtended-numbers"
        , "certified-assets"
        , "http-assets"
        , "asn1"
        , "json"
        , "jwt"
        , "compression"
        , "serde"
        , "xml"
        ]
      : List Text
  }
, { name = "icrc4-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc4.mo"
  , version = "0.0.5"
  , dependencies =
        [ "base"
        , "array"
        , "StableTrieMap"
        , "StableBuffer"
        , "map"
        , "itertools"
        , "vector"
        , "star"
        , "rep-indy-hash"
        , "account"
        , "icrc1-mo"
        ]
      : List Text
  }
, { name = "xrc-types"
  , repo = "https://github.com/ZenVoich/xrc-types"
  , version = "1.0.0"
  , dependencies = [] : List Text
  }
, { name = "make-rules"
  , repo = "https://github.com/vporton/icp-make-rules"
  , version = "0.0.3"
  , dependencies = [] : List Text
  }
, { name = "stable-enum"
  , repo = "https://github.com/bittoko/stable-enum"
  , version = "1.0.0"
  , dependencies = [ "base", "stable-buffer" ] : List Text
  }
, { name = "random-class"
  , repo = "https://github.com/ArielRobotti/RandomClass"
  , version = "1.0.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "stablehashmap"
  , repo = "https://github.com/canscale/StableHashMap"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "base-x-encoder"
  , repo = "https://github.com/edjcase/motoko_base_x"
  , version = "0.0.1"
  , dependencies = [ "new-base", "base" ] : List Text
  }
, { name = "fuzz"
  , repo = "https://github.com/ZenVoich/fuzz"
  , version = "0.2.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "prng"
  , repo = "https://github.com/research-ag/prng"
  , version = "0.0.5"
  , dependencies = [ "base" ] : List Text
  }
, { name = "hash"
  , repo = "https://github.com/aviate-labs/hash.mo"
  , version = "1.0.0"
  , dependencies = [ "base", "array" ] : List Text
  }
, { name = "sha2"
  , repo = "https://github.com/research-ag/sha2"
  , version = "0.1.4"
  , dependencies = [ "base" ] : List Text
  }
, { name = "serde"
  , repo = "https://github.com/NatLabs/serde"
  , version = "3.2.2"
  , dependencies =
        [ "base"
        , "itertools"
        , "candid"
        , "xtended-numbers"
        , "json-float"
        , "parser-combinators"
        , "cbor"
        , "map"
        , "sha2"
        ]
      : List Text
  }
, { name = "neuro"
  , repo = "https://github.com/jesssekeogh/neuro"
  , version = "0.7.5"
  , dependencies = [ "sha2", "encoding", "account-identifier" ] : List Text
  }
, { name = "bench"
  , repo = "https://github.com/ZenVoich/bench"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "icrc1"
  , repo = "https://github.com/NatLabs/icrc1"
  , version = "0.0.2"
  , dependencies =
        [ "base", "array", "StableTrieMap", "StableBuffer", "itertools" ]
      : List Text
  }
, { name = "csprng"
  , repo = "https://github.com/temokoki/IC_CSPRNG"
  , version = "1.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "stream"
  , repo = "https://github.com/research-ag/stream"
  , version = "0.0.1"
  , dependencies = [ "base", "swb", "vector", "promtracker" ] : List Text
  }
, { name = "icrc-84"
  , repo = "https://github.com/research-ag/icrc-84"
  , version = "0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "icrc1-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc1.mo"
  , version = "0.0.15"
  , dependencies =
        [ "base"
        , "array"
        , "StableTrieMap"
        , "StableBuffer"
        , "map"
        , "itertools"
        , "vector"
        , "star"
        , "rep-indy-hash"
        , "account"
        ]
      : List Text
  }
, { name = "lrucache"
  , repo = "https://github.com/Demali-876/lru-cache"
  , version = "1.0.3"
  , dependencies = [ "base" ] : List Text
  }
, { name = "icrc2-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc2.mo"
  , version = "0.0.13"
  , dependencies =
        [ "base"
        , "array"
        , "StableTrieMap"
        , "StableBuffer"
        , "map"
        , "itertools"
        , "vector"
        , "star"
        , "rep-indy-hash"
        , "account"
        , "icrc1-mo"
        ]
      : List Text
  }
, { name = "new-candb"
  , repo = "https://github.com/ORIGYN-SA/CanDB/tree/main"
  , version = "1.0.0"
  , dependencies =
        [ "base"
        , "stable-hash-map"
        , "stable-rbtree"
        , "stable-buffer"
        , "json"
        , "crypto"
        , "array"
        , "encoding"
        ]
      : List Text
  }
, { name = "bitbuffer"
  , repo = "https://github.com/NatLabs/BitBuffer"
  , version = "1.2.0"
  , dependencies = [ "base", "buffer-deque" ] : List Text
  }
, { name = "icrc2-types"
  , repo = "https://github.com/ZenVoich/icrc2-types"
  , version = "1.1.0"
  , dependencies = [] : List Text
  }
, { name = "icrc1-types"
  , repo = "https://github.com/ZenVoich/icrc1-types"
  , version = "1.0.0"
  , dependencies = [] : List Text
  }
, { name = "http-assets"
  , repo = "https://github.com/edjcase/ic-assets"
  , version = "0.0.6"
  , dependencies =
        [ "base"
        , "http-types"
        , "map"
        , "certified-assets"
        , "ic"
        , "itertools"
        , "vector"
        , "encoding"
        , "http-parser"
        , "sha2"
        , "memory-region"
        ]
      : List Text
  }
, { name = "time-consts"
  , repo = "https://github.com/ZenVoich/time-consts"
  , version = "1.0.1"
  , dependencies = [] : List Text
  }
, { name = "icrc2-batch"
  , repo = "https://github.com/MemeFighterCo/icrc2-batch"
  , version = "1.0.1"
  , dependencies = [ "testing", "base" ] : List Text
  }
, { name = "promtracker"
  , repo = "https://github.com/research-ag/promtracker"
  , version = "0.5.4"
  , dependencies = [ "base", "vector" ] : List Text
  }
, { name = "buffer-deque"
  , repo = "https://github.com/NatLabs/BufferDeque"
  , version = "0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "ledger-types"
  , repo = "https://github.com/ZenVoich/ledger-types"
  , version = "1.0.0"
  , dependencies = [] : List Text
  }
, { name = "token-handler"
  , repo = "https://github.com/research-ag/token-handler"
  , version = "0.0.4"
  , dependencies = [ "base", "icrc-84" ] : List Text
  }
, { name = "memory-buffer"
  , repo = "https://github.com/NatLabs/memory-buffer"
  , version = "0.1.0"
  , dependencies = [ "base", "itertools", "memory-region" ] : List Text
  }
, { name = "nacdb-reorder"
  , repo = "https://github.com/vporton/nacdb-reorder"
  , version = "3.2.1"
  , dependencies =
        [ "base"
        , "nacdb"
        , "StableBuffer"
        , "map"
        , "stableheapbtreemap"
        , "itertools"
        , "xtended-numbers"
        ]
      : List Text
  }
, { name = "stable-buffer"
  , repo = "https://github.com/bittoko/stable-buffer"
  , version = "1.0.1"
  , dependencies = [ "base", "test" ] : List Text
  }
, { name = "memory-region"
  , repo = "https://github.com/NatLabs/memory-region"
  , version = "1.2.4"
  , dependencies =
        [ "base", "itertools", "stableheapbtreemap", "map", "augmented-btrees" ]
      : List Text
  }
, { name = "ckbtc-address"
  , repo = "https://github.com/research-ag/ckbtc-address"
  , version = "0.0.1"
  , dependencies = [ "base", "bitcoin" ] : List Text
  }
, { name = "passport-client"
  , repo = "https://github.com/vporton/passport-client-dfinity"
  , version = "0.4.9"
  , dependencies =
        [ "base"
        , "sequence"
        , "candb"
        , "candb-multi"
        , "stable-buffer"
        , "StableBuffer"
        , "date.mo"
        , "motoko-sequence"
        , "json.mo"
        ]
      : List Text
  }
, { name = "af-role-rotator"
  , repo = "https://github.com/icdevsorg/af-role-rotator"
  , version = "0.0.1"
  , dependencies =
        [ "base"
        , "map"
        , "vector"
        , "star"
        , "account"
        , "icrc3-mo"
        , "icrc10-mo"
        , "xtended-random"
        , "icrc75-mo"
        , "ic-certification"
        , "timer-tool"
        , "ovs-fixed"
        , "candy"
        , "icrc1-mo"
        , "stableheapbtreemap"
        , "icrc104-mo"
        ]
      : List Text
  }
, { name = "augmented-btrees"
  , repo = "https://github.com/NatLabs/augmented-btrees"
  , version = "0.5.2"
  , dependencies = [ "base", "buffer-deque", "itertools" ] : List Text
  }
, { name = "memory-hashtable"
  , repo = "https://github.com/fGhost713/memory-HashTable"
  , version = "1.0.5"
  , dependencies =
        [ "base"
        , "memory-region"
        , "StableTrieMap"
        , "itertools"
        , "test"
        , "memory-buffer"
        ]
      : List Text
  }
, { name = "memory-collection"
  , repo = "https://github.com/NatLabs/memory-collection"
  , version = "0.0.4"
  , dependencies =
        [ "base"
        , "itertools"
        , "memory-region"
        , "buffer-deque"
        , "memory-collection"
        ]
      : List Text
  }
, { name = "account-identifier"
  , repo = "https://github.com/letmejustputthishere/account-identifiers"
  , version = "1.0.2"
  , dependencies = [ "sha2", "hash" ] : List Text
  }
, { name = "stableheapbtreemap"
  , repo = "https://github.com/canscale/StableHeapBTreeMap"
  , version = "1.5.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "dao-proposal-engine"
  , repo = "https://github.com/edjcase/motoko_proposal_engine"
  , version = "0.1.3"
  , dependencies = [ "base", "itertools" ] : List Text
  }
, { name = "swb"
  , repo = "https://github.com/research-ag/swb"
  , version = "1.2.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "ekvm"
  , repo = "https://github.com/BarFTW/Ekvm"
  , version = "0.1.0"
  , dependencies = [ "stableheapbtreemap", "base" ] : List Text
  }
, { name = "asn1"
  , repo = "https://github.com/edjcase/motoko_asn1"
  , version = "2.0.2"
  , dependencies =
      [ "base", "new-base", "itertools", "xtended-numbers" ] : List Text
  }
, { name = "sha3"
  , repo = "https://github.com/hanbu97/motoko-sha3"
  , version = "0.1.1"
  , dependencies = [ "base", "iterext" ] : List Text
  }
, { name = "json"
  , repo = "https://github.com/Demali-876/json"
  , version = "1.1.1"
  , dependencies = [ "xtended-numbers" ] : List Text
  }
, { name = "regex"
  , repo = "https://github.com/Demali-876/motoko_regex_engine"
  , version = "2.7.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "geecs"
  , repo = "https://github.com/jneums/geecs"
  , version = "1.0.0"
  , dependencies = [ "base", "stable-hash-map", "vector" ] : List Text
  }
, { name = "vector"
  , repo = "https://github.com/research-ag/vector"
  , version = "0.4.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "base64"
  , repo = "https://github.com/nirvana369/base64"
  , version = "1.0.0"
  , dependencies = [ "test", "bench" ] : List Text
  }
, { name = "backup"
  , repo = "https://github.com/ZenVoich/backup"
  , version = "3.0.0"
  , dependencies =
        [ "base"
        , "map"
        , "linked-list"
        , "http-types"
        , "motoko-datetime"
        , "memory-region"
        ]
      : List Text
  }
, { name = "deflate"
  , repo = "https://github.com/NatLabs/deflate.mo"
  , version = "0.1.0"
  , dependencies =
        [ "base"
        , "itertools"
        , "circular-buffer"
        , "bitbuffer"
        , "hash"
        , "buffer-deque"
        , "array"
        ]
      : List Text
  }
, { name = "rechain"
  , repo = "https://github.com/neutrinomic/rechain"
  , version = "1.1.5"
  , dependencies =
        [ "base"
        , "map"
        , "sha2"
        , "vector"
        , "rep-indy-hash"
        , "stable-write-only"
        , "swbstable"
        , "itertools"
        , "ic-certification"
        , "mosup"
        ]
      : List Text
  }
, { name = "hash-map"
  , repo = "https://github.com/fury02/stable-hash-map"
  , version = "0.0.2"
  , dependencies = [] : List Text
  }
, { name = "datetime"
  , repo = "https://github.com/edjcase/motoko_datetime"
  , version = "0.3.0"
  , dependencies = [ "base", "xtended-text" ] : List Text
  }
, { name = "generics"
  , repo = "https://github.com/research-ag/generics"
  , version = "0.0.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "swbstable"
  , repo = "https://github.com/infu/swb"
  , version = "1.1.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "utilities"
  , repo = "https://github.com/bittoko/utils"
  , version = "2.0.2"
  , dependencies = [ "test", "xtended-numbers", "base", "map" ] : List Text
  }
, { name = "ic-assets"
  , repo = "https://github.com/NatLabs/ic-assets"
  , version = "0.1.0"
  , dependencies =
        [ "base"
        , "http-types"
        , "map"
        , "certified-assets"
        , "ic"
        , "itertools"
        , "vector"
        , "encoding"
        , "http-parser"
        , "sha2"
        ]
      : List Text
  }
, { name = "date-time"
  , repo = "https://github.com/toshakparmar/date-time-motoko"
  , version = "1.0.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "async-test"
  , repo = "https://github.com/research-ag/async-test"
  , version = "0.0.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "icrc104-mo"
  , repo = "https://github.com/icdevsorg/icrc104.mo"
  , version = "0.0.1"
  , dependencies =
        [ "base"
        , "vector"
        , "star"
        , "account"
        , "icrc3-mo"
        , "map"
        , "ic-certification"
        , "timer-tool"
        , "ovs-fixed"
        , "candy"
        , "icrc1-mo"
        , "icrc10-mo"
        , "icrc75-mo"
        ]
      : List Text
  }
, { name = "http-types"
  , repo = "https://github.com/ZenVoich/http-types"
  , version = "1.0.1"
  , dependencies = [] : List Text
  }
, { name = "candb-multi"
  , repo = "https://github.com/vporton/candb-multi"
  , version = "0.11.8"
  , dependencies =
      [ "candb", "stable-rbtree", "StableBuffer", "base" ] : List Text
  }
, { name = "ordered-map"
  , repo = "https://github.com/vporton/ordered-map.mo"
  , version = "0.2.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "compression"
  , repo = "https://github.com/edjcase/motoko_compression"
  , version = "0.2.0"
  , dependencies =
        [ "base"
        , "itertools"
        , "circular-buffer"
        , "bitbuffer"
        , "buffer-deque"
        , "test"
        ]
      : List Text
  }
, { name = "file-uploader"
  , repo = "https://github.com/ArielRobotti/file-uploader"
  , version = "1.0.2"
  , dependencies = [ "map" ] : List Text
  }
, { name = "cycles-simple"
  , repo = "https://github.com/vporton/cycles-simple"
  , version = "0.11.4"
  , dependencies = [ "stablehashmap", "base" ] : List Text
  }
, { name = "football-types"
  , repo = "https://github.com/JohnNixon6972/FootballTypes"
  , version = "1.0.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "stable-hash-map"
  , repo = "https://github.com/fury02/stable-hash-map"
  , version = "0.0.1"
  , dependencies = [] : List Text
  }
, { name = "circular-buffer"
  , repo = "https://github.com/NatLabs/CircularBuffer"
  , version = "0.0.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "openchat-bot-sdk"
  , repo = "https://github.com/open-chat-labs/open-chat-bots"
  , version = "0.2.1"
  , dependencies =
        [ "base"
        , "base64"
        , "ecdsa"
        , "http-types"
        , "http-parser"
        , "itertools"
        , "json"
        , "jwt"
        ]
      : List Text
  }
, { name = "ic-websocket-cdk"
  , repo = "https://github.com/omnia-network/ic-websocket-cdk-mo"
  , version = "0.4.1"
  , dependencies = [ "ic-certification", "sha2", "cbor", "base" ] : List Text
  }
, { name = "devefi-jes1-snsneuron"
  , repo = "https://github.com/jesssekeogh/devefi_jes1_snsneuron"
  , version = "0.1.3"
  , dependencies = [ "base", "map", "neuro" ] : List Text
  }
, { name = "devefi-jes1-icpneuron"
  , repo = "https://github.com/jesssekeogh/devefi_jes1_icpneuron"
  , version = "0.2.3"
  , dependencies = [ "base", "neuro", "map" ] : List Text
  }
, { name = "ic"
  , repo = "https://github.com/ZenVoich/ic"
  , version = "2.0.0"
  , dependencies = [] : List Text
  }
, { name = "llm"
  , repo = "https://github.com/dfinity/llm"
  , version = "1.2.0"
  , dependencies = [] : List Text
  }
, { name = "rsa"
  , repo = "https://github.com/edjcase/motoko_rsa"
  , version = "0.0.2"
  , dependencies =
        [ "base"
        , "new-base"
        , "base-x-encoder"
        , "itertools"
        , "asn1"
        , "sha2"
        , "xtended-numbers"
        ]
      : List Text
  }
, { name = "splay"
  , repo = "https://github.com/chenyan2002/motoko-splay"
  , version = "0.1.0"
  , dependencies = [] : List Text
  }
, { name = "noise"
  , repo = "https://github.com/jneums/noise"
  , version = "0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "icrc45"
  , repo = "https://github.com/Neutrinomic/icrc45.mo"
  , version = "0.1.0"
  , dependencies = [ "base", "vector" ] : List Text
  }
, { name = "auction"
  , repo = "https://github.com/research-ag/auction"
  , version = "3.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "ed25519"
  , repo = "https://github.com/imsk17/ed25519"
  , version = "0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "testpkg"
  , repo = "https://github.com/dr-montasir/testpkg"
  , version = "1.0.1"
  , dependencies = [] : List Text
  }
, { name = "bit-map"
  , repo = "https://github.com/NatLabs/BitMap"
  , version = "0.1.2"
  , dependencies =
      [ "base", "map", "itertools", "augmented-btrees" ] : List Text
  }
, { name = "icrc3-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc3.mo"
  , version = "0.3.0"
  , dependencies =
        [ "base"
        , "stable-write-only"
        , "map"
        , "vector"
        , "sha2"
        , "rep-indy-hash"
        , "ic-certification"
        , "class-plus"
        ]
      : List Text
  }
, { name = "icrc10-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc10.mo"
  , version = "0.0.1"
  , dependencies = [ "base", "map" ] : List Text
  }
, { name = "lru-cache"
  , repo = "https://github.com/NatLabs/lru-cache"
  , version = "1.0.0"
  , dependencies = [ "base", "map", "linked-list" ] : List Text
  }
, { name = "icrc75-mo"
  , repo = "https://github.com/icdevsorg/icrc75.mo"
  , version = "0.2.0"
  , dependencies =
        [ "map"
        , "map"
        , "vector"
        , "star"
        , "icrc1-mo"
        , "candy"
        , "stableheapbtreemap"
        , "ovs-fixed"
        , "timer-tool"
        , "ic-certification"
        , "rep-indy-hash"
        , "class-plus"
        , "base"
        ]
      : List Text
  }
, { name = "class-plus"
  , repo = "https://github.com/icdevsorg/class-plus"
  , version = "0.0.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "motoko-crc"
  , repo = "https://github.com/stephenandrews/motoko-crc/tree/master"
  , version = "1.0.0"
  , dependencies = [] : List Text
  }
, { name = "assets-api"
  , repo = "https://github.com/vporton/assets_api.mo"
  , version = "1.0.1"
  , dependencies = [] : List Text
  }
, { name = "linked-list"
  , repo = "https://github.com/NatLabs/linked-list"
  , version = "0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "rbac-motoko"
  , repo = "https://github.com/fury02/rbac-motoko"
  , version = "0.1.3"
  , dependencies =
        [ "base", "map", "time-consts", "fuzz", "certified-cache", "serde" ]
      : List Text
  }
, { name = "http-loopback"
  , repo = "https://github.com/bittoko/http-loopback"
  , version = "0.2.1"
  , dependencies =
        [ "base"
        , "cbor"
        , "map"
        , "rep-indy-hash"
        , "test"
        , "xtended-numbers"
        , "sha2"
        , "utilities"
        , "tecdsa"
        ]
      : List Text
  }
, { name = "xtended-random"
  , repo = "https://github.com/edjcase/motoko_random"
  , version = "1.0.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "memory-hashlist"
  , repo = "https://github.com/fGhost713/Memory-HashList"
  , version = "2.0.0"
  , dependencies =
        [ "base"
        , "memory-region"
        , "StableTrieMap"
        , "itertools"
        , "test"
        , "memory-buffer"
        , "vector"
        , "fuzz"
        , "bench"
        ]
      : List Text
  }
, { name = "certified-assets"
  , repo = "https://github.com/NatLabs/certified-assets"
  , version = "0.5.1"
  , dependencies =
        [ "base"
        , "ic-certification"
        , "sha2"
        , "http-parser"
        , "http-types"
        , "encoding"
        , "serde"
        , "map"
        , "vector"
        ]
      : List Text
  }
, { name = "bitcoin-address-utils"
  , repo = "https://github.com/Universelle-io/bitcoin-address-utils"
  , version = "1.0.6"
  , dependencies = [ "bitcoin", "sha2", "base16" ] : List Text
  }
, { name = "maf"
  , repo = "https://github.com/fury02/async-data-deliveries"
  , version = "0.0.29"
  , dependencies = [ "base", "fuzz", "stable-hash-map" ] : List Text
  }
, { name = "mal"
  , repo = "https://github.com/fury02/async-data-deliveries"
  , version = "0.0.26"
  , dependencies = [ "base", "fuzz", "stable-hash-map" ] : List Text
  }
, { name = "hmac"
  , repo = "https://github.com/edjCase/motoko_hmac"
  , version = "0.0.1"
  , dependencies = [ "sha2" ] : List Text
  }
, { name = "cbor"
  , repo = "https://github.com/edjcase/motoko_cbor"
  , version = "1.0.0"
  , dependencies = [ "base", "xtended-numbers" ] : List Text
  }
, { name = "nacdb"
  , repo = "https://github.com/vporton/NacDB"
  , version = "0.14.3"
  , dependencies =
        [ "base"
        , "stable-rbtree"
        , "stable-buffer"
        , "prng"
        , "stableheapbtreemap"
        , "sha2"
        , "cycles-simple"
        , "StableBuffer"
        ]
      : List Text
  }
, { name = "web-io"
  , repo = "https://github.com/NatLabs/web-io"
  , version = "0.0.1"
  , dependencies =
        [ "base"
        , "itertools"
        , "serde"
        , "http"
        , "moh"
        , "parser-combinators"
        , "encoding"
        , "fuzz"
        ]
      : List Text
  }
, { name = "base16"
  , repo = "https://github.com/diodechain/motoko_base16"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "web-api"
  , repo = "https://github.com/NatLabs/web-io"
  , version = "0.0.1"
  , dependencies =
        [ "base"
        , "itertools"
        , "serde"
        , "http"
        , "moh"
        , "parser-combinators"
        , "encoding"
        , "fuzz"
        ]
      : List Text
  }
, { name = "ovs-fixed"
  , repo = "https://github.com/icdevsorg/ovs-fixed"
  , version = "0.1.4"
  , dependencies = [ "base", "star", "map" ] : List Text
  }
, { name = "simplemath"
  , repo = "https://github.com/sam-thetutor/simpleMath"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "enumeration"
  , repo = "https://github.com/research-ag/enumeration"
  , version = "0.1.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "stable-trie"
  , repo = "https://github.com/research-ag/stable-trie"
  , version = "0.0.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "http-server"
  , repo = "https://github.com/sazalo101/http-server"
  , version = "1.0.2"
  , dependencies = [ "base", "http-server" ] : List Text
  }
, { name = "rep-indy-hash"
  , repo = "https://github.com/skilesare/RepIndyHash.mo"
  , version = "0.1.1"
  , dependencies =
        [ "base", "vector", "sha2", "encoding", "array", "xtended-numbers" ]
      : List Text
  }
, { name = "waterway-mops"
  , repo = "https://github.com/jamesbeadle/waterway-mops"
  , version = "2.8.9"
  , dependencies = [ "base" ] : List Text
  }
, { name = "idempotency-keys"
  , repo = "https://github.com/Demali-876/idempotency-keys"
  , version = "1.0.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "xml"
  , repo = "https://github.com/edjcase/motoko_xml"
  , version = "1.0.0"
  , dependencies = [ "base", "xtended-numbers", "xtended-text" ] : List Text
  }
, { name = "base"
  , repo = "https://github.com/dfinity/motoko-base"
  , version = "moc-0.14.9"
  , dependencies = [] : List Text
  }
, { name = "uuid"
  , repo = "https://github.com/aviate-labs/uuid.mo"
  , version = "1.0.0"
  , dependencies = [ "base", "encoding", "io" ] : List Text
  }
, { name = "candid"
  , repo = "https://github.com/edjcase/motoko_candid"
  , version = "1.1.1"
  , dependencies = [ "base", "xtended-numbers" ] : List Text
  }
, { name = "simplem"
  , repo = "https://github.com/sam-thetutor/mopsTestPackage"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "bitcoin"
  , repo = "https://github.com/dfinity/motoko-bitcoin"
  , version = "0.1.1"
  , dependencies = [ "base", "sha2" ] : List Text
  }
, { name = "testpack"
  , repo = "https://github.com/sam-thetutor/mopspackage"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "icrc7-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc7.mo"
  , version = "0.5.0"
  , dependencies =
        [ "base"
        , "base"
        , "map"
        , "candy"
        , "StableBuffer"
        , "StableBuffer"
        , "encoding"
        , "vector"
        , "rep-indy-hash"
        , "class-plus"
        ]
      : List Text
  }
, { name = "new-base"
  , repo = "https://github.com/dfinity/new-motoko-base"
  , version = "0.4.0"
  , dependencies = [] : List Text
  }
, { name = "icrc30-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc30.mo"
  , version = "0.3.1"
  , dependencies =
        [ "base"
        , "base"
        , "map"
        , "candy"
        , "StableBuffer"
        , "StableBuffer"
        , "encoding"
        , "vector"
        , "rep-indy-hash"
        , "icrc7-mo"
        ]
      : List Text
  }
, { name = "icrc37-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc37.mo"
  , version = "0.5.1"
  , dependencies =
        [ "base"
        , "base"
        , "map"
        , "candy"
        , "StableBuffer"
        , "StableBuffer"
        , "encoding"
        , "vector"
        , "rep-indy-hash"
        , "icrc7-mo"
        , "map"
        , "class-plus"
        ]
      : List Text
  }
, { name = "icrc79-mo"
  , repo = "https://github.com/PanIndustrial-org/icrc79.mo"
  , version = "0.2.2"
  , dependencies =
        [ "base"
        , "map"
        , "vector"
        , "timer-tool"
        , "star"
        , "stableheapbtreemap"
        , "sha2"
        , "candy"
        , "ovs-fixed"
        , "rep-indy-hash"
        ]
      : List Text
  }
, { name = "timer-tool"
  , repo = "https://github.com/PanIndustrial-Org/timerTool"
  , version = "0.1.1"
  , dependencies =
        [ "base"
        , "stableheapbtreemap"
        , "star"
        , "map"
        , "ovs-fixed"
        , "class-plus"
        ]
      : List Text
  }
, { name = "icrc-nft-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc_nft.mo"
  , version = "0.5.0"
  , dependencies =
        [ "base"
        , "base"
        , "map"
        , "candy"
        , "StableBuffer"
        , "StableBuffer"
        , "encoding"
        , "stable-write-only"
        , "ic-certification"
        , "vector"
        , "rep-indy-hash"
        , "icrc3-mo"
        , "icrc37-mo"
        , "icrc7-mo"
        , "class-plus"
        ]
      : List Text
  }
, { name = "testpackage"
  , repo = "https://github.com/sam-thetutor/testpackage"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "xtended-text"
  , repo = "https://github.com/edjcase/motoko_text"
  , version = "1.0.0"
  , dependencies = [ "base", "xtended-numbers" ] : List Text
  }
, { name = "stable-rbtree"
  , repo = "https://github.com/canscale/StableRBTree"
  , version = "1.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "principal-ext"
  , repo = "https://github.com/icdevsorg/principal-ext.mo"
  , version = "0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "incremental-ids"
  , repo = "https://github.com/NatLabs/incremental-ids"
  , version = "0.0.1"
  , dependencies = [ "base", "map" ] : List Text
  }
, { name = "stable-local-log"
  , repo = "https://github.com/PanIndustrial-Org/stable-local-log-mo"
  , version = "0.1.2"
  , dependencies =
        [ "base"
        , "ovs-fixed"
        , "class-plus"
        , "timer-tool"
        , "star"
        , "map"
        , "icrc10-mo"
        , "vector"
        ]
      : List Text
  }
, { name = "ussd-menu-builder"
  , repo = "https://github.com/akimau/motoko-ussd-menu-builder"
  , version = "1.0.2"
  , dependencies = [ "map", "base", "serde" ] : List Text
  }
, { name = "icrc37-mo-lordrio"
  , repo = "https://github.com/lordrio/icrc37.mo"
  , version = "0.4.3"
  , dependencies =
        [ "base"
        , "base"
        , "map"
        , "candy"
        , "StableBuffer"
        , "StableBuffer"
        , "encoding"
        , "vector"
        , "rep-indy-hash"
        , "icrc7-mo"
        ]
      : List Text
  }
, { name = "icrc72-subscriber-mo"
  , repo = "https://github.com/PanIndustrial-Org/icrc72-subscriber-mo"
  , version = "0.0.1"
  , dependencies =
        [ "base"
        , "stableheapbtreemap"
        , "star"
        , "map"
        , "vector"
        , "ovs-fixed"
        , "candy"
        , "class-plus"
        , "timer-tool"
        ]
      : List Text
  }
, { name = "kyc"
  , repo = "https://github.com/ORIGYN_SA/kyc.mo"
  , version = "0.1.0"
  , dependencies =
      [ "base", "candy", "map", "StableBuffer", "map", "matchers" ] : List Text
  }
, { name = "map"
  , repo = "https://github.com/ZhenyaUsenko/motoko-hash-map"
  , version = "9.0.1"
  , dependencies = [] : List Text
  }
, { name = "rxmo"
  , repo = "https://github.com/infu/rxmo"
  , version = "0.3.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "star"
  , repo = "https://github.com/icdevs/star.mo"
  , version = "0.1.1"
  , dependencies = [ "base", "matchers" ] : List Text
  }
, { name = "candy"
  , repo = "https://github.com/icdevs/candy_library"
  , version = "0.3.1"
  , dependencies =
        [ "matchers"
        , "candid"
        , "xtended-numbers"
        , "StableBuffer"
        , "StableBuffer"
        , "map"
        , "map"
        , "candy"
        , "candy"
        , "encoding"
        , "vector"
        , "principal-ext"
        , "base"
        ]
      : List Text
  }
, { name = "eddsa"
  , repo = "https://github.com/edjcase/motoko_eddsa"
  , version = "0.0.1"
  , dependencies =
        [ "base", "new-base", "base-x-encoder", "asn1", "sha2", "tweetnacl" ]
      : List Text
  }
, { name = "mosup"
  , repo = "https://github.com/Neutrinomic/mosup"
  , version = "0.1.1"
  , dependencies = [] : List Text
  }
, { name = "hello"
  , repo = ""
  , version = "0.1.1"
  , dependencies = [] : List Text
  }
, { name = "candb"
  , repo = "https://github.com/ORIGYN-SA/CanDB"
  , version = "1.0.8"
  , dependencies =
        [ "base"
        , "stable-hash-map"
        , "btree"
        , "array"
        , "encoding"
        , "stable-rbtree"
        , "StableBuffer"
        , "map"
        , "candy"
        , "StableBuffer"
        , "map"
        ]
      : List Text
  }
, { name = "devefi"
  , repo = "https://github.com/Neutrinomic/devefi"
  , version = "0.3.22"
  , dependencies =
        [ "vector"
        , "map"
        , "base"
        , "prng"
        , "account"
        , "itertools"
        , "rechain"
        , "mosup"
        , "devefi-icrc-ledger"
        , "devefi-icp-ledger"
        ]
      : List Text
  }
, { name = "rxmodb"
  , repo = "https://github.com/infu/rxmodb"
  , version = "0.2.0"
  , dependencies =
      [ "base", "rxmo", "stableheapbtreemap", "vector", "test" ] : List Text
  }
, { name = "json.mo"
  , repo = "https://github.com/aviate-labs/json.mo"
  , version = "0.1.2"
  , dependencies = [ "base", "parser-combinators" ] : List Text
  }
, { name = "evm-txs"
  , repo = "https://github.com/av1ctor/evm-txs.mo"
  , version = "0.1.3"
  , dependencies = [ "base", "rlp", "libsecp256k1", "sha3" ] : List Text
  }
, { name = "itertools"
  , repo = "https://github.com/NatLabs/Itertools"
  , version = "0.2.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "candy-utils"
  , repo = "https://github.com/ZhenyaUsenko/motoko-candy-utils"
  , version = "0.7.0"
  , dependencies = [ "base", "candy", "StableBuffer", "map" ] : List Text
  }
, { name = "ckbtc-types"
  , repo = "https://github.com/ZenVoich/ckbtc-types"
  , version = "0.1.2"
  , dependencies = [] : List Text
  }
, { name = "http-parser"
  , repo = "https://github.com/NatLabs/http-parser.mo"
  , version = "0.3.4"
  , dependencies = [ "base", "json.mo", "encoding" ] : List Text
  }
, { name = "libsecp256k1"
  , repo = "https://github.com/av1ctor/libsecp256k1.mo"
  , version = "0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "canistergeek"
  , repo = "https://github.com/usergeek/canistergeek-ic-motoko"
  , version = "0.0.8"
  , dependencies = [] : List Text
  }
, { name = "motoko-serde"
  , repo = "https://github.com/NatLabs/serde"
  , version = "0.1.4"
  , dependencies =
        [ "base"
        , "json"
        , "itertools"
        , "candid"
        , "xtended-numbers"
        , "parser-combinators"
        ]
      : List Text
  }
, { name = "chronotrinite"
  , repo = "https://github.com/Neutrinomic/devefi_chronotrinite"
  , version = "0.1.0"
  , dependencies =
        [ "base", "stableheapbtreemap", "vector", "mosup", "swbstable", "map" ]
      : List Text
  }
, { name = "certified-http"
  , repo = "https://github.com/infu/certified-http"
  , version = "0.1.6"
  , dependencies =
      [ "base", "ic-certification", "sha2", "stableheapbtreemap" ] : List Text
  }
, { name = "base-unofficial"
  , repo = "https://github.com/dfinity/motoko-base"
  , version = "0.7.3"
  , dependencies = [] : List Text
  }
, { name = "ic-certification"
  , repo = "https://github.com/nomeata/ic-certification"
  , version = "0.1.3"
  , dependencies = [ "sha2", "cbor" ] : List Text
  }
, { name = "candid_stringify"
  , repo = "https://github.com/ORIGYN-SA/candid_stringify"
  , version = "0.1.1"
  , dependencies =
      [ "base", "candid", "itertools", "xtended-numbers" ] : List Text
  }
, { name = "devefi-icp-ledger"
  , repo = "https://github.com/Neutrinomic/devefi_icp_ledger"
  , version = "1.5.8"
  , dependencies =
        [ "vector"
        , "map"
        , "swb"
        , "stableheapbtreemap"
        , "itertools"
        , "base"
        , "mosup"
        ]
      : List Text
  }
, { name = "devefi-icrc-sender"
  , repo = "https://github.com/Neutrinomic/devefi_icrc_sender"
  , version = "1.0.7"
  , dependencies = [ "vector", "stableheapbtreemap" ] : List Text
  }
, { name = "devefi-icrc-reader"
  , repo = "https://github.com/Neutrinomic/devefi_icrc_reader"
  , version = "1.0.5"
  , dependencies = [ "vector" ] : List Text
  }
, { name = "devefi-icrc-ledger"
  , repo = "https://github.com/Neutrinomic/devefi_icrc_ledger"
  , version = "1.5.8"
  , dependencies =
        [ "vector", "map", "swb", "stableheapbtreemap", "base", "mosup" ]
      : List Text
  }
, { name = "evm-proof-verifier"
  , repo = "https://github.com/horizonx-tech/evm-proof-verifier-motoko"
  , version = "0.0.1"
  , dependencies = [ "base", "rlp", "sha3", "merkle-patricia-trie" ] : List Text
  }
, { name = "merkle-patricia-trie"
  , repo = "https://github.com/f0i/merkle-patricia-trie.mo"
  , version = "1.0.0"
  , dependencies = [ "base", "rlp", "sha3" ] : List Text
  }
, { name = "motoko-certified-assets"
  , repo = "https://github.com/fermartz/motoko-certified-assets"
  , version = "1.0.1"
  , dependencies =
        [ "base", "ic-certification", "sha2", "stableheapbtreemap", "map" ]
      : List Text
  }
, { name = "stable-write-only"
  , repo = "https://github.com/skilesare/StableWriteOnly.mo"
  , version = "v0.1.0"
  , dependencies = [ "base", "vector" ] : List Text
  }
, { name = "btree"
  , repo = "https://github.com/canscale/StableHeapBTreeMap"
  , version = "v0.3.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "sequence"
  , repo = "https://github.com/matthewhammer/motoko-sequence"
  , version = "366c4191d856ed4842267f5ab89d7222ed2d71d0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "motoko-sequence"
  , repo = "https://github.com/matthewhammer/motoko-sequence"
  , version = "366c4191d856ed4842267f5ab89d7222ed2d71d0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "encoding"
  , repo = "https://github.com/aviate-labs/encoding.mo"
  , version = "v0.4.1"
  , dependencies = [ "base", "array" ] : List Text
  }
, { name = "crypto"
  , repo = "https://github.com/aviate-labs/crypto.mo"
  , version = "v0.3.1"
  , dependencies = [ "base", "encoding" ] : List Text
  }
, { name = "date.mo"
  , repo = "https://github.com/aviate-labs/date.mo"
  , version = "v0.1.0"
  , dependencies = [ "base", "fmt.mo" ] : List Text
  }
, { name = "fmt.mo"
  , repo = "https://github.com/aviate-labs/fmt.mo"
  , version = "v0.1.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "parser-combinators"
  , repo = "https://github.com/aviate-labs/parser-combinators.mo"
  , version = "v0.1.3"
  , dependencies = [ "base" ] : List Text
  }
, { name = "io"
  , repo = "https://github.com/aviate-labs/io.mo"
  , version = "v0.3.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "array"
  , repo = "https://github.com/aviate-labs/array.mo"
  , version = "v0.2.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "http"
  , repo = "https://github.com/aviate-labs/http.mo"
  , version = "v0.1.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "testing"
  , repo = "https://github.com/aviate-labs/testing.mo"
  , version = "v0.1.3"
  , dependencies = [] : List Text
  }
, { name = "StableTrieMap"
  , repo = "https://github.com/NatLabs/StableTrieMap"
  , version = "4781cb03efd34b124c22396c69710b374366c797"
  , dependencies = [ "base" ] : List Text
  }
, { name = "StableHashMap"
  , repo = "https://github.com/canscale/StableHashMap"
  , version = "v0.2.2"
  , dependencies = [ "base" ] : List Text
  }
, { name = "StableBuffer"
  , repo = "https://github.com/canscale/StableBuffer"
  , version = "v1.3.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "moh"
  , repo = "https://github.com/NatLabs/moh"
  , version = "27f9634adf5b3b85bcf8bfa381875d82395e464c"
  , dependencies =
        [ "base", "encoding", "fmt.mo", "itertools", "xtended-numbers" ]
      : List Text
  }
, { name = "motoko-datetime"
  , repo = "https://github.com/ByronBecker/motoko-datetime"
  , version = "v0.1.1"
  , dependencies = [ "base" ] : List Text
  }
, { name = "rlp"
  , repo = "https://github.com/relaxed04/rlp-motoko"
  , version = "16ee578b1315dd160718f1379a7e20c1f33c7d0d"
  , dependencies = [ "base" ] : List Text
  }
, { name = "iterext"
  , repo = "https://github.com/timohanke/motoko-iterext"
  , version = "v2.0.0"
  , dependencies = [ "base" ] : List Text
  }
, { name = "json-float"
  , repo = "https://github.com/NatLabs/json.mo"
  , version = "f3c8e7d418a7a8f2d6c0d7e2d276a0a82c2046ff"
  , dependencies = [ "base", "parser-combinators" ] : List Text
  }
, { name = "matchers"
  , repo = "https://github.com/kritzcreek/motoko-matchers"
  , version = "v1.3.1"
  , dependencies = [ "base" ] : List Text
  }
]
