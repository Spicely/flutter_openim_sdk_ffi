import re
import glob

def process(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # Replace _callAsync block with callPromise
    pattern = re.compile(
        r'final future = OpenIMManager\._callAsync\(opID\);\s*'
        r'(js[A-Za-z0-9_]+\([^;]+\));\s*'
        r'final result = await future;'
    )

    content = pattern.sub(r'final result = await OpenIMManager.callPromise(\1);', content)

    lines = content.split('\n')
    new_lines = []
    
    i = 0
    current_return_type = "dynamic"
    while i < len(lines):
        line = lines[i]
        
        m_def = re.search(r'Future<([^>]+)>\s+[a-zA-Z0-9_]+\s*\(', line)
        if m_def:
            current_return_type = m_def.group(1).strip()
            
        if 'return result.value;' in line:
            new_lines.append(f'    if (result == null) return null as dynamic;')
            if current_return_type in ('void', 'dynamic', 'Map'):
                new_lines.append(f'    return jsonDecode(result as String);')
            elif current_return_type == 'String':
                new_lines.append(f'    return result as String;')
            elif current_return_type == 'int':
                new_lines.append(f'    return int.parse(result as String);')
            elif current_return_type == 'bool':
                new_lines.append(f'    return result == "true" || result == "True" || result == true;')
            elif current_return_type.startswith('List<'):
                inner = current_return_type[5:-1]
                if inner in ['String', 'int', 'bool']:
                    new_lines.append(f'    return (jsonDecode(result as String) as List).cast<{inner}>();')
                else:
                    new_lines.append(f'    return (jsonDecode(result as String) as List).map((e) => {inner}.fromJson(e)).toList();')
            else:
                new_lines.append(f'    return {current_return_type}.fromJson(jsonDecode(result as String));')
        elif 'if (result.error != null) throw OpenIMError(result.errCode!, result.error!);' in line:
            # Drop it, callPromise already throws if error
            pass
        else:
            new_lines.append(line)
        i += 1

    with open(filepath, 'w') as f:
        f.write('\n'.join(new_lines))

for f in glob.glob('lib/src/web/manager/*.dart'):
    process(f)
