module.exports = {
  branches: ["master", "main"],
  plugins: [
    [
      "@semantic-release/commit-analyzer",
      {
        releaseRules: [
          { scope: "develop", release: false },
          { scope: "config", release: "patch" },
          { scope: "no-release", release: false },
          { type: "docs", release: "patch" },
          { type: "refactor", release: "patch" },
          { type: "perf", release: "patch" },
        ],
        parserOpts: {
          mergePattern: "^Merge branch '(.*)' into '(.*)'$",
          mergeCorrespondence: ["source", "id"],
        },
      },
    ],
    [
      "@semantic-release/release-notes-generator",
      {
        preset: "conventionalcommits",
        presetConfig: {
          types: [
            {
              type: "feat",
              section: ":sparkles: Features",
              hidden: false,
            },
            {
              type: "fix",
              section: ":bug: Bug fixes",
              hidden: false,
            },
            {
              type: "docs",
              section: ":memo: Documentation",
              hidden: false,
            },
            {
              type: "refactor",
              section: ":zap: Refactoring",
              hidden: false,
            },
            {
              type: "perf",
              section: ":fast_forward: Performance",
              hidden: false,
            },
          ],
        },
      },
    ],
    "semantic-release-dart",
    [
      "@semantic-release/changelog",
      {
        changelogFile: "CHANGELOG.md",
      },
    ],
    [
      "@semantic-release/git",
      {
        assets: ["CHANGELOG.md", "pubspec.yaml"],
      },
    ],
    "@semantic-release/github",
  ],
};
