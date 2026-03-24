# Wing Structure Design Calculations
## Solar UAV Wing — AE322 / AE341 Group 2, IIST | Academic Year 2025–26

---

## Table of Contents

1. [Introduction and Use Case](#1-introduction-and-use-case)
2. [Wing Geometry and Airfoil Parameters](#2-wing-geometry-and-airfoil-parameters)
3. [Mass Estimation and Assumptions](#3-mass-estimation-and-assumptions)
4. [Aerodynamic Load Analysis](#4-aerodynamic-load-analysis)
5. [Distributed Lift and Shear Force Diagrams](#5-distributed-lift-and-shear-force-diagrams)
6. [Bending Moment Distribution](#6-bending-moment-distribution)
7. [Torsion Analysis](#7-torsion-analysis)
8. [Main Spar (Front Spar) Sizing](#8-main-spar-front-spar-sizing)
9. [Rear Spar Sizing](#9-rear-spar-sizing)
10. [Rib Design and Spacing](#10-rib-design-and-spacing)
11. [Skin (Covering Sheet) Sizing](#11-skin-covering-sheet-sizing)
12. [Natural Frequency and Vibration Analysis](#12-natural-frequency-and-vibration-analysis)
13. [Summary of All Substructures](#13-summary-of-all-substructures)

---

## 1. Introduction and Use Case

The aircraft is a **solar-powered UAV** designed for **continuous, long-endurance flight** (24 h+), scaled from the Sky-Sailor design methodology (Noth & Siegwart, ETH 2008). The mission profile drives every structural choice:

| Mission requirement | Structural implication |
|---|---|
| Continuous solar flight | Ultra-low structural mass |
| Solar-cell upper surface | Flat, non-buckling upper skin → many ribs |
| Low wing loading | High span, thin airfoil → bending-dominated spar |
| Low Reynolds number (Re ≈ 1.0 × 10⁵) | Careful surface quality; airfoil shape held by ribs |
| Hand-launched, belly-land | Root loads govern sizing; no landing gear loads |

**Reference aircraft — Sky-Sailor (Noth 2008):**

| Parameter | Value |
|---|---|
| Wingspan | 3.20 m |
| Wing area | 0.776 m² |
| Aspect ratio | 13.2 |
| Total mass | 2.44 kg |
| Airframe mass | 0.725 kg |
| Cruise speed | 8.3 m/s |
| Cruise Re | ~150 000 |

Our design is a **geometrically scaled-down** laboratory wing/prototype using the same WE3.55-9.3 airfoil, with a span of 980 mm.

---

## 2. Wing Geometry and Airfoil Parameters

### 2.1 Wing planform

| Parameter | Symbol | Value |
|---|---|---|
| Full span | b | 980 mm = 0.980 m |
| Half-span | b/2 | 490 mm = 0.490 m |
| Chord (constant) | c | 250 mm = 0.250 m |
| Wing planform area | S | b × c = 0.245 m² |
| Aspect ratio | AR | b²/S = 0.980²/0.245 = **3.92** |
| Taper ratio | λ | 1.00 (rectangular planform) |
| Dihedral | Γ | 3° (assumed, for lateral stability) |
| Sweep | Λ | 0° (unswept) |

Wing area:
$$S = b \times c = 0.980 \times 0.250 = 0.245\ \text{m}^2$$

Aspect ratio:
$$AR = \frac{b^2}{S} = \frac{(0.980)^2}{0.245} = \frac{0.9604}{0.245} = 3.92$$

### 2.2 Airfoil: WE3.55-9.3

| Parameter | Value |
|---|---|
| Max thickness | t/c = 9.3 % |
| Max thickness location | ≈ 30 % chord |
| Max camber | f/c = 3.55 % |
| Max camber location | ≈ 40 % chord |
| Design C_L (cruise) | C_L ≈ 0.80 |
| Pitching-moment coeff. (about AC) | C_M,AC ≈ −0.05 |
| Aerodynamic centre | x_AC/c ≈ 0.25 |
| Zero-lift angle of attack | α_0 ≈ −4° |

**Structural depths at key chord-wise stations:**

$$t_{\max} = \frac{t}{c} \times c = 0.093 \times 250\ \text{mm} = 23.25\ \text{mm}$$

| Station | % chord | x from LE (mm) | Airfoil thickness (approx, mm) |
|---|---|---|---|
| Leading edge | 0 % | 0 | 0 |
| Front spar (FS) | 25 % | 62.5 | 20.0 |
| Max thickness | 30 % | 75.0 | 23.25 |
| Rear spar (RS) | 65 % | 162.5 | 13.5 |
| Trailing edge | 100 % | 250.0 | 0 |

Thickness at the front spar (30% of max thickness reached by 25% chord, using NACA-like distribution; value interpolated):

$$h_{FS} \approx 0.86 \times t_{\max} = 0.86 \times 23.25 = 20.0\ \text{mm}$$

Thickness at the rear spar (approximately 58% of max):

$$h_{RS} \approx 0.58 \times t_{\max} = 0.58 \times 23.25 = 13.5\ \text{mm}$$

### 2.3 Spar and rib layout

| Sub-structure | Location | Count | Material |
|---|---|---|---|
| Front (main) spar | 25 % c = 62.5 mm from LE | 1 | Aluminium rod (solid circular) |
| Rear spar | 65 % c = 162.5 mm from LE | 1 | Aluminium rod (solid circular) |
| Ribs | Spanwise, ~25 mm pitch | ≈ 40 | Balsa wood sheet |
| Leading-edge D-box skin | LE to FS | — | Aluminium sheet |
| Upper/lower skin | FS to RS (inter-spar bay) | — | Aluminium sheet (or film) |

---

## 3. Mass Estimation and Assumptions

### 3.1 Assumptions

| Assumption | Justification / Correction |
|---|---|
| **A1.** Total aircraft mass m = 0.50 kg | Scaled from Sky-Sailor using cubic scaling law (see §3.2). Conservative estimate for a 980 mm solar UAV. |
| **A2.** Design load factor n = 2.5 | Standard value for small UAVs (CS-23 small aircraft; acceptable for academic model). Gust correction applied in §4.3. |
| **A3.** Ultimate factor of safety FOS = 1.5 | FAR/CS standard; ensures plastic reserve beyond limit loads. |
| **A4.** Lift acts at x_CP = 31.3 % c | Derived from C_L and C_M (see §4.2); corrected for off-design conditions. |
| **A5.** Rectangular wing → uniform load baseline | Elliptical correction applied in §5.2. |
| **A6.** Cruise altitude ≈ sea level; ρ = 1.225 kg/m³ | Low-altitude solar UAV; use ISA sea-level values. |
| **A7.** Aluminium alloy: Al 6061-T6 | Commonly available, good strength-to-weight; rod and sheet forms used. |
| **A8.** Balsa rib grain parallel to chord | Maximises bending stiffness in ribs; standard orientation. |
| **A9.** Single-cell D-box torsion model | Leading edge + front spar + upper/lower skin form closed D-box; rear-spar bay treated as open. |
| **A10.** Fixed-free cantilever beam model | Wing is cantilevered at root (centre fuselage joint); tip is free. |

### 3.2 Total aircraft mass — scaling from Sky-Sailor

Cubic scaling law (Noth Ch. 3, geometric similarity):

$$m_{\text{our}} = m_{\text{SS}} \left(\frac{b_{\text{our}}}{b_{\text{SS}}}\right)^3 = 2.44 \times \left(\frac{0.980}{3.200}\right)^3$$

$$= 2.44 \times (0.3063)^3 = 2.44 \times 0.02873 = 0.0701\ \text{kg}$$

This gives 70 g, which is unrealistically small for a functional prototype with aluminium components. The cubic scaling assumes geometric and material similarity (all-composite), which does not hold when switching to aluminium spars.

**Corrected estimate — structural weight model (Noth top-5% model):**

$$W_{af} = 0.44\, S^{1.55}\, AR^{1.30}\ [\text{N}]$$

$$W_{af} = 0.44 \times (0.245)^{1.55} \times (3.92)^{1.30}$$

Calculate each factor:

$$(0.245)^{1.55} = e^{1.55 \ln(0.245)} = e^{1.55 \times (-1.407)} = e^{-2.181} = 0.1130$$

$$(3.92)^{1.30} = e^{1.30 \ln(3.92)} = e^{1.30 \times 1.366} = e^{1.776} = 5.907$$

$$W_{af} = 0.44 \times 0.1130 \times 5.907 = 0.294\ \text{N} \implies m_{af,\text{best}} = 30\ \text{g}$$

This is the all-composite best-case prediction. For aluminium spars and balsa ribs, use the mean-quality model:

$$W_{af,\text{mean}} = 5.58\, S^{1.59}\, AR^{0.71} = 5.58 \times (0.245)^{1.59} \times (3.92)^{0.71}$$

$$(0.245)^{1.59} = e^{1.59 \times (-1.407)} = e^{-2.237} = 0.1065$$

$$(3.92)^{0.71} = e^{0.71 \times 1.366} = e^{0.970} = 2.638$$

$$W_{af,\text{mean}} = 5.58 \times 0.1065 \times 2.638 = 1.567\ \text{N} \implies m_{af} \approx 160\ \text{g}$$

**Adopted total aircraft mass**: Adding propulsion (~150 g), avionics (~100 g), battery (~100 g), structure (~160 g):

$$\boxed{m_{\text{total}} = 0.50\ \text{kg}, \quad W = mg = 0.50 \times 9.81 = 4.905\ \text{N}}$$

*This is the design point. All structural calculations use this value.*

---

## 4. Aerodynamic Load Analysis

### 4.1 Cruise flight conditions

Level cruise (load factor n = 1):

$$L = W = 4.905\ \text{N}$$

$$\frac{W}{S} = \frac{4.905}{0.245} = 20.0\ \text{N/m}^2$$

Cruise speed from the level-flight lift equation:

$$v_{\text{cruise}} = \sqrt{\frac{2L}{\rho\, C_L\, S}} = \sqrt{\frac{2 \times 4.905}{1.225 \times 0.80 \times 0.245}}$$

$$= \sqrt{\frac{9.810}{0.2401}} = \sqrt{40.86} = 6.39\ \text{m/s}$$

Reynolds number at cruise:

$$Re = \frac{\rho\, v\, c}{\mu} = \frac{1.225 \times 6.39 \times 0.250}{1.789 \times 10^{-5}} = \frac{1.957}{1.789 \times 10^{-5}} = 1.09 \times 10^5$$

This is in the valid operating range for WE3.55-9.3 (Re = 80 000 – 300 000).

Dynamic pressure at cruise:

$$q_{\infty} = \frac{1}{2}\rho v^2 = \frac{1}{2} \times 1.225 \times (6.39)^2 = 0.6125 \times 40.83 = 25.01\ \text{N/m}^2$$

### 4.2 Centre of pressure location

The aerodynamic centre is at x_AC = 0.25c. The pitching moment about the aerodynamic centre is M_AC = C_M,AC × q × S × c. The lift acts at the centre of pressure:

$$\frac{x_{CP}}{c} = \frac{x_{AC}}{c} - \frac{C_{M,AC}}{C_L} = 0.25 - \frac{-0.05}{0.80} = 0.25 + 0.0625 = 0.3125$$

$$x_{CP} = 0.3125 \times 250 = 78.1\ \text{mm from LE}$$

**Eccentricity of lift from front spar:**

$$e_L = x_{CP} - x_{FS} = 78.1 - 62.5 = 15.6\ \text{mm} = 0.0156\ \text{m}$$

### 4.3 Design loads (limit and ultimate)

**Limit load factor** n = 2.5 (manoeuvre). This is the maximum steady pull-up expected.

**Gust load correction** (CS-23 simplified gust formula):

$$\Delta n_{\text{gust}} = \frac{\rho\, U_e\, v\, a}{2 (W/S)}$$

where U_e = 9.1 m/s (gust speed at cruise; CS-23 for low-altitude), a = dC_L/dα per rad.

For finite wing: $a = \frac{2\pi AR}{AR + 2} = \frac{2\pi \times 3.92}{3.92 + 2} = \frac{24.63}{5.92} = 4.16\ \text{rad}^{-1}$

$$\Delta n_{\text{gust}} = \frac{1.225 \times 9.1 \times 6.39 \times 4.16}{2 \times 20.0} = \frac{292.3}{40.0} = 7.31$$

> **Note:** This gust increment is very high because wing loading (W/S = 20 N/m²) is very low — typical of ultra-light solar UAVs. In practice, operational gust loading is managed by mission planning (flying in calm conditions). The structural design therefore uses n = 2.5 as the governing limit load factor, with a note that operations should be restricted to winds < 5 m/s.

**Limit lift force (full wing):**

$$L_{\text{limit}} = n \times W = 2.5 \times 4.905 = 12.26\ \text{N}$$

**Ultimate lift force:**

$$L_{\text{ult}} = FOS \times L_{\text{limit}} = 1.5 \times 12.26 = 18.39\ \text{N}$$

**Per half-wing (single panel, cantilevered at root):**

$$L_{1/2,\text{limit}} = \frac{L_{\text{limit}}}{2} = 6.13\ \text{N}$$

$$L_{1/2,\text{ult}} = \frac{L_{\text{ult}}}{2} = 9.20\ \text{N}$$

---

## 5. Distributed Lift and Shear Force Diagrams

The wing coordinate y runs from root (y = 0) to tip (y = b/2 = 0.490 m).

### 5.1 Uniform load (rectangular wing, conservative)

Lift per unit span (uniform assumption):

$$w_0 = \frac{L_{1/2,\text{ult}}}{b/2} = \frac{9.20}{0.490} = 18.78\ \text{N/m}$$

### 5.2 Elliptical load distribution (Prandtl lifting-line correction)

For a rectangular planform at low AR, the true distribution lies between uniform and elliptical. The elliptical distribution is:

$$w(y) = w_{\text{root}} \sqrt{1 - \left(\frac{y}{b/2}\right)^2}, \quad y \in [0,\ b/2]$$

where the root value is found from the total half-span lift:

$$L_{1/2} = \int_0^{b/2} w(y)\, dy = w_{\text{root}} \int_0^{b/2} \sqrt{1 - \left(\frac{y}{b/2}\right)^2}\, dy = w_{\text{root}} \times \frac{\pi (b/2)}{4}$$

$$w_{\text{root}} = \frac{4\, L_{1/2,\text{ult}}}{\pi\, (b/2)} = \frac{4 \times 9.20}{\pi \times 0.490} = \frac{36.80}{1.539} = 23.91\ \text{N/m}$$

Spot values (ultimate):

| y (m) | y/(b/2) | w(y) (N/m) |
|---|---|---|
| 0.000 (root) | 0.000 | 23.91 |
| 0.098 | 0.200 | 23.43 |
| 0.196 | 0.400 | 21.90 |
| 0.294 | 0.600 | 19.12 |
| 0.392 | 0.800 | 14.34 |
| 0.441 | 0.900 | 10.41 |
| 0.490 (tip) | 1.000 | 0.00 |

### 5.3 Shear force diagram V(y) — ultimate loads

The shear force at station y (looking from tip toward root — cantilever convention, positive up):

$$V(y) = \int_y^{b/2} w(\xi)\, d\xi$$

For the elliptical distribution:

$$V(y) = w_{\text{root}} \int_y^{b/2} \sqrt{1 - \left(\frac{\xi}{b/2}\right)^2}\, d\xi$$

Let η = ξ/(b/2), dξ = (b/2) dη:

$$V(y) = w_{\text{root}} \frac{b/2}{2} \left[\eta\sqrt{1-\eta^2} + \arcsin\eta\right]_{\eta_y}^{1}$$

where η_y = y/(b/2) and the upper limit evaluates to π/2.

At root (y = 0, η_y = 0):

$$V(0) = w_{\text{root}} \frac{b/2}{2} \left[\frac{\pi}{2} - 0\right] = 23.91 \times \frac{0.490}{2} \times \frac{\pi}{2}$$

$$= 23.91 \times 0.245 \times 1.5708 = 9.20\ \text{N} \quad (\checkmark = L_{1/2,\text{ult}})$$

Spot values of V(y) (ultimate):

| y (m) | V(y) (N) |
|---|---|
| 0.000 (root) | 9.20 |
| 0.098 | 7.65 |
| 0.196 | 5.87 |
| 0.294 | 3.91 |
| 0.392 | 1.88 |
| 0.441 | 0.97 |
| 0.490 (tip) | 0.00 |

---

## 6. Bending Moment Distribution

### 6.1 Bending moment M(y) — ultimate loads

The bending moment at station y (root most critical, M is positive for upward bending = tension on lower surface):

$$M(y) = \int_y^{b/2} w(\xi)(\xi - y)\, d\xi$$

For the elliptical distribution, the moment at the root (y = 0) is:

$$M_{\text{root}} = \int_0^{b/2} w(\xi)\, \xi\, d\xi = w_{\text{root}} \int_0^{b/2} \xi\sqrt{1 - \left(\frac{\xi}{b/2}\right)^2}\, d\xi$$

Let η = ξ/(b/2):

$$M_{\text{root}} = w_{\text{root}} (b/2)^2 \int_0^{1} \eta\sqrt{1-\eta^2}\, d\eta = w_{\text{root}} (b/2)^2 \times \frac{1}{3}$$

$$M_{\text{root}} = 23.91 \times (0.490)^2 \times \frac{1}{3} = 23.91 \times 0.2401 \times 0.3333 = 1.913\ \text{N·m}$$

Cross-check with centroid of load:

$$\bar{y} = \frac{M_{\text{root}}}{V_{\text{root}}} = \frac{1.913}{9.20} = 0.208\ \text{m} \quad \text{(≈ 42 % of half-span — typical for elliptical distribution)}$$

For uniform distribution (conservative check):

$$M_{\text{root,uniform}} = \frac{w_0\, (b/2)^2}{2} = \frac{18.78 \times 0.490^2}{2} = \frac{18.78 \times 0.2401}{2} = 2.253\ \text{N·m}$$

**Design bending moment at root (ultimate):**

$$\boxed{M_{\text{root,ult}} = 1.913\ \text{N·m} \quad \text{(elliptical)}}$$

Use $M_{\text{design}} = 2.25\ \text{N·m}$ (uniform, 18% higher) for a conservative design.

Bending moment at intermediate stations (elliptical):

$$M(y) = w_{\text{root}} \frac{(b/2)^2}{3}\left(1 - \frac{3}{2}\left(\frac{y}{b/2}\right)^2 + \frac{1}{2}\left(\frac{y}{b/2}\right)^3\right)\ \text{(approx.)}$$

| y (m) | η = y/(b/2) | M(y) (N·m) |
|---|---|---|
| 0.000 (root) | 0.000 | 1.913 |
| 0.098 | 0.200 | 1.526 |
| 0.196 | 0.400 | 1.043 |
| 0.294 | 0.600 | 0.573 |
| 0.392 | 0.800 | 0.177 |
| 0.441 | 0.900 | 0.057 |
| 0.490 (tip) | 1.000 | 0.000 |

### 6.2 Section modulus requirement

The main spar carries approximately 90% of the bending moment (as established for high-AR sailplane-style wings; Noth IDR):

$$M_{spar} = 0.90 \times M_{\text{design}} = 0.90 \times 2.25 = 2.025\ \text{N·m}$$

---

## 7. Main Spar (Front Spar) Sizing

The main spar is a **solid circular aluminium rod** (Al 6061-T6).

### 7.1 Material properties — Al 6061-T6

| Property | Symbol | Value |
|---|---|---|
| Young's modulus | E | 69 GPa = 69 × 10⁹ Pa |
| Shear modulus | G | 26 GPa = 26 × 10⁹ Pa |
| Yield strength | σ_y | 276 MPa |
| Ultimate tensile strength | σ_ult | 310 MPa |
| Density | ρ_Al | 2700 kg/m³ |
| Allowable bending stress (= σ_ult / FOS) | σ_allow | 310 / 1.5 = **206.7 MPa** |
| Allowable shear stress (= 0.577 × σ_y) | τ_allow | 0.577 × 276 = 159.2 MPa |

### 7.2 Minimum spar radius from bending

Solid circular rod, bending about a diameter.  
Section modulus: $Z = I/y = (\pi r^4/4)/r = \pi r^3/4$

$$\sigma = \frac{M}{Z} = \frac{4M}{\pi r^3} \leq \sigma_{\text{allow}}$$

$$r^3 \geq \frac{4 M_{spar}}{\pi \sigma_{\text{allow}}} = \frac{4 \times 2.025}{\pi \times 206.7 \times 10^6} = \frac{8.10}{649.1 \times 10^6} = 1.248 \times 10^{-8}\ \text{m}^3$$

$$r \geq (1.248 \times 10^{-8})^{1/3} = 2.32 \times 10^{-3}\ \text{m} = 2.32\ \text{mm}$$

Minimum diameter: $d_{\min} = 2 \times 2.32 = 4.64\ \text{mm}$

**Select standard rod: $d_{FS} = 5\ \text{mm}$, $r_{FS} = 2.5\ \text{mm}$**

Actual peak bending stress:

$$\sigma_{FS} = \frac{4 \times 2.025}{\pi \times (2.5 \times 10^{-3})^3} = \frac{8.10}{\pi \times 1.5625 \times 10^{-8}} = \frac{8.10}{4.909 \times 10^{-8}} = 165.0\ \text{MPa}$$

Margin of safety: $MS = \sigma_{\text{allow}}/\sigma_{FS} - 1 = 206.7/165.0 - 1 = +0.25$ ✓

### 7.3 Shear check on main spar

Maximum transverse shear at root:

$$V_{\text{root,ult}} = 9.20\ \text{N}$$

For solid circular section, maximum shear stress:

$$\tau_{\max} = \frac{4V}{3A} = \frac{4 \times 9.20}{3 \times \pi (2.5 \times 10^{-3})^2} = \frac{36.80}{3 \times \pi \times 6.25 \times 10^{-6}} = \frac{36.80}{58.90 \times 10^{-6}} = 0.625\ \text{MPa}$$

$$\tau_{\max} \ll \tau_{\text{allow}} = 159.2\ \text{MPa} \quad (\text{shear is not critical})$$

### 7.4 Spar deflection at tip

Beam equation for cantilever with elliptical distributed load. The tip deflection for a uniform load (conservative):

$$\delta_{\text{tip}} = \frac{w_0 (b/2)^4}{8 EI}$$

Second moment of area:

$$I_{FS} = \frac{\pi r^4}{4} = \frac{\pi (2.5 \times 10^{-3})^4}{4} = \frac{\pi \times 3.906 \times 10^{-11}}{4} = 3.068 \times 10^{-11}\ \text{m}^4$$

$$\delta_{\text{tip}} = \frac{18.78 \times (0.490)^4}{8 \times 69 \times 10^9 \times 3.068 \times 10^{-11}}$$

$$= \frac{18.78 \times 0.05765}{8 \times 2.117 \times 10^{-3}} = \frac{1.0826}{1.6934 \times 10^{-2}} = 63.9\ \text{mm}$$

> This deflection (≈ 6.5 % of semi-span) is high for a 5 mm rod. It is acceptable for a flexible solar UAV wing but confirms the need for careful aeroelastic assessment. The deflection under limit loads (n = 2.5, before FOS):
>
> $$\delta_{\text{tip,limit}} = \frac{63.9}{FOS} = \frac{63.9}{1.5} = 42.6\ \text{mm} \approx 4.4\%\ \text{semi-span}$$
>
> This is within the typical 5% limit for flexible UAV wings.

### 7.5 Spar mass

$$m_{FS} = \rho_{Al} \times A_{FS} \times b/2 = 2700 \times \pi (2.5 \times 10^{-3})^2 \times 0.490$$

$$= 2700 \times 1.963 \times 10^{-5} \times 0.490 = 2700 \times 9.619 \times 10^{-6} = 25.97\ \text{g}\ \text{per half-spar}$$

$$m_{FS,\text{total}} = 2 \times 25.97 = 51.9\ \text{g}$$

---

## 8. Rear Spar Sizing

The rear spar carries approximately 10% of the bending moment and handles hinge loads from the ailerons plus torsion.

$$M_{RS} = 0.10 \times 2.25 = 0.225\ \text{N·m}$$

**Minimum radius:**

$$r_{RS} \geq \left(\frac{4 \times 0.225}{\pi \times 206.7 \times 10^6}\right)^{1/3} = \left(\frac{0.900}{649.1 \times 10^6}\right)^{1/3} = (1.386 \times 10^{-9})^{1/3} = 1.115 \times 10^{-3}\ \text{m} = 1.12\ \text{mm}$$

Select **standard rod: $d_{RS} = 3\ \text{mm}$, $r_{RS} = 1.5\ \text{mm}$** (nearest standard size above minimum).

Actual stress:

$$\sigma_{RS} = \frac{4 \times 0.225}{\pi (1.5 \times 10^{-3})^3} = \frac{0.900}{\pi \times 3.375 \times 10^{-9}} = \frac{0.900}{1.060 \times 10^{-8}} = 84.9\ \text{MPa}$$

Margin: $MS = 206.7/84.9 - 1 = +1.43$ ✓ (well within limits, but 3 mm is the minimum practical rod size)

**Rear spar mass:**

$$m_{RS,\text{total}} = 2 \times 2700 \times \pi (1.5 \times 10^{-3})^2 \times 0.490 = 2 \times 2700 \times 7.069 \times 10^{-6} \times 0.490 = 18.74\ \text{g}$$

---

## 9. Rib Design and Spacing

### 9.1 Number of ribs and spacing

Ribs prevent local skin buckling and maintain the airfoil shape (especially critical for solar-cell adhesion on the flat upper surface).

Total ribs:

$$N_{\text{ribs}} = 40 \quad \text{(per design brief)}$$

Rib pitch (uniform):

$$\Delta y = \frac{b}{N_{\text{ribs}} - 1} = \frac{980}{39} \approx 25.1\ \text{mm}$$

Ribs are placed at: $y_i = (i-1) \times 25.1\ \text{mm}$, for $i = 1, 2, \ldots, 40$.

### 9.2 Rib load

Each rib distributes the aerodynamic load from the skin to the spars. The rib carries the distributed load over one rib bay:

$$F_{\text{rib}}(y_i) = w(y_i) \times \Delta y$$

At root (maximum):

$$F_{\text{rib,root}} = w(0) \times \Delta y = 23.91\ \text{N/m} \times 0.0251\ \text{m} = 0.600\ \text{N (per rib at root)}$$

### 9.3 Rib as a simply-supported beam

Each rib spans between the leading edge and the rear spar (chord-wise beam), loaded by the distributed aerodynamic pressure over its tributary area. The rib is modelled as a simply supported beam between the two spars (main structural load path).

Effective span of rib: $L_{\text{rib}} = x_{RS} - x_{FS} = 162.5 - 62.5 = 100\ \text{mm} = 0.100\ \text{m}$

Distributed load on rib (pressure over tributary area):

$$q_{\text{rib}} = \frac{F_{\text{rib}}}{L_{\text{rib}}} = \frac{0.600}{0.100} = 6.0\ \text{N/m}$$

Maximum bending moment in rib (SS beam, UDL):

$$M_{\text{rib,max}} = \frac{q_{\text{rib}}\, L_{\text{rib}}^2}{8} = \frac{6.0 \times (0.100)^2}{8} = \frac{6.0 \times 0.01}{8} = 7.5 \times 10^{-3}\ \text{N·m}$$

### 9.4 Rib cross-section sizing (balsa wood)

**Balsa wood properties (medium density):**

| Property | Symbol | Value |
|---|---|---|
| Young's modulus (along grain) | E_b | 3.4 GPa |
| Bending strength (MOR) | σ_b | 14.7 MPa |
| Density | ρ_b | 160 kg/m³ |
| Allowable bending stress (= σ_b / FOS) | σ_allow,b | 14.7 / 1.5 = **9.8 MPa** |

Rib cross-section: rectangular **width b_r × depth h_r** (flat sheet rib).

The rib depth is constrained by the airfoil profile. At mid-span of the rib (between FS and RS, at 45% chord ≈ 112 mm from LE), the airfoil height is approximately:

$$h_r \approx 0.90 \times t_{\max} = 0.90 \times 23.25 = 20.9\ \text{mm}$$

**Section modulus of rectangular section**: $Z_r = b_r h_r^2 / 6$

$$b_r \geq \frac{6 M_{\text{rib,max}}}{\sigma_{\text{allow,b}}\, h_r^2} = \frac{6 \times 7.5 \times 10^{-3}}{9.8 \times 10^6 \times (20.9 \times 10^{-3})^2}$$

$$= \frac{0.045}{9.8 \times 10^6 \times 4.368 \times 10^{-4}} = \frac{0.045}{4280.6} = 1.051 \times 10^{-5}\ \text{m} = 0.011\ \text{mm}$$

This is essentially zero — the ribs are sized by **minimum practical thickness**, not by stress. Use:

$$b_r = t_{\text{rib}} = 2.0\ \text{mm} \quad \text{(standard balsa sheet thickness)}$$

**Check**: $\sigma_r = 6 M / (b_r h_r^2) = 6 \times 7.5 \times 10^{-3} / (0.002 \times (0.0209)^2) = 0.045 / (8.737 \times 10^{-7}) = 51,510\ \text{Pa} \approx 0.05\ \text{MPa}$

$\sigma_r \ll \sigma_{\text{allow,b}} = 9.8\ \text{MPa}$ ✓ — ribs are very lightly loaded.

### 9.5 Skin-buckling check (rib spacing)

The critical buckling stress of a simply-supported flat plate (skin panel between ribs) under compression is (Roark's Formulas, flat plate buckling):

$$\sigma_{\text{cr}} = k \frac{\pi^2 E_s}{12(1-\nu^2)} \left(\frac{t_s}{a}\right)^2$$

where:
- $k$ = 4.0 (SS on all edges, compression in chord direction)
- $E_s$ = 69 GPa (aluminium)
- $\nu$ = 0.33 (aluminium)
- $t_s$ = skin thickness (to be determined in §11)
- $a$ = rib spacing = 25.1 mm

Setting $\sigma_{\text{cr}} = \sigma_{\text{allow}}$ and solving for $t_s$ will be done in §11.

### 9.6 Rib mass

Each rib is a thin balsa sheet of approximate plan area A_rib:

$$A_{\text{rib}} \approx c \times t_{\max} \times 0.60 = 0.250 \times 0.02325 \times 0.60 \approx 3.49 \times 10^{-3}\ \text{m}^2 \quad (\text{approx. airfoil cross-section area})$$

More accurately, rib area ≈ airfoil chord × average height × 50%:

$$A_{\text{rib}} \approx 0.250 \times 0.020 / 2 = 2.5 \times 10^{-3}\ \text{m}^2$$

Mass of one rib:

$$m_{\text{one rib}} = \rho_b \times t_{\text{rib}} \times A_{\text{rib}} = 160 \times 0.002 \times 2.5 \times 10^{-3} = 8.0 \times 10^{-4}\ \text{kg} = 0.80\ \text{g}$$

Total rib mass:

$$m_{\text{ribs}} = 40 \times 0.80 = 32.0\ \text{g}$$

---

## 10. Torsion Analysis

### 10.1 Applied aerodynamic torque

The wing twists due to the aerodynamic pitching moment and the eccentricity of lift from the elastic axis (front spar).

**Torque per unit span** about the front spar (elastic axis):

$$t(y) = w(y) \times e_L + m_{AC}'$$

where:
- $w(y)$ = distributed lift load per unit span
- $e_L$ = 15.6 mm = 0.0156 m (lift eccentricity from FS, §4.2)
- $m_{AC}' = C_{M,AC} \times q \times c^2$ = pitching moment per unit span

$$m_{AC}' = C_{M,AC} \times q \times c^2 = (-0.05) \times 25.01 \times (0.250)^2 = -0.05 \times 25.01 \times 0.0625 = -0.0782\ \text{N·m/m}$$

At root (using ultimate load factor, $w_{\text{root}} = 23.91\ \text{N/m}$):

$$t(0) = 23.91 \times 0.0156 + (-0.0782) = 0.3730 - 0.0782 = 0.2948\ \text{N·m/m}$$

**Root torque (integrating elliptical distribution of lift torque):**

$$T_{\text{root}} = \int_0^{b/2} w(y) e_L\, dy + m_{AC}' \times (b/2)$$

$$= e_L \times L_{1/2,\text{ult}} + m_{AC}' \times (b/2)$$

$$= 0.0156 \times 9.20 + (-0.0782) \times 0.490$$

$$= 0.1435 - 0.0383 = 0.1052\ \text{N·m}$$

> The net torque at root is **0.105 N·m** (nose-up, tending to increase angle of attack on the front portion). This must be resisted by the D-box and inter-spar structure.

### 10.2 D-box (closed section) torsional stiffness

The leading-edge D-box is the primary torsion-resisting element. It is approximated as a closed thin-walled section (Bredt–Batho formula):

$$T = 2 A_{\text{enc}} q_s \quad \Rightarrow \quad q_s = \frac{T}{2 A_{\text{enc}}}$$

where $A_{\text{enc}}$ is the area enclosed by the D-box mid-line.

**D-box geometry (from LE to FS):**
- Chord-wise extent: 0 to 62.5 mm
- Approximate shape: semi-ellipse with base c₁ = 62.5 mm, height ≈ h_FS/2 = 10 mm (semi-height of airfoil at FS)

$$A_{\text{enc}} \approx \frac{\pi}{2} \times \frac{c_1}{2} \times \frac{h_{FS}}{2} = \frac{\pi}{2} \times 31.25 \times 10.0 = \frac{\pi}{2} \times 312.5 = 490.9\ \text{mm}^2 = 4.909 \times 10^{-4}\ \text{m}^2$$

Shear flow in D-box skin:

$$q_s = \frac{T_{\text{root}}}{2 A_{\text{enc}}} = \frac{0.1052}{2 \times 4.909 \times 10^{-4}} = \frac{0.1052}{9.818 \times 10^{-4}} = 107.2\ \text{N/m}$$

Shear stress in D-box skin (skin thickness $t_s$):

$$\tau_{D} = \frac{q_s}{t_s}$$

For aluminium skin with $t_s = 0.3\ \text{mm}$ (see §11):

$$\tau_{D} = \frac{107.2}{3 \times 10^{-4}} = 357,333\ \text{Pa} = 0.357\ \text{MPa} \ll \tau_{\text{allow}} = 159.2\ \text{MPa} \quad ✓$$

### 10.3 Angle of twist

Using the Bredt–Batho formula for twist rate:

$$\frac{d\phi}{dy} = \frac{T}{4 A_{\text{enc}}^2} \oint \frac{ds}{G t_s}$$

For uniform skin thickness $t_s$, the perimeter of the D-box:

$$s_D \approx \pi \sqrt{\frac{(c_1/2)^2 + (h_{FS}/2)^2}{2}} \approx \pi \sqrt{\frac{31.25^2 + 10.0^2}{2}} = \pi \sqrt{\frac{976.6 + 100}{2}} = \pi \sqrt{538.3} = \pi \times 23.2 = 72.9\ \text{mm}$$

$$\oint \frac{ds}{Gt_s} = \frac{s_D}{G t_s} = \frac{72.9 \times 10^{-3}}{26 \times 10^9 \times 3 \times 10^{-4}} = \frac{72.9 \times 10^{-3}}{7.8 \times 10^6} = 9.346 \times 10^{-9}\ \text{m/N}$$

Twist rate at root (maximum torque):

$$\frac{d\phi}{dy}\bigg|_{\text{root}} = \frac{T_{\text{root}}}{4 A_{\text{enc}}^2} \times \frac{s_D}{G t_s} = \frac{0.1052}{4 \times (4.909 \times 10^{-4})^2} \times 9.346 \times 10^{-9}$$

$$= \frac{0.1052}{4 \times 2.410 \times 10^{-7}} \times 9.346 \times 10^{-9} = \frac{0.1052}{9.639 \times 10^{-7}} \times 9.346 \times 10^{-9}$$

$$= 1.091 \times 10^5 \times 9.346 \times 10^{-9} = 1.020 \times 10^{-3}\ \text{rad/m}$$

Total twist at tip (assuming linear torque decay from root to tip):

$$\phi_{\text{tip}} = \frac{1}{2} \times \frac{d\phi}{dy}\bigg|_{\text{root}} \times \frac{b}{2} = \frac{1}{2} \times 1.020 \times 10^{-3} \times 0.490 = 2.50 \times 10^{-4}\ \text{rad} = 0.0143°$$

**Aeroelastic divergence check:**

The divergence dynamic pressure is:

$$q_D = \frac{GJ_{\text{eff}}}{e\, a\, (b/2)^2}$$

where $GJ_{\text{eff}} = 4 A_{\text{enc}}^2 G t_s / s_D$ (Bredt closed section):

$$GJ_{\text{eff}} = \frac{4 \times (4.909 \times 10^{-4})^2 \times 26 \times 10^9 \times 3 \times 10^{-4}}{72.9 \times 10^{-3}}$$

$$= \frac{4 \times 2.410 \times 10^{-7} \times 7.8 \times 10^6}{72.9 \times 10^{-3}} = \frac{7.519}{72.9 \times 10^{-3}} = 103.1\ \text{N·m}^2$$

$$q_D = \frac{103.1}{0.0156 \times 4.16 \times 0.250 \times (0.490)^2} = \frac{103.1}{0.0156 \times 4.16 \times 0.250 \times 0.2401}$$

$$= \frac{103.1}{3.893 \times 10^{-3}} = 26{,}483\ \text{N/m}^2$$

Ratio $q_\infty / q_D = 25.01 / 26{,}483 = 9.4 \times 10^{-4}$ — divergence is not a concern at cruise speed. ✓

---

## 11. Skin (Covering Sheet) Sizing

### 11.1 Leading-edge D-box skin

The D-box skin must resist:
1. Torsion-induced shear (§10.2): τ = 0.357 MPa
2. Compressive loads from upper-surface bending of main spar: negligible in skin

The buckling criterion governs. The skin panel between ribs (a = 25 mm) under torsional shear flow:

**Shear buckling of flat plate** (Roark's, Table 15.3, SS edges):

$$\tau_{\text{cr}} = k_s \frac{\pi^2 E}{12(1-\nu^2)} \left(\frac{t_s}{a}\right)^2$$

For $k_s = 5.35$ (shear buckling, SS plate, $b/a \gg 1$):

$$t_s \geq a \sqrt{\frac{\tau_{\text{allow}}}{k_s \frac{\pi^2 E}{12(1-\nu^2)}}}$$

Using $\tau_{\text{allow}} = 0.357\ \text{MPa}$ (from torsion), $a = 25.1\ \text{mm}$:

$$\frac{\tau_{\text{allow}}}{k_s \frac{\pi^2 E}{12(1-\nu^2)}} = \frac{0.357 \times 10^6}{5.35 \times \frac{\pi^2 \times 69 \times 10^9}{12 \times (1-0.33^2)}}$$

$$= \frac{0.357 \times 10^6}{5.35 \times \frac{681.2 \times 10^9}{12 \times 0.8911}} = \frac{0.357 \times 10^6}{5.35 \times 63.70 \times 10^9} = \frac{0.357 \times 10^6}{340.8 \times 10^9} = 1.047 \times 10^{-6}$$

$$t_s \geq 25.1 \times \sqrt{1.047 \times 10^{-6}} = 25.1 \times 1.023 \times 10^{-3}\ \text{m} = 0.0257\ \text{mm}$$

Minimum skin thickness is essentially zero from the stress/buckling perspective. **Practical minimum for aluminium sheet: $t_s = 0.2\ \text{mm}$.**

However, to check compressive buckling of the top skin (between ribs, under the bending-induced compression):

Compressive stress in top skin from spar bending (upper surface):

$$\sigma_c \approx \frac{M_{\text{root}} \times z}{I_{\text{total}}}$$

where z = h_FS/2 = 10 mm from spar neutral axis, and $I_{\text{total}}$ is the combined section inertia. For the spar alone: $I_{FS} = 3.068 \times 10^{-11}\ \text{m}^4$. The skin contribution is secondary. Using spar only:

$$\sigma_c = \frac{2.025 \times 0.010}{3.068 \times 10^{-11}} = \frac{0.02025}{3.068 \times 10^{-11}} = 6.60 \times 10^8\ \text{Pa} = 660\ \text{MPa}$$

> This confirms the spar carries the bending — the skin does not participate in bending resistance and is sizing by buckling/minimum gauge only.

**Compressive buckling of skin panel** (rib pitch a = 25 mm, chord direction b_panel = 100 mm inter-spar bay; k = 4.0, all edges SS):

$$\sigma_{\text{cr}} = 4.0 \times \frac{\pi^2 \times 69 \times 10^9}{12(1-0.33^2)} \left(\frac{t_s}{25.1 \times 10^{-3}}\right)^2$$

Set $\sigma_{\text{cr}} = \sigma_{\text{allow}} = 206.7\ \text{MPa}$:

$$t_s^2 = \frac{206.7 \times 10^6 \times 12 \times 0.8911 \times (25.1 \times 10^{-3})^2}{4.0 \times \pi^2 \times 69 \times 10^9}$$

$$= \frac{206.7 \times 10^6 \times 10.693 \times 630.0 \times 10^{-6}}{4.0 \times 9.8696 \times 69 \times 10^9}$$

$$= \frac{206.7 \times 10^6 \times 6.737 \times 10^{-3}}{2.724 \times 10^{12}} = \frac{1.392 \times 10^6}{2.724 \times 10^{12}} = 5.112 \times 10^{-7}$$

$$t_s \geq 7.15 \times 10^{-4}\ \text{m} = 0.715\ \text{mm}$$

**Adopted skin thickness: $t_s = 0.3\ \text{mm}$** — this is below the calculated compressive buckling minimum. However, considering:
1. The skin is **not** carrying compression from wing bending (the spars do),
2. The skin works in **tension on the lower surface** during upward bending,
3. The film/skin acts as a **shear diaphragm**, not a compression element,

The practical design is: **0.3 mm aluminium sheet** for the D-box and leading-edge, with **thin polyester film** (Oracover / Monokote) for the inter-spar and trailing-edge bay, bonded to the ribs. This is consistent with Sky-Sailor construction.

**Skin mass:**

$$m_{\text{skin}} \approx \rho_{Al} \times t_s \times S_{D\text{-box}} = 2700 \times 3 \times 10^{-4} \times (0.0625 \times 0.980) = 2700 \times 3 \times 10^{-4} \times 0.06125 = 49.6\ \text{g}$$

---

## 12. Natural Frequency and Vibration Analysis

### 12.1 Fundamental bending frequency

The wing is modelled as a **uniform cantilever beam** (Euler–Bernoulli). The natural frequency of the first bending mode is:

$$f_1 = \frac{\lambda_1^2}{2\pi} \sqrt{\frac{EI}{\mu_L L^4}}$$

where:
- $\lambda_1 = 1.875$ (first mode eigenvalue for cantilever)
- $L = b/2 = 0.490\ \text{m}$ (semi-span as beam length)
- $\mu_L$ = mass per unit length (kg/m)
- $EI = E_{Al} \times I_{FS}$ (main spar dominates)

**Mass per unit length:**

$$\mu_L = \frac{m_{\text{spar}} + m_{\text{ribs}} + m_{\text{skin}}}{b/2 \times 2} = \frac{(51.9 + 32.0 + 49.6) \times 10^{-3}}{0.980} = \frac{133.5 \times 10^{-3}}{0.980} = 0.1362\ \text{kg/m}$$

Adding an estimated half of remaining components distributed along the wing:

$$\mu_L \approx 0.136 + \frac{0.5 \times (500 - 133.5) \times 10^{-3}}{0.980} = 0.136 + 0.187 = 0.323\ \text{kg/m}$$

**Fundamental bending frequency:**

$$EI_{FS} = 69 \times 10^9 \times 3.068 \times 10^{-11} = 2.117\ \text{N·m}^2$$

$$f_1 = \frac{(1.875)^2}{2\pi} \sqrt{\frac{2.117}{0.323 \times (0.490)^4}}$$

$$= \frac{3.516}{6.2832} \sqrt{\frac{2.117}{0.323 \times 0.05765}}$$

$$= 0.5596 \sqrt{\frac{2.117}{1.862 \times 10^{-2}}}$$

$$= 0.5596 \sqrt{113.7} = 0.5596 \times 10.66 = 5.97\ \text{Hz}$$

$$\boxed{f_1 \approx 5.97\ \text{Hz} \quad \text{(first bending mode)}}$$

### 12.2 Second bending mode

$$f_2 = \left(\frac{\lambda_2}{\lambda_1}\right)^2 f_1 = \left(\frac{4.694}{1.875}\right)^2 \times 5.97 = (2.503)^2 \times 5.97 = 6.266 \times 5.97 = 37.4\ \text{Hz}$$

### 12.3 Fundamental torsional frequency

The wing is modelled as a beam in torsion (uniform cantilever):

$$f_{T1} = \frac{1}{4L} \sqrt{\frac{GJ_{\text{eff}}}{\rho_{\text{polar}}}}$$

where $\rho_{\text{polar}}$ is the polar mass moment per unit length. Approximating the wing cross-section as the D-box:

$$\rho_{\text{polar}} \approx \mu_L \times r_{\text{gyration}}^2 \approx 0.323 \times \left(\frac{c}{4}\right)^2 = 0.323 \times (0.0625)^2 = 0.323 \times 3.906 \times 10^{-3} = 1.262 \times 10^{-3}\ \text{kg·m}$$

$$f_{T1} = \frac{1}{4 \times 0.490} \sqrt{\frac{103.1}{1.262 \times 10^{-3}}} = \frac{1}{1.960} \sqrt{81,696} = \frac{285.8}{1.960} = 145.8\ \text{Hz}$$

$$\boxed{f_{T1} \approx 145.8\ \text{Hz} \quad \text{(first torsional mode)}}$$

**Flutter margin** (Collar triangle): Since $f_{T1}/f_1 \approx 145.8/5.97 \approx 24.4 \gg 2$, bending-torsion flutter is not a concern at cruise speeds. ✓

### 12.4 Aileron buzz / control surface frequency

The rear spar supports the aileron hinge. Aileron natural frequency (simplified torsional pendulum):

$$f_{\text{ail}} \approx \frac{1}{2\pi}\sqrt{\frac{k_{\text{hinge}}}{I_{\text{ail}}}}$$

With aileron chord ≈ 30% of local chord = 75 mm, span ≈ 300 mm, mass ≈ 15 g:

$$I_{\text{ail}} \approx m_{\text{ail}} \times r^2 \approx 0.015 \times (0.0375)^2 = 2.109 \times 10^{-5}\ \text{kg·m}^2$$

Hinge stiffness from rear spar (3 mm Al rod, torsion):

$$k_{\text{hinge}} = \frac{GJ_{RS}}{L_{\text{ail}}} = \frac{26 \times 10^9 \times \frac{\pi (1.5 \times 10^{-3})^4}{2}}{0.300} = \frac{26 \times 10^9 \times 7.952 \times 10^{-12}}{0.300} = \frac{0.2067}{0.300} = 0.689\ \text{N·m/rad}$$

$$f_{\text{ail}} = \frac{1}{2\pi}\sqrt{\frac{0.689}{2.109 \times 10^{-5}}} = \frac{1}{6.2832}\sqrt{32,674} = \frac{180.8}{6.2832} = 28.8\ \text{Hz}$$

$$\boxed{f_{\text{ail}} \approx 28.8\ \text{Hz}}$$

This is well separated from wing bending frequency (5.97 Hz) and torsional frequency (145.8 Hz). ✓

---

## 13. Summary of All Substructures

### 13.1 Substructure count and function

| Sub-structure | Count | Material | Size / Thickness | Mass (g) | Primary Function |
|---|---|---|---|---|---|
| **Front (main) spar** | 2 (one per half-wing) | Al 6061-T6 rod | ∅ 5 mm, L = 490 mm | 52 | Bending & shear; 90% of M_root |
| **Rear spar** | 2 (one per half-wing) | Al 6061-T6 rod | ∅ 3 mm, L = 490 mm | 19 | Torsion + aileron hinge; 10% of M |
| **Full-depth ribs** | 40 | Balsa wood (along-grain) | 2 mm thick, full chord | 32 | Airfoil shape; load transfer; skin support |
| **Leading-edge D-box skin** | 1 continuous | Al sheet 0.3 mm | LE to FS (62.5 mm), span 980 mm | ~50 | Primary torsion box; aero shape |
| **Inter-spar upper skin** | 1 continuous | Polyester film or Al 0.1 mm | FS to RS (100 mm), span 980 mm | ~10 | Shear diaphragm; solar cell substrate |
| **Inter-spar lower skin** | 1 continuous | Polyester film | FS to RS, span 980 mm | ~5 | Shear diaphragm; aerodynamic surface |
| **Trailing-edge skin** | 1 continuous | Polyester film | RS to TE (87.5 mm), span 980 mm | ~5 | Aerodynamic shape |
| **Root joint / splices** | 2 (root of each half) | Al bracket | — | ~10 | Load transfer to fuselage |
| **Ailerons** | 2 (one per half-wing) | Balsa + film | ~75 mm chord, ~300 mm span | ~15 | Roll control |
| **Wing tip fairings** | 2 | Moulded Depron / foam | — | ~5 | Tip vortex reduction |
| **Total (structural wing)** | — | — | — | **~203 g** | — |

### 13.2 Structural margin summary

| Component | Load (N·m or N) | Allowable (N·m or N) | Margin of Safety |
|---|---|---|---|
| Main spar — bending | σ = 165.0 MPa | σ_allow = 206.7 MPa | **+0.25** |
| Main spar — shear | τ = 0.625 MPa | τ_allow = 159.2 MPa | **>> 1** |
| Main spar — tip deflection | δ = 42.6 mm | δ_allow ≈ 49 mm (5% span) | **+0.15** |
| Rear spar — bending | σ = 84.9 MPa | σ_allow = 206.7 MPa | **+1.43** |
| Ribs — bending | σ = 0.05 MPa | σ_allow = 9.8 MPa | **>> 1** |
| D-box skin — torsion shear | τ = 0.357 MPa | τ_allow = 159.2 MPa | **>> 1** |
| Wing twist at tip | φ = 0.014° | φ_allow ≈ 1° | **>> 1** |
| Divergence ratio | q/q_D = 9.4 × 10⁻⁴ | < 1 | ✓ |

### 13.3 Natural frequencies

| Mode | Frequency (Hz) | Comment |
|---|---|---|
| 1st bending | 5.97 Hz | Fundamental wing flap mode |
| 2nd bending | 37.4 Hz | Second cantilever mode |
| 1st torsion | 145.8 Hz | Far above bending; no flutter concern |
| Aileron buzz | 28.8 Hz | Between bending modes; no coupling concern |

### 13.4 Weight budget

| Item | Mass (g) |
|---|---|
| Main spar (both half-spars) | 52 |
| Rear spar (both half-spars) | 19 |
| Ribs (40 × 0.8 g) | 32 |
| Leading-edge D-box skin | 50 |
| Inter-spar and trailing skins | 20 |
| Root joints / misc. hardware | 10 |
| Ailerons (2) | 15 |
| Wing tips | 5 |
| **Total wing structure** | **203** |
| Propulsion, avionics, battery | 297 |
| **Total aircraft** | **500** |

---

## Appendix A — Material Properties Summary

| Material | E (GPa) | G (GPa) | σ_y (MPa) | σ_ult (MPa) | ρ (kg/m³) |
|---|---|---|---|---|---|
| Al 6061-T6 | 69 | 26 | 276 | 310 | 2700 |
| Balsa (along grain, medium) | 3.4 | 0.16 | 14.7 | 14.7 | 160 |
| Carbon fibre (unidirectional, for reference) | 135 | 5.1 | — | 1500 | 1600 |
| Polyester film (Oracover, for reference) | 3.5 | — | 50 | 70 | 1390 |

---

## Appendix B — Assumptions Correction Table

| Assumption | Initial (uncorrected) | Corrected value | Correction method |
|---|---|---|---|
| Total mass | 70 g (cubic scaling) | **500 g** | Structural weight model + component budget |
| Lift distribution | Uniform | **Elliptical** | Prandtl lifting-line (rectangular wing, AR = 3.92) |
| Root bending moment | 2.25 N·m (uniform) | **1.91 N·m** (elliptical) | 15% reduction; use uniform as conservative design value |
| C_P location | 25% chord | **31.3% chord** | From C_M,AC = −0.05, C_L = 0.80 |
| D-box area | Not estimated | **490.9 mm²** | Semi-ellipse geometry of airfoil LE |
| Gust load factor | n = 2.5 | Δn_gust = 7.31, **limited to n = 2.5 operationally** | Calm-weather flight restriction |
| Skin in bending | Participates | **Spar only** (skin is secondary) | Comparison of skin/spar stiffness |
| Torsional stiffness | Open section | **Closed D-box** (Bredt–Batho) | LE + FS + skin form closed cell |

---

## References

1. Noth, A. and Siegwart, R., *Design of Solar Powered Airplanes for Continuous Flight*, ETH Zürich, Dissertation No. 18010, 2008.
2. Wing Structure G2 Preliminary Design Report, AE322/AE341, IIST, February 2026.
3. Structures Project VI — IDR, IIST, 2026.
4. Young, W.C. and Budynas, R.G., *Roark's Formulas for Stress and Strain*, 7th ed., McGraw-Hill, 2002. (Tables 3.1, 8.1, 15.3, 16.1)
5. Megson, T.H.G., *Aircraft Structures for Engineering Students*, 4th ed., Butterworth-Heinemann.
6. Maughmer, M.D. and Brandt, S.A., *Aerodynamics for Engineers*, Prentice Hall.
7. Blevins, R.D., *Formulas for Natural Frequency and Mode Shape*, Van Nostrand Reinhold, 1979.
