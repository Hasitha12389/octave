Overview


This project implements a Scientific Calculator using MATLAB/Octave, which provides advanced mathematical functions beyond basic arithmetic.
The calculator supports operations like exponents, trigonometric functions (sine, cosine, tangent), logarithms, factorials, and many others.
It is designed to be user-friendly, featuring an interactive graphical interface where the user can perform calculations by clicking buttons.

Features


Mathematical Operations:
Exponentiation: x^y, x^2, x^3, x^(1/2), x^(1/3), etc.
Trigonometric functions: sin, cos, tan, sec, cosec, cot (using degrees).
Factorial: ! for calculating the factorial of a number.
Reciprocal: 1/x.
e for Euler’s constant.
Pi: π.
Display Area: A dynamic text field displays the current calculation and the result.
Error Handling: If a calculation is invalid (e.g., division by zero or undefined operations), the calculator displays an "Error" message.
Clear and Backspace: You can clear the entire display (C) or remove the last character (⌫).
User Interface
The calculator has a clean and intuitive interface that includes a grid of buttons, each corresponding to a specific operation.
The buttons are arranged logically, and the display area is located at the top for easy viewing.
The calculator’s colors and button sizes are designed for ease of use, with buttons changing colors for different operations (e.g., C for clear is green, ⌫ for backspace is red).
How to Use
Start the Calculator: Run the scientific_cal function to launch the calculator window.
Perform Calculations:
Click buttons for numbers, operators, and functions.
Use the = (equals) button to evaluate the current expression.
The C button clears the display.
The ⌫ button removes the last character from the current expression.
For trigonometric operations, ensure the angle is in degrees (e.g., sin(30) for the sine of 30 degrees).
Functions and Operations
Basic Arithmetic: The calculator supports addition, subtraction, multiplication, and division.
Scientific Functions:
Power: x^y, x^2, x^3, x^(1/y) for powers and roots.
Trigonometry: sin(x), cos(x), tan(x), sec(x), cosec(x), cot(x) (with angles in degrees).
Factorial: ! calculates the factorial of a number.
Inverse: 1/x calculates the reciprocal of a number.
Constants: e for Euler's number and π for pi.
Dependencies
MATLAB/Octave: This calculator is written in MATLAB and is compatible with both MATLAB and Octave (an open-source alternative).
MATLAB GUI: The calculator uses MATLAB's graphical user interface (GUI) functions, such as uicontrol and figure, to build the layout and manage user interactions.
How to Run
Open MATLAB or Octave.
Clone this repository to your local machine.
Run the scientific_cal.m script by typing scientific_cal() in the command window.
Example Use Case
To calculate the sine of 30 degrees:

Click 3, 0, sind, and =.
The result will be displayed as 0.5 in the display area.
To calculate 5! (factorial of 5):

Click 5, !, and =.
The result will be displayed as 120.
To calculate the reciprocal of 4:

Click 4, 1/x, and =.
The result will be displayed as 0.25.
Contribution
Improvements: Contributions to enhance the functionality and appearance of the calculator are welcome.
Bug Fixes: If you find any bugs or issues, please open an issue on the GitHub repository and submit a pull request with a fix.
License
This project is licensed under the MIT License.

Acknowledgments


This calculator was built using MATLAB/Octave's GUI tools and is designed to be a simple yet powerful scientific calculator for use by students and professionals alike.
