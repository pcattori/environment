# dotfiles

Goals:

- **Minimal dependencies**
  - Do not require _any_ tools to be installed manually
- **Simple installation**
  - Installation should be as idempotent as possible
- **Feature-first**
  - Organize dotfiles by feature (e.g. "my preferred Python tooling"), not by file type
- **Profiles**
  - Manage multiple configurations side-by-side without conflicts

## Install

Installation managed by [dotbot](https://github.com/anishathalye/dotbot)

```sh
git clone git@github.com:pcattori/dotfiles.git
cd dotfiles
./install profiles/<profile>/install.conf.yaml
```
