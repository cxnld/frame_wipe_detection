% this function takes two images and a column number and returns the
% histogram intersection of the column

function I = hicomparecol(image1, image2, colNum)
    image1double = im2double(image1);
    image2double = im2double(image2);

    column1 = image1double(:,colNum,:);
    column2 = image2double(:,colNum,:);

    R1 = column1(:, :, 1);
    G1 = column1(:, :, 2);
    B1 = column1(:, :, 3);
    total1 = R1+G1+B1;

    R2 = column2(:, :, 1);
    G2 = column2(:, :, 2);
    B2 = column2(:, :, 3);
    total2 = R2+G2+B2;

    % Chromaticity
    r1 = R1./total1;
    g1 = G1./total1;
    r1(isnan(r1))=0;
    g1(isnan(g1))=0;

    r2 = R2./total2;
    g2 = G2./total2;
    r2(isnan(r2))=0;
    g2(isnan(g2))=0;

    % Number of bins
    N = floor(1+log2(size(image1,1)))+1;

    maxthing = [max(r1(:)), max(r2(:)), max(g1(:)), max(g2(:))];
    numBins = linspace(0, max(maxthing), N);
    set(0,'DefaultFigureVisible','off')
    
    figure(1)
    H1 = histogram2(r1, g1, numBins, numBins,'Normalization','probability','DisplayStyle','tile','ShowEmptyBins','on');
    
    figure(2)
    H2 = histogram2(r2, g2, numBins, numBins,'Normalization','probability','DisplayStyle','tile','ShowEmptyBins','on');
  
    
    % I is a number that describes how similar the two histograms are
    % I~0 means they are very different, I~1 means they are very similar.
    I = 0;

    for i = 1:N-1
       for j = 1:N-1
           h1value = H1.Values(i,j);
           h2value = H2.Values(i,j);
           minvalue = min(h1value, h2value);
           I = I + minvalue;
       end
    end
end