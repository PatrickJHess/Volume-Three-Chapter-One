/* Written by MyST v1.8.3 */

#import "myst-imports.typ": *

== Numpy and Pandas

=== NumPy and Pandas <numpy-and-pandas>

 \
 \
#link("https://colab.research.google.com/github/PatrickJHess/Volume-Three-Chapter-One/blob/master/colab/Colab\_Numpy\_And\_Pandas.ipynb")[#image("files/7e2db436150c38a00650f96925aa5581.svg", width: 90%)]#link("https://mybinder.org/v2/gh/PatrickJHess/Volume-Three-Chapter-One/master?urlpath=lab/tree/notebooks/Numpy\_And\_Pandas.ipynb")[🚀 Launch Live in Binder]#link("https://patrickjhess.github.io/Volume-Three-Chapter-One/")[⬅️ Return to Main Book]

#importantBlock(heading: [\[ ▼ \] How to use this page: Run, Copy, \& Download])[
- *⏻ Run code right here:* Click the *Power Button* icon at the top of the screen to activate *Live Code*.
- *📋 Copy code:* Hover over any code block and click the *Clipboard icon* in the top-right corner.
- *📥 Download this file:* Click the *Download icon* (downward arrow) at the top right of the screen to save this exact notebook to your computer.
]

#importantBlock(heading: [🛠️ Notebook Setup: Why the "Try/Except" Imports?])[
*The Goal:* To ensure this notebook runs perfectly whether you are using *Google Colab*, a local *Jupyter instance*, or a remote server without you having to manually install software.

- *External Libraries:* NumPy and Pandas are the "heavy hitters" for data. They aren't always installed by default.
- #strong[The `try/except` Logic:] This is a safety net.

  + We *try* to import the library.
  + If it fails (because it's not installed), the *except* block triggers a `!pip install` to download it automatically.
- #strong[Aliasing (`as np`):] We rename `numpy` to `np` to save keystrokes. In professional finance code, `np` and `pd` are the universal shorthand.
]

==== Preparing the Notebook <preparing-the-notebook>

===== Importing libraries and functions <importing-libraries-and-functions>

If the attempted import within the `try` segment fails, the `except` portion will install the libraries using `pip`, a package installer for Python. The exclamation mark preceding `pip` indicates that `pip` is running through the machine's console rather than within the Notebook. Upon successful import, NumPy and Pandas are _aliased as_ (or assigned the names of) `np` and `pd`, respectively (for more information on these statements, see #link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/Control\_Statements.html\#the-try-and-except")[Control Statements]).

```
try:
    import numpy as np
except:
    !pip install numpy
    import numpy as np
try:
    import pandas as pd
except:
    !pip install pandas
    import pandas as pd
```

```python

try:
    import numpy as np
except:
    !pip install numpy
    import numpy as np
try:
    import pandas as pd
except:
    !pip install pandas
    import pandas as pd
```

#importantBlock(heading: [🔢 Why NumPy for Fixed Income?])[
*The Mental Model:* Think of a NumPy *Array* as a high-powered version of a Python list. While standard Python lists are for general data, NumPy arrays are designed for *linear algebra and vector calculus*.

*What to look for in this section:*

- *Vectorization:* Notice how we apply a single formula (like `np.exp`) to an entire list of rates at once. In finance, this allows us to price 100 different bonds as easily as one.
- *Dimensionality:* We will move from a 1D list of rates to a 2D "Matrix" that pairs rates with their corresponding Present Value factors.
- *Efficiency:* NumPy performs these calculations in C-extension memory, making it thousands of times faster than standard Python loops for large datasets.
]

==== NumPy Arrays <numpy-arrays>

