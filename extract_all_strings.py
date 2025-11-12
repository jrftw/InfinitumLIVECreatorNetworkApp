#!/usr/bin/env python3
"""
Filename: extract_all_strings.py
Purpose: Extract all hardcoded strings from Dart files for localization
Author: Kevin Doyle Jr. / Infinitum Imagery LLC
Last Modified: 2025-01-27
"""

import re
import os
import json
from pathlib import Path

def extract_strings_from_dart(file_path):
    """Extract all string literals from a Dart file."""
    strings = []
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Pattern to match string literals (single, double, triple quotes)
        # Exclude comments and import statements
        patterns = [
            r"const\s+Text\(['\"]([^'\"]+)['\"]",  # const Text('...')
            r"Text\(['\"]([^'\"]+)['\"]",  # Text('...')
            r"title:\s*['\"]([^'\"]+)['\"]",  # title: '...'
            r"label:\s*['\"]([^'\"]+)['\"]",  # label: '...'
            r"subtitle:\s*['\"]([^'\"]+)['\"]",  # subtitle: '...'
            r"description:\s*['\"]([^'\"]+)['\"]",  # description: '...'
            r"content:\s*['\"]([^'\"]+)['\"]",  # content: '...'
            r"['\"]([A-Z][^'\"]{3,})['\"]",  # General capitalized strings
        ]
        
        for pattern in patterns:
            matches = re.finditer(pattern, content)
            for match in matches:
                string = match.group(1)
                # Filter out very short strings, URLs, and technical strings
                if (len(string) > 2 and 
                    not string.startswith('http') and
                    not string.startswith('@') and
                    not string.startswith('lib/') and
                    not re.match(r'^[a-z_]+$', string) and  # Skip variable names
                    string not in strings):
                    strings.append(string)
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
    
    return strings

def main():
    """Main function to extract strings from all Dart files."""
    lib_dir = Path('lib')
    all_strings = set()
    
    # Walk through all Dart files
    for dart_file in lib_dir.rglob('*.dart'):
        if 'l10n' in str(dart_file) or 'generated' in str(dart_file):
            continue  # Skip localization files
        
        strings = extract_strings_from_dart(dart_file)
        all_strings.update(strings)
        if strings:
            print(f"Found {len(strings)} strings in {dart_file}")
    
    print(f"\nTotal unique strings found: {len(all_strings)}")
    
    # Write to a text file for review
    with open('extracted_strings.txt', 'w', encoding='utf-8') as f:
        for s in sorted(all_strings):
            f.write(f"{s}\n")
    
    print("Strings written to extracted_strings.txt")

if __name__ == '__main__':
    main()

