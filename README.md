# TypUrNotes
A Typst template for both effective and aesthetic note taking.

# Installation
To use the template you just have to install the fonts you can find inside of `tun_template/fonts/`.
After you installed the fonts, just download the `tun_template` folder, move it into your project folder, and follow the _Usage_ instructions.

# Usage
You can find a `template_demo.typ` file, that uses all the implemented features.
TLDR: you just have to `#import "tun_template/tun.typ": *` at the beginning of your document, and after that you have to set the configurations of the template like what's below.

_Setting configurations:_
```typst
#show: config.with(
  myAuthor: "Riccardo Toniolo",
  myTitle: "Template creation in Typst",
  myLang: "en",
  pages_numbering: "1",
  creation_day: "01",
  creation_month: "01",
  creation_year: "1970",
  associated_with: "University Typography Course",
  use_glossary: true,
  use_bibliography: true,
  digital: true,
)
```
Explanation of the settings:
- `myAuthor`: sets the author name of the document;
- `myTitle`: sets the title of the document;
- `myLang`: sets the language of the document;
- `pages_numbering`: sets the style of the numbering used in the footer of pages;
- `creation_day`: sets the day of creation of the document;
- `creation_month`: sets the month of creation of the document;
- `creation_year`: sets the year of creation of the document;
- `associated_with`: sets the article, conference, lecture, context that the document is associated with;
- `use_glossary`: if true, adds the glossary page;
  - The package `glossarium` was used to create the glossary page, that you can set in `tun_template/appendix/glossary.typ` (see the documentation of `glossarium` [here](https://typst.app/universe/package/glossarium/)).
- `use_bibliography`: if true, adds the bibliograpy page;
  - You can modify the bibliography sources directly interacting with `tun_template/appendix/bibliography.yml` (see how to manage it [here](https://typst.app/docs/reference/model/bibliography/)).
- `digital`: if true uses less eye straining colors for a better digital reading experience. To print the document it's highly suggested to set this parameter to false, in order to have a white background and save ink.
