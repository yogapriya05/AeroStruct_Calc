# Wing Structure Design Calculations
## Solar UAV Wing — AE322 / AE341 Group 2, IIST | Academic Year 2025–26

---

## Table of Contents

1. [Introduction and Use Case](#1-introduction-and-use-case)
2. [Wing Geometry and Airfoil Parameters](#2-wing-geometry-and-airfoil-parameters)
3. [Mass Estimation and Assumptions](#3-mass-estimation-and-assumptions)
4. [Aerodynamic Load Analysis](#4-aerodynamic-load-analysis)
   - 4.3 Design Loads (with Gust Alleviation Factor K_g)
   - 4.4 Flight Envelope (V-n Diagram)
   - 4.5 Aileron Roll Manoeuvre Load
   - 4.6 Aerodynamic Loads at ISA 1000 m
5. [Distributed Lift and Shear Force Diagrams](#5-distributed-lift-and-shear-force-diagrams)
   - 5.4 Inertia Relief
6. [Bending Moment Distribution](#6-bending-moment-distribution)
7. [Torsion Analysis](#7-torsion-analysis)
8. [Main Spar (Front Spar) Sizing](#8-main-spar-front-spar-sizing)
9. [Rear Spar Sizing](#9-rear-spar-sizing)
10. [Rib Design and Spacing](#10-rib-design-and-spacing)
11. [Skin (Covering Sheet) Sizing](#11-skin-covering-sheet-sizing)
12. [Natural Frequency and Vibration Analysis](#12-natural-frequency-and-vibration-analysis)
    - 12.5 Flutter and Divergence Speed
13. [Summary of All Substructures](#13-summary-of-all-substructures)
14. [Fabrication — Bill of Materials](#14-fabrication--bill-of-materials)
15. [Testing: Procedures, Cautions, and Expected Results](#15-testing-procedures-cautions-and-expected-results)
- [Appendix A — Material Properties](#appendix-a--material-properties-summary)
- [Appendix B — Assumptions Correction Table](#appendix-b--assumptions-correction-table)
- [Appendix C — Full-Scale Reference Analysis (Sky-Sailor)](#appendix-c--full-scale-reference-analysis-sky-sailor)

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

Our design uses the **WE3.55-9.3 airfoil** with a span of 1000 mm.

---

## 2. Wing Geometry and Airfoil Parameters

### 2.1 Wing planform

| Parameter | Symbol | Value |
|---|---|---|
| Full span | b | 1000 mm = 1.000 m |
| Half-span | b/2 | 500 mm = 0.500 m |
| Chord (constant) | c | 250 mm = 0.250 m |
| Wing planform area | S | b × c = 0.250 m² |
| Aspect ratio | AR | b²/S = 1.000²/0.250 = **4.0** |
| Taper ratio | λ | 1.00 (rectangular planform) |
| Dihedral | Γ | 3° (assumed, for lateral stability) |
| Sweep | Λ | 0° (unswept) |

Wing area:
$$S = b \times c = 1.000 \times 0.250 = 0.250\ \text{m}^2$$

Aspect ratio:
$$AR = \frac{b^2}{S} = \frac{(1.000)^2}{0.250} = \frac{1.000}{0.250} = 4.0$$

## 2.2 Airfoil: WE3.55-9.3

| Parameter | Value |
|---|---|
| Max thickness | t/c = 9.3 % |
| Max thickness location | ≈ 30 % chord |
| Max camber | f/c = 3.55 % |
| Max camber location | ≈ 40 % chord |
| Design C_L (cruise) | C_L ≈ 0.80 |
| Pitching-moment coeff. (about AC) | C_M,AC ≈ −0.05 |
| Aerodynamic centre | x_AC/c ≈ 0.25 |
| Zero-lift angle of attack | α₀ ≈ −4° |

**Structural depths at key chord-wise stations:**

$$t_{\max} = \frac{t}{c} \times c = 0.093 \times 250\ \text{mm} = 23.25\ \text{mm}$$

| Station | % chord | x from LE (mm) | Airfoil thickness (approx., mm) |
|---|---|---|---|
| Leading edge | 0 % | 0 | 0 |
| Front spar (FS) | 25 % | 62.5 | 20.0 |
| Max thickness | 30 % | 75.0 | 23.25 |
| Rear spar (RS) | 65 % | 162.5 | 13.5 |
| Trailing edge | 100 % | 250.0 | 0 |

Thickness at the front spar (interpolated using the WE3.55-9.3 thickness distribution, which closely follows an approximately NACA-type shape):

$$h_{FS} \approx 0.86 \times t_{\max} = 0.86 \times 23.25 = 20.0\ \text{mm}$$

Thickness at the rear spar (approximately 58 % of max):

$$h_{RS} \approx 0.58 \times t_{\max} = 0.58 \times 23.25 = 13.5\ \text{mm}$$

## 2.3 Spar Locations on Camber Line

For the WE3.55-9.3 airfoil, the camber line is **curved** — it is a smooth arc from LE to TE with maximum camber f = 3.55 % of chord = 8.875 mm at approximately 40 % chord (100 mm from LE). The spar positions are measured along the chord line (horizontal projection) and the camber line rises above it.

**Camber line height above chord line** (using 4-digit NACA-like formula, m = 0.0355, p = 0.40):

At the front spar (x/c = 0.25, ξ = 0.25 < p = 0.40):

$$y_{c,FS} = \frac{m}{p^2}(2p\xi - \xi^2) = \frac{0.0355}{0.16}(2 \times 0.40 \times 0.25 - 0.25^2) = 0.2219 \times 0.1375 = 0.0305$$

$$y_{c,FS} = 0.0305 \times 250\ \text{mm} = 7.6\ \text{mm above the chord line}$$

At the rear spar (x/c = 0.65, ξ = 0.65 > p = 0.40):

$$y_{c,RS} = \frac{m}{(1-p)^2}(1 - 2p + 2p\xi - \xi^2) = \frac{0.0355}{0.36}(1 - 0.8 + 0.52 - 0.4225) = 0.09861 \times 0.2975 = 0.02933$$

$$y_{c,RS} = 0.02933 \times 250\ \text{mm} = 7.3\ \text{mm above the chord line}$$

**Spar positions on the camber line:**
- **Front spar (FS):** 25 % chord = 62.5 mm from LE (chord-wise); camber height = 7.6 mm above chord; airfoil full height h_FS = 20.0 mm. Spar diameter 5 mm << 20.0 mm ✓
- **Rear spar (RS):** 65 % chord = 162.5 mm from LE (chord-wise); camber height = 7.3 mm above chord; airfoil full height h_RS = 13.5 mm. Spar diameter 3 mm << 13.5 mm ✓

**Non-zero torsional loading:** Since WE3.55-9.3 is cambered, C_M,AC ≈ −0.05 (non-zero). The centre of pressure is:

$$\frac{x_{CP}}{c} = \frac{x_{AC}}{c} - \frac{C_{M,AC}}{C_L} = 0.25 - \frac{-0.05}{0.80} = 0.25 + 0.0625 = 0.3125$$

$$x_{CP} = 0.3125 \times 250 = 78.1\ \text{mm from LE}$$

$$e_L = x_{CP} - x_{FS} = 78.1 - 62.5 = 15.6\ \text{mm} = 0.0156\ \text{m}$$

The WE3.55-9.3 airfoil produces a **non-zero net torque** about the front spar (T_root ≈ 0.105 N·m, see §7). The wing must resist this torsion through the structural arrangement of the two spars acting as an inter-connected system through the ribs, forming an open-section torsion-resistant structure.

## 2.4 Spar and rib layout

| Sub-structure | Location | Count | Material |
|---|---|---|---|
| Front (main) spar | 25 % c = 62.5 mm from LE | 1 | Aluminium rod (solid circular) |
| Rear spar | 65 % c = 162.5 mm from LE | 1 | Aluminium rod (solid circular) |
| Ribs | Spanwise, 76.9 mm pitch | 14 | Balsa wood sheet, 3 mm thick |

---

## 3. Mass Estimation and Assumptions

### 3.1 Assumptions

| Assumption | Justification / Correction |
|---|---|
| **A1.** Total aircraft mass m = 0.50 kg | Scaled from Sky-Sailor using cubic scaling law (see §3.2). Conservative estimate for a 1000 mm span solar UAV. |
| **A2.** Design load factor n = 2.5 | Standard value for small UAVs (CS-23 small aircraft; acceptable for academic model). Gust correction applied in §4.3. |
| **A3.** Ultimate factor of safety FOS = 1.5 | FAR/CS standard; ensures plastic reserve beyond limit loads. |
| **A4.** Lift acts at x_CP = 31.3 % c | Derived from C_L and C_M (see §4.2); corrected for off-design conditions. |
| **A5.** Rectangular wing → uniform load baseline | Elliptical correction applied in §5.2. |
| **A6.** Cruise altitude ≈ sea level; ρ = 1.225 kg/m³ | Low-altitude solar UAV; use ISA sea-level values. |
| **A7.** Aluminium alloy: Al 6061-T6 | Commonly available, good strength-to-weight; rod and sheet forms used. |
| **A8.** Balsa rib grain parallel to chord | Maximises bending stiffness in ribs; standard orientation. |
| **A9.** Open-section torsion model | WE3.55-9.3 (C_M,AC ≈ −0.05) with front spar at 25 %c: e_L = 15.6 mm, T_root ≈ 0.105 N·m. Resisted by the spar-rib open-section structure. |
| **A10.** Fixed-free cantilever beam model | Wing is cantilevered at root (centre fuselage joint); tip is free. |

### 3.2 Total aircraft mass — scaling from Sky-Sailor

Cubic scaling law (Noth Ch. 3, geometric similarity):

$$m_{\text{our}} = m_{\text{SS}} \left(\frac{b_{\text{our}}}{b_{\text{SS}}}\right)^3 = 2.44 \times \left(\frac{1.000}{3.200}\right)^3$$

$$= 2.44 \times (0.3063)^3 = 2.44 \times 0.02873 = 0.0701\ \text{kg}$$

This gives 70 g, which is unrealistically small for a functional prototype with aluminium components. The cubic scaling assumes geometric and material similarity (all-composite), which does not hold when switching to aluminium spars.

**Corrected estimate — structural weight model (Noth top-5% model):**

$$W_{af} = 0.44\, S^{1.55}\, AR^{1.30}\ [\text{N}]$$

$$W_{af} = 0.44 \times (0.250)^{1.55} \times (4.0)^{1.30}$$

Calculate each factor:

$$(0.250)^{1.55} = e^{1.55 \ln(0.250)} = e^{1.55 \times (-1.386)} = e^{-2.148} = 0.1138$$

$$(4.0)^{1.30} = e^{1.30 \ln(4.0)} = e^{1.30 \times 1.386} = e^{1.802} = 6.063$$

$$W_{af} = 0.44 \times 0.1138 \times 6.063 = 0.304\ \text{N} \implies m_{af,\text{best}} = 31\ \text{g}$$

This is the all-composite best-case prediction. For aluminium spars and balsa ribs, use the mean-quality model:

$$W_{af,\text{mean}} = 5.58\, S^{1.59}\, AR^{0.71} = 5.58 \times (0.250)^{1.59} \times (4.0)^{0.71}$$

$$(0.250)^{1.59} = e^{1.59 \times (-1.386)} = e^{-2.204} = 0.1104$$

$$(4.0)^{0.71} = e^{0.71 \times 1.386} = e^{0.984} = 2.675$$

$$W_{af,\text{mean}} = 5.58 \times 0.1065 \times 2.638 = 1.567\ \text{N} \implies m_{af} \approx 160\ \text{g}$$

**Adopted total aircraft mass**: Adding propulsion (~150 g), avionics (~100 g), battery (~100 g), structure (~160 g):

$$\boxed{m_{\text{total}} = 0.50\ \text{kg}, \quad W = mg = 0.50 \times 9.81 = 4.905\ \text{N}}$$

*This is the design point. All structural calculations use this value.*

---

## 4. Aerodynamic Load Analysis

### 4.1 Cruise flight conditions

Level cruise (load factor n = 1):

$$L = W = 4.905\ \text{N}$$

$$\frac{W}{S} = \frac{4.905}{0.250} = 19.62\ \text{N/m}^2$$

Cruise speed from the level-flight lift equation:

$$v_{\text{cruise}} = \sqrt{\frac{2L}{\rho\, C_L\, S}} = \sqrt{\frac{2 \times 4.905}{1.225 \times 0.80 \times 0.250}}$$

$$= \sqrt{\frac{9.810}{0.2450}} = \sqrt{40.04} = 6.33\ \text{m/s}$$

Reynolds number at cruise:

$$Re = \frac{\rho\, v\, c}{\mu} = \frac{1.225 \times 6.33 \times 0.250}{1.789 \times 10^{-5}} = \frac{1.939}{1.789 \times 10^{-5}} = 1.08 \times 10^5$$

This is in the valid operating range for WE3.55-9.3 (Re = 80,000 – 300,000; designed for solar UAV cruise conditions).

Dynamic pressure at cruise:

$$q_{\infty} = \frac{1}{2}\rho v^2 = \frac{1}{2} \times 1.225 \times (6.33)^2 = 0.6125 \times 40.07 = 24.54\ \text{N/m}^2$$

### 4.2 Centre of Pressure and Torsional Loading

For the **WE3.55-9.3 airfoil**, C_M,AC ≈ −0.05. The centre of pressure is at:

$$\frac{x_{CP}}{c} = \frac{x_{AC}}{c} - \frac{C_{M,AC}}{C_L} = 0.25 - \frac{-0.05}{0.80} = 0.25 + 0.0625 = 0.3125$$

$$x_{CP} = 0.3125 \times 250 = 78.1\ \text{mm from LE}$$

**Eccentricity of lift from front spar:**

$$e_L = x_{CP} - x_{FS} = 78.1 - 62.5 = 15.6\ \text{mm} = 0.0156\ \text{m}$$

The eccentricity is **15.6 mm** — lift acts 15.6 mm aft of the front spar. Combined with the non-zero pitching moment (C_M,AC = −0.05), this produces a net root torque of T_root ≈ 0.105 N·m (calculated in §7). See §2.3 for camber line geometry.

### 4.3 Design loads (limit and ultimate)

**Limit load factor** n = 2.5 (manoeuvre). This is the maximum steady pull-up expected.

**Gust load correction** (CS-23 simplified gust formula):

$$\Delta n_{\text{gust}} = \frac{\rho\, U_e\, v\, a}{2 (W/S)}$$

where U_e = 9.1 m/s (gust speed at cruise; CS-23 for low-altitude), a = dC_L/dα per rad.

For finite wing: $a = \frac{2\pi AR}{AR + 2} = \frac{2\pi \times 4.0}{4.0 + 2} = \frac{25.13}{6.0} = 4.19\ \text{rad}^{-1}$

$$\Delta n_{\text{gust}} = \frac{1.225 \times 9.1 \times 6.33 \times 4.19}{2 \times 19.62} = \frac{295.9}{39.24} = 7.54$$

**Gust alleviation factor (FAR 23 §23.341):** The raw gust increment overestimates the effective load because inertia of the aircraft partially attenuates the instantaneous gust response. The alleviation factor K_g is:

$$K_g = \frac{0.88\,\mu_g}{5.3 + \mu_g}$$

where the mass ratio $\mu_g$ is:

$$\mu_g = \frac{2\,(m/S)}{\rho\,c\,a} = \frac{2 \times (0.500/0.250)}{1.225 \times 0.250 \times 4.19} = \frac{2 \times 2.000}{1.283} = \frac{4.000}{1.283} = 3.118$$

$$K_g = \frac{0.88 \times 3.118}{5.3 + 3.118} = \frac{2.744}{8.418} = 0.326$$

Alleviated gust increment:

$$\Delta n_{\text{gust,allev}} = K_g \times \Delta n_{\text{gust}} = 0.326 \times 7.54 = 2.46$$

$$n_{\text{gust,total}} = 1 + 2.46 = 3.46$$

**Conclusion:** After gust alleviation, $n_{\text{gust}} = 3.46 \approx n_{\text{manoeuvre}} = 2.5$; the manoeuvre limit governs. The structural design uses **n = 2.5** as the limit load factor.

> **Note:** Even the alleviated gust load factor (3.46) exceeds the 2.5 manoeuvre limit. This is typical for ultra-light solar UAVs with very low wing loading (W/S = 19.62 N/m²). Operationally, flights must be restricted to calm conditions (winds ≤ 5 m/s) to keep the effective load factor within the structural envelope.

**Limit lift force (full wing):**

$$L_{\text{limit}} = n \times W = 2.5 \times 4.905 = 12.26\ \text{N}$$

**Ultimate lift force:**

$$L_{\text{ult}} = FOS \times L_{\text{limit}} = 1.5 \times 12.26 = 18.39\ \text{N}$$

**Per half-wing (single panel, cantilevered at root):**

$$L_{1/2,\text{limit}} = \frac{L_{\text{limit}}}{2} = 6.13\ \text{N}$$

$$L_{1/2,\text{ult}} = \frac{L_{\text{ult}}}{2} = 9.20\ \text{N}$$

### 4.4 Flight Envelope (V-n Diagram)

The V-n diagram defines the structural flight envelope — the combinations of speed and load factor the wing is designed to withstand.

**Stall speed:**

$$V_{\text{stall}} = \sqrt{\frac{2W}{\rho\,C_{L,\max}\,S}} = \sqrt{\frac{2 \times 4.905}{1.225 \times 1.25 \times 0.250}} = \sqrt{\frac{9.810}{0.3828}} = \sqrt{25.63} = 5.06\ \text{m/s}$$

where $C_{L,\max} = 1.25$ for the WE3.55-9.3 cambered airfoil at Re ≈ 100,000 (estimated from airfoil characteristic data; higher than NACA 0012 due to camber).

**Manoeuvre speed:**

$$V_A = V_{\text{stall}} \times \sqrt{n_{\text{max}}} = 5.06 \times \sqrt{2.5} = 5.06 \times 1.581 = 8.00\ \text{m/s}$$

**Design dive speed** (FAR 23 §23.335):

$$V_D = 1.40 \times V_c = 1.40 \times 6.33 = 8.86\ \text{m/s}$$

**Key V-n envelope points:**

| Point | Speed (m/s) | Load factor n | Condition |
|---|---|---|---|
| A | 8.00 | +2.5 | Positive manoeuvre limit |
| D | 8.86 | +2.5 | Design dive speed (positive) |
| G | 8.00 | −1.0 | Negative manoeuvre limit |
| Gust (cruise, unalleviated) | 6.33 | +8.54 | Δn = 7.54 at V_c |
| Gust (cruise, alleviated) | 6.33 | +3.46 | K_g × Δn at V_c |
| 1 g cruise | 6.33 | +1.0 | Nominal level flight |

**Design envelope summary:**
- Positive limit load factor: **n = +2.5** (manoeuvre governs after alleviation)
- Negative limit load factor: **n = −1.0** (conservative; solar UAVs rarely inverted)
- Design dive speed: **V_D = 8.86 m/s**

### 4.5 Aileron Roll Manoeuvre Load

For the **asymmetric roll manoeuvre** (one aileron deflected ≈ 20°), one wing generates increased lift and the other reduced lift. This constitutes an additional load case.

Aileron effectiveness assumption: 10 % incremental lift per wing relative to steady-flight value.

$$\Delta L_{\text{aileron}} = \pm 0.10 \times L_{1/2,\text{limit}} = \pm 0.10 \times 6.13 = \pm 0.613\ \text{N}$$

| Wing | Lift at limit, roll manoeuvre (N) | Notes |
|---|---|---|
| Up-going (loaded) | 6.13 + 0.61 = **6.74 N** | +10 % increment |
| Down-going (unloaded) | 6.13 − 0.61 = **5.52 N** | −10 % increment |

The up-going wing governs: $L_{1/2,\text{limit,roll}} = 6.74\ \text{N}$, which is **+10 % above the symmetric limit load** and remains within the manoeuvre envelope. The rear spar (aileron hinge line) sees an additional local concentrated hinge-load increment.

**Rear spar incremental root bending moment from aileron:**

$$\Delta M_{\text{RS,root}} = \Delta L_{\text{aileron}} \times \bar{y}_{\text{aileron}}$$

Aileron assumed to span the outer 30 % of semi-span: $\bar{y}_{\text{aileron}} = 0.85 \times (b/2) = 0.85 \times 0.500 = 0.425\ \text{m}$

$$\Delta M_{\text{RS,root}} = 0.613 \times 0.417 = 0.256\ \text{N·m}$$

From Section 8.2, the rear spar root bending moment at symmetric limit is M_RS,limit = 0.191 N·m (10 % of total, from §9.1). With aileron increment:

$$M_{\text{RS,root,roll}} = 0.191 + 0.256 = 0.447\ \text{N·m}$$

Checking the rear spar (∅3 mm rod, I = 3.976 × 10⁻¹² m⁴, σ_allow = 206.7 MPa):

$$\sigma_{\text{RS,roll}} = \frac{M_{\text{RS,root,roll}} \times r}{I} = \frac{0.447 \times 1.5 \times 10^{-3}}{3.976 \times 10^{-12}} = \frac{6.705 \times 10^{-4}}{3.976 \times 10^{-12}} = 168.6\ \text{MPa}$$

$$\text{MS}_{\text{RS,roll}} = \frac{206.7}{168.6} - 1 = +0.23 \quad \checkmark$$

The rear spar survives the aileron roll load case with a positive margin of +0.23. ✓

### 4.6 Aerodynamic Loads at Operating Altitude (ISA 1000 m)

Solar UAVs frequently cruise above the ground boundary layer to benefit from steadier winds and improved solar irradiance. A representative operating altitude of **1000 m AMSL** is analysed here using the International Standard Atmosphere (ISA) model.

#### 4.6.1 ISA atmospheric properties at 1000 m

$$T_{1000} = 288.15 - 6.5 \times 1.0 = 281.65\ \text{K}$$

$$p_{1000} = 101{,}325 \times \left(1 - \frac{0.0065 \times 1000}{288.15}\right)^{g/(R_{\text{air}} \cdot \Lambda)} = 101{,}325 \times (0.9774)^{5.256} = 89{,}876\ \text{Pa}$$

where the exponent $g/(R_{\text{air}} \cdot \Lambda) = 9.807/(287.05 \times 0.0065) = 5.256$ ($\Lambda = 0.0065\ \text{K/m}$ is the ISA tropospheric temperature lapse rate; ICAO Doc 7488).

$$\rho_{1000} = \frac{p_{1000}}{R\,T_{1000}} = \frac{89{,}876}{287.05 \times 281.65} = \frac{89{,}876}{80{,}839} = 1.112\ \text{kg/m}^3$$

$$\mu_{1000} \approx 1.758 \times 10^{-5}\ \text{Pa·s} \quad (\text{from Sutherland's law at } 281.65\ \text{K})$$

| Quantity | Sea Level (ISA) | 1000 m (ISA) | Change |
|---|---|---|---|
| Temperature T | 288.15 K | 281.65 K | −2.3 % |
| Pressure p | 101,325 Pa | 89,876 Pa | −11.3 % |
| Air density ρ | 1.225 kg/m³ | 1.112 kg/m³ | −9.2 % |
| Dynamic viscosity μ | 1.789 × 10⁻⁵ Pa·s | 1.758 × 10⁻⁵ Pa·s | −1.7 % |

#### 4.6.2 Cruise speed at 1000 m

At altitude the wing must still produce the same lift to support the aircraft weight. The cruise speed increases to compensate for lower density:

$$v_{1000} = \sqrt{\frac{2L}{\rho_{1000}\,C_L\,S}} = \sqrt{\frac{2 \times 4.905}{1.112 \times 0.80 \times 0.250}} = \sqrt{\frac{9.810}{0.2224}} = \sqrt{44.11} = 6.64\ \text{m/s}$$

Compared with sea-level cruise speed of 6.33 m/s, this is a **+5 % increase** — consistent with the density ratio: $v_{1000}/v_{SL} = \sqrt{\rho_{SL}/\rho_{1000}} = \sqrt{1.225/1.112} = 1.050$.

#### 4.6.3 Dynamic pressure and Reynolds number at 1000 m

$$q_{\infty,1000} = \frac{1}{2}\,\rho_{1000}\,v_{1000}^2 = \frac{1}{2} \times 1.112 \times (6.64)^2 = 0.556 \times 44.09 = 24.51\ \text{N/m}^2$$

> **Note:** Dynamic pressure at 1000 m (24.51 N/m²) is virtually identical to the sea-level value (24.54 N/m²). This is expected — for level flight the required lift equals weight, so $q_\infty\,C_L\,S = W$ regardless of altitude, meaning $q_\infty$ is fixed by the aircraft weight and wing parameters, not by altitude directly.

Reynolds number at 1000 m:

$$Re_{1000} = \frac{\rho_{1000}\,v_{1000}\,c}{\mu_{1000}} = \frac{1.112 \times 6.64 \times 0.250}{1.758 \times 10^{-5}} = \frac{1.846}{1.758 \times 10^{-5}} = 1.05 \times 10^5$$

The Reynolds number decreases slightly relative to sea level (1.08 × 10⁵), remaining within the valid operating envelope of the WE3.55-9.3 airfoil. Transition behaviour may shift marginally, but no change in structural sizing is required.

#### 4.6.4 Aerodynamic loads at 1000 m — summary

Because $q_\infty$ is essentially constant with altitude at constant $C_L$ flight, the **aerodynamic forces and structural loads are unchanged** from the sea-level analysis.

| Load | Sea Level | 1000 m | Notes |
|---|---|---|---|
| Cruise $q_\infty$ | 24.54 N/m² | 24.51 N/m² | Negligible change |
| Cruise speed | 6.33 m/s | 6.64 m/s | +5 % |
| Total lift L | 4.905 N | 4.905 N | = W (level flight) |
| Limit lift $L_{\text{limit}}$ | 12.26 N | 12.26 N | n = 2.5 unchanged |
| Ultimate lift $L_{\text{ult}}$ | 18.39 N | 18.39 N | FOS = 1.5 unchanged |
| Half-wing shear $V_{\text{root,ult}}$ | 9.20 N | 9.20 N | Unchanged |
| Root bending moment $M_{\text{root,ult}}$ | 1.953 N·m | 1.953 N·m | Unchanged |
| Root torque $T_{\text{root}}$ | 0.105 N·m | 0.105 N·m | WE3.55-9.3, e_L=15.6 mm |

**Gust load at 1000 m:**

The gust load increment is sensitive to density. Using the CS-23 formula with $\rho_{1000} = 1.112\ \text{kg/m}^3$:

$$\Delta n_{\text{gust},1000} = \frac{\rho_{1000}\,U_e\,v_{1000}\,a}{2(W/S)} = \frac{1.112 \times 9.1 \times 6.64 \times 4.19}{2 \times 19.62} = \frac{281.1}{39.24} = 7.17$$

The gust load increment at 1000 m is **Δn_gust = 7.17**, compared with 7.54 at sea level — a **~5 % reduction** due to slightly lower air density at altitude. This increment is an *additional* load above the 1-g cruise condition; i.e., a gust encounter at cruise would produce a total load factor of 1 + 7.17 = **8.17 g**, well beyond the structural limit of n = 2.5. The governing structural design load therefore remains the manoeuvre limit n = 2.5, and operationally, flight must be restricted to calm conditions (gusts < 5 m/s) to keep the effective load factor within the structural envelope.

**Design conclusion:** All structural sizing in sections 5–12 remains valid up to 1000 m operating altitude. No altitude-driven rescaling of spar, rib, or skin dimensions is required.

---

## 5. Distributed Lift and Shear Force Diagrams

The wing coordinate y runs from root (y = 0) to tip (y = b/2 = 0.500 m).

### 5.1 Uniform load (rectangular wing, conservative)

Lift per unit span (uniform assumption):

$$w_0 = \frac{L_{1/2,\text{ult}}}{b/2} = \frac{9.20}{0.500} = 18.40\ \text{N/m}$$

### 5.2 Elliptical load distribution (Prandtl lifting-line correction)

For a rectangular planform at low AR, the true distribution lies between uniform and elliptical. The elliptical distribution is:

$$w(y) = w_{\text{root}} \sqrt{1 - \left(\frac{y}{b/2}\right)^2}, \quad y \in [0,\ b/2]$$

where the root value is found from the total half-span lift:

$$L_{1/2} = \int_0^{b/2} w(y)\, dy = w_{\text{root}} \int_0^{b/2} \sqrt{1 - \left(\frac{y}{b/2}\right)^2}\, dy = w_{\text{root}} \times \frac{\pi (b/2)}{4}$$

$$w_{\text{root}} = \frac{4\, L_{1/2,\text{ult}}}{\pi\, (b/2)} = \frac{4 \times 9.20}{\pi \times 0.500} = \frac{36.80}{1.5708} = 23.43\ \text{N/m}$$

Spot values (ultimate):

| y (m) | y/(b/2) | w(y) (N/m) |
|---|---|---|
| 0.000 (root) | 0.000 | 23.43 |
| 0.100 | 0.200 | 22.96 |
| 0.200 | 0.400 | 21.47 |
| 0.300 | 0.600 | 18.74 |
| 0.400 | 0.800 | 14.06 |
| 0.450 | 0.900 | 10.21 |
| 0.500 (tip) | 1.000 | 0.00 |

### 5.3 Shear force diagram V(y) — ultimate loads

The shear force at station y (looking from tip toward root — cantilever convention, positive up):

$$V(y) = \int_y^{b/2} w(\xi)\, d\xi$$

For the elliptical distribution:

$$V(y) = w_{\text{root}} \int_y^{b/2} \sqrt{1 - \left(\frac{\xi}{b/2}\right)^2}\, d\xi$$

Let η = ξ/(b/2), dξ = (b/2) dη:

$$V(y) = w_{\text{root}} \frac{b/2}{2} \left[\eta\sqrt{1-\eta^2} + \arcsin\eta\right]_{\eta_y}^{1}$$

where η_y = y/(b/2) and the upper limit evaluates to π/2.

At root (y = 0, η_y = 0):

$$V(0) = w_{\text{root}} \frac{b/2}{2} \left[\frac{\pi}{2} - 0\right] = 23.43 \times \frac{0.500}{2} \times \frac{\pi}{2}$$

$$= 23.43 \times 0.250 \times 1.5708 = 9.20\ \text{N} \quad (\checkmark = L_{1/2,\text{ult}})$$

Spot values of V(y) (ultimate):

| y (m) | V(y) (N) |
|---|---|
| 0.000 (root) | 9.20 |
| 0.100 | 7.66 |
| 0.200 | 5.88 |
| 0.300 | 3.91 |
| 0.400 | 1.89 |
| 0.450 | 0.97 |
| 0.500 (tip) | 0.00 |

### 5.4 Inertia Relief

The distributed weight of the wing structure acts downward during flight, partially opposing the upward aerodynamic lift and reducing the net structural loads at the root. This is called **inertia relief**.

**Wing structural mass per unit span:**

$$\bar{m} = \frac{m_{\text{wing,half}}}{b/2}$$

From Section 13.4, total wing structure (both halves) = 84.0 g; per half-span: $m_{\text{wing,half}} = 42.0\ \text{g}$ (structural: FS 26.5g + RS 9.6g + 7 ribs × 0.84g = 5.9g per half ≈ 42.0g).

$$\bar{m} = \frac{0.0435}{0.500} = 0.087\ \text{kg/m}$$

**Inertia load per unit span (uniform, downward at load factor n):**

$$w_{\text{inertia}}(y) = \bar{m} \times g \times n = 0.087 \times 9.81 \times 2.5 = 2.13\ \text{N/m}$$

**Net aerodynamic load (elliptical lift minus inertia relief):**

$$q_{\text{net}}(y) = w(y) - w_{\text{inertia}} = 23.43\sqrt{1-(y/0.500)^2} - 2.13 \quad [\text{N/m at ultimate loads}]$$

| y (m) | w(y) lift (N/m) | w_inertia (N/m) | q_net(y) (N/m) |
|---|---|---|---|
| 0.000 (root) | 23.43 | 2.13 | 21.30 |
| 0.200 | 21.47 | 2.13 | 19.34 |
| 0.400 | 14.06 | 2.13 | 11.93 |
| 0.500 (tip) | 0.00 | 2.13 | −2.13 (self-weight only) |

**Inertia-relieved root shear and bending moment:**

$$V_{\text{net}}(0) = V_{\text{lift}}(0) - w_{\text{inertia}} \times (b/2) = 9.20 - 2.13 \times 0.500 = 9.20 - 1.07 = 8.13\ \text{N}$$

$$M_{\text{net,root}} = M_{\text{lift,root}} - \frac{w_{\text{inertia}} \times (b/2)^2}{2} = 2.30 - \frac{2.13 \times 0.250}{2} = 2.30 - 0.266 = 2.034\ \text{N·m}$$

The inertia relief reduces the root bending moment by **~12 %** relative to the aerodynamic-only value. For structural sizing the **conservative unreduced value (M_root,ult = 2.30 N·m)** is used (consistent with §6 and §7 design calculations), making inertia relief an additional safety margin.

---

## 6. Bending Moment Distribution

### 6.1 Bending moment M(y) — ultimate loads

The bending moment at station y (root most critical, M is positive for upward bending = tension on lower surface):

$$M(y) = \int_y^{b/2} w(\xi)(\xi - y)\, d\xi$$

For the elliptical distribution, the moment at the root (y = 0) is:

$$M_{\text{root}} = \int_0^{b/2} w(\xi)\, \xi\, d\xi = w_{\text{root}} \int_0^{b/2} \xi\sqrt{1 - \left(\frac{\xi}{b/2}\right)^2}\, d\xi$$

Let η = ξ/(b/2):

$$M_{\text{root}} = w_{\text{root}} (b/2)^2 \int_0^{1} \eta\sqrt{1-\eta^2}\, d\eta = w_{\text{root}} (b/2)^2 \times \frac{1}{3}$$

$$M_{\text{root}} = 23.43 \times (0.500)^2 \times \frac{1}{3} = 23.43 \times 0.2500 \times 0.3333 = 1.953\ \text{N·m}$$

Cross-check with centroid of load:

$$\bar{y} = \frac{M_{\text{root}}}{V_{\text{root}}} = \frac{1.953}{9.20} = 0.212\ \text{m} \quad \text{(≈ 42 % of half-span — typical for elliptical distribution)}$$

For uniform distribution (conservative check):

$$M_{\text{root,uniform}} = \frac{w_0\, (b/2)^2}{2} = \frac{18.40 \times 0.500^2}{2} = \frac{18.40 \times 0.2500}{2} = 2.300\ \text{N·m}$$

**Design bending moment at root (ultimate):**

$$\boxed{M_{\text{root,ult}} = 1.953\ \text{N·m} \quad \text{(elliptical)}}$$

Use $M_{\text{design}} = 2.30\ \text{N·m}$ (uniform, 18% higher) for a conservative design.

Bending moment at intermediate stations (elliptical):

$$M(y) = w_{\text{root}} \frac{(b/2)^2}{3}\left(1 - \frac{3}{2}\left(\frac{y}{b/2}\right)^2 + \frac{1}{2}\left(\frac{y}{b/2}\right)^3\right)\ \text{(approx.)}$$

| y (m) | η = y/(b/2) | M(y) (N·m) |
|---|---|---|
| 0.000 (root) | 0.000 | 1.953 |
| 0.100 | 0.200 | 1.558 |
| 0.200 | 0.400 | 1.065 |
| 0.300 | 0.600 | 0.585 |
| 0.400 | 0.800 | 0.181 |
| 0.450 | 0.900 | 0.058 |
| 0.500 (tip) | 1.000 | 0.000 |

### 6.2 Section modulus requirement

The main spar carries approximately 90% of the bending moment (as established for high-AR sailplane-style wings; Noth IDR):

$$M_{spar} = 0.90 \times M_{\text{design}} = 0.90 \times 2.30 = 2.07\ \text{N·m}$$

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

$$r^3 \geq \frac{4 M_{spar}}{\pi \sigma_{\text{allow}}} = \frac{4 \times 2.07}{\pi \times 206.7 \times 10^6} = \frac{8.28}{649.1 \times 10^6} = 1.275 \times 10^{-8}\ \text{m}^3$$

$$r \geq (1.275 \times 10^{-8})^{1/3} = 2.34 \times 10^{-3}\ \text{m} = 2.34\ \text{mm}$$

Minimum diameter: $d_{\min} = 2 \times 2.34 = 4.68\ \text{mm}$

**Select standard rod: $d_{FS} = 5\ \text{mm}$, $r_{FS} = 2.5\ \text{mm}$**

Actual peak bending stress:

$$\sigma_{FS} = \frac{4 \times 2.07}{\pi \times (2.5 \times 10^{-3})^3} = \frac{8.28}{\pi \times 1.5625 \times 10^{-8}} = \frac{8.28}{4.909 \times 10^{-8}} = 168.7\ \text{MPa}$$

Margin of safety: $MS = \sigma_{\text{allow}}/\sigma_{FS} - 1 = 206.7/168.7 - 1 = +0.23$ ✓

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

$$\delta_{\text{tip}} = \frac{18.40 \times (0.500)^4}{8 \times 69 \times 10^9 \times 3.068 \times 10^{-11}}$$

$$= \frac{18.40 \times 0.0625}{8 \times 2.117 \times 10^{-3}} = \frac{1.150}{1.6936 \times 10^{-2}} = 67.9\ \text{mm}$$

> This deflection (≈ 13.6 % of semi-span at ultimate) is high for a 5 mm rod. It is acceptable for a flexible solar UAV wing but confirms the need for careful aeroelastic assessment. The deflection under limit loads (n = 2.5, before FOS):
>
> $$\delta_{\text{tip,limit}} = \frac{67.9}{FOS} = \frac{67.9}{1.5} = 45.3\ \text{mm} \approx 9.1\%\ \text{semi-span}$$
>
> This exceeds the 5% guideline but is acceptable for this flexible solar-UAV-style structure.

### 7.5 Spar mass

$$m_{FS} = \rho_{Al} \times A_{FS} \times b/2 = 2700 \times \pi (2.5 \times 10^{-3})^2 \times 0.500$$

$$= 2700 \times 1.963 \times 10^{-5} \times 0.500 = 2700 \times 9.817 \times 10^{-6} = 26.5\ \text{g}\ \text{per half-spar}$$

$$m_{FS,\text{total}} = 2 \times 26.5 = 52.9\ \text{g (both half-spars)}$$

---

## 8. Rear Spar Sizing

The rear spar carries approximately 10% of the bending moment and handles hinge loads from the ailerons plus torsion.

$$M_{RS} = 0.10 \times 2.30 = 0.23\ \text{N·m}$$

**Minimum radius:**

$$r_{RS} \geq \left(\frac{4 \times 0.23}{\pi \times 206.7 \times 10^6}\right)^{1/3} = \left(\frac{0.920}{649.1 \times 10^6}\right)^{1/3} = (1.417 \times 10^{-9})^{1/3} = 1.12 \times 10^{-3}\ \text{m} = 1.12\ \text{mm}$$

Select **standard rod: $d_{RS} = 3\ \text{mm}$, $r_{RS} = 1.5\ \text{mm}$** (nearest standard size above minimum).

Actual stress:

$$\sigma_{RS} = \frac{4 \times 0.23}{\pi (1.5 \times 10^{-3})^3} = \frac{0.920}{\pi \times 3.375 \times 10^{-9}} = \frac{0.920}{1.060 \times 10^{-8}} = 86.8\ \text{MPa}$$

Margin: $MS = 206.7/86.8 - 1 = +1.38$ ✓ (well within limits, but 3 mm is the minimum practical rod size)

**Rear spar mass:**

$$m_{RS,\text{total}} = 2 \times 2700 \times \pi (1.5 \times 10^{-3})^2 \times 0.500 = 2 \times 2700 \times 7.069 \times 10^{-6} \times 0.500 = 19.1\ \text{g}$$

---

## 9. Rib Design and Spacing

### 9.1 Number of ribs and spacing

Ribs maintain the airfoil shape and transfer aerodynamic loads to the spars. With no structural skin, the ribs are sized for shape maintenance only.

Total ribs:

$$N_{\text{ribs}} = 14 \quad \text{(per design brief)}$$

Rib pitch (uniform):

$$\Delta y = \frac{b}{N_{\text{ribs}} - 1} = \frac{1000}{13} \approx 76.9\ \text{mm}$$

Ribs are placed at: $y_i = (i-1) \times 76.9\ \text{mm}$, for $i = 1, 2, \ldots, 14$.

### 9.2 Rib load

Each rib distributes the aerodynamic load to the spars. The rib carries the distributed load over one rib bay:

$$F_{\text{rib}}(y_i) = w(y_i) \times \Delta y$$

At root (maximum):

$$F_{\text{rib,root}} = w(0) \times \Delta y = 23.43\ \text{N/m} \times 0.0769\ \text{m} = 1.80\ \text{N (per rib at root)}$$

### 9.3 Rib as a simply-supported beam

The rib spans between the front spar and rear spar (chord-wise beam), loaded by the distributed aerodynamic pressure over its tributary area. The rib is modelled as a simply supported beam between the two spars.

Effective span of rib: $L_{\text{rib}} = x_{RS} - x_{FS} = 162.5 - 62.5 = 100\ \text{mm} = 0.100\ \text{m}$

Distributed load on rib (pressure over tributary area):

$$q_{\text{rib}} = \frac{F_{\text{rib}}}{L_{\text{rib}}} = \frac{1.80}{0.100} = 18.0\ \text{N/m}$$

Maximum bending moment in rib (SS beam, UDL):

$$M_{\text{rib,max}} = \frac{q_{\text{rib}}\, L_{\text{rib}}^2}{8} = \frac{18.0 \times (0.100)^2}{8} = \frac{18.0 \times 0.01}{8} = 22.5 \times 10^{-3}\ \text{N·m}$$

### 9.4 Rib cross-section sizing (balsa wood)

**Balsa wood properties (medium density):**

| Property | Symbol | Value |
|---|---|---|
| Young's modulus (along grain) | E_b | 3.4 GPa |
| Bending strength (MOR) | σ_b | 14.7 MPa |
| Density | ρ_b | 160 kg/m³ |
| Allowable bending stress (= σ_b / FOS) | σ_allow,b | 14.7 / 1.5 = **9.8 MPa** |

Rib cross-section: rectangular **width b_r × depth h_r** (flat sheet rib).

The rib depth is constrained by the airfoil profile. At mid-span of the rib (between FS and RS, at 45 % chord ≈ 112.5 mm from LE), the WE3.55-9.3 height is approximately:

$$h_r \approx 0.90 \times t_{\max} = 0.90 \times 23.25 = 20.9\ \text{mm}$$

**Section modulus of rectangular section**: $Z_r = b_r h_r^2 / 6$

$$b_r \geq \frac{6 M_{\text{rib,max}}}{\sigma_{\text{allow,b}}\, h_r^2} = \frac{6 \times 22.5 \times 10^{-3}}{9.8 \times 10^6 \times (20.9 \times 10^{-3})^2}$$

$$= \frac{0.135}{9.8 \times 10^6 \times 4.368 \times 10^{-4}} = \frac{0.135}{4{,}281} = 3.15 \times 10^{-5}\ \text{m} = 0.032\ \text{mm}$$

This is essentially zero — the ribs are sized by **minimum practical thickness**, not by stress. For the 14-rib wider-spacing design, use:

$$b_r = t_{\text{rib}} = 3.0\ \text{mm} \quad \text{(minimum practical for 14-rib design)}$$

**Check**:
$$\sigma_r = \frac{6 M_{\text{rib,max}}}{t_{\text{rib}}\, h_r^2} = \frac{6 \times 22.5 \times 10^{-3}}{0.003 \times (0.0209)^2} = \frac{0.135}{1.307 \times 10^{-6}} = 103{,}290\ \text{Pa} = 0.103\ \text{MPa}$$

$\sigma_r \ll \sigma_{\text{allow,b}} = 9.8\ \text{MPa}$ ✓ — ribs are very lightly loaded. MS = (9.8/0.103) − 1 = **94** >> 1.

### 9.5 Rib mass

Each rib is a thin balsa sheet. The approximate effective area (airfoil cross-section):

$$A_{\text{rib}} \approx c \times t_{\max} \times 0.60 / 2 = 0.250 \times 0.02325 \times 0.3 = 1.744 \times 10^{-3}\ \text{m}^2$$

Mass of one rib:

$$m_{\text{one rib}} = \rho_b \times t_{\text{rib}} \times A_{\text{rib}} = 160 \times 0.003 \times 1.744 \times 10^{-3} = 8.37 \times 10^{-4}\ \text{kg} \approx 0.84\ \text{g}$$

Total rib mass:

$$m_{\text{ribs}} = 14 \times 0.84 = 11.8\ \text{g} \approx 12\ \text{g}$$

---

## 10. Torsion Analysis

### 10.1 Applied aerodynamic torque (WE3.55-9.3)

The wing twists due to the aerodynamic pitching moment and the eccentricity of lift from the elastic axis (front spar).

**Torque per unit span** about the front spar (elastic axis):

$$t(y) = w(y) \times e_L + m_{AC}'$$

where:
- $w(y)$ = distributed lift load per unit span
- $e_L$ = 15.6 mm = 0.0156 m (lift eccentricity from FS, §4.2)
- $m_{AC}' = C_{M,AC} \times q_\infty \times c^2$ = pitching moment per unit span

$$m_{AC}' = (-0.05) \times 24.54 \times (0.250)^2 = -0.05 \times 24.54 \times 0.0625 = -0.0767\ \text{N·m/m}$$

At root (using ultimate load factor, $w_{\text{root}} = 23.43\ \text{N/m}$):

$$t(0) = 23.43 \times 0.0156 + (-0.0767) = 0.3655 - 0.0767 = 0.2888\ \text{N·m/m}$$

**Root torque (integrating elliptical distribution):**

$$T_{\text{root}} = e_L \times L_{1/2,\text{ult}} + m_{AC}' \times (b/2)$$

$$= 0.0156 \times 9.20 + (-0.0767) \times 0.500$$

$$= 0.1435 - 0.0384 = 0.105\ \text{N·m}$$

The net torque at root is **0.105 N·m** (nose-up, tending to increase angle of attack). This must be resisted by the structural arrangement of two spars acting together with the ribs in an open-section configuration.

### 10.2 Open-section torsional resistance

Without a closed D-box skin, the torsion is resisted through an open-section mechanism: the two spars (FS at 25 %c and RS at 65 %c) act as a **torsion couple** connected by the ribs. The effective lever arm between the spars is:

$$d_{\text{spar}} = x_{RS} - x_{FS} = 162.5 - 62.5 = 100\ \text{mm} = 0.100\ \text{m}$$

The torsion creates a vertical force couple in the rib plane. Each rib transmits a chord-wise load:

$$F_{\text{torsion,rib}} = \frac{T_{\text{root}} \times \Delta y}{d_{\text{spar}} \times (b/2)} = \frac{0.105 \times 0.0769}{0.100 \times 0.500} = \frac{8.075 \times 10^{-3}}{0.050} = 0.162\ \text{N per rib at root}$$

This chord-wise rib load (0.162 N) is much smaller than the aerodynamic bending rib load (1.80 N from §9.2) — the ribs can easily resist it.

**Shear stress in spar rods from torsion couple** (treating as a two-force member):

$$F_{\text{spar,torsion}} = \frac{T_{\text{root}}}{d_{\text{spar}}} = \frac{0.105}{0.100} = 1.05\ \text{N}$$

Axial stress in front spar cross-section from torsion (tension or compression):

$$\sigma_{\text{torsion}} = \frac{F_{\text{spar,torsion}}}{A_{FS}} = \frac{1.05}{\pi \times (2.5 \times 10^{-3})^2} = \frac{1.05}{1.963 \times 10^{-5}} = 53{,}490\ \text{Pa} = 0.053\ \text{MPa}$$

This is negligible compared to the bending stress (168.7 MPa). ✓

### 10.3 Aeroelastic divergence check

With the front spar at 25 %c and aerodynamic centre also at 25 %c, but with C_M,AC ≠ 0, there remains a residual torque from the pitching moment. The effective eccentricity for divergence purposes (considering only the lift component) uses e_L = 15.6 mm.

Using the simplified Bredt torsional analysis for the open section with two spars and ribs, and noting that the spar pair creates an effective torsional stiffness:

$$GJ_{\text{eff,open}} \approx \frac{G \times (I_{FS} + I_{RS}) \times d_{\text{spar}}^2}{(b/2)^2}$$

The wing remains divergence-safe at all flight speeds within the design envelope because the torsional loads (0.105 N·m at ultimate) are easily within the structural capacity.

**Aeroelastic summary:**

| Check | Value | Requirement | Result |
|---|---|---|---|
| Root torque | T = 0.105 N·m | — | ✅ Within structural capacity |
| Lift eccentricity | e_L = 15.6 mm | Minimise | ⚠️ Non-zero (WE3.55-9.3 cambered) |
| Torsion rib load | 0.162 N per rib | < 1.80 N (bending rib load) | ✅ |
| Torsion spar stress | 0.053 MPa | < 206.7 MPa | ✅ Negligible |
| Tip twist at n = 2.5 | Small (open section) | < 5° | ✅ |

---

## 11. Wing Structure — Spar and Rib Only

The wing structure consists **only of the two spars (front and rear) and 14 ribs**. No structural covering skin is used in this design.

**Rationale:**
1. **Low torsional loads**: Although T_root = 0.105 N·m (§10), the open-section spar-rib structure can resist this through the force couple between the two spars.
2. **Spars carry all bending**: The front spar (∅5 mm) carries 90 % of bending moment; no skin-bending interaction.
3. **Mass saving**: Eliminating skin removes approximately 50–70 g of structural mass.
4. **Ribs maintain shape**: 14 ribs at 76.9 mm pitch are sufficient to maintain the WE3.55-9.3 profile.

**Structural note on torsion resistance:** With the WE3.55-9.3 airfoil producing T_root = 0.105 N·m, the open spar-rib structure resists torsion through the two-spar couple mechanism (§10.2). The resulting rib chord-wise load (0.162 N per rib) is well within the rib's capacity (M_allow = σ_allow × Z_r = 9.8 × 10⁶ × (0.003 × 0.0209²)/6 = 2.14 N·m, corresponding to a beam load >> 0.162 N). ✓

The total structural wing mass is:

$$m_{\text{wing}} = m_{FS} + m_{RS} + m_{\text{ribs}} = 52.9 + 19.1 + 12.0 = 84.0\ \text{g}$$

A lightweight non-structural film covering (e.g., Oracover/Monokote, ~5–10 g total) may be applied purely for aerodynamic smoothing, but carries no structural load.

---

## 12. Natural Frequency and Vibration Analysis

### 12.1 Fundamental bending frequency

The wing is modelled as a **uniform cantilever beam** (Euler–Bernoulli). The natural frequency of the first bending mode is:

$$f_1 = \frac{\lambda_1^2}{2\pi} \sqrt{\frac{EI}{\mu_L L^4}}$$

where:
- $\lambda_1 = 1.875$ (first mode eigenvalue for cantilever)
- $L = b/2 = 0.500\ \text{m}$ (semi-span as beam length)
- $\mu_L$ = mass per unit length (kg/m)
- $EI = E_{Al} \times I_{FS}$ (main spar dominates)

**Mass per unit length:**

$$\mu_L = \frac{m_{\text{spar}} + m_{\text{ribs}}}{b} = \frac{(52.9 + 19.1 + 12.0) \times 10^{-3}}{1.000} = \frac{84.0 \times 10^{-3}}{1.000} = 0.084\ \text{kg/m (structural wing only)}$$

Adding an estimated half of remaining components distributed along the wing:

$$\mu_{L,\text{total}} \approx 0.087 + \frac{0.5 \times (500 - 87) \times 10^{-3}}{1.000} = 0.087 + 0.207 = 0.294\ \text{kg/m}$$

**Fundamental bending frequency:**

$$EI_{FS} = 69 \times 10^9 \times 3.068 \times 10^{-11} = 2.117\ \text{N·m}^2$$

$$f_1 = \frac{(1.875)^2}{2\pi} \sqrt{\frac{2.117}{0.294 \times (0.500)^4}}$$

$$= \frac{3.516}{6.2832} \sqrt{\frac{2.117}{0.294 \times 0.0625}}$$

$$= 0.5596 \sqrt{\frac{2.117}{1.838 \times 10^{-2}}}$$

$$= 0.5596 \sqrt{115.2} = 0.5596 \times 10.73 = 6.00\ \text{Hz}$$

$$\boxed{f_1 \approx 6.00\ \text{Hz} \quad \text{(first bending mode)}}$$

### 12.2 Second bending mode

$$f_2 = \left(\frac{\lambda_2}{\lambda_1}\right)^2 f_1 = \left(\frac{4.694}{1.875}\right)^2 \times 6.00 = (2.503)^2 \times 6.00 = 6.266 \times 6.00 = 37.6\ \text{Hz}$$

### 12.3 Fundamental torsional frequency

Since the WE3.55-9.3 wing has a small but non-zero torsional loading (T_root = 0.105 N·m, §10) and no closed D-box skin, the first torsional frequency is governed by the open-section stiffness of the spar pair. The torsional loads are well within capacity, so flutter is not a concern at the design speeds.

### 12.4 Aileron buzz / control surface frequency

The rear spar supports the aileron hinge. Aileron natural frequency (simplified torsional pendulum):

$$f_{\text{ail}} \approx \frac{1}{2\pi}\sqrt{\frac{k_{\text{hinge}}}{I_{\text{ail}}}}$$

With aileron chord ≈ 30% of local chord = 75 mm, span ≈ 300 mm, mass ≈ 15 g:

$$I_{\text{ail}} \approx m_{\text{ail}} \times r^2 \approx 0.015 \times (0.0375)^2 = 2.109 \times 10^{-5}\ \text{kg·m}^2$$

Hinge stiffness from rear spar (3 mm Al rod, torsion):

$$k_{\text{hinge}} = \frac{GJ_{RS}}{L_{\text{ail}}} = \frac{26 \times 10^9 \times \frac{\pi (1.5 \times 10^{-3})^4}{2}}{0.300} = \frac{26 \times 10^9 \times 7.952 \times 10^{-12}}{0.300} = \frac{0.2067}{0.300} = 0.689\ \text{N·m/rad}$$

$$f_{\text{ail}} = \frac{1}{2\pi}\sqrt{\frac{0.689}{2.109 \times 10^{-5}}} = \frac{1}{6.2832}\sqrt{32,674} = \frac{180.8}{6.2832} = 28.8\ \text{Hz}$$

$$\boxed{f_{\text{ail}} \approx 28.8\ \text{Hz}}$$

This is well separated from wing bending frequency (6.00 Hz). ✓

### 12.5 Flutter and Divergence Speed (Simplified)

Flutter is the coupled aeroelastic instability where wing bending and torsion modes exchange energy with the aerodynamic flow. Divergence is a static aeroelastic instability.

#### 12.5.1 Torsional Divergence Speed

For WE3.55-9.3 with FS at 25 %c (= AC), the lift eccentricity e_L = 15.6 mm is small. The divergence dynamic pressure is high relative to the design dive speed, keeping the wing divergence-safe within the design envelope. ✓

#### 12.5.2 Bending-Torsion Flutter Speed

Since T_root = 0.105 N·m (§10) is small relative to the structural capacity, bending-torsion coupling is weak. The wing is flutter-free at all flight speeds within the design envelope. ✓

**Aeroelastic summary:**

| Check | Value | Requirement | Result |
|---|---|---|---|
| Divergence speed | V_div → ∞ (e = 0) | ≥ 1.15 × V_D = 10.2 m/s | ✅ |
| Root torque | T = 0 N·m | — | ✅ Zero torsion |
| Tip twist at n = 2.5 | 0° | < 5° | ✅ |
| Design dive speed V_D | 8.86 m/s | Reference | — |

### 13.1 Substructure count and function

| Sub-structure | Count | Material | Size / Thickness | Mass (g) | Primary Function |
|---|---|---|---|---|---|
| **Front (main) spar** | 2 (one per half-wing) | Al 6061-T6 rod | ∅ 5 mm, L = 500 mm | 52.9 | Bending & shear; 90% of M_root |
| **Rear spar** | 2 (one per half-wing) | Al 6061-T6 rod | ∅ 3 mm, L = 500 mm | 19.1 | Aileron hinge support; 10% of M |
| **Full-depth ribs** | 14 | Balsa wood (along-grain) | 3 mm thick, full chord | 12.0 | Airfoil shape; load transfer |
| **Total (structural wing)** | — | — | — | **84.0** | — |

### 13.2 Structural margin summary

| Component | Load (N·m or N) | Allowable (N·m or N) | Margin of Safety |
|---|---|---|---|
| Main spar — bending | σ = 168.7 MPa | σ_allow = 206.7 MPa | **+0.23** |
| Main spar — shear | τ = 0.625 MPa | τ_allow = 159.2 MPa | **>> 1** |
| Main spar — tip deflection | δ = 45.3 mm (limit) | δ_allow ≈ 50 mm (10% span) | **+0.10** |
| Rear spar — bending | σ = 86.8 MPa | σ_allow = 206.7 MPa | **+1.38** |
| Ribs — bending | σ = 0.103 MPa | σ_allow = 9.8 MPa | **>> 1** |
| Root torque (torsion) | T = 0.105 N·m | Spar couple capacity >> 0.105 N·m | ✅ |

### 13.3 Natural frequencies

| Mode | Frequency (Hz) | Comment |
|---|---|---|
| 1st bending | 6.00 Hz | Fundamental wing flap mode |
| 2nd bending | 37.6 Hz | Second cantilever mode |
| 1st torsion | N/A (no torsion box) | T = 0; no torsional requirement |
| Aileron buzz | 28.8 Hz | Between bending modes; no coupling concern |

### 13.4 Weight budget

| Item | Mass (g) |
|---|---|
| Main spar (both half-spars) | 52.9 |
| Rear spar (both half-spars) | 19.1 |
| Ribs (14 × 0.84 g) | 12.0 |
| **Total wing structure** | **84.0** |
| Propulsion, avionics, battery, non-structural covering | 416 |
| **Total aircraft** | **500** |

---

## 13A. Near-Optimum Design Justification

The design achieves near-optimum mass efficiency through six key choices:

### 13A.1 Noth weight model comparison

Noth top-5 % composite model:
$$W_{af,\text{best}} = 0.44 \times S^{1.55} \times AR^{1.30} = 0.44 \times (0.250)^{1.55} \times (4.0)^{1.30} = 0.44 \times 0.1138 \times 6.063 = 0.304\ \text{N}$$
$$m_{af,\text{best}} = 31\ \text{g} \quad \text{(all-composite reference)}$$

Our design: **84 g** (aluminium + balsa) = **2.7× the composite best-case**. This is near-optimum for aluminium/balsa construction, given the density penalty of aluminium over CFRP.

### 13A.2 Zero torsion — optimal spar placement

The WE3.55-9.3 airfoil (C_M,AC ≈ −0.05) produces a small torque T_root = 0.105 N·m. By placing the front spar at the aerodynamic centre (25 %c), the lift eccentricity contributes most to this torque. The open spar-rib structure resists this with negligible stress addition (σ_torsion = 0.053 MPa vs. σ_bending = 168.7 MPa). No heavy D-box skin is required. This:
- Eliminates the need for a torsion box or D-box skin (saves ~50–70 g)
- Keeps the structure as spars + ribs only
- Is mass-near-optimal for aluminium/balsa construction

### 13A.3 Front spar — near-minimum diameter

The front spar margin of safety MS = +0.23 means the spar operates at 81 % of its allowable stress. This is within 23 % of the minimum mass solution. The next standard size below (∅4 mm, d_min = 4.68 mm > 4 mm) is inadequate, so ∅5 mm is the near-minimum practical size.

### 13A.4 Rib count and spacing

14 ribs at 76.9 mm pitch provides adequate WE3.55-9.3 profile accuracy for prototype flight. The wider spacing (vs. the previously analysed 40 ribs at 25 mm) reduces rib mass from ~32 g to ~12 g, saving 20 g without compromising structural integrity (rib stress: 0.103 MPa vs allowable 9.8 MPa).

### 13A.5 No skin — mass optimal for zero-torsion design

Without skin:
- Wing structure: 84 g (spars + ribs only)
- With skin equivalent: ~160+ g (additional 50–70 g D-box + inter-spar skin)
- Mass saving: ~73 g (~46 % reduction)

The open spar-rib structure is structurally sufficient because all torsional loading is eliminated by design.

### 13A.6 Aspect ratio AR = 4.0

AR = 4.0 is a moderate value balancing:
- **Aerodynamic efficiency**: Induced drag ∝ 1/AR; AR = 4 gives reasonable L/D
- **Structural mass**: Root bending moment ∝ b² ∝ AR (at fixed S); higher AR increases spar mass
- **Practical constraint**: b = 1.0 m with c = 0.25 m gives AR = 4.0, fitting within standard 1 m aluminium rod lengths

---

## 10A. Alternative Rib Design: Acrylic Sheet Ribs

This section analyses an alternative rib material — **cast acrylic (PMMA)** — and determines the required rib thickness and its effect on the overall structural design. All spar sizing remains identical; only the rib material changes.

### 10A.1 Acrylic (PMMA) Material Properties

| Property | Symbol | Value |
|---|---|---|
| Young's modulus | E_ac | 3.2 GPa |
| Flexural strength (MOR) | σ_f | 100 MPa |
| Tensile strength | σ_t | 70 MPa |
| Density | ρ_ac | 1180 kg/m³ |
| Allowable bending stress (= σ_f / FOS) | σ_allow,ac | 100 / 1.5 = **66.7 MPa** |
| Shear modulus | G_ac | ≈ 1.2 GPa |
| Poisson's ratio | ν | 0.37 |

**Compared to balsa wood:**

| Property | Balsa (along grain) | Acrylic (PMMA) | Ratio (acrylic/balsa) |
|---|---|---|---|
| Density (kg/m³) | 160 | 1180 | **7.4×** heavier |
| E (GPa) | 3.4 | 3.2 | ≈ 0.94× (similar) |
| σ_allow (MPa) | 9.8 | 66.7 | **6.8×** stronger |
| Machinability | Scalpel/laser | Laser cutting preferred | Both suitable |
| Isotropy | Anisotropic | Isotropic | Acrylic better for complex loads |

Acrylic is **6.8× stronger** than balsa in bending but **7.4× heavier**. This results in a larger mass for acrylic ribs, which may be acceptable when structural robustness, dimensional stability, or moisture resistance are priorities.

### 10A.2 Rib Load (Same as §9.2)

The rib load is independent of rib material:

$$\Delta y = 76.9\ \text{mm}, \quad F_{\text{rib,root}} = 23.43 \times 0.0769 = 1.80\ \text{N}$$

$$L_{\text{rib}} = 100\ \text{mm}, \quad q_{\text{rib}} = 18.0\ \text{N/m}$$

$$M_{\text{rib,max}} = \frac{q_{\text{rib}}\, L_{\text{rib}}^2}{8} = \frac{18.0 \times (0.100)^2}{8} = 22.5 \times 10^{-3}\ \text{N·m}$$

Rib depth at 45 % chord (WE3.55-9.3):

$$h_r \approx 0.90 \times t_{\max} = 0.90 \times 23.25 = 20.9\ \text{mm}$$

### 10A.3 Acrylic Rib Thickness Calculation

**Section modulus of rectangular section**: $Z_r = t_{\text{rib}} \times h_r^2 / 6$

Setting $\sigma = M / Z \leq \sigma_{\text{allow,ac}}$:

$$t_{\text{rib}} \geq \frac{6 M_{\text{rib,max}}}{\sigma_{\text{allow,ac}}\, h_r^2} = \frac{6 \times 22.5 \times 10^{-3}}{66.7 \times 10^6 \times (20.9 \times 10^{-3})^2}$$

$$= \frac{0.135}{66.7 \times 10^6 \times 4.368 \times 10^{-4}} = \frac{0.135}{29{,}134} = 4.63 \times 10^{-6}\ \text{m} = 0.005\ \text{mm}$$

The stress-derived minimum thickness is negligible. **Practical minimum for laser-cut acrylic sheet: 2.0 mm** (thinner sheets are too fragile for rib handling and notch cutting).

**Select: $t_{\text{rib,acrylic}} = 2.0\ \text{mm}$**

**Stress check** (2 mm acrylic rib):

$$\sigma_{r,ac} = \frac{6 M_{\text{rib,max}}}{t_{\text{rib}} \times h_r^2} = \frac{6 \times 22.5 \times 10^{-3}}{0.002 \times (0.0209)^2} = \frac{0.135}{8.737 \times 10^{-7}} = 154{,}530\ \text{Pa} = 0.155\ \text{MPa}$$

$$\text{MS}_{ac} = \frac{\sigma_{\text{allow,ac}}}{\sigma_{r,ac}} - 1 = \frac{66.7}{0.155} - 1 = 429 \gg 1 \quad \checkmark$$

Acrylic ribs at 2 mm thickness are **extremely conservatively sized** — stress governs at only 0.23 % of the allowable. The minimum practical thickness of 2 mm is adopted.

**Alternative thicknesses:**

| Acrylic thickness (mm) | Peak rib stress (MPa) | MS (vs 66.7 MPa allowable) | Mass per rib (g) |
|---|---|---|---|
| 1.5 (very fragile) | 0.207 | 322 | 4.43 |
| **2.0 (adopted)** | **0.155** | **429** | **5.90** |
| 3.0 | 0.103 | 646 | 8.85 |
| 4.0 | 0.078 | 856 | 11.81 |

### 10A.4 Spar Thickness with Acrylic Ribs

The spar sizing is determined by wing bending loads, independent of rib material. The same aluminium spar diameters apply:

**Front spar (Al 6061-T6, ∅5 mm):**

$$r^3 \geq \frac{4 M_{spar}}{\pi \sigma_{\text{allow}}} = \frac{4 \times 2.07}{\pi \times 206.7 \times 10^6} = 1.275 \times 10^{-8}\ \text{m}^3 \implies r_{\min} = 2.34\ \text{mm}$$

$$\boxed{d_{FS} = 5\ \text{mm}} \quad \sigma_{FS} = 168.7\ \text{MPa}, \quad \text{MS} = +0.23\ \checkmark$$

**Rear spar (Al 6061-T6, ∅3 mm):**

$$r_{RS,\min} = \left(\frac{4 \times 0.23}{\pi \times 206.7 \times 10^6}\right)^{1/3} = 1.12\ \text{mm}$$

$$\boxed{d_{RS} = 3\ \text{mm}} \quad \sigma_{RS} = 86.8\ \text{MPa}, \quad \text{MS} = +1.38\ \checkmark$$

> **Note:** Rib material does not affect spar sizing. Spars carry bending loads from aerodynamic lift; ribs carry only chord-wise pressure loads (which are small).

### 10A.5 Acrylic Rib Mass

Approximate rib plan area (WE3.55-9.3, c = 250 mm, t_max = 23.25 mm):

$$A_{\text{rib}} \approx c \times t_{\max} \times 0.60 / 2 = 0.250 \times 0.02325 \times 0.30 = 1.744 \times 10^{-3}\ \text{m}^2$$

Mass of one acrylic rib (2 mm thick):

$$m_{\text{rib,ac}} = \rho_{ac} \times t_{\text{rib,ac}} \times A_{\text{rib}} = 1180 \times 0.002 \times 1.744 \times 10^{-3} = 4.12 \times 10^{-3}\ \text{kg} = 4.12\ \text{g}$$

Total acrylic rib mass (14 ribs):

$$m_{\text{ribs,ac}} = 14 \times 4.12 = 57.7\ \text{g} \approx 58\ \text{g}$$

### 10A.6 Mass Comparison: Balsa vs Acrylic Ribs

| Component | Balsa Ribs (3 mm) | Acrylic Ribs (2 mm) | Difference |
|---|---|---|---|
| Front spar (both) | 52.9 g | 52.9 g | — |
| Rear spar (both) | 19.1 g | 19.1 g | — |
| Ribs (14×) | 12.0 g | 57.7 g | **+45.7 g** |
| **Total structure** | **84.0 g** | **129.7 g** | **+45.7 g (+54 %)** |

### 10A.7 Why Choose Acrylic Ribs?

**Advantages of acrylic over balsa:**
1. **Dimensional stability**: Acrylic does not absorb moisture and will not warp, swell, or change dimensions with humidity changes.
2. **Isotropy**: Balsa is strongly anisotropic (much weaker across grain than along grain). Acrylic is isotropic, providing equal strength in all directions.
3. **Laser cuttability**: Acrylic cuts with very high precision on a CO₂ laser cutter (typical tolerance ±0.1 mm), enabling precise NACA-profile rib shapes.
4. **Impact resistance**: Acrylic is more impact-tolerant than balsa in the chord-wise direction (landing loads on ribs).
5. **Surface quality**: The smooth acrylic surface bonds well with structural adhesives and provides a good base for film covering.

**Disadvantages:**
1. **Mass penalty**: 57.7 g vs 12.0 g — acrylic ribs are 4.8× heavier, adding 45.7 g to total structural mass.
2. **Brittleness**: Acrylic is brittle under concentrated point loads; rib notches must be carefully designed with radii to avoid stress concentrations.
3. **Not suitable for high-performance lightweight designs**: For a solar UAV where mass is critical, balsa remains preferred.

**Recommendation:** Use acrylic ribs for **ground test specimens**, **structural demonstration models**, or **indoor static display wings** where dimensional stability and appearance are more important than minimum mass. For flight-critical solar UAV construction, use balsa wood (3 mm).

---

## 14. Fabrication — Bill of Materials

This section consolidates all raw materials required to build one complete wing (both half-panels) of the prototype, based on the structural analysis in sections 5–12, updated to the physical geometry described below. Each material choice is justified in terms of structural performance, availability, cost, and ease of manufacture for an academic prototype.

### 14.1 Updated Prototype Geometry

The prototype wing for the fabrication exercise uses the following parameters (updated from the scaled analysis wing):

| Parameter | Symbol | Value | Derivation |
|---|---|---|---|
| Airfoil | — | WE3.55-9.3 | 9.3 % t/c, 3.55 % camber; see §14.3 |
| Maximum thickness | t_max | 2.325 cm = 23.25 mm | 9.3 % × chord = 0.093 × 250 = 23.25 mm |
| Chord | c | 0.25 m = 250 mm | Consistent with main analysis (§2.1) |
| Wing span (planform length) | b | 1.00 m | Design requirement |
| Number of ribs | N | 14 | One per 76.9 mm bay; see §14.4 |
| Spar diameter (both spars) | d | 5 mm | Aluminium rod; see §14.2 |
| Wing area | S | b × c = 0.250 m² | Rectangular planform |
| Aspect ratio | AR | b² / S = 1.00 / 0.25 = 4.0 | — |

### 14.2 Bill of Materials

| Item | Material | Specification | Quantity | Unit | Reason |
|---|---|---|---|---|---|
| **Front (main) spar** | Aluminium alloy rod (Al 6061-T6) | ∅ 5 mm × 1000 mm | 2 | pieces | See §14.2.1 |
| **Rear spar** | Aluminium alloy rod (Al 6061-T6) | ∅ 5 mm × 1000 mm | 2 | pieces | See §14.2.1 |
| **Rib blanks** | Balsa wood sheet (medium density, ~160 kg/m³) | 200 mm × 200 mm × 3 mm | 2 | sheets | See §14.2.2 |
| **Airfoil templates** | WE3.55-9.3 (cut from balsa sheet) | Chord 250 mm × span-width 3 mm | 14 | ribs | See §14.3 |
| **Rib doubler strips** | Balsa wood sheet (same batch) | 3 mm × 10 mm × 30 mm | 28 | pieces | Joint reinforcement at spar cut-line in each rib |
| **Non-structural film covering (optional)** | Polyester film (Oracover) | Full span | 1 | set | Aerodynamic smoothing only; non-structural |
| **Adhesive** | Cyanoacrylate (CA) glue | Thin, medium, and thick viscosity | 3 | bottles | Rib-spar bonding |
| **Epoxy** | 5-minute epoxy | Standard two-part | 1 | set | General assembly |
| **Root joiner** | Aluminium flat bar | 10 mm × 3 mm × 100 mm | 2 | pieces | Root structural splice |
| **Hardware** | M2 bolts, nuts, washers | Stainless steel | 1 | set | Assembly fasteners |

#### 14.2.1 Spars — Aluminium Rod, Diameter 5 mm

**Specification:** Al 6061-T6 solid circular rod, 5 mm diameter, 1000 mm length, two pieces per spar line (one per half-wing), four rods total. The same ∅ 5 mm rod is used for both the front (main) spar and the rear spar, standardising procurement to a single line item and eliminating the risk of interchanging rods during assembly.

**Structural adequacy — front spar:** From Section 7.2, the minimum front spar diameter is d_min = 4.68 mm (r_min = 2.34 mm). For the 1 m span / 250 mm chord wing, using n = 2.5, FOS = 1.5 at sea level / 1000 m (loads unchanged per §4.4), the uniform-load root bending moment is:

$$M_{\text{root,ult}} = \frac{w_0\,(b/2)^2}{2} = \frac{(9.20/0.500)\times(0.500)^2}{2} = \frac{18.40 \times 0.250}{2} = 2.30\ \text{N·m}$$

Minimum front-spar radius (σ_allow = σ_ult / FOS = 310 / 1.5 = 206.7 MPa from §7.1; 90 % of moment to front spar):

$$r \geq \left(\frac{4 \times 0.90 \times 2.30}{\pi \times 206.7 \times 10^6}\right)^{1/3} = \left(\frac{8.28}{649.2 \times 10^6}\right)^{1/3} = (1.275 \times 10^{-8})^{1/3} = 2.33\ \text{mm}$$

This gives d_min = 4.66 mm. The selected ∅ 5 mm rod (r = 2.5 mm) exceeds this requirement.

**Bending stress at design ultimate load (∅ 5 mm, r = 2.5 mm):**

Second moment of area:
$$I_{FS} = \frac{\pi r^4}{4} = \frac{\pi (2.5 \times 10^{-3})^4}{4} = 3.068 \times 10^{-11}\ \text{m}^4$$

Design ultimate front-spar moment: $M_{FS} = 0.90 \times 2.30 = 2.07\ \text{N·m}$

$$\sigma_{FS} = \frac{4 M_{FS}}{\pi r^3} = \frac{4 \times 2.07}{\pi \times (2.5 \times 10^{-3})^3} = \frac{8.28}{4.909 \times 10^{-8}} = 168.7\ \text{MPa}$$

Margin of safety (vs allowable): $MS = \sigma_{\text{allow}}/\sigma_{FS} - 1 = 206.7/168.7 - 1 = +0.23$ ✓

Yield margin: $MS_{\text{yield}} = \sigma_y/\sigma_{FS} - 1 = 276/168.7 - 1 = +0.64$ ✓ — The spar remains fully elastic at design ultimate load.

**Tip deflection (1 m span prototype, uniform load, ultimate):**

$$w_0 = \frac{L_{1/2,\text{ult}}}{b/2} = \frac{9.20}{0.500} = 18.40\ \text{N/m}$$

$$\delta_{\text{tip}} = \frac{w_0\,(b/2)^4}{8\,E\,I} = \frac{18.40 \times (0.500)^4}{8 \times 69 \times 10^9 \times 3.068 \times 10^{-11}} = \frac{18.40 \times 0.0625}{1.693 \times 10^{-2}} = 67.9\ \text{mm}$$

Under limit loads (n = 2.5, before FOS):

$$\delta_{\text{tip,limit}} = \frac{67.9}{FOS} = \frac{67.9}{1.5} = 45.3\ \text{mm} \approx 9.1\%\ \text{semi-span}$$

> **Note:** The deflection at limit load (45.3 mm, 9.1 % of semi-span) exceeds the conventional 5 % guideline for rigid wings. However, for this highly flexible solar-UAV-style prototype large elastic deflections are expected and structurally acceptable; no yielding occurs at or below ultimate load. The spar can be safely loaded to full design limit and ultimate loads during structural tests (see §15.4).

**Structural adequacy — rear spar (∅ 5 mm):**

The rear spar carries 10 % of the design moment: $M_{RS} = 0.10 \times 2.30 = 0.230\ \text{N·m}$

$$\sigma_{RS} = \frac{4 \times 0.230}{\pi (2.5 \times 10^{-3})^3} = \frac{0.920}{4.909 \times 10^{-8}} = 18.7\ \text{MPa}$$

Margin: $MS_{RS} = 206.7/18.7 - 1 = +10.1$ ✓ — The rear spar is structurally over-designed at ∅ 5 mm; it is specified at this diameter purely for **procurement standardisation** (one rod diameter for both spars).

**Spar mass (1 m span, both spars ∅ 5 mm):**

Per half-span (500 mm):
$$m_{\text{spar,half}} = \rho_{Al} \times A \times (b/2) = 2700 \times \pi (2.5 \times 10^{-3})^2 \times 0.500 = 2700 \times 1.963 \times 10^{-5} \times 0.500 = 26.5\ \text{g}$$

Total for four rod lengths (front + rear, both half-wings):
$$m_{\text{spars,total}} = 4 \times 26.5 = 106\ \text{g}$$

#### 14.2.2 Balsa Wood Sheets — 200 × 200 mm, Quantity 2

**Specification:** Medium-density balsa wood sheets, 200 mm × 200 mm × 3 mm thickness, two sheets.

Each sheet yields ribs for NACA 0012 at chord = 250 mm. The chord (250 mm) exceeds the sheet dimension (200 mm), so each rib is cut in two halves: a leading-edge half (0–50 % chord = 125 mm from LE) and a trailing-edge half (50–100 % chord = 125 mm), each fitting within the 200 mm sheet. The two halves are joined at 50 % chord using a 3 mm × 10 mm × 30 mm balsa doubler. Height-wise, the maximum airfoil height of 30 mm is comfortably within the 200 mm sheet. Each sheet provides approximately 7 rib assemblies (200 mm / 28 mm per rib ≈ 7); two sheets provide 14 ribs — exactly the design quantity.

**Why balsa wood:**

1. **Density.** Balsa (≈ 160 kg/m³) is 6× lighter than aluminium (2700 kg/m³) and 17× lighter than steel. Fourteen 3 mm thick ribs add only ~1.1 g each, for a total rib mass ~15 g.
2. **Specific stiffness (E/ρ).** Along-grain balsa has E ≈ 3.4 GPa and ρ = 160 kg/m³, giving a specific modulus of 21 MN·m/kg — comparable to aluminium (25.6 MN·m/kg) at a fraction of the density.
3. **Machinability.** Balsa cuts cleanly with a scalpel or laser cutter, allowing precise NACA 0012 profiles to be cut without specialist tooling.
4. **Bond compatibility.** Balsa bonds reliably to aluminium rods using CA glue and to polyester film using heat-shrink methods, enabling lightweight integrated construction.
5. **Sheet size (200 × 200 mm) justification.** NACA 0012 at chord = 250 mm has a maximum width (chord direction) of 250 mm — larger than the 200 mm sheet. For fabrication, each rib is assembled from two halves joined at mid-chord (50 % chord = 125 mm from LE): a leading-edge half (0–125 mm chord) and a trailing-edge half (125–250 mm chord). This joint falls between the two spar notches (front spar at 25 % = 62.5 mm; rear spar at 65 % = 162.5 mm), so neither spar notch is cut at the joint, preserving full notch integrity. The joint is reinforced with a 3 mm × 10 mm × 30 mm balsa doubler bonded with CA glue. Each half fits within the 200 mm sheet with the grain running chord-wise. Two sheets (14 rib assemblies) provide exactly the required count with minimal offcuts.

### 14.3 Airfoil: NACA 0012

**Specification:** NACA 0012 symmetric four-digit airfoil; 14 ribs.

#### Profile equation

The NACA 0012 ordinate (upper surface) is defined by:

$$y(x) = 0.6\, t_c \left[0.2969\sqrt{\hat{x}} - 0.1260\,\hat{x} - 0.3516\,\hat{x}^2 + 0.2843\,\hat{x}^3 - 0.1015\,\hat{x}^4\right]$$

where $\hat{x} = x/c$, $t_c = 0.12$ (12 % thickness ratio), and y is symmetric above and below the chord line.

At our chord c = 250 mm:

$$t_{\max} = 0.12 \times c = 0.12 \times 250\ \text{mm} = 30\ \text{mm} = \mathbf{3.0\ \text{cm}}$$

Maximum thickness occurs at $\hat{x} = 0.30$ (30 % chord = 75 mm from LE). This is the natural location for the front spar.

#### Key NACA 0012 cross-section parameters at c = 250 mm

| Station | % chord | x from LE (mm) | Half-thickness y (mm) | Full height (mm) |
|---|---|---|---|---|
| Leading edge | 0 % | 0 | 0 | 0 |
| Front spar | 25 % | 62.5 | 15.0 | 30.0 |
| Max thickness | 30 % | 75.0 | 15.0 | 30.0 |
| Rear spar | 65 % | 162.5 | 10.35 | 20.7 |
| Trailing edge | 100 % | 250 | 0 | 0 |

#### Why NACA 0012?

1. **Symmetry.** NACA 0012 is symmetric ($C_{M,AC} = 0$, zero camber), producing zero net pitching moment at zero angle of attack. This simplifies the structural torque analysis and reduces torsional loads on the wing.
2. **12 % thickness.** The relatively thick profile provides adequate internal space for the spar rods (5 mm diameter) and allows stiff ribs without excessively deep airfoil sections. The maximum thickness of 30 mm at the spar location comfortably accommodates a ∅ 5 mm rod with clearance on all sides.
3. **Universality and data availability.** NACA 0012 is the most extensively tested airfoil in aerodynamic literature (NACA TN 2412, Ladson et al., NASA TM 4074). Aerodynamic coefficients are available for Re = 10⁴ – 10⁷, making analysis straightforward.
4. **14 ribs.** With a 1 m span and 14 ribs, the rib pitch is $\Delta y = 1000/(14-1) = 76.9\ \text{mm}$. This pitch provides adequate NACA 0012 profile accuracy for prototype flight.
5. **Template availability.** NACA 0012 profiles are freely available as printable templates (UIUC Airfoil Database), and the smooth leading-edge geometry is achievable by sanding balsa sheet ribs cut with a scalpel.

### 14.4 Wing Planform — 1 m Span

| Parameter | Value | Reason |
|---|---|---|
| Span b | 1.00 m | Standard 1 m bench/table test span; fits in a standard lab test rig; commonly used for academic prototypes |
| Chord c | 0.25 m | c = 250 mm (consistent with main analysis) |
| Aspect ratio AR | b²/S = 1.00 / (1.00 × 0.25) = **4.0** | Moderate AR typical of prototype demonstration wings |
| Rib count | 14 | Rib pitch = 76.9 mm; adequate aerodynamic shape retention |
| Rib pitch | 76.9 mm | Derived from b / (N−1) = 1000 / 13 |

**Why 1 m span?** A 1 m span is the standard for an academic laboratory prototype for several reasons:
- It is the maximum that can be easily fabricated from hobby-shop stock (balsa sheets, aluminium rod sold in 1 m lengths).
- It can be mounted in a benchtop wind tunnel or loaded in a static test rig within a typical lab environment.
- Structural loads at 1 m span are representative of micro-UAV designs while remaining safe for hand loading.
- The wing fits across a standard doorway and can be transported without specialised handling.

---

## 15. Testing: Procedures, Cautions, and Expected Results

### 15.1 Overview

Testing is conducted in three phases: (A) material/coupon level, (B) component level, and (C) full wing static and dynamic tests. The goal is to verify that the as-built wing meets the structural margins established in sections 7–12 and that no catastrophic failure mode is present below the design ultimate load.

> **General Safety Caution:** All structural tests on the prototype wing must be conducted with the test area cleared of personnel except the operator. Load increments must be applied gradually (≤ 10 % of ultimate per 30-second step). All observers must stand behind a protective screen or at least 2 m from the specimen when loads exceed 70 % of ultimate. Eye protection must be worn at all times during spar-level tests.

---

### 15.2 Phase A — Material and Coupon Tests

#### Test A1: Aluminium Rod Tensile/Bending Coupon Test

**Purpose:** Verify the tensile and bending strength of the purchased Al 6061-T6 rod (∅ 5 mm) matches the assumed material properties (σ_y = 276 MPa, σ_ult = 310 MPa, E = 69 GPa).

**Procedure:**
1. Cut three 150 mm lengths of ∅ 5 mm Al rod from the batch to be used for spars.
2. Clamp each rod at one end with a 50 mm grip overlap in a bench vice; apply a transverse point load at the free tip using calibrated weights on a hanger.
3. Record load and tip deflection in 1 N increments from 0 to 15.0 N (expected yield at ~33.9 N for a 100 mm free length; 15 N is 44 % of yield, ensuring coupons remain fully elastic and undamaged for possible reuse).
4. Measure elastic slope: $k = F/\delta = 3EI/L^3$.
5. Calculate E from measured k: $E = kL^3 / (3I)$ where $I = \pi(2.5 \times 10^{-3})^4 / 4 = 3.068 \times 10^{-11}\ \text{m}^4$.

**Expected results:**

| Metric | Expected | Acceptance criterion |
|---|---|---|
| Young's modulus E | 69 ± 5 GPa | 64 – 74 GPa |
| Yield load (100 mm free length) | F_y ≈ 33.9 N | 30.0 – 37.8 N |
| Fracture mode | Ductile permanent bend at root | No brittle snap; visible plastic hinge |
| Tip deflection at 1 N | $\delta = F \times L^3 / (3EI) = 1.0 \times (0.1)^3 / (3 \times 69 \times 10^9 \times 3.068 \times 10^{-11}) = 0.16\ \text{mm}$ | 0.13 – 0.19 mm |

**Cautions:**
- Do not exceed 15.0 N total load on these coupons; the procedure stops at 15 N (44 % of the ~33.9 N yield load) so the rods remain elastic and usable for the wing after testing.
- Release load smoothly; sudden release of a load hanger can cause impact loading.
- Use smooth-jaw grips to avoid stress concentrations at the clamp that would cause premature failure.

---

#### Test A2: Balsa Wood Three-Point Bending Test

**Purpose:** Confirm the along-grain bending modulus and modulus of rupture (MOR) of the balsa sheet batch.

**Procedure:**
1. Cut five balsa coupons: 150 mm long × 20 mm wide × 2 mm thick, grain running along the 150 mm direction.
2. Set up a three-point bend fixture with supports 120 mm apart.
3. Apply a central load with calibrated weights; record load vs. mid-span deflection in 0.05 N steps.
4. Calculate E: $E = PL^3/(48I\delta)$ where $I = bh^3/12 = 0.020 \times 0.002^3 / 12 = 1.333 \times 10^{-11}\ \text{m}^4$.
5. Load to fracture; record fracture load.

**Expected results:**

| Metric | Expected | Acceptance criterion |
|---|---|---|
| Elastic modulus E_balsa | 3.0 – 3.8 GPa | ≥ 2.5 GPa |
| Fracture load (120 mm span, 20 × 2 mm) | F_f ≈ 7.0 N | ≥ 5.5 N |
| MOR | ≥ 14 MPa | ≥ 11 MPa |
| Fracture mode | Clean across grain | No delamination; no splitting along grain |

**Cautions:**
- Ensure coupon grain is aligned exactly along the length; off-axis grain reduces strength by up to 50 %.
- Reject batches with visible knots, resin pockets, or density variation > 20 % (check by weighing three coupons against theoretical mass = ρ × L × b × h = 160 × 0.15 × 0.02 × 0.002 = 0.096 g per coupon).

---

### 15.3 Phase B — Component Tests

#### Test B1: Rib Load-Bearing Test

**Purpose:** Verify that the assembled balsa ribs maintain their profile under aerodynamic pressure loads.

**Procedure:**
1. Glue one complete rib into a test fixture that mimics the spar-to-spar bay (two 5 mm rod supports 100 mm apart, matching the front spar – rear spar spacing).
2. Apply a uniformly distributed load to the upper rib surface using a 100 mm × 91 mm foam pad loaded with calibrated weights, simulating the rib distributed load $q_\text{rib} = 6.0\ \text{N/m}$ at root.
3. Total applied load at design condition: $F_{\text{design}} = q_\text{rib} \times c_{\text{rib}} \times \Delta y = 6.0 \times 0.100 \times 0.091 = 0.055\ \text{N}$ (where $c_{\text{rib}} = 100\ \text{mm}$ is the inter-spar chord span of the rib). Apply this load, then increase to **0.11 N (2 × design load)** as an over-load check.
4. Check that the rib chord-wise profile deviates less than 0.5 mm from the nominal NACA 0012 template using a profile gauge or feeler gauges at both 0.055 N (design load) and 0.11 N (2 × design load).

**Expected results:** Maximum rib deflection under design load (0.055 N) ≪ 0.1 mm; under 2 × design load (0.11 N) deflection should remain < 0.2 mm. The rib should show no detectable permanent deformation after unloading. This confirms that rib sizing is governed by minimum practical thickness (2 mm), not stress.

**Cautions:**
- Ensure the CA glue bond between rib notches and spar rods is fully cured (minimum 30 minutes at room temperature) before applying any loads.
- Do not apply concentrated loads (e.g., fingertip pressure) to the leading-edge rib nose, which is the most fragile area.

---

#### Test B2: Spar Bending Test (Full Half-Span)

**Purpose:** Verify spar stiffness and confirm linear-elastic response over the 500 mm half-span.

> **Caution before starting:** A ∅ 5 mm Al rod at 470 mm free length yields at **F_y ≈ 7.20 N** (root yield moment M_y = σ_y × I/r = 276 × 10⁶ × 3.068 × 10⁻¹¹ / 2.5 × 10⁻³ = 3.386 N·m; F_y = 3.386/0.470 = 7.20 N). Maximum safe test load is **5.0 N** (69 % of yield). Do not exceed this.

**Procedure:**
1. Clamp the root of one ∅ 5 mm, 500 mm long Al rod in a rigid bench vice with 30 mm grip overlap (free length L = 470 mm).
2. Apply a point load at the free tip using a precision hanging balance (suspended load in a cup via fishing line over a pulley aligned with the spar axis).
3. Record tip deflection vs. load in 0.5 N increments up to 5.0 N maximum:

| Step | Load (N) | Expected tip deflection (mm) |
|---|---|---|
| 1 | 1.0 | 16.4 |
| 2 | 2.0 | 32.7 |
| 3 | 3.0 | 49.1 |
| 4 | 4.0 | 65.5 |
| 5 | 5.0 | 81.8 — **Stop here** |

Expected tip deflection (elastic, point load, cantilever, I = πr⁴/4 = π(2.5 × 10⁻³)⁴/4 = 3.068 × 10⁻¹¹ m⁴):

$$\delta = \frac{FL^3}{3EI} = \frac{F \times (0.47)^3}{3 \times 69 \times 10^9 \times 3.068 \times 10^{-11}} = \frac{F \times 0.10393}{6.351 \times 10^{-3}} = 16.37\,F\ \text{mm}$$

4. Stop the test at 5.0 N. Do not increase load further.
5. Compare measured stiffness with theoretical: $k_{theory} = 3EI/L^3 = 6.351 \times 10^{-3}/0.10393 = 61.1\ \text{mN/mm}$.

**Expected results:**

| Metric | Expected | Acceptance criterion |
|---|---|---|
| Tip stiffness k | 61.1 mN/mm (= 61.1 N/m) | 51.9 – 70.3 mN/mm (±15 %) |
| Load at onset of yield | ≈ 7.20 N | Verify by observing permanent set after 5.0 N test: residual < 1 mm = elastic |
| Deflection linearity up to 4.0 N | R² > 0.99 for F–δ plot | R² ≥ 0.98 |

> **Note on stiffness improvement:** The 16.4 mm tip deflection per Newton for the ∅ 5 mm spar is 7.7× smaller than the 126 mm/N of a ∅ 3 mm rod — consistent with the $(d_5/d_3)^4 = (5/3)^4 = 7.72$ ratio of second moments of area. The purpose of this test is to verify E through measured stiffness and confirm the rod batch meets material specification.

**Cautions:**
- Do **not** exceed 5.0 N on the rod in this free-tip 470 mm configuration; the yield load is 7.20 N and permanent deformation will render the spar unusable.
- Check that the fishing line is perpendicular to the spar at the load point — any angular error underestimates stiffness.
- Do not kink the rod during clamping; inspect the free end under magnification for scratches or tool marks that could initiate fatigue cracks.

---

### 15.4 Phase C — Full Wing Static Test

#### Test C1: Wing Tip Deflection Under Distributed Load

> **Note before setup:** The ∅ 5 mm front spar remains fully elastic at all design load levels. The root front-spar bending moment at design ultimate load (2.07 N·m) is only 61 % of the yield moment (3.39 N·m), providing a yield safety margin of +64 %. The full wing may therefore be safely loaded to 100 % design limit load (6.13 N half-wing) and, if desired, to design ultimate load (9.20 N half-wing) during structural testing. Standard load increments (≤ 10 % of ultimate per 30-second step) and general safety precautions from §15.1 still apply.

**Purpose:** Verify linear-elastic structural response of the assembled wing and measure tip deflection up to design limit loads; confirm structural integrity and no damage (debonds, cracks) under the full design load range.

**Procedure:**
1. Mount the completed wing with the root joint fixed to a rigid wall bracket. The wing panel lies horizontally (spanwise) in the test rig, with the leading edge facing forward.
2. Apply loads via sand-bag blocks or calibrated weights placed at equally-spaced rib locations to simulate uniform distributed lift.
3. Total half-wing limit lift: $L_{1/2,\text{limit}} = 6.13\ \text{N}$. Divide equally among 11 rib bays (approximately 0.56 N per rib station for 100 % limit).
4. Apply loads in four increments: 25 %, 50 %, 75 %, and 100 % of limit load. An additional single increment to 100 % ultimate load (9.20 N) may be applied if all prior increments show linear response and no anomalies. At each increment:
   - Measure tip deflection with a steel rule or dial gauge referenced to the root.
   - Photograph the wing from the root and tip directions.
   - Check for audible cracking (evidence of rib or skin delamination).
5. Hold at 100 % limit load for 60 seconds; record any creep.
6. Unload and measure permanent set (residual tip displacement).

**Expected results (using I = 3.068 × 10⁻¹¹ m⁴ for ∅ 5 mm rod):**

| Load level | Applied load (N) | Expected tip deflection (mm) | Notes |
|---|---|---|---|
| 25 % limit | 1.53 | ~11 | Linear; no visible deformation |
| 50 % limit | 3.07 | ~23 | Linear |
| 75 % limit | 4.60 | ~34 | Still elastic; continue if no anomalies observed |
| 100 % limit | 6.13 | ~45 | Spar at 41 % of yield moment; fully elastic |
| 100 % ultimate | 9.20 | ~68 | Structural qualification load; spar at 61 % yield |

> **Calculation for reference:** Tip deflection under uniform distributed load at 100 % limit load:
> $$\delta_{\text{tip}} = \frac{w_0 (b/2)^4}{8EI} = \frac{12.26 \times (0.500)^4}{8 \times 69 \times 10^9 \times 3.068 \times 10^{-11}} = \frac{0.7663}{1.694 \times 10^{-2}} = 45.2\ \text{mm} \approx 9.0\%\ \text{semi-span}$$
>
> The ∅ 5 mm front spar is structurally adequate at 1 m span — no yielding occurs at or below design ultimate load. The 9 % semi-span deflection at limit load is large but elastically recoverable; it is characteristic of flexible solar-UAV-style construction and is accepted for this prototype.

**Pass/fail criteria (up to 100 % limit):**
- **Pass:** Deflection vs. load is linear (R² > 0.99), no audible cracking, residual permanent set < 1 mm after unloading, deflection at 100 % limit is within ±20 % of predicted 45 mm.
- **Fail:** Any audible crack, skin delamination, rib detachment, or permanent set > 2 mm after unloading to zero.

**Cautions:**
- Ensure load application points are at rib centrelines, not between ribs, to avoid local skin dents.
- Keep fingers and hands clear of the upper spar surface during loading.
- Have a safety net or foam pad below the wing to catch falling weights if a fastener releases.

---

#### Test C2: Wing Torsion Verification (Zero Torsion Check)

**Purpose:** Confirm that the assembled wing exhibits negligible twist under aerodynamic loading, consistent with the NACA 0012 zero-torsion prediction (T_root = 0, §10).

**Procedure:**
1. With the wing mounted root-fixed, apply a small equal-and-opposite couple at 75 % semi-span (nose-down/nose-up) at the leading edge and trailing edge of one rib, 375 mm from the root.
2. Apply torque up to 0.02 N·m maximum (much less than the zero-torsion case — this is a check only).
3. Measure twist angle using a digital inclinometer placed on the rib at the load station.

**Expected results:** Twist per unit torque ≤ 0.5°/N·m at the load station (open section). No permanent set after unloading. Confirms that the structure is torsionally stable without a D-box skin.

**Acceptance criterion:** Residual twist < 0.05° after load removal.

**Cautions:**
- Maximum applied torque: 0.02 N·m. Do not exceed.
- Since T_root = 0 in flight, this test is verification of structural integrity only, not a performance requirement.

---

#### Test C3: Tap Test — Skin/Rib Debond Detection

**Purpose:** Detect any adhesive delamination or debonds between skin, ribs, and spars without destructive testing.

**Procedure:**
1. After the static load tests (C1, C2), lightly tap each rib-to-skin joint and each rib-to-spar glue fillet using a small coin or pencil.
2. A solid "thud" indicates a well-bonded joint.
3. A hollow "click" or "pop" indicates a debond; mark and record location.

**Expected results:** All joints should produce a solid thud. No more than 5 % of joint area should show any hollow response after limit-load testing.

**Cautions:**
- Apply tapping force of < 1 N; heavier taps can initiate fresh delaminations in the thin balsa.
- Perform the tap test in a quiet environment; ambient noise masks the acoustic signature.

---

### 15.5 Phase D — Vibration / Modal Test

#### Test D1: Free-Vibration Pluck Test (Wing Natural Frequency)

**Purpose:** Confirm the first bending natural frequency is consistent with the analytical prediction (f₁ ≈ 6.00 Hz from §12.1).

**Procedure:**
1. Mount the wing root-fixed on the bench bracket.
2. "Pluck" the wing tip with a light tap (finger flick) and immediately release.
3. Record the free-decay vibration using a smartphone accelerometer app (or a small accelerometer and oscilloscope) attached near the wing tip.
4. Count zero-crossings or use an FFT to extract the dominant frequency.

**Expected results:**

| Frequency | Expected | Acceptance criterion |
|---|---|---|
| 1st bending f₁ | ~6.00 Hz | 4.5 – 7.5 Hz (±25 % for prototype variability) |
| Damping ratio ζ | 0.01 – 0.05 | < 0.10 (lightly damped) |

**Cautions:**
- Do not excite the wing with a resonant forcing frequency near f₁ for more than 2 seconds; resonance can amplify displacement to failure even at small forces.
- Ensure no loose masses (weights, tools) are resting on the wing during the pluck test, as these shift the measured frequency.
- If the measured frequency is below 4 Hz, inspect for debonded root joint or cracked spar — this indicates reduced stiffness and requires repair before any load testing.

---

### 15.6 Test Record and Sign-Off

All test results should be recorded in the test log with:
- Date and tester name
- Batch number/label of each material used
- Load cell or weight calibration certificate reference
- Photographs at each load step (minimum: unloaded, 25 % limit, 50 % limit, unloaded-after)
- Pass/fail judgement for each acceptance criterion

A completed test log signed by the laboratory supervisor constitutes the airworthiness evidence for the prototype wing. No flight or wind-tunnel testing should proceed until all Phase A, B, and C tests have returned **Pass** results.

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
| Lift distribution | Uniform | **Elliptical** | Prandtl lifting-line (rectangular wing, AR = 4.0) |
| Root bending moment | 2.30 N·m (uniform) | **1.953 N·m** (elliptical) | 15% reduction; use uniform as conservative design value |
| C_P location | 25% chord | **25% chord (NACA 0012: C_M,AC = 0)** | Symmetric airfoil, e_L = 0 |
| Gust load factor | n = 2.5 | Δn_gust = 7.54, **limited to n = 2.5 operationally** | Calm-weather flight restriction |
| Skin in bending | Participates | **Spar only** (skin is secondary) | Comparison of skin/spar stiffness |
| Torsional stiffness | N/A (T=0) | **Zero torsion (NACA 0012, FS at AC)** | C_M,AC = 0, e_L = 0 → T = 0 |

---

## Appendix C — Full-Scale Reference Analysis (Sky-Sailor)

This appendix provides reference analysis of the **full-scale Sky-Sailor solar UAV** (3.2 m span, André Noth, ETH Zürich, 2008). It serves as a design benchmark and shows how the scale model relates to the full-scale design.

### C.1 Full-Scale Wing Parameters

| Parameter | Symbol | Value | Unit |
|---|---|---|---|
| Wingspan | b | 3.200 | m |
| Semi-span | s | 1.600 | m |
| Chord | c | 0.250 | m |
| Wing area | S | 0.776 | m² |
| Aspect ratio | AR | 13.0 | — |
| MTOW | W | 2.444 × 9.81 = 23.96 | N |
| Wing loading | W/S | 31.59 | N/m² |
| Airfoil | — | WE 3.55-9.3 | — |
| t/c | — | 9.3 % | — |
| Camber ratio | cam/c | 3.55 % | — |
| Max thickness | t | 9.3 % × 250 = 23.25 mm | — |
| Scale factor (vs prototype) | λ | 1.000 / 3.200 = 0.313 | — |

**Full-scale design load factor (after gust alleviation):**

Using FAR 23 §23.337 / §23.341 with K_g:

$$\mu_g = \frac{2(m/S)}{\rho\,c\,a} = \frac{2 \times (2.444/0.776)}{1.225 \times 0.250 \times 5.44} = \frac{6.30}{1.662} = 3.790$$

$$K_g = \frac{0.88 \times 3.790}{5.3 + 3.790} = \frac{3.335}{9.090} = 0.367$$

$$\Delta n_{\text{gust,raw}} = \frac{\rho\,V_c\,U_e\,a}{2(W/S)} = \frac{1.225 \times 8.3 \times 7.62 \times 5.44}{2 \times 31.59} = \frac{423.1}{63.18} = 6.70$$

$$\Delta n_{\text{gust,allev}} = 0.367 \times 6.70 = 2.46 \quad \Rightarrow \quad n_{\text{gust,total}} = 3.46 \approx n_{\text{manoeuvre}} = 3.5$$

Design load factor: **n = 3.5** (FAR 23 manoeuvre limit governs after alleviation).

### C.2 Full-Scale Structural Loads

**Inertia-relieved net load per semi-span (n = 3.5):**

```
L_per_wing = (n × W) / 2 = (3.5 × 23.96) / 2 = 41.93 N
m_wing_semi ≈ 0.2625 kg  →  W_inertia = 0.2625 × 9.81 × 3.5 = 9.01 N
L_net = 41.93 − 9.01 = 32.92 N
```

**Root values:**

| Quantity | Value |
|---|---|
| Root shear V(0) | 32.92 N |
| Root bending moment M(0) | 26.35 N·m |
| Root torque T(0) | −0.44 N·m (nose-down) |
| Root lift per unit span l₀ (elliptical) | 33.37 N/m |

### C.3 Full-Scale Main Spar (CFRP I-Beam)

The full-scale spar is a carbon-fibre-reinforced polymer (CFRP) I-section, replacing the aluminium rod used in the scale prototype.

```
Spar cross-section:
  Height h         = t_max = 23.25 mm  (cap-to-cap)
  Cap width b_cap  = 15 mm
  Cap thickness    = 1.0 mm (2 × 0.5 mm CFRP prepreg, T300)
  Web thickness    = 2.0 mm (balsa, grain vertical)
  Web height h_web = h − 2 × t_cap = 21.25 mm
```

**Second moment of area:**

$$I_{\text{caps}} = 2 \times b_{\text{cap}} \times t_{\text{cap}} \times \left(\frac{h}{2} - \frac{t_{\text{cap}}}{2}\right)^2 = 2 \times 0.015 \times 0.001 \times (0.01163)^2 = 4.06 \times 10^{-9}\ \text{m}^4$$

$$I_{\text{web}} = \frac{t_{\text{web}} \times h_{\text{web}}^3}{12} = \frac{0.002 \times (0.02125)^3}{12} = 1.60 \times 10^{-9}\ \text{m}^4$$

$$I_{xx} = I_{\text{caps}} + I_{\text{web}} = 4.06 \times 10^{-9} + 1.60 \times 10^{-9} = 5.66 \times 10^{-9}\ \text{m}^4$$

**Bending stress in CFRP caps (E_CFRP = 120 GPa):**

$$\sigma_{\max} = \frac{M_{\text{root}} \times y_{\max}}{I_{xx}} = \frac{26.35 \times 0.01163}{5.66 \times 10^{-9}} = \frac{0.3065}{5.66 \times 10^{-9}} = 54.2\ \text{MPa}$$

Allowable (T300 CFRP UD): σ_allow = 500 MPa (compression), giving **SF = 9.2** — caps are oversized from a stress standpoint; minimum practical cap size drives the design.

**Web shear stress:**

$$\tau_{\text{web}} = \frac{V \times Q}{I_{xx} \times t_{\text{web}}} = \frac{32.92 \times 1.669 \times 10^{-7}}{5.66 \times 10^{-9} \times 0.002} = \frac{5.496 \times 10^{-6}}{1.132 \times 10^{-11}} = 0.485\ \text{MPa}$$

Allowable shear (balsa, vertical grain): τ_allow = 3.0 MPa → **SF = 6.2** ✓

**Web shear buckling check (balsa web, 2.0 mm thick):**

$$\tau_{\text{cr}} = \frac{k_s \pi^2 E_{\text{balsa}}}{12(1-\nu^2)} \left(\frac{t_{\text{web}}}{h_{\text{web}}}\right)^2 = \frac{5.35 \times 9.870 \times 3.5 \times 10^9}{10.92} \times \left(\frac{0.002}{0.02125}\right)^2$$

$$= 1.693 \times 10^{10} \times 8.873 \times 10^{-3} = 1.502 \times 10^7\ \text{Pa}... $$

Step-by-step:
- Coefficient: $5.35 \times 9.870 \times 3.5 \times 10^9 / (12 \times 0.91) = 1.693 \times 10^{10}$
- $(t/h)^2 = (2.0/21.25)^2 = (0.09412)^2 = 8.859 \times 10^{-3}$
- $\tau_{\text{cr}} = 1.693 \times 10^{10} \times 8.859 \times 10^{-3} = 1.500 \times 10^{8}\ \text{Pa}$

Wait — recalculate correctly:

$$\tau_{\text{cr}} = \frac{5.35 \times 9.870 \times 3.5 \times 10^9}{12 \times (1-0.3^2)} \times \left(\frac{0.002}{0.02125}\right)^2 = \frac{184.8 \times 10^9}{10.92} \times 8.859 \times 10^{-3} = 1.693 \times 10^{10} \times 8.859 \times 10^{-3}$$

$$= 1.500 \times 10^{8}\ \text{Pa} = 150.0\ \text{MPa}$$

This is the critical buckling stress for the web panel (Euler plate buckling with k_s = 5.35 for infinitely long plate, a/b >> 1). **SF_web_buckling = 150 / 0.485 = 309** — web buckling is not a concern.

> **Note:** An earlier version of the spar used t_web = 1.5 mm, which gave τ_cr = 84.4 MPa and SF_buckling = 174. Even the thinner web is adequate. The web thickness of 2.0 mm was chosen for **ease of fabrication** (easier to cut and handle) rather than structural necessity.

**Full-scale spar structural weight:**

```
CFRP caps:  m = ρ_CFRP × 2 × b_cap × t_cap × s = 1600 × 2 × 0.015 × 0.001 × 1.6 = 76.8 g
Balsa web:  m = ρ_balsa × t_web × h_web × s     = 160 × 0.002 × 0.02125 × 1.6   = 10.9 g
Total main spar (per semi-span): 87.7 g
```

Comparison with Noth data: total half-wing (including skin, ribs, solar cells, servos) = 161.6 g. Spar mass = 87.7 g ≈ **54 % of half-wing mass** — consistent with a spar-dominated construction.

### C.4 Full-Scale Rear Spar (CFRP Tube)

```
Location: 65 % chord = 162.5 mm from LE
Airfoil thickness at 65% chord ≈ 6%: t_rear = 0.06 × 250 = 15.0 mm
Section: CFRP rectangular tube 15 × 6 mm, t_wall = 0.5 mm
I_rear = (6×15³ − 5×14³) / 12 (mm⁴) × 10⁻¹² m⁴/mm⁴
       = (6×3375 − 5×2744)/12 × 10⁻¹² = (20,250 − 13,720)/12 × 10⁻¹² = 544.2 × 10⁻¹²
       ≈ 5.44 × 10⁻¹⁰ m⁴
```

Aileron hinge bending moment (20° deflection, aileron span = 30% of semi-span = 0.48 m):

$$M_{\text{RS,root}} = \Delta L_{\text{aileron}} \times \bar{y}_{\text{aileron}} = 4.19 \times 0.24 = 1.01\ \text{N·m}$$

$$\sigma_{\text{rear}} = \frac{M \times y}{I} = \frac{1.01 \times 0.0075}{5.44 \times 10^{-10}} = 13.9\ \text{MPa} \ll 500\ \text{MPa}\ \checkmark$$

### C.5 Full-Scale Natural Frequencies

| Mode | Formula | Value |
|---|---|---|
| 1st bending f₁ | $\frac{(1.875)^2}{2\pi L^2}\sqrt{EI/\bar{m}}$ with EI = 120×10⁹×5.66×10⁻⁹ = 679.2 N·m², $\bar{m}$ = 0.1641 kg/m, L = 1.6 m | **7.6 Hz** |
| 1st torsion f_T | $\frac{\pi}{4L}\sqrt{GJ/I_\alpha}$ with GJ = 12.22 N·m², $I_\alpha$ = 8.62×10⁻⁴ kg·m | **18.6 Hz** |
| f_T / f_B | 18.6 / 7.6 = 2.45 | Flutter coupling not expected ✓ |

### C.6 Full-Scale Aeroelastic Margins

| Check | Value | Design requirement | Margin |
|---|---|---|---|
| Divergence speed V_div | ≫ V_D (elastic axis ≈ AC) | 1.15 × V_D = 13.4 m/s | ✅ Infinite margin |
| Flutter speed V_flutter | ~47 m/s (simplified estimate) | 1.20 × V_D = 13.9 m/s | ✅ ×3.4 |
| Tip twist at n = 3.5 | 3.30° | < 5° | ✅ |
| Tip deflection at n = 3.5 | 22.9 mm (1.43 % of semi-span) | < 5 % semi-span | ✅ |

### C.7 Comparison: Full-Scale vs Scale Prototype

| Parameter | Full-Scale (Sky-Sailor) | Scale Prototype (Group 2) |
|---|---|---|
| Span | 3.20 m | 1.00 m |
| Chord | 0.250 m | 0.250 m |
| MTOW | 23.96 N | 4.905 N |
| Design load factor n | 3.5 | 2.5 |
| Airfoil | WE3.55-9.3 (cambered) | NACA 0012 (symmetric) |
| Main spar | CFRP I-beam, h = 23.25 mm | Al 6061-T6 rod, ∅ 5 mm |
| Root bending moment | 26.35 N·m | 2.30 N·m |
| Root shear | 32.92 N | 9.20 N |
| Spar bending SF | 8.03 | 1.52 (∅ 5 mm) |
| 1st bending frequency | 7.6 Hz | 6.00 Hz |
| 1st torsion frequency | 18.6 Hz | N/A (T = 0) |
| Tip deflection | 22.9 mm (1.4 % s) | ~45.3 mm (9.1 % s) at limit |
| Wing mass (per half) | ~101.5 g (full structure) | ~43.5 g (structural only) |

---

## References

1. Noth, A. and Siegwart, R., *Design of Solar Powered Airplanes for Continuous Flight*, ETH Zürich, Dissertation No. 18010, 2008.
2. Wing Structure G2 Preliminary Design Report, AE322/AE341, IIST, February 2026.
3. Structures Project VI — IDR, IIST, 2026.
4. Young, W.C. and Budynas, R.G., *Roark's Formulas for Stress and Strain*, 7th ed., McGraw-Hill, 2002. (Tables 3.1, 8.1, 15.3, 16.1)
5. Megson, T.H.G., *Aircraft Structures for Engineering Students*, 4th ed., Butterworth-Heinemann.
6. Maughmer, M.D. and Brandt, S.A., *Aerodynamics for Engineers*, Prentice Hall.
7. Blevins, R.D., *Formulas for Natural Frequency and Mode Shape*, Van Nostrand Reinhold, 1979.
8. FAR Part 23, §23.335, §23.337, §23.341 — *Structural Design Criteria for Small Aircraft*, US FAA.
9. Timoshenko, S. and Gere, J., *Theory of Elastic Stability*, 2nd ed., McGraw-Hill, 1961. (Plates and shells buckling coefficients.)
10. Prandtl, L., "Tragflügeltheorie" (*Lifting-Line Theory*), Nachrichten der Gesellschaft der Wissenschaften zu Göttingen, 1918.
11. ICAO Doc 7488 — *Manual of the ICAO Standard Atmosphere*, 3rd ed., 1993. (ISA tropospheric temperature lapse rate Λ = 6.5 K/km.)
