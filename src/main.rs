use std::fs;

use anyhow::Result;
use serde::{Deserialize, Serialize};
use serde_json;

#[derive(Debug, Deserialize)]
struct MopsManifest {
    name: String,
    dependencies: Vec<String>,
    repository: String,
    version: String,
}

fn read_mops_registry_dump() -> Result<Vec<MopsManifest>> {
    let file = fs::read_to_string("../mops-manifests.json")?;
    let manifests = serde_json::from_str(&file)?;
    Ok(manifests)
}

fn cleanup_manifest(mut manifest: MopsManifest) -> Option<MopsManifest> {
    let deleted_repos = vec!["origyn-nft", "origyn-nft-next"];
    if deleted_repos.contains(&manifest.name.as_str()) {
        return None;
    }

    // The "base" package on Mops is bogus
    if manifest.name == "base" {
        return Some(MopsManifest {
            name: "base".to_string(),
            dependencies: vec![],
            repository: "https://github.com/dfinity/motoko-base".to_string(),
            version: "moc-0.14.9".to_string(),
        });
    }

    manifest.dependencies = manifest
        .dependencies
        .into_iter()
        .map(cleanup_dependency)
        .collect();
    Some(manifest)
}

fn cleanup_dependency(dependency: String) -> String {
    match dependency.as_str() {
        "candy_0_3_0" => "candy".to_string(),
        "candy_0_2_0" => "candy".to_string(),
        "candy_0_1_12" => "candy".to_string(),
        "candy3" => "candy".to_string(),
        "encoding_0_4_1" => "encoding".to_string(),
        "map_7_0_0" => "map".to_string(),
        "map7" => "map".to_string(),
        "map9" => "map".to_string(),
        "motoko_numbers" => "xtended-numbers".to_string(),
        "xtendedNumbers" => "xtended-numbers".to_string(),
        "stablebuffer" => "StableBuffer".to_string(),
        "stablebuffer_1_3_0" => "StableBuffer".to_string(),
        "stable_buffer" => "StableBuffer".to_string(),
        "base-0.7.3" => "base".to_string(),
        "candid-old" => "candid".to_string(),
        "gt-json" => "json.mo".to_string(),
        "gt-encoding" => "encoding".to_string(),
        "cert" => "ic-certification".to_string(),
        _ => dependency,
    }
}

fn format_dhall_output(manifests: Vec<MopsManifest>) -> String {
    let mut result = "[".to_string();
    for manifest in manifests {
        let name = manifest.name;
        let repo = manifest.repository;
        let version = manifest.version;
        let dependencies = manifest
            .dependencies
            .into_iter()
            .map(|d| format!("\"{d}\""))
            .collect::<Vec<_>>()
            .join(", ");
        result.push_str(&format!("{{ name = \"{name}\", repo = \"{repo}\", version = \"{version}\", dependencies = [{dependencies}] : List Text }},"));
    }
    result.push(']');
    result
}

