# Snapshot Documentation Creator

This repo server as a way to generate the snapshot instructions at https://github.com/Crypto-Chemistry/validator-services.

## Usage

Move `source/example.yml` to new file titled $chain_$chain_tye.yml

```bash
mv source/example.yml source/kujira_mainnet.yml
```

Replace the variables in the new source .yml file as needed for the chain you're creating instructions for

Create additional .yml files for more chains as needed

Run the document creation script

```bash
python3 create_docs.py
```
Verify the document was created as expect in `docs/`

## Deploy Usage

`deploy.sh` is a script designed to quickly move the files from the generated `docs/` location to the git repo that the final documentation resides.
Note: This only copies the files for now and does not commit to the documentation git repo.

Edit `deploy.sh` and add the path to the final git repo in the `PATH_TO_DOC_REPO` variable

Run `deploy.sh`

```bash
./deploy.sh
```