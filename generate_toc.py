# This script will create a table of contents for a Markdown file
# Use it in terminal:
# python generate_toc.py FILE.md
# Script was create with help of ChatGPT

import sys

def generate_toc(filename):
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    toc_lines = ['# Оглавление\n']

    for line in lines:
        if line.startswith('#'):
            header_text = line.strip('#').strip()
            header_level = len(line) - len(line.lstrip('#'))
            header_link = header_text.lower().replace(' ', '-')
            toc_lines.append(f"{'  ' * (header_level-1)}- [{header_text}](#{header_link})\n")

    toc = ''.join(toc_lines)

    with open(filename, 'r+', encoding='utf-8') as f:
        content = f.read()
        f.seek(0)
        f.write(toc + '\n' + content)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python script.py filename.md")
    else:
        markdown_file = sys.argv[1]
        generate_toc(markdown_file)