fn extra_manifests() -> Vec<MopsManifest> {
    let stable_write_only = MopsManifest {
        name: "stable-write-only".to_string(),
        version: "v0.1.0".to_string(),
        repository: "https://github.com/skilesare/StableWriteOnly.mo".to_string(),
        dependencies: vec!["base".to_string(), "vector".to_string()],
    };
    let btree = MopsManifest {
        name: "btree".to_string(),
        version: "v0.3.2".to_string(),
        repository: "https://github.com/canscale/StableHeapBTreeMap".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let sequence = MopsManifest {
        name: "sequence".to_string(),
        version: "366c4191d856ed4842267f5ab89d7222ed2d71d0".to_string(),
        repository: "https://github.com/matthewhammer/motoko-sequence".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let motoko_sequence = MopsManifest {
        name: "motoko-sequence".to_string(),
        version: "366c4191d856ed4842267f5ab89d7222ed2d71d0".to_string(),
        repository: "https://github.com/matthewhammer/motoko-sequence".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let encoding = MopsManifest {
        name: "encoding".to_string(),
        version: "v0.4.1".to_string(),
        repository: "https://github.com/aviate-labs/encoding.mo".to_string(),
        dependencies: vec!["base".to_string(), "array".to_string()],
    };
    let crypto = MopsManifest {
        name: "crypto".to_string(),
        version: "v0.3.1".to_string(),
        repository: "https://github.com/aviate-labs/crypto.mo".to_string(),
        dependencies: vec!["base".to_string(), "encoding".to_string()],
    };
    let date = MopsManifest {
        name: "date.mo".to_string(),
        version: "v0.1.0".to_string(),
        repository: "https://github.com/aviate-labs/date.mo".to_string(),
        dependencies: vec!["base".to_string(), "fmt.mo".to_string()],
    };
    let fmt = MopsManifest {
        name: "fmt.mo".to_string(),
        version: "v0.1.0".to_string(),
        repository: "https://github.com/aviate-labs/fmt.mo".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let parser_combinators = MopsManifest {
        name: "parser-combinators".to_string(),
        version: "v0.1.3".to_string(),
        repository: "https://github.com/aviate-labs/parser-combinators.mo".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let io = MopsManifest {
        name: "io".to_string(),
        version: "v0.3.2".to_string(),
        repository: "https://github.com/aviate-labs/io.mo".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let array = MopsManifest {
        name: "array".to_string(),
        version: "v0.2.1".to_string(),
        repository: "https://github.com/aviate-labs/array.mo".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let http = MopsManifest {
        name: "http".to_string(),
        version: "v0.1.2".to_string(),
        repository: "https://github.com/aviate-labs/http.mo".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let testing = MopsManifest {
        name: "testing".to_string(),
        version: "v0.1.3".to_string(),
        repository: "https://github.com/aviate-labs/testing.mo".to_string(),
        dependencies: vec![],
    };
    let stable_trie_map = MopsManifest {
        name: "StableTrieMap".to_string(),
        version: "4781cb03efd34b124c22396c69710b374366c797".to_string(),
        repository: "https://github.com/NatLabs/StableTrieMap".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let stable_buffer = MopsManifest {
        name: "StableBuffer".to_string(),
        version: "v1.3.0".to_string(),
        repository: "https://github.com/canscale/StableBuffer".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let stable_hash_map = MopsManifest {
        name: "StableHashMap".to_string(),
        version: "v0.2.2".to_string(),
        repository: "https://github.com/canscale/StableHashMap".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let moh = MopsManifest {
        name: "moh".to_string(),
        version: "27f9634adf5b3b85bcf8bfa381875d82395e464c".to_string(),
        repository: "https://github.com/NatLabs/moh".to_string(),
        dependencies: vec![
            "base".to_string(),
            "encoding".to_string(),
            "fmt.mo".to_string(),
            "itertools".to_string(),
            "xtended-numbers".to_string(),
        ]
    };
    let motoko_date_time = MopsManifest {
        name: "motoko-datetime".to_string(),
        repository: "https://github.com/ByronBecker/motoko-datetime".to_string(),
        version: "v0.1.1".to_string(),
        dependencies: vec!["base".to_string()],
    };
    let rlp = MopsManifest {
      name: "rlp".to_string(),
      // Seems to be ahead of horizonx-tech/rlp-motoko
      repository: "https://github.com/relaxed04/rlp-motoko".to_string(),
      version: "16ee578b1315dd160718f1379a7e20c1f33c7d0d".to_string(),
      dependencies: vec!["base".to_string()],
    };
    let iterext = MopsManifest {
        name: "iterext".to_string(),
        repository: "https://github.com/timohanke/motoko-iterext".to_string(),
        version: "v2.0.0".to_string(),
        dependencies: vec!["base".to_string()],
    };
    // references an unmerged branch (used in the "serde" package)
    let json_float = MopsManifest {
      name: "json-float".to_string(),
      repository: "https://github.com/NatLabs/json.mo".to_string(),
      version: "f3c8e7d418a7a8f2d6c0d7e2d276a0a82c2046ff".to_string(),
      dependencies: vec!["base".to_string(), "parser-combinators".to_string()],
    };

    let matchers = MopsManifest {
        name: "matchers".to_string(),
        repository: "https://github.com/kritzcreek/motoko-matchers".to_string(),
        version: "v1.3.1".to_string(),
        dependencies: vec!["base".to_string()],
    };

    vec![
        stable_write_only,
        btree,
        sequence,
        motoko_sequence,
        encoding,
        crypto,
        date,
        fmt,
        parser_combinators,
        io,
        array,
        http,
        testing,
        stable_trie_map,
        stable_hash_map,
        stable_buffer,
        moh,
        motoko_date_time,
        rlp,
        iterext,
        json_float,
        matchers,
    ]
}

// stable-hash-map = "https://github.com/canscale/StableHashMap#v0.2.1"
// btree = "https://github.com/canscale/StableHeapBTreeMap#v0.3.2"
// array = "https://github.com/aviate-labs/array.mo#v0.2.0"
// encoding = "https://github.com/aviate-labs/encoding.mo#v0.3.2"
// stable-rbtree = "https://github.com/canscale/StableRBTree#v0.6.1"
// stablebuffer = "https://github.com/skilesare/StableBuffer#v0.2.0"
// map = "https://github.com/ZhenyaUsenko/motoko-hash-map#v7.0.0"
// candy = "https://github.com/icdevs/candy_library#0.3.0"

fn main() -> Result<()> {
    let mut manifests: Vec<MopsManifest> = read_mops_registry_dump()?;
    manifests.extend(extra_manifests());
    let cleaned = manifests.into_iter().filter_map(cleanup_manifest).collect();
    fs::write("package-set.dhall", &format_dhall_output(cleaned))?;
    Ok(())
}
