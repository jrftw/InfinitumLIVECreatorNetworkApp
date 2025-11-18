#!/usr/bin/env python3
"""
Filename: sync_localization_files.py
Purpose: Sync all language ARB files with the English template to ensure all keys are present
Author: Kevin Doyle Jr. / Infinitum Imagery LLC
Last Modified: 2025-01-27
Dependencies: json, os, glob
Platform Compatibility: Cross-platform
"""

import json
import os
import glob
from pathlib import Path

def read_arb_file(file_path):
    """Read an ARB file and return its contents."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return None

def write_arb_file(file_path, data):
    """Write an ARB file with proper formatting."""
    try:
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
        return True
    except Exception as e:
        print(f"Error writing {file_path}: {e}")
        return False

def sync_arb_file(template_data, target_file_path):
    """Sync a target ARB file with the template, preserving existing translations."""
    # Read the existing target file
    target_data = read_arb_file(target_file_path)
    if target_data is None:
        # If file doesn't exist or can't be read, create a new one from template
        target_data = {}
        target_data['@@locale'] = template_data['@@locale']
    
    # Preserve the locale from the target file (or use template if not set)
    locale = target_data.get('@@locale', template_data.get('@@locale', 'en'))
    
    # Create a new data structure starting with the template
    synced_data = json.loads(json.dumps(template_data))
    synced_data['@@locale'] = locale
    
    # Count missing and preserved keys
    missing_keys = []
    preserved_keys = []
    
    # For each key in the template, check if target has a translation
    for key in template_data.keys():
        if key == '@@locale':
            continue  # Skip locale, we handle it separately
        
        # Check if target has this key with a non-empty value
        if key in target_data and target_data[key] is not None:
            # Preserve the existing translation
            synced_data[key] = target_data[key]
            preserved_keys.append(key)
        else:
            # Use template value (English) as placeholder
            synced_data[key] = template_data[key]
            missing_keys.append(key)
    
    return synced_data, missing_keys, preserved_keys

def main():
    """Main function to sync all ARB files."""
    # Get the directory of this script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    l10n_dir = os.path.join(script_dir, 'lib', 'l10n')
    
    # Read the English template
    template_path = os.path.join(l10n_dir, 'app_en.arb')
    if not os.path.exists(template_path):
        print(f"Error: Template ARB file not found at {template_path}")
        return
    
    template_data = read_arb_file(template_path)
    if template_data is None:
        print("Error: Could not read template ARB file")
        return
    
    # Get all ARB files except the template
    arb_files = glob.glob(os.path.join(l10n_dir, 'app_*.arb'))
    arb_files = [f for f in arb_files if not f.endswith('app_en.arb')]
    
    print(f"Found {len(arb_files)} language files to sync")
    print(f"Template has {len([k for k in template_data.keys() if k != '@@locale'])} keys\n")
    
    total_missing = 0
    total_preserved = 0
    synced_count = 0
    
    for arb_file in sorted(arb_files):
        filename = os.path.basename(arb_file)
        locale = filename.replace('app_', '').replace('.arb', '')
        
        synced_data, missing_keys, preserved_keys = sync_arb_file(template_data, arb_file)
        
        # Write the synced file
        if write_arb_file(arb_file, synced_data):
            synced_count += 1
            total_missing += len(missing_keys)
            total_preserved += len(preserved_keys)
            
            if missing_keys:
                print(f"[OK] {filename}: Added {len(missing_keys)} missing keys, preserved {len(preserved_keys)} translations")
            else:
                print(f"[OK] {filename}: All keys present, preserved {len(preserved_keys)} translations")
        else:
            print(f"[FAIL] {filename}: Failed to sync")
    
    print(f"\n{'='*60}")
    print(f"Sync complete!")
    print(f"Files synced: {synced_count}/{len(arb_files)}")
    print(f"Total missing keys added: {total_missing}")
    print(f"Total translations preserved: {total_preserved}")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()

