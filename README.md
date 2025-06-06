# **Bachelor thesis project** - PulseVision

PulseVision: AI-based blood pressure estimation from wrist images using Convolutional Neural Networks (CNNs)

This repository contains the code and materials developed for my Bachelor's thesis in Computer Engineering at the University of Pisa.

**Thesis title:**  
*"Stima della pressione arteriosa attraverso tecniche di intelligenza artificiale"*  
("Blood Pressure Estimation through Artificial Intelligence Techniques")

📄 [Download full thesis (PDF)](bachelor_thesis/bachelor_thesis.pdf)

## Project Overview

The goal of this project is to estimate blood pressure categories (low, normal, high) starting from simple images of the wrist, using a Convolutional Neural Network (CNN). The approach is designed to explore the feasibility of **non-invasive blood pressure estimation** based on visual features.

The system was trained using a custom dataset collected with:
- **OMRON RS7 Intelli IT** wrist blood pressure monitor
- **Shimmer3 GSR+ sensor**

Data pre-processing and target discretization were performed using MATLAB scripts:
- `buildDataset.m`
- `discretizeTargets.m`

The deep learning model was implemented in **Python** with **TensorFlow** and **Keras**.

## Repository Structure

```
pulsevision/
├── bachelor_thesis/
│   └── bachelor_thesis.pdf
├── data/
│   └── README.md  # data folder structure description
├── notebooks/
│   └── bp_estimation_cnn.ipynb
├── scripts/
│   ├── buildDataset.m
│   ├── discretizeTargets.m
├── requirements.txt
├── README.md

```
- `notebooks/bp_estimation_cnn.ipynb` — Main notebook implementing the models described in the thesis (Base Model and Regularized Model), training and evaluation.
- `scripts/` — MATLAB scripts used to build the dataset.
- `data/` — Data folder (structure to be created as expected by `image_dataset_from_directory`).
- `bachelor_thesis/bachelor_thesis.pdf` — Full thesis document (in Italian).
- `requirements.txt` — Required Python libraries.

## Main Techniques

- **Convolutional Neural Networks (CNN)** for image-based classification
- **Data augmentation** and **dropout** for regularization
- **Early stopping** for optimal model selection
- **Confusion matrix** and **F1 score** as evaluation metrics

## Results

The models were evaluated on a testing set using standard metrics. The results and corresponding figures are reported in Chapter 5 of the thesis.

