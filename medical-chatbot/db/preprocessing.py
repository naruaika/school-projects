import glob
import json
import os


"""Penyakit DB

Processing all the `alodokter_penyakit*.json`, then
save as a single file DB: `alodokter_penyakit.json`.
"""

dataset = {}

# Load all dataset
for filename in glob.glob(os.path.join(os.getcwd(), 'raw/alodokter_penyakit*.json')):
    with open(filename, 'r') as f:
        data = json.load(f)

        for key, value in data.items():
            key = key.lower().lstrip().rstrip()

            # Shape all keys into simple questions
            if 'definisi' in key:
                key = key.replace('definisi', 'apa itu')
            elif any(word in key for word in ['diagnosis', 'pengobatan', 'pencegahan']):
                key = 'bagaimana ' + key
            else:
                key = 'apa ' + key

            key += '?'
            value = value.replace('\n', '').replace('$$$', '').replace('> <', '><')

            dataset.update({key: value})

# Save as new dataset
with open(os.path.join(os.getcwd(), 'alodokter_penyakit.json'), 'w') as f:
    json.dump(dataset, f)


"""Obat DB

Processing all the `alodokter_obat*.json`, then
save as a single file DB: `alodokter_obat.json`.
"""

dataset = {}

# Load all dataset
for filename in glob.glob(os.path.join(os.getcwd(), 'raw/alodokter_obat*.json')):
    with open(filename, 'r') as f:
        data = json.load(f)

        for key, value in data.items():
            key = 'apa itu ' + key.lower().lstrip().rstrip() + '?'
            value = value.replace('\n', '').replace('$$$', '').replace('> <', '><')

            dataset.update({key: value})

# Save as new dataset
with open(os.path.join(os.getcwd(), 'alodokter_obat.json'), 'w') as f:
    json.dump(dataset, f)
