# This script is run to override the obsolete sqlite3 version against which the image's Python is constructed, that conflicts with ChromaDB requirements

lines = [
    "__import__('pysqlite3')",
    "import sys",
    "sys.modules['sqlite3'] = sys.modules.pop('pysqlite3')"
]
lines.reverse()

filename = "/usr/local/lib/python3.10/site-packages/chromadb/__init__.py"

for line in lines:
    with open(filename, 'r+') as f:
        content = f.read()
        f.seek(0, 0)
        f.write(line.rstrip('\r\n') + '\n' + content)