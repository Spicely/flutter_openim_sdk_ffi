import re
import glob

def fix(filepath):
    with open(filepath) as f:
        content = f.read()

    lines = content.split('\n')
    new_lines = []
    
    i = 0
    current_return_type = "dynamic"
    
    while i < len(lines):
        line = lines[i]
        
        # Proper Regex to extract T from Future<T>
        # e.g. Future<List<Message>> foo() 
        m = re.search(r'Future<(.+)>\s+[a-zA-Z0-9_]+\s*\(', line)
        if m:
            current_return_type = m.group(1).strip()
            # print("Matched", current_return_type)
            
        if 'if (result == null) return null as dynamic;' in line:
            new_lines.append(line)
            # The next line is the bad return logic
            orig_ret_line = lines[i+1]
            
            if current_return_type in ('void', 'dynamic', 'Map'):
                new_ret_line = f'    return jsonDecode(result as String);'
            elif current_return_type == 'String':
                new_ret_line = f'    return result as String;'
            elif current_return_type == 'int':
                new_ret_line = f'    return int.parse(result as String);'
            elif current_return_type == 'bool':
                new_ret_line = f'    return result == "true" || result == "True" || result == true;'
            elif current_return_type.startswith('List<'):
                inner = current_return_type[5:-1].strip()
                if inner in ['String', 'int', 'bool', 'dynamic']:
                    new_ret_line = f'    return (jsonDecode(result as String) as List).cast<{inner}>();'
                else:
                    new_ret_line = f'    return (jsonDecode(result as String) as List).map((e) => {inner}.fromJson(e)).toList();'
            else:
                new_ret_line = f'    return {current_return_type}.fromJson(jsonDecode(result as String));'
            
            new_lines.append(new_ret_line)
            i += 1 # skip next line
        else:
            new_lines.append(line)
            
        i += 1
        
    with open(filepath, 'w') as f:
        f.write('\n'.join(new_lines))

for f in glob.glob('lib/src/web/manager/*.dart'):
    fix(f)

