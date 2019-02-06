# Download GitHub Release GitHub Action
GitHub Action for downloading GitHub elease archives. It downloads the zip archive and unzips it into a directory.

## Usage
```
action "Download release" {
  uses = "Legion2/download-release-action@master"
  args = "Legion2/download-release-action v1.0.0"
  env = {
    TARGET_PATH = "downloads"
  }
}
```

### Arguments
The first argument is the username and repository name from which to download the release archive.
The username and repository name are separated  by a `/`.

The second argument is the version tag of the release.

### Environment variables
* **`TARGET_PATH`** *(optional)* : overrides the default download directory.

## License
The Dockerfile and associated scripts and documentation in this project are released under the [Apache-2.0 License](LICENSE).
