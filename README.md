Producing the raw manifest data:

1. Inside the `mops` repository run
`dfx canister call main --ic search '("", opt 199, null)' | idl2json > ../mops-packages.json`
2. Massage the data a bit to produce `mops-manifests.json` (TODO: Write down the `jq` incantation, or reimplement in Rust)


TODO: Init overrides/ from patches/
