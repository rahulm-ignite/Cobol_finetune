import pandas as pd
import numpy as np


import os
import glob
import json

def read_cobol_files(directory):
    # Create a pattern to match all COBOL files, assuming .cbl as the file extension
    pattern = os.path.join(directory, '*.cob')
    
    # Find all files in the directory matching the pattern
    cobol_files = glob.glob(pattern)
    
    # List to store messages in the required JSON format
    final_json = []
    
    for file_path in cobol_files:
        messages = []
        # Read the content of the file
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
        
        length = int(round(.7*len(content),0))
        # Append to messages as specified in the JSON structure
        messages.append({
            "role": "system",
            "content": "You are a COBOL code generator. 70% of the code is given to you. You need to infer the logic and complete the rest 30%."
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
directory_path = '/Users/rahulmahajan/Desktop/IgniteTech/5_Projects/2_Cobol/Cobol_finetune/X-COBOL/COBOL_Files/Apress_cobol-VB-on-.net'
formatted_json = read_cobol_files(directory_path)
# Write the list of messages to a JSON file
output_file = 'output_messages.txt'
with open(output_file, 'w', encoding='utf-8') as f:
    f.write(str(formatted_json))
