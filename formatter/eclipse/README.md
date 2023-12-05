# Useful Links
- https://github.com/eclipse-jdt/eclipse.jdt.core/blob/052d7afba55f541f918d5a67a0435180df85b3e7/org.eclipse.jdt.core/formatter/org/eclipse/jdt/core/formatter/DefaultCodeFormatterConstants.java
- All (assumed) default values:
    - https://github.com/eclipse-jdt/eclipse.jdt.core/blob/879c237d0eaf0458f1e1df972fd765981f2ee1f7/org.eclipse.jdt.core.formatterapp/.settings/org.eclipse.jdt.core.prefs#L157
    - https://github.com/eclipse-jdt/eclipse.jdt.core/blob/879c237d0eaf0458f1e1df972fd765981f2ee1f7/org.eclipse.jdt.core/formatter/org/eclipse/jdt/internal/formatter/DefaultCodeFormatterOptions.java#L2965

Maven import to generate values using `createAlignmentValue`:
```
<dependency>
    <groupId>org.eclipse.jdt</groupId>
    <artifactId>core</artifactId>
    <version>3.3.0-v_771</version>
</dependency>
```
