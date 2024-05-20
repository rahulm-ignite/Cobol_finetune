import pandas as pd
import numpy as np


import os
import glob
import json

def read_cobol_files(directory):
    # Create a pattern to match all COBOL files, assuming .cbl as the file extension

    
    cobol_files = []  # List to store the paths of COBOL files
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.cob') or file.endswith('.cbl') or file.endswith('*.cpy'):
                cobol_files.append(os.path.join(root, file))
    
    # Find all files in the directory matching the pattern

  #  print(cobol_files)
    # List to store messages in the required JSON format
    final_json = []
    
    for file_path in cobol_files:
        messages = []
        # Read the content of the file
    #    print(file_path)
        try :
            with open(file_path, 'r') as file:
                content = file.read()
        except Exception as e:
            pass
        
        length = int(round(.7*len(content),0))
        # Append to messages as specified in the JSON structure
        messages.append({
            "role": "system",
            "content": "You are a COBOL code generator. 70% of the code is given to you. You need to infer the logic and complete the rest 30% of the code. The code is strictly in COBOL language. You need to output only the remaining 30% of the code"
        })
        messages.append({
            "role": "user",
            "content": content[:length]  # Insert 70% of fetched code here
        })
        messages.append({
            "role": "assistant",
            "content": content[length:]   # Assuming 100% completion here for simplicity
        })
    
    # Convert the list of messages to a JSON object
        result_json ={}
        result_json = json.dumps({"messages": messages})
        final_json.append(result_json)
    return final_json

# Usage: Replace 'path_to_directory' with the actual path to the directory containing COBOL files
directory_path = './X-COBOL'
formatted_json = read_cobol_files(directory_path)
# Write the list of messages to a JSON file
output_file = 'output_messages.txt'
with open(output_file, 'w', encoding='utf-8') as f:
    for j in formatted_json:
        f.write(str(j))
        f.write("\n")
