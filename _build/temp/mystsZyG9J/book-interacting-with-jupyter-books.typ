/* Written by MyST v1.8.3 */

#import "myst-imports.typ": *

== Interacting With Jupyter Books

=== Working with Jupyter Books <working-with-jupyter-books>

This and other chapters of _Basic Concepts of Fixed Income_, contain two types of documents:

+ #strong[Markdown documents (_.md_):]

  - What you are currently reading.
  - Contain no executable code.
  - Can be downloaded as a Markdown file (_.md_) or a PDF file (_.pdf_).
+ #strong[Notebook documents (_.ipynb_):]

  - HTML Representations of Jupyter notebooks.
  - Can be downloaded as a notebook (_.ipynb_) or a PDF file (_.pdf_).
  - Have interactive capabilities.
  - A notebook can be run inside the HTML file or in binder with Jupyter Lab.

Notebook Launch Options

There are three interactive options for notebook documents:

#tablex(columns: 4, header-rows: 1, repeat-header: true, ..tableStyle, ..columnStyle,
[
Option
],
[
Description
],
[
Interactive Features
],
[
Note
],
[
*Binder*
],
[
Launches in a new browser tab (typically within a minute) and runs remotely. Supports up to 100 simultaneous users.
],
[
Execute existing cells, add or modify cells, and download the notebook.
],
[
The notebook will not be saved or available if saved in this mode.
],
[
*Colab*
],
[
Offers the quickest and easiest access, not requiring Binder. A Google Drive is unnecessary for launching.
],
[
Execute cells or make a copy.
],
[
You must sign in to a Google account to execute cells or make a copy. You can download the notebook without signing into a Google account.
],
[
*Live Code*
],
[
Requires a Binder launch and is ideal for demonstrations.
],
[
Run code in existing cells, and alter code in existing cells.
],
[
You cannot add cells or save results in this mode.
],
)
#strong[The start button ⏻ in a notebook page allows you to execute the code live inside the HTML page.]

*The first cell in each notebook includes options to open in Colab or with Jupyter Lab in Binder.*

Additional Interactive Feature

*Copying code:* Any code cell or code block can be copied to the clipboard by moving the cursor to its upper-right corner.

Summary

Jupyter books effectively combine Markdown and notebooks to highlight financial concepts with real-world applications.