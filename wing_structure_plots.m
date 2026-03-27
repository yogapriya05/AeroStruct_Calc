%% Wing Structure Calculations — All Figures and Plots
% Solar UAV Wing — AE322/AE341 Group 2, IIST | AY 2025–26
%
% This script produces all figures and plots referenced in
% Wing_Structure_Calculations.md, in the order they appear.
%
% Run the entire script to generate all figures, or run individual
% sections (Ctrl+Enter in MATLAB) using the %% section markers.
%
% CONTENTS:
%  Figure 1  — Wing Geometry Schematic (Section 2)
%  Figure 2  — V-n Flight Envelope Diagram (Section 4.4)
%  Figure 3  — Elliptical vs Uniform Lift Distribution (Section 5.1–5.2)
%  Figure 4  — Shear Force Diagram V(y) (Section 5.3)
%  Figure 5  — Inertia-Relief Net Load Distribution (Section 5.4)
%  Figure 6  — Bending Moment Distribution M(y) (Section 6.1)
%  Figure 7  — Spar Tip-Deflection Shape Along Span (Section 7.4)
%  Figure 8  — NACA 0012 Airfoil Profile (Section 14.3)
%  Figure 9  — Natural Frequency Mode Shapes (Section 12.1–12.3)
%  Figure 10 — Structural Margins of Safety (Section 13.2)
%  Figure 11 — Phase-B2 Spar Load–Deflection Test (Section 15.3)
%  Figure 12 — Phase-C1 Wing Static Test Deflection (Section 15.4)
% -----------------------------------------------------------------------

clear; close all; clc;

%% ===== SHARED PARAMETERS ==============================================

% Wing geometry
b      = 0.980;   % full span [m]
c      = 0.250;   % chord [m]
s      = b / 2;   % semi-span [m]
S      = b * c;   % wing area [m^2]
AR     = b^2 / S; % aspect ratio

% Aircraft weight
m_total = 0.500;  % total aircraft mass [kg]
g       = 9.81;   % gravitational acceleration [m/s^2]
W       = m_total * g; % aircraft weight [N]

% ISA sea-level atmosphere
rho  = 1.225;      % air density [kg/m^3]
mu   = 1.789e-5;   % dynamic viscosity [Pa·s]

% Aerodynamic coefficients (WE3.55-9.3 airfoil)
CL_cruise = 0.80;
CL_max    = 1.25;
CM_AC     = -0.05;
x_AC_c    = 0.25;  % aerodynamic centre as fraction of chord
x_FS_c    = 0.25;  % front spar position as fraction of chord
x_RS_c    = 0.65;  % rear spar position as fraction of chord

% Finite-wing lift-curve slope (rad^-1)
a = 2 * pi * AR / (AR + 2);

% Design load factor and factor of safety
n   = 2.5;
FOS = 1.5;

% Computed cruise speed
v_cruise = sqrt(2 * W / (rho * CL_cruise * S));

% Dynamic pressure at cruise
q_inf = 0.5 * rho * v_cruise^2;

% Stall speed
V_stall = sqrt(2 * W / (rho * CL_max * S));

% Manoeuvre speed
V_A = V_stall * sqrt(n);

% Design dive speed
V_D = 1.40 * v_cruise;

% Gust alleviation factor
mu_g = 2 * (m_total / S) / (rho * c * a);
K_g  = 0.88 * mu_g / (5.3 + mu_g);

% Gust speed (CS-23, low altitude)
U_e  = 9.1; % [m/s]
Dn_gust_raw    = rho * U_e * v_cruise * a / (2 * (W/S));
Dn_gust_allev  = K_g * Dn_gust_raw;

% Half-wing aerodynamic loads (ultimate)
L_ult        = FOS * n * W;
L_half_ult   = L_ult / 2;
L_half_limit = n * W / 2;

% Elliptical distribution root value
w_root = 4 * L_half_ult / (pi * s);

% Uniform distribution load per unit span
w0 = L_half_ult / s;

% Spanwise coordinate array
y  = linspace(0, s, 500);
eta = y / s;          % normalised spanwise position

% Elliptical lift distribution [N/m]
w_ellip = w_root * sqrt(1 - eta.^2);

% Aluminium 6061-T6 properties
E_Al    = 69e9;  % Young's modulus [Pa]
G_Al    = 26e9;  % Shear modulus [Pa]
sig_y   = 276e6; % Yield strength [Pa]
sig_ult = 310e6; % Ultimate tensile strength [Pa]
rho_Al  = 2700;  % Density [kg/m^3]
sig_allow = sig_ult / FOS;
tau_allow = 0.577 * sig_y;

% Main spar (front spar) dimensions
r_FS = 2.5e-3;  % radius [m]
I_FS = pi * r_FS^4 / 4; % second moment of area [m^4]

%% ===== FIGURE 1 — Wing Geometry Schematic (Section 2) ================
figure(1);
clf;
set(gcf, 'Name', 'Fig 1 — Wing Geometry Schematic', 'NumberTitle', 'off');

% Draw wing planform (top view, full span)
b_mm = b * 1000;   % full span in mm
c_mm = c * 1000;   % chord in mm

% Wing outline (rectangle)
wing_x = [0, b_mm, b_mm, 0, 0];
wing_y = [0, 0, c_mm, c_mm, 0];

% Spar lines
x_FS_mm = b_mm; % spans full width
x_FS_chord = x_FS_c * c_mm;
x_RS_chord = x_RS_c * c_mm;

patch(wing_x, wing_y, [0.85, 0.92, 1.0], 'EdgeColor', 'k', 'LineWidth', 1.5);
hold on;

% Front spar line
plot([0, b_mm], [x_FS_chord, x_FS_chord], 'b-', 'LineWidth', 2.5);
% Rear spar line
plot([0, b_mm], [x_RS_chord, x_RS_chord], 'r-', 'LineWidth', 2.0);

% Rib lines (40 ribs, uniform pitch)
N_ribs = 40;
y_ribs = linspace(0, b_mm, N_ribs);
for i = 1:N_ribs
    plot([y_ribs(i), y_ribs(i)], [0, c_mm], 'Color', [0.5, 0.5, 0.5], ...
         'LineWidth', 0.5);
end

% D-box shading (LE to FS)
patch([0, b_mm, b_mm, 0], [0, 0, x_FS_chord, x_FS_chord], ...
      [0.7, 0.85, 0.95], 'FaceAlpha', 0.5, 'EdgeColor', 'none');

