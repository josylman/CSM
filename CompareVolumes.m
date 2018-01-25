clear all, close all
dbstop if error

% generate random binary images
XY = 100;   % x/y dimension
Z = 10;     % z dimension
N = 10;     % number of images per trial
T = 5;      % number of trials
thresh = 0.5;   % threshold
im = rand(XY,XY,Z,T,N);   % generate random greyscale (0 to 1) images
for i = 1:T
    for j = 1:N
        im(:,:,:,i,j) = smooth3(im(:,:,:,i,j),'box',5);  % filter the image so that we get blobs
    end
end
bw = im < thresh;    % binary (thresholded) images

% get volumes of "0" blobs in binary images
vols = cell(T,N);
for i = 1:T
    for j = 1:N
        temp = bwconncomp(bw(:,:,:,i,j));
        vols{i,j} = cellfun(@numel,temp.PixelIdxList);
    end
end

% compare volumes between images
bin_edge_1 = 2;
bin_edge_2 = 5;
nbins = 3;
vol_counts = zeros(nbins,T,N);
for i = 1:T
    for j = 1:N
        % count number of volumes for jth image from ith trial falling into bin 1
        vol_counts(1,i,j) = sum(vols{i,j} <= bin_edge_1);

        % count number of volumes for jth image from ith trial falling into bin 2
        vol_counts(2,i,j) = sum((bin_edge_1 < vols{i,j}) & (vols{i,j} <= bin_edge_2));

        % count number of volumes for jth image from ith trial falling into bin 3
        vol_counts(3,i,j) = sum(bin_edge_2 < vols{i,j});
    end
end
per_trial_mean_vols = mean(vol_counts,3);   % mean over all images in trial (3rd dimension)
per_trial_std_vols = std(vol_counts,0,3);     % standard deviation over all images in trial (3rd dimension)

% plots
figure;
subplot(2,1,1);
bar(per_trial_mean_vols,'grouped');
xlabel('bin');
ylabel('mean vols per bin');
subplot(2,1,2);
bar(per_trial_std_vols,'grouped');
xlabel('bin');
ylabel('std vols per bin');