The NumPy library offers efficient numerical procedures that simplify complex calculations(for more information see, #link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/An\_Introduction\_To\_NumPy.html\#numpy")[A Quick Introduction To NumPy]).The fundamental object in this library is the NumPy array. An array is simply a data structure in which elements are arranged and accessed. It can be formed from a single value or from an iterable data type like a list, which holds a series of values (see #link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/A\_First\_Look\_At\_Lists.html\#a-first-look-at-lists")[A First Look at Lists]).NumPy must be imported before use\; recall that in this Notebook, it was imported and aliased as `np` in the first code cell. The `array()` method is used to convert variables into NumPy arrays (*the allias np precedes the method array*) . The following code creates an array from the list `[3%, 5%, 7%]` (lists are stylized with square brackets) and assigns that array to `interest_rates`. This is then passed to `display()`, which simply displays the contents of `interest_rates`.

```python
interest_rates=np.array([0.03,0.05,0.07])
display(interest_rates)
```

```
array([0.03, 0.05, 0.07])
```

==== NumPy Calculations <numpy-calculations>

Now that we've created an array and assigned it to `interest_rates`, we can perform calculations on that array. NumPy calculates array elements individually. For instance, the `exp()` method used below raises Euler's number, $e$, to the power of each element of `interest_rates` resulting in future value factors. This approach is faster and more convenient than iterating through the rates.

```python
display(np.exp(interest_rates))
```

```
array([1.03045453, 1.0512711 , 1.07250818])
```

===== ✍️ Application: Create a NumPy Array <id-application-create-a-numpy-array>

*The Challenge:* Create a new NumPy array containing the *present-value factors* calculated from the rates in `interest_rates`.

_Recall:_ PV = e\^\{-r\*t\}. Use the vectorized power of NumPy to do this in a single line!

#line(length: 100%, stroke: gray)

==== Two-Dimensional NumPy arrays <two-dimensional-numpy-arrays>

The `pv_rates` array in the code below is a _two-dimensional_ NumPy array (or matrix). It's created by combining two one-dimensional arrays—`interest_rates` and `pv_factors`—within the `array()` method. To access the rows of this two-dimensional array, we'll use the corresponding row _index_ value. (The index value is simply an element's sequential position in the array. Remember that in programming, sequences begin at position 0, not 1). Finally, both the interest rates and present-value factors are displayed below using _f-strings_. These are like strings, but begin with an "f" and are used to include variables and expressions within a string. The variable must be enclosed in curly brackets (i.e., \{ \}), and the indexed value must be enclosed in square brackets (\[ \]).

```python
#A calculation is make for each element of a numpy array
pv_factors=1/np.exp(interest_rates)
pv_rates=np.array([interest_rates,pv_factors])
display(pv_rates)
#Create an f string for each row.
#Each row must also be encapsulated in curly brackets
display(f'Interest Rates {pv_rates[0]}')
display(f'Present Value Factors {pv_rates[1]}')
```

```
array([[0.03      , 0.05      , 0.07      ],
       [0.97044553, 0.95122942, 0.93239382]])
```

```
'Interest Rates [0.03 0.05 0.07]'
```

```
'Present Value Factors [0.97044553 0.95122942 0.93239382]'
```

===== ✍️ Application: Two-Dimensional Matrix Manipulation <id-application-two-dimensional-matrix-manipulation>

*The Challenge:* Create a new two-dimensional array by performing a specialized calculation on your existing data.

+ Take the *interest-rate row* from your matrix.
+ Raise it to Euler's number (e\^r).
+ Multiply the resulting values by the *present value factors*.

_Goal: This verifies the relationship between discount factors and compounding rates within a single NumPy object._

#line(length: 100%, stroke: gray)

#importantBlock(heading: [🐼 Why Pandas for Fixed Income?])[
*The Mental Model:* If NumPy is the "engine" that does the math, *Pandas* is the "dashboard" that makes the data readable. It turns raw matrices into labeled tables called *DataFrames*.

*Key Advantages:*

- *Labeling:* Instead of remembering that "Row 1 is the PV Factor," we can give columns names like `Interest_Rate` and `PV_Factor`.
- *Data Alignment:* Pandas ensures that if you sort your rates, the corresponding PV factors stay perfectly aligned with them.
- *Readability:* DataFrames render as clean, professional HTML tables in your Jupyter Book, making them much easier for clients or researchers to audit.
]

==== Creating a Pandas DataFrame from NumPy Arrays <creating-a-pandas-dataframe-from-numpy-arrays>

===== A simple example <a-simple-example>

The Pandas library is a powerful resource for data analysis. Recall that like NumPy, we imported Pandas in our earlier code cell. For this section, we'll be using Pandas to access a structure called a _DataFrame_. A Pandas DataFrame organizes data into rows and columns, much like an Excel spreadsheet or a NumPy array. It can be created from a two-dimensional array, such as our newly created `pv_rates`. The simplest DataFrames automatically assign row and column index values\; a more functional approach allows for the explicit naming of both. In the simple example below, the `DataFrame()` method of Pandas uses three arrays as arguments, generating a row for each array.

```python
# Dataframe created with DataFrame() method
simple_example=pd.DataFrame((interest_rates,
              np.exp(interest_rates),
              1/np.exp(interest_rates)))
display(simple_example)
```

#tablex(columns: 4, header-rows: 1, repeat-header: true, ..tableStyle, ..columnStyle,
[
],
[
0
],
[
1
],
[
2
],
[
0
],
[
0.030000
],
[
0.050000
],
[
0.070000
],
[
1
],
[
1.030455
],
[
1.051271
],
[
1.072508
],
[
2
],
[
0.970446
],
[
0.951229
],
[
0.932394
],
)

===== 🐼 Application: Building a Pandas DataFrame <id-application-building-a-pandas-dataframe>

*The Challenge:* Convert your two-dimensional `pv_rates` array into a structured *Pandas DataFrame*.

