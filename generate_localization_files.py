#!/usr/bin/env python3
"""
Filename: generate_localization_files.py
Purpose: Generate ARB localization files for all supported languages
Author: Kevin Doyle Jr. / Infinitum Imagery LLC
Last Modified: 2025-01-27
Dependencies: json, os
Platform Compatibility: Cross-platform
"""

import json
import os

# Language to locale code mapping
LANGUAGE_LOCALE_MAP = {
    "Afrikaans": "af",
    "Ainu": "ain",  # Note: Ainu may not have standard locale code
    "Akan": "ak",
    "Albanian": "sq",
    "Amharic": "am",
    "Arabic": "ar",
    "Aramaic": "arc",  # Note: May not have standard locale code
    "Armenian": "hy",
    "Assamese": "as",
    "Atayal": "tay",  # Note: May not have standard locale code
    "Aymara": "ay",
    "Azerbaijani": "az",
    "Balinese": "ban",
    "Bambara": "bm",
    "Bengali": "bn",
    "Bhojpuri": "bho",
    "Bikol": "bcl",
    "Bislama": "bi",
    "Bosnian": "bs",
    "Brahui": "brh",  # Note: May not have standard locale code
    "Bulgarian": "bg",
    "Burmese (Myanmar)": "my",
    "Cantonese (Yue Chinese)": "yue",
    "Catalan": "ca",
    "Cebuano": "ceb",
    "Chamorro": "ch",
    "Cheyenne": "chy",
    "Chichewa": "ny",
    "Chinese (Mandarin and regional varieties)": "zh",
    "Choctaw": "cho",
    "Chuukese": "chk",
    "Cree": "cr",
    "Croatian": "hr",
    "Czech": "cs",
    "Danish": "da",
    "Dari": "prs",
    "Dutch": "nl",
    "Dzongkha": "dz",
    "English": "en",
    "Estonian": "et",
    "Fijian": "fj",
    "Filipino (Tagalog-based)": "fil",
    "Finnish": "fi",
    "French": "fr",
    "Fula (Fulani)": "ff",
    "Gaelic (Scottish)": "gd",
    "Galician": "gl",
    "Georgian": "ka",
    "German": "de",
    "Greek": "el",
    "Gujarati": "gu",
    "Haitian Creole": "ht",
    "Hakka Chinese": "hak",
    "Hawaiian": "haw",
    "Hebrew": "he",
    "Hindi": "hi",
    "Hiri Motu": "ho",
    "Hmong": "hmn",
    "Hokkien": "nan",
    "Hungarian": "hu",
    "Iban": "iba",
    "Icelandic": "is",
    "Igbo": "ig",
    "Ilocano": "ilo",
    "Indonesian (Bahasa Indonesia)": "id",
    "Inuktitut": "iu",
    "Irish Gaelic": "ga",
    "Italian": "it",
    "Japanese": "ja",
    "Javanese": "jv",
    "Kannada": "kn",
    "Kapampangan": "pam",
    "Karen": "kar",
    "Kashmiri": "ks",
    "Kazakh": "kk",
    "Khmer": "km",
    "Kinyarwanda": "rw",
    "Kirundi": "rn",
    "Korean": "ko",
    "Kurdish": "ku",
    "Lao": "lo",
    "Latin": "la",
    "Latvian": "lv",
    "Lithuanian": "lt",
    "Luganda": "lg",
    "Luo": "luo",
    "Luxembourgish": "lb",
    "Macedonian": "mk",
    "Malay (Bahasa Melayu)": "ms",
    "Malayalam": "ml",
    "Maltese": "mt",
    "Mandarin Chinese": "zh-CN",
    "Maori (Te Reo Māori)": "mi",
    "Maranao": "mrw",
    "Marathi": "mr",
    "Marshallese": "mh",
    "Mayan Languages (various)": "myn",  # Generic code for Mayan languages
    "Mien": "ium",
    "Mongolian": "mn",
    "Nahuatl": "nah",
    "Nauruan": "na",
    "Navajo": "nv",
    "Nepali": "ne",
    "Niuean": "niu",
    "Norwegian": "no",
    "Ojibwe": "oj",
    "Pampangan": "pam",
    "Pangasinan": "pag",
    "Papiamento": "pap",
    "Persian (Farsi)": "fa",
    "Polish": "pl",
    "Portuguese": "pt",
    "Punjabi": "pa",
    "Quechua": "qu",
    "Rapa Nui": "rap",
    "Romanian": "ro",
    "Russian": "ru",
    "Samoan": "sm",
    "Sanskrit": "sa",
    "Serbian": "sr",
    "Shona": "sn",
    "Sindhi": "sd",
    "Sinhala": "si",
    "Slovak": "sk",
    "Slovenian": "sl",
    "Somali": "so",
    "Spanish": "es",
    "Swahili": "sw",
    "Swedish": "sv",
    "Tagalog": "tl",
    "Tahitian": "ty",
    "Tamil": "ta",
    "Tausug": "tsg",
    "Telugu": "te",
    "Tetum": "tet",
    "Thai": "th",
    "Tibetan": "bo",
    "Tigrinya": "ti",
    "Tok Pisin": "tpi",
    "Tokelauan": "tkl",
    "Tongan": "to",
    "Tswana": "tn",
    "Turkish": "tr",
    "Turkmen": "tk",
    "Uighur": "ug",
    "Ukrainian": "uk",
    "Urdu": "ur",
    "Uzbek": "uz",
    "Vietnamese": "vi",
    "Visayan (Bisaya)": "ceb",
    "Waray": "war",
    "Welsh": "cy",
    "Wu Chinese (Shanghainese)": "wuu",
    "Xhosa": "xh",
    "Yapese": "yap",
    "Yiddish": "yi",
    "Yoruba": "yo",
    "Zapotec": "zap",
    "Zulu": "zu"
}

