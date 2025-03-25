import sys
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
from scipy.stats import linregress
from skimage.draw import line
from skimage.draw import line as skimage_line



# --------------------------
# Helpers
# --------------------------

def read_radii_from_file(filepath):
   
    """
    Read radius values from a text file.

    Parameters:
        filepath (str): Path to the text file containing radius values.

    Returns:
        list: List of radius values.
    """
   
    radii = []
    with open(filepath, "r") as file:
        for line in file:
            line = line.strip()
            if line and not line.startswith("//"):
                try:
                    radius = float(line)
                    radii.append(radius)
                except ValueError:
                    continue
    return radii

def read_radii_ring_from_file(filepath):
   
    """
    Read radius values from a text file.

    Parameters:
        filepath (str): Path to the text file containing radius values.

    Returns:
        list: List of tuples [(inner_radius, outer_radius)] radius values.
        for the construcction of a ring.
    """
   
    radii = []
    with open(filepath, "r") as file:
        for line in file:
            # remove {} and extra spaces, then split by comma
            valores = line.strip().strip("{}").split(",")
            # Convert to floats and add to the list as a tuple
            radii.append((float(valores[0]), float(valores[1])))
    
    return radii



# --------------------------
# Fractal Generation Functions
# --------------------------

def generate_thin_ring_fractal(size, radii, r=None, ring_width=1):
   
    """
    Generates a thin ring fractal with rings at specific radii.

    Parameters:
        size (int): Output image size (width = height = size).
        radii (list): List of radii values where rings should appear.
        r (float): The maximum circle radius in pixels; defaults to size/2.
        ring_width (float): Width of each ring in pixels.

    Returns:
        np.ndarray (bool): 2D mask with True for 'kept' pixels.
    """
   
    if r is None:
        r = size / 2.0

    # Filter out very small values (they'd create a filled center)
    filtered_radii = [radius for radius in radii if radius > 0.1]

    # Create coordinate grid
    y, x = np.ogrid[-r : size - r, -r : size - r]

    # Calculate distance from center for each pixel
    dist = np.sqrt(x * x + y * y)

    # Initialize mask to False (all pixels excluded)
    mask = np.zeros((size, size), dtype=bool)

    # Add rings for each radius
    max_radius = max(filtered_radii) if filtered_radii else 1.0
    for radius in filtered_radii:
        # Scale the radius to match the image size
        scaled_radius = radius * (r / max_radius)
        # Include pixels whose distance falls within this ring width
        mask |= (dist >= scaled_radius - ring_width / 2) & (
            dist <= scaled_radius + ring_width / 2
        )

    return mask

def generate_thick_ring_fractal(size, radii, r=None):
   
    """
    Generates a thick ring fractal with rings at specific inner and outer radii.

    Parameters:
        size (int): Output image size (width = height = size).
        radii (list of tuples): List of (inner_radius, outer_radius) values.
        r (float): The maximum circle radius in pixels; defaults to size/2.

    Returns:
        np.ndarray (bool): 2D mask with True for 'kept' pixels.
    """
    if r is None:
        r = size / 2.0

    # Filter invalid radius (inner greater than outer)
    filtered_radii = [(a, b) for a, b in radii if a < b and a > 0]

     # Create coordinate grid
    y, x = np.ogrid[-r:size - r, -r:size - r]

    # Calculate distance from center for each pixel
    dist = np.sqrt(x * x + y * y)

    # Initialize mask to False (all pixels excluded)
    mask = np.zeros((size, size), dtype=bool)

    # Obtener el máximo radio externo para escalar los valores
    max_radius = max([b for _, b in filtered_radii], default=1.0)

    # add pixels inside rings defined by radius (a,b)
    for a, b in filtered_radii:
        scaled_a = a * (r / max_radius)  # scaled inner radius
        scaled_b = b * (r / max_radius)  # scaled outer radius
        mask |= (dist >= scaled_a) & (dist <= scaled_b)

    return mask



# --------------------------
# Core Algorithm
# --------------------------

