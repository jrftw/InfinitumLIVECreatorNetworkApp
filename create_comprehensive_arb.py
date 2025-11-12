#!/usr/bin/env python3
"""
Filename: create_comprehensive_arb.py
Purpose: Create comprehensive ARB file from extracted strings
Author: Kevin Doyle Jr. / Infinitum Imagery LLC
Last Modified: 2025-01-27
"""

import json
import re
from pathlib import Path

def create_arb_key(text):
    """Convert text to a valid ARB key."""
    # Remove special characters, convert to camelCase
    key = re.sub(r'[^\w\s]', '', text)
    key = re.sub(r'\s+', ' ', key)
    words = key.split()
    if not words:
        return 'string'
    
    # Convert to camelCase
    key = words[0].lower() + ''.join(word.capitalize() for word in words[1:])
    
    # Remove invalid characters
    key = re.sub(r'[^a-zA-Z0-9]', '', key)
    
    # Ensure it starts with a letter
    if key and key[0].isdigit():
        key = 'str' + key
    
    # Limit length
    if len(key) > 50:
        key = key[:50]
    
    return key if key else 'string'

def main():
    """Create comprehensive ARB file."""
    # Read existing ARB file
    arb_path = Path('lib/l10n/app_en.arb')
    with open(arb_path, 'r', encoding='utf-8') as f:
        arb_data = json.load(f)
    
    # Read extracted strings
    strings_path = Path('extracted_strings.txt')
    if not strings_path.exists():
        print("extracted_strings.txt not found. Run extract_all_strings.py first.")
        return
    
    with open(strings_path, 'r', encoding='utf-8') as f:
        all_strings = [line.strip() for line in f if line.strip()]
    
    # Add new strings to ARB
    added_count = 0
    for string in all_strings:
        # Skip if already exists or is too short/technical
        if len(string) < 3:
            continue
        
        # Create key
        key = create_arb_key(string)
        
        # Handle duplicates by appending number
        original_key = key
        counter = 1
        while key in arb_data:
            key = f"{original_key}{counter}"
            counter += 1
        
        # Add to ARB
        arb_data[key] = string
        added_count += 1
    
    # Write updated ARB file
    with open(arb_path, 'w', encoding='utf-8') as f:
        json.dump(arb_data, f, ensure_ascii=False, indent=2)
    
    print(f"Added {added_count} new strings to ARB file")
    print(f"Total strings in ARB: {len(arb_data)}")

if __name__ == '__main__':
    main()

