# pre-commit-checkstyle
A docker based pre-commit hook for Java checkstyle 

#Using this hook
```yaml
-   repo: https://github.com/HotSprings-GmbH/pre-commit-checkstyle
    rev: ''  # A Tag or commit hash
-    hooks:
       - id: checkstyle
         args:
           - "-c=checkstyle.xml" # configure checkstyle 
         stages:
           - commit
```

# Dependencies
This hook uses the latest provided version of [checkstyle](https://checkstyle.org/).
- [Source Code](https://github.com/checkstyle/checkstyle).
- [License: LGPL-2.1+](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt)

