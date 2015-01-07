function [] = displayDifferentials(Dx, Dy, Dt)

    figure();
    colormap gray;

    subplot(1, 3, 1); imagesc(Dx); axis equal; axis image;
    subplot(1, 3, 2); imagesc(Dy); axis equal; axis image;
    subplot(1, 3, 3); imagesc(Dt); axis equal; axis image;
end