# Data Folder

This folder is expected to contain the image dataset used for training, validation and testing in this project.

## Dataset Overview

The original data consists of:

- wrist images (Polso), arm images (Braccio), and back of the hand images (Dorso)
- CSV files with blood pressure measurements (targets)

The original raw data was processed using the following MATLAB scripts:

- `../scripts/buildDataset.m` — processes the original images and generates preprocessed images suitable for model training.
- `../scripts/discretizeTargets.m` — discretizes the blood pressure targets into categories used for classification.

## Expected 

```
data/
├── class_1/
│   ├── img1.jpg
│   ├── img2.jpg
├── class_2/
│   ├── img3.jpg
│   ├── img4.jpg
├── class_3/
│   ├── img5.jpg
│   ├── img6.jpg
└── targets.csv   # optional — CSV with targets if needed
```

Once generated, the processed dataset should be placed here following the structure shown below.

## How to Generate the Data

To generate the data:

1. Place the original raw data in the expected folder structure (see `buildDataset.m`).
2. Run `buildDataset.m` to generate preprocessed images.
3. Run `discretizeTargets.m` to create the corresponding target categories.
4. Move the generated `imgs/` folder to `data/`, respecting the expected class folder structure.

**Important:**  
The original raw data is not included in this repository.  
You must generate the dataset yourself or request access to it.
