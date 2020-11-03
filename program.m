v = VideoReader('wipe.mp4');
numRows = v.Height;
numCols = v.Width;
numFrames = v.NumberOfFrames;

% this is the matrix that should have the stripe
% make it now so that we don't have to reallocate space on new values
final = zeros(numCols, numFrames-1);

%for each frame we make a column with the previous frame
for j=2:numFrames
    frame1 = read(v,j);
    frame2 = read(v,j-1);

    % makes a column, comparing two frames
    for i=1:numCols
        final(i, j-1) = hicomparecol(frame1, frame2, i);
    end
end

A = mat2gray(final, [0,1]);
imwrite(A, 'image1.png');

% threshold matrix of values 0.75 or higher
for a=1:size(final, 1)
    for b=1:size(final, 2)
        if final(a,b) > 0.7
            final(a,b) = 1;
        else
            final(a,b) = 0;
        end
    end
end

I = mat2gray(final, [0,1]);
imwrite(I, 'image2.png');
