# SCVMS
Data and matlab code for paper "A System for Real-Time Syringe Classification and Volume Measurement Using a Combination of Image Processing and Artificial Neural Networks"

## Instructions
- `Main_Program.m` is the file to run the test
- Each `NeuralNetwork_xxml.m` file are the program to load the data and save the trained model
- Each `NeuralNetwork_xxml.mat` are the trained model for each syringes
- `template_matching.m`: function to match the syringe cap and search over the whole image, and find the center of the syringe cap

## Data
- `X`: length of the plunger in pixels
- `Y`: Target volume of the medicine inside syringe
