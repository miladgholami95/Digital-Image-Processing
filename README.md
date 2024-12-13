# Digital Image Processing (DIP) Projects

This repository contains a collection of projects completed as part of coursework in Digital Image Processing (DIP) at Razi University, Kermanshah, Iran. Each project demonstrates a practical application of algorithms in image processing, implemented using MATLAB. Below is a summary of each project:

---

## Table of Contents

1. [Identify Persian Characters](#identify-persian-characters)
2. [Calculate Area and Perimeter](#calculate-area-and-perimeter)
3. [Recognize Persian Letters](#recognize-persian-letters)
4. [Image Watermarking](#image-watermarking)
5. [Coin Recognition](#coin-recognition)
6. [Height Estimation](#height-estimation)
7. [Descriptive Image Text](#descriptive-image-text)
8. [Audio in Images](#audio-in-images)
9. [Skin Pixel Detection](#skin-pixel-detection)

---

### Identify Persian Characters 

**Description:** This MATLAB program performs character recognition by processing a binary image to extract features and compare them with predefined patterns. It begins by loading an image, converting it to binary, identifying the region of interest, resizing it to 100×100 pixels, and preparing it for analysis. Key features are extracted by analyzing pixel transitions along specific horizontal and vertical lines, forming a feature vector. This vector is then compared against predefined vectors representing known characters or numbers. If a match is found, the corresponding character or number is identified and displayed; otherwise, it reports no match.  
**Tool:** MATLAB 

---

### Calculate the Area and Perimeter

**Description:** This MATLAB program creates a binary image with a filled square region and computes its perimeter and area using edge detection and pixel counting. It generates a 100×100 matrix where a 50×50 square in the center is set to 1 (white), and the rest remain 0 (black). Vertical and horizontal edges of the square are identified by detecting pixel value transitions, marking the edges in a separate matrix. The perimeter is calculated by counting the total edge pixels, while the area is determined by counting all white pixels within the square. The results are displayed, and the edges are visualized for confirmation.  
**Tool:** MATLAB

---

### Recognize Persian Letters
 
**Description:** The goal of this project is to identify similar characters using template matching. A total of 50 images are used for training and 50 for testing, with 5 images for each of the 10 characters. The size and font of the images vary across both groups. The program is divided into two parts: in the first part, all training images are provided to the program along with their labels. In the second part, query images are processed one by one, and each is labeled based on its closest similarity to a training image using two-dimensional correlation (corr2). The highest correlation value determines the winning class. After labeling all query images, the predicted labels are compared with the true labels of the test images and the recognition accuracy is calculated and reported as a percentage.  
**Tool:** MATLAB  

---

### Image Watermarking
 
**Description:** This project involves encoding a character into an image and decoding it back. The process begins by reading an image and taking a character string as input. The string is converted to ASCII codes and stored, then encoded pixel-by-pixel along row 100 of the image matrix, where each character's ASCII value replaces a pixel value. A protocol is used for decoding, with the starting row and string length stored in specific pixels. The modified image is saved under a new name, and decoding extracts the ASCII codes to reconstruct the original string.
  This project also encodes a character string into an image by embedding the ASCII codes as bits in pixel values' least significant bits (LSBs). The image and input string are read, and the string's length is stored. Using a loop, the 8 bits of each ASCII character are embedded across 8 pixels in consecutive rows via bitget and bitset. A protocol stores the string length in a specific pixel for decoding. During decoding, the process retrieves and reconstructs the string from the LSBs. The modified image is saved under a new name.
**Tool:** MATLAB  

---

### Coin Recognition
  
**Description:** This MATLAB code identifies and classifies coins in an image, calculates their total monetary value, and displays the results. The process begins by reading an input image and binarizing it based on an optimal threshold. Holes in the binary image are filled, and region properties such as area and centroid are computed. Coins are identified by comparing their areas against predefined thresholds for 10 Cent, 25 Cent, and 2 Euro coins. Detected coins are labeled directly on the image, and their values are summed to calculate the total amount. The annotated image, alongside the original, is displayed in a subplot, and the total monetary value is printed in the command window.
**Tool:** MATLAB  

---

### Height Estimation
 
**Description:** This MATLAB code calculates a person's height in an image using image processing techniques. The input image is resized, converted to grayscale, and binarized using an adaptive threshold. Morphological operations are applied to clean up noise and fill gaps in the binary image. The first white pixel from the top and bottom rows is identified to determine the person's height in pixels. This value is converted to real-world height in centimeters using a scaling factor. The calculated height is displayed in the command window.
**Tool:** MATLAB  

---

### Descriptive Image Text
  
**Description:** This MATLAB code is designed to classify and count objects in an image based on their physical and color characteristics. Here's a concise description:

1. **Training Phase**: The code processes four predefined "base images" of objects, extracting features such as shape ratio (minor axis/major axis) and average RGB values. These features are stored for comparison.

2. **Testing Phase**: A test image is loaded, and its objects are isolated using thresholding and morphological operations. Features for these objects are calculated similarly to the training phase.

3. **Classification**: Each object's features are compared to the stored training data using the mean squared error method. The object is assigned to the class with the smallest error.

4. **Annotation**: The test image is annotated with the identified object classes and counts of each type of object.

5. **Description Generation**: A text description of the image, detailing the number and types of objects, is saved to a text file and displayed.

The result is a labeled image and a summary text file describing the objects in the test image.  
**Tool:** MATLAB 

---

### Audio in Images
  
**Description:** This MATLAB code describes the process of watermarking an audio file into an image and then extracting it back from the watermarked image. Below is a concise breakdown of the code:

### **Watermarking Process (Encoding)**
1. **Read Audio and Image**:
   - An audio file (`Dark_Souls.wav`) is read and rescaled to match the pixel values of the image.
   - An image (`missing_data.png`) is read and converted to grayscale.

2. **Store Metadata**:
   - The **sampling frequency** of the audio is encoded in the first 10 pixels of the image.
   - The **length of the audio data** is encoded in the next 10 pixels of the image.

3. **Embed Audio**:
   - The audio data is embedded into the image by storing it in every 10th pixel of the reshaped image, leaving the other pixels unchanged.

4. **Save Watermarked Image**:
   - The modified image, which now contains the hidden audio data, is saved as `wm_image.png`.

5. **Display Watermarked Image**:
   - The watermarked image is displayed to visualize how the image looks after embedding the audio.

### **Watermark Extraction (Decoding)**
1. **Read Watermarked Image**:
   - The watermarked image (`wm_image.png`) is read.

2. **Extract Metadata**:
   - The **sampling frequency** and **audio length** are decoded from the first few pixels of the image, using the same positions where they were stored during encoding.

3. **Extract Audio**:
   - The audio data is extracted by reading every 10th pixel from the image, based on the length of the audio that was previously stored.

4. **Rescale Audio**:
   - The extracted audio data is rescaled back to the original range (`[-1, 1]`), matching the original audio data.

5. **Save Decoded Audio**:
   - The extracted audio is saved to a new audio file (`decoded_audio.wav`) using the decoded sampling frequency.

6. **Display Audio Waveform**:
   - The extracted audio waveform is plotted for verification.


### **Summary**:
The watermarking process involves embedding audio data into the pixel values of an image, while the extraction process retrieves this audio data by decoding specific pixels of the image. This method allows embedding an audio file in an image without significantly altering the appearance of the image. 
**Tool:** MATLAB  

---

### Skin Pixel Detection
 
**Description:** This MATLAB code provides a workflow for processing MRI images, allowing color space conversions, displaying results, and optionally calculating and displaying accuracy using confusion matrices. Below is a detailed breakdown of the code:

### **Steps in the Code**:

1. **Setup and File Selection**:
   - The user is prompted to select an MRI image file through a file dialog box using `uigetfile`.
   - The selected image is read into the workspace with `imread`.
   - The file path and name are combined to form the full path (`addr`) to the image.

2. **Color Space Conversion**:
   - The code performs three different color space conversions on the selected MRI image:
     - **YUV to RGB Conversion** (`w1`).
     - **HSV to RGB Conversion** (`w2`).
     - **RGB Conversion** (`w3`), but this seems redundant since the image is already in RGB format.

3. **User Decision for Accuracy Calculation**:
   - A dialog box (`questdlg`) asks the user whether they would like to calculate accuracy based on a ground truth binary image. The response is captured in `answer`.

4. **If User Chooses 'Ok' (Calculate Accuracy)**:
   - The user is prompted again to select a ground truth binary image (either `.png`, `.jpg`, or `.bmp`).
   - The selected image (`w5`) is converted to binary using `im2bw`.
   - The code then displays a 2x4 grid of subplots:
     - The original MRI image.
     - The converted RGB, HSV, and YUV images.
     - The ground truth binary image (`w5`).
     - Confusion matrices comparing each of the color-converted images (`w1`, `w2`, `w3`) to the binary ground truth image using `confusionmat`.
     - The confusion matrices are visualized as charts using `confusionchart` to show the accuracy of each color conversion.

5. **If User Chooses 'No' (No Accuracy Calculation)**:
   - The code skips the accuracy calculations and simply displays the 2x2 subplot grid with:
     - The original MRI image.
     - The three color-converted images (RGB, HSV, and YUV).
   - This option allows the user to only view the color-converted images without any accuracy computation.

### **Detailed Explanation**:

1. **File Selection**:
   - `uigetfile` allows the user to browse and select an image file (MRI).
   - The full path to the selected image is generated with `strcat(pathname, filename)`.

2. **Color Space Conversions**:
   - `yuv_rgb(w)`: This function converts the image from the YUV color space to RGB. The function definition for `yuv_rgb` is not provided, but this likely performs the necessary conversion algorithm.
   - `hsv_convert(w)`: Similarly, this function converts the image from HSV to RGB.
   - `rgbcovert(w)`: This function appears to convert the image back to RGB, but since the original image is already in RGB, this may be redundant.

3. **Accuracy Calculation (Optional)**:
   - If the user chooses to calculate accuracy, another MRI image (ground truth) is selected and converted to binary.
   - `confusionmat(logical(w1(:)), (w5(:)))`: This function calculates a confusion matrix between the binary ground truth image (`w5`) and the converted RGB image (`w1` from YUV to RGB).
   - The confusion matrices for all three color conversions (`w1`, `w2`, and `w3`) are computed and displayed using `confusionchart`.

4. **Display of Results**:
   - `subplot`: The code uses `subplot` to organize multiple images and charts in the same figure window.
   - `imshow`: This function is used to display the images in the subplots.
   - `title`: Titles are added to each subplot to label them clearly.
   - If accuracy is calculated, confusion matrices are displayed with `confusionchart` to visualize how well each color conversion method compares to the binary ground truth image.

### **Summary of the Workflow**:
- **Step 1**: Load and convert the selected MRI image into various color spaces (RGB, YUV, HSV).
- **Step 2**: Optionally, load a ground truth binary image and compute the accuracy (using confusion matrices) for each color space conversion.
- **Step 3**: Display the results in subplots: original image, color space conversions, and optionally the accuracy charts.

**Tool:** MATLAB 

---

## Repository Structure

```
|-- Project 1: Identify Persian Characters
|-- Project 2: Calculate Area and Perimeter
|-- Project 3: Recognize Persian Letters
|-- Project 4: Image Watermarking
|-- Project 5: Coin Recognition
|-- Project 6: Height Estimation
|-- Project 7: Descriptive Image Text
|-- Project 8: Audio in Images
|-- Project 9: Skin Pixel Detection
```

Each project folder contains:
- **Code files:** Implementation in MATLAB.
- **Documentation:** Details of the algorithm and its application.
- **Sample Data:** Example input images and corresponding results (where applicable).

---

## License

This repository is open-source and available under the [MIT License](LICENSE).

---

## Contact

For any inquiries or collaboration, please contact:  
**Milad Gholami **
**Email:** miladgholami.kr@gmail.com  
**LinkedIn:** linkedin.com/in/milad-gholami-339677172

---
