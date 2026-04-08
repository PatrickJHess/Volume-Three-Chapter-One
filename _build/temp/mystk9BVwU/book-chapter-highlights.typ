/* Written by MyST v1.8.3 */

#import "myst-imports.typ": *

== Chapter Highlights

=== Basic Bond Concepts and the Term Structure of Interest Rates <basic-bond-concepts-and-the-term-structure-of-interest-rates>

*This Jupyter Book is Chapter One of the volume Basic Concepts of Fixed Income*.

Chapter One introduces the foundational principles of bond pricing. A primary focus of this chapter is calculating the term structure of interest rates, an essential gauge of financial market health, using data from US Treasury Bills (T-bills).

*Highlights of the chapter are:*

- #emph[*Financial concepts*]

  - _Basic bond pricing_
  - _Defining the term structure of interest rates_
  - _Calculating and graphing the term structure of interest rates_
  - _The term structure and the state of financial markets_
- #emph[*Python concepts*]

  - _NumPy arrays_
  - _Pandas DataFrames_
  - _Accessing data with a URL address_
  - _Custom modules_

==== Background <background>

This chapter's examples and discussions rely on the *Pandas* and *NumPy* libraries.

- *Pandas* is introduced in #link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/An\_Introduction\_To\_Pandas.html\#a-quick-introduction-to-pandas")[_A Quick Introduction to Pandas_].
- *NumPy* is introduced in #link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/An\_Introduction\_To\_NumPy.html\#a-quick-introduction-to-numpy")[_A Quick Introduction to NumPy_].
- The _NumPy and Pandas_ notebook in this chapter provides examples of using these libraries in relation to the _Calculating and Graphing the Term Structure of Interest Rates_ notebook.
- Additional relevant Python concepts can be found in the introductory volume, #link("https://patrickjhess.github.io/Introduction-To-Python-For-Financial-Python/intro.html")[_Background Material: An Introduction to Python for Financial Python_], that relate to this and other chapters of _Basic Concepts of Fixed Income_.

*The chapter includes five sections:*

+ _Introduction to Bond Pricing_ covers some  basic concepts.
+ The  Jupyter notebook _NumPy and Pandas_ introduces and illustrates the modules.
+ The  Jupyter notebook _Calculating and Graphing the Term Structure of Interest Rates_ uses NumPy and Pandas to:

  - download data from DropBox that is used to calculate and graph the term structure on September 15, 2022.
  - download data from the U.S. Treasury that is used to calculate and graph the term structure on September 30, 2025
  - an exercise asking you to calculate and plot spot and forward rates with data downloaded from the US Treasury.
+ _Python, Pandas, NumPy, and Financial Insights_ summarizes the financial concepts and results.
+ _Functions Imported by the Chapter_ describes the functions imported from DropBox (_module\_basic\_concepts\_fixed\_income_).