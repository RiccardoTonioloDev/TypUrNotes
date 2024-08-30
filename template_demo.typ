#import "tun_template/tun.typ": *
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

= Chapter
== Sub chapter

#lorem(256)

Use of the @ft and the @st.

Citing @ImportantPaper.

#not_break([
Sum of a list in python:
```python
l = [1,2,3,4]
sum = 0
for n in l:
  sum += n
print(f"The sum is: {sum}")
```
])

= Another chapter
#lorem(256)

Using the @tt.

Citing both @MentionedBook and @IncredibleArticle.
