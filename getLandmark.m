function [facerect, landmark, len_faces] = getLandmark(api,img,draw)

rst = detect_file(api, img, 'all');

img_width = rst{1}.img_width;
img_height = rst{1}.img_height;
face = rst{1}.face;
fprintf('Totally %d faces detected!\n', length(face));
len_faces = length(face);

if ~draw
    return;
end

im = imread(img);
%figure,imshow(im);
%hold on;

landmark = [];
for i = 1 : length(face)
    % Draw face rectangle on the image
    face_i = face{i};
    
    center = face_i.position.center;
    w = face_i.position.width / 100 * img_width;
    h = face_i.position.height / 100 * img_height;
    facerect = [center.x * img_width / 100 - w/2, center.y * img_height / 100 - h/2, center.x * img_width / 100 + w/2, center.y * img_height / 100 + h/2];
    facerect = round(facerect);
    
    % Detect facial key points
    rst2 = api.landmark(face_i.face_id, '83p');
    landmark_points = rst2{1}.result{1}.landmark;
    landmark_names = fieldnames(landmark_points);
    
    % Draw facial key points
    for j = 1 : length(landmark_names)
        pt = getfield(landmark_points, landmark_names{j});
        %scatter(pt.x * img_width / 100, pt.y * img_height / 100, 'g.');
        landmark = [landmark; [pt.x * img_width / 100, pt.y * img_height / 100]];
    end
end