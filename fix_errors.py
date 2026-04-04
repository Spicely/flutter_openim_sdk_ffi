import re
import glob

def clean_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # Remove result.value; entirely
    content = re.sub(r'^\s*result\.value;\n', '', content, flags=re.MULTILINE)

    # Remove `if (result.error != null) { ... }`
    # Warning, some might be one-liners!
    
    # 1. multi-line block
    content = re.sub(
        r'\s*if\s*\(result\.error\s*!=\s*null\)\s*\{\s*throw\s+OpenIMError\([^)]+\);\s*\}',
        '',
        content
    )
    
    # 2. single-line block
    content = re.sub(
        r'\s*if\s*\(result\.error\s*!=\s*null\)\s*throw\s+OpenIMError\([^;]+;\s*',
        '',
        content
    )

    with open(filepath, 'w') as f:
        f.write(content)

for filepath in glob.glob('lib/src/web/manager/*.dart'):
    clean_file(filepath)
    
