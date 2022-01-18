A) Instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
1. We used open datasets in this work and according to given instructions, we are not allowed to redistribute these datasets. Therefore, we just provided a few sample images with our code.
2. You can download all the datasets from the available resources as cited in our paper namely “DMDF-Net: Dual Multiscale Dilated Fusion Network for Accurate Segmentation of Lesions Related to COVID-19 in Lung Radiographic Scans"
3. Any work that uses the provided pretrained networks must acknowledge the authors by including the following reference.
"Muhammad Owais, Na Rae Baek, Tahir Mahmood, Adnan Haider, Haseeb Sultan, and Kang Ryoung Park, “DMDF-Net: Dual Multiscale Dilated Fusion Network for Accurate Segmentation of Lesions Related to COVID-19 in Lung Radiographic Scans,” Expert Systems with Applications, in submission"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

B) How to run this code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Step 1: Open the given code file named as "ModelCode.m" in MATLAB (preferably MATLAB version is R2020b)
Step 2: Run this code (press F5), After execution, the code will require a user input (for task selection) in a window box

Note:
->If you want to test our model for Task1 (lung segmentation): Enter 0 in window box and press enter
  After that select CT image from the given data folder namely "Sample Dataset"
->If you want to test our model for Task2 (infection segmentation): Enter 1 in window box and press enter
  After that select further option by entering 0, 1 , or 3 in window box for selecting 'without preprocessing', 'with preprocessing', or 'with pre- and post-processing', respectively.
Finally, select CT image from the given data folder namely "Sample Dataset"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