% Annotations
text(b_mm/2, -8, sprintf('b = %.0f mm', b_mm), ...
    'HorizontalAlignment', 'center', 'FontSize', 10);
text(-12, c_mm/2, sprintf('c = %.0f mm', c_mm), ...
    'HorizontalAlignment', 'center', 'FontSize', 10, 'Rotation', 90);
text(b_mm*0.52, x_FS_chord + 3, 'Front Spar (25% c)', ...
    'Color', 'b', 'FontSize', 9);
text(b_mm*0.52, x_RS_chord + 3, 'Rear Spar (65% c)', ...
    'Color', 'r', 'FontSize', 9);
text(b_mm*0.02, x_FS_chord/2, 'D-box', 'FontSize', 9, 'FontAngle', 'italic');

% Root and tip labels
text(-8, c_mm/2, 'Root', 'Rotation', 90, 'HorizontalAlignment', 'center', ...
     'FontSize', 9, 'Color', [0.3, 0.3, 0.3]);
text(b_mm + 5, c_mm/2, 'Tip', 'HorizontalAlignment', 'left', ...
     'FontSize', 9, 'Color', [0.3, 0.3, 0.3]);

% Flow direction arrow
annotation('arrow', [0.15, 0.15], [0.25, 0.18], 'HeadWidth', 8, ...
           'HeadLength', 8, 'Color', [0, 0.5, 0]);
text(b_mm*0.05, -20, 'Flow →', 'FontSize', 9, 'Color', [0, 0.5, 0]);

xlabel('Spanwise position y  (mm)', 'FontSize', 11);
ylabel('Chordwise position x  (mm)', 'FontSize', 11);
title({'Figure 1 — Wing Planform (Top View)'; ...
       sprintf('b = %.0f mm, c = %.0f mm, AR = %.2f', b_mm, c_mm, AR)}, ...
      'FontSize', 12);
legend({'Wing surface', 'D-box skin', 'Front spar (25% c)', ...
        'Rear spar (65% c)'}, 'Location', 'northeast', 'FontSize', 9);
axis equal;
xlim([-25, b_mm + 30]);
ylim([-30, c_mm + 15]);
grid on; box on;

%% ===== FIGURE 2 — V-n Flight Envelope Diagram (Section 4.4) ==========
figure(2);
clf;
set(gcf, 'Name', 'Fig 2 — V-n Flight Envelope (V-n Diagram)', ...
    'NumberTitle', 'off');

% Speed array for stall boundary curves
V_range = linspace(0, V_D * 1.1, 600);

% Positive stall boundary: n = (rho * V^2 * CL_max * S) / (2*W)
n_pos_stall = (0.5 * rho * V_range.^2 * CL_max * S) / W;
n_pos_stall(n_pos_stall > n) = NaN; % truncate at manoeuvre limit

% Negative stall boundary: n = -(rho * V^2 * 0.5*CL_max * S) / (2*W)
CL_max_neg = 0.8; % estimated negative CL_max for this airfoil
n_neg_stall = -(0.5 * rho * V_range.^2 * CL_max_neg * S) / W;
n_neg_stall(n_neg_stall < -1.0) = NaN;

% Envelope boundary points (from Table in §4.4)
V_env = [V_stall, V_A,   V_D,   V_D,   V_A,   V_stall];
n_env = [1.0,     n,     n,     -1.0,  -1.0,  -1.0   ];
% Close the envelope properly
V_env_full = [0, V_stall, V_A, V_D, V_D, V_A, V_stall, 0];
n_env_full = [0, 1.0,     n,   n,   -1.0, -1.0, -1.0,  0];

% Gust lines (raw and alleviated)
n_gust_raw_vc   = 1 + Dn_gust_raw;
n_gust_allev_vc = 1 + Dn_gust_allev;

% Plot
ax2 = axes;
hold on;

% Filled envelope area
fill([0, V_stall, V_A, V_D, V_D, V_A, V_stall, 0], ...
     [0, 1.0, n, n, -1.0, -1.0, -1.0, 0], ...
     [0.85, 0.95, 0.85], 'FaceAlpha', 0.4, 'EdgeColor', 'none');

% Stall boundaries
plot(V_range, n_pos_stall, 'b-', 'LineWidth', 2.0, ...
     'DisplayName', 'Positive stall boundary');
plot(V_range, n_neg_stall, 'b--', 'LineWidth', 1.5, ...
     'DisplayName', 'Negative stall boundary');

% Manoeuvre limit
plot([V_A, V_D], [n, n], 'k-', 'LineWidth', 2.5, ...
     'DisplayName', sprintf('Positive limit  n = +%.1f', n));
plot([V_A, V_D], [-1.0, -1.0], 'k--', 'LineWidth', 2.0, ...
     'DisplayName', 'Negative limit  n = -1.0');

% Dive speed vertical
plot([V_D, V_D], [-1.0, n], 'k-', 'LineWidth', 2.0);

% Cruise operating point
plot(v_cruise, 1.0, 'go', 'MarkerSize', 9, 'MarkerFaceColor', 'g', ...
     'DisplayName', sprintf('1-g cruise  V_c = %.2f m/s', v_cruise));

% Gust point (alleviated)
plot(v_cruise, n_gust_allev_vc, 'rs', 'MarkerSize', 9, ...
     'MarkerFaceColor', [1 0.6 0.6], ...
     'DisplayName', sprintf('Gust (alleviated)  n = %.2f', n_gust_allev_vc));

% Gust point (unalleviated — informational)
plot(v_cruise, n_gust_raw_vc, 'r^', 'MarkerSize', 9, ...
     'MarkerFaceColor', 'r', ...
     'DisplayName', sprintf('Gust (unalleviated)  n = %.2f', n_gust_raw_vc));

% Key speed vertical dashed lines
plot([V_stall, V_stall], [-0.5, n+0.5], 'Color', [0.4 0.4 0.8], ...
     'LineStyle', ':', 'LineWidth', 1.2, 'HandleVisibility', 'off');
plot([V_A, V_A],     [-0.5, n+0.5], 'Color', [0.2 0.6 0.2], ...
     'LineStyle', ':', 'LineWidth', 1.2, 'HandleVisibility', 'off');
plot([v_cruise, v_cruise], [-0.5, n+0.5], 'Color', [0 0.6 0], ...
     'LineStyle', ':', 'LineWidth', 1.2, 'HandleVisibility', 'off');