- *Goal:* Transform the raw matrix into a labeled table that clearly identifies which values are interest rates and which are present-value factors.
- *Pro-Tip:* Remember that DataFrames often prefer data in columns. You may need to *Transpose* your array using `.T` during the creation process!

#line(length: 100%, stroke: gray)

==== Making rows into columns and labeling the columns <making-rows-into-columns-and-labeling-the-columns>

In the below code, rows are converted to columns by using the `transpose()` method on our earlier DataFrame, `simple_example`. This method changes the rows into columns (see #link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/An\_Introduction\_To\_Pandas.html\#the-transpose")[A Quick Introduction To Pandas]). The transposed result is then assigned to `rows_to_columns`, and the columns are then assigned the elements of a list (`['Rates', 'Future Value', 'Present Value']`).  Transposing the DataFrame makes `'Rates'`, `'Future Value'`, and `'Present Value'` the variables and makes the rows the observations of those variables.

```python
#transpose the simple_example dataframe and call it rows_to_columns
rows_to_columns=simple_example.transpose()
#(the transpose method can also be written as simple_example.T)
rows_to_columns.columns=['Rates','Future Value','Present Value']
display(rows_to_columns)
```

#tablex(columns: 4, header-rows: 1, repeat-header: true, ..tableStyle, ..columnStyle,
[
],
[
Rates
],
[
Future Value
],
[
Present Value
],
[
0
],
[
0.03
],
[
1.030455
],
[
0.970446
],
[
1
],
[
0.05
],
[
1.051271
],
[
0.951229
],
[
2
],
[
0.07
],
[
1.072508
],
[
0.932394
],
)

==== The set\_index() method <the-set-index-method>

Once the DataFrame has been transposed, the next step is to make the `Rates` column the index.  Why? The reason is that the values of `Rates` determine the values of the columns `Future Value` and `Pesent Value`. This change isn't necessary, but it draws our eye to a natural connection. Instead of an index that points only to a row number, the new index points to the rate that results in the future and present values.

The method `set_index()` takes a column name and removes the column from the DataFrame (#link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/An\_Introduction\_To\_Pandas.html\#making-a-column-the-index")[an example]). Pandas has a built-in _fail-safe-switch_. By default, this change (and others we'll encounter later) doesn't permanently alter the DataFrame. This might seem a bit strange, but this characteristic prevents mistakes that are difficult to fix. To make the change permanent, you can do the following:

+ Assign the transposed value of the DataFrame to another DataFrame \*

```
name_index_set_index=rows_to_columns.set_index('Rates')
display(name_index_set)
```
+ Change the default value of the `inplace` argument of `set_index`  to True \*

```
rows_to_columns.set_index('Rates',inplace=True)
display(rows_to_columns)
```

```python
name_index_set_index=rows_to_columns.set_index('Rates')
display(name_index_set_index)
display(rows_to_columns)
rows_to_columns.set_index('Rates',inplace=True)
display(rows_to_columns)
```

#tablex(columns: 3, header-rows: 2, repeat-header: true, ..tableStyle, ..columnStyle,
[
],
[
Future Value
],
[
Present Value
],
[
Rates
],
[
],
[
],
[
0.03
],
[
1.030455
],
[
0.970446
],
[
0.05
],
[
1.051271
],
[
0.951229
],
[
0.07
],
[
1.072508
],
[
0.932394
],
)
#tablex(columns: 4, header-rows: 1, repeat-header: true, ..tableStyle, ..columnStyle,
[
],
[
Rates
],
[
Future Value
],
[
Present Value
],
[
0
],
[
0.03
],
[
1.030455
],
[
0.970446
],
[
1
],
[
0.05
],
[
1.051271
],
[
0.951229
],
[
2
],
[
0.07
],
[
1.072508
],
[
0.932394
],
)
#tablex(columns: 3, header-rows: 2, repeat-header: true, ..tableStyle, ..columnStyle,
[
],
[
Future Value
],
[
Present Value
],
[
Rates
],
[
],
[
],
[
0.03
],
[
1.030455
],
[
0.970446
],
[
0.05
],
[
1.051271
],
[
0.951229
],
[
0.07
],
[
1.072508
],
[
0.932394
],
)

==== A final check <a-final-check>

#link("https://colab.research.google.com/github/PatrickJHess/Volume-Three-Chapter-One/blob/master/colab/Colab\_Numpy\_And\_Pandas.ipynb")[#image("files/7e2db436150c38a00650f96925aa5581.svg", width: 90%)]#link("https://mybinder.org/v2/gh/PatrickJHess/Volume-Three-Chapter-One/master?urlpath=lab/tree/notebooks/Numpy\_And\_Pandas.ipynb")[🚀 Launch Live in Binder]#link("https://patrickjhess.github.io/Volume-Three-Chapter-One/")[⬅️ Return to Main Book]