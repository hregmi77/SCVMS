% Complete program of classifying and volume measurement
% 3/4/2016
    clear all; home ; clc;
    %********Image Acquisition******%
    tic;
    vid = videoinput('winvideo',1,'RGB24_1920x1080');
    preview(vid);
    
    syringe_image = getsnapshot(vid);
    syringe_image = imrotate(syringe_image,180);
    syringe_image2 = syringe_image(250:750, 500:1200,:);
    %********Finding Syringe Cap centroid******%
     I = im2double(syringe_image2);
    % T=im2double(imread('syringe_cap_yellow.jpg'));
    % [I_SSD,I_NCC]=template_matching(T,I);
    % [x,y]=find(I_SSD==max(I_SSD(:)));
     %if(x < 150 || x > 700)
     T=im2double(imread('syringe_cap_blue.jpg'));
     [I_SSD,I_NCC]=template_matching(T,I);
     [x,y]=find(I_SSD==max(I_SSD(:)));
    % x = x + 14;
    % end
     cap_x = y; cap_y = x;

  figure(1),imshow(syringe_image2); 
  hold on;
  plot(cap_x,cap_y,'ro','Linewidth',4);
  drawnow;
  
  syringe_gray = rgb2gray(syringe_image2);
     [w,h] = size(syringe_gray);
     syringe_binary = zeros(w,h);
         for i=1:w
            for j=1:h
                if(syringe_gray(i,j) < 100)
                    syringe_binary(i,j) = 1;
                end
            end
         end
  figure(2), imshow(syringe_binary);
  
 syringe_binary2 = syringe_binary(cap_x-250:w,:);
  figure(3), imshow(syringe_binary2);
  [w,h] = size(syringe_binary2);
       CC = bwconncomp(syringe_binary2);
       numPixels = cellfun(@numel,CC.PixelIdxList);
       [biggest,idx] = max(numPixels);
       plunger_image = zeros(w,h);
       plunger_image(CC.PixelIdxList{idx}) = 1;
%        S = regionprops(plunger_image, {'BoundingBox'});
%        bbox = vertcat(S.BoundingBox);
%        width = bbox(:,3);
% To calculate Lowest points of Plunger Region
   lowest_x = 1;
       lowest_y = 1;
        for i=1:w
            for j=1:h
                if(plunger_image(i,j)==1)
                    if(lowest_x < i)
                    lowest_x = i;
                    lowest_y = j;
                    end
                end
            end
        end
     hold off;
   figure(4),imshow(plunger_image); 
  hold on;
  plot(lowest_x,lowest_y,'ro','Linewidth',4);
  drawnow;