% Annotations for key speeds
text(V_stall, -0.55, sprintf('V_{stall}\n%.2f m/s', V_stall), ...
     'HorizontalAlignment', 'center', 'FontSize', 8.5, ...
     'Color', [0.3 0.3 0.8]);
text(V_A, -0.55, sprintf('V_A\n%.2f m/s', V_A), ...
     'HorizontalAlignment', 'center', 'FontSize', 8.5, ...
     'Color', [0.2 0.5 0.2]);
text(v_cruise, -0.55, sprintf('V_c\n%.2f m/s', v_cruise), ...
     'HorizontalAlignment', 'center', 'FontSize', 8.5, ...
     'Color', [0 0.5 0]);
text(V_D, -0.55, sprintf('V_D\n%.2f m/s', V_D), ...
     'HorizontalAlignment', 'center', 'FontSize', 8.5, ...
     'Color', [0.4 0 0]);

% Axes labels and formatting
xlabel('Airspeed  V  (m/s)', 'FontSize', 11);
ylabel('Load Factor  n  (g)', 'FontSize', 11);
title({'Figure 2 — V-n Flight Envelope Diagram'; ...
       sprintf('m = %.2f kg, W/S = %.1f N/m², K_g = %.3f', ...
               m_total, W/S, K_g)}, 'FontSize', 12);
legend('Location', 'northwest', 'FontSize', 9);
xlim([0, V_D * 1.08]);
ylim([-1.8, max(n_gust_raw_vc, n) + 1.5]);
yline(0, 'k-', 'LineWidth', 0.8);
grid on; box on;

%% ===== FIGURE 3 — Lift Distribution: Elliptical vs Uniform (§5.1–5.2) 
figure(3);
clf;
set(gcf, 'Name', 'Fig 3 — Lift Load Distribution (Elliptical vs Uniform)', ...
    'NumberTitle', 'off');

hold on;
% Uniform distribution
plot(y * 1000, repmat(w0, size(y)), 'r--', 'LineWidth', 2.0, ...
     'DisplayName', sprintf('Uniform  w_0 = %.2f N/m', w0));
% Elliptical distribution
plot(y * 1000, w_ellip, 'b-', 'LineWidth', 2.5, ...
     'DisplayName', sprintf('Elliptical  w_{root} = %.2f N/m', w_root));

% Mark root and specific span stations
y_marks   = [0, 0.098, 0.196, 0.294, 0.392, 0.441, s] * 1000; % mm
w_ellip_m = w_root * sqrt(1 - (y_marks/1000/s).^2);
plot(y_marks, w_ellip_m, 'bo', 'MarkerSize', 7, 'MarkerFaceColor', 'b', ...
     'HandleVisibility', 'off');

% Shade area under elliptical curve
fill([y*1000, fliplr(y*1000)], [w_ellip, zeros(1, length(y))], ...
     'b', 'FaceAlpha', 0.08, 'EdgeColor', 'none', ...
     'HandleVisibility', 'off');

% Root and tip annotations
text(5, w_root + 0.8, sprintf('w_{root} = %.2f N/m', w_root), ...
     'FontSize', 9, 'Color', 'b');
text(5, w0 - 1.2, sprintf('w_0 = %.2f N/m', w0), ...
     'FontSize', 9, 'Color', 'r');

xlabel('Spanwise position  y  (mm)', 'FontSize', 11);
ylabel('Lift per unit span  w(y)  (N/m)', 'FontSize', 11);
title({'Figure 3 — Distributed Lift Load Distribution (Ultimate Loads)'; ...
       sprintf('L_{1/2,ult} = %.2f N  |  n = %.1f, FOS = %.1f', ...
               L_half_ult, n, FOS)}, 'FontSize', 12);
legend('Location', 'northeast', 'FontSize', 10);
xlim([0, s * 1000 * 1.05]);
ylim([0, w_root * 1.15]);
grid on; box on;
xline(0, 'k-', 'LineWidth', 1.0, 'HandleVisibility', 'off');
text(s*1000*0.98, w_root*0.05, 'Tip', 'FontSize', 9, ...
     'HorizontalAlignment', 'right', 'Color', [0.4 0.4 0.4]);
text(3, w_root*0.05, 'Root', 'FontSize', 9, 'Color', [0.4 0.4 0.4]);

%% ===== FIGURE 4 — Shear Force Diagram V(y) (Section 5.3) =============
figure(4);
clf;
set(gcf, 'Name', 'Fig 4 — Shear Force Diagram V(y)', 'NumberTitle', 'off');

% Shear force from elliptical load (integrate from tip to root)
% V(y) = w_root*(b/2)/2 * [pi/2 - eta*sqrt(1-eta^2) - arcsin(eta)]
V_shear = zeros(size(y));
for i = 1:length(y)
    eta_i = y(i) / s;
    V_shear(i) = w_root * s / 2 * ...
        (pi/2 - eta_i * sqrt(1 - eta_i^2) - asin(eta_i));
end

% Shear from uniform distribution (for comparison)
V_uniform = w0 * (s - y);

hold on;
plot(y * 1000, V_uniform, 'r--', 'LineWidth', 1.8, ...
     'DisplayName', sprintf('Uniform  V(0) = %.2f N', w0*s));
plot(y * 1000, V_shear, 'b-', 'LineWidth', 2.5, ...
     'DisplayName', sprintf('Elliptical  V(0) = %.2f N', V_shear(1)));

% Mark tabulated values
y_tab   = [0, 0.098, 0.196, 0.294, 0.392, 0.441, s];
V_tab   = [9.20, 7.65, 5.87, 3.91, 1.88, 0.97, 0.00];
plot(y_tab * 1000, V_tab, 'bs', 'MarkerSize', 8, 'MarkerFaceColor', 'b', ...
     'DisplayName', 'Table values (§5.3)');

% Fill under shear curve
fill([y*1000, fliplr(y*1000)], [V_shear, zeros(1, length(y))], ...
     'b', 'FaceAlpha', 0.10, 'EdgeColor', 'none', 'HandleVisibility', 'off');

% Root shear label
text(5, V_shear(1) + 0.3, sprintf('V_{root} = %.2f N', V_shear(1)), ...
     'FontSize', 9, 'Color', 'b');

xlabel('Spanwise position  y  (mm)', 'FontSize', 11);
ylabel('Shear Force  V(y)  (N)', 'FontSize', 11);
title({'Figure 4 — Shear Force Diagram  V(y)  (Ultimate Loads)'; ...
       sprintf('Elliptical distribution  |  V_{root} = %.2f N', V_shear(1))}, ...
      'FontSize', 12);
