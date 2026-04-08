/* Written by MyST v1.8.3 */

#import "myst-imports.typ": *

== Chapter Summary

=== Python, Pandas, NumPy, and Financial Insights <python-pandas-numpy-and-financial-insights>

In this chapter, we used Pandas and NumPy to explore different ways of calculating the term structure of interest rates for September 15, 2022, and September 30, 2025. These term structures reveal an economy in transition. On September 15, 2022, rates were increasing with maturity and could be expected to continue rising. By September 30, 2025, however, the pattern had shifted. Although the overall level of rates was higher on September 30, 2025, the term structure showed a slight downward slope. These differences indicate two different economic states: one in which inflation was expected to increase (September 2022) and one in which it wasn't (September 2025). Calibrating the term structure of interest rates this way has highlighted Python's rich ecosystem of libraries and methods, and more importantly, shown us the language's utility for finance.

==== Summarizing key points <summarizing-key-points>

#tablex(columns: 1, header-rows: 1, repeat-header: true, ..tableStyle, ..columnStyle,
cellx(align: left, )[
],
cellx(align: left, )[
The present value function describes all bonds as a portfolio of zero-coupon bonds.
],
cellx(align: left, )[
Data was accessed directly from the Treasury as a CSV file and assigned to a Pandas Dataframe.
],
cellx(align: left, )[
The term structure of interest rates describes the behavior of spot and forward interest rates
],
cellx(align: left, )[
The term structure of interest rates was calculated with T-bills for September 2022.
],
cellx(align: left, )[
The term structure was graphed for September 15, 2022, and September 30, 2025.
],
cellx(align: left, )[
],
)