%%

clc; clear; close all;

%%

load('SaturationLossMap_IPM.mat');


%%

Iinv_Max = 500;

%%

Id_mat = Id_Peak;
Iq_mat = Iq_Peak;

Fd_mat = mean(Angular_Flux_Linkage_D, 3);
Fq_mat = mean(Angular_Flux_Linkage_Q, 3);
T_mat = mean(Angular_Electromagnetic_Torque, 3);

PfeEddy_mat = Iron_Loss_Eddy;
PfeHy_mat = Iron_Loss_Hysteresis;
Pmag_mat = Magnet_Loss;

%%

Angular_Flux_Linkage_0 = 1/3*(Angular_Flux_Linkage_Phase_1 + Angular_Flux_Linkage_Phase_2 + Angular_Flux_Linkage_Phase_3);

% alphaie_vect = linspace(90, 180, 100)';
% 
% figure(); grid on; hold on; box on;
% contourf(Id_mat, Iq_mat, Fd_mat, 10);
% [C1,h1] = contour(Id_mat, Iq_mat, Fd_mat, 10, 'k', 'linewidth', 1);
% clabel(C1, h1, 'FontSize', 14, 'Color', 'black', 'LabelSpacing', 100)
% p1 = plot(Iinv_Max*sqrt(2)*cosd(alphaie_vect), Iinv_Max*sqrt(2)*sind(alphaie_vect), 'm', 'linewidth', 2);
% h = legend([h1, p1], 'constant flux lines', 'current limit', 'location', 'northeast');
% xlabel('d-axis current [A]')
% ylabel('q-axis current [A]')
% title('Average d-axis flux linkage [V s]')
% set(gca, 'FontSize', 14)
% axis equal
% % savepng('Fd', 6, 6)
% 
% figure(); grid on; hold on; box on;
% contourf(Id_mat, Iq_mat, Fq_mat, 10);
% [C1,h1] = contour(Id_mat, Iq_mat, Fq_mat, 10, 'k', 'linewidth', 1);
% clabel(C1, h1, 'FontSize', 14, 'Color', 'black', 'LabelSpacing', 100)
% p1 = plot(Iinv_Max*sqrt(2)*cosd(alphaie_vect), Iinv_Max*sqrt(2)*sind(alphaie_vect), 'm', 'linewidth', 2);
% h = legend([h1, p1], 'constant flux lines', 'current limit', 'location', 'northeast');
% xlabel('d-axis current [A]')
% ylabel('q-axis current [A]')
% title('Average q-axis flux linkage [V s]')
% set(gca, 'FontSize', 14)
% axis equal
% % savepng('Fq', 6, 6)
% 
% figure(); grid on; hold on; box on;
% contourf(Id_mat, Iq_mat, T_mat, 10);
% [C1,h1] = contour(Id_mat, Iq_mat, T_mat, 10, 'k', 'linewidth', 1);
% clabel(C1, h1, 'FontSize', 14, 'Color', 'black', 'LabelSpacing', 100)
% p1 = plot(Iinv_Max*sqrt(2)*cosd(alphaie_vect), Iinv_Max*sqrt(2)*sind(alphaie_vect), 'm', 'linewidth', 2);
% h = legend([h1, p1], 'constant torque lines', 'current limit', 'location', 'northeast');
% xlabel('d-axis current [A]')
% ylabel('q-axis current [A]')
% title('Average torque [N m]')
% set(gca, 'FontSize', 14)
% axis equal
% % savepng('T', 6, 6)
% 
% figure(); grid on; hold on; box on;
% contourf(Id_mat, Iq_mat, PfeEddy_mat, 10);
% [C1,h1] = contour(Id_mat, Iq_mat, PfeEddy_mat, 10, 'k', 'linewidth', 1);
% clabel(C1, h1, 'FontSize', 14, 'Color', 'black', 'LabelSpacing', 100)
% p1 = plot(Iinv_Max*sqrt(2)*cosd(alphaie_vect), Iinv_Max*sqrt(2)*sind(alphaie_vect), 'm', 'linewidth', 2);
% h = legend([h1, p1], 'constant loss lines', 'current limit', 'location', 'northeast');
% xlabel('d-axis current [A]')
% ylabel('q-axis current [A]')
% title('eddy currents iron losses [W]')
% set(gca, 'FontSize', 14)
% axis equal
% % savepng('PfeE', 6, 6)
% 
% figure(); grid on; hold on; box on;
% contourf(Id_mat, Iq_mat, PfeHy_mat, 10);
% [C1,h1] = contour(Id_mat, Iq_mat, PfeHy_mat, 10, 'k', 'linewidth', 1);
% clabel(C1, h1, 'FontSize', 14, 'Color', 'black', 'LabelSpacing', 100)
% p1 = plot(Iinv_Max*sqrt(2)*cosd(alphaie_vect), Iinv_Max*sqrt(2)*sind(alphaie_vect), 'm', 'linewidth', 2);
% h = legend([h1, p1], 'constant loss lines', 'current limit', 'location', 'northeast');
% xlabel('d-axis current [A]')
% ylabel('q-axis current [A]')
% title('hysteresis iron losses [W]')
% set(gca, 'FontSize', 14)
% axis equal
% % savepng('PfeHy', 6, 6)
% 
% figure(); grid on; hold on; box on;
% contourf(Id_mat, Iq_mat, Pmag_mat, 10);
% [C1,h1] = contour(Id_mat, Iq_mat, Pmag_mat, 10, 'k', 'linewidth', 1);
% clabel(C1, h1, 'FontSize', 14, 'Color', 'black', 'LabelSpacing', 100)
% p1 = plot(Iinv_Max*sqrt(2)*cosd(alphaie_vect), Iinv_Max*sqrt(2)*sind(alphaie_vect), 'm', 'linewidth', 2);
% h = legend([h1, p1], 'constant loss lines', 'current limit', 'location', 'northeast');
% xlabel('d-axis current [A]')
% ylabel('q-axis current [A]')
% title('magnet  losses [W]')
% set(gca, 'FontSize', 14)
% axis equal
% % savepng('Pmag', 6, 6)
% 
% %%
% 
% figure(); grid on; hold on; box on;
% positions = linspace(0, 360/4, 61);
% for idx_d = 1:size(Angular_Flux_Linkage_D, 1)
%     for idx_q = 1:size(Angular_Flux_Linkage_D, 2)
%         flux = hypot(Angular_Flux_Linkage_D(idx_d, idx_q, :), Angular_Flux_Linkage_Q(idx_d, idx_q, :));
%     end
%     flux = reshape(flux, size(positions));
%     plot(positions, flux, 'LineWidth', 1.5)
% end
% xlabel('rotor position [deg]')
% ylabel('flux linkage [V s]')
% title('flux(Id, Iq) vs. rotor position')
% xlim([0 90])
% set(gca, 'fontsize', 14)
% savepng('TvsTheta', 8, 5)
% 