legend('Location', 'northeast', 'FontSize', 10);
xlim([0, s * 1000 * 1.05]);
ylim([-0.5, max(V_uniform) * 1.1]);
grid on; box on;

%% ===== FIGURE 5 — Inertia-Relief Net Load Distribution (Section 5.4) =
figure(5);
clf;
set(gcf, 'Name', 'Fig 5 — Inertia-Relief Net Load Distribution', ...
    'NumberTitle', 'off');

% Wing structural mass per unit span
m_wing_half   = 0.1015; % kg per half-span (from §5.4)
m_bar         = m_wing_half / s; % kg/m

% Inertia load per unit span (uniform, downward)
w_inertia = m_bar * g * n; % N/m

% Net distributed load
q_net = w_ellip - w_inertia;

hold on;
% Elliptical lift
plot(y * 1000, w_ellip, 'b-', 'LineWidth', 2.2, ...
     'DisplayName', sprintf('Aero lift  w(y)  (elliptical)'));
% Inertia relief (constant)
plot(y * 1000, repmat(w_inertia, size(y)), 'm--', 'LineWidth', 1.8, ...
     'DisplayName', sprintf('Inertia relief  w_{inertia} = %.2f N/m', w_inertia));
% Net load
plot(y * 1000, q_net, 'g-', 'LineWidth', 2.5, ...
     'DisplayName', 'Net load  q_{net}(y) = w(y) − w_{inertia}');

% Zero line
yline(0, 'k-', 'LineWidth', 0.8, 'HandleVisibility', 'off');

% Shade positive and negative net regions
idx_pos = q_net >= 0;
idx_neg = q_net <  0;
if any(idx_pos)
    fill([y(idx_pos)*1000, fliplr(y(idx_pos)*1000)], ...
         [q_net(idx_pos), zeros(1, sum(idx_pos))], ...
         'g', 'FaceAlpha', 0.12, 'EdgeColor', 'none', ...
         'HandleVisibility', 'off');
end
if any(idx_neg)
    fill([y(idx_neg)*1000, fliplr(y(idx_neg)*1000)], ...
         [q_net(idx_neg), zeros(1, sum(idx_neg))], ...
         'm', 'FaceAlpha', 0.12, 'EdgeColor', 'none', ...
         'HandleVisibility', 'off');
end

% Root and tip annotations
text(5, q_net(1) + 0.8, sprintf('q_{net}(0) = %.2f N/m', q_net(1)), ...
     'FontSize', 9, 'Color', [0 0.6 0]);
text(s*1000*0.82, q_net(end) - 1.2, ...
     sprintf('q_{net}(tip) = −%.2f N/m', abs(q_net(end))), ...
     'FontSize', 9, 'Color', [0.6 0 0.6]);

xlabel('Spanwise position  y  (mm)', 'FontSize', 11);
ylabel('Distributed load  (N/m)', 'FontSize', 11);
title({'Figure 5 — Inertia-Relieved Net Distributed Load (Ultimate)'; ...
       sprintf('Inertia relief = %.1f N/m  |  Reduction at root = %.0f%%', ...
               w_inertia, (w_inertia * s) / V_shear(1) * 100)}, ...
      'FontSize', 12);
legend('Location', 'northeast', 'FontSize', 10);
xlim([0, s * 1000 * 1.05]);
grid on; box on;

%% ===== FIGURE 6 — Bending Moment Distribution M(y) (Section 6.1) =====
figure(6);
clf;
set(gcf, 'Name', 'Fig 6 — Bending Moment Distribution M(y)', ...
    'NumberTitle', 'off');

% Bending moment from elliptical distribution (integrate from tip to root)
% Approximate closed-form from document §6.1:
% M(y) = w_root * (b/2)^2 / 3 * (1 - 3/2*eta^2 + 1/2*eta^3)  [approx]
M_ellip = w_root * s^2 / 3 * (1 - 1.5 * eta.^2 + 0.5 * eta.^3);

% More accurate numerical integration
M_ellip_num = zeros(size(y));
for i = 1:length(y)
    xi  = linspace(y(i), s, 1000);
    w_i = w_root * sqrt(1 - (xi/s).^2);
    M_ellip_num(i) = trapz(xi, w_i .* (xi - y(i)));
end

% Uniform distribution bending moment
M_uniform = w0 * (s - y).^2 / 2;

hold on;
plot(y * 1000, M_uniform, 'r--', 'LineWidth', 1.8, ...
     'DisplayName', sprintf('Uniform  M(0) = %.3f N·m', M_uniform(1)));
plot(y * 1000, M_ellip_num, 'b-', 'LineWidth', 2.5, ...
     'DisplayName', sprintf('Elliptical (numerical)  M(0) = %.3f N·m', ...
                            M_ellip_num(1)));

% Mark tabulated values
y_tab  = [0, 0.098, 0.196, 0.294, 0.392, 0.441, s];
M_tab  = [1.913, 1.526, 1.043, 0.573, 0.177, 0.057, 0.000];
plot(y_tab * 1000, M_tab, 'bs', 'MarkerSize', 8, 'MarkerFaceColor', 'b', ...
     'DisplayName', 'Table values (§6.1)');

% Fill under moment curve
fill([y*1000, fliplr(y*1000)], [M_ellip_num, zeros(1, length(y))], ...
     'b', 'FaceAlpha', 0.10, 'EdgeColor', 'none', 'HandleVisibility', 'off');

% Root moment annotations
text(5, M_ellip_num(1) + 0.05, ...
     sprintf('M_{root,ult} = %.3f N·m', M_ellip_num(1)), ...
     'FontSize', 9, 'Color', 'b');
text(5, M_uniform(1) - 0.12, ...
     sprintf('M_{root,uniform} = %.3f N·m', M_uniform(1)), ...
     'FontSize', 9, 'Color', 'r');

xlabel('Spanwise position  y  (mm)', 'FontSize', 11);
ylabel('Bending Moment  M(y)  (N·m)', 'FontSize', 11);
title({'Figure 6 — Bending Moment Distribution  M(y)  (Ultimate Loads)'; ...
       sprintf('Design value M_{root,ult} = %.3f N·m  (elliptical)', ...
               M_ellip_num(1))}, 'FontSize', 12);
legend('Location', 'northeast', 'FontSize', 10);
xlim([0, s * 1000 * 1.05]);
ylim([-0.05, M_uniform(1) * 1.15]);
grid on; box on;

