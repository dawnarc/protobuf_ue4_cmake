
#batch replace string in a directory recursively

import os
import glob
import io

drc = './src'

dic = { "LIBPROTOBUF_EXPORT": "PROTOBUF_API"}
        
def replace_all(text, dic):
    for i, j in dic.items():
        text = text.replace(i, j)
    return text
        
for file in glob.iglob(drc + '/**/*.h', recursive=True):
    print(file)
    new_text = ''
    with io.open(file,'r',encoding='utf8') as f:
        text = f.read()
    
        new_text = replace_all(text, dic);
        
    with io.open(file,'w',encoding='utf8') as f:
        f.write(new_text)