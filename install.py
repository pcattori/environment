from pathlib import Path
import os

home = Path.home()

def symlink(name, target, **kwargs):
    print(f'\tSymlinking: {name} -> {target}')
    # if name.exists:
    #     print(f'\t\tFile "{name}" already exists.')
    #     cmd = input(f'Overwrite? [y/N]\n> ')
    #     if cmd != 'y':
    #         print('\t\tSkipped symlink: {name} -> {target}')
    #         return
    #     os.remove(name)
    os.symlink(target, name, **kwargs)

if __name__ == '__main__':
    base_dir = Path(__file__).absolute().parent
    colorscheme = base_dir / 'One Dark.terminal'
    print(f'for terminal colorscheme: import "{colorscheme}" in MacOS Terminal')

    print(f'Symlinking dotfiles from {base_dir}')

    # link
    symlink(home / '.gitconfig', base_dir / 'gitconfig')
    symlink(home / '.vimrc', base_dir / 'vimrc')
    symlink(home / '.zshrc', base_dir / 'zshrc')

    zshrc_d = base_dir / 'zshrc.d'
    print(f'Symlinking dotfiles from {zshrc_d}')
    symlink(home / '.zshrc.d', zshrc_d, target_is_directory=True)
