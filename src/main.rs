use std::{
    collections::HashMap,
    env, fs,
    path::PathBuf,
    process::{self, Command},
    str::FromStr,
};

use anyhow::{Context, Result};
use serde::Deserialize;
use serde_json;

#[derive(Debug, Deserialize)]
struct MopsManifest {
    name: String,
    dependencies: Vec<String>,
    repository: String,
    version: String,
}

fn read_mops_registry_dump() -> Result<Vec<MopsManifest>> {
    let file =
        fs::read_to_string("mops-manifests.json").context("Failed to read mops-manifests.json")?;
    let manifests = serde_json::from_str(&file)?;
    Ok(manifests)
}

fn cleanup_manifest(mut manifest: MopsManifest) -> Option<MopsManifest> {
    let deleted_repos = vec!["origyn-nft", "origyn-nft-next", "testpkg", "simplem"];
    let broken_repos = vec![
        // References a non-existing tag
        "motoko-crc",
        // References a non-existing tag on base
        "base-unofficial",
        // Squatted and references a non-existing tag
        "stablehashmap",
        // References "" repository,
        "hello",
        // Squatted and I can't even find the files it uploaded in the repo
        "new-candb",
        // Outdated copy
        "motoko-serde",
        // Outdated, replaced by "compression"
        "deflate",

        // references outdated dependency
        "rxmodb",
        "maf",
        "mal",
        "geecs",
    ];
    // Added to MOPS by different authors and not kept up with the original library
    let squatted = vec!["hash-map", "stable-hash-map", "stableheapbtreemap"];

    if deleted_repos.contains(&manifest.name.as_str())
        || broken_repos.contains(&manifest.name.as_str())
        || squatted.contains(&manifest.name.as_str())
    {
        return None;
    }

    // Libraries that have actually tagged X.Y.Z rather than vX.Y.Z
    let non_v_tags = vec![
        "icrc-84",
        "auction",
        "vector",
        "stable-trie",
        "swb",
        "enumeration",
        "promtracker",
        "ckbtc-address",
        "http-parser",
    ];

    // Seems to be a version number, without `v` prefix
    if !non_v_tags.contains(&manifest.name.as_str())
        && manifest.version.contains('.')
        && !manifest.version.starts_with('v')
        && manifest.version.chars().next().unwrap().is_digit(10)
    {
        manifest.version = format!("v{}", manifest.version)
    }

    // Libraries with versions that aren't actually tagged in their respective repos
    let mut bogus_versions = HashMap::new();
    bogus_versions.insert("base", "moc-0.14.9");
    bogus_versions.insert("ic", "640250866d038ac7f8aea0afc82fc96d780d97ae");
    bogus_versions.insert("icrc1-types", "effd430c62a99e5ab68d17dd5fcdaec30c0c5adc");
    bogus_versions.insert("icrc2-types", "808ead8a7b9d6e6e8f966038db5ca7e5a9601e03");
    bogus_versions.insert("ckbtc-types", "0e73c03e0a4588600773d01463701c53ba0ab145");
    bogus_versions.insert("xrc-types", "aabaee6f2d2b070fbe081f895a4491875f34bac8");
    bogus_versions.insert("time-consts", "360295b4c1b969332c07aed299df2ce416ec844f");
    bogus_versions.insert("random", "Fix");
    bogus_versions.insert("nm", "v.1.1.0");
    bogus_versions.insert("date-time", "aa6f3428af02b360e557fc68759d4bf5aa133e6a");
    bogus_versions.insert("ledger-types", "40a14199e72286ba4db86b01c669f51d7469de2d");
    bogus_versions.insert("canistergeek", "32d1f3a48b1bc12d727b896a69b08bb5f3e5860d");
    bogus_versions.insert("sha2", "3e14010cc9d23df409452e4776f5b8a29652441b");
    bogus_versions.insert("mosup", "239aa664e7c4e2353b465fb4802ff537d03f4245");
    bogus_versions.insert("llm", "v0.1.2");
    bogus_versions.insert("new-base", "preview-0.4.0");
    bogus_versions.insert(
        "idempotency-keys",
        "83ffffcc4823592784942ed0845a8d1d9532507c",
    );
    bogus_versions.insert("base-x-encoder", "47e9ac57b04f0b9918c4446b88cdc93e1c5aeccf");
    bogus_versions.insert("file-uploader", "df41d5b53cc4ff69fb4e5d132ac79a82f3e91d7c");
    bogus_versions.insert(
        "xtended-numbers",
        "0a036877112d5f0cbb6903678d43abb6574c617e",
    );
    bogus_versions.insert("generics", "35299790eca2192280da9a0610551759f3d3939b");
    bogus_versions.insert("math", "7cafbe9b858d31062e4ff6a1d5ca7977be6388ec");
    bogus_versions.insert("fuzz", "23952c2e69a7c6470a7249133c3632dc58cd8ce7");
    bogus_versions.insert("async-test", "193f25e9fa223c96361c1da941974ebe3c695a8d");
    bogus_versions.insert("waterway-mops", "98ccbfa61fa3ee583980cd3456c3d41f97efe828");
    bogus_versions.insert("football-types", "c02095944568b3113805fdec23bf1dd141e1c01d");
    bogus_versions.insert("time", "2918224d2cb8f73d113ae3380f5f575156f9357c");
    bogus_versions.insert("bench", "d4ce879cf251a27fa7167b523eee622baca42a53");
    bogus_versions.insert("test", "e87a718eba50c0c5d2bd8b52320ed3c51f67e2cf");
    bogus_versions.insert("csprng", "3ae7cdc1a1ecb6c78a335ba49aea1b09e3371bfb");
    bogus_versions.insert("random-class", "de45e5844206f1e17d34ee1ebb90fcc4b43fe3fd");
    bogus_versions.insert("hmac", "74deeb9ee34011ed70d19fa264c46959c9077d30");
    bogus_versions.insert("simplemath", "1c4bd07f007cdc3698fcf6289851e1d13889d9d2");
    bogus_versions.insert("ed25519", "0848a4a455f4cd5121ed28ab3a0b76d79344f0a2");
    bogus_versions.insert("glob", "b1d90e0e981820be0bc283f10b9518656322cd44");
    bogus_versions.insert("assets", "b3b5788a136695cea1b3877f5356f3b8bc205d14");
    bogus_versions.insert("xtended-random", "be6749cfe5c07f37d84b74fb7ed2346730ee3393");
    bogus_versions.insert("swbstable", "8f68ed961ac5e4b2d9eed95ff68d33e2a98890b2");
    bogus_versions.insert("linked-list", "1e128c7a1fba63ec32a9673f9fc430fc1aebbece");
    bogus_versions.insert("itertools", "f7d59dfcdff5162828f41af81b5762607806d82b");
    bogus_versions.insert("noise", "cc25a93d055e01b1f6b64448ad7f64d551e96886");
    bogus_versions.insert("testpack", "8160ee5edf6408141f017d649f46cc48edc43c7e");
    bogus_versions.insert("testpackage", "ff3fb56c69d2548840df151c2f241897c3d43dd0");
    bogus_versions.insert(
        "incremental-ids",
        "68607808489cb7ff63663a392a974e0cb328d1fa",
    );
    bogus_versions.insert("lrucache", "e4021f823d3a9ce54ea6a992d51ab8239a3f52a2");
    bogus_versions.insert(
        "circular-buffer",
        "eecd121f4c2347563699266b5a0fb6bff6960ec4",
    );
    bogus_versions.insert("buffer-deque", "2ebdc1200a7c932e076f042695c1a976f0f5638b");
    bogus_versions.insert("rxmo", "ab65cdca2f286f3f6dbfc3e2c5efc83d80366b6b");
    bogus_versions.insert("ekvm", "115eff129e31d305a9ef65a5a3ce59729abc7d9f");
    bogus_versions.insert("stable-rbtree", "v0.6.1");
    bogus_versions.insert("mal", "30e7a579a599ab8e687e5fe9855f477a6670f9fa");
    bogus_versions.insert("maf", "30e7a579a599ab8e687e5fe9855f477a6670f9fa");
    bogus_versions.insert("bitbuffer", "5622d4d7572ca9da87b0448f0b9d0e407df9d2e4");
    bogus_versions.insert("prng", "e003702521d688f1149c2ffdb3e440b6c201dd8b");
    bogus_versions.insert("lru-cache", "9782fe76c0ec0a404a9a64c19d9b7dbe96fffa9c");
    bogus_versions.insert(
        "devefi-icrc-reader",
        "36cc9af5e85714a9d2de3f3859ea266f1f1d5627",
    );
    bogus_versions.insert(
        "certified-cache",
        "96ef8a3f05669641506fb90faf01ac55dde9721d",
    );
    bogus_versions.insert(
        "dao-proposal-engine",
        "a80694ced5339bac2f67204b6a9b6c58983bab87",
    );
    bogus_versions.insert("xtended-text", "c5a2538b71b9a77cb2b22a529a2990dd6142e0d2");
    bogus_versions.insert("token-handler", "439010ace0769aded1a7118fa3e82bd32dcb6ca2");
    bogus_versions.insert(
        "account-identifier",
        "d07f70f572fc0d4cfe44333276c92611de3e0d44",
    );
    bogus_versions.insert(
        "merkle-patricia-trie",
        "c7829dc9c0577953ad567c910500a7c3aace521e",
    );
    bogus_versions.insert(
        "devefi-icrc-sender",
        "0b89d790458d041603b5d440396ffaa694b8e8ed",
    );
    bogus_versions.insert("candid", "2c58aa3665f3cffc0b7083133c80eee32f5517d7");
    bogus_versions.insert(
        "augmented-btrees",
        "4aa19673ff4bce8588490af743b99670b22e5e36",
    );
    bogus_versions.insert("icrc45", "831c49784dc32eb3103f604a4a288c67b91fcabd");
    bogus_versions.insert("geecs", "2c506fd0dda38db81ec6ab599799d9821bd388db");
    bogus_versions.insert("hash", "v0.1.1");
    bogus_versions.insert("datetime", "178f107b65230c718f6eda4677502e0b02b841ba");
    bogus_versions.insert(
        "bitcoin-address-utils",
        "9d4eaba755660ccf5848c38374291721871ad9d9",
    );
    bogus_versions.insert("json", "1402c1bb961e42dc28b583eed7a61823f2fcc954");
    bogus_versions.insert("xml", "acb9815b88e835425e24ab64eb19076eec6a3c06");
    bogus_versions.insert("http-parser", "0.3.0");
    bogus_versions.insert("asn1", "a32d730a36f01c48e86c40d02f6cf226d224a66b");
    bogus_versions.insert("memory-buffer", "a98abe76b54272a4aeba8e133d78161f5399ca47");
    bogus_versions.insert("stream", "141bec30d1f78d2a31dac81c66306c399727c3db");
    bogus_versions.insert("rxmodb", "a3b55e054336323477e3608440c6f48cfac5b754");
    bogus_versions.insert(
        "evm-proof-verifier",
        "eb7463789813c7879451776d68f93dc3d524595a",
    );
    bogus_versions.insert("backup", "01ba874188744e674b23d81b49b3ca971f26d381");
    bogus_versions.insert("ecdsa", "f1cfc1edb3a51ce97459ff764441aa33ba952e20");
    bogus_versions.insert("memory-region", "c8d5e0c4ed4f9b106d0ed2fdf82f01b3273e8eb0");
    bogus_versions.insert(
        "motoko-certified-assets",
        "51f3d373e2bf0fb4b5facf4caa2bacf2efd0bd8d",
    );
    bogus_versions.insert(
        "candid_stringify",
        "ebaf64b98e9010a4a6a38e520ad5271e3f1b7085",
    );
    bogus_versions.insert("eddsa", "d86086bade281b43483b97a68955b59ba003364b");
    // Squatted?
    bogus_versions.insert("certified-http", "514314a95ecd5e2afd28dcbba632b33868d62702");
    bogus_versions.insert("compression", "85464ea13990574633f396324028be3ffae4802f");
    bogus_versions.insert(
        "ussd-menu-builder",
        "1c38e6facf425ff77d72998840b3dd9da83993ec",
    );
    bogus_versions.insert("rsa", "2315e05e524a5d1b3c8e4201de16ec681db5a5d9");
    bogus_versions.insert("jwt", "0130a82978bedc62617a622e1044071b69a39b09");
    bogus_versions.insert("icrc1", "0800c7ac03026a4c5a72eeb357cbbd0aca2f0fb4");
    bogus_versions.insert("account", "a718d61a8a4086ce13056681567535f975ac0ddf");
    bogus_versions.insert("rechain", "3d3203c0fb44407912868515089516e201495e83");
    bogus_versions.insert("devefi-icrc-ledger", "7d5cacb1d3dff31f8e4aadf40f2004ac50d9b592");
    bogus_versions.insert("devefi-icp-ledger", "cca43c11f379d91e31a117d5eeefae17b5244073");
    bogus_versions.insert("chronotrinite", "7cce392a6f7bffd8171dff32d8ed7e8fb739c205");
    bogus_versions.insert("uuid", "b88101f0516847727ff45ea54688803c698935e5");
    bogus_versions.insert("rbac-motoko", "52df8f889d8fbacbedae61a51a76aadb5ca906a9");
    bogus_versions.insert("liminal", "912a427ed0c73c96fd31f2cb7630e289b8cccc3e");
    bogus_versions.insert("certified-assets", "5955002be438dac42e2c9b0c225edd688c6c2f58");
    bogus_versions.insert("http-assets", "6bf74d202e80307e495dee2868c9db548e362f48");
    bogus_versions.insert("ic-assets", "6bf74d202e80307e495dee2868c9db548e362f48");

    // Declares version 1.0.0, but doesn't match tagged version
    bogus_versions.insert("cbor", "c0e5dab976bc5aecc2b3867324febd7557c47346");

    // Copies
    bogus_versions.insert("web-api", "2eed277e0b72ab1ac5c8391aa68e215788ab97d4");
    bogus_versions.insert("web-io", "2eed277e0b72ab1ac5c8391aa68e215788ab97d4");
    bogus_versions.insert("serde", "ddeb5cf7b14283f12b576d9d3da77e5218602aec");
    bogus_versions.insert("motoko-serde", "ddeb5cf7b14283f12b576d9d3da77e5218602aec");
    bogus_versions.insert("bit-map", "1c69e960723a49a9b1b8879a4acd30e37edb03e7");
    bogus_versions.insert("memory-hashtable", "649bf0d2fccd23e9fc7bb85d19f59eea30198463");
    bogus_versions.insert("memory-hashlist", "a57a2010aaeb599d708d279c68a39642318ebb61");
    bogus_versions.insert("devefi", "3032d2471cba71b2b433bfe65673a9f485212c55");
    bogus_versions.insert("openchat-bot-sdk", "768f1e8d52fc98dd2ae0b275b58cd1235954d27d");
    bogus_versions.insert("server", "011677de33a188fa981d6eac42e09dbe65dabd00");


    if let Some(actual_version) = bogus_versions.get(manifest.name.as_str()) {
        manifest.version = actual_version.to_string();
    }

    // Libraries that didn't declare their dependency on base
    if ["splay", "mosup", "canistergeek"].contains(&manifest.name.as_str()) {
        manifest.dependencies.push("base".to_string());
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
        "stable-hash-map" => "StableHashMap".to_string(),
        "stablehashmap" => "StableHashMap".to_string(),
        "stablebuffer_1_3_0" => "StableBuffer".to_string(),
        "stable_buffer" => "StableBuffer".to_string(),
        "btree" => "StableHeapBTreeMap".to_string(),
        "stableheapbtreemap" => "StableHeapBTreeMap".to_string(),
        "base-0.7.3" => "base".to_string(),
        "base-unofficial" => "base".to_string(),
        "candid-old" => "candid".to_string(),
        "gt-json" => "json.mo".to_string(),
        "gt-encoding" => "encoding".to_string(),
        "cert" => "ic-certification".to_string(),
        "deflate" => "compression".to_string(),
        _ => dependency,
    }
}