def read_base_arb_file(file_path):
    """Read the base English ARB file."""
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def generate_arb_file(base_data, locale_code, output_path):
    """Generate an ARB file for a specific locale."""
    # Create a copy of the base data
    arb_data = json.loads(json.dumps(base_data))
    
    # Update the locale
    arb_data['@@locale'] = locale_code
    
    # Write to file
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(arb_data, f, ensure_ascii=False, indent=2)
    
    print(f"Generated: {output_path}")

def main():
    """Main function to generate all ARB files."""
    # Get the directory of this script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    l10n_dir = os.path.join(script_dir, 'lib', 'l10n')
    
    # Ensure the l10n directory exists
    os.makedirs(l10n_dir, exist_ok=True)
    
    # Read the base English ARB file
    base_arb_path = os.path.join(l10n_dir, 'app_en.arb')
    if not os.path.exists(base_arb_path):
        print(f"Error: Base ARB file not found at {base_arb_path}")
        return
    
    base_data = read_base_arb_file(base_arb_path)
    
    # Generate ARB files for all languages
    generated_count = 0
    for language_name, locale_code in LANGUAGE_LOCALE_MAP.items():
        if locale_code == 'en':
            continue  # Skip English, already exists
        
        # Handle locale codes with hyphens (e.g., zh-CN)
        filename = f"app_{locale_code.replace('-', '_')}.arb"
        output_path = os.path.join(l10n_dir, filename)
        
        try:
            # For locale codes with hyphens in filename, use underscore in @@locale too
            locale_for_file = locale_code.replace('-', '_') if '-' in locale_code else locale_code
            generate_arb_file(base_data, locale_for_file, output_path)
            generated_count += 1
        except Exception as e:
            print(f"Error generating {filename}: {e}")
    
    print(f"\nGenerated {generated_count} localization files.")
    print(f"Total languages supported: {generated_count + 1} (including English)")

if __name__ == '__main__':
    main()

