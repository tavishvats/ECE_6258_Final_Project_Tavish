clear all; clc;
gt_dir = 'D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\Set12_dataset\Ground_Truth';
noisy_dir = 'D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\Set12_dataset\Noisy';
nlm_denoised_dir = 'D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\Set12_dataset\Denoised';
bm3d_denoised_dir = "D:\Padips\MS Docs\Georgia Tech\Coursework\Fall 2023 courses\ECE 6258 DIP\Project\Datasets\Set12_dataset\BM3D\BM3D_Denoised";
gauss_nlm_msunique = [];
sp_nlm_msunique = [];

index_list = ["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12"];
%index_list(2)
for i = 1:length(index_list)
    gauss_noisy_file_path = noisy_dir + "\" + index_list(i) + "_gauss_noisy.png";
    gauss_noisy = imread(gauss_noisy_file_path);
    sp_noisy_file_path = noisy_dir + "\" + index_list(i) + "_sp_noisy.png";
    sp_noisy = imread(sp_noisy_file_path);

    gauss_denoised_file_path = nlm_denoised_dir + "\" + index_list(i) + "_gauss_denoised.png";
    gauss_denoised = imread(gauss_denoised_file_path);
    sp_denoised_file_path = nlm_denoised_dir + "\" + index_list(i) + "_sp_denoised.png";
    sp_denoised = imread(sp_denoised_file_path);
    
    gauss_nlm_msunique = [gauss_nlm_msunique; [index_list(i), mslMSUNIQUE(gauss_noisy, gauss_denoised)]];
    sp_nlm_msunique = [sp_nlm_msunique; [index_list(i), mslMSUNIQUE(sp_noisy, sp_denoised)]];

end
%gauss_nlm_msunique

writematrix(gauss_nlm_msunique, 'set_12_nlm_gauss_msunique.xls')
writematrix(sp_nlm_msunique, 'set_12_nlm_sp_msunique.xls')
%writematrix(sp_nlm_msunique, 'set_12_bm3d_sp_msunique.xls')
%writematrix(gauss_nlm_msunique, 'set_12_bm3d_gauss_msunique.xls')
