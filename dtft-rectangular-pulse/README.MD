# DTFT of a Discrete Rectangular Pulse
[![Python](https://img.shields.io/badge/Python-3.11.4-blue?logo=python&logoColor=white)](#installation)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange?logo=jupyter&logoColor=white)](#repository-entry-points)

A clean educational project that computes and visualises the **Discrete‑Time Fourier Transform (DTFT)** of a finite‑length rectangular pulse using its closed‑form expression.

The pulse is defined as:

\( x[n] = 1 \quad \text{for } -N_1 \le n \le N_1 \), and zero elsewhere.

The DTFT is derived by summing the geometric series and applying Euler’s formula:

\[
X(e^{j\omega}) = \frac{\sin\!\big(\omega\,(N_1 + \frac{1}{2})\big)}{\sin(\omega/2)}
\]

---

### Features

- Compute DTFT for **any** \( N_1 \) (e.g., 1, 2, 3, 4, 5)
- Combined frequency plot (all \( N_1 \) on one figure)
- Individual DTFT plots for each \( N_1 \)
- Time‑domain stem plot of the rectangular pulse
- High‑resolution output: **PNG**, **SVG**, and optionally **EMF** (via Inkscape)
- Ready‑to‑run **Jupyter Notebook** with live progress messages

---

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/dtft-rectangular-pulse.git
   cd dtft-rectangular-pulse

2. Create a virtual environment (recommended) and activate it.


3. Install Python dependencies:
   ```bash
   pip install -r requirements.txt

4. (Optional) Install Inkscape if you need EMF export:

- Download from inkscape.org

- Update the path in the notebook (see Configuration below)
  
---
### Usage
1. Launch Jupyter in the repository root and open the notebook located at `src/dtft-rectangular-pulse-plot-1.2.ipynb`. To change it, edit the `export_dir` variable in the notebook cells (Cell 3 and later)

2. Configure the Inkscape path if you want EMF output (see Configuration).

3. Run all cells. The notebook will:

4. Show a combined DTFT plot for the chosen N1 values.

5. The code exports individual DTFT and time‑domain plots and save all files (PNG, SVG, EMF) with timestamps into the `plots/` folder.

---
### Configuration
Inside the first cell, set:
-  Clone the repository 
-  Adjust these:
   ```Python
   ENABLE_EMF_EXPORT = True          # Set False to disable EMF
   INKSCAPE_EXE = r"C:\Program Files\Inkscape\bin\inkscape.exe"   # Adjust to your system
You can also change the N1_values list in Cell 3 to any integers.

---

### Dependencies

- Python 3.8+

- NumPy

- Matplotlib

- Jupyter (to run the notebook)

- Inkscape (optional, for EMF export)


## License
MIT – feel free to use, modify, and share.


---

## Author

**Mojtaba Sadafi**
[https://mojsadafi.ir](https://mojsadafi.ir)




