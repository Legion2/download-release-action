# Download GitHub Release GitHub Action
GitHub Action for downloading files from GitHub release.
It can download the source zip archive and unzip it into a directory.
It is also possible to download any other file of the release.
This action can download from public and private repositories.

## Usage
See [action.yml](action.yml) for comprehensive list of parameters.

Basic:
```yaml
on: push
name: Main Workflow
jobs:
  build:
    name: "Download release"
    runs-on: ubuntu-latest
    steps:
    - name: Download CLI
      uses: Legion2/download-release-action@v2.0.0
      with:
        repository: apache/openwhisk-cli
        tag: '0.10.0-incubating'
        path: downloads
        file: OpenWhisk_CLI-0.10.0-incubating-all.tgz
```

If your asset belongs to a private repository you need to pass a Github token with the `repo` permission, like so:

```yaml
on: push
name: Main Workflow
jobs:
  build:
    name: "Download release"
    runs-on: ubuntu-latest
    steps:
    - name: Download CLI
      uses: Legion2/download-release-action@v2.0.0
      with:
        repository: Legion2/private-repo
        tag: '1.0.0'
        path: downloads
        file: hello-world.sh
        token: ${{ secrets.SECRET_NAME }}
```
Most likely you can't use `${{ secrets.GITHUB_TOKEN }}` because it only allow access to the repo of the current workflow and not to other private repositories.s

## License
The Dockerfile and associated scripts and documentation in this project are released under the [Apache-2.0 License](LICENSE).
