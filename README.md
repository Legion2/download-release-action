# Download GitHub Release GitHub Action
GitHub Action for downloading files from GitHub release.
It can download the source zip archive and unzip it into a directory.
It is also possible to download any other file of the release.

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

## License
The Dockerfile and associated scripts and documentation in this project are released under the [Apache-2.0 License](LICENSE).