%% ===== FIGURE 7 — Spar Tip-Deflection Shape Along Span (Section 7.4) =
figure(7);
clf;
set(gcf, 'Name', 'Fig 7 — Spar Deflection Shape Along Span', ...
    'NumberTitle', 'off');

% Deflection under uniform distributed load (conservative, cantilever)
% delta(y) = w0/(24*E*I) * (6*L^2*y^2 - 4*L*y^3 + y^4)   [standard formula]
EI = E_Al * I_FS; % [N·m^2]

% Ultimate load deflection
delta_ult   = w0 ./ (24 * EI) .* (6 * s^2 * y.^2 - 4 * s * y.^3 + y.^4);
% Limit load deflection
delta_limit = delta_ult / FOS;
% Cruise (1-g) deflection
delta_cruise = delta_limit / n;

hold on;
plot(y * 1000, delta_ult   * 1000, 'r-',  'LineWidth', 2.0, ...
     'DisplayName', sprintf('Ultimate (n=%.1f, FOS=%.1f)  δ_{tip} = %.1f mm', ...
                            n, FOS, delta_ult(end)*1000));
plot(y * 1000, delta_limit * 1000, 'b-',  'LineWidth', 2.0, ...
     'DisplayName', sprintf('Limit load (n=%.1f)  δ_{tip} = %.1f mm', ...
                            n, delta_limit(end)*1000));
plot(y * 1000, delta_cruise * 1000, 'g--', 'LineWidth', 1.8, ...
     'DisplayName', sprintf('Cruise (n=1)  δ_{tip} = %.1f mm', ...
                            delta_cruise(end)*1000));

% 5% semi-span limit line
delta_5pct = 0.05 * s * 1000;
yline(delta_5pct, 'k:', 'LineWidth', 1.5, ...
     'DisplayName', sprintf('5%% semi-span limit = %.1f mm', delta_5pct));

% Annotations
text(s*1000*0.6, delta_ult(end)*1000 + 1.5, ...
     sprintf('δ_{tip,ult} = %.1f mm', delta_ult(end)*1000), ...
     'FontSize', 9, 'Color', 'r');
text(s*1000*0.6, delta_limit(end)*1000 + 1.5, ...
     sprintf('δ_{tip,limit} = %.1f mm (%.1f%% span)', ...
             delta_limit(end)*1000, delta_limit(end)/s*100), ...
     'FontSize', 9, 'Color', 'b');

xlabel('Spanwise position  y  (mm)', 'FontSize', 11);
ylabel('Vertical deflection  δ(y)  (mm)', 'FontSize', 11);
title({'Figure 7 — Front Spar Deflection Shape Along Semi-Span'; ...
       sprintf('ϕ5mm rod, EI = %.4f N·m²  |  Uniform load (conservative)', ...
               EI)}, 'FontSize', 12);
legend('Location', 'northwest', 'FontSize', 9);
xlim([0, s * 1000 * 1.05]);
ylim([-2, delta_ult(end)*1000 * 1.12]);
grid on; box on;
set(gca, 'YDir', 'normal');

%% ===== FIGURE 8 — NACA 0012 Airfoil Profile (Section 14.3) ===========
figure(8);
clf;
set(gcf, 'Name', 'Fig 8 — NACA 0012 Airfoil Profile (c = 300 mm)', ...
    'NumberTitle', 'off');

% NACA 0012 geometry: chord = 300 mm
c_fab  = 300;  % chord in mm for fabrication prototype
tc     = 0.12; % thickness ratio

x_norm = linspace(0, 1, 500); % normalised chord position
% NACA 4-digit thickness distribution
y_t = 5 * tc * (0.2969 * sqrt(x_norm) ...
    - 0.1260 * x_norm ...
    - 0.3516 * x_norm.^2 ...
    + 0.2843 * x_norm.^3 ...
    - 0.1015 * x_norm.^4);

% Upper and lower surfaces
x_upper = x_norm * c_fab;
y_upper = y_t * c_fab;
x_lower = x_norm * c_fab;
y_lower = -y_t * c_fab;

% Closed airfoil contour for plotting
x_contour = [x_upper, fliplr(x_lower)];
y_contour = [y_upper, fliplr(y_lower)];

hold on;
% Fill airfoil
fill(x_contour, y_contour, [0.75, 0.85, 0.95], ...
     'EdgeColor', 'k', 'LineWidth', 1.5, 'DisplayName', 'NACA 0012 profile');

% Chord line
plot([0, c_fab], [0, 0], 'k--', 'LineWidth', 1.0, 'DisplayName', 'Chord line');

% Spar locations
x_FS_fab = 0.25 * c_fab;  % front spar at 25% chord = 75 mm
x_RS_fab = 0.65 * c_fab;  % rear spar at 65% chord = 195 mm

% Front spar (5 mm dia circle at 25% chord)
y_t_FS = 5 * tc * (0.2969 * sqrt(0.25) - 0.1260*0.25 - 0.3516*0.25^2 + ...
                   0.2843*0.25^3 - 0.1015*0.25^4) * c_fab;
theta = linspace(0, 2*pi, 100);
r_spar_mm = 2.5; % mm
plot(x_FS_fab + r_spar_mm * cos(theta), r_spar_mm * sin(theta), ...
     'b-', 'LineWidth', 2.0, 'DisplayName', 'Front spar ∅5 mm');
plot([x_FS_fab, x_FS_fab], [-y_t_FS, y_t_FS], 'b:', ...
     'LineWidth', 1.2, 'HandleVisibility', 'off');

% Rear spar
y_t_RS = 5 * tc * (0.2969 * sqrt(0.65) - 0.1260*0.65 - 0.3516*0.65^2 + ...
                   0.2843*0.65^3 - 0.1015*0.65^4) * c_fab;
plot(x_RS_fab + r_spar_mm * cos(theta), r_spar_mm * sin(theta), ...
     'r-', 'LineWidth', 2.0, 'DisplayName', 'Rear spar ∅5 mm');
plot([x_RS_fab, x_RS_fab], [-y_t_RS, y_t_RS], 'r:', ...
     'LineWidth', 1.2, 'HandleVisibility', 'off');

% Max thickness marker
x_tmax = 0.30 * c_fab;
y_tmax = 5 * tc * (0.2969*sqrt(0.30) - 0.1260*0.30 - 0.3516*0.30^2 + ...
                    0.2843*0.30^3 - 0.1015*0.30^4) * c_fab;
