#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import shutil
import toml
import pprint
import argparse


class Manager:
    def __init__(self, args):
        self.args_ = args
        self._load_meta()

    def _load_meta(self):
        with open('./meta.toml') as fd:
            self.meta_ = toml.loads(fd.read())
        #  pprint.pprint(parsed_toml)

    def install(self):
        for tool_name in self.meta_:
            tool_config = self.meta_[tool_name]

            src_path = f'./{tool_config.get("config_file")}'
            dst_path = tool_config['path']

            print(f'COPY {src_path} TO {dst_path}')

            #  shutil.copyfile(src_path, dst_path)

    def update(self):
        for tool_name in self.meta_:
            tool_config = self.meta_[tool_name]

            src_path = tool_config['path']
            dst_path = f'./{tool_config.get("config_file")}'

            print(f'COPY {src_path} TO {dst_path}')

            #  shutil.copyfile(src_path, dst_path)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--update',
                        dest='update',
                        action='store_true',
                        help='Update config')

    parser.add_argument('--install',
                        dest='install',
                        action='store_true',
                        help='Install config')

    args = parser.parse_args()
    mngr = Manager(args)
    mngr.install()
