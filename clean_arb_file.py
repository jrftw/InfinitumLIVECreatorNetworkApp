#!/usr/bin/env python3
"""
Filename: clean_arb_file.py
Purpose: Clean ARB file by removing strings with Dart code syntax
Author: Kevin Doyle Jr. / Infinitum Imagery LLC
Last Modified: 2025-01-27
"""

import json
import re
from pathlib import Path

def should_remove_string(key, value):
    """Check if a string should be removed from ARB file."""
    # Remove strings with Dart code syntax
    if re.search(r'\$\{[^}]+\}', value):
        return True
    
    # Remove strings that are clearly code/logs
    if any(pattern in value for pattern in [
        'AppConfig.',
        'error.',
        'response.',
        'Logger.',
        'Version Manager',
        'API Response',
        'Failed to',
        'Error:',
        'Exception:',
    ]):
        return True
    
    # Remove very short strings that are likely not user-facing
    if len(value.strip()) < 3:
        return True
    
    # Remove strings that are clearly variable names or code
    if re.match(r'^[a-z_]+$', value) and len(value) < 20:
        return True
    
    return False

def main():
    """Clean the ARB file."""
    arb_path = Path('lib/l10n/app_en.arb')
    
    with open(arb_path, 'r', encoding='utf-8') as f:
        arb_data = json.load(f)
    
    # Get locale
    locale = arb_data.get('@@locale', 'en')
    
    # Clean the data
    cleaned_data = {'@@locale': locale}
    removed_count = 0
    
    for key, value in arb_data.items():
        if key.startswith('@@'):
            continue  # Keep metadata
        
        if key.startswith('@'):
            # Keep metadata for placeholders
            cleaned_data[key] = value
            continue
        
        if should_remove_string(key, value):
            removed_count += 1
            continue
        
        cleaned_data[key] = value
        # Keep associated metadata if it exists
        metadata_key = f'@{key}'
        if metadata_key in arb_data:
            cleaned_data[metadata_key] = arb_data[metadata_key]
    
    # Write cleaned ARB file
    with open(arb_path, 'w', encoding='utf-8') as f:
        json.dump(cleaned_data, f, ensure_ascii=False, indent=2)
    
    print(f"Removed {removed_count} problematic strings")
    print(f"Remaining strings: {len([k for k in cleaned_data.keys() if not k.startswith('@')])}")

if __name__ == '__main__':
    main()

