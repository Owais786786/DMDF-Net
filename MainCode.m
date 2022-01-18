% This code is written in Matlab R2020b version
clc;
clear all;
close all;
%% Step 1: Load our trained DMDF_Net1_Lung_Seg and DMDF_Net2_Inf_Seg models
load('DMDF_Net1_Lung_Seg.mat');
load('DMDF_Net2_Inf_Seg.mat');

%% Step 2: Get User input for Task selection
opt1 = inputdlg( 'Enter 0 for Task 1 (Lung Segmentation) OR Enter 1 for Task 2 (Infection Segmentation)' ,'Sample' , [1 100]);

if opt1{1} == '0'
   [fn1,pn1] =  uigetfile('*.png','Select Lung CT Image from "Sample Data\COVID-19-CT-Seg_Lung Segmentation Images" folder');
   img1 = imread(strcat(pn1,fn1));
   [predPixLabelLung,probScore,temp]  = semanticseg(img1,DMDF_Net1_Lung_Seg);
   MaskLung = predPixLabelLung=='Lung';
   MaskLung = uint8(1 * mat2gray(MaskLung));
   subplot(131); imshow(img1,[]);
   title('Input CT image');
   subplot(132); imshow(imread(strcat(pn1,fn1(1:end-4),'_mask.png')),[]);
   title('Ground truth lung ROI');
   subplot(133); imshow(MaskLung,[]);
   title('Predicted lung ROI');
elseif opt1{1} == '1'
    opt2 = inputdlg( 'Enter 0 for without preprocessing, OR Enter 1 for with preprocessing, OR Enter 2 for with pre- and post-processing' ,'Sample' , [1 150]);
    [fn2,pn2] =  uigetfile('*.png','Select Infected CT Image from "Sample Data\MosMed_Infection Segmentation Images" folder');
    img2 = imread(strcat(pn2,fn2)); 
    if opt2{1} == '0'    
        [predPixLabelInf,probScore,temp]  = semanticseg(img2,DMDF_Net2_Inf_Seg);
         MaskInf = predPixLabelInf=='Lung';
         MaskInf = uint8(1 * mat2gray(MaskInf));
         subplot(131); imshow(img2,[]);
         title('Input CT image');
         subplot(132); imshow(imread(strcat(pn2,fn2(1:end-4),'_mask.png')),[]);
         title('Ground truth infection ROI');
         subplot(133); imshow(MaskInf,[]);
         title('Predicted infection ROI');
    elseif opt2{1} == '1'
        img2_RH = function_RH_Transformation(img2,imread('Taget Domain Sample.png'));
        [predPixLabelInf,probScore,temp]  = semanticseg(img2_RH,DMDF_Net2_Inf_Seg);
         MaskInf = predPixLabelInf=='Lung';
         MaskInf = uint8(1 * mat2gray(MaskInf));
         subplot(131); imshow(img2_RH,[]);
         title('Input CT image after preprocessing');
         subplot(132); imshow(imread(strcat(pn2,fn2(1:end-4),'_mask.png')),[]);
         title('Ground truth infection ROI');
         subplot(133); imshow(MaskInf,[]);
         title('Predicted infection ROI after preprocessing');
    elseif opt2{1} == '2'
        img2_RH = function_RH_Transformation(img2,imread('Taget Domain Sample.png'));
        [predPixLabelInf,probScore,temp]  = semanticseg(img2_RH,DMDF_Net2_Inf_Seg);
         MaskInf = predPixLabelInf=='Lung';
         MaskInf = uint8(1 * mat2gray(MaskInf));
         
        [predPixLabelLung,probScore,temp]  = semanticseg(img2_RH,DMDF_Net1_Lung_Seg);
         MaskLung = predPixLabelLung=='Lung';
         MaskLung = uint8(1 * mat2gray(MaskLung));
         
         MaskInf = MaskInf.*MaskLung;
   
         subplot(131); imshow(img2_RH,[]);
         title('Input CT image after preprocessing');
         subplot(132); imshow(imread(strcat(pn2,fn2(1:end-4),'_mask.png')),[]);
         title('Ground truth infection ROI');
         subplot(133); imshow(MaskInf,[]);
         title('Predicted infection ROI after pre- and post-processing');
    end
end