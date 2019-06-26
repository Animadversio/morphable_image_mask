%% Circle mask 
Width = 600; Cent = Width /2 ; Radius = 100; %Center_dist = 40; 
figure(1)
img = 0.5 * ones(Width);
circ_mask = insertShape(img, 'FilledCircle', [Cent, Cent, Radius],...
                        'Color', [1,1,1], 'Opacity', 1);
imshow(circ_mask)
alphachannel = all(circ_mask == 1, 3); %replace 255 with 1 if img is double
%%
imwrite(img, 'mask.png', 'Alpha', double(1 - alphachannel));
%% Gaussian Filtered Blurred Mask
sigma = 20;
blurry_mask = imgaussfilt(double(1 - alphachannel),sigma);
imwrite(img, 'blurrymask.png', 'Alpha', blurry_mask);
%% Gaussian Filtered Blurred Blob
sigma = 20;
blurry_blob = imgaussfilt(double(alphachannel),sigma);
imwrite(img, 'blurryblob.png', 'Alpha', blurry_blob);

%%
% THETA = linspace(0, 2*pi,100); 
% UNIT_CIRC = [cos(THETA'), sin(THETA')];
% Shear_Mat = [1, 2; 2, 1]; 
% Ellipsoid = 50 * UNIT_CIRC  + [Cent, Cent];
% Ellipsoid = [Ellipsoid ; Ellipsoid(end,:)];
% ellip_vert_list = Ellipsoid(:)'; % Using too many vertices in polygon
% % seems not working ! maybe too many adjacent points 
% ellips_mask = insertShape(img, 'FilledPolygon', ellip_vert_list,'LineWidth',5,...
%                         'Color', [1,1,1], 'Opacity', 1, 'SmoothEdges', true);
% figure; imshow(ellips_mask);

%%
figure(1);hold on; imshow(img)
contour_h = drawellipse(gca, 'Color',[0,0,0], 'FaceAlpha', 0.9);

%%
THETA = linspace(0, 2*pi,100); 
UNIT_CIRC = [cos(THETA'), sin(THETA')];
Shear_Mat = [1, 2; 2, 1]; 
Ellipsoid = 50 * UNIT_CIRC * Shear_Mat + [Cent, Cent];
h = figure('Position', [50,50, 600,600]); % hold on ; ax = imshow(img);
fill(Ellipsoid(:,1),Ellipsoid(:,2),[0,0,0],'FaceAlpha', 0.6)
xlim([0,600])
ylim([0,600])
axis equal
% I = getimage(gca); % Get image fetch only image format data not lines or
% polygons. 
% F = getframe(gca); % get frame record the ticks and boundaries not so
% good 
% imwrite(F.cdata, 'File.png');
%%
greybg = 0.5 * ones(Width);
img = imread("C:\Users\ponce\OneDrive\Desktop\OneDrive_Binxu\OneDrive\QE_images\block065_gen_gen000_000031.jpg");
%% Draw mask from free hand mouse drawing 
figure; imshow(img)
contour_h = drawfreehand;
mask = createMask(contour_h);
%contour_h.cre
greybg = 0.5 * ones(size(img));
sigma = 10;
blurry_free_mask = imgaussfilt(double(1 - mask),sigma);
imwrite(greybg, 'blurryfreemask2.png', 'Alpha', blurry_free_mask);
blurry_free_mask = imgaussfilt(double(mask),sigma);
imwrite(greybg, 'blurryfreeblob2.png', 'Alpha', blurry_free_mask);
%%
img = imread("C:\Users\ponce\OneDrive\Desktop\OneDrive_Binxu\OneDrive\QE_images\block089_gen_gen000_000010.jpg");
sigma = 10;
blurry_free_mask = imgaussfilt(double(1 - mask),sigma);
imwrite(img, 'blurryfreemask2_img.png', 'Alpha', blurry_free_mask);
blurry_free_mask = imgaussfilt(double(mask),sigma);
imwrite(img, 'blurryfreeblob2_img.png', 'Alpha', blurry_free_mask);
%%
figure(1);imshow(img)
contour_h = drawellipse(gca, 'Color',[0,0,0], 'FaceAlpha', 0.9);
ellips_mask = createMask(contour_h);
blurry_free_mask = imgaussfilt(double(1 - ellips_mask),sigma);
imwrite(img, 'blurryfreeellipsmask.png', 'Alpha', blurry_free_mask);
blurry_free_mask = imgaussfilt(double(ellips_mask),sigma);
imwrite(img, 'blurryfreeellipsblob.png', 'Alpha', blurry_free_mask);
%%
fig_h = figure(1);
contour_h1 = fig_h.Children.Children(1);
mask = createMask(contour_h1);

img = imread("C:\Users\ponce\OneDrive\Desktop\OneDrive_Binxu\OneDrive\QE_images\block034_gen_gen000_000021.jpg");
greybg = 0.5 * ones(size(img));
sigma = 10;
blurry_free_mask = imgaussfilt(double(1 - mask),sigma);
imwrite(img, 'blurryfreemask_img2.png', 'Alpha', blurry_free_mask);
blurry_free_mask = imgaussfilt(double(mask),sigma);
imwrite(img, 'blurryfreeblob_img2.png', 'Alpha', blurry_free_mask);