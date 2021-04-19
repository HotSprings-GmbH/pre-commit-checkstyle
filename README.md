# pre-commit-checkstyle

A docker based pre-commit hook for Java checkstyle

This hook will create a folder named `.pre-commit` in you working directory, where the used checkstyle jar file will be located.
Changing the first argument of the hook allows to select a different version.
Make sure to add the cache folder to you gitignore file:

```gitignore
.pre-commit
```

# Using this hook

```yaml
- repo: https://github.com/HotSprings-GmbH/pre-commit-checkstyle
  rev: "" # A Tag or commit hash
  hooks:
    - id: checkstyle
      args:
        - "8.41" # the checkstyle version
        - "-c=checkstyle.xml" # configure checkstyle
      stages:
        - commit
```

# Dependencies

## Checkstyle

This hook uses the latest provided version of [checkstyle](https://checkstyle.org/).

- [Checkstyle Source Code](https://github.com/checkstyle/checkstyle).
- [Checkstyle License: LGPL-2.1+](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt)
