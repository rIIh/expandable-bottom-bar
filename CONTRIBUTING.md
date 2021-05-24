# Introduction

First off, thank you for considering contributing to Expandable Bottom Bar.


Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect in addressing your issue, assessing changes, and helping you finalize your pull requests.

Expandable Bottom Bar is an open source project and I will appreciate to receive contributions from you! There are many ways to contribute, from improving the documentation, submitting bug reports and feature requests or writing code which can be incorporated into ODDC itself.

# Ground Rules

Responsibilities
* Ensure that code analysis results are green.
* Create issues for any major changes and enhancements that you wish to make. Discuss things transparently and get feedback.
* Don't add any classes to the codebase unless absolutely needed. Err on the side of using functions.
* Keep feature versions as small as possible, preferably one new feature per version.


# Getting started

For something that is bigger than a one or two line fix:

1. Create your own fork of the code
2. Do the changes in your fork
3. If you like the change and think the project could use it:
    * Be sure you have followed the code style for the project.
    * Send a pull request.


# How to report a bug

## Null Access Errors

After migration to null-safety some fields are considered as non-nullable. There 100 words against which package was tested. If you found word that breaks your application flow feel free to open Issue to fix this specific case and make test coverage more solid.

Create Issue with detailed information about your case.
Fill what `word` you used, what endpoint you targeted(lemmas or entries) and langauge.

## Other bugs

Just open an issue and describe what you encounter.


## Security 

If you find a security vulnerability, do NOT open an issue. Email ratealt@gmail.com instead.

In order to determine whether you are dealing with a security issue, ask yourself these two questions:
* Can I access something that's not mine, or something I shouldn't have access to?
* Can I disable something for other people?

If the answer to either of those two questions are "yes", then you're probably dealing with a security issue. Note that even if you answer "no" to both questions, you may still be dealing with a security issue, so if you're unsure, just email me.


## <a name="commit"></a> Git Commit Guidelines

There very precise rules over how our git commit messages can be formatted. This leads to **more
readable messages** that are easy to follow when looking through the **project history**. 

It is important to note that we use the git commit messages to **generate** the Expandable Bottom Bar
[CHANGELOG](CHANGELOG.md) document. Improperly formatted commit messages may result in your
change not appearing in the CHANGELOG of the next release.

### <a name="commit-message-format"></a> Commit Message Format

Each commit message consists of a **header**, a **body** and a **footer**. The header has a special
format that includes a **type**, a **scope**, and a **subject**:

```html
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

> Any line of the commit message cannot be longer 100 characters!<br/>
  This allows the message to be easier to read on GitHub as well as in various Git tools.

##### Type

Must be one of the following:

* **feat**: A new feature
* **fix**: A bug fix
* **docs**: Documentation only changes
* **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing
  semi-colons, etc)
* **refactor**: A code change that neither fixes a bug nor adds a feature
* **perf**: A code change that improves performance
* **test**: Adding missing tests
* **build**: Changes to the dependencies, devDependencies, or build tooling
* **ci**: Changes to our Continuous Integration configuration

##### Scope

The scope could be anything that helps specify the scope (or feature) that is changing.

Examples
- fix(select): 
- docs(menu): 

##### Subject

The subject contains a succinct description of the change:

* use the imperative, present tense: "change" not "changed" nor "changes"
* don't capitalize first letter
* no period (.) at the end

##### Body

Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes".
The body should include the motivation for the change and contrast this with previous behavior.

##### Footer

The footer should contain any information about **Breaking Changes** and is also the place to
reference GitHub issues that this commit **Closes**, **Fixes**, or **Relates to**.

> We highlight Breaking Changes in the ChangeLog. These are as changes that will require
  community users to modify their code after updating to a version that contains this commit.

##### Sample Commit messages

```text
fix(autocomplete): don't show the menu panel when readonly

- this could sometimes happen when no value was selected

Fixes #11231
```
```text
feat(chips): trigger ng-change on chip addition/removal

- add test of `ng-change` for `md-chips`
- add docs regarding `ng-change` for `md-chips` and `md-contact-chips`
- add demo for ng-change on `md-chips`
- add demo for ng-change on `md-contact-chips`

Fixes #11161 Fixes #3857
```

```text
refactor(content): prefix mdContent scroll- attributes

    BREAKING CHANGE: md-content's `scroll-` attributes are now prefixed with `md-`.

    Change your code from this:
    ```html
    <md-content scroll-x scroll-y scroll-xy>
    ```

    To this:
    ```html
    <md-content md-scroll-x md-scroll-y md-scroll-xy>
    ```
```
<br/>