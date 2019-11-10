from pathlib import Path
import os


def symlink(name, target, **kwargs):
    print(f"\tSymlinking: {name} -> {target}")
    if name.exists:
        print(f"\t\tFile '{name}' already exists.")
        cmd = input(f"Overwrite? [y/N]\n> ")
        if cmd != "y":
            print(f"\t\tSkipped symlink: {name} -> {target}")
            return
        os.remove(name)
    os.symlink(target, name, **kwargs)


if __name__ == "__main__":
    home = Path.home()
    dotfiles_dir = Path(__file__).absolute().parent

    colorscheme = dotfiles_dir / "One Dark.terminal"
    print(f'for terminal colorscheme: import "{colorscheme}" in MacOS Terminal')

    print(f"Symlinking dotfiles from {dotfiles_dir}")
    symlink(home / ".gitconfig", dotfiles_dir / "gitconfig")
    symlink(home / ".vimrc", dotfiles_dir / "vimrc")
    symlink(home / ".zshrc", dotfiles_dir / "zshrc")

    zshrc_d = dotfiles_dir / "zshrc.d"
    print(f"Symlinking dotfiles from {zshrc_d}")
    symlink(home / ".zshrc.d", zshrc_d, target_is_directory=True)
