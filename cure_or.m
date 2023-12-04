clear all; clc;
%gt_dir = 'D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\Set12_dataset\Ground_Truth';
noisy_dir = "D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\CURE-OR\09_spnoise_level3";
nlm_denoised_dir = "D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\CURE-OR\09_spnoise_level3_denoised";
bm3d_denoised_dir = "D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\CURE-OR\09_spnoise_level3_bm3d_denoised";
nlm_csv= [];
bm3d_csv = [];

index_list = ["001" "002" "003" "004" "005" "006" "007" "008" "009" "010"];
prefix = "4_5_1_"; suffix = "_09_3";

for i = 1:length(index_list)
    noisy_file_path = noisy_dir + "\" + prefix + index_list(i) + suffix + ".jpg";
    noisy = imread(noisy_file_path);
    
    nlm_denoised_file_path = nlm_denoised_dir + "\" + prefix + index_list(i) + suffix + "_denoised.jpg";
    nlm_denoised = imread(nlm_denoised_file_path);
    bm3d_denoised_file_path = bm3d_denoised_dir + "\" + prefix + index_list(i) + suffix + "_bm3d_denoised.jpg";
    bm3d_denoised = imread(bm3d_denoised_file_path);
    
    nlm_csv = [nlm_csv; [index_list(i), mslUNIQUE(noisy, nlm_denoised)]];
    bm3d_csv = [bm3d_csv; [index_list(i), mslUNIQUE(noisy, bm3d_denoised)]];

end
%nlm_csv

writematrix(nlm_csv, 'cure_or_nlm_gauss_csv.xls')
writematrix(bm3d_csv, 'cure_or_nlm_sp_csv.xls')
