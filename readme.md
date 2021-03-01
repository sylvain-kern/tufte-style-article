# `tufte-style-article`

`tufte-style-article` is a LaTeX class with a design similar to Edward Tufte's works. His designs are known for their simplicty, legibleness, extensive use of sidenotes in a wide dedicated margin and tight text and graphic integration. This class is however not a rigourous copy of E.Tufte's works, it is more of an inspiration. It also includes design features from Robert Bringhurst's *Elements of Typographic Style*.

The overall look and features of this class can be seen in `documentation.pdf`, with more in-depth explanation. `tufte-style-article` is meant to be adaptive: one can typeset small casual papers, or more fancy and hefty documents.


# Installation

This class' source file is `tufte-style-article.cls`, avaliable on the
following repository:

[www.github.com/sylvain-kern/tufte-style-article](www.github.com/sylvain-kern/tufte-style-article)

The file can just be put in the same folder as your main `.tex` file.
Overleaf users will have to do this, since it does not support custom
class installation. For Windows or Linux users with an installed LaTeX
distribution, please see respectively the two following sections, on how
to install `tufte-style-article` on your system.

In order to make the code environments and syntax highlighting work, it
is needed to have Python installed on your system, along with the
`pygments` package. With `pip` simply execute

```
pip install pygments
```

##  MikTeX users on Windows

1.  Create a `localtexmf` directory if you do not already have one,
    for instance
    ```
    C:\Users\<you>\localtexmf
    ```

2.  Create a `tex\latex\` directory in the
    `localtexmf` one, and inside it, create a folder named `tufte-style-article`.

3.  Paste the `tufte-style-article.cls` file in that `tufte-style-article`
    folder and you should be good. Eventually, the class file is located at
    ```
    C:\Users\<you>\localtexmf\tex\latex\tufte-style-article\tufte-style-article.cls
    ```

4.  Open MikTeX console, go to `Settings`,
    `Directories` tab. Click on `add`, and enter yout `texmf` path.
    ```
    C:\Users\<you>\localtexmf
    ```

5.  Finally, go to the `tasks` tab, and hit
    `Refresh file name database`.

`tufte-style-article` is now installed on your system ! MikTeX will recognize
and find the class file without it having to be in your project folder.

## TeX Live users on Linux

1.  Create a `localtexmf` directory if you do not already
    have one, for instance

    ```
    $HOME/.texmf
    ```

2.   Create a `tex/latex/` directory in the `.texmf` one,
    and inside it, create a folder named `tufte-style-article`.


3. Paste the `tufte-style-article.cls` file in that
    `tufte-style-article` folder and you should be good.
    Eventually, the class file is located at:

    ```
    HOME/.texmf/tex/latex/tufte-style-article tufte-style-article.cls
    ```

4.  Update the `texmf` with
    ```
    mktexlsr $HOME/.texmf
    ```

5.  Check if it worked with

    ```
    kpsewhich tufte-style-article.cls
    ```

`tufte-style-article` is now installed on your system ! TeX Live will
recognize and find the class file without it having to be in your
project folder.


# Usage

I provide the template `minimal.tex`, to quickly get started.

Please see the documentation for more in-depth explanations and examples. This section gives a quick overview on how to produce a simple document.


## Preamble

Call the class with the following:
```
\documentclass[options]{tufte-style-article}
```

The options are listed and explained below:

| Option            | What it does      |
|---                |---                |
|`raggedright`      | Makes all paragraphs align on the left        without right-justification, as it is the case in the documentation. |
|`parskip`          | Separates paragraphs with a vertical space instead of indenting so that all text is rigorously left-aligned. |
| `noheaders`       | Deletes the current section reminder on page header, just displays the page number on the top outer corner. |
| `casual`          | Makes all sections numberless. Puts them natively in the toc anyway. |
| `sans`            | Turns the font to sans serif Source Sans Pro, for extreme casualness. |
| `colorful`        | Like in the documentation, makes titles, figure labels and note numbers colored. The accent color is defined by `main_accent`. |
| `notufte`         | Remove margins. Turns sidenotes to footnotes and makes figure captions appear under them. Appropried for small casual reports or for `pandoc` conversion. |


## Main document

All native LaTeX commands work with this class. However, some new macros are added to spice up the document.


### Margin notes

`\marginnote{<your note>}` displays a numbered note in the margin.

`\margintext{<your note>}` displays unnumbered text in the margin.


### Figure shortcuts

`\textfig[<optional with>]{<image path>}{<caption>}{<label>}` creates a figure with the caption in the margin. Optional width is relative to `\textwidth`: 1 will make the figure as wide as the text.

`\marginfig{<image path>}{<caption>}{<label>}` creates a figure completely in the margin.

`\widefig[<optional with>]{<image path>}{<caption>}{<label>}` creates a figure that completely spreads in the margin.


## Compilation

This class compiles with `pdflatex`. It needs to be called with the `--shell-escape` flag, as shown below:

```
pdflatex --shell-escape document.tex
```


# Contribute

I am always open to improvements, so feel free to fork the repository to change things. I am relatively new to LaTeX, so I am eager to put the class to higher standards.


# Known issues

In this section I gather the issues that have popped and been reported. I will try to fix them as best as I can. If you spot a malfunction of any kind in this class or you just have a question about all this, feel free to send me an email at:

sylvain.kern98@gmail.com.

-   When used, `colorful`, `sans`, and `notufte` are considered
    unused. It generates the following warning :
    ```
    Unused global option(s) : colorful.
    ```

-   Bad page breaks can still occur for `\textfig{}`, `\widefig`,
    and code snippet environments.

-   Marginpar systematically generates the following warnings:
    ```
    Marginpar on page 1 moved.
    ```

-   I have to work on overfull \hboxes.