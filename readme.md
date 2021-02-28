# `tufte-style-article`

`tufte-style-article` is a LaTeX class with a design similar to Edward Tufte's works. His designs are known for their simplicty, legibleness, extensive use of sidenotes in a wide dedicated margin and tight text and graphic integration. This class is however not a rigourous copy of E.Tufte's works, it is more of an inspiration. It also includes design features from *The Elements of Typographic Style*.


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

`tufte-style-article` is now installed on your system ! will recognize
and find the class file without it having to be in your project folder.

## TeX Live users on Linux

1.  Create a `localtexmf` directory if you do not already
    have one, for instance

    ```
    $HOME/.texmf
    ```

    - Create a `tex/latex/` directory in the `.texmf` one, and inside it, create a folder named \inlinecode{latex}{tufte-style-article}.

2.   Paste the `tufte-style-article.cls` file in that
    `tufte-style-article` folder and you should be good.

    Eventually, the class file is located at:

    ```
    HOME/.texmf/tex/latex/tufte-style-article tufte-style-article.cls
    ```

3.  Update the `texmf` with
    ```
    mktexlsr $HOME/.texmf
    ```

4.  Check if it worked with

    ```
    kpsewhich tufte-style-article.cls
    ```

`tufte-style-article` is now installed on your system ! TeX Live will
recognize and find the class file without it having to be in your
project folder.


# Usage

Please see the documentation fore more in-depth explanations and examples. This section gives a quick overview on how to produce a simple document.


### Preamble

Call the class with the following :
```
\documentclass[options]{tufte-style-article}
```

The options are the following :

| Option            | What it does      |
|---                |---                |
|`raggedright`      | Makes all paragraphs align on the left        without right-justification, as it is the case in the documentation. |
|`parskip`          | Separates paragraphs with a vertical space instead of indenting so that all text is rigorously left-aligned. |
| `noheaders`       | Deletes the current section reminder on page header, just displays the page number on the top outer corner. |
| `casual`          | Makes all sections numberless. Puts them natively in the toc anyway. |
| `sans`            | Turns the font to sans serif Source Sans Pro, for extreme casualness. |
| `colorful`        | Like in this document, makes titles, figure labels and note numbers colored. The accent color is defined by `main_accent`. |
| `notufte`         | Remove margins. Turns sidenotes to footnotes and makes figure captions appear under them. Appropried for small casual reports or for `pandoc` conversion. |


### Main document

All native LaTeX commands work with this class. However, it adds some more to spice up the document.

#### Margin notes

`\marginnote{<your note>}` displays a numbered note in the margin.

`\margintext{<your note>}` displays unnumbered text in the margin.

#### Figure shortcuts

`\textfig[<optional with>]{<image path>}{<caption>}{<label>}` creates a figure with the cpation in the margin.

`\marginfig{<image path>}{<caption>}{<label>}` creates a figure completely in the margin.

`\widefig[<optional with>]{<image path>}{<caption>}{<label>}` creates a figure that completely spreads in the margin.