plot([x_tmax, x_tmax], [-y_tmax, y_tmax], 'm-', 'LineWidth', 1.5, ...
     'DisplayName', sprintf('Max thickness t_{max} = %.1f mm at 30%%c', 2*y_tmax));

% D-box region shading
x_dbox_edge = [0, x_FS_fab];
y_dbox_top  = interp1(x_upper, y_upper, x_dbox_edge, 'linear', 0);
y_dbox_bot  = interp1(x_lower, y_lower, x_dbox_edge, 'linear', 0);
fill([x_dbox_edge, fliplr(x_dbox_edge)], [y_dbox_top, fliplr(y_dbox_bot)], ...
     [0.6, 0.8, 1.0], 'FaceAlpha', 0.4, 'EdgeColor', 'none', ...
     'DisplayName', 'D-box region (Al skin 0.3 mm)');

% Annotations
text(x_FS_fab, y_t_FS + 2.5, sprintf('FS\n25%%c\n= %d mm', round(x_FS_fab)), ...
     'HorizontalAlignment', 'center', 'FontSize', 8, 'Color', 'b');
text(x_RS_fab, y_t_RS + 2.5, sprintf('RS\n65%%c\n= %d mm', round(x_RS_fab)), ...
     'HorizontalAlignment', 'center', 'FontSize', 8, 'Color', 'r');
text(x_tmax, -y_tmax - 3.5, sprintf('t_{max} = %.0f mm', 2*y_tmax), ...
     'HorizontalAlignment', 'center', 'FontSize', 8, 'Color', 'm');
text(c_fab * 0.02, -y_upper(2) - 3, 'LE', 'FontSize', 9, ...
     'HorizontalAlignment', 'center', 'Color', [0.3 0.3 0.3]);
text(c_fab * 0.99, -1.5, 'TE', 'FontSize', 9, ...
     'HorizontalAlignment', 'right', 'Color', [0.3 0.3 0.3]);

% Chord dimension arrow
annotation('doublearrow', [0.13, 0.91], [0.13, 0.13], ...
           'HeadStyle', 'plain', 'HeadLength', 6);
text(c_fab / 2, -23, sprintf('c = %d mm', c_fab), ...
     'HorizontalAlignment', 'center', 'FontSize', 10);

xlabel('Chordwise position  x  (mm)', 'FontSize', 11);
ylabel('Thickness  y  (mm)', 'FontSize', 11);
title({'Figure 8 — NACA 0012 Airfoil Profile (Fabrication Prototype)'; ...
       sprintf('c = %d mm, t/c = %.0f%%, t_{max} = %.0f mm at 30%%c', ...
               c_fab, tc*100, 2*y_tmax)}, 'FontSize', 12);
legend('Location', 'northeast', 'FontSize', 9);
axis equal;
xlim([-15, c_fab + 15]);
ylim([-28, 28]);
grid on; box on;

%% ===== FIGURE 9 — Natural Frequency Mode Shapes (Section 12.1–12.3) ==
figure(9);
clf;
set(gcf, 'Name', 'Fig 9 — Natural Frequency Mode Shapes', ...
    'NumberTitle', 'off');

% Cantilever beam eigenfunctions (normalised to unity tip amplitude)
% Mode i: phi_i(xi) = cosh(lambda_i * xi) - cos(lambda_i * xi)
%          - sigma_i * (sinh(lambda_i * xi) - sin(lambda_i * xi))
% where xi = y/L (normalised position), L = semi-span
lambda = [1.87510, 4.69409, 7.85476]; % first three eigenvalues
sigma  = [0.73410, 1.01847, 0.99922]; % correction factors
f_mode = [5.97, 37.4, NaN]; % Hz (3rd not shown)
labels = {'1st bending  f_1 = 5.97 Hz', ...
          '2nd bending  f_2 = 37.4 Hz'};
colors = {'b', [0 0.6 0]};

xi  = linspace(0, 1, 300);
y_m = xi * s * 1000; % mm

ax9 = axes;
hold on;

for k = 1:2
    lam = lambda(k);
    sig = sigma(k);
    phi = cosh(lam*xi) - cos(lam*xi) - sig*(sinh(lam*xi) - sin(lam*xi));
    phi_norm = phi / max(abs(phi)); % normalise
    plot(y_m, phi_norm, 'LineWidth', 2.5, 'Color', colors{k}, ...
         'DisplayName', labels{k});
end

% Add torsion frequency annotation (cannot easily visualise on same plot)
yline(0, 'k-', 'LineWidth', 0.8, 'HandleVisibility', 'off');
xline(0, 'k-', 'LineWidth', 0.8, 'HandleVisibility', 'off');

% Annotate node locations of 2nd mode
lam2 = lambda(2); sig2 = sigma(2);
phi2_func = @(x) cosh(lam2*x) - cos(lam2*x) - sig2*(sinh(lam2*x) - sin(lam2*x));
% Find node crossing between 0.1 and 0.9
x_node = fzero(@(x) phi2_func(x), 0.22);
plot(x_node * s * 1000, 0, 'gs', 'MarkerSize', 10, 'MarkerFaceColor', 'g', ...
     'HandleVisibility', 'off');
text(x_node * s * 1000 + 8, 0.05, sprintf('Node at y = %.0f mm', ...
     x_node * s * 1000), 'FontSize', 9, 'Color', [0 0.6 0]);

% Frequency table as text box
tstr = sprintf(['\\bfFrequency Summary\\rm\n' ...
                'f_1 (1st bend) = 5.97 Hz\n' ...
                'f_2 (2nd bend) = 37.4 Hz\n' ...
                'f_{T1} (1st torsion) = 145.8 Hz\n' ...
                'f_{ail} (aileron buzz) = 28.8 Hz\n' ...
                'f_{T1}/f_1 = 24.4 >> 2 ✓']);
text(s*1000*0.50, -0.85, tstr, 'FontSize', 9, ...
     'BackgroundColor', [1 1 0.9], 'EdgeColor', [0.6 0.6 0], ...
     'VerticalAlignment', 'bottom');

xlabel('Spanwise position  y  (mm)', 'FontSize', 11);
ylabel('Normalised mode shape  φ_n(y)/φ_{tip}', 'FontSize', 11);
title({'Figure 9 — Cantilever Wing Bending Mode Shapes'; ...
       'First two modes shown (torsion frequency f_{T1} = 145.8 Hz)'}, ...
      'FontSize', 12);