% Angular_Flux_Linkage = hypot(Angular_Flux_Linkage_D, Angular_Flux_Linkage_Q);
% figure(); grid on; hold on; box on;
% positions = linspace(0, 360/4, 61);
% for idx_d = 1:size(Angular_Flux_Linkage, 1)
%     for idx_q = 1:size(Angular_Flux_Linkage, 2)
%         flux = Angular_Flux_Linkage(idx_d, idx_q, :);
%     end
%     flux = reshape(flux, size(positions));
%     plot(positions, flux, 'LineWidth', 1.5)
% end
% xlabel('rotor position [deg]')
% ylabel('torque [N m]')
% title('flux(Id, Iq) vs. rotor position')
% xlim([0 90])
% set(gca, 'fontsize', 14)
% savepng('FvsTheta', 8, 5)

%%

IsMax = 900;
alpha_ie_vec = linspace(0, 360, 37);
Is_vec = linspace(-IsMax, IsMax, 37);

Id_mat1 = zeros(length(alpha_ie_vec), length(Is_vec));
Iq_mat1 = zeros(length(alpha_ie_vec), length(Is_vec));
for idx = 1:length(Is_vec)
    is = Is_vec(idx);
    id_vec = is*cosd(alpha_ie_vec);
    iq_vec = is*sind(alpha_ie_vec);
    
    Id_mat1(:,idx) = id_vec;
    Iq_mat1(:,idx) = iq_vec;
end

figure(); grid on; hold on; box on;
plot(Id_mat1, Iq_mat1, '.', 'MarkerSize',  20, 'Color', 'k')
axis equal
xlim([-900 900])
ylim([-900 900])
% axis equal
title('polar coordinates definition')
xlabel('d-axis current [A]')
ylabel('q-axis current [A]')
set(gca, 'fontsize', 14)
savepng('polar', 6, 6)

Id_vec = linspace(-IsMax, IsMax, 37);
Iq_vec = linspace(IsMax, -IsMax, 37);
[Id_mat2, Iq_mat2] = meshgrid(Id_vec, Iq_vec);

figure(); grid on; hold on; box on;
plot(Id_mat2, Iq_mat2, '.', 'MarkerSize',  20, 'Color', 'k')
axis equal
xlim([-900 900])
ylim([-900 900])
% axis equal
title('meshgrid definition')
xlabel('d-axis current [A]')
ylabel('q-axis current [A]')
set(gca, 'fontsize', 14)
savepng('meshgrid', 6, 6)