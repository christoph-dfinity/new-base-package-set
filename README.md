# Motoko package ecosystem

## Setup

```
cargo run init-overrides
vessel verify --version 0.14.9
```

## Making changes to the cleaned manifests

```
cargo run generate && vessel verify --version 0.14.9
```

## Adding an override

```
cargo run add-override <package-name>
# make changes in overrides/<package-name> until the following succeeds
cargo run generate && vessel verify --version 0.14.9 <package-name>
```

The corresponding .patch file will automatically be generated

## Producing the raw manifest data:

1. Inside the `mops` repository run
`dfx canister call main --ic search '("", opt 199, null)' | idl2json > ../mops-packages.json`
2. Massage the data a bit to produce `mops-manifests.json` (TODO: Write down the `jq` incantation, or reimplement in Rust)
