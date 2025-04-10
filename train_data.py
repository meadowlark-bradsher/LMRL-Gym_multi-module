import requests
import json

# 1) Download the file and save locally
url = "https://rail.eecs.berkeley.edu/datasets/rl-llm-bench-dataset/twenty-questions/train.json"
r = requests.get(url)
r.raise_for_status()
with open("train.json", "wb") as f:
    f.write(r.content)

# 2) Load the JSON from disk
with open("train.json", "r") as f:
    data = json.load(f)

# 3) Print how many top-level items
print(f"Number of trajectories: {len(data)}")
print(data[0])