legend('Location', 'northwest', 'FontSize', 10);
xlim([0, s * 1000 * 1.05]);
ylim([-1.2, 1.2]);
grid on; box on;

%% ===== FIGURE 10 — Structural Margins of Safety (Section 13.2) ========
figure(10);
clf;
set(gcf, 'Name', 'Fig 10 — Structural Margins of Safety', ...
    'NumberTitle', 'off');

% Data from §13.2 margin summary table
components = {'Main spar bending', 'Main spar shear', ...
              'Spar tip deflection', 'Rear spar bending', ...
              'Ribs bending', 'D-box skin torsion', ...
              'Wing tip twist', 'Aileron roll (rear spar)'};
MS_values = [0.25, ...    % main spar bending (σ_allow/σ - 1)
             254.7, ...   % main spar shear (159.2/0.625 - 1 = 254.7)
             0.15, ...    % tip deflection (49mm/42.6mm - 1 = 0.15)
             1.43, ...    % rear spar bending
             195, ...     % ribs (9.8/0.05 - 1 = 195)
             445, ...     % D-box skin (159.2/0.357 - 1 ≈ 445)
             6042, ...    % wing twist (1 deg / 0.014 deg - 1 >> 1; cap for display)
             0.23];       % aileron roll on rear spar

% Cap large values for display
MS_disp = min(MS_values, 10); % cap at 10 for readability
MS_labels = {'0.25', '>>1', '0.15', '1.43', '>>1', '>>1', '>>1', '0.23'};

ax10 = axes;
bar_h = barh(MS_disp, 'FaceColor', 'flat');
hold on;

% Colour code: green if MS > 0.15, yellow if 0 < MS ≤ 0.15, red if MS ≤ 0
for k = 1:length(MS_values)
    if MS_values(k) > 0.25
        bar_h.CData(k,:) = [0.2, 0.75, 0.2];  % green
    elseif MS_values(k) > 0.0
        bar_h.CData(k,:) = [0.9, 0.75, 0.1];  % yellow
    else
        bar_h.CData(k,:) = [0.9, 0.2, 0.2];   % red
    end
end

% MS = 0 line (minimum acceptable)
xline(0, 'k-', 'LineWidth', 1.5);

% Add MS value labels on bars
for k = 1:length(MS_values)
    x_txt = MS_disp(k) + 0.08;
    text(x_txt, k, MS_labels{k}, 'VerticalAlignment', 'middle', ...
         'FontSize', 9.5, 'FontWeight', 'bold');
end

yticks(1:length(components));
yticklabels(components);
xlabel('Margin of Safety  MS = σ_{allow}/σ − 1', 'FontSize', 11);
title({'Figure 10 — Structural Margins of Safety Summary'; ...
       '(Values > 10 capped at 10 for display; labelled >> 1)'}, ...
      'FontSize', 12);
xlim([-0.3, 11.5]);
grid on; box on;
ax10.YGrid = 'off'; ax10.XGrid = 'on';

% Legend
patch([0.1 0.5 0.5 0.1], [0.5 0.5 1.5 1.5], [0.2 0.75 0.2], ...
      'EdgeColor','k', 'HandleVisibility','off');
text(0.55, 1.0, 'MS > 0.25  (adequate)', 'FontSize', 8.5, ...
     'VerticalAlignment','middle');
patch([0.1 0.5 0.5 0.1], [1.7 1.7 2.7 2.7], [0.9 0.75 0.1], ...
      'EdgeColor','k', 'HandleVisibility','off');
text(0.55, 2.2, '0 < MS ≤ 0.25  (close to limit)', 'FontSize', 8.5, ...
     'VerticalAlignment','middle');

%% ===== FIGURE 11 — Phase-B2 Spar Load–Deflection Test (Section 15.3) =
figure(11);
clf;
set(gcf, 'Name', 'Fig 11 — Phase-B2 Spar Load–Deflection Test', ...
    'NumberTitle', 'off');

% Parameters for spar bending coupon test (§15.3)
L_coupon = 0.470;  % free length in test fixture [m]
I_coupon = I_FS;   % same spar rod

% Stiffness: k = 3*E*I / L^3
k_theory = 3 * E_Al * I_coupon / L_coupon^3; % [N/m]
k_theory_mN_mm = k_theory / 1000;             % [mN/mm] = [N/m]

% Load array (0 to 5 N)
F_test  = linspace(0, 5.0, 100);
% Theoretical deflection [mm]
delta_theory = (F_test / k_theory) * 1000;

% Yield load for this geometry
M_yield_root = sig_y * I_FS / r_FS; % [N·m]
F_yield      = M_yield_root / L_coupon;

% Also compute -10% and +10% tolerance band
delta_lo = delta_theory * 0.85; % -15% tolerance band
delta_hi = delta_theory * 1.15; % +15% tolerance band

hold on;
% Tolerance band
fill([F_test, fliplr(F_test)], [delta_hi, fliplr(delta_lo)], ...
     [0.8 0.9 1.0], 'EdgeColor', 'none', 'FaceAlpha', 0.5, ...
     'DisplayName', '±15% tolerance band');
% Theoretical line
plot(F_test, delta_theory, 'b-', 'LineWidth', 2.5, ...
     'DisplayName', sprintf('Theoretical  k = %.1f N/m', k_theory));

% Test stop limit
xline(5.0, 'r--', 'LineWidth', 2.0, ...
      'DisplayName', sprintf('Max test load = 5.0 N (%.0f%% of F_y)', ...
                             5.0/F_yield*100));
% Yield load indicator
xline(F_yield, 'k:', 'LineWidth', 1.5, ...
      'DisplayName', sprintf('Yield load F_y = %.2f N', F_yield));

% Mark tabulated test step values
F_steps     = [1.0, 2.0, 3.0, 4.0, 5.0];
delta_steps = F_steps / k_theory * 1000;
plot(F_steps, delta_steps, 'bo', 'MarkerSize', 9, 'MarkerFaceColor', 'b', ...
     'DisplayName', 'Test step values');
for k = 1:length(F_steps)
    text(F_steps(k) + 0.08, delta_steps(k) + 0.5, ...
         sprintf('(%.1f N, %.1f mm)', F_steps(k), delta_steps(k)), ...
         'FontSize', 8.5);
end

xlabel('Applied load  F  (N)', 'FontSize', 11);
ylabel('Tip deflection  δ  (mm)', 'FontSize', 11);
title({'Figure 11 — Phase-B2 Expected Spar Load–Deflection Curve'; ...
       sprintf('ϕ5mm Al rod, L = %.0f mm, k_{theory} = %.1f N/m', ...
               L_coupon*1000, k_theory)}, 'FontSize', 12);