fn format_dhall_output(manifests: Vec<MopsManifest>) -> String {
    let mut result = "[\n".to_string();
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
        result.push_str(&format!("{{ name = \"{name}\", repo = \"{repo}\", version = \"{version}\", dependencies = [{dependencies}] : List Text }},\n"));
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
    let stable_heap_btree_map = MopsManifest {
        name: "StableHeapBTreeMap".to_string(),
        version: "v0.3.4".to_string(),
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
        ],
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
        stable_heap_btree_map,
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

fn handle_overrides(manifests: Vec<MopsManifest>) -> Result<Vec<MopsManifest>> {
    let mut overrides = HashMap::new();
    for entry in fs::read_dir("./overrides")? {
        let path = entry?.path();
        let name = path.file_name().unwrap().to_string_lossy().to_string();
        let path = path.canonicalize()?.to_str().unwrap().to_string();
        overrides.insert(name.clone(), path);
    }

    let mut out = vec![];
    for mut manifest in manifests {
        if let Some(path) = overrides.get(&manifest.name) {
            manifest.version = "overridden".to_string();
            let mut ln = Command::new("ln");
            ln.arg("-s")
                .arg("-F")
                .arg("-f")
                .arg(path)
                .arg(format!(".vessel/{}/overridden", manifest.name));
            if !ln.status()?.success() {
                eprintln!("Failed to link overridden dependency: {path}");
                process::exit(1);
            }
            let mut git_diff = Command::new("git");
            git_diff.current_dir(path).arg("diff").arg("-p");
            let out = git_diff.output()?;
            if !out.status.success() {
                eprintln!("Failed to create patch for overridden dependency: {path}");
                process::exit(1);
            }
            let patch_path = PathBuf::from("patches").join(format!("{}.patch", manifest.name));
            fs::write(patch_path, out.stdout)?;
        }
        out.push(manifest)
    }

    Ok(out)
}

fn override_package(package: &str, manifests: Vec<MopsManifest>) {
    let manifest = manifests
        .iter()
        .find(|m| m.name == package)
        .expect("Package doesn't exist in package-set");
    println!("Overriding {package}, {}", manifest.version);
    let out_path = PathBuf::from_str(&format!("overrides/{}", package)).unwrap();
    let mut git_clone = Command::new("git");
    git_clone
        .arg("clone")
        .arg(&manifest.repository)
        .arg(&out_path);
    if !git_clone.status().unwrap().success() {
        eprintln!("Failed to clone git repo");
        process::exit(1);
    }
    let mut git_checkout = Command::new("git");
    git_checkout
        .arg("checkout")
        .arg(&manifest.version)
        .current_dir(out_path.canonicalize().unwrap());
    if !git_checkout.status().unwrap().success() {
        eprintln!("Failed to checkout version");
        process::exit(1);
    }
}

fn main() -> Result<()> {
    let mut manifests: Vec<MopsManifest> = read_mops_registry_dump()?;
    manifests.extend(extra_manifests());
    let cleaned = manifests.into_iter().filter_map(cleanup_manifest).collect();
    let cleaned = handle_overrides(cleaned)?;

    let mut args = env::args();
    if args.len() == 2 {
        let package = args.nth(1).unwrap();
        override_package(&package, cleaned);
        return Ok(());
    }
    fs::write("package-set.dhall", &format_dhall_output(cleaned))?;
    Ok(())
}

// Look up repo from package name, clone it locally.
// Create vessel.dhall file with the correct dependencies and compiler version.
// After done working on it, override the repository and version with the local repository reference.