def box_counting(image, box_sizes):
 
    """Performs box counting and returns data for visualization.
    Ignores leftover pixels if the image size is not divisible by the box size."""
 
    size = image.shape[0]
    counts = []
    boxes_data = []

    for bs in box_sizes:
        n = size // bs  # use only the complete boxes
        count = 0
        boxes = []

        for i in range(n):
            for j in range(n):
                x, y = j * bs, i * bs
                box = image[y : y + bs, x : x + bs]
                if np.any(box):
                    count += 1
                    boxes.append((x, y, bs, bs))

        counts.append(count)
        boxes_data.append(boxes)

    return np.array(counts), np.array(box_sizes), boxes_data


def fractal_dimension(image, box_sizes):
   
    """Calculates fractal dimension with regression"""
   
    counts, box_sizes, _ = box_counting(image, box_sizes)
    mask = counts > 0
    log_counts = np.log(counts[mask])
    log_scales = np.log(1 / box_sizes[mask])
    slope, *_ = linregress(log_scales, log_counts)
   
    return slope


# --------------------------
# Enhanced Visualization
# --------------------------

def plot_fractal(image, box_sizes, box_size_idx=-2, cmap="viridis"):
    
    """Enhanced visualization with box overlay and regression analysis"""
    
    counts, box_sizes, boxes_data = box_counting(image, box_sizes)
    selected_boxes = boxes_data[box_size_idx]
    selected_size = box_sizes[box_size_idx]

    fig = plt.figure(figsize=(15, 6))

    # Fractal visualization with boxes
    ax1 = fig.add_subplot(131)
    ax1.imshow(image, cmap=cmap, origin="lower")
    for box in selected_boxes:
        x, y, w, h = box
        ax1.add_patch(
            Rectangle((x, y), w, h, edgecolor="red", facecolor="none", lw=0.5)
        )
    ax1.set_title(f"Fractal Structure\nBox size: {selected_size}")
    ax1.axis("off")

    # Box counting plot
    ax2 = fig.add_subplot(132)
    ax2.loglog(1 / box_sizes, counts, "bo-")
    ax2.set_xlabel("1/ε (Inverse Box Size)")
    ax2.set_ylabel("N(ε) (Box Count)")
    ax2.set_title("Box Counting Plot")
    ax2.grid(True, which="both", ls="--")

    # Regression analysis
    ax3 = fig.add_subplot(133)
    mask = counts > 0
    log_counts = np.log(counts[mask])
    log_scales = np.log(1 / box_sizes[mask])
    slope, intercept, *_ = linregress(log_scales, log_counts)

    ax3.scatter(log_scales, log_counts, c="b", label="Data points")
    ax3.plot(
        log_scales, slope * log_scales + intercept, "r--", label=f"Fit (D={slope:.4f})"
    )
    ax3.set_xlabel("log(1/ε)")
    ax3.set_ylabel("log(N(ε))")
    ax3.set_title(f"Fractal Dimension: {slope:.4f}")
    ax3.legend()
    ax3.grid(True)

    plt.tight_layout()
    plt.show()


# --------------------------
# Main code
# --------------------------

# To use this code, pass "thin" for a single-radius ring or "thick"
# for a ring with (a, b) radii as the first command-line argument, 
# and the .txt file as the second argument.

if __name__ == "__main__":
    
    # Common parameters
    box_sizes = [3**i for i in range(6)]  # [1, 3, 9, 27, 81, 243]

    kindring = sys.argv[1]
    radiifile  = sys.argv[2]
    
    # Generate the fractal
    size = 600  # Image size
    if kindring == "thin":
    
        radii = read_radii_from_file(radiifile)
        fractal = generate_thin_ring_fractal(size, radii, ring_width=1)

    elif kindring == "thick":    
    
        radii = read_radii_ring_from_file(radiifile)
        fractal = generate_thick_ring_fractal(size, radii)

    else: 

        print("Clarify whether to calculate a thin or thick ring.")

    
    # Visualization of the fractal
    plot_fractal(fractal, box_sizes, cmap="binary")