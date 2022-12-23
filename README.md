# nFPM Packager action

[nFPM](https://github.com/goreleaser/nfpm) is a simple, 0-dependencies, deb, rpm, apk and archlinux packager.

## Inputs

### `nfpm_version`

**Optional** - nFPM version to use. Default is `2.22.2`

### `config`

**Optional** - nFPM config filepath. Default is `nfpm.yaml`

### `packager`

**Required** - Packager to use. `rpm`, `deb`, `apk` or `archlinux`

### `target`

**Optional** - Package target name. Can be an existing directory. Default is generic name based on the configuration

## Example
```yaml
    - name: Create deb package
      id: nfpm-deb
      uses: burningalchemist/nfpm-action@v1
      with:
        packager: deb
        config: packaging/conf/nfpm.yaml
    - name: Create rpm package with a particular name
      id: nfpm-rpm
      uses: burningalchemist/nfpm-action@v1
      with:
        packager: rpm
        config: packaging/conf/nfpm.yaml
        target: package.rpm
    - name: get the package name from the output
      run: echo ${{ steps.nfpm-rpm.outputs.package }}
      shell: bash
```