legend('Location', 'northwest', 'FontSize', 9);
xlim([0, F_yield * 1.1]);
ylim([0, F_yield / k_theory * 1000 * 1.1]);
grid on; box on;

%% ===== FIGURE 12 — Phase-C1 Wing Static Test Deflection (Section 15.4)
figure(12);
clf;
set(gcf, 'Name', 'Fig 12 — Phase-C1 Wing Static Test Expected Deflection', ...
    'NumberTitle', 'off');

% Wing static test: 1m span prototype (§14.1, §15.4)
s_fab  = 0.500; % half-span [m] (1 m full span)
I_spar = I_FS;  % same 5mm spar
EI_fab = E_Al * I_spar;

% Uniform distributed load at each load increment
% 25%, 50%, 75%, 100% limit, 100% ultimate
L_half_limit_fab = n * W / 2;        % = 6.13 N
L_half_ult_fab   = FOS * L_half_limit_fab; % = 9.20 N
w_loads = [0.25, 0.50, 0.75, 1.00, L_half_ult_fab / L_half_limit_fab] ...
          * L_half_limit_fab / s_fab;

load_labels = {'25% limit  (1.53 N)', '50% limit  (3.07 N)', ...
               '75% limit  (4.60 N)', '100% limit  (6.13 N)', ...
               '100% ultimate  (9.20 N)'};
line_styles = {'-', '--', '-.', '-', '-'};
line_widths = [1.2, 1.5, 1.8, 2.2, 2.5];
c_map = [0.4 0.7 1.0; 0.2 0.5 0.9; 0.1 0.3 0.8; 0.0 0.1 0.6; 0.8 0.1 0.1];

y_fab   = linspace(0, s_fab, 300);
hold on;

for k = 1:length(w_loads)
    w_k = w_loads(k);
    delta_k = w_k ./ (24 * EI_fab) .* ...
        (6 * s_fab^2 * y_fab.^2 - 4 * s_fab * y_fab.^3 + y_fab.^4);
    plot(y_fab * 1000, delta_k * 1000, line_styles{k}, ...
         'LineWidth', line_widths(k), 'Color', c_map(k,:), ...
         'DisplayName', load_labels{k});
end

% Mark test step tip deflections
F_C1   = [1.53, 3.07, 4.60, 6.13, 9.20];
delta_tip_C1 = F_C1 / (8 * EI_fab / s_fab^3) * 1000;
% simpler: delta_tip = w0 * s_fab^4 / (8*EI_fab) * 1000
% where w0 = F_C1 / s_fab
delta_tip_C1 = (F_C1 / s_fab) .* s_fab^4 / (8 * EI_fab) * 1000;

for k = 1:length(F_C1)
    plot(s_fab * 1000, delta_tip_C1(k), 'o', 'MarkerSize', 8, ...
         'MarkerFaceColor', c_map(k,:), 'MarkerEdgeColor', 'k', ...
         'HandleVisibility', 'off');
    text(s_fab * 1000 + 5, delta_tip_C1(k), ...
         sprintf('%.0f mm', delta_tip_C1(k)), ...
         'FontSize', 8.5, 'Color', c_map(k,:), ...
         'VerticalAlignment', 'middle');
end

% 5% semi-span reference
yline(0.05 * s_fab * 1000, 'k:', 'LineWidth', 1.5, ...
      'DisplayName', sprintf('5%% semi-span = %.0f mm', 0.05*s_fab*1000));

xlabel('Spanwise position  y  (mm)', 'FontSize', 11);
ylabel('Vertical deflection  δ(y)  (mm)', 'FontSize', 11);
title({'Figure 12 — Phase-C1 Expected Wing Deflection Shapes'; ...
       '1 m span prototype, ∅5 mm front spar, Al 6061-T6'}, ...
      'FontSize', 12);
legend('Location', 'northwest', 'FontSize', 9);
xlim([0, s_fab * 1000 + 35]);
ylim([-2, max(delta_tip_C1) * 1.12]);
grid on; box on;

%% ===== FINAL OUTPUT ===================================================
fprintf('\n=== Wing Structure Calculations — Figures Generated ===\n');
fprintf(' Fig 1  — Wing Geometry Schematic\n');
fprintf(' Fig 2  — V-n Flight Envelope Diagram\n');
fprintf(' Fig 3  — Lift Distribution (Elliptical vs Uniform)\n');
fprintf(' Fig 4  — Shear Force Diagram V(y)\n');
fprintf(' Fig 5  — Inertia-Relief Net Load Distribution\n');
fprintf(' Fig 6  — Bending Moment Distribution M(y)\n');
fprintf(' Fig 7  — Spar Deflection Shape Along Span\n');
fprintf(' Fig 8  — NACA 0012 Airfoil Profile\n');
fprintf(' Fig 9  — Natural Frequency Mode Shapes\n');
fprintf(' Fig 10 — Structural Margins of Safety\n');
fprintf(' Fig 11 — Phase-B2 Spar Load–Deflection Test\n');
fprintf(' Fig 12 — Phase-C1 Wing Static Test Deflection\n');
fprintf('\nKey results:\n');
fprintf('  Cruise speed         V_c = %.2f m/s\n', v_cruise);
fprintf('  Stall speed          V_s = %.2f m/s\n', V_stall);
fprintf('  Manoeuvre speed      V_A = %.2f m/s\n', V_A);
fprintf('  Design dive speed    V_D = %.2f m/s\n', V_D);
fprintf('  Gust alleviation factor K_g = %.3f\n', K_g);
fprintf('  Root lift (elliptical, ult) w_root = %.2f N/m\n', w_root);
fprintf('  Root bending moment M_root = %.3f N·m\n', M_ellip_num(1));
fprintf('  Root shear force    V_root = %.2f N\n', V_shear(1));
fprintf('  Spar EI = %.4f N·m^2\n', EI);
fprintf('  Tip deflection at limit = %.1f mm (%.1f%% semi-span)\n', ...
        delta_limit(end)*1000, delta_limit(end)/s*100);
fprintf('  1st bending freq f1 ~ 5.97 Hz\n');
fprintf('  1st torsion  freq fT1 ~ 145.8 Hz  (fT1/f1 = %.1f)\n', 145.8/5.97);
fprintf('=======================================================\n');
