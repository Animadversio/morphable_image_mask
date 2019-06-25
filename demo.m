
Width = 600; Cent = Width /2 ; Radius = 100; %Center_dist = 40; 
figure(1)
img = 0.5 * ones(Width);
circ_mask = insertShape(img, 'FilledCircle', [Cent, Cent, Radius],...
                        'Color', [1,1,1], 'Opacity', 1);
imshow(circ_mask)
alphachannel = all(circ_mask == 1, 3); %replace 255 with 1 if img is double
%%
imwrite(img, 'mask.png', 'Alpha', double(1 - alphachannel));
%%
sigma = 20;
blurry_mask = imgaussfilt(double(1 - alphachannel),sigma);
imwrite(img, 'blurrymask.png', 'Alpha', blurry_mask);
%%
sigma = 20;
blurry_blob = imgaussfilt(double(alphachannel),sigma);
imwrite(img, 'blurryblob.png', 'Alpha', blurry_blob);