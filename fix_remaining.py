import re
import glob

def fix(filepath):
    with open(filepath) as f:
        content = f.read()

    pattern = re.compile(
        r'final future = OpenIMManager\._callAsync\(opID\);\s+(.*?)'
        r'(js[A-Za-z0-9_]+\([^;]+\));\s+'
        r'final result = await future;',
        re.DOTALL
    )

    content = pattern.sub(r'\1final result = await OpenIMManager.callPromise(\2);', content)

    with open(filepath, 'w') as f:
        f.write(content)

for f in glob.glob('lib/src/web/manager/*.dart'):
    fix(f)
